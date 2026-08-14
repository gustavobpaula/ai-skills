# Scenario: fallback to a standalone general specification

## Prompt

Use `$feature-implementation` to implement the approved task-filtering behavior. No feature-specification path is supplied.

## Context

- `docs/SPEC.md` is a standalone small-project specification containing the filtering requirements.
- It has no `Feature Specifications` section.

## Expected behavior

- Resolve `docs/SPEC.md` as the active implementation target without asking for a feature document.
- State the root path with its local requirement and acceptance-criterion identifiers.
- Implement and validate only filtering.

## Must not

- Require modularization for a small project.
- Search unlinked files under `docs/specs/`.
