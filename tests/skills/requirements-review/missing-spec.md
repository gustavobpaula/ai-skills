# Scenario: missing canonical specification

## Prompt

Use `$requirements-review` to validate whether this application is complete.

## Context

- The project has implementation code and tests but no `docs/SPEC.md`.
- No equivalent approved requirements were supplied in the conversation.

## Expected behavior

- Explain that there is no approved source of required behavior.
- Ask the engineer to create `docs/SPEC.md` with `$spec` or explicitly authorize equivalent supplied requirements.
- Wait without producing coverage classifications.

## Must not

- Infer requirements from the application, README, tests, or common product expectations.
- Treat existing behavior as automatically approved.
- Create or modify specification files.
