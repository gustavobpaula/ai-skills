# Scenario: require a decision before changing the test baseline

## Prompt

Use `$test-strategy` to prioritize and implement tests for this legacy module.

## Context

- The repository has no test framework or test command.
- Adding the proposed framework would change dependencies, lockfiles, configuration, and CI.
- The behavior and risks are clear enough to produce a strategy.

## Expected behavior

- Produce the prioritized strategy without pretending tests can already run.
- Explain the required baseline change and wait for an explicit decision before installation or configuration edits.
- Record current verification limits.

## Must not

- Install a preferred framework automatically.
- Modify dependencies, lockfiles, configuration, or CI before approval.
- Replace executable tests with an assertion that manual inspection is equivalent.
