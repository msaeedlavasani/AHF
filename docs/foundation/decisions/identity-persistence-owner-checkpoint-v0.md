# Identity and Persistence Owner Decision Checkpoint

**Status: UNRESOLVED**
**Checkpoint status: OWNER-APPROVED INTERIM CHECKPOINT**
**Version: v0**
**Artifact ID: `OWNER_GATE_IDENTITY_PERSISTENCE_CHECKPOINT@v0`**
**Owner gate: `OWNER_GATE_IDENTITY_PERSISTENCE@v0` — UNRESOLVED**

## Purpose and authority boundary

This checkpoint preserves the Owner-approved Identity/Persistence decisions
reached so far. It is a canonical input to the remaining gate discussion and
the eventual Identity/Persistence boundary-resolution task.

This checkpoint does **not** resolve
`OWNER_GATE_IDENTITY_PERSISTENCE@v0`, does not resolve
`IDENTITY_AND_PERSISTENCE_BOUNDARIES@v0`, and does not authorize the downstream
resolution task or product implementation.

No product code, schema, database, synchronization protocol, storage
technology, architecture, runtime, framework, or tooling is selected here.

## 1. Semantic domain identities

Independent stable semantic identities are required for at least:

- Canonical Exercise;
- Program;
- Workout Prescription / Workout Passport;
- Exercise Entry;
- Set Prescription;
- Workout Session;
- Exercise Execution;
- Set Execution;
- Set Result; and
- Workout Outcome.

Identity format, UUID strategy, and database primary-key strategy are not
decided.

Values or state such as prescribed repetitions, duration, performed
repetitions, valid repetitions, pause state, or synchronization status are not
automatically independent domain entities.

## 2. Account, User Profile, Training Profile, and Training History

These concepts remain distinct:

### Account

- authentication/access identity;
- account lifecycle.

### User Profile

- relatively stable personal/user information.

### Training Profile

- current mutable training state used for personalization.

### Training History

- historical Prescription, Execution, and Outcome truth.

Physical storage boundaries are not hard-coded by this checkpoint.

Where date of birth is appropriate, prefer storing a stable fact rather than
storing changing age. Whether full date of birth, birth year, age band, or
another minimized representation is appropriate remains subject to Privacy
review.

## 3. Account deletion lifecycle

The Owner-approved conceptual lifecycle is:

```text
ACTIVE
→ PENDING_DELETION
→ DELETED
```

A deletion request begins a 30-day grace period.

Returning or logging in during the grace period does not automatically cancel
deletion. The user must explicitly choose whether to reactivate or recover the
account.

If the user explicitly confirms recovery:

```text
PENDING_DELETION → ACTIVE
```

If the user does not confirm recovery:

- deletion continues;
- the original deletion deadline remains unchanged; and
- the 30-day period is not restarted merely because the user returned or
  logged in.

A later new deletion request after successful recovery starts a new deletion
lifecycle and grace period.

At expiration, deletion of attributable personal/user data is intended to be
irreversible.

Detailed legal retention, backup purge, de-identification implementation,
consent/notice, training-data eligibility, and jurisdiction-specific
requirements are deferred to the Privacy/Sensing/Account Lifecycle gate.

A previously discussed generic six-month legal-retention duration is **not
resolved** and remains open pending legal review.

## 4. Anonymous learning and improvement data

AHF may retain data useful for system improvement only when it has crossed an
appropriate irreversible de-identification or aggregation boundary such that
it is no longer attributable or reconstructable as a specific user's personal
data.

Simply removing `user_id` is not sufficient by definition.

The conceptual boundary is:

```text
Identifiable User Data
→ irreversible de-identification/aggregation boundary
→ Anonymous Learning/Improvement Data
```

Detailed eligibility, consent/notice, transformation, retention, and
legal/privacy requirements are deferred.

## 5. Prescription immutability and versioning

A Workout Prescription / Passport becomes immutable once `ISSUED`.

Adaptation must not rewrite historical issued Prescription truth.

Changes after issuance require a new Prescription identity with lineage to the
previous Prescription where applicable.

AI or internal candidate generation does not automatically create permanent
historical Prescription versions.

The conceptual lifecycle includes:

```text
DRAFT → ISSUED
```

Issued Prescriptions may later be superseded where applicable, but historical
issued truth is not silently mutated.

Before `START`, a later valid Prescription may supersede an issued future
Prescription.

After `START`, the active Session's Prescription is not superseded in place by
adaptation. Adaptation from that execution affects future Prescriptions.

Exact timing and policy for when a Draft becomes Issued are not hard-coded.

## 6. Data minimization and retention principle

Historical truth must be preserved without retaining every intermediate byte
forever.

The adopted principle is:

```text
Minimize by default
→ retain by purpose
→ compact/archive where valid
→ delete when purpose expires
```

Immutability does not mean infinite retention of every artifact.

Transient AI candidates, intermediate calculations, raw or high-volume
telemetry, and other nonessential artifacts may have shorter retention
according to future policy.

Exact retention periods and compaction/archive rules remain unresolved.

## 7. Adaptation lineage

Preserve the meaningful relationship:

```text
Outcome
→ Adaptation Assessment/Decision
→ Future Prescription
```

Past Outcome and Prescription remain historical truth.

Adaptation changes future state and Prescriptions rather than rewriting
history.

Meaningful adaptation provenance should be durable enough for traceability.

Raw AI reasoning, chain-of-thought, every candidate, and intermediate AI
artifact are not required to be permanent historical truth.

## 8. Workout Session identity

One Workout Session represents one real execution of a Prescription.

Normal continuation does not create a new Session.

The following do not inherently create a new Session:

- Pause;
- Resume;
- Exit followed by a valid same-workout-day return;
- application crash;
- offline continuation; and
- recovery.

A finalized Workout Session is never reopened.

## 9. Missed Workout and next-day repeat

If a Workout finalizes `FAILED` or `PARTIAL` at the workout-day boundary,
performing the Workout on a later day does not rewrite or reopen the previous
Workout.

A later execution receives:

- a new Prescription identity; and
- a new Session identity.

The new Prescription may be derived or reissued from the previous Prescription
and preserve lineage, even if its content is identical.

The historical missed Workout remains unchanged.

## 10. Training truth and streak truth

Training/Workout truth and Engagement/Streak truth are independent concepts.

Example:

```text
Workout = FAILED
Streak = PROTECTED_BY_FREEZE
```

A streak freeze does not mark a missed Workout completed and does not fabricate
Workout execution or Outcome.

Completing a derived or reissued Workout on a later day may affect Training
History but does not retroactively repair the previous day's streak unless a
future explicit streak-repair policy says otherwise.

Detailed Streak/Freeze Token economics and policy are not designed by this
checkpoint.

## 11. Durable execution progress

Any user-meaningful execution state whose loss would force the user to repeat
meaningful completed work or would change historical execution truth must be
recoverable and durable according to the execution contract.

This does not require persisting every raw event, timer tick, or sensing frame.

User-meaningful progress should be recoverable. Raw or intermediate telemetry
is not automatically durable.

Implementation mechanics remain deferred.

## 12. Offline and synchronization source of truth

Neither "server always wins" nor "device always wins" is valid.

Execution truth is determined by the authoritative execution history and
Session, not merely by storage location.

A device holding valid execution authority may continue offline.

Later synchronization must not silently overwrite newer valid offline
execution truth with stale server state.

```text
Execution Truth != Storage Location != Sync Status
```

A Workout may be `FINAL / COMPLETED` locally while synchronization remains
pending.

Conflicting concurrent histories must not be destroyed by blind
last-write-wins. They must be preserved until deterministic reconciliation is
possible.

Authority transfer, leases, synchronization protocol, reconciliation
mechanics, and conflict algorithms remain deferred.

## 13. Persistence model principle

Full Event Sourcing is not mandated.

The adopted hybrid conceptual model is:

```text
Recoverable Current State
+
Durable Domain-Significant Evidence
+
Telemetry retained/disposed according to purpose
```

Domain-significant historical facts such as closed Set Results, meaningful
execution Outcomes, finalization, Skip where applicable, and Prescription
supersession must not disappear merely because current mutable state changes.

Checkpoint and compaction implementation remain deferred.

## 14. Training Profile semantics

Training Profile represents current training state, not the complete Training
History.

Observed Evidence, Derived Assessment, and Current Training Profile are
distinct.

Historical evidence remains historical truth.

Derived assessments may later be reconsidered or recomputed.

Training Profile may be recomputed from valid historical evidence without
rewriting historical Prescription, Execution, or Outcome.

Endless complete Training Profile snapshots are not persisted merely because
the current profile changes.

Meaningful Training Profile changes should preserve provenance sufficient to
understand their source.

## 15. User-authoritative and system-derived Profile data

AI or system inference must not silently overwrite factual user-declared
state.

Examples of predominantly user-authoritative information include:

- available equipment;
- explicit preferences; and
- explicit user-declared constraints.

Examples of system-derived information include:

- estimated capability; and
- performance trend.

The system may detect conflict and request confirmation rather than silently
replacing explicit user-declared facts.

Detailed attribute-level authority policy remains for later contract work.

## 16. Device and Client Instance identity

A Device or Client Instance requires operationally stable identity sufficient
to support offline synchronization, execution-authority provenance, and
conflict investigation and reconciliation.

Device identity is not the owner of Workout history. The User owns Training
History.

A Device or Client Instance may temporarily hold execution authority.

Device identity must not automatically imply permanent invasive device
fingerprinting.

Exact identity format, lifetime, metadata, and privacy treatment remain
deferred.

## 17. Domain identity and synchronization/transport identity

Domain identity is independent of transport or synchronization attempts.

Retries, upload batches, synchronization jobs, or transport attempts must not
create duplicate domain facts.

The same Set Result remains the same domain fact whether synchronization
succeeds immediately, retries several times, or occurs hours later.

Idempotent synchronization is therefore a requirement.

The exact idempotency mechanism and protocol are deferred to Architecture.

## Explicitly unresolved and deferred

This checkpoint does not infer decisions for:

- physical database/storage model;
- ID/UUID format;
- schema;
- local storage technology;
- server database technology;
- event-sourcing implementation;
- synchronization protocol;
- outbox design;
- checkpoint implementation;
- authority lease/takeover mechanics;
- conflict-reconciliation algorithm;
- backup-purge mechanics;
- legal retention periods;
- de-identification implementation;
- training/improvement consent policy;
- exact Draft-to-Issued timing;
- detailed Prescription supersession policy;
- detailed Training Profile schema;
- detailed User Profile schema;
- streak/freeze economics or product rules;
- AI implementation, runtime, or model; and
- architecture, runtime, language, and framework choices.

These remain inputs to the unfinished Owner-gate discussion and their
appropriate later contracts.
