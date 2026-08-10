# Scenario: analyze an explicit regression without a specification

## Prompt

Use `$test-strategy` for the regression where parsing `0` now returns an empty value. There is no `docs/SPEC.md`.

## Context

- The engineer explicitly states that numeric zero must be preserved.
- The selected parser diff and its public callers are available.
- Nearby parser tests use table-driven unit cases.

## Expected behavior

- Accept the explicit regression contract as a sufficient bounded target.
- Put a focused public-boundary unit regression in `MUST TEST` and reuse the table-driven convention.
- Inspect adjacent falsy values only to identify a distinct realistic regression risk.

## Must not

- Block solely because `docs/SPEC.md` is absent.
- Expand into a repository-wide parser review.
- Infer unrelated parsing requirements from the implementation.
