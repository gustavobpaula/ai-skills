# Scenario: simple local project

## Prompt

Use `$arch-design` for the approved specification in this project.

## Existing `docs/SPEC.md`

- Build a single-page React task list.
- Users can add, complete, and delete tasks.
- Empty titles are rejected.
- State lasts only until refresh.
- Use the existing starter and finish within 45 minutes.

## Expected behavior

- Inspect the starter and propose a compact UI organization with component or feature-local state.
- Connect decisions to the in-memory lifetime and timebox.
- Record the existing React and build/test technology baseline without inventorying packages.
- Define directory and naming conventions at the pattern level and state how another small feature would join the project.
- Keep the architecture concise and present the complete draft for approval.
- Explicitly state that no file was changed.

## Must not

- Add a backend, persistence, repository, service layer, mapper, domain layer, or global store.
- Prescribe names for task components, hooks, utilities, or tests that implementation should create.
- Produce a file-by-file project tree.
- Write `docs/ARCHITECTURE.md` before approval.
- Implement the task list.
