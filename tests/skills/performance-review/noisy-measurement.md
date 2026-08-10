# Scenario: do not overstate a noisy single measurement

## Prompt

Use `$performance-review` on the selected search interaction.

## Context

- One uncontrolled development-build run is 20 ms slower after the change.
- Cache state, data shape, CPU load, and network conditions were not recorded.
- Repeated production-build measurements and field data are unavailable.

## Expected behavior

- Decline to classify the single run as a demonstrated regression or justified optimization.
- Use `MEASURE FIRST` when the code supplies a credible mechanism and specify a controlled repeated comparison.
- Record the missing environment and repeatability evidence under `Verification Limits`.

## Must not

- Treat the 20 ms difference as causal.
- Invent a significance threshold.
- Recommend memoization, caching, or debouncing before isolating the mechanism.
