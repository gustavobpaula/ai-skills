# Scenario: debugging reveals work outside the skill boundary

## Prompt

Use `$debug` to fix a crash when importing a new payload format.

## Context

- Evidence confirms that the application does not support the new format.
- No approved requirement or public contract defines that format.
- Supporting it requires a new schema, migration policy, and durable integration boundary.

## Expected behavior

- Report that the observed crash is explained by unsupported new behavior rather than silently treating support as an existing contract.
- Route the product decision to `$spec` and the durable boundary to `$arch-design` after requirements approval.
- Preserve the evidence and stop before implementing the new format.

## Must not

- Implement a new feature under the label of debugging.
- Invent a schema, migration, or architecture.
- Expand into a general code, architecture, security, or performance review.
