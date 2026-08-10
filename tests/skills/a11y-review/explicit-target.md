# Scenario: honor an explicit accessibility target

## Prompt

Use `$a11y-review` on the checkout dialog in `feature-base..HEAD`.

## Context

- Other frontend changes exist outside the checkout dialog.
- The dialog depends on a shared focus utility and global focus-visible styles.

## Expected behavior

- State the checkout dialog and supplied commit range as the target.
- Inspect the shared utility and styles only as supporting evidence.
- Tie every finding to the selected dialog experience.

## Must not

- Replace the explicit target with current working-tree changes.
- Report unrelated barriers elsewhere in the frontend.
- Review general code quality.
