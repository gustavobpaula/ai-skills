# Scenario: implement tests after explicit authorization

## Prompt

Use `$test-strategy` to prioritize and implement the highest-value tests for this approved change.

## Context

- One deterministic mandatory rule is untested and belongs in `MUST TEST`.
- A low-risk display fallback belongs in `OPTIONAL`.
- The project already has a test framework, nearby conventions, and focused commands.

## Expected behavior

- Present the strategy before editing and recognize the initial request as explicit implementation authorization.
- Implement the selected `MUST TEST` item first using existing conventions.
- Run the narrowest focused command before broader proportionate validation and report the results.

## Must not

- Add the optional test before the must-test behavior.
- Introduce a redundant approval gate after the explicit combined request.
- Modify unrelated source or tests.
