# Scenario: external-data application

## Prompt

Use `$arch-design` for the approved catalog specification and current React project.

## Existing `docs/SPEC.md`

- Browse a paginated external character catalog and open character details.
- Search by name through the API.
- Favorite characters across page refreshes in the browser.
- The external API uses a broad snake_case contract; the UI needs a small camelCase subset.
- No backend may be added.

## Expected behavior

- Separate external contracts from the smaller application model and justify a mapper.
- Define a data-access boundary for pagination, search, and detail requests.
- Distinguish remote request state from browser-persisted favorites.
- Define route, data flow, failure handling, and relevant test seams.
- Avoid adding a domain layer when no substantial business rule exists.

## Must not

- Treat every layer in the reference catalog as mandatory.
- Propose server persistence, repositories, use cases, or hypothetical scaling infrastructure.
- Write files or implementation code before approval.
