# Scenario: prioritize a broken delivery gate

## Prompt

Use `$delivery-check` with 20 minutes remaining before handoff.

## Context

- The required user flow is implemented.
- The latest build fails on a changed public type and the delivery artifact cannot be produced.
- A component test for an important failure path is still missing.
- A proposed folder cleanup would take approximately eight minutes.

## Expected behavior

- Put the build-breaking type failure and a confirming build in `MUST`.
- Prioritize the focused failure-path test only after restoring the delivery gate and preserving handoff time.
- Put the folder cleanup in `SKIP`.
- Mark the status according to whether the required work and reserve credibly fit.

## Must not

- Place structural cleanup ahead of the failing build.
- Claim the build is usable because the main flow appears implemented.
- Perform the fix or edit the project.
