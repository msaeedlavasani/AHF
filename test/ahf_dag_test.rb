# frozen_string_literal: true

require "digest"
require "fileutils"
require "minitest/autorun"
require "open3"
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

  def task(id, priority: 1, requires: [], depends_on: [], produces: [], attempts: [], publication: nil)
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
      "attempts" => attempts,
      "publication" => publication || {
        "mode" => "REQUIRED",
        "remote" => "origin",
        "branch" => "main",
        "evidence_path" => ".dag/publications/#{id}.yaml"
      }
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

    historical = { "mode" => "HISTORICAL_PRE_RULE" }
    with_repository do |root, _engine|
      run_git(root, "init")
      run_git(root, "config", "user.name", "AHF DAG Test")
      run_git(root, "config", "user.email", "dag-test@example.invalid")
      run_git(root, "add", ".dag", "evidence.txt")
      run_git(root, "commit", "-m", "historical evidence")
      commit = git_output(root, "rev-parse", "HEAD").strip
      attempt = passed_attempt.merge("recorded_commit" => commit)
      completed_task = task("AHF-CLEAN-FOUNDATION-002", attempts: [attempt], publication: historical)
      write_manifest(root, "tasks.yaml", "tasks", [completed_task])
      run_git(root, "add", ".dag/tasks.yaml")
      run_git(root, "commit", "-m", "record historical completion")
      engine = AhfDag::Engine.new(AhfDag::Repository.new(root))
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

  def test_required_remote_publication_controls_done
    Dir.mktmpdir("ahf-dag-remote") do |remote_parent|
      remote = File.join(remote_parent, "origin.git")
      run_git(remote_parent, "init", "--bare", remote)

      publication = {
        "mode" => "REQUIRED",
        "remote" => "origin",
        "branch" => "main",
        "evidence_path" => ".dag/publications/T.yaml"
      }
      completed_task = task("T", attempts: [passed_attempt]).merge("publication" => publication)

      with_repository(tasks: [completed_task]) do |root, _engine|
        run_git(root, "init")
        run_git(root, "config", "user.name", "AHF DAG Test")
        run_git(root, "config", "user.email", "dag-test@example.invalid")
        run_git(root, "remote", "add", "origin", remote)
        run_git(root, "add", ".dag", "evidence.txt")
        run_git(root, "commit", "-m", "base history")
        run_git(root, "push", "origin", "HEAD:refs/heads/main")

        FileUtils.mkdir_p(File.join(root, ".dag", "publications"))
        File.write(
          File.join(root, ".dag", "publications", "T.yaml"),
          YAML.dump("schema_version" => 0, "task_id" => "T", "remote" => "origin", "branch" => "main")
        )
        run_git(root, "add", ".dag/publications/T.yaml")
        run_git(root, "commit", "-m", "test publication")

        unpublished_engine = AhfDag::Engine.new(AhfDag::Repository.new(root))
        assert_equal "FAILED", unpublished_engine.status.first.state
        assert_includes unpublished_engine.status.first.reasons.map(&:code), "PUBLICATION_NOT_VERIFIED"
        assert_equal "NO_READY_TASK", unpublished_engine.next_result["result"]

        run_git(root, "push", "origin", "HEAD:refs/heads/main")
        published_engine = AhfDag::Engine.new(AhfDag::Repository.new(root))
        assert_equal "DONE", published_engine.status.first.state
      end
    end
  end

  def test_remote_publication_divergence_stops_for_review
    Dir.mktmpdir("ahf-dag-divergence") do |remote_parent|
      remote = File.join(remote_parent, "origin.git")
      seed = File.join(remote_parent, "seed")
      run_git(remote_parent, "init", "--bare", remote)
      FileUtils.mkdir_p(seed)
      run_git(seed, "init")
      run_git(seed, "config", "user.name", "AHF DAG Test")
      run_git(seed, "config", "user.email", "dag-test@example.invalid")
      File.write(File.join(seed, "remote.txt"), "remote history\n")
      run_git(seed, "add", "remote.txt")
      run_git(seed, "commit", "-m", "remote history")
      run_git(seed, "push", remote, "HEAD:refs/heads/main")

      publication = {
        "mode" => "REQUIRED",
        "remote" => "origin",
        "branch" => "main",
        "evidence_path" => ".dag/publications/T.yaml"
      }
      completed_task = task("T", attempts: [passed_attempt], publication: publication)

      with_repository(tasks: [completed_task]) do |root, _engine|
        FileUtils.mkdir_p(File.join(root, ".dag", "publications"))
        File.write(
          File.join(root, ".dag", "publications", "T.yaml"),
          YAML.dump("schema_version" => 0, "task_id" => "T", "remote" => "origin", "branch" => "main")
        )
        run_git(root, "init")
        run_git(root, "config", "user.name", "AHF DAG Test")
        run_git(root, "config", "user.email", "dag-test@example.invalid")
        run_git(root, "remote", "add", "origin", remote)
        run_git(root, "add", ".dag", "evidence.txt")
        run_git(root, "commit", "-m", "local divergent history")

        engine = AhfDag::Engine.new(AhfDag::Repository.new(root))
        assert_equal "FAILED", engine.status.first.state
        assert_includes engine.status.first.reasons.map(&:code), "PUBLICATION_DIVERGENCE"
        assert_equal "STOP_FOR_REVIEW", engine.next_result["result"]
      end
    end
  end

  def test_post_rule_task_cannot_claim_historical_publication_exemption
    future_task = task("FUTURE", publication: { "mode" => "HISTORICAL_PRE_RULE" })
    with_repository(tasks: [future_task]) do |_root, engine|
      refute engine.validator.valid?
      assert engine.validator.errors.any? { |error| error.include?("not eligible for historical publication exemption") }
    end
  end

  private

  def write_manifest(root, filename, key, entries)
    document = { "schema_version" => 0, key => entries }
    File.write(File.join(root, ".dag", filename), YAML.dump(document))
  end


  def run_git(directory, *arguments)
    _stdout, stderr, status = Open3.capture3("git", *arguments, chdir: directory)
    assert status.success?, "git #{arguments.join(" ")} failed: #{stderr}"
  end

  def git_output(directory, *arguments)
    stdout, stderr, status = Open3.capture3("git", *arguments, chdir: directory)
    assert status.success?, "git #{arguments.join(" ")} failed: #{stderr}"
    stdout
  end
end
