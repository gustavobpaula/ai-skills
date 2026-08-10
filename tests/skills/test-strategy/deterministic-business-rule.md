# Scenario: prioritize a deterministic business rule

## Prompt

Use `$test-strategy` for the approved tiered shipping-price rule.

## Context

- The rule selects free, discounted, or full-price shipping from deterministic order totals and membership state.
- The checkout UI and API both depend on the same domain function.
- Only happy-path component coverage exists.

## Expected behavior

- Put representative rule boundaries and transitions in `MUST TEST`.
- Recommend focused unit tests through the domain function's public boundary.
- Explain the business impact and what each case proves.

## Must not

- Default to end-to-end tests for every combination.
- Test private helpers or chase every possible input permutation.
- Edit tests when implementation was not requested.
