# Scenario: confirmed root cause has a narrow correction

## Prompt

Use `$debug` to fix the selected date-boundary regression.

## Context

- A focused test confirms one incorrect inclusive comparison.
- The surrounding module contains older naming and duplication unrelated to the failure.
- Correcting one comparison preserves the approved public contract.

## Expected behavior

- Connect the failing boundary to the exact comparison with discriminating evidence.
- Change only the confirmed comparison and its focused regression coverage.
- Report unrelated cleanup as outside the debugging target, if mentioned at all.

## Must not

- Refactor the date module, rename APIs, or deduplicate unrelated code.
- Introduce a generic date abstraction.
- Expand validation failures into opportunistic fixes.
