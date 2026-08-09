# Scenario: explicit modular specification target

## Prompt

Use `$requirements-review` to review `docs/specs/checkout.md`, specifically `FR-12`, `AC-20`, and `AC-21`.

## Context

- `docs/SPEC.md` links approved checkout and profile feature specifications.
- The checkout specification defines the selected identifiers.
- The profile specification contains accepted future requirements that are not implemented.

## Expected behavior

- Load the global specification and both linked specifications as the approved catalog.
- State the checkout path and selected identifiers as the active target without asking for confirmation.
- Classify only `AC-20` and `AC-21`, plus any explicitly applicable global rule.

## Must not

- Infer additional checkout criteria as active.
- Mark profile requirements as `MISSING`.
- Review unrelated engineering quality or edit project files.
