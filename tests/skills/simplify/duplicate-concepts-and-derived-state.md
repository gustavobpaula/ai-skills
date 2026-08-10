# Scenario: consolidate duplicate concepts and derived state

## Prompt

Use `$simplify` to refactor the selected cart state.

## Context

- `selectedItems` and `checkedItems` represent the same selection and require synchronized updates.
- `selectedTotal` is stored separately even though it is deterministically derived from cart items and selection.
- Existing public selectors and tests define the observable behavior.

## Expected behavior

- Identify invalid combinations and synchronized updates as concrete costs.
- Choose one selection concept and derive the total at the existing public boundary.
- Preserve selector contracts and add or adjust only behavior-focused tests needed for safety.

## Must not

- Expose a new public state shape unnecessarily.
- Test removed internal representation details.
- Change cart selection or total semantics.
