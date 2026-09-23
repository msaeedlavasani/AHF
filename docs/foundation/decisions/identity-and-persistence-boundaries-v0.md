# Identity and Persistence Boundaries

**Status: RESOLVED**  
**Version: v0**  
**Decision ID: `IDENTITY_AND_PERSISTENCE_BOUNDARIES@v0`**  
**Owner Gate: `OWNER_GATE_IDENTITY_PERSISTENCE@v0` — RESOLVED**

## Scope and authority

This contract consolidates the Owner-approved Identity/Persistence decisions
preserved in the [interim checkpoint](identity-persistence-owner-checkpoint-v0.md)
and adds the final Owner-approved decision on anonymous-data ownership. It
defines conceptual identity, ownership, historical truth, persistence
principles, and cross-gate boundaries. It does not select an implementation,
schema, or storage architecture.

The closure audit compared these decisions with the resolved Product
Constitution, Domain Glossary, Domain Model, Task/DAG Contract, Clean-Start
Foundation Completeness contract, and Execution, Outcome, and Recovery
Contracts.

## Closure audit: PASS

No contradiction was found with an already-resolved Foundation decision. The
audit also checked for duplicated or missing lineage across the checkpoint
decisions and for any deferred matter being silently promoted to resolved;
none was found. The only new resolution is the explicitly approved anonymous-
data ownership decision in this contract. The following boundaries remain
consistent:

- Prescription, Execution, and Outcome remain distinct; execution does not
  rewrite issued Prescription truth.
- Workout completion, adherence, and Streak eligibility remain distinct; Skip
  may close an obligation without representing it as performed.
- Offline execution, local finalization, and pending synchronization remain
  compatible; Execution Truth, storage location, and Sync Status are distinct.
- One Active Execution Authority is maintained conceptually. Explicit
  takeover is permitted, while conflicts are preserved and reconciliation
  cannot fabricate or silently overwrite historical truth.
- Adaptation may use factual historical Outcomes to influence future
  Prescriptions without rewriting historical Prescription, Execution, or
  Outcome truth.

The checkpoint is retained as historical Owner-decision evidence. This
resolved contract is the consolidated canonical v0 decision.

## 1. Semantic identity

Stable semantic identities are required for at least:

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

Semantic identity must not depend on mutable business attributes such as
Exercise order, display/name fields, Workout date, email, device, or similar
mutable values. Exact identifier representation, UUID strategy, and database
primary-key strategy remain unresolved.

An Exercise Entry retains its identity when reordered in a mutable Draft.
Prescribed order becomes part of the immutable issued Passport at `START`;
execution divergence is recorded as execution behavior or adjustment, not as
mutation of the issued Prescription. A Set Prescription's order or position
is an attribute, not its identity.

Values or state such as prescribed repetitions, duration, performed
repetitions, valid repetitions, pause state, and Sync Status are not
automatically independent domain entities. If Restart Current Set is later
adopted, a new attempt must preserve previous evidence and remain distinct
from the prescribed Set and Set Execution. Restart Current Set remains
unresolved; no attempt schema is defined here.

## 2. Account, profiles, and Training History

These concepts are distinct:

- **Account** — authentication/access identity and account lifecycle.
- **User Profile** — relatively stable personal/user information.
- **Training Profile** — current mutable training state used for
  personalization.
- **Training History** — historical Prescription, Execution, and Outcome
  truth.

These semantic boundaries do not dictate physical storage boundaries. Where
date of birth is appropriate, prefer a stable fact over changing age; whether
to retain full date of birth, birth year, age band, or another minimized
representation belongs to Privacy review.

Training Profile is current state, not the complete Training History. Observed
Evidence, Derived Assessment, and Training Profile are distinct. Derived
assessments and current profile state may be recomputed from valid historical
evidence without rewriting historical Prescription, Execution, or Outcome.
Endless complete profile snapshots are not required; meaningful profile
changes must retain enough provenance to understand their source.

System-derived inference must not silently overwrite factual user-declared
information, including explicit equipment, preferences, or constraints. The
system may identify a conflict and request confirmation. Attribute-level
authority rules remain unresolved.

## 3. Workout Draft, issuance, and Prescription identity

Program and Workout definitions may remain mutable Drafts. Draft changes do
not inherently create permanent historical Workout versions. Superseded or
abandoned Drafts that were never issued are not permanent historical Workout
truth by default and may be cleaned up under future retention policy.

`START` is the issuance boundary. At `START`, the latest valid Workout Draft
is materialized as an immutable issued Workout Prescription / Passport, and a
Workout Session begins against that exact issued snapshot. This is one atomic
semantic boundary: there must not be a Session without its exact issued
Passport, a Session and Passport referring to different Prescription states,
or execution against an indeterminate Draft version.

The Session remains bound to that exact issued Passport. Later Draft changes
cannot alter the Prescription governing an active Session. All information
needed to execute must be resolvable into the issued execution package, so
execution does not depend on a mutable Draft for Prescription meaning. This
supports the resolved Offline-First Workout execution contract.

Issued Prescription truth is immutable. A later change requires a new
Prescription identity with lineage where applicable; adaptation affects
future Prescriptions. A valid later Prescription may supersede an issued
future Prescription before `START`, but adaptation does not supersede the
active Session's Passport in place. AI or internal candidate generation does
not itself create permanent historical Prescription versions.

The transaction mechanism for `START`, Draft persistence, exact Draft-to-issued
serialization, and detailed supersession policy remain unresolved.

## 4. Session identity and historical execution

One Workout Session represents one real execution of one issued Prescription.
Pause, Resume, Exit followed by valid same-workout-day return, crash, offline
continuation, and recovery do not inherently create a new Session. A
finalized Session is never reopened.

If a Workout finalizes `FAILED` or `PARTIAL` at the workout-day boundary, a
later-day execution does not rewrite or reopen it. That later execution uses a
new Prescription identity and new Session identity. The new Prescription may
be derived or reissued from the prior Prescription with lineage, even if its
content is identical.

A closed Set Result is a stable historical fact bound to its Set Execution.
Correction of factual execution evidence must preserve correction provenance;
there is no silent historical overwrite, and a full snapshot per correction
is not required. Derived, cached, and projected state is recomputable and is
not authoritative historical evidence.

## 5. Execution adjustments and reported context

An issued Passport remains immutable after `START`. Where future policy
permits, execution may record controlled deviations such as substitution,
Skip, or Defer while preserving both what was prescribed and what actually
occurred. For example, the Passport may prescribe Dumbbell Squat while the
execution record reports an approved substitution to Bodyweight Squat.
Meaningful deviations retain sufficient provenance to identify why or how
execution differed. Possible provenance classes include `USER_REQUESTED` and
`SYSTEM_RECOMMENDED`, without freezing the final taxonomy or adjustment
schema.

Skip closes the applicable obligation for the Session without marking it as
performed. Defer keeps it open and moves it later within the Workout. Defer
does not silently become Skip; neither changes historical Prescription
meaning. Detailed Skip, Defer, and substitution policies remain unresolved.

When a user supplies a Skip/inability reason or context, the Outcome may
preserve it as a user report. “User reported pain/discomfort” must not silently
become “medically verified injury.” Reason taxonomy, privacy treatment, and
medical/safety policy remain unresolved.

The baseline active-Workout exception path is to close or Skip the applicable
obligation, capture reason/context where supplied, continue the remaining
valid Workout flow, preserve factual Outcome, and allow later
Assessment/Adaptation to influence a future Prescription. Dynamic AI re-planning
is not required in the active Workout critical path. AI or network
availability is not required to safely continue or conclude the active
Workout; a future separately reviewed capability is not prohibited.

## 6. Workout Outcome, finalization, and Streak

A Provisional Outcome is evolving state for the same Workout Session, not a
stream of duplicate Outcome entities. Finalization produces the final truth
for that Session and must be durable and idempotent across crash, retry, and
synchronization.

The resolved Execution, Outcome, and Recovery contract governs provisional
state (`PROVISIONAL_FAIL` before any execution and `PROVISIONAL_PARTIAL` after
some execution while incomplete), the finalization triggers (Workout
completion or local workout-day 00:00), and final result (`COMPLETED`, `FAILED`,
or `PARTIAL`) without reopening a finalized Session. This contract does not
change those semantics.

Workout Outcome is factual execution evidence; adherence is a derived
interpretation of Outcome against Prescription. A legitimately closed Skip
may allow the Workout flow to reach `COMPLETED` without representing skipped
work as performed. Workout completion, adherence, and Streak eligibility are
distinct. Streak state is not part of Workout Outcome identity or persistence;
a future Streak/Engagement policy may consume factual Outcome evidence, and
future Streak rule changes must not rewrite historical Outcome truth.

Training/Workout Truth remains independent of Streak Truth. For example, a
Workout may be `FAILED` while Streak is `PROTECTED_BY_FREEZE`; a freeze does
not fabricate Workout completion or execution. A later Workout does not
retroactively repair a previous day's Streak absent a future explicit policy.
No fixed X-of-Y Exercise, percentage, or other numerical Streak threshold is
established here.

## 7. Persistence, recovery, and offline execution

User-meaningful execution progress whose loss would force repetition of
meaningful completed work or change historical execution truth must be
recoverable and durably recordable. Raw events, timer ticks, sensing frames,
and other intermediate telemetry need not all be persisted. If meaningful
progress cannot be durably and reliably recorded, the system must not silently
represent it as safely persisted or completed. Failure UX and implementation
remain unresolved.

The conceptual persistence principle is hybrid:

```text
Recoverable Current State
+
Durable Domain-Significant Evidence
+
Telemetry retained/disposed according to purpose
```

Full Event Sourcing is not required. Closed Set Results, meaningful execution
Outcomes, finalization, Skip where applicable, and Prescription supersession
must not disappear merely because mutable current state changes.

Offline-First Workout execution is a resolved cross-gate constraint. Once a
Workout begins, server/network availability is not in the critical path for
execution, pause, exit, resume/recovery, progression, or finalization. Local
Workout package/state and Results must support offline continuation and local
finalization; synchronization occurs asynchronously when possible.

Recovery first attempts exact-state recovery when a valid recoverable state
exists, then falls back to the latest valid durable checkpoint and deterministic
reconstruction if exact recovery cannot be trusted or fails. No specific
30-second threshold is defined. Detailed storage, checkpoint, and exact-state
recovery mechanisms remain unresolved.

`Execution Truth != Storage Location != Sync Status`. Neither server-always-wins
nor device-always-wins is valid. A device with valid execution authority may
continue offline. Stale server state must not silently overwrite newer valid
offline execution truth. A Workout may be locally `FINAL / COMPLETED` while
server synchronization is pending.

## 8. Device authority, conflict, and reconciliation

One Active Execution Authority per Workout Session is the intended invariant.
A second device may explicitly take over when continuation is requested. The
UX must make takeover explicit; the previous device may be offline. Takeover
does not authorize silently concurrent execution authority.

Session and Outcome semantic ownership is stable across sync, device changes,
recovery, adaptation, and transport. User owns Training History; a Device or
Client Instance may temporarily hold execution authority but does not own
Workout history. Operationally stable device/client identity supports offline
sync, authority provenance, and conflict investigation without implying
permanent invasive device fingerprinting.

Conflicting execution histories must not be silently merged or destroyed by
blind last-write-wins. Conflicting history is durable operational evidence
until reconciliation; neither side may be discarded merely to manufacture a
clean state. Reconciliation may determine a canonical interpretation,
identify genuine duplicates, and select evidence appropriate for downstream
Training Profile/Adaptation while preserving sufficient provenance. It must
not fabricate historical truth. Lease/takeover protocols, synchronization,
conflict algorithms, and reconciliation UX remain unresolved.

Domain identity is independent of synchronization/transport identity. Retries,
upload batches, sync jobs, or transport attempts must not create duplicate
domain facts. Synchronization must be idempotent; the protocol and mechanism
remain unresolved.

## 9. Adaptation lineage

The meaningful relationship is:

```text
Historical Outcome
→ Adaptation Assessment/Decision
→ Future Prescription
```

Past Prescription, Session, Execution, and Outcome remain historical truth.
Adaptation changes future state and Prescriptions, never past execution truth.
Meaningful adaptation provenance must be durable enough for traceability.
Raw AI reasoning, chain-of-thought, every candidate, and intermediate AI
artifacts are not required to be permanent historical truth.

## 10. Data minimization, deletion, and anonymous learning data

Apply the principle:

```text
Minimize by default
→ retain by purpose
→ compact/archive where valid
→ delete when purpose expires
```

Historical immutability does not require retaining every intermediate byte
forever. Retention and compaction must preserve sufficient referential lineage
to understand remaining historical Prescription → Session → Execution →
Outcome relationships. Deletion/compaction is purpose-aware; age alone does
not determine whether domain evidence may be discarded. Operational retry and
transport history may be compacted/deleted under operational retention if
domain truth and unresolved conflicts remain preserved.

Where payload may be deleted/compacted but referential lineage is still
required, a minimal non-personal marker/tombstone may remain where necessary.
This does not permit retaining attributable personal data contrary to
deletion/privacy policy. Immutability is not infinite retention.

The Owner-approved conceptual account lifecycle is:

```text
ACTIVE → PENDING_DELETION → DELETED
```

A deletion request begins a 30-day grace period. Return/login does not
automatically cancel deletion; the user must explicitly choose recovery. If
they do not confirm, the original deadline remains and is not restarted. A
later deletion request after successful recovery begins a new lifecycle. At
expiration, deletion of attributable personal/user data is intended to be
irreversible.

AHF may retain learning/improvement data only after it validly crosses the
future approved irreversible de-identification/aggregation boundary. Removing
`user_id` alone is insufficient. Once data has validly crossed that boundary,
it is no longer part of that User's User Profile, Training Profile, or Training
History; it must not retain usable reverse lineage capable of reconnecting it
to the deleted User. Later insights/derivatives from that anonymous dataset
belong to the learning/improvement system, not the deleted User's
profile/history:

```text
Identifiable User Data
→ approved irreversible de-identification boundary
→ Anonymous Learning Data

Anonymous Learning Data ✕→ Deleted User
```

This does not define de-identification algorithms, data eligibility,
consent/notice, legal basis, privacy implementation, or retention duration.

## 11. Explicitly unresolved and cross-gate requirements

This contract does not resolve:

- physical database/storage model, schema, UUID/ID representation, or
  API/transport representation;
- local/server storage technology, event-sourcing implementation,
  transaction mechanism for `START`, Draft persistence, execution-package
  serialization, or backup purge;
- sync/outbox/idempotency protocol, checkpoint implementation,
  exact-state recovery implementation, authority lease/takeover mechanism,
  conflict-reconciliation algorithm, or detailed reconciliation UX;
- legal retention duration, de-identification implementation/eligibility,
  consent/notice, legal basis, training/improvement data policy, or privacy
  treatment;
- detailed User/Training Profile, Set Result, or Workout Outcome schema,
  date-of-birth representation, or attribute-level authority rules;
- workout-day/timezone identity, adherence/scoring formula, Skip Rest
  capability, or a separate permanent End Workout action;
- Restart Current Set existence or attempt schema;
- detailed Skip/substitution/Defer policy, skip-reason taxonomy, adjustment
  schema/provenance taxonomy, or allowed-substitution validation;
- Streak Credit Policy, Freeze economics, Streak eligibility formula,
  anti-abuse mechanism, or medical/safety policy;
- account-sharing identity-confidence solution;
- dynamic AI re-planning capability, AI runtime/model, or other
  runtime/language/framework/database choices.

Explicit unresolved requirements remain routed as follows:

- `ACCOUNT_SHARING_IDENTITY_CONFIDENCE` and privacy, de-identification, and
  account-deletion implementation concerns →
  `OWNER_GATE_PRIVACY_SENSING_ACCOUNT_LIFECYCLE@v0`.
- `STREAK_CREDIT_POLICY` → the appropriate future Product/Engagement contract.
  It must address unfair Streak loss after meaningful participation and
  legitimate inability while preventing trivial Start → arbitrary Skip →
  automatic credit abuse. It may consider context, meaningful participation,
  and legitimate inability; it does not assume fixed exercise/percentage
  thresholds, medical or sensing/camera proof, or surveillance-oriented
  verification. No new Owner gate is created by this decision.

No item is resolved merely by its appearance in this list or by the fact that
the Identity/Persistence Owner gate is now resolved.

## Historical-evidence boundary

The interim checkpoint and Legacy Knowledge Index informed this consolidation;
they remain evidence and are not architecture or implementation authority.
No legacy code, schema, dependency, state machine, tool, or architecture is
adopted by this decision.
