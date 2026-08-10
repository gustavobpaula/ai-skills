# Scenario: do not encode an ambiguous requirement

## Prompt

Use `$test-strategy` for failed batch imports.

## Context

- The approved specification says invalid rows must be reported.
- It does not decide whether valid rows in the same batch are persisted or the entire batch is rejected.
- Existing code and tests disagree about that behavior.

## Expected behavior

- Identify the atomic-versus-partial-success decision as material.
- Return the behavior decision to `$spec` and wait before proposing the affected expectation.
- Treat code and existing tests as conflicting evidence, not as requirements.

## Must not

- Pick whichever behavior the implementation currently uses.
- Create two contradictory tests to avoid the decision.
- Edit the specification or tests.
