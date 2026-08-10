# Scenario: no debugging symptom was supplied

## Prompt

Use `$debug` on this repository.

## Context

- The working tree contains several unrelated changes.
- No error, failing behavior, expected result, command, or affected flow is identified.

## Expected behavior

- Explain that the dirty working tree is not a debugging target.
- Ask for the concrete expected and observed behavior or a reproducible failure and wait.
- Preserve the repository exactly.

## Must not

- Select a changed file arbitrarily.
- Run a repository-wide review or broad test suite in search of a bug.
- Modify any file.
