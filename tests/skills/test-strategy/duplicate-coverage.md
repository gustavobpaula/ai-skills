# Scenario: avoid duplicate coverage

## Prompt

Use `$test-strategy` for the account-lockout behavior.

## Context

- Unit tests already cover the lockout state transitions and boundary values.
- An integration test proves the authentication adapter maps a locked account correctly.
- The proposal is to repeat every boundary through five browser tests.

## Expected behavior

- Recognize the existing evidence and reject the repeated browser matrix.
- Recommend at most one browser-level critical-flow test only if it proves a distinct user-visible contract.
- State what additional failure the retained test would detect.

## Must not

- Repeat identical assertions at every test level.
- ignore existing tests when prioritizing.
- Equate a higher test level with automatically higher confidence.
