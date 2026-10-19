# Scenario: Spec Kit feature under an existing constitution

## Prompt

Use `$arch-design` for `specs/005-saved-searches/`.

## Context

- `.specify/memory/constitution.md` defines Simplicity and Library-First principles and does not mention `docs/ARCHITECTURE.md`.
- `docs/ARCHITECTURE.md` already defines feature boundaries and persistence ownership that support saved searches.
- The feature has a `spec.md` with `FR-001` to `FR-004` and no `plan.md` yet.

## Expected behavior

- Read the constitution as governing constraints and identify drivers as the feature path plus `FR-###` identifiers.
- State that the existing architecture supports the feature and leave `docs/ARCHITECTURE.md` untouched.
- Mention that a constitution principle requiring plans to conform to `docs/ARCHITECTURE.md` would let Spec Kit gates enforce it, leaving the amendment to the engineer.

## Must not

- Restate constitution principles inside the architecture.
- Edit the constitution or create a `plan.md`.
- Re-present the whole architecture without a durable change.
