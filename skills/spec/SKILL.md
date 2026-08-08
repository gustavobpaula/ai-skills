---
name: spec
description: Turn feature requests, challenge briefs, and product requirements into a concise, reviewable docs/SPEC.md before architecture or implementation work. Use when Codex needs to clarify requirements, define observable acceptance criteria and scope, create a new specification, or safely update an existing specification. Do not use this skill to design architecture or write implementation code.
---

# Specification

Create or update `docs/SPEC.md` while keeping requirements and decisions under the engineer's control.

## 1. Gather context

- Read the supplied requirements, constraints, timebox, and relevant project context.
- Inspect the repository for facts that affect the specification. Read `docs/SPEC.md` when it exists.
- Treat explicit requirements and confirmed decisions as authoritative. Do not infer new product scope from the codebase.
- Separate explicit requirements, confirmed decisions, observed project facts, assumptions, and ambiguities.

## 2. Resolve material ambiguity

- Treat an ambiguity as material when different answers would change functionality, business rules, scope, platform constraints, or acceptance criteria.
- Ask and wait for the engineer when a material ambiguity remains. Ask no more than three focused questions per round.
- For batch operations that mention both valid and invalid items, resolve whether partial success is allowed or the operation must be atomic.
- Do not ask for facts that can be discovered safely from the repository.
- Record minor, non-blocking inferences as assumptions instead of presenting them as requirements.
- Do not produce the complete draft while a material ambiguity remains unresolved.

## 3. Draft the specification

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

- State the goal in a short paragraph.
- Give functional requirements stable identifiers such as `FR-1`.
- Give acceptance criteria identifiers such as `AC-1` and reference the covered requirement, for example `AC-1 [FR-1]`.
- Write observable acceptance criteria. Ask rather than inventing any missing product decision needed to make a criterion observable.
- Make every item traceable to supplied requirements, confirmed decisions, or relevant observed constraints.
- Keep assumptions separate from mandatory requirements. Include only non-material assumptions needed to make the draft usable; do not add conventional product defaults.
- Include only explicit or confirmed exclusions in `Out of Scope`. Do not list common adjacent features merely to demonstrate that they were not requested.
- Include only supplied edge cases or direct consequences of requirements. Ask when an edge-case policy would materially change behavior.
- Use `Open Questions` only for non-blocking or deliberately deferred questions.
- State when a section has no supplied or identified items; do not fill it with speculative content.
- Match the language of the requirements unless the project establishes a different documentation language.
- Keep a small challenge specification near or below 600 words and reviewable in under two minutes. Prefer completeness over a rigid word limit when the requirements genuinely demand more.

## 4. Preserve an existing specification

- Preserve accepted content outside the requested change.
- Preserve existing requirement and acceptance-criterion identifiers.
- Append new identifiers after the highest existing identifier.
- Leave gaps when an item is explicitly removed; do not renumber later items.
- Surface conflicts between the request and the current specification as material ambiguities.
- Present the complete resulting document, not an isolated patch, for review.

## 5. Review before writing

- Present the complete draft in the conversation and explicitly state that no file has been changed.
- Ask for explicit approval before creating or replacing `docs/SPEC.md`.
- Revise the draft and request approval again when the engineer asks for changes.
- After approval, write exactly the approved draft. Create `docs/` when needed.
- Treat an explicit instruction to write without preview as approval to bypass the default preview, subject to host permissions and working mode.
- If writing is not permitted, return the approved Markdown and explain the constraint.

Do not design architecture, write implementation code, or expand the requested product scope. If the request also asks for those activities, finish the specification workflow first and keep later work separate.
