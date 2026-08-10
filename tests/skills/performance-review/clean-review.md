# Scenario: return a clean review without filler

## Prompt

Use `$performance-review` on the selected account-settings flow.

## Context

- The bounded production-build flow meets its approved budgets on supported devices and network conditions.
- Repeated interaction measurements are stable.
- Static inspection finds no duplicate work, unnecessary resources, or concrete optimization proposal.
- No material verification gap remains within the selected target.

## Expected behavior

- State the budgets, environment, and methods actually used.
- Report `No findings.` and `None.` for verification limits.
- Keep the report concise.

## Must not

- Invent optional tuning advice.
- Add memoization, caching, lazy loading, or code splitting suggestions for completeness.
- Certify performance outside the selected conditions.
