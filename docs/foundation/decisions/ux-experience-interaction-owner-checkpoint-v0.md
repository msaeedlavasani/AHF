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
The third checkpoint below adds decisions #131–#140 for Design System /
Cross-Screen Consistency without closing that category.
The fourth checkpoint below adds decisions #141–#150 and its focused
Design System / Cross-Screen Consistency gap review.
The fifth checkpoint below adds Localization decisions #151–#160 and its
focused Foundation-semantic gap review.
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

## Checkpoint 3 — Design System / Cross-Screen Consistency, Part 1

The following Owner-approved decisions establish the first Foundation-level
Design System / Cross-Screen Consistency contract. They do not specify screen
layouts, component technology, or implementation.

### #131 — One coherent Workout Experience Shell

**Status: RESOLVED.** Workout states belong to one coherent Workout
experience, not unrelated standalone pages. Applicable start/entry,
preparation, active execution, rest, results, pause, and exit-related
experiences preserve recognizable Session continuity. This does not require
identical layouts; exact shell geometry remains deferred.

### #132 — Domain-state changes do not justify arbitrary UX restructuring

**Status: RESOLVED.** Execution-state changes may legitimately change
content, emphasis, available information, and state-specific presentation.
They must not arbitrarily rebuild interaction grammar, hierarchy, or
navigation without a genuine state-specific need. Exact compositions remain
deferred.

### #133 — Cross-screen consistency is semantic, not pixel identity

**Status: RESOLVED.** Consistency does not require identical geometry or
composition across Workout states. State-appropriate layouts preserve a
coherent design language, hierarchy, control semantics, interaction grammar,
and Session continuity. Pixel-identical layouts are not required or frozen.

### #134 — Responsive adaptation preserves interaction meaning

**Status: RESOLVED.** Mobile, tablet, desktop, and future supported
viewports may adapt layout and geometry without silently changing the
semantic meaning or authority of controls and domain information. Exit
Workout remains the same domain action regardless of placement. Breakpoints
and responsive implementation remain deferred.

### #135 — Theme is presentation, not product structure

**Status: RESOLVED.** Dark, Light, and future themes may alter appropriate
presentation properties such as color, surfaces, lighting, and contrast.
Theme does not change domain state, Prescription, execution authority,
information meaning, or available product authority. Theme presentation
must satisfy later accessibility requirements. Exact tokens remain deferred.

### #136 — Reusable design-system vocabulary

**Status: RESOLVED.** Future implementation expresses recurring visual and
system decisions through reusable design-system vocabulary rather than
inventing independent styling per screen. Applicable concepts may include
typography, spacing, radii, surfaces, elevation, motion, component states,
and color/contrast roles. Token format, design-system or component library,
CSS technology, and UI framework remain unselected.

### #137 — Shared semantics require predictable component behavior

**Status: RESOLVED.** Controls or components with the same semantic role
behave and communicate state predictably across the Workout experience.
Context-specific presentation may differ, but semantic meaning must not
change covertly. Visual instances need not be identical.

### #138 — Workout-critical information has stable hierarchy

**Status: RESOLVED.** Across the Workout experience, the User can understand
without repeated relearning where they are, the current obligation,
relevant progress, and which actions are actually available. The hierarchy
stays coherent while state-specific composition changes. Placement,
typography, copy, and visual weight remain deferred.

### #139 — Mentor is contextual and spatially adaptive

**Status: RESOLVED.** The explicit Owner decision is:

```text
MENTOR_LAYOUT_MODEL = CONTEXTUAL_ADAPTIVE
```

Mentor is important guidance/presentation where relevant, not a mandatory
fixed-geometry structural slot. It may adapt to exercise geometry and
orientation, viewport, Workout state, available space, and other legitimate
presentation needs. A standing Squat may suit vertical full-body composition;
a floor Plank or Push-up may suit wider or horizontal composition. Mentor may
be smaller, secondary, or absent where appropriate.

Adaptation of Mentor composition does not license arbitrary reinvention of
the Workout Experience Shell, information hierarchy, or control semantics.
Mentor remains guidance, not execution authority or a base Workout
dependency.

### #140 — Exercise visualization accommodates exercise geometry

**Status: RESOLVED.** The Design System must not impose one universal fixed
aspect ratio, framing, or spatial composition on all exercise visualization.
It must accommodate vertical/standing, horizontal/floor, and future movement
geometry. This flexibility concerns presentation, not domain truth or
control authority. Camera framing, 3D parameters, aspect ratios, Mentor
dimensions, breakpoints, and animation implementation remain deferred.

## Checkpoint 3 consistency and historical-prototype boundary

Decisions #131–#140 preserve the Product Constitution, decisions #111–#130,
and the resolved Prescription / Execution, Mentor, and Privacy / Sensing
boundaries. Mentor is neither required for base Workout execution nor an
execution-state authority. No universal exercise framing or pixel-identical
Workout layout is imposed. Responsive adaptation and theme cannot change
control meaning or product authority. State-specific composition remains
within a coherent Workout shell.

An older prototype rule described as “Frozen Dark mobile geometry” is
historical design evidence only. It was not a Clean-Start Foundation rule and
is not made universally authoritative for Workout states, themes, or
viewports. No old prototype geometry is adopted by this checkpoint.

```text
EXPERIENCE_INTERACTION_MODEL = FOUNDATION-COMPLETE
DESIGN_SYSTEM_CROSS_SCREEN_CONSISTENCY = IN_PROGRESS
MENTOR_LAYOUT_MODEL = CONTEXTUAL_ADAPTIVE
OWNER_GATE_UX_DESIGN_LOCALIZATION_ACCESSIBILITY_PERFORMANCE@v0 = UNRESOLVED
OWNER_GATE_ARCHITECTURE_OPERATIONS_TOOLING@v0 = UNRESOLVED
```

Further Foundation-level Design System / Cross-Screen Consistency gap
analysis is required before category closure. `LOCALIZATION`,
`ACCESSIBILITY`, and `UX_PERFORMANCE_PERCEIVED_PERFORMANCE` are not resolved
here. The Privacy Owner gate remains **RESOLVED**. Product implementation is
not authorized.

Checkpoint 3 canonicalizes decisions #131–#140. Its pre-checkpoint decision
count of 10 resets to **zero** on publication under the existing checkpoint
convention. Earlier checkpoint content and numbering remain preserved.

## Checkpoint 4 — Design System / Cross-Screen Consistency, Part 2

These Owner-approved decisions extend the Clean-Start Foundation design
contract without choosing layouts, numerical dimensions, technology, or
implementation.

### #141 — Safe-area and viewport constraints are system-level concerns

**Status: RESOLVED.** The Workout Experience Shell accommodates applicable
device safe areas, viewport constraints, browser/application chrome,
supported orientation, and responsive geometry. Device geometry must not
make domain-critical information or consequential controls inaccessible.
Safe-area implementation and breakpoints remain deferred.

### #142 — Interactive target semantics differ from visible icon size

**Status: RESOLVED.** Visible icon or graphic size does not alone define the
interactive hit target. Controls provide reliable interaction targets
consistent with later Accessibility requirements. No numerical minimum is
frozen here; exact values belong to Accessibility and design specification.

### #143 — Domain-critical hierarchy outranks decoration

**Status: RESOLVED.** Mentor, backgrounds, illustrations, lighting, effects,
and other non-critical presentation must not obscure the current obligation,
relevant progress, or consequential controls. Mentor or exercise
visualization may receive strong emphasis while preserving access to that
domain-critical information. Exact visual weighting remains deferred.

### #144 — Adaptive exercise visualization preserves instruction

**Status: RESOLVED.** Contextual Mentor framing or cropping must not remove
body information materially required to understand the exercise. When
instruction depends on relevant body regions or whole-body alignment,
composition preserves that information. Camera parameters, framing, Mentor
scale, aspect ratio, and 3D technology remain deferred.

### #145 — Layout adaptation minimizes unnecessary discontinuity

**Status: RESOLVED.** Legitimate state or exercise changes may alter
composition, but stable information and controls should not move arbitrarily
without a genuine presentation need. The Design System reduces unnecessary
relearning or search during Workout transitions. This is continuity, not a
pixel-lock rule.

### #146 — Motion communicates state; it does not define domain state

**Status: RESOLVED.** Motion may communicate a canonical state change.
Animation completion is not domain-transition authority unless a future
explicit domain contract says otherwise. Workout correctness does not depend
on decorative or presentation animation success. The motion system remains
deferred.

### #147 — Component semantic states are explicit

**Status: RESOLVED.** Interactive components can clearly represent their
applicable semantic states without hidden ambiguity. Available, active,
disabled, loading, and unavailable are illustrative examples, not a frozen
universal state schema. Component specifications remain deferred.

### #148 — Degraded presentation remains coherent

**Status: RESOLVED.** Failure or unavailability of Mentor rendering, visual
assets, animation, or other non-critical presentation enhancements does not
destroy the coherent Workout Experience Shell. Critical execution
information and valid User controls remain usable under canonical domain
rules. Mentor, sensing, and presentation enhancement are not base Workout
execution authority.

### #149 — Orientation support is capability-driven, not symmetric by default

**Status: RESOLVED.** The explicit Owner decision is:

```text
ORIENTATION_MODEL = RESPONSIVE_CAPABILITY_WITHOUT_UNIVERSAL_ORIENTATION_PARITY
```

Foundation does not universally prohibit either portrait or landscape. It also
does not require equal portrait/landscape support for every Workout state on
every device class. Supported orientation behavior may later be specified by
device class, Workout use case, exercise/presentation need, and validated UX
requirements. This preserves responsive capability without imposing
universal design and testing parity. Exact support matrices remain deferred.

### #150 — Viewport and orientation changes do not change domain truth

**Status: RESOLVED.** Rotation, resize, viewport change, or equivalent
presentation geometry change does not by itself restart or create a Set,
alter performed progress, Prescription, or Workout Passport, create a new
execution state, or change completion truth. Presentation may recompose
around the same canonical execution state.

## Checkpoint 4 consistency and Design System gap review

Decisions #131–#150 were reviewed against Experience / Interaction
#111–#130 and the resolved Prescription, Execution, Recovery, Mentor, and
Privacy / Sensing boundaries. They do not impose portrait-only architecture
or universal orientation parity; let orientation changes restart execution;
fix Mentor aspect ratio; let Mentor obscure required execution information;
give decorative motion domain authority; equate icon size with hit-target
size; equate presentation failure with Workout failure; let responsive
adaptation mutate domain truth; or promote old prototype geometry to
Clean-Start authority. `MENTOR_LAYOUT_MODEL = CONTEXTUAL_ADAPTIVE` remains
binding.

The Foundation-semantic topics required for this category are addressed by
the two Design System checkpoints: shared Workout Shell and cross-state
consistency (#131–#133); responsive behavior and theme (#134–#135);
reusable vocabulary and component semantics (#136–#137, #142, #147);
information hierarchy and continuity (#138, #143, #145); contextual Mentor
and exercise geometry (#139–#140, #144); safe-area/viewport behavior (#141);
motion versus domain state (#146); degraded presentation (#148); and
orientation and viewport semantics (#149–#150). No remaining
**Foundation-semantic** gap was identified in Design System / Cross-Screen
Consistency. Exact visual specifications, accessibility values, support
matrices, technology, and implementation remain deferred; category closure
does not make them implementation-ready.

```text
EXPERIENCE_INTERACTION_MODEL = FOUNDATION-COMPLETE
DESIGN_SYSTEM_CROSS_SCREEN_CONSISTENCY = FOUNDATION-COMPLETE
MENTOR_LAYOUT_MODEL = CONTEXTUAL_ADAPTIVE
ORIENTATION_MODEL = RESPONSIVE_CAPABILITY_WITHOUT_UNIVERSAL_ORIENTATION_PARITY
OWNER_GATE_UX_DESIGN_LOCALIZATION_ACCESSIBILITY_PERFORMANCE@v0 = UNRESOLVED
OWNER_GATE_ARCHITECTURE_OPERATIONS_TOOLING@v0 = UNRESOLVED
```

`LOCALIZATION`, `ACCESSIBILITY`, and
`UX_PERFORMANCE_PERCEIVED_PERFORMANCE` remain open. The Privacy Owner gate
remains **RESOLVED**. Product implementation is not authorized.

Checkpoint 4 canonicalizes decisions #141–#150. Its pre-checkpoint decision
count of 10 resets to **zero** on publication under the existing checkpoint
convention. Earlier checkpoint content and numbering remain preserved.

## Checkpoint 5 — Localization

These Owner-approved decisions establish Foundation-level Localization
behavior without selecting translation technology, message formats, or
localized copy.

### #151 — Localization is product behavior, not post-build translation

**Status: RESOLVED.** Localization is part of product and UX behavior, not a
translation layer added after an English-specific interface is built.
Future UX and component architecture must be localization-aware. No
implementation technology is selected.

### #152 — English and Persian are first-class product locales

**Status: RESOLVED.** The initial canonical product locale scope is English
(`en`) and Persian (`fa`). Both are first-class product locales; neither is
a lower-quality translation-only version of the other. Later product
decisions may add future locales, but this checkpoint commits to none.

### #153 — Locale does not alter domain truth

**Status: RESOLVED.** Locale is presentation/context, not domain authority.
Changing it does not alter Prescription, Workout Passport, Workout Session
identity, execution state, performed progress, observed evidence,
Results/Outcome, or historical truth.

### #154 — RTL and LTR are system-level directionality semantics

**Status: RESOLVED.** Persian requires proper RTL support and English proper
LTR support. RTL is not merely ad-hoc text alignment; future UX and layout
implementation must support direction-aware composition. CSS and UI
mechanisms remain deferred.

### #155 — Directional adaptation preserves semantic meaning

**Status: RESOLVED.** RTL/LTR presentation may mirror or recompose
appropriate layout relationships without changing chronology, progress
meaning, execution or control authority, or domain state. Not every icon or
asset is assumed to mirror; direction-sensitive visuals follow their
semantic meaning. Exact asset and icon rules remain deferred.

### #156 — Localized content may change geometry

**Status: RESOLVED.** The Design System accommodates different localized
content lengths and geometry rather than treating English text dimensions
as universal. Labels, instructions, coaching, number/date/time presentation,
and other user-facing copy may require different space. Layout avoids
destructive truncation or semantic loss. Exact copy and typography remain
deferred.

### #157 — Domain identity is independent of localized labels

**Status: RESOLVED.** Canonical entities and states have stable semantic
identity independent of display names. “Squat” and “اسکات” can denote the
same Exercise identity. Language change creates no new domain entity and
does not corrupt persistence, execution, history, or analytics/evidence
relationships. Identifier schema remains deferred to Architecture.

### #158 — Historical truth is locale-independent

**Status: RESOLVED.** Historical and domain facts do not use localized
display strings as authoritative identity. A historical fact can later be
presented in another supported locale without rewriting the fact. Localized
display text is presentation, not historical identity.

### #159 — Guidance follows the active locale where capability exists

**Status: RESOLVED.** User-facing system, Mentor, and coaching guidance
should follow the active product locale where that capability exists. The
product must not claim unavailable localized capability. Missing optional
localized enhancement, such as future Mentor voice, does not invalidate the
base Workout. Translation and voice capability remain deferred; Mentor
presentation is not execution authority.

### #160 — Locale may change during the same live Workout Session

**Status: RESOLVED.** The explicit Owner decision is:

```text
LIVE_WORKOUT_LOCALE_CHANGE = ALLOWED_WITHOUT_EXECUTION_RESET
```

A User may switch between supported locales during an active Workout
without creating a new execution. Localized copy, directionality,
applicable layout, and available localized guidance may update while the
same Workout Session, issued Workout Passport, current obligation, Set/Rest
state, performed progress, active-time/timer truth, evidence, and Outcome
history remain intact. Locale change alone does not restart a Set or
Workout, create duplicate execution, reset progress, alter Prescription,
cause a domain transition, or erase evidence.

## Checkpoint 5 consistency and Localization gap review

Decisions #151–#160 were reviewed against the Product Constitution,
Experience / Interaction #111–#130, Design System #131–#150, and resolved
Prescription / Execution, Recovery, Identity / Persistence, and Privacy /
Sensing boundaries. They do not make English the domain language or Persian
a secondary locale; reduce RTL to alignment; mirror every visual by default;
use translated labels as entity IDs; change Session identity or reset
Set/Rest/progress/timer on a locale switch; mutate the issued Passport;
store historical truth only as localized display text; make optional
localized Mentor capability a Workout dependency; or make English text
geometry universal.

The required Foundation-semantic topics are covered: initial supported
locale scope (#152), RTL/LTR and directional meaning (#154–#155), domain
versus display identity and historical truth (#153, #157–#158), localized
geometry (#156), active-locale guidance (#159), and live Workout locale
changes without execution reset (#160). No remaining **Foundation-semantic**
Localization gap was identified. Message catalogs, routing, locale fallback,
exact copy, translation workflow, and implementation remain deferred; this
category closure does not make them implementation-ready.

```text
SUPPORTED_FOUNDATION_LOCALES = en, fa
LIVE_WORKOUT_LOCALE_CHANGE = ALLOWED_WITHOUT_EXECUTION_RESET
EXPERIENCE_INTERACTION_MODEL = FOUNDATION-COMPLETE
DESIGN_SYSTEM_CROSS_SCREEN_CONSISTENCY = FOUNDATION-COMPLETE
LOCALIZATION = FOUNDATION-COMPLETE
OWNER_GATE_UX_DESIGN_LOCALIZATION_ACCESSIBILITY_PERFORMANCE@v0 = UNRESOLVED
OWNER_GATE_ARCHITECTURE_OPERATIONS_TOOLING@v0 = UNRESOLVED
```

`ACCESSIBILITY` and `UX_PERFORMANCE_PERCEIVED_PERFORMANCE` remain open. The
Privacy Owner gate remains **RESOLVED**. Product implementation is not
authorized.

Checkpoint 5 canonicalizes decisions #151–#160. Its pre-checkpoint decision
count of 10 resets to **zero** on publication under the existing checkpoint
convention. Earlier checkpoint content and numbering remain preserved.
