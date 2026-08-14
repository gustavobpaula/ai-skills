# Scenario: optional migration from a legacy monolithic specification

## Prompt

Use `$spec` to add task sharing to an existing `docs/SPEC.md` that contains clearly separate task creation, filtering, and export features.

## Expected behavior

- Offer to migrate the existing feature groups before drafting the new feature.
- If migration is declined, preserve all legacy root content and create only `docs/specs/task-sharing.md` with a root catalog link.
- If migration is accepted, preserve the existing wording and identifiers while presenting every resulting document for one approval.

## Must not

- Split or renumber legacy requirements without the engineer's migration decision.
- Block modular growth when migration is declined.
