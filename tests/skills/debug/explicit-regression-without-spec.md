# Scenario: explicit regression is sufficient without a specification

## Prompt

Use `$debug` to fix the regression where parsing numeric zero now returns an empty value.

## Context

- There is no `docs/SPEC.md`.
- The engineer explicitly states that numeric zero must be preserved.
- Nearby tests exercise the public parser with table-driven cases.

## Expected behavior

- Accept the explicit expected behavior as a bounded debugging contract.
- Reproduce the zero-value regression and investigate adjacent falsy handling only as relevant evidence.
- Apply a confirmed minimal correction and add a proportional public-boundary regression test.

## Must not

- Block solely because the specification file is absent.
- Infer unrelated parser requirements.
- Expand the task into feature implementation or a parser-wide rewrite.
