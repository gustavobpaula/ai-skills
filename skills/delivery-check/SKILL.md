---
name: delivery-check
description: Prioritize remaining product delivery work against approved requirements, current implementation evidence, validation state, and an explicit delivery horizon such as a deadline, release or milestone date, remaining duration, or available capacity. Use when Codex needs to recommend what must be finished, should be attempted, can wait, or should be skipped before a release, milestone, or deadline, from a same-day checkpoint to a multi-week release. Keep the workflow read-only; do not use it to implement fixes, invent scope, or replace requirements, code, architecture, or specialist reviews.
---

# Delivery Check

Produce a short, realistic checkpoint that keeps the engineer in control of the remaining capacity and scope.

## 1. Establish the checkpoint

- Read the engineer's request, project instructions, delivery constraints, and supplied review or validation results.
- Require an explicit delivery horizon: a deadline, release or milestone date, remaining duration, or available capacity. If none is available, ask for one and wait before producing the prioritization.
- Resolve the horizon to usable working capacity, not calendar time. Use the people, availability, and working days the engineer supplies. When a conversion needs a missing fact, state the assumption, or ask when it would materially change the priorities.
- Read `docs/SPEC.md` when it exists. Treat its explicit feature links as the approved catalog for automatic discovery and ignore unlinked specifications unless the engineer selects one explicitly.
- In a GitHub Spec Kit project (`.specify/` exists), feature specifications live at `specs/<feature>/spec.md` and have no link catalog. Take the approved delivery scope from an explicit selection, then the active feature Spec Kit records (`SPECIFY_FEATURE_DIRECTORY`, then `feature_directory` in `.specify/feature.json`), or the feature directory matching the current Git branch name.
- Treat an explicitly selected specification as approved for this checkpoint even when it is unlinked. If its path does not exist, report the missing target and return to `$spec`; do not silently fall back to `docs/SPEC.md`.
- When no specification is selected and `docs/SPEC.md` is missing, require equivalent approved scope supplied or explicitly authorized by the engineer; do not derive product requirements from the implementation.
- Read `docs/ARCHITECTURE.md` only when its decisions affect feasibility, dependency order, or the cost of remaining work. Do not perform an architecture review.

## 2. Resolve the active delivery target

- Prefer an explicitly supplied specification path or release scope, then a path with `FR-*` or `AC-*` identifiers, then the single linked feature specification that matches the request, then requirements written directly in `docs/SPEC.md`, then another explicitly bounded approved deliverable.
- Allow a release or milestone target to span several selected specifications. Keep every unit qualified by its specification path.
- Treat requirement identity as specification path plus local identifier, including Spec Kit `FR-###`, `SC-###`, and acceptance scenarios as `US<n>/AC<n>`. When bare identifiers occur in more than one document, ask for the path rather than merging the targets.
- For modular specifications, read the active features and applicable global constraints. Consult another linked feature only when needed to classify observed work outside the target; do not load the complete catalog as delivery scope.
- When no narrower target is supplied, treat the mandatory requirements and acceptance criteria in the primary specification as the delivery target.
- Ask the engineer to choose when multiple plausible active targets would produce materially different priorities.
- Treat optional requirements, assumptions, open questions, deferred work, and out-of-scope items as non-mandatory unless the engineer explicitly promotes them. Treat Spec Kit user-story priorities as product priority among mandatory work, not as permission to drop a lower-priority story.

## 3. Inspect the current delivery state

- Inspect relevant source, tests, configuration, repository status, and current changes to distinguish completed, incomplete, incorrect, and unverified work.
- Reuse recent trustworthy evidence from `requirements-review`, `code-review`, CI, editor diagnostics, issue trackers, or executed checks when supplied.
- Use a Spec Kit `tasks.md` as an inventory of planned work, not as a source of requirements. An unchecked task is evidence of remaining work; a checked task is not proof that its behavior works. Treat a task that no approved requirement or delivery gate needs as optional.
- Treat passing checks as evidence, not proof that every required behavior or affected contract is correct.
- Run only a fast, non-interactive, non-corrective check when its result is likely to change the ordering and its cost is proportional to the horizon. Do not install dependencies or start a broad review workflow.
- Record uncertainty honestly. Do not treat an unexecuted check or unverified flow as passing.
- Inspect only deeply enough to prioritize. Leave exhaustive coverage, code quality, architecture, security, performance, and accessibility analysis to their dedicated skills.

## 4. Build the remaining-work inventory

Consider work in this order:

1. Mandatory requirements or acceptance criteria that are missing or incorrect.
2. Broken end-to-end behavior, compilation, tests, packaging, or other delivery gates the project requires, including release, migration, deployment, or rollout steps.
3. Validation needed to establish that the mandatory flows work.
4. High-value risk reduction that supports delivery.
5. Optional features, polish, speculative hardening, and refactoring.

- Prefer finishing complete end-to-end flows over partially advancing several improvements.
- Preserve requirement identifiers and concrete evidence when available.
- Combine tightly related work into one executable item; do not write a detailed implementation design.
- Exclude broad new features and work that does not improve the active delivery target.

## 5. Fit the work to the horizon

- Reserve explicit capacity for the validation, review, and release activities the project requires, such as QA, approvals, deployment, and rollout verification. Do not allocate the entire horizon to implementation.
- Estimate each item conservatively, including implementation, focused validation, review, and normal coordination overhead. Use the unit that matches the horizon: minutes for a same-day checkpoint, hours or days for a release. Avoid false precision.
- For horizons of several days or more, give estimates as ranges, assess the status against the conservative end, and name the estimates that carry the most risk.
- Order items by prerequisite, delivery impact, confidence, and credible fit within usable capacity. Mark work that can proceed in parallel only when the supplied capacity includes more than one person.
- Do not demote a mandatory requirement because it does not fit. When the conservative `MUST` total reaches or exceeds usable capacity, leaving no buffer, mark delivery `AT RISK`, identify the smallest coherent releasable scope, and request an explicit scope or date decision.
- Recommend skipping optional work before weakening a required end-to-end flow.

## 6. Classify the recommendation

- `MUST`: Include every unresolved mandatory requirement, broken primary flow, or indispensable delivery gate.
- `SHOULD`: Include high-value risk reduction that credibly fits after all `MUST` work.
- `IF TIME`: Include isolated, dispensable improvements that cannot jeopardize validation or release.
- `SKIP`: Explicitly reject work inappropriate for this checkpoint, including broad refactoring, unrequested features, speculative abstractions, and low-value polish.

Do not hide delivery risk by moving required work to `SHOULD`, `IF TIME`, or `SKIP`.

## 7. Report the checkpoint

Use this structure:

```markdown
# Delivery Check

Horizon: ...
Usable capacity: ...
Validation / release reserve: ...
Status: ON TRACK | AT RISK

## MUST
- [~estimate] Task — evidence or delivery reason.

## SHOULD
None.

## IF TIME
None.

## SKIP
- Task — reason to defer it.
```

- State capacity assumptions next to `Usable capacity`.
- Include all `MUST` work and keep the other categories to the few highest-value items.
- Order each category by execution sequence.
- Keep every recommendation, risk response, and requested scope decision inside the four categories. After `SKIP`, allow at most one closing line that routes follow-up work; do not append a summary or another section.
- Always include all four categories, using `None.` for an empty one.
- Keep evidence close to each recommendation and distinguish observation from inference.
- Match the language of the engineer's request unless the project establishes another reporting language.
- Keep the report deliberately short and immediately actionable.

## 8. Preserve decision boundaries

- Keep the checkpoint read-only. Do not edit code, tests, specifications, task lists, architecture, configuration, or dependencies; do not commit, package, publish, or deploy.
- Do not invent requirements, approve scope reduction or a date change, or silently change architectural decisions.
- Do not replace `requirements-review`, `code-review`, `arch-review`, or a specialist review. Consume their evidence when available.
- After reporting, wait for the engineer to select or authorize follow-up work. Route implementation to `$feature-implementation` or the project's implementation workflow when appropriate.
