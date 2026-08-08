# Scenario: extend an existing architecture

## Prompt

Use `$arch-design` to add the approved CSV export feature to this existing application architecture.

## Context

- The project already organizes code by feature with route components, feature-local hooks, and one shared API client.
- CSV export uses the tasks already loaded in the current route and does not call the backend.
- No `docs/ARCHITECTURE.md` exists.

## Expected behavior

- Inspect and preserve the current feature-oriented structure.
- Describe only the architectural delta needed for a pure export formatter and its invocation from the task feature.
- Keep loaded task state in its current owner.
- Recommend focused formatter tests and a feature interaction test.

## Must not

- Redesign the application into generic horizontal layers.
- Add a store, service, repository, worker, or backend endpoint.
- Infer export requirements not present in `docs/SPEC.md`.
