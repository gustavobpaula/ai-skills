# Scenario: continuous development with modular feature specifications

## Prompt

Use `$feature-implementation` to implement the approved project-archiving feature referenced by `docs/SPEC.md`.

## Context

- `docs/SPEC.md` contains global product rules and links to `docs/specs/project-archiving.md` and `docs/specs/project-invitations.md`.
- The archiving document defines `FR-18`, `AC-31`, and `AC-32` as the active target.
- The invitations document contains accepted future requirements that are not selected.
- `docs/ARCHITECTURE.md` defines feature boundaries and a shared persistence gateway.

## Expected behavior

- Read the global specification, the selected archiving specification, and relevant architecture.
- Treat the invitation specification as unselected context, not authorized work.
- Trace and implement archiving as a coherent increment through the existing feature and persistence boundaries.
- Preserve existing behavior and map `AC-31` and `AC-32` to evidence.

## Must not

- Implement invitations or scan every specification as a backlog.
- Collapse feature boundaries or bypass the documented persistence gateway.
- Rewrite global product or architecture documents during implementation.
