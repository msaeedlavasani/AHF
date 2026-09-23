# Task/DAG Contract

**Status: RESOLVED**  
**Version: v0**

## Purpose

The repository-native Task/DAG is the canonical mechanism for determining executable AHF project work. It derives work state from versioned repository facts rather than from manually authored execution deltas or agent self-report.

## Canonical concepts

A **Task** is the smallest independently executable unit of work with:

- explicit inputs and dependencies;
- explicit outputs;
- acceptance criteria;
- required evidence; and
- deterministic validation.

Decision and Task are distinct:

- **Decision** — canonical project truth or contract.
- **Task** — work that creates or changes a Decision, Artifact, or implementation.

The node types are:

- `DECISION`
- `ARTIFACT`
- `TASK`

The allowed relationships are:

```text
TASK --requires--> DECISION
TASK --requires--> ARTIFACT
TASK --depends_on--> TASK
TASK --produces--> DECISION | ARTIFACT
```

## Node states

Decision states:

- `DRAFT`
- `RESOLVED`
- `SUPERSEDED`
- `UNRESOLVED`

Artifact states:

- `MISSING`
- `AVAILABLE`
- `INVALID`

Task lifecycle:

- `BLOCKED`
- `READY`
- `IN_PROGRESS`
- `DONE`
- `FAILED`

`BLOCKED`, `READY`, and `DONE` are derived. They are not manually authoritative Task fields.

## State derivation

A Task is `READY` if and only if:

- all required Tasks are `DONE`;
- all required Decisions are `RESOLVED`;
- all required Artifacts are `AVAILABLE` and their repository paths exist; and
- no applicable blocking unresolved dependency exists.

A Task is `DONE` if and only if a preserved successful attempt independently satisfies all of the following:

- every acceptance criterion validates;
- every required evidence item is included and exists, with its digest matching when one is declared;
- every required deterministic validation is included and passes; and
- every produced node has a valid completion snapshot.

Agent self-report is not sufficient evidence of `DONE`. Attempt outcome alone cannot make a Task `DONE`.

`IN_PROGRESS` and `FAILED` are derived from the latest preserved attempt when no valid successful attempt establishes `DONE`.

## Priority and next work

Priority is an explicit integer. A greater integer is a higher priority.

`next` considers all derived `READY` Tasks, selects the highest priority, and breaks an equal-priority tie by lexicographically ascending Task ID. It returns exactly one Task.

When no Task is `READY` because an unresolved Decision blocks progress, the result is `OWNER_DECISION_REQUIRED`.

When an invalid graph or contract conflict prevents safe progress, the result is `STOP_FOR_REVIEW`.

The Task/DAG never resolves a Decision automatically.

## History and invalidation

History is append-only in meaning. Attempts are ordered records inside a Task and must be appended rather than replaced. Failed attempts remain recorded when another attempt is made.

A successful attempt records the evidence, validations, and valid output states under which completion occurred. If a Decision used by completed work later becomes `SUPERSEDED`:

- the historical Task and attempt remain complete in their original meaning;
- affected derived Artifacts are marked `INVALID` where applicable and identify the invalidating Decision;
- historical completion is not rewritten; and
- corrective work is represented by a new Task.

This v0 contract preserves attempt history but does not provide a complex attempt execution engine.

## Repository source and CLI

The canonical machine-readable source is:

- `.dag/decisions.yaml`
- `.dag/artifacts.yaml`
- `.dag/tasks.yaml`

The manifests use YAML with `schema_version: 0`.

The repository CLI operations are:

```text
bin/ahf-dag validate
bin/ahf-dag status
bin/ahf-dag next
```

- `validate` checks schema structure, allowed states and relationships, references, and Task dependency cycles. It reports deterministic `PASS` or `FAIL`.
- `status` derives every Task state, explains blockers, and identifies required nodes that are missing or invalid.
- `next` returns exactly one deterministically selected `READY` Task, or the applicable owner/review stop result.

The implementation uses the system Ruby standard library, including its YAML parser and test library. It adds no package dependency, application framework, database, service, daemon, workflow engine, task manager, AI planner, or orchestration platform.
