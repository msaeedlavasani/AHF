# Unresolved Foundation Matters

**Status: UNRESOLVED**

The following matters are explicitly unresolved. They must not be guessed, silently selected, or implicitly settled by implementation:

- database technology
- application framework
- frontend framework
- backend architecture
- deployment architecture
- exact persistence schema
- API design
- state-management implementation
- workout state machine
- checkpoint implementation
- exact-state recovery implementation
- camera implementation
- pose implementation
- AI/model architecture
- Laya adoption
- XState adoption
- Storybook adoption
- Spec Kit adoption
- design-token tooling
- CI architecture
- orchestration implementation
- Exercise Obligation as an independent domain entity
- exact Set Result schema
- exact Workout Outcome schema
- adaptation algorithm/policy
- legal retention duration and backup purge mechanics
- de-identification implementation
- training/improvement data privacy implementation
- ACCOUNT_SHARING_IDENTITY_CONFIDENCE mechanisms (including accidental or
  deliberate sharing, attribution uncertainty, and contaminated-profile recovery)
- FAMILY_PLAN_AND_ENTITLEMENT_POLICY
- AGE_ELIGIBILITY_AND_VERIFICATION mechanisms and jurisdictional thresholds
- FUTURE_MINOR_GUARDIAN_MODEL
- legal basis for each processing purpose and jurisdiction-specific consent requirements
- legality/consent granularity of bundled sensing activation, including jurisdictions requiring purpose separation
- sensing/data classification taxonomy and raw video/frame retention policy
- exact derived-sensing evidence retention and raw/intermediate buffer lifetimes
- retention/deletion treatment of previously collected attributable sensing
  data that is neither valid Anonymous Learning Data nor required as durable
  factual Training History
- exact Ordinary Sensing policy-change/re-acceptance requirements by applicable
  jurisdiction, legal basis, and materiality
- sensing provenance and observation-state representation
- raw-media failure cleanup and crash-recovery behavior
- User correction/contestation UX and evidence/conflict weighting
- upload policy and model-training dataset eligibility
- encryption/security implementation and camera/sensing architecture
- local/cloud/hybrid inference and hardware requirements
- biometric/identity interpretation and minor age/consent rules beyond the
  resolved Adult-only v1 scope
- Terms/Privacy notice implementation
- exact de-identification algorithms, re-identification thresholds, and
  jurisdictional definition of anonymous data
- Research consent wording and withdrawal/source-data deletion requirements
- disposition of previously collected attributable Research source data after
  withdrawal under a future Research Retention & Deletion contract
- trained-model unlearning capability or obligations
- raw research imagery retention, Research Dataset/Learning Lab retention,
  and dataset/Research Program eligibility
- Research Dataset security, access control, and physical store separation
- research reward type/value, qualification milestones, revocation, and
  fraud/abuse policy
- Minor Research support after v1
- Streak Credit Policy, Freeze economics, eligibility formula, and anti-abuse policy
- physical transaction mechanism for `START`
- Draft persistence and execution-package serialization
- user-meaningful persistence failure UX
- date-of-birth representation and detailed User/Training Profile schema
- whether a separate permanent End Workout action exists in addition to Exit
- detailed Skip/Defer policy ownership
- Workout Passport serialization/schema
- local persistence implementation
- sync/outbox/idempotency mechanics
- multi-device authority lease/takeover protocol and reconciliation mechanics
- workout-day/timezone identity mechanics
- adherence/scoring formulas
- UX state/screen decisions
- AI/planner implementation

## Clean-Start completeness gates

The following Owner gates remain explicitly **UNRESOLVED**:

- UX, Design, Localization, Accessibility, and Performance resolution
- Architecture, Operations, and Tooling boundary resolution

The Privacy, Sensing, and Account Lifecycle Owner gate and v0 contract are
**RESOLVED** in
[`decisions/privacy-sensing-account-lifecycle-v0.md`](decisions/privacy-sensing-account-lifecycle-v0.md).
Its interim checkpoint remains preserved as historical Owner-decision evidence
in [`decisions/privacy-sensing-account-lifecycle-owner-checkpoint-v0.md`](decisions/privacy-sensing-account-lifecycle-owner-checkpoint-v0.md).
The legal, policy-specific, security-implementation, and architecture details
listed above remain **UNRESOLVED** despite the Foundation semantic gate closure.

The Identity and Persistence Owner gate and v0 contract are **RESOLVED** in
[`decisions/identity-and-persistence-boundaries-v0.md`](decisions/identity-and-persistence-boundaries-v0.md).
Its interim Owner checkpoint remains preserved as historical decision evidence
in [`decisions/identity-persistence-owner-checkpoint-v0.md`](decisions/identity-persistence-owner-checkpoint-v0.md).

The Execution, Outcome, and Recovery Owner gate and v0 contract are also
**RESOLVED** in
[`decisions/execution-outcome-recovery-contracts-v0.md`](decisions/execution-outcome-recovery-contracts-v0.md).
The previously open Skip Rest and Restart Current Set questions are now
**REJECTED** by the Owner in the
[UX Experience / Interaction checkpoint](decisions/ux-experience-interaction-owner-checkpoint-v0.md);
the earlier unresolved statements in the Execution and Identity contracts
are historical, not current open questions. The UX Owner gate remains
**UNRESOLVED**. UX Checkpoint 2's focused review marks
`EXPERIENCE_INTERACTION_MODEL` **FOUNDATION-COMPLETE**. UX Checkpoint 4's
focused review also marks `DESIGN_SYSTEM_CROSS_SCREEN_CONSISTENCY`
**FOUNDATION-COMPLETE**, while preserving
`MENTOR_LAYOUT_MODEL = CONTEXTUAL_ADAPTIVE` and
`ORIENTATION_MODEL = RESPONSIVE_CAPABILITY_WITHOUT_UNIVERSAL_ORIENTATION_PARITY`.
UX Checkpoint 5 marks `LOCALIZATION` **FOUNDATION-COMPLETE**, with `en` and
`fa` as first-class locales and live locale change without execution reset.
UX Checkpoint 6 marks `ACCESSIBILITY` **FOUNDATION-COMPLETE**, without
altering Prescription or execution truth. UX Performance remains open.
Translation technology, exact copy, catalog format, routing, and fallback
implementation remain deferred. Exact Accessibility thresholds, standards
version, metadata, keyboard mappings, and tooling remain deferred.
The checkpoint does not canonicalize old prototype geometry or authorize
implementation.
The remaining boundary decisions and the final Clean-Start Foundation Baseline
are not resolved; their machine-readable output placeholders remain **DRAFT**.
The repository-native DAG records their prerequisites and must not resolve them
automatically.

Cross-gate unresolved requirements remain explicit:
`ACCOUNT_SHARING_IDENTITY_CONFIDENCE` and privacy, de-identification, and
account-deletion implementation concerns remain deferred for later applicable
product, legal, security, and architecture work under the resolved Privacy
boundary. `STREAK_CREDIT_POLICY` is routed to an appropriate future
Product/Engagement contract; no Owner gate is invented here.
