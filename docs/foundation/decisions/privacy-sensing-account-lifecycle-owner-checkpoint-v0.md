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

## Third interim checkpoint

The following Owner-approved and derived decisions extend this same
checkpoint. They do not resolve the Owner gate or authorize its downstream
resolution task.

## 26. Authentication identity is not person/training identity

Authentication identifiers and mechanisms such as email, phone number,
OAuth/social login, credentials, and device access establish access to an
Account according to future authentication policy. They must not
automatically be treated as proof that every historical Workout/Training
observation was physically performed by the same human.

Exact authentication architecture remains deferred.

## 27. Identity uncertainty must not silently rewrite history

If AHF later has evidence that a Workout or observation may have been
performed by another person, historical evidence must not be silently
deleted, reassigned, or rewritten as certain. The system must be capable of
preserving attribution uncertainty/contestation where materially relevant.

This does not define schema or confidence scoring.

## 28. Sensing anomaly is not verified person identity

Signals such as materially different movement, body geometry, capability,
performance, or sensing characteristics may eventually contribute to
identity-confidence handling. They must not by themselves silently become a
factual assertion that a different person definitely used the Account.

## 29. Account-sharing protection must not require default surveillance

AHF must address misattributed Training data without making invasive identity
surveillance a default requirement. Foundation does not require facial
recognition, biometric identification, invasive device fingerprinting, or
continuous identity surveillance. Future explicitly reviewed mechanisms
remain possible.

## Superseded provisional multi-profile direction

The earlier provisional direction, “one Account/Household may contain
multiple personal Training Profiles,” is **SUPERSEDED** and must not become
the canonical model. Its historical existence and rationale are preserved:
it represented a provisional way to accommodate several people's private
training contexts under one household/account grouping. That historical note
does not establish an identity model, storage shape, or sharing permission.

## 30. One personal Account represents one private personal User/Training context

AHF should preserve a personal Account boundary around that person's:

- User Profile;
- Training Profile;
- Training History;
- sensing/privacy context; and
- Research participation context.

Do not design multiple people's private Training Profiles as ordinary sibling
profiles inside one shared personal Account. This is a product/domain boundary,
not a database cardinality or schema decision.

## 31. Future Family Plan links independent Accounts

If AHF later introduces Family/Household plans, the intended direction is:

```text
Family Plan / Subscription
→ independent Account A
→ independent Account B
→ independent Account C
```

The Family/Subscription relationship is primarily an entitlement/billing
relationship. It does not inherently merge members' private User Profiles,
Training Profiles, Training History, sensing data, Research data, or privacy
settings.

## 32. Family membership does not imply cross-member data access

Membership in the same future Family Plan must not automatically grant
members access to each other's private Training/Sensing/Research data. Any
future intentional sharing capability requires its own explicit
product/privacy/authorization design.

## 33. Payer is not data authority

Paying for another person's entitlement or being the payer/organizer of a
future Family Plan does not inherently make that payer the owner/controller of
another adult member's private Training/Sensing/Research data. Billing
authority and private-data authority are distinct.

## 34. Family Plan economics are deferred

`FAMILY_PLAN_AND_ENTITLEMENT_POLICY` remains unresolved. This checkpoint does
not decide member counts, flexible seats, pricing, free/paid additional seats,
Family tiers, payer capabilities, invite/remove flows, independent/shared
login mechanics, transfers, or subscription economics. Architecture must not
unnecessarily prevent a future flexible Family Plan, but the plan is not part
of this gate's current product design.

## 35. Minor status is jurisdiction/policy context

Future support for minors must not assume one universal age threshold.
Applicable age, consent, and guardian rules may vary by jurisdiction and
processing purpose. Exact thresholds and legal rules remain unresolved.

## 36. AHF v1 is adult-only

Minor/Child Accounts and Guardian relationships are OUT of v1 scope. This is a
v1 product-scope decision, not a claim that AHF will never support minors.
Architecture should avoid unnecessarily making future Minor/Guardian support
impossible.

## 37. Minor Research is out of v1

Because v1 does not support Minor Accounts, the voluntary Research Program in
v1 must not admit minors. Future Minor Research requires separate explicit
product/privacy/legal review. This supersedes the earlier unresolved item
“minors participating in Research” for v1; future Minor Research remains
deferred.

## 38. Age eligibility must be establishable; its mechanism is deferred

AHF must eventually be able to establish eligibility for adult-only or
restricted capabilities with sufficient reliability for applicable policy.
This checkpoint does not choose exact date-of-birth storage, birth year, age
band, self-declaration, document verification, third-party age verification,
biometric age estimation, or a jurisdiction service. Future design should
consider data minimization and legal/product requirements.

`AGE_ELIGIBILITY_AND_VERIFICATION` remains unresolved.

## 39. Family Plan must not bypass Minor policy

A future Family Plan must not implicitly permit Minor use merely because a
payer can purchase or invite additional members. Minor support requires its
own explicitly approved lifecycle and guardian/privacy model.

## Future Minor/Guardian principles

These are future design constraints, not v1 implementation requirements:

- A future Child Account should remain conceptually distinct from a parent's
  personal Training Profile.
- Guardian authority, if introduced, should be explicit authorization; the
  child's Training History is not the parent's Training History.
- Guardian access should eventually be capability/policy scoped rather than
  assumed unrestricted.
- Minor Research requires separate treatment from adult Research.

Do not implement or fully resolve these future mechanisms here.

## Account Sharing Identity Confidence remains unresolved

`ACCOUNT_SHARING_IDENTITY_CONFIDENCE` remains unresolved. The preferred
product direction is multiple people who legitimately use AHF having
independent personal Accounts, with a possible future Family Plan providing
entitlement linkage.

This does not resolve accidental sharing, credential sharing, deliberate
misuse, detecting misattributed Workout evidence, attribution-confidence
representation, or recovery from contaminated Training Profile evidence.
Those mechanisms remain unresolved. This direction does not require default
surveillance.

## Additional unresolved matters

This third interim checkpoint preserves as unresolved:

- `FAMILY_PLAN_AND_ENTITLEMENT_POLICY`;
- `ACCOUNT_SHARING_IDENTITY_CONFIDENCE` mechanisms;
- `AGE_ELIGIBILITY_AND_VERIFICATION` mechanisms; and
- `FUTURE_MINOR_GUARDIAN_MODEL`.

It also preserves every unresolved Privacy/Sensing/Research matter from the
first and second checkpoints, including authentication architecture, identity
uncertainty schema/scoring, Family Plan economics, age verification, legal and
jurisdictional requirements, Research consent/withdrawal and data lifecycle,
de-identification, retention, security, and sensing architecture. No new Owner
gate is created by these requirements.

## Consistency check

This checkpoint was cross-checked against the earlier Privacy/Sensing
checkpoints and the resolved Identity/Persistence and Execution/Outcome/
Recovery contracts. The intended distinctions remain:

```text
Account != Authentication Identifier != Subscription/Entitlement
Account != another person's Training Profile
Payer != automatic Data Authority
Family relationship != implicit private-data sharing
V1 Adult-only != future Minor support architecturally prohibited
```

The personal Account boundary does not change the resolved Identity/Persistence
rule that attributable User data follows its deletion lifecycle and validly
anonymous data has no usable reverse linkage. The v1 adult-only scope does not
select an age threshold or verification mechanism. No contradiction is
introduced with the resolved Execution/Outcome/Recovery contract; base Workout
execution remains available without sensing, and ordinary Sensing activation
remains distinct from voluntary Research and the Anonymous Learning Lab.

This checkpoint does not resolve the Privacy/Sensing/Account Lifecycle Owner
gate or any other Owner gate.

## Fourth interim checkpoint

This checkpoint records twelve already-agreed decisions, numbered 41–52. They
extend the existing Owner-decision evidence and do not resolve the Owner gate
or authorize its downstream resolution task.

## 41 — Ordinary Camera/Sensing raw-data boundary

During an ordinary Workout, the camera stream is an ephemeral input. AHF may
derive pose/keypoints, repetition observations, form observations, or other
domain-significant sensing evidence, but raw frames/images/video are not
persistent data by default.

Persistent storage or upload of raw imagery/video requires a separate explicit
purpose and applicable contract. The voluntary Research Program is one
possible future/approved route, not the only theoretically possible
explicit-purpose contract.

This decision does not choose on-device, cloud, or hybrid processing; a
sensing runtime; AI/model/framework; or transport architecture. It defines
the default persistence boundary only.

## 42 — Processing is not retention

Processing a camera frame does not itself authorize persistent retention.
Temporary processing, inference, buffering, or transport remain conceptually
distinct from durable storage.

If future architecture temporarily transmits raw sensing input for processing,
that fact alone does not convert the input into persistently retained data.
Exact buffering, transport, and runtime mechanisms remain deferred.

## 43 — Derived evidence must be purpose-minimized

AHF must not retain every feature, keypoint, metric, inference output, or
derived value merely because sensing can generate it. Persistent derived
sensing data requires a legitimate defined purpose, such as applicable
Training truth, user feedback, adaptation, or another explicitly approved
purpose.

Exact data fields and retention periods remain deferred.

## 44 — Debugging and observability must not bypass the raw-data boundary

Crash reporting, telemetry, logging, tracing, model debugging, and
observability must not accidentally become an alternate raw-camera retention
pipeline. Raw image/video payloads must not enter ordinary logs, traces, or
analytics merely because they are useful for debugging.

If raw sensing material is genuinely required for a future debugging/research
purpose, that requires its own explicit reviewed contract and controls. No
observability tool or architecture is selected here.

## 45 — Failure must remain privacy-safe

Inference, network, upload, application, or processing failures must not cause
temporary raw sensing buffers to become ordinary persistent data. Temporary
raw-data lifecycle must remain bounded.

Exact buffer lifetime, cleanup mechanism, crash-recovery implementation, and
storage technology remain deferred.

## 46 — Raw, intermediate, and domain evidence are distinct

Sensing outputs must not be treated as one undifferentiated data category.
Conceptually distinguish:

```text
Raw sensing input
→ Intermediate sensing representation
→ Domain-significant evidence
```

Examples include:

- **Raw:** camera frame, image, or video segment.
- **Intermediate:** pose/keypoints, frame-level confidence, inference trace,
  or movement representation.
- **Domain-significant evidence:** performed rep count, valid rep count, or
  factual observation relevant to Set/Workout truth.

These categories may have different persistence, retention, privacy, and
lifecycle treatment. No physical schema is defined here.

## 47 — Domain-significant sensing evidence may be Training History

When derived sensing evidence is necessary to preserve or explain factual
Workout history, it may become durable Training History evidence. Examples
may include performed reps, valid reps, completion-relevant observations, and
factual form observations where the product later chooses to preserve them.

The fact that evidence originated from sensing should remain representable
through appropriate provenance. This does not imply that raw source imagery
must be retained.

## 48 — Intermediate sensing data is not historical truth by default

Intermediate outputs such as complete keypoint streams, frame-by-frame pose
sequences, confidence samples, and inference traces do not automatically
become durable Training History merely because they were produced.

Where the domain-significant result is sufficient for the approved purpose,
intermediate representations may be discarded according to future lifecycle
policy. Specific retention periods remain deferred.

## 49 — Derived is not anonymous

Removing raw imagery does not automatically make derived sensing data
anonymous. Pose information, body measurements, movement patterns,
behavioral/motion characteristics, and other derived representations may
remain privacy-sensitive or linkable to a person.

Derived sensing data must still cross the previously defined
Privacy-Preserving Learning Boundary before qualifying as Anonymous Learning
Data. “Not an image/video” is not equivalent to “anonymous.” Exact
de-identification methodology remains deferred.

## 50 — Provenance need not retain raw media

AHF must be able to preserve meaningful provenance for domain-significant
Workout evidence without requiring retention of the original raw camera
footage. Relevant provenance may eventually include observation source,
sensing/manual origin, observation state, and processing/model/version context
where materially required.

No provenance schema is defined here. Historical evidence provenance does
not require persistent raw footage.

## 51 — Unobserved/unknown is not observed invalid

Failure to observe is a distinct factual state. Camera unavailability, sensing
interruption, insufficient confidence, or an observation not being produced
must not silently become “movement was observed and invalid.”

The semantic distinction among observed valid, observed invalid, and
unobserved/unknown must be preserved. Exact enums/schema remain deferred.

This remains consistent with the resolved Execution contract: performed
attempts and valid observations are distinct, and sensing absence must not
fabricate evidence.

## 52 — User correction must not silently erase sensing evidence

If AHF later allows a User to correct or contest a sensing-derived factual
result, the correction must not silently overwrite or erase the prior
observation. Where historically/materially relevant, preserve the distinction
between observed evidence, User-provided correction/contestation, and the
resulting canonical interpretation, with appropriate provenance.

This is consistent with the resolved Identity/Persistence principle that
factual correction preserves provenance rather than silently rewriting
history. No correction UI, conflict algorithm, trust weighting, evidence
scoring, or schema is defined here.

## Raw/intermediate/derived persistence position

For ordinary sensing, raw camera imagery/video remains ephemeral by default.
Processing alone does not authorize retention. Intermediate sensing
representations are not historical truth by default, while
domain-significant derived evidence may be durable Training History when
needed for factual Workout truth. Derived evidence is not anonymous by
default, and meaningful provenance does not require raw footage.

This preserves the distinct boundaries:

```text
Normal Sensing
!= Voluntary Research Program
!= Anonymous Learning Lab
```

## Additional unresolved matters preserved

This fourth interim checkpoint does not resolve:

- exact derived-evidence retention policy;
- exact retention durations;
- raw/intermediate buffer lifetimes;
- de-identification algorithms;
- re-identification thresholds;
- jurisdiction-specific anonymous-data definitions;
- ordinary sensing bundle legality/legal basis;
- Research legal/consent/withdrawal mechanics;
- Research Dataset retention;
- Anonymous Learning Lab retention;
- sensing security controls;
- encryption/access-control implementation;
- local versus cloud versus hybrid sensing architecture;
- sensing AI/model/runtime/framework;
- exact sensing provenance schema;
- exact observation enums/schema;
- User-correction UX;
- evidence/conflict weighting;
- account-sharing detection mechanics;
- `FAMILY_PLAN_AND_ENTITLEMENT_POLICY`;
- `ACCOUNT_SHARING_IDENTITY_CONFIDENCE`;
- `AGE_ELIGIBILITY_AND_VERIFICATION`; and
- `FUTURE_MINOR_GUARDIAN_MODEL`.

All other unresolved matters from the earlier checkpoints remain preserved.

## Governance note

This checkpoint contains twelve already-agreed decisions (#41–#52). The
normal Foundation process limit is a maximum of ten decisions between
canonical checkpoints. That limit was accidentally exceeded during
discussion. This checkpoint records the twelve already-made decisions,
publishes them, and resets the decision counter to zero. This exception does
not reinterpret the ten-decision limit as permission for future batches of
twelve.

## Cross-contract consistency check

These decisions were checked against the resolved Execution/Outcome/Recovery
contract, resolved Identity/Persistence contract, and Privacy/Sensing
checkpoint decisions 1–40. No contradiction is introduced with optional
sensing, base Workout executability without sensing, distinct permission /
consent / capability / evidence, non-fabricated observations, raw-camera data
not being Training History by default, the distinct Research boundary, the
irreversible privacy transformation required for Anonymous Learning Data,
provenance-preserving correction, or the separation of Training truth from
storage/sync state. No architecture/runtime choice is made.

The Owner gate remains **UNRESOLVED**. Its downstream resolution task remains
unexecuted and **BLOCKED**. No other Owner gate is modified.

## Fifth interim checkpoint — Ordinary Sensing Lifecycle

The following nine Owner decisions (#53–#61) are **RESOLVED** within this
checkpoint. Their resolution does not resolve
`OWNER_GATE_PRIVACY_SENSING_ACCOUNT_LIFECYCLE@v0`, authorize its downstream
resolution task, or select an implementation.

## 53 — Ordinary Sensing activation

**Decision status: RESOLVED.** Ordinary Sensing requires an affirmative,
informed User action to activate the Ordinary Sensing bundle. Device/OS
permission, technical capability, Workout start, or available sensing hardware
alone must not activate it. Permission, consent, capability, and evidence
remain distinct.

## 54 — User-controlled disable

**Decision status: RESOLVED.** A User who activated Ordinary Sensing must be
able to disable it later.

## 55 — Prospective effect of disabling

**Decision status: RESOLVED.** Disabling Ordinary Sensing stops future sensing
and observation and future sensing-derived contribution from that point
forward. The base Workout must remain executable without sensing.

## 56 — Historical truth preservation

**Decision status: RESOLVED.** Disabling Ordinary Sensing must not rewrite,
erase, reinterpret, or invalidate factual Training Evidence legitimately
created before disabling. Previously observed evidence does not become
Unobserved merely because sensing is later disabled.

## 57 — Anonymous Learning boundary

**Decision status: RESOLVED.** Disabling Ordinary Sensing does not
retroactively reach data that had already validly crossed the irreversible
privacy-transformation boundary into Anonymous Learning Data. This applies
only where the existing canonical anonymity/de-identification requirements
were actually satisfied. Anonymous Learning Data must remain independent of
User identity and must not retain usable reverse linkage to the User.

## 58 — Permission/capability loss is not User disable

**Decision status: RESOLVED.** Loss of OS permission or required sensing
capability makes sensing unavailable. It is not, by itself, a User disabling
Ordinary Sensing, withdrawal from the Ordinary Sensing bundle, or a new
privacy preference. Technical availability and User activation remain
conceptually distinct.

## 59 — No fabricated sensing continuity

**Decision status: RESOLVED.** While required permission or capability is
unavailable, AHF must not fabricate, infer, or represent sensing evidence as
though sensing continued. Unobserved/Unknown is not Observed Invalid.

## 60 — Explicit re-activation after User disable

**Decision status: RESOLVED.** Once a User explicitly disables Ordinary
Sensing, restored technical capability or OS permission alone must not
reactivate it. Re-activation requires a new affirmative User action. This is
not a UI-flow specification.

## 61 — Versioned activation provenance

**Decision status: RESOLVED.** AHF must be able to establish the materially
relevant Ordinary Sensing terms or policy basis under which a User activated
it. Later changes must not silently expand an existing activation beyond
what its applicable privacy/legal basis validly permits. Foundation does not
universally define which policy changes require renewed acceptance; that may
depend on jurisdiction, legal basis, the nature/materiality of the change,
and later legal/privacy policy. Exact re-acceptance requirements remain
deferred.

## Ordinary Sensing Lifecycle Foundation status

`ORDINARY_SENSING_LIFECYCLE = FOUNDATION-COMPLETE` for the current Privacy
gate's Foundation-level gap. This does not mean sensing implementation is
complete or ready, and does not decide UI, OS permission flow, database,
schema, API, legal wording, jurisdiction-specific analysis, local/cloud/hybrid
architecture, model/runtime/framework, exact attributable-data retention or
deletion policy, retention durations, or temporary buffer lifetimes.

In particular, treatment of previously collected **attributable** sensing
data that has neither validly crossed into Anonymous Learning Data nor become
necessary durable factual Training History remains **UNRESOLVED** for the
upcoming Retention & Deletion semantics analysis. This checkpoint implies
neither immediate deletion, indefinite retention, automatic anonymization,
nor mandatory retention.

The Privacy Owner gate remains **UNRESOLVED**. Remaining gap-analysis
categories include Research Program lifecycle, Retention & Deletion
semantics, and security/privacy trust-boundary invariants. The next
conceptual Owner discussion is `RESEARCH_PROGRAM_LIFECYCLE`; this does not
resolve Research decisions or create implementation work.

## Fifth-checkpoint governance and consistency note

The pre-checkpoint decision count was nine (#53–#61), within the normal
maximum of ten decisions between canonical checkpoints. Publication of this
checkpoint resets the decision counter to **zero**. This records the count
in the existing checkpoint convention; no separate tracking mechanism is
created.

These decisions preserve the earlier Privacy checkpoints and the resolved
Execution/Outcome/Recovery and Identity/Persistence contracts: sensing is an
optional enhancement; the base Workout remains executable; permission,
consent, capability, and evidence are distinct; absent observation is not
invalid observation; legitimate historical Training Evidence is preserved;
and valid Anonymous Learning Data requires an irreversible privacy boundary.
Ordinary Sensing remains separate from the voluntary Research Program. No
other Owner gate or unresolved implementation choice is changed.

## Sixth interim checkpoint — Research Program Lifecycle

The following nine Owner decisions (#62–#70) are **RESOLVED** within this
checkpoint. Their resolution does not resolve
`OWNER_GATE_PRIVACY_SENSING_ACCOUNT_LIFECYCLE@v0`, authorize its downstream
resolution task, or decide Research retention, deletion, or implementation.

## 62 — Explicit Research enrollment

**Decision status: RESOLVED.** Research Program participation requires a
separate affirmative, informed enrollment. Ordinary Sensing activation,
Account creation, Workout participation, or acceptance of general AHF terms
must not implicitly enroll a User. Research remains separate and voluntary.

## 63 — Research eligibility is not consent or enrollment

**Decision status: RESOLVED.** Research consent or enrollment alone does not
make every User, Workout, sensing sample, or contribution eligible for
Research collection or use. A contribution may enter the Research Dataset
only if it satisfies the applicable Research purpose and eligibility or
qualification boundary. Exact qualification mechanics remain deferred.

## 64 — Prospective Research withdrawal

**Decision status: RESOLVED.** A User must be able to withdraw from the
Research Program. Withdrawal stops future Research participation and future
Research collection or contribution under that enrollment. This decision
does not establish deletion semantics.

## 65 — Withdrawal does not rewrite historical truth

**Decision status: RESOLVED.** Withdrawal must not falsify, erase, or rewrite
the historical fact that Research participation or qualified contributions
occurred before withdrawal. Preserving historical truth does not itself
authorize indefinite retention of attributable data.

## 66 — Withdrawal is not historical-data disposition

**Decision status: RESOLVED.** Withdrawal terminates future participation but
does not itself determine deletion or retention of previously collected
attributable Research data. Its disposition belongs to the applicable future
Research Retention & Deletion contract. This checkpoint does not imply
immediate deletion, indefinite retention, mandatory retention, or automatic
anonymization.

## 67 — No automatic Research-to-Anonymous transition

**Decision status: RESOLVED.** Research data does not become Anonymous
Learning Data merely because participation ends, the User withdraws,
identifiers are removed, data becomes old, or a retention event occurs.
Research Dataset and Anonymous Learning Lab remain distinct.

## 68 — Valid privacy transformation required

**Decision status: RESOLVED.** A Research artifact may enter the Anonymous
Learning domain only after validly crossing the established irreversible
privacy-transformation boundary. Removing a `user_id`, relabeling data as
“anonymous,” or preserving a usable reverse mapping is insufficient. Once
validly transformed, the resulting Anonymous Learning artifact follows the
existing Anonymous Learning boundary, not attributable User Research history.
Existing anonymity requirements are unchanged.

## 69 — Versioned Research enrollment provenance

**Decision status: RESOLVED.** AHF must be able to establish the materially
relevant Research purpose, applicable data categories, and consent or policy
basis under which a User enrolled and a Research contribution was collected.
This does not select a schema or legal wording.

## 70 — Re-enrollment after withdrawal

**Decision status: RESOLVED.** Following Research withdrawal, later
participation requires a new affirmative, informed enrollment under the
then-applicable Research terms. The previous enrollment must not simply be
revived. This is not a UI-flow specification.

## Research Program Lifecycle Foundation status

`RESEARCH_PROGRAM_LIFECYCLE = FOUNDATION-COMPLETE` for the current Privacy
gate's Foundation-level lifecycle gap only. It does not mean Research
implementation, legal compliance, economics, or data-retention policy is
complete or ready. Exact Research consent wording, jurisdiction-specific
requirements, Dataset retention, source-data handling after withdrawal,
retention durations, deletion mechanics, qualification mechanics, reward
economics, fraud prevention, security implementation, schema, API, and UI
remain **UNRESOLVED**.

In particular, the ultimate disposition of previously collected
**attributable Research source data** after withdrawal remains **UNRESOLVED**
for `RETENTION_AND_DELETION_SEMANTICS`. Withdrawal alone does not decide
whether that data is deleted, retained, or transformed. No automatic
Research-to-Anonymous transition is authorized.

The Privacy Owner gate remains **UNRESOLVED**. The remaining Foundation
gap-analysis categories include Retention & Deletion semantics and
security/privacy trust-boundary invariants. The next conceptual Owner
discussion is `RETENTION_AND_DELETION_SEMANTICS`; this does not resolve that
topic or create implementation work.

## Sixth-checkpoint governance and consistency note

The pre-checkpoint decision count was nine (#62–#70), within the normal
maximum of ten decisions between canonical checkpoints. Publication of this
checkpoint resets the decision counter to **zero** in the existing
checkpoint convention; no separate tracking mechanism is created.

These decisions preserve the earlier Privacy checkpoints, including the
Ordinary Sensing lifecycle, voluntary Research boundary, v1 exclusion of
Minor Research, Research reward/withdrawal distinctions, and the strict
Anonymous Learning boundary. They remain consistent with the resolved
Identity/Persistence and Execution/Outcome/Recovery contracts: attributable
historical truth is not falsified, but retention requires its own purpose and
policy. No other Owner gate or unresolved implementation choice is changed.

## Seventh interim checkpoint — Retention & Deletion Semantics Part 1

The following ten Owner decisions (#71–#80) are **RESOLVED** within this
checkpoint. They begin, but do not complete, Foundation-level Retention &
Deletion semantics. They do not resolve the Privacy Owner gate or authorize
its downstream resolution task.

## 71 — Purpose-bound retention

**Decision status: RESOLVED.** Attributable data must not be retained merely
because it might someday be useful. Continued retention requires an
applicable legitimate purpose and remains governed by the relevant
retention/deletion contract. Exact legal basis and retention duration are
not defined here.

## 72 — Data-class-specific lifecycle

**Decision status: RESOLVED.** Retention and deletion are not one universal
lifecycle applied identically to every data class. Personal/Account Data,
Training Data, Sensing Evidence, Research Data, Operational/Sync Data,
Anonymous Learning Data, and other canonically distinct classes may require
different retention/deletion semantics according to purpose and applicable
boundaries. This does not freeze a final taxonomy or schema.

## 73 — Processing is not retention

**Decision status: RESOLVED.** Temporary processing, buffering, inference,
or transport does not itself authorize durable retention. Processing
necessity and durable-storage authority are distinct. The existing
camera/sensing boundary remains: temporary technical handling must not
silently become persistent storage.

## 74 — Durable Training History has an independent retention basis

**Decision status: RESOLVED.** Legitimately created, domain-significant
factual Training Evidence that has become durable Training History does not
lose its historical status merely because Ordinary Sensing is later
disabled, sensing capability is later lost, or Research participation is
later withdrawn. Historical truth and current sensing/Research participation
state remain distinct. This does not authorize indefinite retention or
override Account-deletion semantics.

## 75 — Intermediate sensing data is not automatically Training History

**Decision status: RESOLVED.** Raw or intermediate sensing artifacts do not
acquire durable historical retention status merely because they contributed
to domain-significant Training Evidence. Complete keypoint streams,
frame-level confidence, inference traces, and temporary sensing
representations are examples where applicable. Only purpose-minimized
domain-significant evidence needed for factual Workout history may become
durable Training History under the existing contract. No evidence schema is
selected.

## 76 — Research withdrawal does not determine prior-data disposition

**Decision status: RESOLVED.** Research withdrawal stops future
participation under the applicable enrollment but does not itself determine
retention or deletion of previously collected attributable Research data.
Prior Research data follows its applicable retention/deletion contract.
Decision #66 remains authoritative; exact Research source-data disposition
is not decided here.

## 77 — Account deletion is a lifecycle, not instantaneous erasure

**Decision status: RESOLVED.** The already-resolved Account lifecycle remains:

```text
ACTIVE → PENDING_DELETION → DELETED
```

A deletion request begins the already-approved 30-day grace period; it does
not mean every associated datum is physically erased at the instant of the
request. Recovery requires the User's explicit choice. Return or login alone
does not cancel deletion or restart the original deadline. This checkpoint
does not change those existing semantics.

## 78 — Final deletion propagates across attributable domains

**Decision status: RESOLVED.** Final Account deletion cannot be implemented
merely by removing or marking an Account record while silently leaving
attributable User data outside the deletion lifecycle. Data that remains
attributable or linkable to the User requires explicit disposition under its
applicable retention/deletion contract. This does not prescribe database
cascades, physical schema, storage engine, deletion implementation, or exact
timing.

## 79 — Valid Anonymous Learning Data is outside User deletion reach

**Decision status: RESOLVED.** Data that validly crossed the established
irreversible privacy-transformation boundary into Anonymous Learning Data
is no longer User Profile, Training Profile, or Training History; it cannot
be looked up or mutated through the deleted User and may remain after Account
deletion under the existing Anonymous Learning contract. If usable reverse
mapping or meaningful User linkage remains, the intended anonymity boundary
has not been crossed. Existing anonymity requirements are not weakened.

## 80 — Independent continuing basis for attributable retention

**Decision status: RESOLVED.** Attributable data no longer required for its
original User-facing or domain purpose must not be retained merely for
possible future learning value. Continued attributable retention requires
an independent valid purpose and applicable privacy/legal basis. Without
such a basis, the data follows its applicable deletion lifecycle or, where
valid and permitted, crosses the established privacy-transformation
boundary. Learning utility alone is not universal retention authorization.
This does not mandate anonymization or select a de-identification method,
exact deletion timing, or jurisdiction-specific legal basis.

## Retention & Deletion Foundation status

`RETENTION_AND_DELETION_SEMANTICS = IN_PROGRESS`. Decisions #71–#80 are
resolved, but this Part 1 batch does **not** make this Foundation category
`FOUNDATION-COMPLETE`. Further Foundation-level gap analysis is required to
determine whether additional invariants are needed before the category can
close.

Exact derived-evidence retention policy, retention durations, temporary
buffer lifetimes, Research source-data disposition after withdrawal,
Research Dataset and Anonymous Learning Lab retention, de-identification
algorithms, re-identification thresholds, jurisdiction-specific anonymous
data definitions and legal retention requirements, backup deletion,
physical deletion, schema/API/storage, and security/encryption implementation
remain **UNRESOLVED**. Nothing here chooses immediate deletion, indefinite
retention, mandatory retention, or automatic anonymization for previously
collected attributable Research or Sensing data.

The Privacy Owner gate remains **UNRESOLVED** and its downstream resolution
task remains unexecuted and **BLOCKED**. Remaining gap-analysis categories
include Retention & Deletion semantics (continuing) and Security/Privacy
trust-boundary invariants. The next conceptual Owner discussion is
`RETENTION_AND_DELETION_SEMANTICS_CONTINUED`; it is not resolved here and no
implementation-ready work is created.

## Seventh-checkpoint governance and consistency note

The pre-checkpoint decision count was ten (#71–#80), at the normal maximum
between canonical checkpoints. Publication of this checkpoint resets the
decision counter to **zero** in the existing checkpoint convention; no
parallel tracking mechanism is created.

These decisions preserve the resolved Identity/Persistence Account deletion,
purpose-aware minimization, historical lineage, and anonymous-data boundaries;
the resolved Execution/Outcome/Recovery factual-history distinction; and
earlier Privacy decisions on optional sensing, raw/intermediate evidence,
voluntary Research withdrawal, and valid privacy transformation. No other
Owner gate or unresolved implementation choice is changed.

## Eighth interim checkpoint — Retention & Deletion Semantics Part 2

The following ten Owner decisions (#81–#90) are **RESOLVED** within this
checkpoint. They continue, but do not complete, Foundation-level Retention &
Deletion semantics. They do not resolve the Privacy Owner gate or authorize
its downstream resolution task.

## 81 — Explicit deletion disposition

**Decision status: RESOLVED.** Every attributable data class reaching an
applicable deletion boundary requires an explicit disposition governed by
its contract, such as deletion, retention under an independently valid
basis, or valid privacy transformation where independently permitted.
Silent or default persistence is not a valid disposition.

## 82 — Internal copies do not escape deletion contracts

**Decision status: RESOLVED.** Caches, replicas, derived stores, exports,
operational copies, and other internal representations must not become
loopholes that preserve attributable data outside its applicable
retention/deletion contract. This does not prescribe physical architecture.

## 83 — Backup lifecycle may differ from active-system deletion

**Decision status: RESOLVED.** Deletion from active systems must not be
falsely equated with instantaneous physical destruction of every bit in
every backup. Backup lifecycle may differ where validly required or
permitted. Attributable data retained only in backup must not silently
return to ordinary operational use merely because a backup exists. Exact
backup retention, restoration, deletion, and physical-erasure mechanics
remain deferred.

## 84 — Derived data is not automatically deletion-exempt

**Decision status: RESOLVED.** Being derived does not itself remove an
artifact from privacy, retention, or deletion obligations. If derived data
remains attributable or linkable, it requires an applicable
retention/deletion disposition. Derived is not Anonymous.

## 85 — Retained records remain subject to minimization

**Decision status: RESOLVED.** Where a record may legitimately remain after
a deletion boundary, unnecessary identity linkage must not be preserved
merely for referential convenience. Retention authority does not eliminate
minimization requirements. No schema or implementation is prescribed.

## 86 — Final Account deletion includes attributable Training History

**Decision status: RESOLVED.** When Account deletion reaches `DELETED`,
attributable Training History also enters its applicable deletion
disposition. It may remain attributable only where an independent valid
purpose and applicable privacy/legal basis authorizes that continued
retention. Historical, analytical, or potential AHF utility alone is
insufficient. This does not retroactively falsify historical truth, require
deletion before the applicable deletion lifecycle, apply to data already
validly transformed into Anonymous Learning Data, or define
jurisdiction-specific mandatory retention.

## 87 — Source deletion does not automatically falsify valid derived facts

**Decision status: RESOLVED.** Deleting a source, raw, or intermediate
artifact does not automatically require falsifying or deleting a
legitimately established factual domain result derived from it. A retained
derived result, if attributable, remains subject to its own
retention/deletion contract. This is not blanket retention authority.

## 88 — Privacy transformation is not deletion evasion

**Decision status: RESOLVED.** AHF must not use anonymization or
de-identification as an automatic escape hatch after a deletion obligation
or request arises. Privacy transformation requires its own valid purpose,
eligibility, privacy/legal basis, and compliance with the established
irreversible transformation boundary. This does not prohibit a validly
authorized transformation where the applicable contract permits it.

## 89 — Pending deletion does not authorize new secondary purposes

**Decision status: RESOLVED.** While an Account is `PENDING_DELETION`, the
grace period does not authorize new attributable secondary uses that were
not already validly applicable before the deletion request. Legitimate
operations needed for the deletion/recovery lifecycle and other
independently valid obligations remain possible.

## 90 — Recovery does not recreate erased data

**Decision status: RESOLVED.** Explicit Account recovery during the valid
grace period may restore active lifecycle treatment for data that
legitimately still exists. Recovery must not fabricate or claim restoration
of data already legitimately and irreversibly deleted under an applicable
policy. Login alone does not cancel deletion.

## Retention & Deletion Foundation status after Part 2

`RETENTION_AND_DELETION_SEMANTICS = IN_PROGRESS`. Decisions #81–#90 are
resolved, but a final Foundation gap-analysis is still required. Neither
this checkpoint nor Part 1 marks the category `FOUNDATION-COMPLETE`.

Exact retention durations, backup durations and mechanics, physical
deletion implementation, de-identification algorithms, jurisdiction-specific
legal requirements, storage/schema/API choices, Research retention duration,
Anonymous Learning retention duration, and security/encryption implementation
remain **UNRESOLVED**. The unresolved matters recorded in the earlier
checkpoints and the Foundation unresolved register remain open.

`OWNER_GATE_PRIVACY_SENSING_ACCOUNT_LIFECYCLE@v0` remains **UNRESOLVED**; its
resolution task remains unexecuted and **BLOCKED**. Security/Privacy
trust-boundary invariants are not resolved here. The next conceptual Owner
discussion is `RETENTION_AND_DELETION_FINAL_GAP_ANALYSIS`; this does not
resolve that topic or create implementation-ready work.

## Eighth-checkpoint governance and consistency note

The pre-checkpoint decision count was ten (#81–#90), at the normal maximum
between canonical checkpoints. Publication of this checkpoint resets the
decision counter to **zero** using the existing checkpoint convention; no
parallel tracking mechanism is created.

These decisions preserve the resolved Identity/Persistence Account lifecycle,
purpose-aware retention, historical lineage, and irreversible Anonymous
Learning boundary; the resolved Execution/Outcome/Recovery historical-truth
distinction; and Privacy decisions #71–#80 on explicit purpose, data-class
lifecycle, and independent attributable-retention basis. No other Owner gate
or unresolved implementation choice is changed.
