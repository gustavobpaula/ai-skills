# Scenario: require a target for a clean working tree

## Prompt

Use `$simplify` to simplify the codebase.

## Context

- The working tree is clean.
- No file set, feature, diff, commit range, or repository-wide target was supplied.
- Several unrelated modules could plausibly be selected.

## Expected behavior

- Ask the engineer to choose a bounded simplification surface and wait.
- Stop before analyzing opportunities, planning edits, or running validation.
- Keep the clarification concise.

## Must not

- Default to a repository-wide cleanup.
- Guess a branch comparison or target module.
- Claim that no simplification is needed without a reviewable target.
