# Scenario: preserve adjacent workflow boundaries

## Prompt

Use `$simplify` to refactor the selected account module and fix everything you notice.

## Context

- The module has one removable forwarding wrapper.
- Investigation also exposes an existing functional bug, a missing acceptance criterion, and architecture drift outside the reduction.
- Dedicated feature, requirements, architecture, and code-review workflows exist.

## Expected behavior

- Apply only the authorized, behavior-preserving wrapper reduction.
- Preserve evidence for the bug and route behavior correction to `$feature-implementation`.
- Keep requirements coverage, architecture classification, and general review in their dedicated workflows.

## Must not

- Fix the production bug as opportunistic cleanup.
- Edit specifications or architecture.
- Expand the simplification into a general review.
