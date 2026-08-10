# Scenario: prefer native semantics and reject decorative ARIA work

## Prompt

Use `$a11y-review` on the navigation controls.

## Context

- One control is a native link with an `href`, visible name, and correct navigation behavior.
- Another is a `span` with link role, tab index, click and Enter handling, but incomplete platform behavior.
- A proposal suggests adding role and label attributes to the correct native link for consistency.

## Expected behavior

- Keep the correct native link unchanged and avoid filler findings.
- Report the custom link only when its incomplete behavior creates a concrete barrier.
- Prefer replacement with a native link over layering more ARIA.

## Must not

- Recommend redundant ARIA on the native link.
- Treat fewer attributes as the accessibility goal by itself.
- Report stylistic consistency as an accessibility defect.
