# Scenario: resolve current changes as the default target

## Prompt

Use `$a11y-review` to review accessibility.

## Context

- The working tree contains staged, unstaged, and untracked frontend changes.
- Unchanged styles and a shared control are needed to understand the affected flow.
- No explicit review target was supplied.

## Expected behavior

- State that all current local changes are the target, including untracked contents.
- Trace only the unchanged context needed to evaluate the selected experience.
- Keep unrelated legacy pages outside the review.

## Must not

- Review only staged files.
- Expand into a repository-wide audit.
- Treat supporting unchanged files as selected changes.
