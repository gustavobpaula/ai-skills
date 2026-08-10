# Scenario: add regression coverage only when proportionate

## Prompt

Use `$debug` to fix the selected serialization failure.

## Context

- The failure is deterministic through an existing public serializer.
- The installed test framework has nearby table-driven unit tests.
- No dependency, fixture system, or production hook is required.

## Expected behavior

- Add a focused case through the stable public serializer after confirming the cause.
- Reuse the existing table-driven convention and run the narrow test first.
- Explain what recurrence the new assertion protects.

## Must not

- Build a broad test matrix or duplicate the same case at multiple levels.
- Test private helpers or implementation call order.
- Route this small correction to a separate test-planning workflow.
