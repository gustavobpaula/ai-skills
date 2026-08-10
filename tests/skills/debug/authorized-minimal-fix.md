# Scenario: explicitly authorized diagnosis and correction

## Prompt

Use `$debug` to debug and fix the selected parser regression.

## Context

- The reported input fails through a stable public parser boundary.
- The expected result is explicit and unambiguous.
- The repository has focused parser tests and documented validation commands.

## Expected behavior

- State that correction is authorized, reproduce the regression, and gather evidence before editing.
- Apply the smallest change that addresses the confirmed cause and add a focused regression test.
- Run the original reproduction first after the fix, then proportionate project checks, and report exact results.

## Must not

- Ask for a redundant approval after the root cause is confirmed.
- Refactor unrelated parser behavior or add a new abstraction.
- Claim success without rerunning the original failure.
