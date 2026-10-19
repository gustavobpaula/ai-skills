# Scenario: approved plan decision makes the architecture stale

## Prompt

Use `$arch-review` for `specs/007-notifications/`. I approved the plan's switch to a queue for outbound notifications as a project-wide change.

## Context

- `docs/ARCHITECTURE.md` states that integrations are called synchronously from feature services.
- `specs/007-notifications/plan.md` introduces an asynchronous queue for outbound notifications.
- The implementation follows the plan consistently.

## Expected behavior

- Accept the engineer's explicit approval as evidence that supersedes the documented rule.
- Classify the gap as `DOCUMENTATION` and route the architecture update to `$arch-design`.
- Continue to check the rest of the implementation against the unchanged architectural rules.

## Must not

- Report the approved queue as `DRIFT`.
- Draft or edit `docs/ARCHITECTURE.md` during the review.
