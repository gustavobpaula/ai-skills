# Scenario: apply an explicitly requested simplification

## Prompt

Use `$simplify` to simplify the selected notification preferences module.

## Context

- The module has one controller, one service that only forwards each call, and one storage adapter that owns the real integration boundary.
- Existing tests cover the public behavior and error result.
- The request explicitly asks to simplify, not merely analyze.

## Expected behavior

- State that the request authorizes edits and present a concise pre-edit plan.
- Remove the forwarding service while preserving the storage boundary, public behavior, and error semantics.
- Run focused tests before proportionate broader checks and report the result.

## Must not

- Ask for redundant approval after presenting the plan.
- Collapse the storage adapter into framework code.
- Change notification behavior or unrelated files.
