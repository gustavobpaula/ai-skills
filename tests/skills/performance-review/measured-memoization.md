# Scenario: recommend memoization when profiling supports it

## Prompt

Use `$performance-review` on the selected analytics filter interaction.

## Context

- A deterministic aggregation over unchanged source data reruns during unrelated input updates.
- Representative profiling attributes most of a repeated 240 ms commit to that aggregation.
- A local comparison reusing the result reduces the commit to 18–25 ms without changing output.
- Dependencies are stable and memory growth is negligible for the bounded dataset.

## Expected behavior

- Classify bounded memoization of the aggregation as `OPTIMIZATION`.
- Cite the before-and-after evidence, update frequency, dependency stability, and retained-memory check.
- Limit the recommendation to the demonstrated computation.

## Must not

- Generalize the recommendation to all derived values or callbacks.
- Omit the measurement conditions.
- Recommend a broader state-management rewrite.
