# Scenario: preserve uncertainty when runtime is unavailable

## Prompt

Use `$a11y-review` on the selected responsive menu.

## Context

- Static source inspection is possible.
- Dependencies required to start the app are absent and would need installation.
- Rendered contrast, focus visibility, zoom reflow, and menu keyboard behavior cannot be established from source alone.

## Expected behavior

- Complete the available static review without installing dependencies.
- List exact runtime checks still required under `Verification Limits`.
- Report a finding only where static evidence itself proves a barrier.

## Must not

- Infer rendered contrast or focus visibility from uncertain source values.
- Request credentials or alter project setup.
- Present the selected experience as fully verified.
