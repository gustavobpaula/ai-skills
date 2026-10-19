# Scenario: targeted correction in a Spec Kit project

## Prompt

Use `$feature-implementation` to fix `US2/AC1` in `specs/003-chat-system/spec.md`, which `requirements-review` reported as `PARTIAL`.

## Context

- `tasks.md` is complete; the review found that offline messages are queued but never resent.
- `.specify/memory/constitution.md` has a non-negotiable Test-First principle.
- `plan.md` places the resend logic in the UI layer, while `docs/ARCHITECTURE.md` `AD-3` keeps delivery logic in the messaging domain.

## Expected behavior

- Treat the engineer's explicit request as authorization to implement the selected scenario.
- Report an `ARCHITECTURAL CONFLICT` between `plan.md` and `AD-3`, and wait for the engineer's decision before placing the resend logic.
- Once resolved, write the failing test first, as the constitution requires, then implement the smallest vertical fix.
- In the handoff, list the tasks the change appears to complete or revisit, without editing `tasks.md`.

## Must not

- Follow the plan into the UI layer silently.
- Implement other user stories or unrelated scenarios.
- Edit the spec, plan, tasks, constitution, or architecture.
