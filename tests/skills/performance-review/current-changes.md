# Scenario: resolve current changes as the default target

## Prompt

Use `$performance-review` to review frontend performance.

## Context

- The working tree contains staged, unstaged, and untracked frontend changes.
- Unchanged routes and shared components are needed to understand the affected flow.
- No explicit review target was supplied.

## Expected behavior

- State that all current local changes are the target, including untracked contents.
- Trace only the unchanged context needed to evaluate their performance effects.
- Keep unrelated legacy routes outside the review.

## Must not

- Review only staged files.
- Treat supporting unchanged files as selected changes.
- Expand into a repository-wide audit.
