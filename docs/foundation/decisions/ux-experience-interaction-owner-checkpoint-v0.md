# UX Experience / Interaction Model Owner Decision Checkpoint

**Status: UNRESOLVED**

**Checkpoint status: OWNER-APPROVED INTERIM CHECKPOINT**

**Version: v0**

**Artifact ID: `OWNER_GATE_UX_EXPERIENCE_INTERACTION_CHECKPOINT@v0`**

**Owner gate: `OWNER_GATE_UX_DESIGN_LOCALIZATION_ACCESSIBILITY_PERFORMANCE@v0` — UNRESOLVED**

## Purpose and authority boundary

This checkpoint records Owner-approved UX decisions #111–#120 and the
explicit resolution of two previously open active-Workout control questions.
The earlier proposed UX Checkpoint 1 was stopped before publication; it
canonicalized nothing. The superseded *unresolved status* of those questions
is preserved in Git history and identified in the earlier Execution and
Identity contracts. This checkpoint is the current authority for their
rejection, not a resolution of the entire UX Owner gate.

```text
EXPERIENCE_INTERACTION_MODEL = IN_PROGRESS
SKIP_REST = REJECTED
RESTART_CURRENT_SET = REJECTED
OWNER_GATE_UX_DESIGN_LOCALIZATION_ACCESSIBILITY_PERFORMANCE@v0 = UNRESOLVED
```

These decisions do not select UI, components, state-management architecture,
schema, sensing technology, or implementation. The old Apex-Home-Fitness
repository remains evidence only, not design authority.

## Owner resolution of active-Workout controls

**Skip Rest — REJECTED.** Prescribed Rest is part of the Workout Prescription
and training obligation, not merely waiting UI. The User must not remove
prescribed Rest ad hoc during active execution. A future valid Prescription
or Adaptation mechanism may prescribe different Rest; that does not authorize
the User to redesign Rest in the active Workout. This does not prohibit Exit
Workout.

**Restart Current Set — REJECTED.** An ad-hoc restart may introduce training
volume outside the issued Prescription. Pause preserves the live Set, Resume
continues that same Set, sensing loss alone does not fail it, and recovery
uses canonical execution state or valid deterministic reconstruction. No
equivalent restart/reset control is introduced under another name.

The governing principle is: User control over execution does not imply User
authority to redesign the Prescription during execution.

## #111 — Workout UX follows Prescription

**Status: RESOLVED.** Workout UX represents and guides execution of the
issued Workout Passport / Prescription. UI must not rewrite historical
Prescription for presentation or interaction convenience. Presentation may
adapt without changing domain truth.

## #112 — Execution state is domain truth, not screen truth

**Status: RESOLVED.** Workout execution state must not be inferred merely
from the current screen, route, component, or visual stage. Screen
representation follows canonical execution state; the screen is not the
authoritative state machine. State-management architecture is deferred.

## #113 — Base Workout UX survives sensing absence

**Status: RESOLVED.** Camera, AI, pose estimation, and other sensing are
optional enhancements. Absence, denial, loss, or failure of sensing must not
prevent base Workout execution. UX must provide a valid non-sensing path,
consistent with the Privacy and Execution contracts.

## #114 — REP_BASED and TIME_BASED are first-class UX modes

**Status: RESOLVED.** `REP_BASED` and `TIME_BASED` are first-class
execution/UX capabilities. Neither is merely a fallback or incidental
workaround for the other. The applicable issued Prescription / Workout
Passport determines the prescribed mode under canonical domain rules.

## #115 — Prescribed, performed, and observed quality remain distinct

**Status: RESOLVED.** UX must distinguish prescribed target, performed
attempts/progress, and observed validity/quality. A target of 10 with 10
performed and 8 observed valid must not be represented as only 8 performed.
Unobserved / Unknown is distinct from Observed Invalid. Exact visual
representation remains deferred.

## #116 — Hands-free is the primary active-Workout interaction model

**Status: RESOLVED.** Normal active Workout execution should be primarily
hands-free wherever the system can legitimately progress without repeated
touch interaction. Touch remains available where genuinely required.
Hands-free operation must not fabricate sensing, invent certainty, alter
Prescription, or silently make consequential User decisions. Interaction
technology remains deferred.

## #117 — User control does not imply Prescription control

**Status: RESOLVED.** User agency over execution is distinct from authority
to redesign the issued Workout Prescription during execution. Approved User
controls are Pause, Resume, and Exit Workout. Skip Rest and Restart Current
Set are **REJECTED** for the reasons recorded above.

This does not approve Skip Set, Skip Exercise, Extend Rest, Reduce Rest, or
arbitrary Prescription editing; those retain their actual canonical status
and applicable policy boundaries. User agency does not make the User the
active Workout programmer.

## #118 — User action and automatic progression remain distinguishable

**Status: RESOLVED.** UX/execution semantics preserve the cause of
domain-significant transitions: natural/automatic progression, explicit
User action, and system/recovery progression where materially relevant.
Exit Workout must not be represented as natural Workout completion. Exact
event schema remains deferred.

## #119 — UX must not fabricate certainty

**Status: RESOLVED.** When evidence cannot establish an observation, UX
must not present Valid, Invalid, or Failed as though that observation
occurred. Unobserved / Unknown remains distinct from Observed Invalid.
Exact labels and copy remain deferred to later UX/Localization work.

## #120 — Recovery UX follows canonical execution state

**Status: RESOLVED.** After interruption, reload, crash, reopen, or similar
recovery, UX resumes from canonical recoverable execution state or valid
deterministic reconstruction under the Execution/Recovery contract. The
last visible screen does not reconstruct domain truth. Attempt exact state
when valid; otherwise use the latest valid durable checkpoint and
deterministic reconstruction. Persistence and state-management technology
remain deferred.

## Remaining Foundation boundaries

`EXPERIENCE_INTERACTION_MODEL` remains **IN_PROGRESS**. Further gap analysis
includes the Mentor UX role/boundary, interruption and error communication,
progression and transition communication, system versus User initiative,
feedback boundaries, and other cross-state interaction invariants.

`DESIGN_SYSTEM_CROSS_SCREEN_CONSISTENCY`, `LOCALIZATION`, `ACCESSIBILITY`,
and `UX_PERFORMANCE_PERCEIVED_PERFORMANCE` are not resolved here. The UX and
Architecture Owner gates remain **UNRESOLVED**. The Privacy Owner gate stays
**RESOLVED**. Product implementation is not authorized.

This checkpoint canonicalizes decisions #111–#120. The pre-checkpoint count
of 10 is reset to **zero** on publication using the existing checkpoint
convention; the two control-question resolutions do not create duplicate
decision numbers.
