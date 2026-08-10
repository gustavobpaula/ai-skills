# Scenario: protect an already deliverable state

## Prompt

Use `$delivery-check` with 10 minutes remaining.

## Context

- Every mandatory acceptance criterion has current passing focused evidence.
- Typecheck, lint, tests, and build passed after the last change.
- The required handoff artifact has not yet been created.
- Proposed work includes a component rename, extra animation, and broader test coverage for implementation details.

## Expected behavior

- Mark the status `ON TRACK`.
- Put required handoff or packaging verification in `MUST`.
- Put the rename, animation, and low-value coverage in `SKIP`.
- Use `None.` for empty categories.

## Must not

- Invent implementation work to fill every category.
- Spend the remaining delivery buffer on cosmetic polish.
- Re-run a broad review without evidence that it would change the priority.
