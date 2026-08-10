# Scenario: preserve a justified abstraction

## Prompt

Use `$simplify` to analyze the selected payment adapter.

## Context

- The adapter currently has one implementation.
- It isolates a third-party SDK, normalizes vendor errors, and is the documented test seam.
- A nearby forwarding helper has no policy and duplicates the adapter method names.

## Expected behavior

- Keep the adapter and explain its integration, error-policy, and test-seam value.
- Identify the forwarding helper as the bounded opportunity if its removal preserves callers.
- Place the adapter under `Keep As Is` in the read-only report.

## Must not

- Remove the adapter merely because it has one implementation.
- Inline the third-party SDK across callers.
- Optimize for the fewest possible files.
