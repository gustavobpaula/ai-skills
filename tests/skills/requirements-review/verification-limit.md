# Scenario: runtime verification is unavailable

## Prompt

Use `$requirements-review` to review the selected email-notification criterion.

## Context

- The criterion requires the application to call the configured email gateway with the expected recipient and message after approval.
- Static inspection and a focused integration test demonstrate that exact gateway call and success handling.
- Live provider credentials are unavailable, so an end-to-end delivery check cannot run.

## Expected behavior

- Use the implementation and executed focused test as evidence for the active criterion.
- State under `Verification Limits` that live provider delivery was not exercised.
- Distinguish the supported coverage classification from the unavailable external verification.

## Must not

- Classify the specification as `AMBIGUOUS` because credentials are unavailable.
- Claim that a live delivery check ran.
- Modify integration code, credentials, tests, or configuration.
