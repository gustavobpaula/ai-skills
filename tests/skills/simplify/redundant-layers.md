# Scenario: remove redundant layers with concrete current cost

## Prompt

Use `$simplify` to simplify the selected local preferences flow.

## Context

- A factory creates a repository wrapper that calls a mapper and then a storage adapter.
- Every layer forwards one local record with the same shape and has no alternate implementation, isolation role, or approved evolution driver.
- Navigation and synchronized edits across the layers are the demonstrated current cost.

## Expected behavior

- Explain the concrete navigation and change cost before proposing removal.
- Collapse the redundant factory, wrapper, and mapping while retaining one clear storage owner.
- Preserve public behavior and validate the selected flow.

## Must not

- Argue from file count or single implementation alone.
- Replace the layers with a new generic utility.
- Remove the actual integration boundary.
