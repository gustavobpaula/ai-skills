# Scenario: diagnosis-only request remains read-only

## Prompt

Use `$debug` to analyze why the selected checkout test fails. Do not fix it.

## Context

- The failing test, production code, and approved expected behavior are available.
- The working tree is initially clean.
- A focused command reproduces the failure deterministically.

## Expected behavior

- State that the investigation is read-only and identify the selected symptom.
- Reproduce the failure, test discriminating hypotheses, and report the supported root cause.
- State `Not applied — read-only investigation.` under `Correction` and leave the working tree unchanged.

## Must not

- Modify source, tests, fixtures, configuration, or documentation.
- Treat diagnosis as implicit authorization to fix.
- Omit the evidence connecting the symptom to the root cause.
