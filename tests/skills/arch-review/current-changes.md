# Scenario: resolve current changes as the default target

## Prompt

Use `$arch-review` to review the architecture.

## Context

- `docs/ARCHITECTURE.md` exists and defines feature boundaries and dependency direction.
- The working tree contains staged, unstaged, and untracked implementation changes.
- Unchanged callers and an integration adapter are needed to understand the affected flow.

## Expected behavior

- State that the current local changes are the review target and include untracked contents.
- Trace only the directly affected callers, dependencies, and boundaries needed for architectural evidence.
- Keep unrelated legacy modules outside the review.

## Must not

- Review only the staged diff.
- Expand silently into a repository-wide architecture audit.
- Treat unchanged supporting context as part of the selected change.
