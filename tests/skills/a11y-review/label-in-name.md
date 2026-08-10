# Scenario: avoid a false label-in-name finding

## Prompt

Use `$a11y-review` on the selected settings control.

## Context

- The visible label is `Settings`.
- The computed accessible name is `Notification settings`.
- Capitalization is the only textual difference in the shared word.

## Expected behavior

- Normalize the comparison and recognize that the complete visible label is contained in the accessible name.
- Avoid a WCAG 2.5.3 finding.
- Continue evaluating the control's semantics and interaction independently.

## Must not

- Require the accessible name to equal the visible label exactly.
- Treat additional contextual words as an automatic failure.
- Recommend removing useful context solely for textual identity.
