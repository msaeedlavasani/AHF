# UX Experience / Interaction Model Owner Decision Checkpoint

**Status: UNRESOLVED**

**Checkpoint status: OWNER-APPROVED INTERIM CHECKPOINT**

**Version: v0**

**Artifact ID: `OWNER_GATE_UX_EXPERIENCE_INTERACTION_CHECKPOINT@v0`**

**Owner gate: `OWNER_GATE_UX_DESIGN_LOCALIZATION_ACCESSIBILITY_PERFORMANCE@v0` — UNRESOLVED**

## Purpose and authority boundary

The first checkpoint recorded Owner-approved UX decisions #111–#120 and the
explicit resolution of two previously open active-Workout control questions.
The second checkpoint below adds decisions #121–#130 and its focused
Experience / Interaction Model gap review.
The earlier proposed UX Checkpoint 1 was stopped before publication; it
canonicalized nothing. The superseded *unresolved status* of those questions
is preserved in Git history and identified in the earlier Execution and
Identity contracts. This checkpoint is the current authority for their
rejection, not a resolution of the entire UX Owner gate.

Checkpoint 1 state at publication (retained as history):

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

## Checkpoint 1 remaining Foundation boundaries

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

## Checkpoint 2 — Experience / Interaction Model, Part 2

The following Owner-approved decisions extend the same interim UX checkpoint.
They do not resolve the overall UX Owner gate or authorize implementation.

### #121 — Mentor is guidance, not execution authority

**Status: RESOLVED.** Mentor may provide explanation, demonstration,
coaching cues, and feedback. Mentor does not independently determine,
rewrite, or override the Prescription, Workout Passport, execution truth, or
completion truth.

### #122 — Mentor availability is not a Workout dependency

**Status: RESOLVED.** Mentor rendering, animation, 3D assets, voice coaching,
or equivalent presentation must not be required for base Workout execution.
Mentor presentation failure or unavailability degrades gracefully without
invalidating the Workout. Mentor technology remains deferred.

### #123 — Coaching respects evidence certainty

**Status: RESOLVED.** Mentor and other coaching must not state an observed
performance or form conclusion with greater certainty than the available
evidence supports. Unobserved / Unknown remains distinct from Observed
Invalid. Exact coaching language remains deferred.

### #124 — Guidance and observation are semantically distinct

**Status: RESOLVED.** General guidance or cues remain distinguishable from
claims about what the User actually did. “Keep your knees aligned” is
guidance; “Your knee moved inward” is an observed claim requiring applicable
evidence. Presentation may combine them conversationally but must not
fabricate observation.

### #125 — Automatic progression requires valid execution authority

**Status: RESOLVED.** Hands-free UX does not grant arbitrary UI progression
authority. Automatic transition is allowed only when canonical execution
rules establish that the current obligation and state permit it. UI timing
alone is not domain authority.

### #126 — Transition communication preserves current versus upcoming truth

**Status: RESOLVED.** Countdowns, previews, animations, Mentor cues, and
similar presentation must not portray an upcoming state as though the
canonical transition already occurred. UX may preview what comes next while
distinguishing current execution state from upcoming state.

### #127 — Pause freezes progression, not completed work

**Status: RESOLVED.** Pause stops applicable active progression while
preserving work already performed in the live execution. Resume continues
that same execution. Neither action creates or restarts a Set, rewrites the
Prescription, or erases completed progress. The canonical active-time rule
for `TIME_BASED` Sets remains binding.

### #128 — Recoverable technical failure is not Workout failure

**Status: RESOLVED.** Recoverable Mentor asset, sensing, network, or
UI/runtime failure must not automatically be represented as Set or Workout
failure unless the domain contract independently establishes such failure.
UX preserves a valid execution path where possible. Exact error UI remains
deferred.

### #129 — Exit is participation control, not Prescription editing

**Status: RESOLVED.** Exit Workout is a valid User participation control
governed by the canonical persistence and outcome semantics. It does not mean
the Prescription obligation never existed, natural completion occurred, the
Prescription was edited, or historical execution was erased.

### #130 — Workout feedback does not rewrite the issued Passport

**Status: RESOLVED.** Workout feedback and evidence may inform coaching and
later adaptation. They must not silently rewrite the immutable issued
Workout Passport. Adaptation affects future Program or Prescription under
canonical domain rules.

## Checkpoint 2 consistency and gap review

Decisions #111–#130 were reviewed together against the resolved Product
Constitution, Execution / Outcome / Recovery, Identity / Persistence, and
Privacy / Sensing contracts. The resulting interaction contract does not
make Mentor a Workout dependency or Prescription authority; make UI state
domain authority; equate sensing or recoverable presentation failure with
Workout failure; create or restart a Set through Pause, Resume, or recovery;
permit automatic progression without domain authority; equate Exit with
completion; or allow feedback to mutate the issued Passport. The Checkpoint 1
rejection of Skip Rest and Restart Current Set remains binding.

The Foundation-level gaps identified after Checkpoint 1 are addressed:
Mentor's role and availability (#121–#124), progression and transition
communication (#125–#126), interruption and recoverable failure (#127–#128),
User versus system initiative (#125, #129), and evidence-bounded feedback
(#123–#124, #130). No remaining **Foundation-semantic** gap in this category
was identified. Detailed UI, copy, technology, and implementation remain
deferred; this closure does not make them ready.

```text
EXPERIENCE_INTERACTION_MODEL = FOUNDATION-COMPLETE
OWNER_GATE_UX_DESIGN_LOCALIZATION_ACCESSIBILITY_PERFORMANCE@v0 = UNRESOLVED
OWNER_GATE_ARCHITECTURE_OPERATIONS_TOOLING@v0 = UNRESOLVED
```

`DESIGN_SYSTEM_CROSS_SCREEN_CONSISTENCY`, `LOCALIZATION`, `ACCESSIBILITY`,
and `UX_PERFORMANCE_PERCEIVED_PERFORMANCE` are not resolved by this category
closure. The Privacy Owner gate remains **RESOLVED**. Implementation is not
authorized.

Checkpoint 2 canonicalizes decisions #121–#130. Its pre-checkpoint decision
count of 10 resets to **zero** on publication under the existing checkpoint
convention; Checkpoint 1's decision numbering and historical status remain
preserved above.
