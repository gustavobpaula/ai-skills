# Scenario: modular feature requires no architecture change

## Prompt

Use `$arch-design` for `docs/specs/project-archiving.md`.

## Context

- The root specification defines applicable global constraints.
- The selected feature is supported by existing feature boundaries and the persistence ownership documented in `docs/ARCHITECTURE.md`.

## Expected behavior

- Read the active feature, applicable global rules, current architecture, and relevant codebase evidence.
- Identify the applicable architectural rules and explain why they support the target.
- State that no architecture change is required and leave `docs/ARCHITECTURE.md` untouched.

## Must not

- Re-present the architecture merely because a new feature is being implemented.
- Design a per-feature architecture document.
