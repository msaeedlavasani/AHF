# frozen_string_literal: true

require "minitest/autorun"
require "yaml"

class FoundationCompletenessDagTest < Minitest::Test
  ROOT = File.expand_path("..", __dir__)
  REVIEW_BRANCHES = %w[
    FOUNDATION-GOVERNANCE-AND-AGENT-CONTRACT
    FOUNDATION-PRODUCT-AND-DOMAIN-REVALIDATION
    FOUNDATION-HISTORICAL-FAILURE-AND-EVIDENCE-MODEL
  ].freeze
  RESOLUTION_TASKS = %w[
    FOUNDATION-RESOLVE-IDENTITY-AND-PERSISTENCE-BOUNDARIES
    FOUNDATION-RESOLVE-EXECUTION-OUTCOME-AND-RECOVERY-CONTRACTS
    FOUNDATION-RESOLVE-PRIVACY-SENSING-AND-ACCOUNT-LIFECYCLE
    FOUNDATION-RESOLVE-UX-DESIGN-LOCALIZATION-ACCESSIBILITY-PERFORMANCE
    FOUNDATION-RESOLVE-ARCHITECTURE-OPERATIONS-AND-TOOLING-BOUNDARIES
  ].freeze

  def setup
    @tasks = manifest("tasks.yaml", "tasks").to_h { |task| [task.fetch("id"), task] }
    @decisions = manifest("decisions.yaml", "decisions").to_h { |decision| [decision.fetch("id"), decision] }
    @artifacts = manifest("artifacts.yaml", "artifacts").to_h { |artifact| [artifact.fetch("id"), artifact] }
  end

  def test_corrected_sequence_starts_after_maintenance
    assert_equal ["AHF-DAG-MAINT-003"], task("FOUNDATION-AUDIT-REVIEW").fetch("depends_on")
    assert_equal ["FOUNDATION-AUDIT-REVIEW"], task("FOUNDATION-LKI-COMPLETENESS").fetch("depends_on")

    REVIEW_BRANCHES.each do |task_id|
      assert_equal ["FOUNDATION-LKI-COMPLETENESS"], task(task_id).fetch("depends_on")
    end
  end

  def test_completeness_produces_coverage_ledger_reconciliation_and_verification
    produced_ids = task("FOUNDATION-LKI-COMPLETENESS").fetch("produces").map { |node| node.fetch("id") }
    assert_includes produced_ids, "LEGACY_REPOSITORY_COVERAGE@v0"
    assert_includes produced_ids, "CAPABILITY_DISPOSITION_LEDGER@v0"
    assert_includes produced_ids, "LKI_RECONCILIATION@v0"
    assert_includes produced_ids, "AUDIT_LIMITATIONS_VERIFICATION@v0"
    assert_includes produced_ids, "FOUNDATION_COMPLETENESS_VALIDATOR@v0"
  end

  def test_resolution_tasks_wait_for_all_reviews_and_owner_gates
    RESOLUTION_TASKS.each do |task_id|
      assert_equal REVIEW_BRANCHES.sort, task(task_id).fetch("depends_on").sort
      required_decisions = task(task_id).fetch("requires")
        .select { |node| node.fetch("type") == "DECISION" }
        .map { |node| node.fetch("id") }
      assert required_decisions.any? { |id| id.start_with?("OWNER_GATE_") }, "#{task_id} lacks an Owner gate"
    end

    identity_inputs = task("FOUNDATION-RESOLVE-IDENTITY-AND-PERSISTENCE-BOUNDARIES").fetch("requires")
      .map { |node| node.fetch("id") }
    assert_includes identity_inputs, "IDENTITY_MODEL_CANDIDATE@v0"
  end

  def test_owner_gates_are_unresolved_and_future_decisions_are_draft
    owner_gates = @decisions.values.select { |decision| decision.fetch("id").start_with?("OWNER_GATE_") }
    assert_equal 5, owner_gates.length
    assert owner_gates.all? { |decision| decision.fetch("state") == "UNRESOLVED" }

    RESOLUTION_TASKS.each do |task_id|
      decision_outputs = task(task_id).fetch("produces").select { |node| node.fetch("type") == "DECISION" }
      assert_equal 1, decision_outputs.length
      assert_equal "DRAFT", @decisions.fetch(decision_outputs.first.fetch("id")).fetch("state")
    end

    assert_equal "DRAFT", @decisions.fetch("CLEAN_START_FOUNDATION_BASELINE@v0").fetch("state")
  end

  def test_baseline_waits_for_every_resolution_and_no_implementation_task_is_seeded
    assert_equal RESOLUTION_TASKS.sort, task("FOUNDATION-BASELINE-REVIEW").fetch("depends_on").sort
    refute @tasks.keys.any? { |id| id.start_with?("IMPLEMENTATION-") }
  end

  def test_identity_candidate_remains_draft_evidence
    artifact = @artifacts.fetch("IDENTITY_MODEL_CANDIDATE@v0")
    assert_equal "AVAILABLE", artifact.fetch("state")
    content = File.read(File.join(ROOT, artifact.fetch("path")))
    assert_includes content, "Status: DRAFT"
    refute @decisions.key?("IDENTITY_MODEL_CANDIDATE@v0")
  end

  def test_all_new_work_requires_remote_publication
    new_task_ids = [
      "AHF-DAG-MAINT-003",
      "FOUNDATION-AUDIT-REVIEW",
      "FOUNDATION-LKI-COMPLETENESS",
      *REVIEW_BRANCHES,
      *RESOLUTION_TASKS,
      "FOUNDATION-BASELINE-REVIEW"
    ]

    new_task_ids.each do |task_id|
      assert_equal "REQUIRED", task(task_id).dig("publication", "mode")
      assert_equal "origin", task(task_id).dig("publication", "remote")
      assert_equal "main", task(task_id).dig("publication", "branch")
    end
  end

  def test_new_foundation_work_has_not_been_executed
    future_task_ids = [
      "FOUNDATION-AUDIT-REVIEW",
      "FOUNDATION-LKI-COMPLETENESS",
      *REVIEW_BRANCHES,
      *RESOLUTION_TASKS,
      "FOUNDATION-BASELINE-REVIEW"
    ]

    future_task_ids.each do |task_id|
      assert_empty task(task_id).fetch("attempts"), "#{task_id} must remain unexecuted"
    end
  end

  private

  def manifest(filename, key)
    document = YAML.safe_load(
      File.read(File.join(ROOT, ".dag", filename)),
      permitted_classes: [],
      permitted_symbols: [],
      aliases: false
    )
    document.fetch(key)
  end

  def task(id)
    @tasks.fetch(id)
  end
end
