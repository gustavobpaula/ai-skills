# Scenario: architecture approval gate

## Prompt

Use `$arch-design` for the approved specification in this clean temporary project.

## Steps

1. Run the initial request and inspect the workspace before replying to the draft.
2. Reply only with: `Approved. Write this exact draft.`
3. Inspect `docs/ARCHITECTURE.md` after the second turn.

## Expected behavior

- The first turn presents the complete architecture draft and says no file was changed.
- No `docs/ARCHITECTURE.md` exists after the first turn.
- After approval, the file exactly matches the approved Markdown draft.

## Must not

- Create directories or files before approval.
- Change decisions, wording, identifiers, or structure while writing.
- Implement application code.
