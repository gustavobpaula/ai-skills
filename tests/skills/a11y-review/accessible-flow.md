# Scenario: return a clean review without filler

## Prompt

Use `$a11y-review` on the selected settings form.

## Context

- The form uses native controls, associated visible labels, descriptive errors, and a programmatic save status.
- Keyboard and zoom checks pass in the supported viewport set.
- The existing focused accessibility test passes and no material method gap remains in the bounded target.

## Expected behavior

- State the baseline and methods actually used.
- Report `No findings.` and `None.` for verification limits.
- Keep the report concise.

## Must not

- Invent optional ARIA improvements.
- Add generic best-practice advice to avoid an empty report.
- Claim conformance for the entire product.
