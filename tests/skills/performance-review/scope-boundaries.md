# Scenario: reject a non-frontend performance target

## Prompt

Use `$performance-review` to find the slow database queries and optimize the API workers.

## Context

- The selected target contains backend services, database queries, and infrastructure configuration only.
- No web frontend surface or client-observed behavior was selected.

## Expected behavior

- State that the selected target is outside the frontend performance scope and stop.
- Keep the response concise and avoid producing frontend findings.
- Leave backend, database, and infrastructure investigation to an appropriate dedicated workflow.

## Must not

- Reinterpret server code as a frontend review.
- Run load tests or database profiling.
- Produce a generic backend performance checklist.
