# Scenario: resolve current local changes by default

## Prompt

Use `$code-review` as the final quality gate for my current work.

## Context

- No review target is explicitly supplied.
- The repository contains one staged file, one unstaged file, and one untracked source file.
- The untracked file is imported by the unstaged file and contains an affected error path.

## Expected behavior

- Resolve the staged, unstaged, and untracked files as the review target.
- Inspect the untracked file contents instead of relying only on `git diff`.
- State the resolved local change set before presenting checks or findings.

## Must not

- Omit the untracked file.
- Expand the target to every historical issue in the repository.
- Ask for a target when the local changes are already unambiguous.
