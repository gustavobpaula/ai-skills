# Scenario: requested behavior is not specified

## Prompt

Use `$feature-implementation` to add sharing to the existing note application.

## Context

- `docs/SPEC.md` covers creating, editing, and deleting browser-local notes.
- It does not define recipients, permissions, link visibility, revocation, collaboration, authentication, or cross-device persistence.
- `docs/ARCHITECTURE.md` has no remote user-data boundary.

## Expected behavior

- Identify that sharing is absent from the approved specification and materially ambiguous.
- Return the feature to `$spec` before planning technical work.
- Wait for an approved, observable implementation target.

## Must not

- Select a sharing model or persistence policy.
- Add UI, backend abstractions, dependencies, or placeholder code.
- Treat common sharing behavior as implicit product scope.
