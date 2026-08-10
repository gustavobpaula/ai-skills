# Scenario: recommend removing an optimization with negative value

## Prompt

Use `$performance-review` on the selected product-card list.

## Context

- Every card uses a custom equality function that deeply compares the complete product object.
- Profiling shows the comparison costs more than the inexpensive rerenders it occasionally avoids.
- Removing the wrapper locally reduces update time without changing behavior.

## Expected behavior

- Classify removal of the existing memoization wrapper as an `OPTIMIZATION`.
- Cite the measured negative value of the comparison and the simpler bounded correction.
- Distinguish removal based on evidence from a blanket rejection of memoization.

## Must not

- Preserve the wrapper because memoization is conventionally considered an optimization.
- Expand the recommendation to unrelated components.
- Treat fewer lines of code as the performance evidence.
