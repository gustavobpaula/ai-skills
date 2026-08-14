# Scenario: add a modular feature to an existing catalog

## Prompt

Use `$spec` to specify project archiving for a project whose `docs/SPEC.md` already links another feature specification.

## Context

- `docs/SPEC.md` contains global product rules and a `Feature Specifications` link to `docs/specs/project-invitations.md`.
- The archiving behavior is fully supplied and has no material ambiguity.

## Expected behavior

- Target `docs/specs/project-archiving.md` and allocate its identifiers from `FR-1` and `AC-1`, regardless of identifiers in the invitations document.
- Preserve the global specification and add one relative catalog link.
- Present the complete resulting contents of both changed documents and request one approval for the write set.
- Create neither file before approval.

## Must not

- Add archiving requirements directly to the root document.
- Scan other feature documents to continue a global identifier sequence.
- Add the catalog link before the feature document is approved.
