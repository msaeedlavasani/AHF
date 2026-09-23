# Privacy, Sensing, and Account Lifecycle Owner Decision Checkpoint

**Status: UNRESOLVED**  
**Checkpoint status: OWNER-APPROVED INTERIM CHECKPOINT**  
**Version: v0**  
**Artifact ID: `OWNER_GATE_PRIVACY_SENSING_ACCOUNT_LIFECYCLE_CHECKPOINT@v0`**  
**Owner gate: `OWNER_GATE_PRIVACY_SENSING_ACCOUNT_LIFECYCLE@v0` — UNRESOLVED**

## Purpose and authority boundary

This checkpoint preserves Owner-approved and derived Privacy, Sensing, and
Account Lifecycle decisions reached so far. It is canonical input to the
remaining Owner-gate discussion and its eventual resolution task.

This checkpoint does **not** resolve
`OWNER_GATE_PRIVACY_SENSING_ACCOUNT_LIFECYCLE@v0`, does not resolve
`PRIVACY_SENSING_AND_ACCOUNT_LIFECYCLE@v0`, and does not authorize product
implementation.

No sensing, camera, AI, account, storage, schema, architecture, or privacy
mechanism is selected here. Unresolved jurisdictional and legal questions
remain open for appropriate review.

## 1. Data classification follows meaning and purpose

Data classification must not be inferred merely from storage location. The
model must be capable of distinguishing at least:

- Personal/Account Data;
- Training Data;
- Sensing Evidence;
- Derived Assessment;
- Operational/Sync Data; and
- Anonymous Learning Data.

This is a capability requirement, not a final taxonomy. The complete
classification taxonomy remains deferred.

## 2. Sensing is an optional enhancement capability

Camera, AI, or other sensing may improve Workout execution but is not
inherently required for the base Workout to remain executable.

If a future Prescription requires a particular sensing capability, that
requirement and its fallback/policy must be explicit. It must not emerge as an
accidental mid-Workout failure.

## 3. Permission, consent, capability, and evidence are distinct

The following are distinct states and must not be conflated:

- operating-system permission;
- product/privacy acceptance;
- actual sensing availability/readiness; and
- resulting observation or evidence.

## 4. Sensing data minimization

If derived sensing evidence is sufficient for a defined purpose, raw frames
or video must not be retained indefinitely merely because they may become
useful later.

Additional retention requires an explicit purpose and applicable future
privacy/legal treatment.

## 5. Unobserved is not invalid

Failure or absence of sensing must not fabricate factual evidence. For
example:

```text
valid reps = unobserved/unknown
```

must remain distinguishable from:

```text
valid reps = observed invalid
```

## 6. Account lifecycle and Training History lifecycle are distinct

`PENDING_DELETION` does not immediately rewrite historical Training truth.

After the approved deletion boundary, attributable User data follows the
resolved [Identity and Persistence Boundaries v0 contract](identity-and-persistence-boundaries-v0.md).
Only data that validly crossed the approved irreversible de-identification
boundary may remain independently as Anonymous Learning Data. This
cross-reference does not select a de-identification implementation or change
the Privacy gate's unresolved status.

## 7. Sensing benefit and eligible-learning-contribution product bundle

AHF may define Camera/Sensing enhancement as an optional product capability
whose activation transparently includes both:

- sensing/analysis benefits for that User; and
- eligible contribution of applicable sensing-derived data to AHF
  system/model improvement.

The User must receive clear disclosure before activation. If the bundle is
declined, Camera/Sensing enhancement remains OFF and the base Workout remains
executable without it.

AHF is not required to offer a product mode where a User receives
Camera/Sensing enhancement while necessarily opting out of all eligible
model/system-improvement contribution. The purposes remain distinct
internally for data classification, minimization, retention, security,
deletion, governance, and legal/privacy assessment.

This decision does not imply that raw video must be uploaded or retained.
Jurisdiction-specific legality, legal basis, consent granularity, legality of
bundled activation, and whether some jurisdictions require purpose separation
remain UNRESOLVED pending privacy/legal review.

## 8. Raw camera data is not Training History by default

Raw camera frames/video are not automatically permanent Training History
merely because they were processed during a Workout. Domain-significant
derived/factual evidence may become Training History under the relevant
contracts. Raw-data retention requires its own valid purpose and policy.

## 9. Prefer local sensing processing where sufficient

Where on-device/local processing can satisfy the product requirement, it is
preferred as a privacy/data-minimization direction. This is not an architecture
mandate and does not resolve local-only inference, cloud inference, hybrid
inference, model/runtime/framework, or hardware requirements. Those remain for
later Architecture/Tooling decisions.

## 10. Model-improvement pipeline is purpose-separate

Eligibility for sensing/model-improvement contribution does not mean that all
available data is automatically retained or admitted into a learning dataset.

Model-improvement data must pass future applicable rules for eligibility,
purpose, minimization, retention, privacy/legal treatment, and
deletion/de-identification. “Potentially useful to AI later” is not by itself
a sufficient retention purpose.

## Explicitly unresolved and routed

This checkpoint does not decide:

- legal basis for each processing purpose;
- jurisdiction-specific consent requirements;
- legality and consent granularity of bundled sensing activation;
- jurisdictional requirements for purpose separation;
- final sensing/data classification taxonomy;
- raw video/frame retention policy;
- upload policy;
- model-training dataset eligibility;
- de-identification implementation;
- retention durations;
- encryption/security implementation;
- camera/sensing architecture;
- local/cloud/hybrid inference;
- biometric or identity interpretation;
- Account Sharing Identity Confidence solution;
- minors/age policy if not resolved elsewhere; or
- Terms/Privacy notice implementation.

The existing `ACCOUNT_SHARING_IDENTITY_CONFIDENCE` requirement remains
unresolved and routes here for future Privacy/Sensing/Account Lifecycle review.
The resolved Identity/Persistence contract remains authoritative for deletion
and anonymous-data ownership boundaries; implementation and legal treatment
remain unresolved. This checkpoint does not resolve any other Owner gate.
