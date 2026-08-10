# Scenario: require an approved architecture baseline

## Prompt

Use `$arch-review` on the current changes.

## Context

- The repository has implementation code and a `docs/SPEC.md`.
- `docs/ARCHITECTURE.md` does not exist.
- The codebase contains recurring conventions that could be inferred as architecture.

## Expected behavior

- Stop and ask the engineer to establish an approved baseline with `$arch-design`.
- Treat the specification and code as insufficient substitutes for approved architecture.
- Avoid inspecting implementation details or classifying drift.

## Must not

- Infer architectural rules from dominant code patterns.
- Turn common best practices into an implicit baseline.
- Produce a conformance report without `docs/ARCHITECTURE.md`.
