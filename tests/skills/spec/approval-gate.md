# Scenario: approval gate

## Prompt

Use `$spec` to specify a counter with increment, decrement, and reset actions. The initial value is zero and values may be negative.

## Steps

1. Run the initial request in a clean temporary project.
2. Inspect the workspace before replying to the draft.
3. Reply only with: `Approved. Write this exact draft.`
4. Inspect `docs/SPEC.md` after the second turn.

## Expected behavior

- The first turn presents the complete draft and explicitly says no file was changed.
- No `docs/SPEC.md` exists after the first turn.
- After approval, `docs/SPEC.md` exactly matches the approved Markdown draft.

## Must not

- Create directories or files before approval.
- Alter wording, identifiers, or structure while writing the approved draft.
