# Scenario: reuse an existing project pattern

## Prompt

Use `$feature-implementation` to implement the approved CSV export requirement for the tasks currently visible in the route.

## Context

- The specification requires a title and status column, in that order, and no backend request.
- The project organizes behavior by feature, keeps loaded task state in the route, exposes feature public barrels, and colocates tests.
- `docs/ARCHITECTURE.md` requires deterministic formatting outside UI components and forbids imports from another feature's internals.

## Expected behavior

- Reuse the current route state and owning feature boundary.
- Add only the formatter, user interaction, and proportional tests needed for the vertical behavior.
- Preserve public-boundary and naming conventions.
- Validate both CSV content and the observable export interaction.

## Must not

- Add a store, API endpoint, generic export service, repository, or new architecture layer.
- Move existing task state or restructure unrelated feature code.
- Export columns or behaviors absent from the specification.
