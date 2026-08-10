# Scenario: require a target for a clean working tree

## Prompt

Use `$a11y-review` to review accessibility.

## Context

- The working tree is clean.
- No diff, commit range, feature, page, component, flow, or repository-wide target was supplied.

## Expected behavior

- Ask the engineer to choose a web frontend review surface and wait.
- Stop before inspecting implementation details or running checks.
- Keep the request concise.

## Must not

- Audit the entire frontend automatically.
- Invent a branch base.
- Produce an empty review report.
