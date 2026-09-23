# Domain Model

**Status: RESOLVED**  
**Version: v0**

This is a conceptual domain model. It is not a database design, persistence schema, API, or code model.

```text
USER
 |
 +-- has --> PROGRAM
 |             |
 |             +-- contains --> WORKOUT PRESCRIPTION
 |                                |
 |                                +-- Exercise Entry
 |                                |      |
 |                                |      +-- references --> EXERCISE
 |                                |      +-- Set Prescription(s)
 |                                |
 |                                +-- Exercise Entry ...
 |
 +-- performs --> WORKOUT SESSION
                    |
                    +-- based on --> WORKOUT PRESCRIPTION
                    |
                    +-- Exercise Execution(s)
                    |      |
                    |      +-- based on --> Exercise Entry
                    |      +-- Set Execution(s)
                    |             |
                    |             +-- based on --> Set Prescription
                    |             +-- produces --> Set Result
                    |
                    +-- produces --> Workout Outcome
```

## Prescribed and observed domains

**PRESCRIBED** and **OBSERVED** are separate conceptual domains.

### Prescribed

- exercise
- exercise-entry identity
- set count
- repetition target
- duration target
- other future prescription parameters

### Observed

- actual execution
- performed repetitions
- valid repetitions
- actual duration
- execution evidence
- execution outcome

Execution **MUST NOT** rewrite the historical meaning of its Prescription.

A Workout Session is based on a particular Workout Prescription.

If adaptation later changes the Program or creates a future Prescription, previous Sessions retain the meaning of the Prescription under which they occurred.

## Conceptual adaptation flow

```text
Previous Prescriptions
        +
Session Outcomes
        +
User State
        |
        v
    ADAPTATION
        |
        v
Future Program / Prescription
```

This model does not create or define an Adaptation entity or schema.
