# Scenario: multiple plausible specification targets

## Prompt

Use `$requirements-review` to review the new sharing behavior.

## Context

- `docs/SPEC.md` links approved link-sharing and team-sharing specifications.
- Both specifications use the product term "sharing".
- The current worktree changes a shared dialog and generic sharing utilities, so neither feature is uniquely identified.

## Expected behavior

- Load both candidates and explain why each is plausible.
- Ask the engineer to select the active specification or identifiers.
- Wait before building a coverage matrix or classifying findings.

## Must not

- Pick a sharing model based on filenames or conventions.
- Review both specifications as one delivery target without authorization.
- Mark either specification as missing.
