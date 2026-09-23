# Clean-Start Foundation Completeness

**Status: RESOLVED**  
**Version: v0**  
**Audit basis date: 2026-09-23**

## Authority and boundary

The Owner accepts the Clean-Start Foundation Audit dated 2026-09-23 as the
basis for correcting the Foundation DAG, subject to the sequence in this
contract.

This decision governs Foundation discovery, review, and decision sequencing.
It does not adopt legacy code, schema, dependencies, architecture, tools,
assets, or product behavior. It does not resolve any open product or
architecture decision. Historical evidence remains evidence, not authority.

The DRAFT Identity Model candidate remains DRAFT evidence. This contract does
not promote it to a resolved decision.

## Canonical sequence

```text
FOUNDATION-AUDIT-REVIEW
        |
        v
FOUNDATION-LKI-COMPLETENESS
        +-- begins CAPABILITY / DISPOSITION LEDGER
        |
        v
parallel only where declared dependencies permit:
    FOUNDATION-GOVERNANCE-AND-AGENT-CONTRACT
    FOUNDATION-PRODUCT-AND-DOMAIN-REVALIDATION
    FOUNDATION-HISTORICAL-FAILURE-AND-EVIDENCE-MODEL
        |
        v
OWNER DECISION GATES
        |
        v
    FOUNDATION-RESOLVE-IDENTITY-AND-PERSISTENCE-BOUNDARIES
    FOUNDATION-RESOLVE-EXECUTION-OUTCOME-AND-RECOVERY-CONTRACTS
    FOUNDATION-RESOLVE-PRIVACY-SENSING-AND-ACCOUNT-LIFECYCLE
    FOUNDATION-RESOLVE-UX-DESIGN-LOCALIZATION-ACCESSIBILITY-PERFORMANCE
    FOUNDATION-RESOLVE-ARCHITECTURE-OPERATIONS-AND-TOOLING-BOUNDARIES
        |
        v
FOUNDATION-BASELINE-REVIEW
        |
        v
implementation-architecture work may become eligible
```

No implementation task is authorized or created by this contract. Future
implementation-architecture work must require the resolved Clean-Start
Foundation Baseline decision.

## Mechanical completeness contract

Foundation completeness must not depend on a remembered category checklist.
The pinned tracked tree of every legacy repository in scope is the mechanical
inventory.

For every tracked legacy path at the pinned revision, the completeness evidence
must do exactly one or both of the following where appropriate:

- map the path to one or more stable capability IDs; or
- explicitly exclude the path with a recorded rationale.

The coverage validator must fail closed on an unaccounted tracked path, an
unknown capability reference, an exclusion without rationale, or a capability
without required fields. Categories may support navigation, but no fixed list
of categories is an exhaustive boundary. Repository evidence determines the
capability scope.

Every material discovered capability must record:

- stable ID;
- exact provenance, including repository, revision, and source path;
- evidence class;
- dependencies and relationships where known;
- confidence and gaps;
- review state; and
- disposition state.

Allowed candidate dispositions are:

- `UNREVIEWED`
- `REVALIDATE`
- `ADOPT_CANDIDATE`
- `MODIFY_CANDIDATE`
- `SUPERSEDE_CANDIDATE`
- `REJECT_CANDIDATE`
- `HISTORICAL_EVIDENCE`

Candidate dispositions do not authorize adoption. A later resolved Foundation
decision is required before any candidate can become authoritative.

## Ledger lifecycle

The Capability/Disposition Ledger begins during completeness discovery. It is
not deferred until review branches finish. Downstream review tasks refine the
ledger through provenance-preserving disposition updates that remain traceable
to their reviewing task and evidence. Parallel branches must use independent,
mergeable review evidence rather than silently overwriting one another.

## Existing index reconciliation

`LEGACY_KNOWLEDGE_INDEX@v0` contains 18 seed discovery records. Its historical
`index_status: COMPLETE` means that its original indexing task completed; it
does not claim Clean-Start Foundation completeness.

Completeness work must:

- account for every existing LKI record;
- identify records that combine multiple capabilities;
- add or split capability coverage where repository evidence requires it;
- distinguish ephemeral generated output from durable tracked acceptance
  evidence;
- preserve correction, supersession, and failure history; and
- record relevant omissions found through mechanical repository coverage.

## Audit limitations and verification obligations

The accepted audit had these explicit limitations:

- remote refs were not refreshed in the audit environment; and
- some generated, browser, device, or deployed evidence could not be
  independently verified.

These limitations are not acceptance claims. The Audit Review and Completeness
tasks must record explicit follow-up verification requirements wherever a
finding depends on unavailable or unrefreshed evidence. Unknown or unavailable
evidence remains a gap until independently verified.

## Owner decision gates

The five boundary-resolution tasks are blocked by distinct `UNRESOLVED` Owner
gate Decisions. The DAG must never resolve those gates automatically. After the
three review branches supply their evidence, the Owner may resolve each gate
through separately recorded canonical work.

Only then may the corresponding resolution task become `READY`. Those tasks
must produce explicit resolved decisions; review artifacts or candidate
dispositions alone are not decisions.

The Identity and Persistence boundary task additionally requires the preserved
`IDENTITY_MODEL_CANDIDATE@v0` artifact as DRAFT input evidence.

## Baseline gate

`FOUNDATION-BASELINE-REVIEW` depends on completion of all five boundary
resolution tasks and their resolved decisions. Until that review produces a
resolved Clean-Start Foundation Baseline, implementation-architecture work is
ineligible.
