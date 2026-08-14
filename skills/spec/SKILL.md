---
name: spec
description: Turn feature requests, challenge briefs, and product requirements into concise, reviewable global or feature specifications before architecture or implementation work. Use when Codex needs to clarify requirements, define observable acceptance criteria and scope, create or update docs/SPEC.md, maintain a modular specification catalog, or create or update a feature document under docs/specs/. Do not use this skill to design architecture or write implementation code.
---

# Specification

Create or update the smallest appropriate specification artifact while keeping requirements and decisions under the engineer's control. Support a small project with only `docs/SPEC.md` and continuous growth through feature documents under `docs/specs/`.

## 1. Gather context

- Read the supplied requirements, constraints, timebox, and relevant project context.
- Inspect the repository for facts that affect the specification. Read `docs/SPEC.md` when it exists and follow its explicit feature-specification links when they affect the requested change.
- Treat explicit requirements and confirmed decisions as authoritative. Do not infer new product scope from the codebase.
- Separate explicit requirements, confirmed decisions, observed project facts, assumptions, and ambiguities.

## 2. Select the specification target

- Prefer a specification path explicitly supplied by the engineer. If the path does not exist and the request is to update it, report the missing target and ask whether to create it; do not silently switch to `docs/SPEC.md`.
- Otherwise, update an existing feature specification when exactly one link from `docs/SPEC.md` matches the requested feature.
- When the project already has linked feature specifications, create a new feature as `docs/specs/<feature-slug>.md` and add a relative Markdown link under `Feature Specifications` in `docs/SPEC.md`.
- Use `docs/SPEC.md` for product-wide requirements and for a small project that does not yet need modular specifications.
- When a legacy `docs/SPEC.md` contains multiple clearly separable features, offer migration before drafting. If the engineer accepts, split only the agreed feature groups while preserving their content and identifiers. If the engineer declines, preserve the legacy content and place only the new feature in its own document.
- Treat only feature specifications explicitly linked from `docs/SPEC.md` as automatically discoverable and approved catalog entries. A specification selected explicitly by the engineer is approved for that task even when it is not linked.
- Ask the engineer to select the target when multiple linked documents plausibly match. Do not edit more than one feature specification unless the requested change genuinely spans them.

## 3. Resolve material ambiguity

- Treat an ambiguity as material when different answers would change functionality, business rules, scope, platform constraints, or acceptance criteria.
- Ask and wait for the engineer when a material ambiguity remains. Ask no more than three focused questions per round.
- For batch operations that mention both valid and invalid items, resolve whether partial success is allowed or the operation must be atomic.
- Do not ask for facts that can be discovered safely from the repository.
- Record minor, non-blocking inferences as assumptions instead of presenting them as requirements.
- Do not produce the complete draft while a material ambiguity remains unresolved.

## 4. Draft the specification

Use this structure:

```markdown
# Specification

## Goal
## Functional Requirements
## Acceptance Criteria
## Constraints
## Assumptions
## Edge Cases
## Out of Scope
## Open Questions
```

- Use `# Specification` for `docs/SPEC.md` and `# Feature Specification: <Feature>` for a feature document.
- Add this section to `docs/SPEC.md` when the approved catalog has feature documents:

```markdown
## Feature Specifications
- [Feature name](specs/<feature-slug>.md)
```

- Keep global rules in `docs/SPEC.md` and feature-specific behavior in the selected feature document. Do not duplicate requirements across them.

- State the goal in a short paragraph.
- Give functional requirements stable identifiers such as `FR-1`.
- Give acceptance criteria identifiers such as `AC-1` and reference the covered requirement, for example `AC-1 [FR-1]`.
- Allocate identifiers locally within each specification document. The identity of an item is its specification path plus its local identifier; two feature documents may both contain `FR-1` or `AC-1`.
- Qualify cross-document references with the source path and identifier. Never use a bare identifier when it could refer to more than one document.
- Write observable acceptance criteria. Ask rather than inventing any missing product decision needed to make a criterion observable.
- Make every item traceable to supplied requirements, confirmed decisions, or relevant observed constraints.
- Keep assumptions separate from mandatory requirements. Include only non-material assumptions needed to make the draft usable; do not add conventional product defaults.
- Include only explicit or confirmed exclusions in `Out of Scope`. Do not list common adjacent features merely to demonstrate that they were not requested.
- Include only supplied edge cases or direct consequences of requirements. Ask when an edge-case policy would materially change behavior.
- Use `Open Questions` only for non-blocking or deliberately deferred questions.
- State when a section has no supplied or identified items; do not fill it with speculative content.
- Match the language of the requirements unless the project establishes a different documentation language.
- Keep a small challenge specification near or below 600 words and reviewable in under two minutes. Prefer completeness over a rigid word limit when the requirements genuinely demand more.

## 5. Preserve existing specifications

- Preserve accepted content and catalog links outside the requested change.
- Preserve existing requirement and acceptance-criterion identifiers.
- Append new identifiers after the highest existing identifier in the selected document only. Do not scan other specifications to allocate a number.
- Leave gaps when an item is explicitly removed; do not renumber later items.
- Surface conflicts between the request and the current specification as material ambiguities.
- Preserve unlinked files under `docs/specs/` without treating them as approved requirements.
- Present the complete resulting contents of every document that would change, not isolated patches, for review.

## 6. Review before writing

- Present every complete draft in the conversation, identify each target path, and explicitly state that no file has been changed.
- Ask for one explicit approval covering the complete write set. When creating a linked feature, include both the feature document and the resulting `docs/SPEC.md` catalog in that approval.
- Revise the draft and request approval again when the engineer asks for changes.
- After approval, write exactly the approved drafts. Create `docs/` or `docs/specs/` when needed, and never add a catalog link before its feature document is approved.
- Treat an explicit instruction to write without preview as approval to bypass the default preview, subject to host permissions and working mode.
- If writing is not permitted, return the approved Markdown and explain the constraint.

Do not design architecture, write implementation code, or expand the requested product scope. If the request also asks for those activities, finish the specification workflow first and keep later work separate.
