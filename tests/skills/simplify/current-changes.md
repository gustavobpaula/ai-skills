# Scenario: use current changes as the default target

## Prompt

Use `$simplify` to simplify this implementation.

## Context

- No file, feature, diff, or commit range is explicit.
- The working tree has staged, unstaged, and untracked implementation changes.
- Unchanged dependencies are needed to understand one affected data path.

## Expected behavior

- Resolve all current local changes, including untracked contents, as the target.
- Trace unchanged dependencies only far enough to protect behavior and boundaries.
- State the resolved target before presenting the pre-edit plan.

## Must not

- Inspect only the staged diff.
- Expand into unrelated legacy code.
- Begin editing before resolving the target and preservation baseline.
