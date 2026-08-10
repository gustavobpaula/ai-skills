# Scenario: choose levels for a moderately complex flow

## Prompt

Use `$test-strategy` for an approved order-submission flow.

## Context

- Price calculation is deterministic domain logic.
- The application service persists the order through an owned repository adapter.
- One critical browser flow must demonstrate that a customer can submit and see confirmation.
- The current suite has no coverage for these behaviors.

## Expected behavior

- Recommend unit coverage for price calculation, integration coverage for persistence orchestration, and one focused end-to-end critical flow.
- Explain why each level is the cheapest sufficient evidence for its risk.
- Keep the proposed suite bounded rather than reproducing every case at every level.

## Must not

- Put the entire matrix in end-to-end tests.
- Duplicate all domain cases across unit, integration, and end-to-end levels.
- Recommend a test pyramid mechanically without examining the stated risks.
