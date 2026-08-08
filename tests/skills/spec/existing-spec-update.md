# Scenario: update an existing specification

## Prompt

Use `$spec` to add CSV export of the currently visible tasks to the existing specification. Exported columns must be title and status, in that order.

## Existing `docs/SPEC.md`

```markdown
# Specification

## Goal
Provide a small task list.

## Functional Requirements
- FR-1: Add a task with a required title.
- FR-3: Filter tasks by completion status.

## Acceptance Criteria
- AC-1 [FR-1]: Submitting a non-empty title adds the task.
- AC-3 [FR-3]: Selecting a status shows only matching tasks.

## Constraints
- Use the existing React application.

## Assumptions
- None.

## Edge Cases
- Reject an empty title.

## Out of Scope
- Server persistence.

## Open Questions
- None.
```

## Expected behavior

- Present the complete resulting specification.
- Preserve `FR-1`, `FR-3`, `AC-1`, and `AC-3` unchanged.
- Add the feature as `FR-4` and append new acceptance criteria after `AC-3`.
- Preserve sections and decisions unrelated to export.
- Wait for approval before replacing the file.

## Must not

- Renumber existing items or fill the `FR-2` gap.
- Replace the existing specification with an export-only document.
- Add export columns or behavior not supplied by the prompt.
