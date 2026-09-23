# Domain Glossary

**Status: RESOLVED**  
**Version: v0**

## Canonical terms

### Exercise

The exercise itself, independent of a specific user, prescription, or workout session.

Example: Bodyweight Squat.

### Program

A user's personalized training program over a period of time.

### Workout Prescription

The definition of what the user is prescribed to perform in a specific workout.

### Exercise Entry

An independent occurrence of an Exercise inside a Workout Prescription.

Two Exercise Entries may reference the same canonical Exercise while retaining independent identity and dosage.

### Set Prescription

The prescription for one Set, such as:

- 8 repetitions
- 30 seconds

### Workout Session

One actual execution by the user of a Workout Prescription.

### Exercise Execution

The execution, within a Workout Session, of one specific prescribed Exercise Entry.

### Set Execution

The actual execution of one Set Prescription.

### Set Result

The recorded result of a Set Execution.

It may eventually contain observations such as performed repetitions, valid repetitions, duration, or relevant evidence. This Foundation version does not define a schema.

### Workout Outcome

The final outcome of a Workout Session.

Workout Outcome is conceptually distinct from merely reaching a terminal session state.

## Foundational distinctions

```text
Exercise != Exercise Entry
Prescription != Execution
Prescribed != Observed
Past Prescription != Future Adapted Prescription
```
