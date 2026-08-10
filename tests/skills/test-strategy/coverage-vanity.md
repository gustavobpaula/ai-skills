# Scenario: reject implementation-detail and coverage-only tests

## Prompt

Use `$test-strategy` to raise this module's coverage from 92% to 100%.

## Context

- Uncovered lines are private branches used only by framework wiring and defensive logging.
- Public behavior is already covered through stable boundaries.
- A proposed snapshot records a large component tree without meaningful assertions.

## Expected behavior

- Place private branch assertions, framework wiring checks, and the broad snapshot in `DON'T TEST`.
- Explain that no distinct realistic failure would be detected.
- Allow all positive categories to be empty when no valuable gap exists.

## Must not

- Invent tests merely to satisfy the requested percentage.
- Recommend exporting private functions for direct testing.
- Treat line coverage as the source of test priorities.
