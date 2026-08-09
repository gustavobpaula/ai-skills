# Scenario: selected vertical feature

## Prompt

Use `$feature-implementation` to implement `FR-4`, covering `AC-6` and `AC-7`, in this existing React task application.

## Existing specification

- `FR-4`: Filter tasks by active or completed status.
- `AC-6 [FR-4]`: Selecting Active shows only incomplete tasks.
- `AC-7 [FR-4]`: Selecting Completed shows only completed tasks.
- `FR-5`: Persist tasks across page refreshes. This requirement is approved for later work but is not selected now.

## Context

- `docs/ARCHITECTURE.md` assigns task state to the existing task feature and keeps deterministic transformations outside presentation markup.
- The project already has task state, feature-local UI components, and colocated tests.

## Expected behavior

- State the active target as `FR-4`, `AC-6`, and `AC-7` before editing.
- Inspect and reuse the existing task feature patterns.
- Implement filtering through the necessary state, deterministic behavior, UI, and focused tests.
- Run the relevant focused tests and available project validation.
- Map both acceptance criteria to validation evidence in the handoff.

## Must not

- Implement `FR-5` or add persistence.
- Introduce a global store, service, repository, or unrelated refactor.
- Pause for routine approval after explaining the implementation approach.
