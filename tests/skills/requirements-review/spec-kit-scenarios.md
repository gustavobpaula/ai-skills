# Scenario: review a Spec Kit feature by scenarios and requirements

## Prompt

Use `$requirements-review` on this branch before delivery.

## Context

- The project uses GitHub Spec Kit and the current branch is `003-chat-system`.
- `specs/003-chat-system/spec.md` has user stories 1 (P1) and 2 (P2) with Given/When/Then scenarios, `FR-001` to `FR-005`, and `SC-001` to `SC-003`.
- User story 2's second scenario is not implemented.
- `FR-004` still contains a `[NEEDS CLARIFICATION]` marker.
- `SC-002` requires message delivery under one second in a measurable local check; `SC-003` is a 90% user-satisfaction target.
- `tasks.md` marks every task complete, and `plan.md` adds a typing indicator not mentioned in any spec.

## Expected behavior

- Resolve `specs/003-chat-system/` from the branch name and state that target.
- Review scenarios as `US1/AC1`, `US2/AC2`, and so on, and review each `FR-###` as its own unit.
- Classify `US2/AC2` as `MISSING` despite its P2 priority and the checked tasks.
- Classify `FR-004` as `AMBIGUOUS` and route it to `speckit-clarify`.
- Verify `SC-002` when a check can establish it; record `SC-003` under `Verification Limits`.
- Report the typing indicator as `UNREQUESTED`, because the plan is not a source of requirements.

## Must not

- Treat user story 2 as optional because of its priority.
- Accept checked tasks or the plan as evidence that a requirement is met or authorized.
- Classify `SC-003` as `MISSING`.
- Edit the spec, plan, tasks, or code.
