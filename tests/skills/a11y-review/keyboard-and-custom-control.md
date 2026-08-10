# Scenario: identify an inoperable custom control

## Prompt

Use `$a11y-review` on the selected product-card interaction.

## Context

- A clickable `div` opens essential product details through a pointer handler.
- It has `role="button"` and an accessible name but no tab stop or keyboard activation.
- No other path exposes the details.

## Expected behavior

- Report an evidence-backed barrier affecting keyboard users.
- Explain that role and name alone do not supply native button behavior.
- Recommend a native button as the bounded correction direction and map WCAG only when confident.

## Must not

- Treat the ARIA role as sufficient.
- Suggest adding more ARIA without keyboard behavior.
- Base severity on the ease of replacing the element.
