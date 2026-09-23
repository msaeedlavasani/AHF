# Execution, Outcome, and Recovery Contracts

**Status: RESOLVED**
**Version: v0**
**Decision ID: `EXECUTION_OUTCOME_AND_RECOVERY_CONTRACTS@v0`**
**Owner Gate: `OWNER_GATE_EXECUTION_OUTCOME_RECOVERY@v0` — RESOLVED**

## Scope

This document records the Owner-approved domain contract for Workout
Prescription, execution, outcome, completion, recovery, offline execution, and
multi-device evidence boundaries.

It does not select or adopt a serialization, schema, database, state machine,
runtime, framework, persistence mechanism, synchronization mechanism, sensing
implementation, UX screen model, AI planner, or legacy implementation.

## 1. Core separation

Prescription, Execution, and Outcome are distinct.

Foundation defines the domain language and contracts.

A Workout Passport expresses a concrete Workout Prescription.

The Execution Engine interprets a valid Passport.

UX presents the execution.

The Execution Engine must not depend on whether the Passport was produced by
an internal deterministic engine, AI, human-authoring system, or another future
compliant producer.

The producer must conform to the AHF Passport contract; it cannot invent
execution semantics.

## 2. Workout Passport envelope

At the domain level, a Passport must be capable of expressing at least:

- workout identity/context;
- ordered Exercise Entries;
- a reference from each Entry to its canonical Exercise;
- ordered Set Prescriptions per Entry;
- execution mode per Set, including `REP_BASED` and `TIME_BASED`;
- prescribed target per Set;
- optional Rest Prescriptions;
- instruction/coaching references where applicable;
- observation/sensing requirements or capabilities where applicable; and
- permitted execution policies such as Skip/Defer where applicable.

This contract does not define the serialization, schema, or database
representation.

Live execution state does not belong in the Passport.

## 3. `REP_BASED` Set completion

For `REP_BASED` Sets, completion is based on performed attempts reaching the
prescribed target.

Valid repetitions are observed results and are distinct from performed
attempts.

Example:

```text
target = 10
performed = 10
valid = 8
```

The Set may be complete with `performed = 10` and `valid = 8`.

Sensing must not silently change the Prescription from 10 prescribed
repetitions to 10 valid repetitions.

## 4. `TIME_BASED` Set completion

For `TIME_BASED` Sets, completion is based on reaching the prescribed active
execution duration.

Paused time is not active execution time.

Wall-clock elapsed time and active execution time are distinct.

Loss of sensing or tracking alone must not automatically fail the Set.

## 5. Set Result

Every closed Set Execution must have a Set Result.

The Result records factual execution evidence appropriate to the mode and
available observations.

The domain requirement for a Set Result does not imply that UX must show a
dedicated `SET_RESULT` screen after every Set. That presentation decision is
outside this contract.

## 6. Pause and Resume

Pause does not close the Set and does not create a new Set.

Resume continues the same live Set Execution.

`REP_BASED` progress and `TIME_BASED` active duration are preserved across
normal Pause/Resume.

## 7. Recovery

Recovery uses two levels:

1. Attempt exact-state recovery when a valid recoverable execution state
   exists.
2. If exact-state recovery cannot be trusted or recovery fails, fall back to
   the latest valid durable checkpoint and reconstruct deterministically from
   there.

No specific recovery time threshold, such as 30 seconds, is hard-coded in v0.

The exact persistence and checkpoint mechanism remains for the appropriate
later gate.

## 8. Exit Workout

Exit is not immediate final termination of the Workout.

On Exit:

- current execution state is persisted;
- completed work remains preserved;
- the Workout remains recoverable during its workout-day; and
- the user may return and continue the remaining Workout.

If the user later completes all required or otherwise-validly-resolved
obligations before finalization, the Workout may become `COMPLETED`.

Exit is distinct from permanent termination.

## 9. Skip and Defer

Skip and Defer are distinct.

Skip closes the applicable obligation for this Session without marking it as
performed.

Defer keeps the obligation open and moves its execution later within the
Workout.

Defer must not silently become Skip.

Neither action rewrites the historical Prescription.

Detailed policy governing when Skip or Defer are permitted remains outside
this decision where not already specified by the Passport contract.

## 10. Restart Current Set

The existence of a Restart Current Set product capability remains
**UNRESOLVED**.

If later adopted, its semantics must preserve prior execution evidence rather
than pretending the abandoned attempt never occurred.

Restart Current Set is not mandatory in this contract.

## 11. Rest

Rest is a Prescription/Execution concept, not hard-coded UI behavior.

The existence, duration, and context of Rest come from the Workout Passport.

The Execution Engine must not invent Rest merely because a Set ended.

Rest may include contexts such as `BETWEEN_SETS` and `BETWEEN_EXERCISES`, but
this contract does not unnecessarily constrain future valid Rest semantics.

No terminal Rest is automatically invented after the final exercise
obligation.

A separately prescribed recovery or cooldown obligation may exist.

Whether Skip Rest is a supported product capability remains **UNRESOLVED**.

## 12. Workout completion

Session termination, Workout completion, and adherence are distinct concepts.

A Workout is `COMPLETED` when it reaches its natural completion path and no
required or open execution obligation remains.

A legitimately skipped obligation may be closed without being performed.

Therefore, a Workout can be `COMPLETED` while still having less-than-perfect
adherence.

## 13. Workout Outcome

Workout Outcome is the factual execution record.

Adherence is a derived interpretation of the Outcome against the Prescription.

This contract does not hard-code a single completion/adherence percentage or
scoring formula.

Outcome must preserve sufficient factual execution information for later
adherence, progress, and adaptation reasoning.

## 14. Provisional Outcome

Before finalization, a Workout always has a provisional Outcome.

- If no workout execution has occurred: `PROVISIONAL_FAIL`.
- If some execution occurred but the Workout is not complete:
  `PROVISIONAL_PARTIAL`.

The provisional Outcome may continue changing as the user resumes and performs
more of the Workout.

## 15. Finalization

There are two Owner-approved finalization triggers in v0:

1. The Workout reaches `COMPLETED`.
2. The workout-day reaches 00:00 local time.

If completion occurs first, the result is `FINAL / COMPLETED`.

If local 00:00 occurs before completion:

- no execution performed results in `FINAL / FAILED`;
- some execution performed results in `FINAL / PARTIAL`.

The exact definition and persistence of workout-day/timezone identity must be
resolved in the appropriate later gate.

## 16. Historical immutability

Once finalized, the historical Prescription and factual Workout Outcome must
not be rewritten to represent something that did not occur.

Future adaptation may use historical Outcomes to affect future Prescriptions.

Adaptation does not rewrite historical execution truth.

## 17. Offline-first Workout execution

This is a fundamental cross-gate constraint.

Once a Workout begins, network or server availability must not be in the
critical path required to execute and finish that Workout.

The device must have sufficient local Workout package and state to continue the
Workout offline.

Execution state and Results must be durably recordable locally.

Pause, Exit, Resume/recovery, progression, and Workout finalization must not
require live server connectivity.

Synchronization occurs asynchronously when connectivity becomes available.

A Workout may therefore be `FINAL / COMPLETED` locally while its server
synchronization state is still pending.

Execution truth and synchronization status are distinct.

Detailed local persistence, outbox/sync, retry, idempotency, and transport
mechanisms remain for later gates.

## 18. Multi-device execution

A Workout Session has one Active Execution Authority at a time.

Concurrent execution histories must not be silently merged.

Blind last-write-wins must not destroy conflicting execution evidence.

If conflicting histories occur, preserve the evidence until deterministic
reconciliation is possible.

Detailed takeover, lease, cross-device synchronization, and conflict
reconciliation mechanisms remain for Identity/Persistence and Architecture
decisions.

## Explicitly unresolved and deferred

The following remain **UNRESOLVED** and must not be inferred from this
contract:

- whether Restart Current Set exists as a product capability;
- whether Skip Rest exists;
- whether a separate explicit permanent End Workout action exists in addition
  to Exit;
- detailed Skip/Defer policy ownership;
- Passport serialization/schema;
- local persistence implementation;
- checkpoint implementation;
- exact-state recovery implementation;
- sync/outbox/idempotency mechanics;
- multi-device takeover/reconciliation mechanics;
- workout-day/timezone identity mechanics;
- sensing/camera implementation;
- adherence/scoring formulas;
- UX state/screen decisions;
- AI/planner implementation; and
- runtime, language, framework, and database choices.

These matters must be routed to their appropriate Owner gates or future
contracts.

## Historical-evidence boundary

The Legacy Knowledge Index, Product/Domain Revalidation, and Historical
Failure/Evidence Model informed review. They are evidence, not authority. No
legacy implementation, schema, state machine, tooling, architecture, or asset
is adopted by this decision.
