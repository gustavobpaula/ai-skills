---
name: arch-design
description: Design or update durable, proportional project architecture from docs/SPEC.md and existing project context, producing a concise, reviewable docs/ARCHITECTURE.md before implementation. Use when Codex needs to define the technology baseline, directory patterns and responsibilities, dependency rules, naming conventions, state and integration boundaries, feature-extension rules, testing seams, or architectural trade-offs. Do not use to prescribe feature file names, implement features, or retrospectively review architectural drift.
---

# Architecture Design

Create or update `docs/ARCHITECTURE.md` as a durable set of project rules while keeping architectural decisions under the engineer's control.

## 1. Establish the source of truth

- Read `docs/SPEC.md`, the timebox, technical constraints, and relevant project instructions.
- Require `docs/SPEC.md` by default. If it is missing, ask the engineer to create it with `$spec` before continuing.
- Proceed from equivalent requirements supplied in the conversation only when the engineer explicitly authorizes bypassing the file.
- Read `docs/ARCHITECTURE.md` when it exists.
- Inspect the repository for the language, frameworks, runtime, build and test tooling, directory organization, dependency direction, state ownership, integrations, and naming conventions.
- Treat the specification as authoritative for behavior and scope. Treat the codebase as evidence of current technical context, not as a source of new product requirements.

## 2. Resolve blocking uncertainty

- Review assumptions and open questions in the specification before designing.
- Return unresolved product decisions to the specification workflow when they affect persistence, contracts, platforms, state lifetime, security boundaries, or acceptance criteria. Do not settle them as architectural choices.
- Discover safely observable project facts instead of asking the engineer to describe them.
- Ask and wait when an unresolved technical preference would materially change the technology baseline, dependencies, runtime or deployment boundaries, persistence, shared state, or primary module boundaries.
- Ask no more than three focused questions per round.
- When one option is clearly more proportional to confirmed drivers, recommend it in the draft and let the document approval gate confirm the decision.

## 3. Define durable architecture

- Describe rules that should remain valid as features are added. Keep feature-specific implementation plans outside `docs/ARCHITECTURE.md`.
- Start with the smallest coherent architecture that satisfies current requirements and confirmed constraints.
- Preserve existing technologies, boundaries, and conventions when they remain adequate. For an existing project, describe only the necessary architectural delta.
- Ground plausible evolution in a supplied roadmap, confirmed expectation, or expensive-to-reverse constraint. Treat purely hypothetical growth as deferred.
- Define the applicable technology roles, directory patterns, responsibilities, dependency rules, state ownership, external boundaries, domain placement, naming conventions, extension rules, and testing seams.
- Prefer vertical cohesion and explicit ownership over a fixed number of layers or files.
- Add a non-trivial abstraction only after answering:
  1. What current problem does it solve?
  2. Why must it exist now?
  3. What becomes worse without it?
  4. How expensive would it be to introduce later?
- Do not add repositories, mappers, global stores, use-case layers, generic interfaces, caching, queues, or deployment components merely because they are conventional.
- Read [references/architecture-patterns.md](references/architecture-patterns.md) when comparing greenfield patterns, considering a material restructure, or when the engineer asks for architecture suggestions. Use the profiles as selection heuristics, never as templates.

## 4. Specify organization without freezing the solution

- Define directory patterns with placeholders such as `features/<feature>/`, `domain/<area>/`, or `integrations/<provider>/`.
- For each directory pattern, state its responsibility, allowed dependencies, and forbidden responsibilities or imports.
- Do not produce an exhaustive repository tree or prescribe names for files that future feature implementation will create.
- Name a concrete file only when it already exists and its architectural responsibility must be clarified, or when it is a framework-mandated entry point, configuration surface, or stable public contract.
- Express planned modules as responsibilities and naming patterns rather than filenames. Leave concrete decomposition to feature planning and implementation.
- Define how a new feature joins the architecture: required location, public boundary, state ownership, integration access, domain placement, and proportional tests.
- State what a feature may contain and what it must not bypass, duplicate, or import.

## 5. Define technology and naming conventions

- Record the technology baseline by concern: language, runtime or framework, build tooling, styling or UI foundation, state approach, data communication, persistence, and testing.
- Explain the architectural role and relevant constraint for each technology. Do not list transitive packages or reproduce `package.json`.
- Do not introduce or replace technology without a current requirement, observed constraint, or approved decision.
- Infer naming conventions from the existing project. Preserve the dominant convention and surface material inconsistencies without planning an unrelated migration.
- For a greenfield project, propose conventions appropriate to the chosen ecosystem and request approval through the draft.
- Define conventions for directories, source files, component or class files, tests, hooks or composables, functions, types, and constants when applicable.
- Use canonical casing names such as `kebab-case`, `camelCase`, `PascalCase`, and `SCREAMING_SNAKE_CASE`.
- Give abstract examples such as `<feature-name>/`, `<ComponentName>.tsx`, or `use<Capability>.ts`; do not turn examples into planned project files.

## 6. Draft the architecture

Use this structure:

```markdown
# Architecture

## Context and Drivers
## Technology Baseline
## Architectural Style and Boundaries
## Directory Organization
## Dependency Rules
## State and Data Ownership
## External Integrations
## Domain Rules
## Naming Conventions
## Feature Extension Rules
## Testing Strategy
## Decisions and Trade-offs
## Deferred Decisions
```

- Keep the second-level sections stable. State `Not applicable` briefly when a concern genuinely does not apply.
- Use a table for `Technology Baseline` with concern, decision, role, and rationale or constraint.
- Use a table for `Directory Organization` with pattern, responsibility, allowed dependencies, and forbidden contents or dependencies.
- Write `Feature Extension Rules` using `Every new feature must`, `A feature may`, and `A feature must not`.
- Make dependency direction and state ownership explicit when more than one boundary participates.
- Use a diagram only when it makes runtime or dependency relationships materially easier to understand.
- Assign stable identifiers such as `AD-1` to major decisions. State the decision, current drivers, and meaningful consequences or trade-offs.
- Reference relevant `FR-*` or `AC-*` identifiers when they drive a decision; cite unnumbered constraints by name.
- Assign `DD-*` identifiers to intentionally deferred decisions and state the concrete trigger for reconsidering each one. State `None` when no decision is deferred.
- Match the language of the specification unless the project establishes another documentation language.
- Keep a small challenge architecture near or below 900 words and reviewable in about four minutes. Prefer durable clarity over a rigid limit.

## 7. Preserve an existing architecture

- Preserve accepted content and decisions outside the requested change.
- Preserve existing `AD-*` and `DD-*` identifiers and their wording outside the requested change. Do not retrofit accepted items to the current format; add necessary context elsewhere.
- Revise an accepted decision only when the approved change requires it. Identify the conflict and proposed replacement explicitly before requesting approval.
- Append new identifiers after the highest existing identifier and leave gaps when an item is removed.
- Surface conflicts between the specification, requested change, current implementation, and documented architecture.
- Distinguish a required architectural change from implementation drift; leave retrospective drift review to `arch-review`.
- Present the complete resulting document, not an isolated patch, for review.

## 8. Review before writing

- Present the complete draft in the conversation and explicitly state that no file has been changed.
- Ask for explicit approval before creating or replacing `docs/ARCHITECTURE.md`.
- Revise the draft and request approval again when the engineer asks for changes.
- After approval, write exactly the approved draft. Create `docs/` when needed.
- Treat an explicit instruction to write without preview as approval to bypass the default preview, subject to host permissions and working mode.
- If writing is not permitted, return the approved Markdown and explain the constraint.

Do not implement application code, change dependencies or configuration, edit `docs/SPEC.md`, enumerate planned feature files, or expand product scope. If the request also asks for implementation, finish the architecture workflow first and keep later work separate.
