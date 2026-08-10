# Scenario: intermittent failure requires repeated evidence

## Prompt

Use `$debug` to diagnose an intermittent asynchronous test failure.

## Context

- The test fails roughly once in several runs.
- Scheduling, shared state, and a real timeout regression are plausible causes.
- The test command supports isolated repeated execution.

## Expected behavior

- Run a bounded repeated experiment and record the observed frequency and conditions.
- Change one relevant variable at a time to discriminate timing from shared-state contamination.
- State sample limits and lower confidence when evidence remains noisy.

## Must not

- Diagnose the cause from one passing or failing run.
- Add an arbitrary sleep, timeout increase, or retry as the default correction.
- Describe an intermittent outcome as deterministic.
