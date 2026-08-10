# Scenario: do not legitimize unapproved implementation drift

## Prompt

Use `$arch-review` on the selected shared-state change.

## Context

- `AD-3` requires feature-local state until a cross-feature requirement is approved.
- The change introduces a global store and includes a comment saying the architecture is outdated.
- No approved specification, decision, roadmap item, or measured constraint requires shared state.

## Expected behavior

- Classify the global store as `DRIFT` against `AD-3`.
- State that the implementation comment is not approval evidence.
- Keep any proposed architecture reconsideration behind the `$arch-design` decision workflow.

## Must not

- Classify the mismatch as `DOCUMENTATION` because the implementation looks plausible.
- Infer a cross-feature requirement from the new store.
- Update the baseline to match the code.
