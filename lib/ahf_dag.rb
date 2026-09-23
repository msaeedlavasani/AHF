# frozen_string_literal: true

require "digest"
require "open3"
require "pathname"
require "yaml"

module AhfDag
  DECISION_STATES = %w[DRAFT RESOLVED SUPERSEDED UNRESOLVED].freeze
  ARTIFACT_STATES = %w[MISSING AVAILABLE INVALID].freeze
  ATTEMPT_OUTCOMES = %w[IN_PROGRESS FAILED PASSED].freeze
  REQUIRE_TYPES = %w[DECISION ARTIFACT].freeze
  PRODUCE_TYPES = %w[DECISION ARTIFACT].freeze
  CHECK_TYPES = %w[file_exists file_executable file_contains command_succeeds].freeze
  PUBLICATION_MODES = %w[HISTORICAL_PRE_RULE REQUIRED].freeze
  HISTORICAL_PUBLICATION_TASKS = %w[
    AHF-CLEAN-FOUNDATION-002
    FOUNDATION-003-LEGACY-KNOWLEDGE-INDEX
  ].freeze

  Reason = Struct.new(:code, :message)
  TaskStatus = Struct.new(:id, :title, :priority, :state, :reasons)

  class Repository
    attr_reader :root, :decisions, :artifacts, :tasks, :load_errors

    def initialize(root)
      @root = File.expand_path(root)
      @load_errors = []
      @decisions = load_collection("decisions.yaml", "decisions")
      @artifacts = load_collection("artifacts.yaml", "artifacts")
      @tasks = load_collection("tasks.yaml", "tasks")
    end

    def decision_index
      @decision_index ||= index_by_id(decisions)
    end

    def artifact_index
      @artifact_index ||= index_by_id(artifacts)
    end

    def task_index
      @task_index ||= index_by_id(tasks)
    end

    def resolve_path(path)
      File.expand_path(path, root)
    end

    private

    def load_collection(filename, key)
      path = File.join(root, ".dag", filename)
      document = YAML.safe_load(File.read(path), permitted_classes: [], permitted_symbols: [], aliases: false)
      unless document.is_a?(Hash)
        load_errors << "#{filename}: document root must be a mapping"
        return []
      end
      load_errors << "#{filename}: schema_version must be 0" unless document["schema_version"] == 0
      collection = document[key]
      unless collection.is_a?(Array)
        load_errors << "#{filename}: #{key} must be a sequence"
        return []
      end
      collection
    rescue Errno::ENOENT
      load_errors << "#{filename}: manifest is missing"
      []
    rescue Psych::Exception => e
      load_errors << "#{filename}: invalid YAML (#{e.message.lines.first.strip})"
      []
    end

    def index_by_id(collection)
      collection.each_with_object({}) do |node, index|
        index[node["id"]] = node if node.is_a?(Hash) && node["id"].is_a?(String)
      end
    end
  end

  class Validator
    DECISION_KEYS = %w[id title state superseded_by].freeze
    ARTIFACT_KEYS = %w[id title state path invalidated_by].freeze
    TASK_KEYS = %w[id title purpose priority requires depends_on produces acceptance_criteria required_evidence validations attempts publication].freeze

    attr_reader :repository

    def initialize(repository)
      @repository = repository
    end

    def errors
      return @errors if defined?(@errors)

      @errors = repository.load_errors.dup
      validate_decisions
      validate_artifacts
      validate_tasks
      validate_global_ids
      validate_cycles
      @errors.sort
    end

    def valid?
      errors.empty?
    end

    private

    def validate_decisions
      validate_node_collection(repository.decisions, "decision", DECISION_KEYS) do |decision|
        id = decision["id"]
        state = decision["state"]
        add("decision #{id}: invalid state #{state.inspect}") unless DECISION_STATES.include?(state)

        replacement = decision["superseded_by"]
        if state == "SUPERSEDED"
          add("decision #{id}: SUPERSEDED requires superseded_by") unless replacement.is_a?(String) && !replacement.empty?
        elsif replacement
          add("decision #{id}: superseded_by is only allowed for SUPERSEDED decisions")
        end
      end

      repository.decisions.each do |decision|
        next unless decision.is_a?(Hash) && decision["superseded_by"].is_a?(String)
        next if repository.decision_index.key?(decision["superseded_by"])

        add("decision #{decision["id"]}: missing superseded_by decision #{decision["superseded_by"]}")
      end
    end

    def validate_artifacts
      validate_node_collection(repository.artifacts, "artifact", ARTIFACT_KEYS) do |artifact|
        id = artifact["id"]
        state = artifact["state"]
        add("artifact #{id}: invalid state #{state.inspect}") unless ARTIFACT_STATES.include?(state)
        validate_relative_path(artifact["path"], "artifact #{id}: path")

        invalidated_by = artifact["invalidated_by"]
        if state == "INVALID"
          unless string_array?(invalidated_by) && !invalidated_by.empty?
            add("artifact #{id}: INVALID requires invalidated_by decision IDs")
          end
        elsif invalidated_by
          add("artifact #{id}: invalidated_by is only allowed for INVALID artifacts")
        end
      end

      repository.artifacts.each do |artifact|
        next unless artifact.is_a?(Hash) && artifact["invalidated_by"].is_a?(Array)
        artifact["invalidated_by"].each do |decision_id|
          add("artifact #{artifact["id"]}: missing invalidating decision #{decision_id}") unless repository.decision_index.key?(decision_id)
        end
      end
    end

    def validate_tasks
      validate_node_collection(repository.tasks, "task", TASK_KEYS) do |task|
        id = task["id"]
        add("task #{id}: state must be derived, not stored") if task.key?("state")
        add("task #{id}: purpose must be a non-empty string") unless non_empty_string?(task["purpose"])
        add("task #{id}: priority must be an integer") unless task["priority"].is_a?(Integer)

        validate_relationships(task, "requires", REQUIRE_TYPES)
        validate_task_dependencies(task)
        validate_relationships(task, "produces", PRODUCE_TYPES)
        validate_checks(task, "acceptance_criteria")
        validate_evidence(task)
        validate_checks(task, "validations")
        validate_attempts(task)
        validate_publication(task)
      end
    end

    def validate_publication(task)
      publication = task["publication"]
      unless publication.is_a?(Hash)
        add("task #{task["id"]}: publication must be a mapping")
        return
      end

      mode = publication["mode"]
      unless PUBLICATION_MODES.include?(mode)
        add("task #{task["id"]}: publication mode must be one of #{PUBLICATION_MODES.join(", ")}")
        return
      end

      if mode == "HISTORICAL_PRE_RULE"
        add("task #{task["id"]}: historical publication mode may contain only mode") unless publication.keys == ["mode"]
        unless HISTORICAL_PUBLICATION_TASKS.include?(task["id"])
          add("task #{task["id"]}: is not eligible for historical publication exemption")
        end
        return
      end

      expected_keys = %w[branch evidence_path mode remote]
      add("task #{task["id"]}: REQUIRED publication must contain only #{expected_keys.join(", ")}") unless publication.keys.sort == expected_keys
      add("task #{task["id"]}: publication remote must be a non-empty string") unless non_empty_string?(publication["remote"])
      add("task #{task["id"]}: publication branch must be a non-empty string") unless non_empty_string?(publication["branch"])
      validate_relative_path(publication["evidence_path"], "task #{task["id"]}: publication evidence_path")
    end

    def validate_node_collection(collection, kind, allowed_keys)
      seen = {}
      collection.each_with_index do |node, index|
        unless node.is_a?(Hash)
          add("#{kind} at index #{index}: must be a mapping")
          next
        end

        id = node["id"]
        add("#{kind} at index #{index}: id must be a non-empty string") unless non_empty_string?(id)
        add("#{kind} #{id}: duplicate ID") if non_empty_string?(id) && seen[id]
        seen[id] = true if non_empty_string?(id)
        add("#{kind} #{id}: title must be a non-empty string") unless non_empty_string?(node["title"])
        unknown = node.keys - allowed_keys
        add("#{kind} #{id}: unknown fields #{unknown.sort.join(", ")}") unless unknown.empty?
        yield node
      end
    end

    def validate_relationships(task, field, allowed_types)
      relationships = task[field]
      unless relationships.is_a?(Array)
        add("task #{task["id"]}: #{field} must be a sequence")
        return
      end

      relationships.each_with_index do |relationship, index|
        label = "task #{task["id"]}: #{field}[#{index}]"
        unless relationship.is_a?(Hash) && relationship.keys.sort == %w[id type]
          add("#{label} must contain only type and id")
          next
        end
        type = relationship["type"]
        node_id = relationship["id"]
        add("#{label} has invalid node type #{type.inspect}") unless allowed_types.include?(type)
        add("#{label} id must be a non-empty string") unless non_empty_string?(node_id)
        next unless non_empty_string?(node_id)

        index_for_type = type == "DECISION" ? repository.decision_index : repository.artifact_index
        add("#{label} references missing #{type} #{node_id}") unless index_for_type.key?(node_id)
      end
    end

    def validate_task_dependencies(task)
      dependencies = task["depends_on"]
      unless string_array?(dependencies)
        add("task #{task["id"]}: depends_on must be a sequence of Task IDs")
        return
      end
      dependencies.each do |task_id|
        add("task #{task["id"]}: depends_on references missing TASK #{task_id}") unless repository.task_index.key?(task_id)
      end
    end

    def validate_checks(task, field)
      checks = task[field]
      unless checks.is_a?(Array) && !checks.empty?
        add("task #{task["id"]}: #{field} must be a non-empty sequence")
        return
      end
      validate_unique_ids(checks, "task #{task["id"]}: #{field}")
      checks.each_with_index do |entry, index|
        label = "task #{task["id"]}: #{field}[#{index}]"
        unless entry.is_a?(Hash) && non_empty_string?(entry["id"]) && entry["check"].is_a?(Hash)
          add("#{label} must contain an id and check")
          next
        end
        validate_check(entry["check"], label)
      end
    end

    def validate_check(check, label)
      type = check["type"]
      unless CHECK_TYPES.include?(type)
        add("#{label}: unsupported check type #{type.inspect}")
        return
      end

      case type
      when "file_exists", "file_executable"
        add("#{label}: check must contain only type and path") unless check.keys.sort == %w[path type]
        validate_relative_path(check["path"], "#{label}: path")
      when "file_contains"
        add("#{label}: check must contain only type, path, and text") unless check.keys.sort == %w[path text type]
        validate_relative_path(check["path"], "#{label}: path")
        add("#{label}: text must be a non-empty string") unless non_empty_string?(check["text"])
      when "command_succeeds"
        add("#{label}: check must contain only type and argv") unless check.keys.sort == %w[argv type]
        argv = check["argv"]
        add("#{label}: argv must be a non-empty sequence of strings") unless string_array?(argv) && !argv.empty?
      end
    end

    def validate_evidence(task)
      evidence = task["required_evidence"]
      unless evidence.is_a?(Array) && !evidence.empty?
        add("task #{task["id"]}: required_evidence must be a non-empty sequence")
        return
      end
      validate_unique_ids(evidence, "task #{task["id"]}: required_evidence")
      evidence.each_with_index do |entry, index|
        label = "task #{task["id"]}: required_evidence[#{index}]"
        unless entry.is_a?(Hash) && non_empty_string?(entry["id"])
          add("#{label} must contain an id")
          next
        end
        unknown = entry.keys - %w[id path sha256]
        add("#{label}: unknown fields #{unknown.sort.join(", ")}") unless unknown.empty?
        validate_relative_path(entry["path"], "#{label}: path")
        digest = entry["sha256"]
        add("#{label}: sha256 must be 64 lowercase hexadecimal characters") if digest && digest !~ /\A[0-9a-f]{64}\z/
      end
    end

    def validate_attempts(task)
      attempts = task["attempts"]
      unless attempts.is_a?(Array)
        add("task #{task["id"]}: attempts must be a sequence")
        return
      end
      validate_unique_ids(attempts, "task #{task["id"]}: attempts")
      evidence_ids = id_set(task["required_evidence"])
      validation_ids = id_set(task["validations"])

      attempts.each_with_index do |attempt, index|
        label = "task #{task["id"]}: attempts[#{index}]"
        unless attempt.is_a?(Hash)
          add("#{label} must be a mapping")
          next
        end
        unknown = attempt.keys - %w[id outcome evidence validations produced recorded_commit]
        add("#{label}: unknown fields #{unknown.sort.join(", ")}") unless unknown.empty?
        add("#{label}: outcome must be one of #{ATTEMPT_OUTCOMES.join(", ")}") unless ATTEMPT_OUTCOMES.include?(attempt["outcome"])
        recorded_commit = attempt["recorded_commit"]
        if recorded_commit && recorded_commit !~ /\A[0-9a-f]{40}\z/
          add("#{label}: recorded_commit must be a 40-character lowercase Git SHA")
        end
        if task.dig("publication", "mode") == "HISTORICAL_PRE_RULE" && !recorded_commit
          add("#{label}: historical attempt requires recorded_commit")
        end
        validate_id_references(attempt["evidence"], evidence_ids, "#{label}: evidence")
        validate_id_references(attempt["validations"], validation_ids, "#{label}: validations")
        validate_produced_snapshot(task, attempt["produced"], label)
      end
    end

    def validate_produced_snapshot(task, snapshots, label)
      unless snapshots.is_a?(Array)
        add("#{label}: produced must be a sequence")
        return
      end
      snapshots.each_with_index do |snapshot, index|
        item_label = "#{label}: produced[#{index}]"
        unless snapshot.is_a?(Hash) && snapshot.keys.sort == %w[id state type]
          add("#{item_label} must contain only type, id, and state")
          next
        end
        expected = (task["produces"] || []).any? { |node| node["type"] == snapshot["type"] && node["id"] == snapshot["id"] }
        add("#{item_label} does not match a Task output") unless expected
        valid_state = snapshot["type"] == "DECISION" ? "RESOLVED" : "AVAILABLE"
        add("#{item_label} state must be #{valid_state}") unless snapshot["state"] == valid_state
      end
    end

    def validate_global_ids
      ids = Hash.new { |hash, key| hash[key] = [] }
      repository.decisions.each { |node| ids[node["id"]] << "DECISION" if node.is_a?(Hash) && node["id"] }
      repository.artifacts.each { |node| ids[node["id"]] << "ARTIFACT" if node.is_a?(Hash) && node["id"] }
      repository.tasks.each { |node| ids[node["id"]] << "TASK" if node.is_a?(Hash) && node["id"] }
      ids.each do |id, types|
        add("node ID #{id} is reused across #{types.join(", ")}") if types.length > 1
      end
    end

    def validate_cycles
      visiting = {}
      visited = {}
      stack = []

      repository.task_index.keys.sort.each do |task_id|
        detect_cycle(task_id, visiting, visited, stack)
      end
    end

    def detect_cycle(task_id, visiting, visited, stack)
      return if visited[task_id]
      if visiting[task_id]
        start = stack.index(task_id) || 0
        add("task dependency cycle: #{(stack[start..-1] + [task_id]).join(" -> ")}")
        return
      end

      visiting[task_id] = true
      stack << task_id
      task = repository.task_index[task_id]
      (task && task["depends_on"] || []).sort.each do |dependency|
        detect_cycle(dependency, visiting, visited, stack) if repository.task_index.key?(dependency)
      end
      stack.pop
      visiting.delete(task_id)
      visited[task_id] = true
    end

    def validate_unique_ids(entries, label)
      return unless entries.is_a?(Array)
      seen = {}
      entries.each_with_index do |entry, index|
        next unless entry.is_a?(Hash)
        id = entry["id"]
        add("#{label}[#{index}]: id must be a non-empty string") unless non_empty_string?(id)
        add("#{label}: duplicate id #{id}") if non_empty_string?(id) && seen[id]
        seen[id] = true if non_empty_string?(id)
      end
    end

    def validate_id_references(values, allowed, label)
      unless string_array?(values)
        add("#{label} must be a sequence of IDs")
        return
      end
      values.each { |id| add("#{label} references unknown id #{id}") unless allowed.include?(id) }
    end

    def validate_relative_path(path, label)
      unless non_empty_string?(path)
        add("#{label} must be a non-empty relative path")
        return
      end
      pathname = Pathname.new(path)
      add("#{label} must remain inside the repository") if pathname.absolute? || pathname.each_filename.include?("..")
    end

    def id_set(entries)
      return [] unless entries.is_a?(Array)
      entries.map { |entry| entry["id"] if entry.is_a?(Hash) }.compact
    end

    def string_array?(value)
      value.is_a?(Array) && value.all? { |item| item.is_a?(String) && !item.empty? }
    end

    def non_empty_string?(value)
      value.is_a?(String) && !value.empty?
    end

    def add(message)
      @errors << message
    end
  end

  class Engine
    attr_reader :repository, :validator

    def initialize(repository)
      @repository = repository
      @validator = Validator.new(repository)
    end

    def status
      return [] unless validator.valid?
      @status ||= begin
        memo = {}
        repository.tasks.sort_by { |task| task["id"] }.map do |task|
          derive_task_status(task, memo)
        end
      end
    end

    def next_result
      return { "result" => "STOP_FOR_REVIEW", "errors" => validator.errors } unless validator.valid?

      ready = status.select { |task_status| task_status.state == "READY" }
      unless ready.empty?
        selected = ready.sort_by { |task_status| [-task_status.priority, task_status.id] }.first
        return {
          "result" => "READY",
          "task" => selected.id,
          "title" => selected.title,
          "priority" => selected.priority
        }
      end

      divergence = status.flat_map(&:reasons).select { |reason| reason.code == "PUBLICATION_DIVERGENCE" }
      unless divergence.empty?
        return {
          "result" => "STOP_FOR_REVIEW",
          "reasons" => divergence.map(&:message).uniq.sort
        }
      end

      unresolved = status.flat_map(&:reasons).select { |reason| reason.code == "DECISION_UNRESOLVED" }
      unless unresolved.empty?
        return {
          "result" => "OWNER_DECISION_REQUIRED",
          "reasons" => unresolved.map(&:message).uniq.sort
        }
      end

      { "result" => "NO_READY_TASK" }
    end

    private

    def derive_task_status(task, memo)
      return memo[task["id"]] if memo.key?(task["id"])

      completed_attempt = (task["attempts"] || []).reverse.find do |attempt|
        attempt["outcome"] == "PASSED" && completion_failures(task, attempt).empty?
      end
      if completed_attempt
        return memo[task["id"]] = TaskStatus.new(task["id"], task["title"], task["priority"], "DONE", [])
      end

      latest_attempt = (task["attempts"] || []).last
      if latest_attempt && latest_attempt["outcome"] == "IN_PROGRESS"
        return memo[task["id"]] = TaskStatus.new(task["id"], task["title"], task["priority"], "IN_PROGRESS", [])
      end
      if latest_attempt
        reasons = if latest_attempt["outcome"] == "FAILED"
                    [Reason.new("ATTEMPT_FAILED", "latest attempt #{latest_attempt["id"]} failed")]
                  else
                    completion_failures(task, latest_attempt)
                  end
        return memo[task["id"]] = TaskStatus.new(task["id"], task["title"], task["priority"], "FAILED", reasons)
      end

      blockers = dependency_blockers(task, memo)
      state = blockers.empty? ? "READY" : "BLOCKED"
      memo[task["id"]] = TaskStatus.new(task["id"], task["title"], task["priority"], state, blockers)
    end

    def dependency_blockers(task, memo)
      blockers = []
      task["requires"].each do |requirement|
        if requirement["type"] == "DECISION"
          decision = repository.decision_index[requirement["id"]]
          next if decision["state"] == "RESOLVED"
          code = decision["state"] == "UNRESOLVED" ? "DECISION_UNRESOLVED" : "DECISION_NOT_RESOLVED"
          blockers << Reason.new(code, "required Decision #{decision["id"]} is #{decision["state"]}")
        else
          artifact = repository.artifact_index[requirement["id"]]
          artifact_reason(artifact, "required Artifact").each { |reason| blockers << reason }
        end
      end
      task["depends_on"].each do |dependency_id|
        dependency = derive_task_status(repository.task_index[dependency_id], memo)
        next if dependency.state == "DONE"
        blockers << Reason.new("TASK_NOT_DONE", "prerequisite Task #{dependency_id} is #{dependency.state}")
      end
      blockers.sort_by { |reason| [reason.code, reason.message] }
    end

    def completion_failures(task, attempt)
      failures = []

      task["acceptance_criteria"].each do |criterion|
        result = run_check(criterion["check"])
        failures << Reason.new("ACCEPTANCE_FAILED", "#{criterion["id"]}: #{result}") unless result == true
      end

      included_evidence = attempt["evidence"] || []
      task["required_evidence"].each do |evidence|
        unless included_evidence.include?(evidence["id"])
          failures << Reason.new("EVIDENCE_MISSING", "attempt does not include required evidence #{evidence["id"]}")
          next
        end
        evidence_result = validate_evidence_file(evidence, task, attempt)
        failures << Reason.new("EVIDENCE_INVALID", "#{evidence["id"]}: #{evidence_result}") unless evidence_result == true
      end

      included_validations = attempt["validations"] || []
      task["validations"].each do |validation|
        unless included_validations.include?(validation["id"])
          failures << Reason.new("VALIDATION_MISSING", "attempt does not include required validation #{validation["id"]}")
          next
        end
        result = run_check(validation["check"])
        failures << Reason.new("VALIDATION_FAILED", "#{validation["id"]}: #{result}") unless result == true
      end

      produced = attempt["produced"] || []
      task["produces"].each do |output|
        snapshot = produced.find { |item| item["type"] == output["type"] && item["id"] == output["id"] }
        unless snapshot
          failures << Reason.new("OUTPUT_UNVERIFIED", "attempt does not record output #{output["type"]} #{output["id"]}")
          next
        end
        output_validity(output, snapshot).each { |reason| failures << reason }
      end

      publication_result = validate_remote_publication(task)
      unless publication_result == true
        code = publication_result.start_with?("remote divergence:") ? "PUBLICATION_DIVERGENCE" : "PUBLICATION_NOT_VERIFIED"
        failures << Reason.new(code, publication_result)
      end

      failures.sort_by { |reason| [reason.code, reason.message] }
    end

    def validate_remote_publication(task)
      publication = task["publication"]
      return true if publication["mode"] == "HISTORICAL_PRE_RULE"

      evidence_path = publication["evidence_path"]
      absolute_evidence_path = repository.resolve_path(evidence_path)
      return "publication evidence #{evidence_path} does not exist" unless File.file?(absolute_evidence_path)

      marker = YAML.safe_load(File.read(absolute_evidence_path), permitted_classes: [], permitted_symbols: [], aliases: false)
      unless marker.is_a?(Hash) && marker["task_id"] == task["id"] &&
             marker["remote"] == publication["remote"] && marker["branch"] == publication["branch"]
        return "publication evidence #{evidence_path} does not match Task, remote, and branch"
      end

      evidence_commit = publication_commit(task)
      return "publication evidence #{evidence_path} is not committed" unless evidence_commit

      remote = publication["remote"]
      branch = publication["branch"]
      remote_stdout, remote_stderr, remote_status = Open3.capture3(
        "git", "ls-remote", "--heads", remote, "refs/heads/#{branch}",
        chdir: repository.root
      )
      unless remote_status.success?
        return "could not inspect #{remote}/#{branch}: #{remote_stderr.lines.first.to_s.strip}"
      end
      remote_commit = remote_stdout.lines.map { |line| line.split.first }.find { |sha| sha&.match?(/\A[0-9a-f]{40}\z/) }
      return "remote branch #{remote}/#{branch} does not exist" unless remote_commit

      _fetch_stdout, fetch_stderr, fetch_status = Open3.capture3(
        "git", "fetch", "--quiet", "--no-tags", remote, "refs/heads/#{branch}",
        chdir: repository.root
      )
      unless fetch_status.success?
        return "could not fetch #{remote}/#{branch}: #{fetch_stderr.lines.first.to_s.strip}"
      end
      fetched_stdout, fetched_stderr, fetched_status = Open3.capture3(
        "git", "rev-parse", "FETCH_HEAD",
        chdir: repository.root
      )
      unless fetched_status.success? && fetched_stdout.strip == remote_commit
        return "fetched #{remote}/#{branch} did not match inspected remote commit: #{fetched_stderr.lines.first.to_s.strip}"
      end

      _ancestor_stdout, _ancestor_stderr, ancestor_status = Open3.capture3(
        "git", "merge-base", "--is-ancestor", evidence_commit, remote_commit,
        chdir: repository.root
      )
      return true if ancestor_status.success?

      _behind_stdout, _behind_stderr, behind_status = Open3.capture3(
        "git", "merge-base", "--is-ancestor", remote_commit, evidence_commit,
        chdir: repository.root
      )
      if behind_status.success?
        return "remote #{remote}/#{branch} has not yet published evidence commit #{evidence_commit}"
      end

      "remote divergence: #{remote}/#{branch} does not contain publication evidence commit #{evidence_commit}"
    rescue Psych::Exception => e
      "publication evidence #{evidence_path} is invalid YAML: #{e.message.lines.first.strip}"
    rescue SystemCallError => e
      "publication verification could not run: #{e.message}"
    end

    def output_validity(output, snapshot)
      if output["type"] == "DECISION"
        decision = repository.decision_index[output["id"]]
        return [] if snapshot["state"] == "RESOLVED" && ["RESOLVED", "SUPERSEDED"].include?(decision["state"])
        return [Reason.new("OUTPUT_INVALID", "Decision #{output["id"]} is not valid for the recorded completion")]
      end

      artifact = repository.artifact_index[output["id"]]
      return [] if snapshot["state"] == "AVAILABLE" && artifact_current_or_historically_valid?(artifact)
      [Reason.new("OUTPUT_INVALID", "Artifact #{output["id"]} is not valid for the recorded completion")]
    end

    def artifact_current_or_historically_valid?(artifact)
      return artifact_reason(artifact, "produced Artifact").empty? if artifact["state"] == "AVAILABLE"
      artifact["state"] == "INVALID" && artifact["invalidated_by"].is_a?(Array) && !artifact["invalidated_by"].empty?
    end

    def artifact_reason(artifact, prefix)
      case artifact["state"]
      when "MISSING"
        [Reason.new("ARTIFACT_MISSING", "#{prefix} #{artifact["id"]} is MISSING")]
      when "INVALID"
        [Reason.new("ARTIFACT_INVALID", "#{prefix} #{artifact["id"]} is INVALID")]
      when "AVAILABLE"
        path = repository.resolve_path(artifact["path"])
        File.file?(path) ? [] : [Reason.new("ARTIFACT_FILE_MISSING", "#{prefix} #{artifact["id"]} path #{artifact["path"]} is missing")]
      else
        [Reason.new("ARTIFACT_INVALID", "#{prefix} #{artifact["id"]} has an invalid state")]
      end
    end

    def validate_evidence_file(evidence, task, attempt)
      commit = attempt["recorded_commit"] || publication_commit(task)
      if commit
        content, stderr, status = Open3.capture3(
          "git", "show", "#{commit}:#{evidence["path"]}",
          chdir: repository.root
        )
        return "file #{evidence["path"]} is absent from evidence commit #{commit}: #{stderr.lines.first.to_s.strip}" unless status.success?
      else
        path = repository.resolve_path(evidence["path"])
        return "file #{evidence["path"]} does not exist" unless File.file?(path)
        content = File.binread(path)
      end
      return true unless evidence["sha256"]
      actual = Digest::SHA256.hexdigest(content)
      return true if actual == evidence["sha256"]
      "sha256 mismatch for #{evidence["path"]}"
    end

    def publication_commit(task)
      publication = task["publication"]
      return nil unless publication && publication["mode"] == "REQUIRED"
      evidence_path = publication["evidence_path"]
      stdout, _stderr, status = Open3.capture3(
        "git", "log", "-1", "--format=%H", "--", evidence_path,
        chdir: repository.root
      )
      status.success? && stdout.strip.match?(/\A[0-9a-f]{40}\z/) ? stdout.strip : nil
    end

    def run_check(check)
      case check["type"]
      when "file_exists"
        File.file?(repository.resolve_path(check["path"])) || "file #{check["path"]} does not exist"
      when "file_executable"
        path = repository.resolve_path(check["path"])
        (File.file?(path) && File.executable?(path)) || "file #{check["path"]} is not executable"
      when "file_contains"
        path = repository.resolve_path(check["path"])
        return "file #{check["path"]} does not exist" unless File.file?(path)
        File.read(path).include?(check["text"]) || "file #{check["path"]} does not contain required text"
      when "command_succeeds"
        _stdout, stderr, status = Open3.capture3(*check["argv"], chdir: repository.root)
        status.success? || "command failed with exit #{status.exitstatus}: #{stderr.lines.first.to_s.strip}"
      else
        "unsupported check type #{check["type"]}"
      end
    rescue SystemCallError => e
      "check could not run: #{e.message}"
    end
  end

  class CLI
    def self.run(argv, root:, out: $stdout)
      command = argv.first
      repository = Repository.new(root)
      engine = Engine.new(repository)

      case command
      when "validate"
        if engine.validator.valid?
          out.puts "RESULT: PASS"
          return 0
        end
        out.puts "RESULT: FAIL"
        engine.validator.errors.each { |error| out.puts "ERROR: #{error}" }
        1
      when "status"
        unless engine.validator.valid?
          out.puts "RESULT: STOP_FOR_REVIEW"
          engine.validator.errors.each { |error| out.puts "ERROR: #{error}" }
          return 1
        end
        out.puts "RESULT: PASS"
        engine.status.each do |task_status|
          out.puts "TASK: #{task_status.id}"
          out.puts "STATE: #{task_status.state}"
          task_status.reasons.each { |reason| out.puts "REASON: #{reason.code} | #{reason.message}" }
        end
        0
      when "next"
        result = engine.next_result
        out.puts "RESULT: #{result["result"]}"
        if result["result"] == "READY"
          out.puts "TASK: #{result["task"]}"
          out.puts "TITLE: #{result["title"]}"
          out.puts "PRIORITY: #{result["priority"]}"
        end
        (result["errors"] || []).each { |error| out.puts "ERROR: #{error}" }
        (result["reasons"] || []).each { |reason| out.puts "REASON: #{reason}" }
        result["result"] == "STOP_FOR_REVIEW" ? 1 : 0
      else
        out.puts "Usage: ahf-dag <validate|status|next>"
        64
      end
    end
  end
end
