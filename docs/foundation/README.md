# AHF Clean Foundation

**Status: RESOLVED**  
**Version: v0**

This directory is the canonical Clean Foundation for the new Apex Home Fit (AHF) repository.

Implementation must conform to resolved Foundation decisions. Historical Apex Home Fit implementations are not architecture authorities. A historical implementation may inform a decision, but it cannot silently define one.

## Decision statuses

Foundation records use these statuses:

- **DRAFT** — proposed material that is not yet binding.
- **RESOLVED** — an accepted Foundation decision that implementation must follow.
- **SUPERSEDED** — a previously resolved decision replaced by a later recorded decision.
- **UNRESOLVED** — a matter intentionally left open and not available for implementation to decide implicitly.

When a resolved decision changes:

- do not silently rewrite history;
- mark the old decision **SUPERSEDED** where appropriate;
- record the replacement; and
- preserve Git history.

Unresolved matters must remain explicitly **UNRESOLVED**. No implementation assumption may silently resolve an unresolved product or domain decision.

## Resolved Foundation decisions

The resolved v0 Foundation consists of:

1. [Product Constitution](01-product-constitution.md)
2. [Domain Glossary](02-domain-glossary.md)
3. [Domain Model](03-domain-model.md)

The [unresolved register](unresolved.md) records matters that remain open. The [candidate-tool register](candidate-tools.md) records evaluation status without selecting a stack. The [`decisions/`](decisions/) directory is reserved for later Foundation decision records.

## Next Foundation priority

**NEXT FOUNDATION PRIORITY:**

**AHF-CLEAN-FOUNDATION-002**  
**Minimal Task/DAG Contract**

**Purpose:**

Reach a repository-native, machine-readable dependency model as early as possible so the Owner and architecture conversation do not become permanent manual task orchestrators.

The intended conceptual flow is:

```text
Decision
→ Work Item
→ Dependencies
→ READY / BLOCKED
→ Execution
→ Evidence
→ DONE
→ dependent work becomes READY
```

The DAG must eventually understand dependencies on unresolved/resolved decisions, not only dependencies between implementation tasks.

The DAG is not implemented by this task.
