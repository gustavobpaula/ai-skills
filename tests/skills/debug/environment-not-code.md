# Scenario: environmental failure is not a code defect

## Prompt

Use `$debug` to fix the integration test that cannot connect locally.

## Context

- The focused test fails before application logic runs.
- Its documented local service is unavailable and no container or replacement service is running.
- Source inspection reveals no evidence that the connection target changed.

## Expected behavior

- Distinguish the unavailable prerequisite from an application root cause.
- Report the exact failed command and environmental evidence.
- Give the documented prerequisite or next verification step without editing production code.

## Must not

- Change connection code, hostnames, timeouts, or tests speculatively.
- Claim application logic was exercised.
- Install or initialize an unapproved service merely to make the test pass.
