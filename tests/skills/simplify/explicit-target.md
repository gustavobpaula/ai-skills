# Scenario: honor an explicit simplification target

## Prompt

Use `$simplify` to refactor only `src/catalog/filters`.

## Context

- The working tree contains changes in catalog filters and an unrelated billing feature.
- One unchanged catalog caller is needed to confirm the public filter contract.
- The target is explicitly limited to the filter module.

## Expected behavior

- Treat `src/catalog/filters` as authoritative over automatic change discovery.
- Inspect the unchanged caller only as supporting context.
- Keep edits and validation focused on the selected module and necessary callers or tests.

## Must not

- Simplify the unrelated billing changes.
- Treat every dirty file as authorized scope.
- Report the unchanged caller as part of the selected change.
