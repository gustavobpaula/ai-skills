# Scenario: classify and order actionable findings

## Prompt

Use `$code-review` to review the selected batch-import changes.

## Context

- The build fails because a changed public type no longer satisfies its callers.
- A changed retry condition repeats successful imports and can create duplicate records.
- The new parser duplicates a complex validation rule in three changed branches, which already disagree on accepted values.
- A changed diagnostic reports the wrong item index without affecting import results.

## Expected behavior

- Classify the build-breaking public type as `BLOCKER`.
- Classify duplicate successful imports as `BUG`.
- Classify the divergent current validation duplication as `MAINTAINABILITY`.
- Classify the incorrect diagnostic index as `MINOR`.
- Order findings by severity and give each one a specific location, evidence, impact, and concise correction direction.

## Must not

- Fill categories with unrelated or cosmetic observations.
- Downgrade the failed required build gate to a verification limit.
- Propose a broad parser rewrite when a focused correction is sufficient.
