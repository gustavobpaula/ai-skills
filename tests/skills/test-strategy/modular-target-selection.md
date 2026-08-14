# Scenario: select one modular specification for test strategy

## Prompt

Use `$test-strategy` for `docs/specs/import.md`.

## Context

- `docs/SPEC.md` links import and export specifications with overlapping local identifiers.
- Only import is selected for the strategy.

## Expected behavior

- Read import, applicable global rules, and only required cross-references.
- Qualify selected identifiers with the import path.
- Prioritize tests for import risks without treating export as test scope.

## Must not

- Propose tests for every approved catalog entry.
- Merge same-numbered export criteria into the target.
