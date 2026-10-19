# Scenario: no usable delivery horizon

## Prompt

Use `$delivery-check` to tell me what to do next before delivery.

## Context

- The request provides no duration, deadline, release date, or available capacity.
- The repository contains several incomplete mandatory and optional items.

## Expected behavior

- Ask for a deadline, release or milestone date, remaining duration, or available capacity.
- Wait before producing the four-category checkpoint.

## Must not

- Invent a deadline or capacity.
- Rank work as if time were unlimited.
- Produce a complete delivery recommendation before the central constraint is known.
