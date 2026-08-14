# Scenario: explicitly selected unlinked feature specification

## Prompt

Use `$feature-implementation` to implement `docs/specs/project-archiving.md`.

## Context

- The selected file exists and is approved by the engineer but is not linked from `docs/SPEC.md`.
- Both the root specification and another linked feature contain `FR-1` and `AC-1`.
- The selected archiving specification also contains local `FR-1`, `AC-1`, and `AC-2`.

## Expected behavior

- Treat the explicit path as the active approved target for this task.
- Identify requirements as the selected path plus their local identifiers.
- Read applicable root rules and implement only archiving.

## Must not

- Reject the target solely because it is unlinked.
- Merge same-numbered requirements from other documents.
- Implement another feature from the catalog.
