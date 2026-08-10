---
name: simplify
description: Reduce accidental complexity in explicitly selected code or current changes while preserving observable behavior, public contracts, tests, and useful architectural boundaries. Use when Codex needs to simplify or refactor unnecessary abstractions, single-use generic layers, wrappers, duplicated concepts, stored derived state, premature generalization, or excessive indirection; or to perform a read-only analysis of simplification opportunities. Do not use for general code review, architecture conformance review, feature behavior changes, or speculative rewrites.
---

# Simplify

Reduce current cognitive and change cost without turning fewer files, fewer lines, or compact syntax into goals of their own.

## 1. Resolve intent and target

- Read the engineer's request, project instructions, relevant constraints, and timebox.
- Treat an imperative request to simplify or refactor a selected surface as authorization to edit it. Treat a request to analyze, review, identify, or propose simplifications as read-only.
- Prefer an explicitly supplied file set, diff, commit range, feature, module, or other bounded implementation surface.
- Without an explicit target, use staged, unstaged, and untracked changes. Include untracked contents and inspect unchanged callers or dependencies only as far as needed to understand the affected flow.
- When the working tree is clean and no target is explicit, ask the engineer to choose a surface and wait. Do not silently expand into a repository-wide simplification effort.
- State the resolved mode and target before continuing. Preserve unrelated user work throughout the task.

## 2. Establish the preservation baseline

- Read the relevant approved requirements and `docs/ARCHITECTURE.md` when they exist. Do not require either document when the selected behavior and boundaries are otherwise clear.
- Identify observable behavior, public contracts, supported data shapes, error semantics, and relevant tests that the simplification must preserve.
- Treat approved requirements and architecture as authoritative. Treat code and tests as implementation evidence, not permission to redefine expected behavior or durable boundaries.
- Trace the selected flow through entry points, state ownership, domain logic, integrations, persistence, and public boundaries only where the proposed reduction could affect them.
- Inspect nearby conventions and analogous code. Prefer a simpler established project pattern over introducing a new local style.

## 3. Identify accidental complexity

- Look for abstractions with no current responsibility, generic layers used once without an isolation need, forwarding wrappers, premature extension mechanisms, duplicated representations, stored values that can be derived safely, parallel concepts describing the same thing, and indirection that obscures ownership or data flow.
- Require a concrete current cost such as extra navigation, synchronized edits, ambiguous ownership, invalid state combinations, duplicated transformations, or harder testing and debugging.
- Evaluate every candidate against current requirements, documented decisions, actual reuse, boundary or isolation value, and the cost of introducing it later if a real need appears.
- Preserve an abstraction that owns a meaningful policy, protects a public or integration boundary, isolates volatility, enables a required test seam, or represents an approved direction. One implementation or many files is not evidence of waste by itself.
- Prefer fewer concepts and a clearer flow. Do not optimize for minimum file count, minimum line count, clever syntax, or removal of ordinary readable structure.

## 4. Resolve decision gates

- Stop and route an unresolved product-behavior decision to `$spec`; do not choose new behavior under the label of simplification.
- Do not remove, bypass, or rewrite a documented architectural boundary. When the reduction conflicts with `docs/ARCHITECTURE.md`, report the conflict and route the decision to `$arch-design` before editing.
- Surface a public-contract break, schema or data migration, dependency replacement, technical-baseline change, or other difficult-to-reverse consequence and wait for explicit approval.
- When investigation reveals an actual production defect whose correction changes behavior, preserve the evidence and route the fix to `$feature-implementation` instead of folding it into the refactor.

## 5. Plan or report the reduction

- For an authorized edit, give a concise pre-edit plan covering the concrete cost, proposed reduction, preserved behavior and boundaries, affected surface, and validation. Continue without a redundant approval gate unless Section 4 applies.
- For read-only analysis, use this structure:

```markdown
# Simplification Analysis

## Target

## Opportunities

## Keep As Is

## Verification Limits
```

- Order opportunities by current cognitive or change cost. For each, cite specific evidence, explain the cost, propose a bounded reduction, and name the behavior or boundary that must remain intact.
- Use `No simplification recommended.` when no worthwhile opportunity remains. Use `None.` for empty `Keep As Is` or `Verification Limits` sections.
- Distinguish direct evidence from inference and do not inflate speculative cleanup into an opportunity.

## 6. Apply the smallest coherent simplification

- Change only the selected surface and the directly necessary callers, tests, or configuration.
- Collapse redundant layers and representations while leaving one clear owner for each responsibility and one obvious data path.
- Preserve public interfaces and observable behavior unless the engineer explicitly approved a change through a decision gate.
- Reuse existing project conventions and dependencies. Do not add a framework, library, generic utility, architecture layer, or new extension mechanism to perform the simplification.
- Add a focused characterization or regression test only when it is needed to protect observable behavior during the reduction. Do not preserve removed implementation details in tests.
- Avoid broad renames, formatting churn, unrelated cleanup, dependency updates, and opportunistic bug fixes.

## 7. Validate and hand off

- Discover the project's actual commands from manifests, task configuration, CI, and documentation. Do not assume conventional command names.
- Run the narrowest relevant tests first, then proportionate typecheck, lint, test, and build commands when available.
- Compare repository status before and after the work. Fix regressions caused by the simplification within scope; report unrelated or pre-existing failures without broadening the task.
- Do not weaken assertions, rewrite snapshots blindly, or alter expected behavior merely to make validation pass.
- Report what became simpler, which behavior and boundaries were preserved, the exact validation run and its results, and any remaining risk or decision.

## 8. Preserve workflow boundaries

- Leave architecture conformance and overengineering classification to `$arch-review`; use this skill for the dedicated reduction after a target is selected.
- Leave general defects and maintainability review to `$code-review`, requirements coverage to `$requirements-review`, feature behavior changes to `$feature-implementation`, and dedicated test prioritization to `$test-strategy`.
- Do not edit `docs/SPEC.md` or `docs/ARCHITECTURE.md`, conduct a repository-wide cleanup by default, or simplify merely for visual uniformity.
