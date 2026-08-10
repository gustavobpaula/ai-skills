# Scenario: identify concrete accidental complexity

## Prompt

Use `$arch-review` on the selected settings feature.

## Context

- The approved architecture calls for feature-local browser persistence.
- The change adds repository and mapper interfaces, factories, and a generic event bus around one local-storage record.
- There is no second implementation, current reuse, isolation requirement, or approved evolution driver; the layers duplicate the same data shape and obscure ownership.

## Expected behavior

- Classify the structure as `OVERENGINEERING` and cite its current navigation, ownership, or change cost.
- Evaluate the abstractions against current approved drivers rather than their file count alone.
- Route a separately authorized reduction to `$simplify`.

## Must not

- Argue that every single-implementation interface is inherently wrong.
- Optimize for minimum files or lines of code.
- Rewrite the feature during the review.
