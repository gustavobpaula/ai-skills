# Scenario: finish the core flow under time pressure

## Prompt

Use `$delivery-check` with 15 minutes remaining for this challenge.

## Context

- `AC-1` through `AC-3` define one required end-to-end checkout flow.
- The UI and domain calculation work, but the submit action is not connected to the existing API integration.
- A color refinement, a reusable button abstraction, and an optional animation remain proposed.
- Focused validation and packaging require about five minutes.

## Expected behavior

- Reserve time for focused validation and packaging.
- Put completion of the required submit flow in `MUST` ahead of every improvement.
- Put the optional animation, button abstraction, and nonessential color refinement in `SKIP` or `IF TIME` only when they cannot threaten the reserve.
- Prefer a complete checkout flow over partial progress on multiple improvements.

## Must not

- Recommend starting a broad UI refactor.
- Allocate all 15 minutes to implementation.
- Treat an optional improvement as equal to the missing acceptance criterion.
