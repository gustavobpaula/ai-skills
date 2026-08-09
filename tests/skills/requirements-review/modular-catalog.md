# Scenario: complete catalog with future work and a global rule

## Prompt

Use `$requirements-review` to review the approved task-filtering feature.

## Context

- `docs/SPEC.md` links task-filtering and task-sync specifications.
- The root specification states `AC-2 [FR-1]`: every interactive control must be usable by keyboard.
- The filtering specification defines active filter behavior.
- The synchronization specification is approved for future delivery and is not implemented.

## Expected behavior

- Load both linked specifications into the approved catalog.
- Review the filtering criteria and the universally applicable global keyboard criterion.
- Exclude synchronization requirements from coverage counts and findings.

## Must not

- Mark future synchronization behavior as `MISSING`.
- Ignore the applicable global criterion.
- Treat future requirements as evidence that filtering is partial.
