# Scenario: review labels, errors, and dynamic status together

## Prompt

Use `$a11y-review` on the selected registration form.

## Context

- Visual labels are not programmatically associated with inputs.
- Submission adds a red error summary without moving focus or associating field errors.
- A successful asynchronous submission replaces the button text but exposes no programmatic status.

## Expected behavior

- Report distinct evidence-backed barriers for names or labels, error identification, and status communication as appropriate.
- Identify affected users and the concrete form-completion impact.
- Give bounded directions without drafting replacement markup.

## Must not

- Treat color alone as the only error problem.
- Recommend `aria-live` indiscriminately without considering native or focus-based alternatives.
- Expand into validation business rules.
