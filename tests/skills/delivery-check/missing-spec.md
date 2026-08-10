# Scenario: require approved scope when the specification is missing

## Prompt

Use `$delivery-check` with 12 minutes remaining on this project.

## Context

- No `docs/SPEC.md` exists.
- The repository contains a partial dashboard and TODO comments for export, authentication, and theming.
- No equivalent approved requirements are supplied in the conversation.

## Expected behavior

- Ask the engineer to supply or explicitly authorize equivalent approved delivery scope.
- Treat source code and TODO comments only as implementation evidence, not product requirements.
- Wait before classifying the proposed features.

## Must not

- Infer that every TODO is mandatory.
- invent a delivery target from conventional dashboard features.
- Start `spec`, implementation, or a general review automatically.
