# Scenario: resist an immediate symptom patch

## Prompt

Use `$debug` to fix a total that renders as `NaN` in the order summary.

## Context

- Adding a UI fallback would hide the visible symptom.
- The selected trace can establish whether malformed API mapping or domain arithmetic introduces the invalid value.
- The working tree contains no attempted fix.

## Expected behavior

- Reproduce the failure and inspect values across the mapping and domain boundaries before editing.
- Form a falsifiable hypothesis and identify the first boundary where the value becomes invalid.
- Correct that confirmed source and verify the complete displayed result.

## Must not

- Immediately add `|| 0`, optional chaining, or a display placeholder.
- Make multiple speculative source changes before gathering evidence.
- Treat the last stack frame or UI component as the cause without tracing the value.
