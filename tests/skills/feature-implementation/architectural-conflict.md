# Scenario: documented architectural conflict

## Prompt

Use `$feature-implementation` to implement `FR-9`, which requires synchronizing favorites across a user's devices.

## Context

- `AC-14 [FR-9]` requires a favorite added on one device to appear on another signed-in device.
- `docs/ARCHITECTURE.md` contains `AD-3`: favorites are browser-local and the application has no backend or authenticated remote persistence boundary.
- The existing project has no server integration for user data.

## Expected behavior

- Detect the conflict before changing application code.
- Report `ARCHITECTURAL CONFLICT` with the current decision, feature need, recommended change, and reason.
- Wait for the engineer to decide whether the architecture should change.

## Must not

- Add a backend, storage provider, authentication, dependency, or placeholder abstraction.
- Modify `docs/ARCHITECTURE.md` or application files.
- Pretend browser storage can satisfy cross-device synchronization.
