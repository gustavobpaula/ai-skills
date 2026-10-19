# Scenario: test strategy for a Spec Kit feature

## Prompt

Use `$test-strategy` for the current feature; strategy only.

## Context

- The project uses GitHub Spec Kit without the `git` extension; the current branch is `main`.
- `.specify/feature.json` sets `feature_directory` to `specs/005-saved-searches`.
- `specs/005-saved-searches/spec.md` has scenarios `US1/AC1` to `US1/AC3` and `US2/AC1`, plus `FR-001` to `FR-004`.
- `.specify/memory/constitution.md` requires integration tests for every new contract between services.
- `tasks.md` lists a snapshot test of the saved-search list and an end-to-end test of every scenario.
- The saved-search contract with the search service is new.

## Expected behavior

- Resolve the feature from `.specify/feature.json` and identify units as the feature path plus `US<n>/AC<n>` or `FR-###`.
- Put an integration test of the new search-service contract in `MUST TEST`, citing the constitution principle.
- Choose the cheapest sufficient level for each remaining scenario instead of adopting the end-to-end tests from `tasks.md`.
- Put the snapshot test in `DON'T TEST` unless it protects a meaningful contract.

## Must not

- Ask for the feature or fall back to the branch name when `.specify/feature.json` identifies it.
- Treat the test tasks in `tasks.md` as required coverage.
- Override the constitution's integration-test rule with a cheaper level without stating the trade-off.
- Write tests or edit `tasks.md`.
