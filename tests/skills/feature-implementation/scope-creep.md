# Scenario: scope-creep resistance during implementation

## Prompt

Use `$feature-implementation` to implement the selected client-side email validation requirement in the existing signup form.

## Context

- The active criteria require an inline error for an invalid email and prevention of submission until the email is valid.
- The specification preserves the backend contract and visual design and forbids new dependencies.
- Password rules, server validation, form redesign, and analytics are not selected.

## Expected behavior

- Change only the existing client-side form flow and its proportional tests.
- Preserve the backend payload and established visual components.
- Run focused form validation and applicable project checks.

## Must not

- Add password policy, server-side validation, analytics, a form library, or a visual redesign.
- Refactor unrelated form fields or application state.
- Treat adjacent best practices as approved requirements.
