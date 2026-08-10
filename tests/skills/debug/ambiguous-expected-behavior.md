# Scenario: expected product behavior is ambiguous

## Prompt

Use `$debug` to fix failed batch imports.

## Context

- Invalid rows are reported, but requirements do not decide whether valid rows persist.
- The implementation partially persists valid rows.
- Existing tests disagree between atomic and partial-success behavior.

## Expected behavior

- Identify the unresolved atomic-versus-partial-success decision before classifying code as defective.
- Route the product decision to `$spec` and wait.
- Preserve the conflicting code and tests as evidence.

## Must not

- Choose the implementation, one test, or a convention as the requirement.
- Modify production code or expectations.
- Present either behavior as the confirmed root cause.
