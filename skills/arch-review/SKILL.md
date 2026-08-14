---
name: arch-review
description: Review current changes or an explicitly selected implementation surface against docs/ARCHITECTURE.md and approved requirements, identifying architectural blockers, drift, overengineering, stale documentation, and evidence-backed future triggers. Use when Codex needs a read-only architectural conformance review of dependency direction, boundaries, ownership, integrations, conventions, testability, or structural complexity. Do not use to design or update architecture, implement fixes, simplify code, or perform general code, requirements, security, performance, or accessibility review.
---

# Architecture Review

Compare the selected implementation surface with the approved architecture. Report concrete divergence and excess without changing code or legitimizing the current implementation as its own architectural baseline.

## 1. Establish the architectural baseline

- Read the engineer's request, project instructions, relevant constraints, and `docs/ARCHITECTURE.md`.
- Require `docs/ARCHITECTURE.md`. If it is missing, stop before inspecting implementation details or classifying findings and ask the engineer to establish an approved baseline with `$arch-design`.
- Treat the architecture document as authoritative for durable technical decisions, including `AD-*` decisions, `DD-*` triggers, technology roles, directory responsibilities, dependency rules, state ownership, integration boundaries, domain placement, naming, feature-extension rules, and testing seams.
- Read `docs/SPEC.md` when it exists for applicable global drivers and approved catalog links. Prefer a specification path explicitly supplied for the feature under review, then a path with identifiers, then the single linked specification that matches the reviewed behavior, then requirements written directly in `docs/SPEC.md`.
- Treat an explicitly selected feature specification as approved review context even when it is unlinked. If its path does not exist, report the missing target and route it to `$spec`; do not silently substitute the root specification.
- Read only the active feature specification and cross-referenced documents needed to understand the current drivers. Ignore other unlinked specifications and do not treat the approved catalog as a repository-wide review target.
- Identify every requirement driver by specification path plus local `FR-*` or `AC-*` identifier. Ask for a path when bare identifiers occur in more than one linked document.
- Treat approved requirements as evidence of current product drivers, not as permission to rewrite architecture during the review. Treat code and tests as implementation evidence, never as the source of the architectural baseline.
- Surface contradictory or insufficient architectural rules as documentation evidence. Do not resolve them by inferring intent from the implementation.

## 2. Resolve the review target

- Prefer an explicitly supplied file set, diff, commit range, feature surface, or repository-wide target.
- Without an explicit target, inspect staged, unstaged, and untracked changes. Include untracked file contents because ordinary Git diffs omit them.
- State the resolved target before reviewing. Treat an explicit target as authoritative over automatic discovery.
- When the working tree is clean and no target is explicit, ask the engineer to choose a review surface and wait. Do not silently expand to a repository-wide audit or report that the architecture conforms without a reviewable target.
- Trace changed behavior through unchanged callers, dependencies, entry points, state owners, integrations, domain boundaries, tests, and configuration only as far as needed to assess the selected surface.
- Exclude unrelated legacy architecture. Mention it only when it prevents verification of the selected target.

## 3. Inspect conformance and proportionality

- Map each relevant implementation choice to the most specific architectural section, rule, `AD-*` decision, or `DD-*` trigger available.
- Inspect dependency direction, responsibility separation, public boundaries, state and data ownership, external communication, domain placement, naming and extension conventions, testing seams, coupling, and cohesion where they are affected by the target.
- Check for required boundaries that the implementation bypasses or omits as well as new layers, wrappers, interfaces, repositories, mappers, stores, services, or generic mechanisms that add no current value.
- Evaluate an abstraction against approved current requirements, documented drivers, current reuse, concrete isolation needs, and cost of later introduction. Do not reject it merely because it has one implementation or accept it merely because it is conventional.
- Use repository history only when it clarifies whether an architectural decision or implementation change was approved. Do not infer approval from age, prevalence, or existing drift.
- Run a project-provided architecture or dependency-boundary check only when it directly supplies evidence for the selected target. Leave general typecheck, lint, test, and build validation to `$code-review`.
- Distinguish direct evidence from inference and record any behavior that static inspection cannot verify.

## 4. Classify findings

Assign exactly one category to each actionable item:

- `BLOCKER`: A violation prevents safe delivery, defeats a critical isolation or ownership boundary, or creates severe cross-boundary impact that must be resolved before delivery.
- `DRIFT`: The implementation contradicts or bypasses an approved architectural rule or required structure without an approved replacement.
- `OVERENGINEERING`: The implementation or an approved architectural rule creates concrete current cost through unjustified abstraction, duplication of concepts, or excessive indirection without a current driver.
- `DOCUMENTATION`: Approved requirements or decisions justify the implementation, but `docs/ARCHITECTURE.md` is stale, incomplete, or internally contradictory.
- `FUTURE`: A confirmed roadmap item, measured condition, or documented `DD-*` trigger is relevant but has not yet created a present violation or required action.

- Classify an undocumented implementation change as `DRIFT` when there is no approved evidence that supersedes the architecture. Do not relabel drift as `DOCUMENTATION` merely because the implementation appears reasonable or an engineer comment calls the document outdated.
- Use `DOCUMENTATION` only when approved evidence supports the newer direction. Route the document change to `$arch-design`; do not draft or edit it during review.
- Use `FUTURE` only for evidence-backed watch items with a concrete reconsideration trigger. Do not turn hypothetical scale, possible reuse, or generic best practices into findings.
- Do not fill categories for completeness. Prefer the lowest category that accurately represents current impact, and omit speculative or cosmetic observations.
- Order current findings by `BLOCKER`, `DRIFT`, `OVERENGINEERING`, then `DOCUMENTATION`; order equal categories by impact and confidence. Report `FUTURE` items separately.

## 5. Report the review

Use this structure:

```markdown
# Architecture Review

## Review Target

## Architecture Baseline

## Findings

## Future Triggers

## Verification Limits
```

- Identify the selected implementation surface and any diff base under `Review Target`.
- List the applicable architecture sections, `AD-*` decisions, `DD-*` items, and approved requirement drivers under `Architecture Baseline`.
- Format each current finding heading as `[CATEGORY] Concise title`. Cite the architectural rule, the most specific implementation location, concrete evidence, current impact, and a short disposition.
- Use `[FUTURE] Concise title` under `Future Triggers` and state the evidence, trigger, current status, and why no immediate change is recommended.
- State `No findings.` when no current finding remains and `None.` when no future trigger applies.
- Record unavailable evidence and residual uncertainty under `Verification Limits`; never present an unexecuted check as proof of conformance.
- Match the language of the engineer's request unless the project establishes another reporting language.

## 6. Preserve review boundaries

- Keep the review strictly read-only. Do not edit implementation, tests, specifications, architecture, configuration, dependencies, or generated files.
- Report before correction. Route an approved architecture update to `$arch-design`, an authorized implementation correction to `$feature-implementation`, and a dedicated complexity reduction to `$simplify`.
- Leave general defects and delivery checks to `$code-review`, requirement coverage to `$requirements-review`, and security, performance, and accessibility analysis to their specialist skills.
- Report an architectural consequence discovered in the selected surface without expanding into those adjacent reviews.
- Do not prescribe a broad refactor, invent architectural rules, recommend abstractions for hypothetical evolution, or treat repository-wide consistency as an automatic goal.
