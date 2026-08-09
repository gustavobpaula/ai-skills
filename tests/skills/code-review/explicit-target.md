# Scenario: explicit target overrides automatic discovery

## Prompt

Use `$code-review` to review commit range `feature-base..HEAD`.

## Context

- The working tree also contains unrelated staged and untracked experiments.
- The selected commit range changes an order-total calculation and its focused tests.
- Unchanged callers are needed to understand the calculation contract.

## Expected behavior

- State `feature-base..HEAD` as the review target and inspect its complete diff.
- Read relevant unchanged callers and tests as context.
- Keep findings tied to the selected range or behavior it directly breaks.

## Must not

- Replace the explicit range with staged, unstaged, or untracked changes.
- Report unrelated experimental work as findings.
- Modify either the selected changes or the experiments.
