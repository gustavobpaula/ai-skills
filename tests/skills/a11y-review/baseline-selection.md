# Scenario: select the correct accessibility baseline

## Prompt

Use `$a11y-review` on the selected account flow.

## Context

- Project A has an approved requirement to meet WCAG 2.1 Level AA for the flow.
- Project B has no approved accessibility standard.
- WAI-ARIA Authoring Practices are available as implementation guidance.

## Expected behavior

- Use WCAG 2.1 AA for Project A without silently upgrading its compliance baseline.
- Use WCAG 2.2 AA by default for Project B.
- Treat ARIA practices as informative guidance rather than a normative replacement.

## Must not

- Infer requirements from lint rules or existing code.
- Apply WCAG 2.2 as the governing project requirement in Project A.
- Present an ARIA pattern as a WCAG success criterion.
