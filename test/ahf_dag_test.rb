# frozen_string_literal: true

require "digest"
require "fileutils"
require "minitest/autorun"
require "tmpdir"
require "yaml"

require_relative "../lib/ahf_dag"

class AhfDagTest < Minitest::Test
  def with_repository(decisions: [], artifacts: [], tasks: [])
    Dir.mktmpdir("ahf-dag-test") do |root|
      FileUtils.mkdir_p(File.join(root, ".dag"))
      File.write(File.join(root, "evidence.txt"), "ok\n")
      write_manifest(root, "decisions.yaml", "decisions", decisions)
      write_manifest(root, "artifacts.yaml", "artifacts", artifacts)
      write_manifest(root, "tasks.yaml", "tasks", tasks)
      yield root, AhfDag::Engine.new(AhfDag::Repository.new(root))
    end
  end

  def decision(id, state = "RESOLVED")
    { "id" => id, "title" => id, "state" => state }
  end

  def artifact(id, state = "AVAILABLE", path = "evidence.txt")
    { "id" => id, "title" => id, "state" => state, "path" => path }
  end

  def task(id, priority: 1, requires: [], depends_on: [], produces: [], attempts: [])
    {
      "id" => id,
      "title" => id,
      "purpose" => "Test the resolved contract.",
      "priority" => priority,
      "requires" => requires,
      "depends_on" => depends_on,
      "produces" => produces,
      "acceptance_criteria" => [
        { "id" => "content", "check" => { "type" => "file_contains", "path" => "evidence.txt", "text" => "ok" } }
      ],
      "required_evidence" => [
        { "id" => "proof", "path" => "evidence.txt", "sha256" => Digest::SHA256.hexdigest("ok\n") }
      ],
      "validations" => [
        { "id" => "file", "check" => { "type" => "file_exists", "path" => "evidence.txt" } }
      ],
      "attempts" => attempts
    }
  end

  def passed_attempt(produced = [])
    {
      "id" => "attempt-1",
      "outcome" => "PASSED",
      "evidence" => ["proof"],
      "validations" => ["file"],
      "produced" => produced
    }
  end

  def test_satisfied_dependencies_are_ready
    tasks = [task("READY-TASK", requires: [{ "type" => "DECISION", "id" => "D" }, { "type" => "ARTIFACT", "id" => "A" }])]
    with_repository(decisions: [decision("D")], artifacts: [artifact("A")], tasks: tasks) do |_root, engine|
      assert engine.validator.valid?, engine.validator.errors.join("\n")
      assert_equal "READY", engine.status.first.state
    end
  end

  def test_unresolved_required_decision_blocks_task
    tasks = [task("BLOCKED-TASK", requires: [{ "type" => "DECISION", "id" => "D" }])]
    with_repository(decisions: [decision("D", "UNRESOLVED")], tasks: tasks) do |_root, engine|
      assert_equal "BLOCKED", engine.status.first.state
      assert_equal ["DECISION_UNRESOLVED"], engine.status.first.reasons.map(&:code)
    end
  end

  def test_missing_artifact_blocks_task
    tasks = [task("BLOCKED-TASK", requires: [{ "type" => "ARTIFACT", "id" => "A" }])]
    with_repository(artifacts: [artifact("A", "MISSING", "future.txt")], tasks: tasks) do |_root, engine|
      assert_equal "BLOCKED", engine.status.first.state
      assert_equal ["ARTIFACT_MISSING"], engine.status.first.reasons.map(&:code)
    end
  end

  def test_unfinished_prerequisite_task_blocks_dependent_task
    tasks = [task("FIRST"), task("SECOND", depends_on: ["FIRST"])]
    with_repository(tasks: tasks) do |_root, engine|
      states = engine.status.each_with_object({}) { |status, memo| memo[status.id] = status.state }
      assert_equal "READY", states["FIRST"]
      assert_equal "BLOCKED", states["SECOND"]
    end
  end

  def test_evidence_and_validation_requirements_control_done
    incomplete = passed_attempt.merge("evidence" => [], "validations" => [])
    with_repository(tasks: [task("T", attempts: [incomplete])]) do |_root, engine|
      assert_equal "FAILED", engine.status.first.state
      assert_includes engine.status.first.reasons.map(&:code), "EVIDENCE_MISSING"
      assert_includes engine.status.first.reasons.map(&:code), "VALIDATION_MISSING"
    end

    with_repository(tasks: [task("T", attempts: [passed_attempt])]) do |_root, engine|
      assert_equal "DONE", engine.status.first.state
    end
  end

  def test_highest_priority_ready_task_wins
    tasks = [task("LOW", priority: 1), task("HIGH", priority: 10)]
    with_repository(tasks: tasks) do |_root, engine|
      assert_equal "HIGH", engine.next_result["task"]
    end
  end

  def test_equal_priority_uses_task_id_tie_break
    tasks = [task("TASK-B", priority: 5), task("TASK-A", priority: 5)]
    with_repository(tasks: tasks) do |_root, engine|
      assert_equal "TASK-A", engine.next_result["task"]
    end
  end

  def test_cycle_is_rejected
    tasks = [task("A", depends_on: ["B"]), task("B", depends_on: ["A"])]
    with_repository(tasks: tasks) do |_root, engine|
      refute engine.validator.valid?
      assert engine.validator.errors.any? { |error| error.include?("cycle") }
    end
  end

  def test_missing_node_reference_is_rejected
    tasks = [task("T", requires: [{ "type" => "DECISION", "id" => "MISSING" }])]
    with_repository(tasks: tasks) do |_root, engine|
      refute engine.validator.valid?
      assert engine.validator.errors.any? { |error| error.include?("references missing DECISION MISSING") }
    end
  end

  def test_unresolved_decision_is_never_automatically_resolved
    tasks = [task("T", requires: [{ "type" => "DECISION", "id" => "D" }])]
    with_repository(decisions: [decision("D", "UNRESOLVED")], tasks: tasks) do |root, engine|
      before = File.read(File.join(root, ".dag", "decisions.yaml"))
      assert_equal "OWNER_DECISION_REQUIRED", engine.next_result["result"]
      assert_equal before, File.read(File.join(root, ".dag", "decisions.yaml"))
      assert_equal "UNRESOLVED", engine.repository.decision_index["D"]["state"]
    end
  end

  def test_no_ready_work_due_to_unresolved_decision_requires_owner
    tasks = [task("T", requires: [{ "type" => "DECISION", "id" => "D" }])]
    with_repository(decisions: [decision("D", "UNRESOLVED")], tasks: tasks) do |_root, engine|
      result = engine.next_result
      assert_equal "OWNER_DECISION_REQUIRED", result["result"]
      assert_equal ["required Decision D is UNRESOLVED"], result["reasons"]
    end
  end

  def test_contract_conflict_stops_for_review
    tasks = [task("T", depends_on: ["UNKNOWN"])]
    with_repository(tasks: tasks) do |_root, engine|
      result = engine.next_result
      assert_equal "STOP_FOR_REVIEW", result["result"]
      assert result["errors"].any? { |error| error.include?("missing TASK UNKNOWN") }
    end
  end

  private

  def write_manifest(root, filename, key, entries)
    document = { "schema_version" => 0, key => entries }
    File.write(File.join(root, ".dag", filename), YAML.dump(document))
  end
end
