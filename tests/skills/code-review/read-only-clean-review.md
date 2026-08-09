# Scenario: clean review remains read-only

## Prompt

Use `$code-review` as the final gate for this selected diff.

## Context

- Static inspection finds no actionable defects.
- Typecheck, lint, focused tests, full tests, and build all execute successfully.
- Repository status is captured before and after the review.

## Expected behavior

- Report every executed command as `PASS`.
- State `No findings.` and `None.` under `Verification Limits`.
- Leave repository-tracked source, tests, configuration, documentation, and dependencies exactly unchanged.

## Must not

- Edit code preemptively or create cleanup changes.
- Add low-value findings merely to populate the report.
- Imply that a separate specialist review was performed.
