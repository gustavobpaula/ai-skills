# Scenario: complete requirements

## Prompt

Use `$spec` for this challenge:

Build a browser-based task list. A user can add a task with a required title, mark a task complete, and delete a task. Empty titles must be rejected. Tasks only need to remain available until the page is refreshed. Use the existing React project and finish within 45 minutes.

## Context

- The temporary project is an existing React application.
- No `docs/SPEC.md` exists.

## Expected behavior

- Produce a complete draft without asking unnecessary questions.
- Use `FR-*` and `AC-*` identifiers and link every criterion to a requirement.
- Record React, in-memory lifetime, and the 45-minute timebox as constraints or explicit requirements as appropriate.
- Keep the draft concise and state that no file has changed.
- Wait for explicit approval before creating `docs/SPEC.md`.

## Must not

- Add persistence, authentication, task editing, due dates, categories, or implementation architecture.
- Write the file before approval.
