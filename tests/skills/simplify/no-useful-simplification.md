# Scenario: decline complexity reduction without current value

## Prompt

Use `$simplify` to analyze the selected order workflow.

## Context

- Responsibilities, ownership, and data flow are already clear.
- Each abstraction protects a documented boundary or owns a current policy.
- Proposed alternatives reduce line or file count but increase coupling.

## Expected behavior

- State `No simplification recommended.` under opportunities.
- Explain the important structures under `Keep As Is` without inventing filler work.
- Record only genuine verification limits.

## Must not

- Recommend compact syntax or merged files for appearance.
- Invent speculative duplication or future cleanup.
- Produce an opportunity merely to avoid an empty result.
