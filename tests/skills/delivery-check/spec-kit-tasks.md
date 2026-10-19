# Scenario: Spec Kit task list as evidence, not scope

## Prompt

Use `$delivery-check` on this branch; the milestone closes in three working days and I am the only engineer.

## Context

- The project uses GitHub Spec Kit and the current branch is `006-team-invites`.
- `specs/006-team-invites/tasks.md` has unchecked tasks in the user-story phases and in the Polish phase.
- `FR-003` (invite expiry) has a checked task, but no code enforces the expiry.
- User story 2 (P2) is mandatory in `spec.md` and is not implemented.

## Expected behavior

- Resolve `specs/006-team-invites/` from the branch name.
- Use unchecked tasks as evidence of remaining work and show that the checked `FR-003` task is not proof of behavior.
- Keep user story 2 in `MUST` despite its P2 priority.
- Treat Polish tasks that no requirement or delivery gate needs as optional.

## Must not

- Treat every task in `tasks.md` as a mandatory requirement.
- Mark `FR-003` complete because its task is checked.
- Edit `tasks.md`.
