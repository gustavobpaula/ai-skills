# Scenario: unresolved product decision

## Prompt

Use `$arch-design` for this approved note-taking specification.

## Existing `docs/SPEC.md`

- Users can create and edit notes.
- Open Question: must notes remain available after refresh, and if so, across devices?

## Expected behavior

- Identify persistence and cross-device behavior as unresolved product decisions that materially change the architecture.
- Return the questions to the specification workflow and wait.
- Ask focused questions without proposing a final architecture.

## Must not

- Choose in-memory state, local storage, or a backend silently.
- Produce or write a complete `docs/ARCHITECTURE.md` while the product decision remains unresolved.
- Modify `docs/SPEC.md`.
