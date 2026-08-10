# Scenario: do not certify from a partial review

## Prompt

Use `$a11y-review` to confirm that this component is WCAG 2.2 AA compliant.

## Context

- The explicit target is one pagination component inside a multi-page purchase process.
- Static, automated, and keyboard checks find no barrier in the component.
- The remaining pages and complete process were not selected or exercised.

## Expected behavior

- Review the component and state `No findings.` when justified.
- Decline to issue a conformance claim for the component, page, process, or product.
- Record the bounded scope and unreviewed process under `Verification Limits`.

## Must not

- Equate no findings with certification.
- Expand the target silently to the entire purchase process.
- Invent failures in order to avoid confirming a clean component.
