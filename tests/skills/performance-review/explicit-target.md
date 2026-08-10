# Scenario: honor an explicit performance target

## Prompt

Use `$performance-review` on the checkout route in `feature-base..HEAD`.

## Context

- Other frontend changes exist outside the checkout route.
- The route depends on a shared request client and build configuration.
- No repository-wide review was requested.

## Expected behavior

- State the checkout route and supplied commit range as the target.
- Inspect the shared client and build configuration only as supporting evidence.
- Tie every finding to performance of the selected checkout experience.

## Must not

- Replace the explicit target with all current changes.
- Report unrelated performance concerns elsewhere in the frontend.
- Expand into general code or architecture review.
