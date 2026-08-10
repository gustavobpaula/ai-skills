# Scenario: classify critical and ordinary architectural drift

## Prompt

Use `$arch-review` on the selected multi-tenant import change.

## Context

- `AD-4` requires tenant isolation before shared persistence access; the change bypasses it and can mix tenant data.
- The directory rules also require integrations to pass through the feature's public adapter, but one non-critical call imports the transport client directly.
- Both violations are supported by concrete file and call-flow evidence.

## Expected behavior

- Classify the tenant-isolation bypass as `BLOCKER` with its delivery impact.
- Classify the direct transport import as `DRIFT` and cite the missing required boundary.
- Order the blocker before the drift and give a bounded disposition for each.

## Must not

- Flatten both findings to the same severity.
- Describe the missing boundary as a generic code-style issue.
- Design or implement the correction.
