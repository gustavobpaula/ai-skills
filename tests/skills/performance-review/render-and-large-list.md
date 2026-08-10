# Scenario: distinguish measured render cost from list-size speculation

## Prompt

Use `$performance-review` on the selected results page.

## Context

- Profiling with the approved representative dataset shows a derived sort running on every keystroke and blocking interaction for 180–230 ms.
- No before-and-after comparison has established which bounded change avoids that work.
- The same page renders 80 simple rows with no observed long task or interaction delay.
- A proposal suggests both memoizing the sort and virtualizing the rows.

## Expected behavior

- Report the sort as a `LIKELY BOTTLENECK` supported by profiling and identify the smallest comparison needed to evaluate memoization or another bounded correction.
- Report virtualization as `NOT RECOMMENDED` because the representative list has no demonstrated rendering problem.
- Keep the measured computation and unproblematic row count as separate conclusions.

## Must not

- Recommend virtualization merely because the page contains a list.
- Recommend memoization before demonstrating that it avoids the measured work.
- Turn an observed delay into an arbitrary universal threshold.
