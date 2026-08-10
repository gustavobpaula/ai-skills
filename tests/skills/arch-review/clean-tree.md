# Scenario: require a target for a clean working tree

## Prompt

Use `$arch-review` to review the architecture.

## Context

- `docs/ARCHITECTURE.md` exists.
- The working tree is clean.
- No diff, commit range, feature, file set, or repository-wide target was supplied.

## Expected behavior

- Ask the engineer to choose a review surface and wait.
- Stop before inspecting implementation details or classifying findings.
- Keep the request concise and avoid inventing a default branch base.

## Must not

- Review the entire repository automatically.
- Claim the implementation conforms because no local changes exist.
- Produce empty findings or verification sections before resolving the target.
