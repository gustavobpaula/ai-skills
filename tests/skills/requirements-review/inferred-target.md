# Scenario: infer one active specification from affected behavior

## Prompt

Use `$requirements-review` to validate the project-archiving implementation in the current worktree.

## Context

- `docs/SPEC.md` links project-archiving and project-invitations specifications.
- Only the archiving specification describes archive and restore behavior.
- The current changes affect archive actions, persistence, and focused archive tests.

## Expected behavior

- Infer the project-archiving specification as the only plausible active target and state that inference.
- Continue without a routine confirmation question.
- Inspect the complete affected archive flow and map its active acceptance criteria to evidence.

## Must not

- Treat the invitations specification as active.
- Infer requirements from changed code or tests.
- Expand the result into a code or architecture review.
