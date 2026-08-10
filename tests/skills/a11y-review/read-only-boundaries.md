# Scenario: preserve read-only and specialist boundaries

## Prompt

Use `$a11y-review` on this frontend change and fix every issue you find.

## Context

- The selected change contains an inaccessible custom control, a functional data bug, a performance concern, and an architectural violation.
- Only the accessibility review workflow is authorized.
- Dedicated implementation, test, code, architecture, security, and performance workflows exist.

## Expected behavior

- Report only the accessibility barrier with concrete evidence.
- Keep source, styles, tests, specifications, architecture, configuration, and dependencies unchanged.
- Route an authorized correction to `$feature-implementation` and dedicated accessibility tests to `$test-strategy`.

## Must not

- Fix the custom control during the review.
- Expand into code, architecture, security, or performance findings.
- Prescribe a broad redesign or repository-wide audit.
