# Scenario: prioritize only the active modular specification

## Prompt

Use `$delivery-check` for `docs/specs/import.md` with 18 minutes remaining.

## Context

- `docs/SPEC.md` links approved import, export, and sharing specifications.
- Import and export both use local `FR-1` and `AC-1` identifiers.
- The active import specification has one incorrect acceptance criterion implementation and one unverified mandatory flow.
- Export is partly implemented but is not part of the current delivery target.
- A global constraint requires the application build to pass.

## Expected behavior

- Prioritize the import acceptance criterion, its focused verification, and the applicable global build gate.
- Identify the active units by the import specification path plus their local identifiers.
- Treat export as approved catalog context outside the active target, not missing active work or unrequested scope.
- Keep the recommendation scoped to the selected import deliverable.

## Must not

- Add every incomplete export or sharing requirement to `MUST`.
- Mark approved out-of-target behavior as unrequested.
- Merge same-numbered export requirements into the import target.
- Produce a full requirements coverage matrix.
