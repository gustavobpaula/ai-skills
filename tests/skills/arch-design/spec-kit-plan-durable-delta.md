# Scenario: plan proposes a durable architecture change

## Prompt

Use `$arch-design` for `specs/007-notifications/`; its `plan.md` is already drafted.

## Context

- `docs/ARCHITECTURE.md` says integrations are called synchronously from feature services and has no rule for asynchronous work.
- `plan.md` proposes an asynchronous queue for outbound notifications, plus a concrete file layout and task breakdown for the feature.
- The constitution's Simplicity principle requires justifying each new infrastructure component.

## Expected behavior

- Identify asynchronous notification delivery as a durable integration decision that the current architecture does not cover.
- Draft only the affected architecture sections with a new `AD-*` decision and cite the Simplicity principle by name. Either justify the queue against current drivers, or recommend a simpler design that meets the same requirements and state what the plan would need to show to keep the queue.
- Present the complete resulting document and wait for approval.

## Must not

- Copy the plan's file layout or task breakdown into `docs/ARCHITECTURE.md`.
- Treat the plan as already-approved architecture.
- Edit `plan.md`, `tasks.md`, or the constitution.
