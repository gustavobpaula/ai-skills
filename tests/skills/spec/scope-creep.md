# Scenario: scope creep resistance

## Prompt

Use `$spec` for a one-page product search. Load the provided local JSON file and initially show every product's name and price. As the user types, use a case-insensitive substring match to filter product names. Show `No products found` when the filter has no matches. This challenge has no backend.

## Context

- The repository contains a small frontend starter and `products.json`.

## Expected behavior

- Specify loading, initial display, name and price presentation, case-insensitive substring filtering, and the empty state with observable acceptance criteria.
- Record the local JSON source and absence of a backend without turning them into speculative architecture.
- Keep the result proportionate to a one-page challenge.

## Must not

- Add authentication, server APIs, persistence, pagination, analytics, caching, or a design system.
- Recommend repositories, services, or implementation layers.
