# Spec Kit Scenario Runbook

How to run the behavioral scenarios that exercise the skills inside a GitHub Spec Kit project. Validated against `specify` 1.2.1.

## Prerequisites

- The skills are installed globally: `./scripts/install-claude.sh <skills...>` for Claude Code, `./scripts/install.sh <skills...>` for Codex.
- The `specify` CLI is installed: `uv tool install specify-cli --from git+https://github.com/github/spec-kit.git`.
- A Spec Kit project created without the `git` extension has no feature branches. Spec Kit records the active feature in `.specify/feature.json` as `{"feature_directory":"specs/<feature>"}`.

## Run one scenario

1. **Create a clean sandbox** outside this repository, one per scenario:

   ```sh
   ./tests/speckit-sandbox.sh "$TMPDIR/scn-<scenario>" claude        # or: claude codex
   ```

2. **Seed the fixture** from the scenario's `Context` with the smallest files that make each statement true. Base `spec.md`, `plan.md`, and `tasks.md` on the templates in `.specify/templates/`. Replace `.specify/memory/constitution.md` only when the scenario describes principles; otherwise leave the unfilled template.
3. **Set the active feature** exactly as the scenario describes (see the table below):
   - *Branch*: `git switch -c <feature>` and make sure `.specify/feature.json` does not exist.
   - *feature.json*: write `.specify/feature.json` and stay on `main`. Spec Kit gitignores this file as per-checkout state, so it never appears in commits or `git status`.
   - *Explicit*: the prompt names the path; neither mechanism is needed.
4. **Commit the baseline.** Leave uncommitted only what the scenario calls "current changes".
5. **Run in a fresh session** started in the sandbox (`claude` or `codex`). Paste the `Prompt` verbatim. Answer clarifying questions only with facts from `Context`; if the question needs anything else, record it as a finding.
6. **Evaluate** every `Expected behavior` and `Must not` item, then run `git status` to confirm that read-only skills changed nothing.

Seed the fixture in a different session from the one that runs the scenario, so that the run starts without knowledge of the rubric.

## Scenarios

| Scenario | Active feature | Fixture essentials |
|---|---|---|
| `arch-review/spec-kit-plan-drift` | Branch `004-order-export` | `ARCHITECTURE.md` with `AD-2`; constitution with Simplicity (`MUST`) and Test-First; plan with direct DB access; uncommitted route handler that follows it, no tests |
| `arch-review/spec-kit-approved-plan-decision` | Explicit | Architecture with synchronous integrations; `007-notifications` plan and code using a queue |
| `arch-review/spec-kit-missing-architecture` | Explicit | Filled constitution; `002-billing` plan; no `docs/ARCHITECTURE.md` |
| `arch-design/spec-kit-constitution` | Explicit | Constitution without an architecture principle; architecture that already supports `005-saved-searches`; spec only |
| `arch-design/spec-kit-plan-durable-delta` | Explicit | Synchronous-only architecture; `007-notifications` plan proposing a queue, file layout, and tasks |
| `delivery-check/spec-kit-tasks` | Branch `006-team-invites` | `tasks.md` with open story and Polish tasks; checked `FR-003` task without enforcement; missing user story 2 |
| `requirements-review/spec-kit-scenarios` | Branch `003-chat-system` | Spec with US1/US2, `FR-001`–`FR-005` (`FR-004` marked `[NEEDS CLARIFICATION]`), `SC-001`–`SC-003`; all tasks checked; typing indicator only in the plan and code |
| `requirements-review/spec-kit-catalog` | Explicit | `004-search`, `005-saved-searches`, `006-alerts` with overlapping `FR-00x`; uncommitted alert scheduling |
| `feature-implementation/spec-kit-tasks-in-progress` | Branch `006-team-invites` | `tasks.md` with mostly unchecked tasks |
| `feature-implementation/spec-kit-targeted-correction` | Explicit | Completed `tasks.md`; Test-First constitution; plan placing resend in UI vs `AD-3`; queued-but-never-resent offline messages |
| `spec/spec-kit-project` | None | `specs/001-reports/` and `specs/002-sharing/`; no `docs/SPEC.md` |
| `test-strategy/spec-kit-target` | `feature.json` on `main` | Constitution requiring integration tests for service contracts; `tasks.md` with snapshot and end-to-end tests |

`delivery-check/release-horizon` uses the `docs/SPEC.md` layout and needs a plain Git repository, not a Spec Kit sandbox.

## Record results

Keep results outside this repository. One row per run:

```markdown
| Date | Scenario | Agent / model | Result | Failed items | Notes |
|---|---|---|---|---|---|
| 2026-10-18 | arch-review/spec-kit-plan-drift | Claude Code / Opus 5.5 | PASS | — | — |
```

A scenario passes only when every `Expected behavior` holds and no `Must not` occurs. Fix a failing skill in this repository, then rerun the scenario in a new sandbox.
