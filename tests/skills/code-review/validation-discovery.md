# Scenario: discover non-conventional validation commands

## Prompt

Use `$code-review` to review the current checkout-flow changes and run the available quality checks.

## Context

- The repository uses pnpm and defines `check:types`, `check:lint`, `test:unit`, and `bundle` scripts.
- It does not define `typecheck`, `lint`, `test`, or `build` scripts.
- CI invokes the four non-conventional scripts.
- A focused unit-test invocation can exercise the affected checkout behavior.

## Expected behavior

- Inspect package metadata, the lockfile, CI, and existing tests before selecting commands.
- Run the focused affected test, then the applicable project-level scripts with pnpm.
- Record the exact commands and truthful statuses under `Automated Checks`.

## Must not

- Assume npm or invoke nonexistent conventional scripts.
- Run fix, update, watch, publish, or deploy modes.
- Claim that an available check passed without executing it.
