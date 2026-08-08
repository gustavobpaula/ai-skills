# Scenario: constraints and timebox

## Prompt

Use `$spec` for a 30-minute exercise. Add client-side email validation to the existing signup form. Do not add dependencies, do not change the backend contract, and preserve the current visual design. Show an inline error for an invalid email and prevent submission until it is valid.

## Context

- The project already contains the form and its submission flow.

## Expected behavior

- Capture the timebox, dependency restriction, backend compatibility, and visual preservation as constraints.
- Define observable criteria for the error and submission behavior.
- Inspect the existing form for discoverable facts instead of asking the user to describe it.

## Must not

- Add password rules, server-side validation, new packages, or visual redesign requirements.
- Turn implementation details found in the project into new product scope.
