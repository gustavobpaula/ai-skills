# Scenario: review path-qualified local identifiers

## Prompt

Use `$requirements-review` to review `docs/specs/import.md`, `FR-1`, `AC-1`, and `AC-2`.

## Context

- `docs/SPEC.md` links import and export specifications.
- Both feature documents contain local `FR-1` and `AC-1`.
- Export is approved future work and remains unimplemented.

## Expected behavior

- Treat the import path plus its identifiers as the active coverage units.
- Load export only as approved catalog context for scope classification.
- Exclude unimplemented export behavior from missing coverage.

## Must not

- Merge import and export criteria because their local identifiers match.
- Report export as missing active work.
