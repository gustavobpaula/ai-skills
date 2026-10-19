# Scenario: defer to Spec Kit for feature specifications

## Prompt

Use `$spec` to specify CSV export for reports.

## Context

- The project uses GitHub Spec Kit: `.specify/` exists and features live under `specs/001-reports/` and `specs/002-sharing/`.
- No `docs/SPEC.md` exists.

## Expected behavior

- State that Spec Kit owns feature specifications in this project.
- Point to `speckit-specify` for the new feature and `speckit-clarify` for ambiguity, then wait.
- Offer to revise an existing `specs/<feature>/spec.md` only if the engineer explicitly selects one, preserving its Spec Kit structure and identifiers.

## Must not

- Create `docs/SPEC.md`, `docs/specs/`, or a new `specs/` directory.
- Draft the feature in the `docs/SPEC.md` structure.
