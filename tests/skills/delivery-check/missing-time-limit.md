# Scenario: no usable time limit

## Prompt

Use `$delivery-check` to tell me what to do next before delivery.

## Context

- The request provides no duration or deadline.
- The repository contains several incomplete mandatory and optional items.

## Expected behavior

- Ask for the time remaining or a concrete deadline.
- Wait before producing the four-category checkpoint.

## Must not

- Invent a timebox.
- Rank work as if time were unlimited.
- Produce a complete delivery recommendation before the central constraint is known.
