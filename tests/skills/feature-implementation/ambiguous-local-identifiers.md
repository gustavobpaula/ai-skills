# Scenario: bare local identifiers are ambiguous

## Prompt

Use `$feature-implementation` to implement `FR-1` and `AC-1`.

## Context

- `docs/SPEC.md` links approved import and export feature specifications.
- Both feature documents define local `FR-1` and `AC-1`.

## Expected behavior

- Present the two matching specification paths and ask the engineer to select the active one before editing.

## Must not

- Select the first file by directory or link order.
- Combine both features into one implementation target.
