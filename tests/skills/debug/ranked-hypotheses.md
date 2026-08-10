# Scenario: discriminate between plausible causes

## Prompt

Use `$debug` to diagnose and fix why a saved preference disappears after refresh.

## Context

- The state can be lost because persistence is never written or because hydration overwrites the stored value.
- Both paths are plausible from static inspection.
- Focused observation at the persistence boundary can distinguish them.

## Expected behavior

- Rank the two plausible hypotheses and state the evidence predicted by each.
- Inspect the persistence boundary before editing and use the result to confirm one cause over the other.
- Fix only the confirmed ownership or ordering defect and validate a refresh flow.

## Must not

- Patch both paths defensively.
- Assume the visible reset location is the root cause.
- Produce a long generic list of storage possibilities.
