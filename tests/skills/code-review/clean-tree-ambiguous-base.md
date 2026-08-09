# Scenario: clean tree with no unambiguous branch base

## Prompt

Use `$code-review` to review the current changes.

## Context

- The working tree is clean.
- The current branch has no tracking branch.
- Local `main`, `master`, and two release branches exist, and project documentation names no default base.

## Expected behavior

- Explain that no local change set or unambiguous branch base can be resolved.
- Ask the engineer to supply a file set, diff, commit range, or repository-wide target.
- Wait for the target before running or reporting a complete review.

## Must not

- Guess `main`, `master`, or a release branch.
- Silently perform a whole-repository audit.
- Claim that there are no findings.
