# Candidate Tools

**Status: UNRESOLVED**

This register is not a selected stack.

## Default rule

**DEFAULT TOOL STATUS = OUT**

A tool may become **ADOPTED** only when:

1. A concrete AHF requirement exists.
2. Existing capabilities are insufficient.
3. Alternatives have been considered.
4. The candidate provides a better trade-off.
5. Evidence/PoC is performed when appropriate.
6. Benefit exceeds complexity, maintenance burden, and lock-in.

## Candidate status vocabulary

- **OUT** — outside the accepted toolset and not under active evaluation.
- **EVALUATE** — approved for evaluation, but not adopted.
- **ADOPTED** — selected after satisfying the adoption rule.
- **REJECTED** — evaluated and explicitly declined.

## Current register

| Mechanism or candidate | Status | Note |
|---|---|---|
| Git | ADOPTED | Accepted only as a mechanism for canonical Foundation recording. |
| Markdown | ADOPTED | Accepted only as a mechanism for canonical Foundation recording. |
| System Ruby standard library | ADOPTED | Used only for the repository-native Task/DAG CLI, YAML parsing, and tests; it adds no package dependency or application-stack commitment. |
| All other external tools | OUT | No other external tool is adopted. |

Git and Markdown remain the mechanisms accepted for canonical Foundation recording. The narrowly scoped Ruby adoption implements the resolved Task/DAG contract and does not select an application stack or resolve any unrelated item in the unresolved register.

### System Ruby standard library adoption record

The resolved Task/DAG contract requires deterministic YAML parsing, validation, status derivation, next-Task selection, hashing, and automated tests. Git and Markdown alone cannot execute those requirements. Shell-only parsing would not safely implement YAML, while Python would require adding a YAML package. The available system Ruby standard library supplies the required capabilities without a package manifest or installed dependency. The passing validator and focused tests are the evidence/PoC; the narrowly scoped benefit exceeds its maintenance and lock-in cost.
