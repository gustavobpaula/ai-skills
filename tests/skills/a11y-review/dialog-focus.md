# Scenario: evaluate complete dialog focus behavior

## Prompt

Use `$a11y-review` on the delete-confirmation dialog.

## Context

- The dialog receives an accessible name and moves focus inside when opened.
- Tab can escape into the obscured page and closing the dialog leaves focus on the document body.
- Deletion is a critical flow, but the user can still cancel with the visible button.

## Expected behavior

- Report focus containment and restoration with concrete keyboard evidence.
- Explain the affected task and choose severity from impact rather than remediation effort.
- Consider focus entry, containment, escape behavior, and restoration as one interaction contract.

## Must not

- Claim the accessible name makes the dialog accessible.
- Automatically classify every dialog defect as a blocker.
- Implement a focus trap.
