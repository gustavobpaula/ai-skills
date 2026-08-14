---
name: delivery-check
description: Prioritize remaining delivery work against approved requirements, current implementation evidence, validation state, and an explicit time limit. Use when Codex needs to recommend what must be finished, should be attempted, can wait, or should be skipped before a deadline. Keep the workflow read-only; do not use it to implement fixes, invent scope, or replace requirements, code, architecture, or specialist reviews.
---

# Delivery Check

Produce a short, realistic checkpoint that keeps the engineer in control of the remaining time and scope.

## 1. Establish the checkpoint

- Read the engineer's request, project instructions, delivery constraints, and supplied review or validation results.
- Require an explicit duration or deadline. If neither is available, ask for the time remaining and wait before producing the prioritization.
- Resolve a deadline to usable remaining time. Ask only when a missing timezone or other ambiguity materially changes that time.
- Read `docs/SPEC.md` when it exists. Treat its explicit feature links as the approved catalog for automatic discovery and ignore unlinked specifications unless the engineer selects one explicitly.
- Treat an explicitly selected specification as approved for this checkpoint even when it is unlinked. If its path does not exist, report the missing target and return to `$spec`; do not silently fall back to `docs/SPEC.md`.
- When no specification is selected and `docs/SPEC.md` is missing, require equivalent approved scope supplied or explicitly authorized by the engineer; do not derive product requirements from the implementation.
- Read `docs/ARCHITECTURE.md` only when its decisions affect feasibility, dependency order, or the cost of remaining work. Do not perform an architecture review.

## 2. Resolve the active delivery target

- Prefer an explicitly supplied specification path, then a path with `FR-*` or `AC-*` identifiers, then the single linked feature specification that matches the request, then requirements written directly in `docs/SPEC.md`, then another explicitly bounded approved deliverable.
- Treat requirement identity as specification path plus local identifier. When bare identifiers occur in more than one catalog document, ask for the path rather than merging the targets.
- For modular specifications, read the active feature and applicable global constraints. Consult another linked feature only when needed to classify observed work outside the target; do not load the complete catalog as delivery scope.
- When no narrower target is supplied, treat the mandatory requirements and acceptance criteria in the primary specification as the delivery target.
- Ask the engineer to choose when multiple plausible active targets would produce materially different priorities.
- Treat optional requirements, assumptions, open questions, deferred work, and out-of-scope items as non-mandatory unless the engineer explicitly promotes them.

## 3. Inspect the current delivery state

- Inspect relevant source, tests, configuration, repository status, and current changes to distinguish completed, incomplete, incorrect, and unverified work.
- Reuse recent trustworthy evidence from `requirements-review`, `code-review`, CI, editor diagnostics, or executed checks when supplied.
- Treat passing checks as evidence, not proof that every required behavior or affected contract is correct.
- Run only a fast, non-interactive, non-corrective check when its result is likely to change the ordering and its cost is proportional to the remaining time. Do not install dependencies or start a broad review workflow.
- Record uncertainty honestly. Do not treat an unexecuted check or unverified flow as passing.
- Inspect only deeply enough to prioritize. Leave exhaustive coverage, code quality, architecture, security, performance, and accessibility analysis to their dedicated skills.

## 4. Build the remaining-work inventory

Consider work in this order:

1. Mandatory requirements or acceptance criteria that are missing or incorrect.
2. Broken end-to-end behavior, compilation, tests, packaging, or other required delivery gates.
3. Validation needed to establish that the mandatory flow works.
4. High-value risk reduction that supports delivery.
5. Optional features, polish, speculative hardening, and refactoring.

- Prefer finishing one complete end-to-end flow over partially advancing several improvements.
- Preserve requirement identifiers and concrete evidence when available.
- Combine tightly related work into one executable item; do not write a detailed implementation design.
- Exclude broad new features and work that does not improve the active delivery target.

## 5. Fit the work to the time

- Reserve explicit time for required validation and handoff or packaging. Do not allocate the entire remaining time to implementation.
- Estimate each item conservatively, including implementation, focused validation, and normal switching overhead. Use approximate minutes rather than false precision.
- Order items by prerequisite, delivery impact, confidence, and credible fit within the usable time.
- Do not demote a mandatory requirement because it does not fit. When the `MUST` total exceeds the usable time, mark delivery `AT RISK`, identify the smallest coherent deliverable, and request an explicit scope decision.
- Recommend skipping optional work before weakening a required end-to-end flow.

## 6. Classify the recommendation

- `MUST`: Include every unresolved mandatory requirement, broken primary flow, or indispensable delivery gate.
- `SHOULD`: Include high-value risk reduction that credibly fits after all `MUST` work.
- `IF TIME`: Include isolated, dispensable improvements that cannot jeopardize validation or handoff.
- `SKIP`: Explicitly reject work inappropriate for this checkpoint, including broad refactoring, unrequested features, speculative abstractions, and low-value polish.

Do not hide delivery risk by moving required work to `SHOULD`, `IF TIME`, or `SKIP`.

## 7. Report the checkpoint

Use this structure:

```markdown
# Delivery Check

Time remaining: ...
Validation / handoff reserve: ...
Status: ON TRACK | AT RISK

## MUST
- [~N min] Task — evidence or delivery reason.

## SHOULD
None.

## IF TIME
None.

## SKIP
- Task — reason to defer it.
```

- Include all `MUST` work and keep the other categories to the few highest-value items.
- Order each category by execution sequence.
- Keep every recommendation, risk response, and requested scope decision inside the four categories. Do not append a separate summary or next-action section after `SKIP`.
- Use `None.` for an empty category.
- Keep evidence close to each recommendation and distinguish observation from inference.
- Match the language of the engineer's request unless the project establishes another reporting language.
- Keep the report deliberately short and immediately actionable.

## 8. Preserve decision boundaries

- Keep the checkpoint read-only. Do not edit code, tests, specifications, architecture, configuration, or dependencies; do not commit, package, publish, or deploy.
- Do not invent requirements, approve scope reduction, or silently change architectural decisions.
- Do not replace `requirements-review`, `code-review`, `arch-review`, or a specialist review. Consume their evidence when available.
- After reporting, wait for the engineer to select or authorize follow-up work. Route implementation to `$feature-implementation` when appropriate.
