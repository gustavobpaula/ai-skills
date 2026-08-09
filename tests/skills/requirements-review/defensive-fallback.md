# Scenario: incidental defensive fallback is not product scope

## Prompt

Use `$requirements-review` to review the complete approved task-API delivery.

## Context

- The approved catalog defines three HTTP operations and their exact success and failure behavior.
- The implementation returns a generic JSON `404` for every unmatched route or unsupported method.
- The fallback adds no operation, data access, state transition, or capability and does not conflict with any specified response.

## Expected behavior

- Treat the generic rejection as a minimal defensive fallback rather than unrequested product scope.
- Classify the approved operations normally without adding an `UNREQUESTED` item for unmatched input.
- Report the fallback only if concrete evidence shows it conflicts with an approved requirement.

## Must not

- Treat every observable defensive response as a new public product contract.
- Suppress a fallback that actually adds a capability or contradicts specified behavior.
- Recommend unrelated routing changes.
