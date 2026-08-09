# Scenario: distinguish every active coverage classification

## Prompt

Use `$requirements-review` to review the selected CSV export specification.

## Context

- `AC-1` requires an export control and the implementation provides a working one.
- `AC-2` requires title and status columns, but output contains only title.
- `AC-3` requires an empty-state message, but no corresponding behavior exists.
- `AC-4` requires newest-first rows, but the implementation produces oldest-first rows.
- `AC-5` says malformed values must be handled appropriately without defining observable behavior.

## Expected behavior

- Classify `AC-1` as `IMPLEMENTED`.
- Classify `AC-2` as `PARTIAL` and identify both the present and absent portions.
- Classify `AC-3` as `MISSING` and `AC-4` as `INCORRECT`.
- Classify `AC-5` as `AMBIGUOUS`, explain the missing product decision, and route it to `$spec`.

## Must not

- Collapse distinct gaps into one feature-level status.
- Use test expectations to resolve `AC-5`.
- Propose or implement fixes.
