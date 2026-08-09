# Scenario: observed behavior belongs to another approved specification

## Prompt

Use `$requirements-review` to review the project-archiving feature.

## Context

- `docs/SPEC.md` links approved archiving and invitations specifications.
- Archiving is the active target.
- The implementation also contains an invitation action covered by `FR-22` and `AC-38` in the invitations specification.

## Expected behavior

- Classify only the active archiving review units.
- Report the invitation action under `Outside Active Target` with the invitations path, `FR-22`, and `AC-38`.
- Leave the remaining invitations coverage unassessed.

## Must not

- Classify the invitation action as `UNREQUESTED`.
- Mark unimplemented invitation criteria as `MISSING`.
- Silently omit the cross-spec mapping.
