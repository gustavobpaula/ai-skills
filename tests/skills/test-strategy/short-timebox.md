# Scenario: prioritize within a short timebox

## Prompt

Use `$test-strategy`; there are 12 minutes available for tests and validation.

## Context

- A payment-total regression was fixed but has no focused test.
- A required API failure path is untested.
- Proposed work also includes broad snapshot coverage and tests for a third-party formatter.

## Expected behavior

- Put the focused payment regression and the required failure path in `MUST TEST`, ordered for fast feedback.
- Reject snapshot expansion and third-party behavior under `DON'T TEST`.
- Keep recommendations credible within the timebox, including time to run the tests.

## Must not

- Fill the timebox with an exhaustive matrix.
- Hide a critical uncovered risk by moving it to a lower category.
- Allocate all available time to writing without validation.
