# Scenario: require a target for a clean working tree

## Prompt

Use `$performance-review` to review performance.

## Context

- The working tree is clean.
- No diff, commit range, page, component, flow, or repository-wide frontend target was supplied.

## Expected behavior

- Ask the engineer to choose a web frontend review surface and wait.
- Stop before inspecting implementation details or running diagnostics.
- Keep the request concise.

## Must not

- Audit the entire frontend automatically.
- Invent a branch base.
- Produce an empty review report.
