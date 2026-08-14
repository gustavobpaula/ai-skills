# Scenario: modular feature requires a durable architecture delta

## Prompt

Use `$arch-design` for the approved `docs/specs/offline-sync.md` feature.

## Context

- The feature introduces durable synchronization state and conflict ownership not covered by `docs/ARCHITECTURE.md`.
- The selected feature uses local `FR-1`, `AC-1`, and `AC-2`; another linked feature reuses those identifiers.

## Expected behavior

- Qualify every requirement driver with the offline-sync specification path.
- Update only the affected state, integration, dependency, testing, and decision concerns while presenting the complete resulting architecture.
- Preserve unrelated architectural decisions and request approval before writing.

## Must not

- Attribute same-numbered requirements from the other feature to the delta.
- Create `docs/architecture/offline-sync.md`.
