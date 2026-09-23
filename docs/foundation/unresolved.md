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
- whether Restart Current Set exists as a product capability
- whether Skip Rest exists
- whether a separate permanent End Workout action exists in addition to Exit
- detailed Skip/Defer policy ownership
- Workout Passport serialization/schema
- local persistence implementation
- sync/outbox/idempotency mechanics
- multi-device takeover/reconciliation mechanics
- workout-day/timezone identity mechanics
- adherence/scoring formulas
- UX state/screen decisions
- AI/planner implementation

## Clean-Start completeness gates

The following Owner gates remain explicitly **UNRESOLVED**:

- Identity and Persistence boundary resolution
- Privacy, Sensing, and Account Lifecycle resolution
- UX, Design, Localization, Accessibility, and Performance resolution
- Architecture, Operations, and Tooling boundary resolution

The Execution, Outcome, and Recovery Owner gate and v0 contract are
**RESOLVED** in
[`decisions/execution-outcome-recovery-contracts-v0.md`](decisions/execution-outcome-recovery-contracts-v0.md).
The remaining boundary decisions and the final Clean-Start Foundation Baseline
are not resolved; their machine-readable output placeholders remain **DRAFT**.
The repository-native DAG records their prerequisites and must not resolve them
automatically.
