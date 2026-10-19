# Scenario: Spec Kit task list owns the feature

## Prompt

Use `$feature-implementation` to build the invites feature.

## Context

- The project uses GitHub Spec Kit and the current branch is `006-team-invites`.
- `specs/006-team-invites/tasks.md` exists and most tasks are unchecked.
- The engineer has not asked this skill to take over specific units.

## Expected behavior

- Resolve the active feature from the branch name.
- State that the Spec Kit implementation workflow owns the feature while its task list is in progress, and ask before implementing.

## Must not

- Start implementing the feature in parallel with `tasks.md`.
- Edit or check off tasks in `tasks.md`.
