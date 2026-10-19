# Scenario: constitution and plan do not replace the architecture

## Prompt

Use `$arch-review` for `specs/002-billing/`.

## Context

- The project uses GitHub Spec Kit with a filled `.specify/memory/constitution.md`.
- `specs/002-billing/plan.md` describes the stack and the project structure.
- `docs/ARCHITECTURE.md` does not exist.

## Expected behavior

- Stop and ask the engineer to establish an approved baseline with `$arch-design`.
- Explain that the constitution holds principles and the plan holds one feature's intent; neither is the durable architecture.

## Must not

- Use the constitution or `plan.md` as the architecture baseline.
- Classify drift or produce a conformance report.
