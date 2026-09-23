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

## Second interim checkpoint

The following Owner-approved and derived decisions extend this same
checkpoint. They do not resolve the Owner gate or authorize its downstream
resolution task.

## 11. Privacy is non-negotiable; data utility is not its enemy

Privacy is a non-negotiable product constraint for AHF, not merely a compliance
task. Within valid privacy/legal boundaries, AHF should prefer designs that
create legitimate reciprocal value for the User and the AHF ecosystem.

The conceptual decision order is:

```text
Privacy boundary
→ legitimate purpose
→ mutual-value design
→ minimization
→ implementation
```

Privacy does not automatically require discarding all potentially useful
data. Where AHF has a legitimate data need, first evaluate whether a
privacy-preserving transformation can remove the privacy obstacle while
retaining useful learning value. Ecosystem benefit never overrides the
privacy boundary itself.

## 12. Privacy-preserving learning boundary

AHF intends to support this conceptual boundary:

```text
Operational User / Workout / Sensing Data
→ eligibility + privacy transformation
→ Anonymous Learning Data / Learning Lab
```

Where useful data can validly and irreversibly be separated from User identity,
prefer preserving its legitimate learning value rather than unnecessarily
destroying it. Merely attaching an “anonymous” label or removing `userId` is
not sufficient. The transformation must eventually satisfy approved
de-identification/privacy requirements; exact mechanisms remain deferred.

## 13. Operational data and Learning Lab are distinct purpose/trust domains

Operational Workout/User data and Anonymous Learning Data are different
purpose/trust domains. Authorization to access operational data does not
automatically authorize access to learning datasets, and authorization to
access learning datasets does not automatically authorize access to
operational data.

This does not decide physical infrastructure or storage topology.

## 14. Anonymous Learning Data must not depend on User identity

After valid irreversible de-identification, the usefulness of an Anonymous
Learning artifact must not depend on a usable mapping such as:

```text
User ID → Anonymous Learning Record
```

If reverse linkage is required, the artifact has not crossed the intended
anonymous-learning boundary.

## 15. Account deletion does not reach back into validly anonymous data

Attributable User data remains subject to the resolved Account deletion
lifecycle. Data that validly and irreversibly crossed the approved
de-identification boundary before deletion is no longer part of the User
Profile, Training Profile, or Training History and is not looked up or mutated
through the deleted User.

This is consistent with the resolved [Identity and Persistence Boundaries v0
contract](identity-and-persistence-boundaries-v0.md), including its rule that
Anonymous Learning Data must not retain usable reverse linkage to the User.

## 16. Raw/high-risk research contribution uses a separate voluntary program

Raw image/video or similarly high-risk/rich sensing data intended specifically
for R&D/model research must not be inferred from ordinary Camera/Sensing
activation.

If AHF needs such data, the standard path is a separately disclosed voluntary
Research Program with informed opt-in, an explicit research purpose, disclosed
categories of contributed data, and appropriate future privacy/legal
controls. AHF may offer rewards/incentives for voluntary participation.

Declining Research participation does not by itself remove ordinary AHF
functionality the User is otherwise entitled to under the normal Sensing
contract.

## 17. Research participation is distinct from normal Sensing activation

Normal Camera/Sensing activation does not automatically constitute
participation in the separate raw/high-risk Research Program. Research
activation must be separately represented. Exact consent/legal implementation
remains deferred.

## 18. A reward does not purchase unlimited data rights

A Research reward is an incentive for participation/contribution. It does not
eliminate privacy boundaries, create unlimited data rights, expand the
disclosed purpose, replace required transparency, or remove applicable
retention/deletion/security obligations.

## 19. Research Dataset is distinct from Anonymous Learning Lab

A Research Dataset may contain richer, raw, sensitive, or still-identifiable
material and may require stricter controls and a different lifecycle. It is
not automatically Anonymous Learning Data. Only an artifact that validly
crosses the approved irreversible de-identification boundary may enter the
Anonymous Learning domain.

## 20. Research withdrawal stops future participation

A User must be able to stop future voluntary Research participation.
Withdrawal stops future contribution according to the eventual Research
lifecycle. Treatment of already-contributed attributable/controllable data
follows the future disclosed Research/privacy/retention policy.

AHF must not promise unrealistically that withdrawal can necessarily remove
the historical influence of data already incorporated into a trained model.
Exact legal withdrawal/deletion obligations remain subject to future
legal/privacy review.

## 21. Reward lifecycle is distinct from consent/participation lifecycle

Research participation/consent state and Research reward state are distinct.
Withdrawal does not silently rewrite reward history. No implementation state
machine is defined here.

## 22. Research reward is milestone-based

Merely opting into Research does not inherently earn a reward. The future
Research Program should define explicit contribution milestones before a
reward becomes earned. Possible stages include:

```text
Enrolled
→ Contribution Submitted
→ Qualified/Accepted
→ Reward Earned
```

These names are illustrative, not a frozen schema/state machine. Exact
qualification and economics remain deferred.

## 23. Earned reward is not automatically revoked by future withdrawal

Once a reward legitimately reaches its future defined Earned milestone, later
withdrawal from future Research participation does not inherently revoke that
reward. Possible exceptions such as fraud, abuse, or invalid contribution
require a separately defined future policy.

A reward that has not yet been earned may cease progressing when participation
or contribution stops.

## 24. Withdrawal must not create false technical promises

Withdrawal stops applicable future contribution. Attributable data still
under AHF control remains subject to its applicable future lifecycle. AHF
must distinguish deletion/withdrawal of controllable source data from
attempting to reverse influence already absorbed into a trained model.

Do not claim technical reversibility unless the future system actually
provides it and applicable policy requires/supports it.

## 25. Research participation is not a condition of normal AHF use

The separate voluntary Research Program must not become a prerequisite for
ordinary AHF use. A User who declines or later exits Research must not lose
ordinary Camera/Sensing functionality solely because of that Research
decision, provided the User still satisfies the normal Camera/Sensing product
contract.

## Raw image/video position

Raw camera imagery/video is not a default requirement for the ordinary
Anonymous Learning Lab. This does not resolve that raw imagery/video can never
be useful. If future evidence shows it is materially useful for R&D, the
default collection route is the separately reviewed voluntary Research
Program rather than silently expanding ordinary sensing collection.

Derived/non-identifying representations are the preferred ordinary learning
direction where they are sufficient.

The boundaries remain distinct:

```text
Normal Sensing
!= Voluntary Research Program
!= Anonymous Learning Lab
```

## Additional unresolved matters

This second interim checkpoint does not resolve:

- exact de-identification/anonymization algorithms;
- re-identification risk thresholds;
- jurisdictional legal definition of anonymous data;
- legal basis for processing;
- jurisdiction-specific consent requirements;
- legality/granularity of the ordinary Sensing + eligible-learning bundle;
- Research consent wording;
- Research withdrawal legal requirements;
- Research source-data deletion requirements;
- trained-model unlearning requirements/capability;
- raw image/video retention periods;
- Research Dataset retention;
- Learning Lab retention;
- Research Dataset security architecture;
- physical separation of operational/research/learning stores;
- access-control implementation;
- encryption implementation;
- exact dataset eligibility rules;
- exact Research Program eligibility;
- reward type/value/economics;
- reward milestone implementation;
- reward revocation policy;
- fraud/abuse policy;
- minors participating in Research;
- biometric interpretation;
- camera/sensing runtime architecture;
- local/cloud/hybrid inference;
- AI/model/runtime/framework choices;
- Account Sharing Identity Confidence solution; and
- Terms/Privacy notice implementation.

These additions preserve the first checkpoint's unresolved matters and do not
resolve the Privacy/Sensing/Account Lifecycle Owner gate or any other Owner
gate.
