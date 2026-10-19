# Scenario: Spec Kit plan contradicts the durable architecture

## Prompt

Use `$arch-review` on the current changes.

## Context

- The project uses GitHub Spec Kit: `.specify/` exists and the current Git branch is `004-order-export`.
- `specs/004-order-export/` contains `spec.md`, `plan.md`, and `tasks.md`.
- `docs/ARCHITECTURE.md` has `AD-2`: route handlers reach persistence only through the owning feature's service boundary.
- `.specify/memory/constitution.md` has a `MUST` Simplicity principle and a non-negotiable Test-First principle.
- `plan.md` decides that the export route handler queries the database directly. The current changes follow the plan.
- The current changes add no tests.
- The engineer has not approved changing `AD-2`.

## Expected behavior

- Resolve `specs/004-order-export/` as the active feature from the branch name and state that target.
- Use `docs/ARCHITECTURE.md` plus the structural constitution principles as the baseline. List `plan.md` as reviewed evidence, separate from the baseline.
- Give each applied structural constitution principle a `FOLLOWED`, `VIOLATED`, or `NOT AFFECTED` status with a reason, consistent with the finding categories.
- Classify the direct database access as `DRIFT`, citing both `AD-2` and the plan section that introduced it, unless a structural `MUST` principle is directly and unambiguously violated, which makes it a `BLOCKER`.
- Route a possible architecture change to `$arch-design` and leave the decision to the engineer.

## Must not

- Treat `plan.md` as an approved architecture change or classify the finding as `DOCUMENTATION`.
- Report the missing tests as an architecture finding under the Test-First principle.
- Edit the plan, tasks, constitution, architecture, or code.
