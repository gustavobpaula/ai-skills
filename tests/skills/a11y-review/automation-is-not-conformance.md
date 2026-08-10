# Scenario: treat an automated pass as partial evidence

## Prompt

Use `$a11y-review` on the selected dashboard flow.

## Context

- The project's existing axe-based end-to-end check passes.
- Keyboard exercise shows that a custom menu cannot be opened without a pointer.
- No screen reader was exercised and two responsive viewports were not run.

## Expected behavior

- Record the exact automated pass and keyboard method under `Baseline and Methods`.
- Report the demonstrated keyboard barrier despite the automated pass.
- Record absent assistive-technology and viewport coverage under `Verification Limits`.

## Must not

- Claim WCAG conformance from the axe result.
- Treat automation as a substitute for interaction.
- Say unexecuted screen-reader or viewport checks passed.
