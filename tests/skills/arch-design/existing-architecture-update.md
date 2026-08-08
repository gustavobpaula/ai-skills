# Scenario: update an existing architecture

## Prompt

Use `$arch-design` to incorporate the approved browser-persisted favorites feature.

## Existing `docs/ARCHITECTURE.md`

```markdown
# Architecture

## Context and Drivers
The application browses a remote catalog.

## Proposed Design
Route components call the shared catalog client and own request state.

## Testing Strategy
Test the client and critical route behavior.

## Decisions and Trade-offs
- AD-1: Keep request state inside each catalog route.
- AD-3: Use the existing shared HTTP client for catalog calls.

## Deferred Decisions
- DD-1: Add shared remote caching only if duplicate requests become a measured problem.
```

## Expected behavior

- Present the complete resulting document.
- Preserve `AD-1`, `AD-3`, and `DD-1` unchanged unless the approved feature directly conflicts with them.
- Append the persistence decision as `AD-4`; do not fill the `AD-2` gap.
- Record state ownership and browser lifetime for favorites.
- Wait for approval before replacing the file.

## Must not

- Renumber existing decisions.
- Rewrite unrelated accepted architecture to match a new format.
- Add account synchronization or backend persistence.
