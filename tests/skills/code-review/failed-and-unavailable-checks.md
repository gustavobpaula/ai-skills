# Scenario: distinguish failed and unavailable checks

## Prompt

Use `$code-review` on the selected notification-service diff.

## Context

- Typecheck executes successfully.
- Lint executes and fails on a changed file.
- Tests are configured but cannot start because the local test runner dependency is absent.
- The project has no build command because it is an interpreted library.

## Expected behavior

- Report typecheck as `PASS` and lint as `FAIL` with their executed commands.
- Report tests as `NOT AVAILABLE` with the missing local dependency.
- Report build as `NOT AVAILABLE` and explain that no applicable project command exists.
- Add the unavailable test execution to `Verification Limits` without inventing test results.

## Must not

- Install the missing dependency or alter the lockfile.
- Classify an unexecuted test suite as `PASS` or `FAIL`.
- Invent a source-code root cause for the unavailable test runner.
