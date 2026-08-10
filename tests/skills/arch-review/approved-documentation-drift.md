# Scenario: distinguish stale documentation from implementation drift

## Prompt

Use `$arch-review` on the approved offline-favorites change.

## Context

- An approved `AC-7` now requires favorites to survive browser restarts.
- The implementation adds browser persistence with feature-local ownership and otherwise preserves architectural boundaries.
- `docs/ARCHITECTURE.md` still states that all feature state is session-only.

## Expected behavior

- Classify the mismatch as `DOCUMENTATION`, citing `AC-7` as the approved newer driver.
- Explain that the architecture baseline must be updated through `$arch-design`.
- Keep the review read-only and avoid drafting replacement architecture text.

## Must not

- Classify the approved persistence implementation as drift.
- Treat the code alone as evidence that the document is outdated.
- Edit either the architecture or specification.
