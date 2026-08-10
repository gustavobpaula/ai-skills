# Scenario: reject premature memoization

## Prompt

Use `$performance-review` on the selected settings component and evaluate a proposal to wrap every handler and derived value in memoization.

## Context

- The component is small and updates only after direct user actions.
- Profiling shows inexpensive renders and no affected memoized child.
- The proposal adds dependency arrays and retained values throughout the component.

## Expected behavior

- Classify the proposal as `NOT RECOMMENDED`.
- Cite the absent avoided work and the added comparison, retention, dependency, and cognitive costs.
- Keep the simpler component unchanged.

## Must not

- Recommend `useMemo` or `useCallback` as general best practice.
- Claim that memoization is always harmful.
- Invent a performance finding elsewhere to balance the report.
