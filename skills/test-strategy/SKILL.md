---
name: test-strategy
description: Prioritize and, when explicitly authorized, implement the highest-value tests for an approved behavior, regression target, or selected change based on risk, determinism, and cost. Use when Codex needs to decide what must, should, optionally should, or should not be tested; choose an appropriate test level; or add a focused risk-based test set. Do not use to maximize coverage, test implementation details, fix production defects, replace feature implementation, or perform a general code or requirements review.
---

# Test Strategy

Produce a short risk-based strategy before writing tests. Prefer the cheapest stable test that proves observable behavior.

## 1. Resolve the test target

- Read the engineer's request, project instructions, relevant constraints, and timebox when supplied.
- Prefer an explicitly supplied feature-specification path, then a path with selected requirements or acceptance criteria, then the single linked feature specification that matches the request, then requirements written directly in `docs/SPEC.md`, then a bug or regression description, diff, or another explicitly bounded behavior.
- Read `docs/SPEC.md` when it exists for applicable global rules and approved catalog links. Treat an explicitly selected specification as approved for this task even when unlinked; if its path does not exist, report the missing target and return to `$spec` without silently falling back.
- Read the active feature specification and only linked or cross-referenced specifications needed to interpret the selected behavior. Do not scan other feature documents as test scope merely because they exist under `docs/specs/`.
- Treat each requirement as specification path plus local `FR-*` or `AC-*` identifier. If bare identifiers occur in multiple linked documents, ask for the feature-specification path.
- Treat approved requirements as authoritative and code or existing tests as implementation evidence, never as sources of new product requirements.
- Proceed without `docs/SPEC.md` when the engineer explicitly selects a bug, change, contract, or regression surface whose expected behavior is sufficiently clear.
- Ask and wait when different interpretations would change observable behavior or the expected assertion. Route unresolved product behavior to `$spec`; do not encode an assumption as a test expectation.
- State the resolved target and whether the request authorizes strategy only or also authorizes test implementation.

## 2. Inspect risk and existing evidence

- Trace the target through relevant business rules, critical user flows, failure paths, integrations, persistence, and public contracts.
- Inspect the current diff or selected implementation, nearby tests, test helpers, CI configuration, and analogous coverage. Use relevant history only when it clarifies regression risk or an established contract.
- Discover the project's actual test framework, commands, naming, organization, and supported test levels. Do not assume conventional tooling.
- Identify what existing tests already prove. Do not propose another test unless it catches a distinct realistic failure or supplies materially better confidence.
- Evaluate each candidate qualitatively by user or business impact, likelihood of regression, chance that cheaper checks would miss it, determinism, execution cost, and maintenance cost. Do not invent numeric scores or false precision.

## 3. Choose the cheapest sufficient level

- Prefer a unit test for deterministic domain logic, calculations, parsing, validation, and state transitions that can be proved through a stable public boundary.
- Prefer an integration test when the risk lies in a contract or seam between owned components, such as application and persistence, transport and handler, or adapter and domain logic.
- Use an end-to-end test only when confidence depends on traversing a critical user flow or a boundary that lower levels cannot represent faithfully.
- Prefer a focused regression test at the lowest level that reproduces the reported failure and protects the observable contract.
- Avoid testing private methods, incidental call order, internal state, framework behavior, or markup and snapshots with no meaningful contract.
- Reject redundant coverage, broad snapshots, unstable timing or network scenarios, and low-value cases proposed only to raise a coverage percentage.

## 4. Prioritize the strategy

- `MUST TEST`: Protect a high-impact business rule, mandatory acceptance criterion, critical flow, realistic failure path, or confirmed regression that lacks sufficient evidence.
- `SHOULD TEST`: Reduce meaningful regression risk after every `MUST TEST` item while remaining proportionate to the target.
- `OPTIONAL`: Add bounded confidence for lower-risk behavior only when it cannot displace required implementation or validation.
- `DON'T TEST`: Reject implementation details, duplicated evidence, framework behavior, unstable or disproportionately expensive scenarios, and coverage-only work.

Without a timebox, recommend a proportional minimum set rather than an exhaustive suite. With a timebox, include only work that credibly fits with execution and validation; never hide a critical uncovered risk by silently lowering its priority.

## 5. Report before implementation

Use this structure:

```markdown
# Test Strategy

## Target
...

## MUST TEST
- Behavior or risk — Level: unit | integration | end-to-end. Proves: observable evidence. Why: prioritization reason.

## SHOULD TEST
None.

## OPTIONAL
None.

## DON'T TEST
- Candidate — Level: none. Why: rejection reason.
```

- Keep each item concrete enough to implement without prescribing private structure or a full test body.
- Use `None.` for an empty category and order items by execution sequence within each category.
- Preserve requirement or acceptance-criterion identifiers when available.
- Keep evidence and inference distinct and state relevant verification limits.
- Match the language of the engineer's request unless the project establishes another reporting language.

## 6. Implement only when authorized

- Treat strategy-only requests as read-only. After reporting, wait for the engineer to select or authorize test implementation.
- When the initial request explicitly authorizes both strategy and implementation, present the strategy as the pre-edit update and continue without a redundant approval gate.
- Implement selected `MUST TEST` items first, followed only by explicitly selected lower-priority items.
- Inspect the working tree before editing and preserve unrelated changes. Modify only focused test files and necessary test fixtures or helpers within the authorized target.
- Reuse the installed test framework, conventions, utilities, and existing seams. Do not add a framework, dependency, service, test-only production hook, or broad configuration change without an explicit decision.
- Assert observable behavior and meaningful contracts. Do not weaken assertions, accept incorrect output, or rewrite snapshots merely to obtain a passing result.
- Run the narrowest affected test first, then the relevant suite or project check when available and proportionate. Report exact commands, results, and anything not run.
- If a test exposes a production defect, stop changing that path, preserve the failing evidence, and route the correction to `$feature-implementation`. Do not edit production code under this skill.

## 7. Preserve workflow boundaries

- Keep tests required to complete an active feature inside `$feature-implementation`; use this skill for dedicated test planning, regression protection, or risk-driven expansion of an existing test set.
- Do not produce requirements coverage, general code-quality findings, architecture review, debugging, or specialist security, performance, and accessibility analysis.
- Do not create `docs/TEST_STRATEGY.md`; return the strategy in the conversation unless the engineer explicitly requests another artifact.
- Keep the engineer in control of test scope, technical-baseline changes, and production fixes.
