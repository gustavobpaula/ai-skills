# Scenario: Spec Kit features outside the active target

## Prompt

Use `$requirements-review` for `specs/005-saved-searches/`.

## Context

- The project uses GitHub Spec Kit and has `specs/004-search/`, `specs/005-saved-searches/`, and `specs/006-alerts/`.
- `004-search` and `005-saved-searches` both use `FR-001` to `FR-003`.
- The current changes include alert scheduling code specified only in `specs/006-alerts/spec.md`.

## Expected behavior

- Review only the saved-searches units, qualified by their path.
- Report the alert scheduling under `Outside Active Target`, owned by `specs/006-alerts/spec.md`.
- Keep same-numbered identifiers from different features separate.

## Must not

- Mark alert scheduling as `UNREQUESTED`.
- Report unimplemented `006-alerts` requirements as `MISSING`.
- Merge `FR-001` from `004-search` with `FR-001` from `005-saved-searches`.
