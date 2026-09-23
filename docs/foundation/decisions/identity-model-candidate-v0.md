# Identity Model Candidate

**Status: DRAFT**  
**Version: v0**

This document is a candidate for Foundation review. It is not a resolved
Foundation decision, and none of its candidate statements are binding on
implementation.

## Purpose

Provide a reviewable conceptual identity boundary for AHF without selecting a
database, schema, identifier format, API, authentication model, framework, or
migration design.

## Resolved constraints carried forward

The following constraints come from the resolved Product Constitution, Domain
Glossary, and Domain Model rather than from this candidate:

- Exercise and Exercise Entry are distinct. Each Exercise Entry is an
  independent occurrence and may reference the same Exercise as another entry
  while retaining independent identity and dosage.
- Prescription and Execution are distinct conceptual domains.
- A Workout Session is based on a particular Workout Prescription.
- An Exercise Execution is based on a particular Exercise Entry, and a Set
  Execution is based on a particular Set Prescription.
- Prescribed facts and observed facts remain separate.
- Execution must not rewrite the historical meaning of its Prescription.
- Future adaptation must not rewrite past Prescriptions or Sessions.

## Candidate identity responsibilities

The following statements are candidates for explicit review. Their presence in
this DRAFT does not resolve them.

1. Each independently referenced domain occurrence should have identity that is
   stable for its relevant lifetime and is not derived solely from mutable
   labels, list position, or dosage.
2. Canonical Exercise identity should remain distinct from the identity of each
   prescribed Exercise Entry that references it.
3. Workout Prescription identity should identify the prescription whose meaning
   governed a Workout Session. A later change should create distinguishable
   future prescribed meaning rather than mutate the historical basis of an
   existing Session.
4. Workout Session, Exercise Execution, and Set Execution should each identify
   actual execution occurrences independently from their prescribed bases.
5. Set Result and Workout Outcome should remain attributable to the execution
   occurrences that produced them without becoming substitutes for those
   occurrences.
6. Program identity and any future Program revision identity should permit
   adaptation to produce distinguishable future prescribed meaning while
   retaining historical attribution.
7. Any mapping from legacy identifiers or external identifiers should preserve
   provenance and ambiguity. A mapping must not silently make a legacy identity
   canonical in Clean AHF.

## Candidate conceptual references

These references restate the resolved conceptual relationships while making the
identity questions visible:

```text
USER
 +-- has --> PROGRAM
                +-- contains --> WORKOUT PRESCRIPTION
                                      +-- contains --> EXERCISE ENTRY
                                      |                  +-- references --> EXERCISE
                                      |                  +-- contains --> SET PRESCRIPTION
                                      +-- is the basis of --> WORKOUT SESSION

WORKOUT SESSION
 +-- contains --> EXERCISE EXECUTION
 |                  +-- based on --> EXERCISE ENTRY
 |                  +-- contains --> SET EXECUTION
 |                                      +-- based on --> SET PRESCRIPTION
 |                                      +-- produces --> SET RESULT
 +-- produces --> WORKOUT OUTCOME
```

This diagram does not assert storage shape, cardinality beyond the resolved
Foundation language, or identifier representation.

## Review questions that remain open

- Whether User, account, authentication subject, person, and training profile
  are one identity or separate identities.
- Which conceptual objects require independently addressable identifiers and at
  what lifecycle boundary.
- How Program and Workout Prescription change over time: immutable revisions,
  snapshots, lineage, or another mechanism.
- Whether Set Prescription, Set Result, and Workout Outcome require independent
  identity in addition to attribution through their parent occurrence.
- Identifier format, generation authority, collision domain, and portability.
- Rules for merge, deletion, anonymization, restoration, and identity conflict.
- Cross-device, offline, recovery, and checkpoint identity semantics.
- How provenance and mappings for legacy or external identifiers are recorded.
- How identity is represented in persistence and APIs.

Until reviewed and resolved, implementations must not answer these questions
implicitly.

## Historical evidence considered

The Legacy Knowledge Index is evidence, not authority. This candidate uses the
index entries below only as discovery and risk evidence; it does not adopt their
legacy architecture, schema, identifiers, migrations, or implementation.

All referenced entries have `reuse_status: UNREVIEWED` and preserve provenance
to the legacy `Apex-Home-Fitness` repository at revision
`fbc3d1d2ef3ff7dc0d4a38c5f7d123e15c816c1e`:

- `LKI-IDENTITY-001` — schema, migration, contract, and close-out evidence for
  legacy User/Program/Exercise/WorkoutSession persistence and repeated
  prescribed-entry identity. The index explicitly says this is evidence, not a
  Clean AHF schema proposal.
- `LKI-DOMAIN-002` — legacy durable Exercise identity and Movement Graph
  evidence, including a practice of surfacing ambiguous identities rather than
  guessing them.
- `LKI-DOMAIN-003` — legacy outcome and adaptation evidence relevant to keeping
  observed outcomes distinct from sessions and future adaptive decisions.

The underlying legacy files were not adopted or copied into this candidate.
Future review may independently classify each relevant item for adoption,
modification, rejection, supersession, revalidation, or historical-evidence-only
use.

## Explicit non-decisions

This candidate does not select or define:

- a database technology or exact persistence schema;
- tables, columns, keys, indexes, or migrations;
- an API or serialized data contract;
- an authentication or authorization design;
- identifier syntax or generation technology;
- frontend, backend, state-management, or deployment architecture;
- exact recovery, checkpoint, result, outcome, or adaptation semantics; or
- a legacy migration or compatibility policy.

Resolving any candidate statement or open question requires a separate recorded
Foundation decision. Editing this DRAFT or implementing a convenient assumption
is not a substitute for that review.
