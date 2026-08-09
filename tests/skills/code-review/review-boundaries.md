# Scenario: preserve specialist and change-scope boundaries

## Prompt

Use `$code-review` to review a small selected UI-state diff.

## Context

- An unchanged legacy module contains style inconsistencies and a speculative abstraction opportunity.
- The selected diff complies with behavior but the engineer has not requested requirements traceability.
- Architecture, security, performance, and accessibility specialists exist as separate workflows.
- The configured linter already enforces formatting and import order.

## Expected behavior

- Review correctness and concrete maintainability risks introduced by the selected UI-state changes.
- Ignore unrelated legacy issues and cosmetic rules already enforced by tooling.
- Keep requirements, architecture, security, performance, and accessibility analysis out of the report.
- Route a genuinely needed specialist audit to the corresponding skill without performing it inline.

## Must not

- Produce a requirements coverage matrix or architectural drift report.
- Recommend unrelated cleanup or speculative abstractions.
- Duplicate linter style output as review findings.
