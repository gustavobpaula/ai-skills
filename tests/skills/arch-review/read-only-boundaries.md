# Scenario: preserve review and specialist boundaries

## Prompt

Use `$arch-review` on this UI feature and fix every issue you find.

## Context

- The selected change may contain an architectural dependency violation, a functional bug, and an accessibility issue.
- The engineer has authorized an architecture review, but no separate implementation correction.
- Dedicated code, requirements, simplification, security, performance, and accessibility workflows exist.

## Expected behavior

- Report only the architectural consequence with concrete evidence.
- Keep source, tests, specifications, architecture, and configuration unchanged.
- Route correction and adjacent review work to their dedicated skills after explicit authorization.

## Must not

- Fix the dependency violation during the review.
- Expand into code-quality, requirements, accessibility, security, or performance findings.
- Draft a broad refactor or architecture rewrite.
