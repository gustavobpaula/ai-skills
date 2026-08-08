---
name: arch-design
description: Design or update proportional software architecture from docs/SPEC.md and existing project context, producing a concise, reviewable docs/ARCHITECTURE.md before implementation. Use when Codex needs to decide boundaries, dependency direction, data flow, state ownership, external integrations, domain placement, testing seams, or architectural trade-offs. Do not use to implement features or retrospectively review architectural drift.
---

# Architecture Design

Create or update `docs/ARCHITECTURE.md` while keeping architectural decisions under the engineer's control.

## 1. Establish the source of truth

- Read `docs/SPEC.md`, the timebox, technical constraints, and relevant project instructions.
- Require `docs/SPEC.md` by default. If it is missing, ask the engineer to create it with `$spec` before continuing.
- Proceed from equivalent requirements supplied in the conversation only when the engineer explicitly authorizes bypassing the file.
- Read `docs/ARCHITECTURE.md` when it exists.
- Inspect the repository for the stack, runtime boundaries, current structure, dependency direction, state ownership, external integrations, test setup, and established conventions.
- Treat the specification as authoritative for behavior and scope. Treat the codebase as evidence of current technical context, not as a source of new product requirements.

## 2. Resolve blocking uncertainty

- Review assumptions and open questions in the specification before designing.
- Return unresolved product decisions to the specification workflow when they affect persistence, contracts, platforms, state lifetime, security boundaries, or acceptance criteria. Do not settle them as architectural choices.
- Discover safely observable project facts instead of asking the engineer to describe them.
- Ask and wait when an unresolved technical preference would materially change dependencies, runtime or deployment boundaries, persistence, shared state, or the primary module boundaries.
- Ask no more than three focused questions per round.
- When one option is clearly more proportional to confirmed drivers, recommend it in the draft and let the document approval gate confirm the decision.

## 3. Design proportionally

- Start with the smallest coherent design that satisfies current requirements and confirmed constraints.
- Preserve existing boundaries and conventions when they remain adequate. For an existing project, describe the necessary architectural delta rather than a greenfield replacement.
- Ground plausible evolution in a supplied roadmap, confirmed expectation, or expensive-to-reverse constraint. Treat purely hypothetical growth as deferred.
- Define only the applicable concerns: runtime boundaries, responsibilities, dependency direction, data flow, state ownership and lifetime, external communication, domain rules, error boundaries, and testing seams.
- Prefer vertical cohesion and explicit ownership over a fixed number of layers or files.
- Add a non-trivial abstraction only after answering:
  1. What current problem does it solve?
  2. Why must it exist now?
  3. What becomes worse without it?
  4. How expensive would it be to introduce later?
- Do not add repositories, mappers, global stores, use-case layers, generic interfaces, caching, queues, or deployment components merely because they are conventional.
- Read [references/architecture-patterns.md](references/architecture-patterns.md) when comparing greenfield patterns, considering a material restructure, or when the engineer asks for architecture suggestions. Use the profiles as selection heuristics, never as templates.

## 4. Draft the architecture

Use this structure:

```markdown
# Architecture

## Context and Drivers

## Proposed Design

### Boundaries and Responsibilities
### Project Structure
### Runtime and Data Flow
### State Ownership
### External Integrations
### Domain Logic

## Testing Strategy

## Decisions and Trade-offs

## Deferred Decisions
```

- Keep the five second-level sections. Include only applicable `Proposed Design` subsections.
- State scope, architectural drivers, constraints, and relevant observed facts concisely.
- Show only architecturally meaningful directories in a project tree. Do not inventory the repository.
- Make dependency direction and state ownership explicit when more than one boundary participates.
- Use a diagram only when it makes a multi-boundary or asynchronous flow materially easier to understand.
- Assign stable identifiers such as `AD-1` to major decisions. For each, state the decision, its current drivers, and meaningful consequences or trade-offs.
- Reference relevant `FR-*` or `AC-*` identifiers when they drive a decision; cite unnumbered constraints by name.
- Assign `DD-*` identifiers to intentionally deferred decisions and state the concrete trigger for reconsidering each one.
- State `None` when no decision is intentionally deferred.
- Match the language of the specification unless the project establishes another documentation language.
- Keep a small challenge architecture near or below 700 words and reviewable in about three minutes. Prefer necessary clarity over a rigid limit.

## 5. Preserve an existing architecture

- Preserve accepted decisions outside the requested change.
- Preserve existing `AD-*` and `DD-*` identifiers and their wording outside the requested change. Do not retrofit accepted items to the current format or add rationale inside them; add any necessary context elsewhere.
- Revise an accepted decision only when the approved change requires it. Identify the conflict and the proposed replacement explicitly before requesting approval.
- Append new identifiers after the highest existing identifier and leave gaps when an item is removed.
- Surface conflicts between the specification, requested change, current implementation, and documented architecture.
- Distinguish a required architectural change from implementation drift; leave retrospective drift review to `arch-review`.
- Present the complete resulting document, not an isolated patch, for review.

## 6. Review before writing

- Present the complete draft in the conversation and explicitly state that no file has been changed.
- Ask for explicit approval before creating or replacing `docs/ARCHITECTURE.md`.
- Revise the draft and request approval again when the engineer asks for changes.
- After approval, write exactly the approved draft. Create `docs/` when needed.
- Treat an explicit instruction to write without preview as approval to bypass the default preview, subject to host permissions and working mode.
- If writing is not permitted, return the approved Markdown and explain the constraint.

Do not implement application code, change dependencies or configuration, edit `docs/SPEC.md`, or expand product scope. If the request also asks for implementation, finish the architecture workflow first and keep later work separate.
