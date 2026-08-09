---
name: code-review
description: Review current changes or an explicitly selected implementation surface as the final general engineering quality gate. Use when Codex needs to inspect code for delivery-affecting defects and maintainability risks, discover and run the project's actual typecheck, lint, test, and build commands, and report prioritized BLOCKER, BUG, MAINTAINABILITY, and MINOR findings. Keep the review read-only; do not use for requirements traceability, architecture drift, specialized security, performance, or accessibility review, or automatic fixes.
---

# Code Review

Review the selected implementation surface, execute the project's available quality checks, and report only actionable engineering findings. Keep the review read-only and focused on delivery.

## 1. Resolve the review target

- Read the engineer's request, project instructions, relevant constraints, and timebox.
- Prefer an explicitly supplied file set, diff, commit range, pull-request patch, or repository-wide target.
- Without an explicit target, inspect staged, unstaged, and untracked changes. Include untracked file contents because ordinary Git diffs omit them.
- When the working tree is clean, use a branch diff only when its base is unambiguous from an existing local tracking ref or a project-documented base. Compute the merge base and state the resulting range.
- Ask the engineer to choose a target when the working tree is clean and no base is unambiguous. Stop before inspecting implementation details, running checks, or producing the review report; request the target concisely and wait. Do not guess between branches, silently expand to a repository-wide audit, populate check statuses, or state that there are no findings without a reviewable target.
- State the resolved target before reviewing. Treat an explicit target as authoritative over automatic discovery.
- Read unchanged callers, dependencies, tests, contracts, and configuration when needed to understand the target. Keep findings tied to the selected changes or to behavior they directly break or expose.

## 2. Inspect the implementation in context

- Inspect the complete selected diff and trace affected flows through entry points, state, domain logic, integrations, persistence, and error handling as applicable.
- Read nearby tests and analogous implementation to understand established contracts and conventions.
- Use approved specifications and architecture documents as correctness context when available, but do not produce requirements coverage or architectural-conformance audits.
- Review for functional defects, regressions, type errors, dead or unreachable paths, inadequate error handling, broken contracts, failing quality gates, and clear accidental complexity.
- Check boundary conditions and failure paths affected by the target instead of reviewing only the happy path.
- Exclude unrelated legacy problems. Mention an out-of-target condition only when it prevents verification, and place it under `Verification Limits` rather than turning it into a finding.
- Exclude generated, vendored, dependency, and build-output files unless the target intentionally changes them or they are necessary evidence.

## 3. Discover and run project checks

- Inspect manifests, lockfiles, task-runner configuration, CI workflows, and project documentation to discover the actual package manager and available commands. Do not assume conventional command names.
- Identify applicable typecheck, lint, test, and build commands. Run a focused affected test first when it gives faster or more precise evidence, then run the available project-level checks required for the gate.
- Use the engineer's timebox to prioritize checks, but never claim a skipped check passed.
- Run only non-interactive, non-corrective commands. Do not use fix, update, watch, publish, deploy, migration, or snapshot-rewrite modes.
- Do not install dependencies, alter lockfiles, initialize services, or request credentials merely to complete the review. Record missing tooling, dependencies, services, or credentials as verification limits.
- Allow normal cache and build artifacts, but compare repository status before and after checks. If a command unexpectedly changes tracked source, tests, configuration, or documentation, stop that command sequence, preserve the evidence, and do not revert or clean user files automatically.
- Record each command exactly once with one status:
  - `PASS`: the command ran and exited successfully.
  - `FAIL`: the command ran and failed or reported a quality violation.
  - `NOT AVAILABLE`: the project exposes no applicable command or required local tooling is absent.
  - `NOT RUN`: the command was intentionally skipped because of safety, time, or an unresolved prerequisite; state the reason.
- When a required project check fails, report the failure in `Automated Checks`. Create a finding only when evidence connects the failure to the target or the failed gate itself blocks delivery; do not invent a root cause.

## 4. Classify actionable findings

Assign one priority to each finding:

- `BLOCKER`: the target cannot be delivered safely, a required delivery gate fails, or the change causes a severe failure such as build breakage, data loss, or a broadly unusable flow.
- `BUG`: the target causes observable incorrect behavior, a regression, a broken contract, or an unhandled failure in a realistic execution path.
- `MAINTAINABILITY`: the target introduces concrete and current change risk through unnecessary complexity, duplication, misleading ownership, or brittle coupling. Do not use this category for hypothetical future preferences.
- `MINOR`: the target contains a limited, non-cosmetic defect worth correcting that does not materially affect the main flow.

- Report only findings the engineer can act on. Do not fill severity categories for completeness.
- Give every finding a concise title, the most specific file and line available, concrete evidence, the affected scenario or impact, and a short correction direction when it materially improves actionability.
- Order findings by `BLOCKER`, `BUG`, `MAINTAINABILITY`, then `MINOR`; order equal priorities by impact and confidence.
- Avoid cosmetic preferences, style findings already enforced by tooling, speculative abstractions, and broad refactoring proposals.
- Distinguish evidence from inference and lower certainty explicitly when runtime behavior could not be verified.

## 5. Report the quality gate

Use this structure:

```markdown
# Code Review

## Review Target

## Automated Checks

| Category | Command | Status | Result |
|---|---|---|---|

## Findings

## Verification Limits
```

- Describe the explicit target or resolved local change set under `Review Target`, including any diff base used.
- Include typecheck, lint, tests, and build in `Automated Checks`; use `NOT AVAILABLE` or `NOT RUN` with a reason when a category was not executed.
- Format each finding heading as `[SEVERITY] Concise title` and keep evidence close to the claim.
- State `No findings.` when no actionable finding remains. Do not imply that unavailable verification passed.
- State `None.` under `Verification Limits` only when the relevant behavior and checks were fully exercised; otherwise list the exact residual uncertainty.
- Match the language of the engineer's request unless the project establishes another reporting language.

## 6. Preserve review boundaries

- Keep the review read-only. Do not edit source, tests, specifications, architecture, configuration, dependencies, or generated files.
- Report before fixing. Treat a later explicit correction request as a separate authorized task with its own scope and validation.
- Leave requirements traceability to `$requirements-review` and architectural drift to `$arch-review`.
- Leave dedicated security, performance, and accessibility analysis to their specialist skills. Report an obvious delivery defect encountered in the target without expanding into a specialist audit.
- Do not replace failed checks with speculative manual confidence, recommend unrelated cleanup, or turn the report into a general repository audit.
