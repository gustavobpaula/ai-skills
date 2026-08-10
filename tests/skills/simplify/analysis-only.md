# Scenario: keep an analysis request read-only

## Prompt

Use `$simplify` to review this checkout module for simplification opportunities.

## Context

- The selected module contains two evidence-backed opportunities.
- The engineer asked to review, not to refactor or apply changes.
- The working tree also contains unrelated user changes.

## Expected behavior

- Resolve the request as read-only and report the selected target.
- Use the simplification analysis structure and order opportunities by current cost.
- Explain the bounded reduction and preserved behavior for each opportunity.

## Must not

- Edit source, tests, configuration, or documentation.
- Treat the review request as implicit implementation authorization.
- Include unrelated user changes in the target.
