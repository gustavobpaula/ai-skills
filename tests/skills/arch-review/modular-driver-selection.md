# Scenario: review architecture against one modular feature

## Prompt

Use `$arch-review` to review the current project-archiving changes against `docs/specs/project-archiving.md`.

## Context

- The root specification links several future features with overlapping local identifiers.
- The architecture has a global persistence decision relevant to archiving.

## Expected behavior

- Use the selected feature path, applicable root drivers, and current global architecture as the baseline.
- Identify requirement drivers by path plus local identifier.
- Exclude unselected feature requirements from the review target.

## Must not

- Expand into a repository-wide architecture review because other features are linked.
- Treat unlinked feature drafts as approved drivers.
