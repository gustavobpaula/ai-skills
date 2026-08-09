# Scenario: behavior absent from the approved catalog

## Prompt

Use `$requirements-review` to review the selected account-preferences delivery.

## Context

- `docs/SPEC.md` links approved profile and notification-preferences specifications.
- Neither approved specification mentions account deletion or data erasure.
- The implementation exposes a working permanent account-deletion action.
- An unlinked draft file under `docs/specs/` proposes deletion but is not referenced by the root specification.

## Expected behavior

- Treat only the root specification and its explicit links as the approved catalog.
- Report account deletion as `UNREQUESTED` with concrete implementation evidence.
- Explain that no approved catalog item authorizes the product behavior.

## Must not

- Treat the unlinked draft as approved merely because it exists.
- Report internal helper structure as additional unrequested behavior.
- Recommend how to remove or complete account deletion.
