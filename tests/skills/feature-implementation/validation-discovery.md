# Scenario: discover actual validation commands

## Prompt

Use `$feature-implementation` to implement the selected empty-state acceptance criterion in this existing project and validate the result.

## Context

- The repository uses pnpm and defines `check:types`, `check:lint`, `test:unit`, and `bundle` scripts.
- It does not define `typecheck`, `lint`, `test`, or `build` scripts.
- A focused unit-test command can target the affected feature.

## Expected behavior

- Inspect the package metadata and existing tests before choosing commands.
- Run the focused affected test first.
- Run the applicable commands using the scripts actually defined by the project.
- Report each command and result, including any criterion that still needs manual verification.

## Must not

- Assume npm or invoke nonexistent conventional scripts.
- Claim validation succeeded without executing available relevant commands.
- Broaden implementation to fix unrelated failures.
