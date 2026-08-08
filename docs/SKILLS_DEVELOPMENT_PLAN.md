# AI Engineering Skills — Development Plan

## 1. Objective

Create a reusable, versioned set of AI engineering skills to accelerate software development while keeping architectural, product, and technical decisions under the engineer's control.

The skills should act as specialized engineering assistants rather than autonomous decision-makers.

Primary workflow:

```text
Requirements
    ↓
spec
    ↓
docs/SPEC.md
    ↓
arch-design
    ↓
docs/ARCHITECTURE.md
    ↓
feature-implementation
    ↓
Implementation
    ↓
Specialized reviews
    ↓
Quality / Requirements validation
    ↓
Delivery
```

Core principles:

- AI accelerates engineering decisions; it does not replace them.
- Requirements are the source of truth for what must be delivered.
- Architecture should be proportional to current requirements and plausible evolution.
- Avoid speculative abstractions and premature optimization.
- Project-specific context stays inside the project.
- Reusable engineering skills stay outside individual projects.
- Skills should be portable between AI coding agents whenever practical.
- Every skill should have a narrow, explicit responsibility.
- Reviews should report findings before making broad or destructive changes.

---

# 2. Repository Strategy

Create a dedicated repository for the skills. Example:

```text
gustavo-ai-skills/
├── README.md
├── skills/
│   ├── spec/
│   │   └── SKILL.md
│   ├── arch-design/
│   │   └── SKILL.md
│   ├── feature-implementation/
│   │   └── SKILL.md
│   ├── requirements-review/
│   │   └── SKILL.md
│   ├── code-review/
│   │   └── SKILL.md
│   ├── delivery-check/
│   │   └── SKILL.md
│   ├── test-strategy/
│   │   └── SKILL.md
│   ├── arch-review/
│   │   └── SKILL.md
│   ├── simplify/
│   │   └── SKILL.md
│   ├── a11y-review/
│   │   └── SKILL.md
│   ├── debug/
│   │   └── SKILL.md
│   ├── security-review/
│   │   └── SKILL.md
│   └── performance-review/
│       └── SKILL.md
├── scripts/
│   ├── install.sh
│   ├── install-codex.sh
│   └── install-claude.sh
├── docs/
│   ├── SKILLS_DEVELOPMENT_PLAN.md
│   └── WORKFLOW.md
└── tests/
    └── skills/
```

## Source of truth

This repository is the canonical version of all skills.

Do not maintain independent copies inside challenge/application repositories. Improvements should happen in one place and be versioned with Git.

## Global skills, local context

Use this rule:

> **Skills are global. Context is local.**

Reusable skills belong to the personal skills repository / agent environment:

```text
spec
arch-design
feature-implementation
requirements-review
code-review
delivery-check
test-strategy
arch-review
simplify
a11y-review
debug
security-review
performance-review
```

Project-specific artifacts belong to the application repository:

```text
project/
├── docs/
│   ├── SPEC.md
│   └── ARCHITECTURE.md
├── src/
└── ...
```

Skills should read these local artifacts when they need project context.

---

# 3. Installation and Distribution Strategy

Avoid manually copying skills into every project.

The skills repository should provide lightweight installation scripts capable of exposing selected skills to the AI coding agent being used.

Conceptually:

```text
Git repository
     ↓
gustavo-ai-skills
     ↓
install / update
     ↓
AI agent global skills directory
     ↓
Any project
```

Desired developer experience:

```bash
./scripts/install.sh spec arch-design feature-implementation code-review
```

Agent-specific adapters can handle differences between Codex, Claude Code, or other tools without changing the core skill content.

Keep the core `SKILL.md` files as tool-agnostic as practical. Agent-specific metadata or conventions should live in the installation/adaptation layer when possible.

For live coding interviews, all required skills should be installed and tested **before the interview starts**. No interview time should be spent setting up the toolbox.

Do not build a package registry, npm distribution system, or complex CLI unless a real need emerges. Git + simple installation/synchronization is enough initially.

---

# 4. Priority Overview

| Priority | Skill | Purpose |
|---|---|---|
| P0 | `spec` | Convert requirements into a concise specification |
| P0 | `arch-design` | Define and document proportional architecture |
| P0 | `feature-implementation` | Implement features using SPEC + architecture |
| P0 | `requirements-review` | Validate implementation against requirements |
| P0 | `code-review` | Execute the final engineering quality gate |
| P1 | `delivery-check` | Prioritize remaining work under a time constraint |
| P1 | `test-strategy` | Determine highest-value tests based on risk |
| P1 | `arch-review` | Detect architectural drift and overengineering |
| P1 | `simplify` | Reduce accidental complexity |
| P2 | `a11y-review` | Validate frontend accessibility |
| P2 | `debug` | Perform evidence-driven debugging |
| P2 | `security-review` | Identify relevant security risks |
| P2 | `performance-review` | Identify meaningful performance problems |

---

# 5. Phase 0 — Foundation

Before implementing the skills:

1. Create the dedicated Git repository.
2. Create the `skills/`, `scripts/`, `docs/`, and `tests/` directories.
3. Add this development plan to `docs/SKILLS_DEVELOPMENT_PLAN.md`.
4. Define a common structure/convention for `SKILL.md` files.
5. Implement the simplest possible installation strategy for the primary coding agent.
6. Document how skills are installed, updated, and tested.
7. Verify that a skill can be updated in the central repository and consumed by a separate test project without manual duplication.

### Definition of Done

A clean test project can access an installed skill while keeping project-specific documents inside its own repository.

---

# 6. Phase 1 — Core Workflow (P0)

These skills should be implemented and tested before expanding the toolbox.

## 6.1 `spec`

### Purpose

Convert a challenge description or feature request into a concise `docs/SPEC.md` that becomes the source of truth for implementation.

### Inputs

- Original requirements
- Constraints
- Available time/timebox
- Existing project context, when applicable

### Output

`docs/SPEC.md`

Suggested structure:

```md
# Specification

## Goal

## Functional Requirements

## Acceptance Criteria

## Constraints

## Edge Cases

## Out of Scope

## Open Questions
```

### Rules

- Do not invent requirements.
- Clearly distinguish explicit requirements from assumptions.
- Surface ambiguities that materially affect implementation.
- Keep the document concise.
- Do not generate implementation code unless explicitly requested.
- Prioritize requirements that determine whether the delivery is complete.

### Interview constraint

The generated specification should normally take less than two minutes for an engineer to review.

### Definition of Done

Given a small live-coding challenge, the skill produces a concise specification that accurately captures the required behavior without expanding the scope.

---

## 6.2 `arch-design`

### Purpose

Analyze `SPEC.md` and project context, help define an architecture proportional to the problem, and create/update `docs/ARCHITECTURE.md`.

### Inputs

- `docs/SPEC.md`
- Existing codebase, if present
- Technical constraints
- Time constraints

### Output

`docs/ARCHITECTURE.md`

Suggested structure:

```md
# Architecture

## Context

## Architectural Goals

## Project Structure

## Data Flow

## State Management

## External Communication

## Domain Logic

## Testing Strategy

## Naming / Conventions

## Architectural Decisions

## Trade-offs

## Deferred Decisions
```

### Core decision rule

For every proposed abstraction, answer:

1. What problem does it solve now?
2. Why should it exist now instead of later?
3. What becomes worse if it is removed?
4. How expensive would it be to introduce later?

### Rules

- Do not apply a fixed architecture template blindly.
- Prefer the simplest architecture that preserves clear boundaries, testability, and maintainability.
- Do not design for purely hypothetical scale.
- Avoid speculative repositories, mappers, global state, use-case layers, or generic abstractions unless justified.
- Explicitly document important decisions intentionally postponed.
- Architecture may evolve when requirements justify it.

### Definition of Done

The skill produces meaningfully different recommendations for problems with different complexity levels and can explain why each major abstraction exists.

---

## 6.3 `feature-implementation`

### Purpose

Implement a feature while respecting the project's specification and documented architecture.

### Required workflow

```text
Read SPEC.md
    ↓
Read ARCHITECTURE.md
    ↓
Inspect existing code
    ↓
Understand requested feature
    ↓
Identify affected boundaries
    ↓
Explain implementation approach
    ↓
Implement smallest coherent solution
    ↓
Validate
```

### Rules

- Read `SPEC.md` and `ARCHITECTURE.md` before changing code when they exist.
- Follow existing project conventions.
- Reuse existing patterns before creating new abstractions.
- Do not silently change architectural decisions.
- Do not expand feature scope beyond the specification.
- Prefer complete vertical functionality over broad unfinished infrastructure.

### Architectural conflict behavior

If the feature conflicts with a documented architectural decision, report:

```text
ARCHITECTURAL CONFLICT

Current decision:
...

Feature requires:
...

Recommended change:
...

Reason:
...
```

The engineer decides whether the architecture should change.

### Definition of Done

The skill can implement a feature without ignoring requirements or silently diverging from documented architecture.

---

## 6.4 `requirements-review`

### Purpose

Compare implementation directly against `SPEC.md`.

### Scope

This skill reviews requirements only. It should not become an architecture, performance, or style review.

### Output categories

```text
IMPLEMENTED
PARTIAL
MISSING
INCORRECT
UNREQUESTED
AMBIGUOUS
```

### Rules

- Trace findings back to specific specification items.
- Detect scope creep through `UNREQUESTED` findings.
- Prioritize missing mandatory behavior over polish.
- Do not recommend unrelated refactors.
- Do not mark inferred requirements as mandatory unless they were accepted into the spec.

### Definition of Done

The skill reliably identifies intentionally seeded missing, partial, and unnecessary functionality in test projects.

---

## 6.5 `code-review`

### Purpose

Act as the final general engineering quality gate.

### Automated checks

When available, discover and run the project's actual commands for:

```text
typecheck
lint
tests
build
```

Do not assume specific package-manager commands without inspecting the project.

### Review priorities

```text
BLOCKER
BUG
MAINTAINABILITY
MINOR
```

Review for:

- Functional bugs
- Type errors
- Failing tests
- Build failures
- Lint failures
- Dead/unreachable code
- Clear maintainability issues
- Error handling gaps
- Obvious unnecessary complexity

### Rules

- Do not perform broad refactoring automatically.
- Report first; fix when explicitly requested or when the workflow clearly authorizes it.
- Avoid cosmetic/style recommendations already enforced by tooling.
- Prioritize issues that affect correctness and delivery.

### Definition of Done

The skill provides a concise, prioritized review and correctly executes the project's available validation commands.

---

# 7. Core Workflow Validation Gate

**Do not immediately continue to Phase 2 after writing the five P0 skills.**

Run at least one complete 60-minute challenge using:

```text
spec
    ↓
arch-design
    ↓
feature-implementation
    ↓
requirements-review
    ↓
code-review
```

Evaluate:

- Did documentation accelerate or slow down delivery?
- Did `arch-design` introduce unjustified abstractions?
- Did `feature-implementation` actually respect the documents?
- Did reviews return too much low-value feedback?
- Did the workflow leave enough time for a working final product?

Refine P0 skills before expanding the toolbox.

---

# 8. Phase 2 — Decision and Quality Skills (P1)

## 8.1 `delivery-check`

### Purpose

Help prioritize remaining work when delivery time is limited.

### Inputs

- `SPEC.md`
- `ARCHITECTURE.md`, when relevant
- Current implementation
- Time remaining

### Output

Keep the output deliberately short:

```text
MUST
SHOULD
IF TIME
SKIP
```

### Rules

- Requirements and broken functionality outrank refactoring.
- Consider the actual remaining time.
- Do not suggest broad new features.
- Explicitly identify work that should be skipped.
- Prefer completing an end-to-end flow over partially implementing multiple improvements.

### Definition of Done

With 10–20 minutes remaining in a simulated challenge, recommendations are realistic enough to execute within the remaining time.

---

## 8.2 `test-strategy`

### Purpose

Choose tests based on risk and value rather than maximizing coverage blindly.

### Analyze

- Business rules
- Critical user flows
- Edge cases
- Error scenarios
- Regression risk

### Output

```text
MUST TEST
SHOULD TEST
OPTIONAL
DON'T TEST
```

### Rules

- Avoid testing implementation details.
- Prioritize deterministic domain/business logic.
- Consider time constraints.
- Do not create low-value tests only to increase coverage.
- When requested to implement tests, start with `MUST TEST`.

### Definition of Done

The skill can distinguish critical tests from low-value tests in both simple and moderately complex applications.

---

## 8.3 `arch-review`

### Purpose

Compare the implementation against `ARCHITECTURE.md` and identify architectural drift, missing structure, or excessive structure.

### Review areas

- Separation of responsibilities
- Domain/feature boundaries
- Dependency direction
- State ownership
- Coupling and cohesion
- Testability
- Naming/conventions
- Unnecessary abstractions
- Missing abstractions
- Outdated architecture documentation

### Output categories

```text
BLOCKER
DRIFT
OVERENGINEERING
DOCUMENTATION
FUTURE
```

### Rules

- Review both under-engineering and overengineering.
- Do not recommend abstractions solely for hypothetical future requirements.
- Distinguish implementation drift from outdated documentation.
- Do not rewrite the application during review.

### Definition of Done

The skill can identify both an architectural violation and an unnecessary abstraction in controlled test cases.

---

## 8.4 `simplify`

### Purpose

Find accidental complexity without destroying useful architectural boundaries.

### Optimize for

- Fewer concepts
- Fewer unnecessary abstractions
- Clearer data flow
- Lower cognitive load
- Easier maintenance

### Do not optimize for

- Minimum number of files
- Minimum lines of code
- Clever/compact syntax

### Do not sacrifice

- Readability
- Testability
- Separation of concerns
- Valid architectural boundaries

### Look for

- Abstractions with no current value
- Single-use generic layers
- Unnecessary wrappers
- Premature generalization
- Duplicated concepts
- Derived state stored unnecessarily
- Excessive indirection

### Definition of Done

The skill can simplify an intentionally overengineered implementation while preserving meaningful domain boundaries.

---

# 9. Phase 3 — Specialized Skills (P2)

These are contextual specialists. They should be invoked when the problem justifies them, not automatically on every task.

## 9.1 `a11y-review`

### Purpose

Review frontend implementation for accessibility issues.

### Review areas

- Semantic HTML
- Keyboard navigation
- Focus management
- Accessible names
- Form labels and validation
- Error/status communication
- ARIA usage
- Interactive element semantics

### Core rule

> Prefer native semantic HTML over ARIA whenever native semantics solve the problem.

### Definition of Done

The skill identifies common accessibility issues without responding by adding unnecessary ARIA attributes everywhere.

---

## 9.2 `debug`

### Purpose

Perform evidence-driven debugging instead of trial-and-error code mutation.

### Required workflow

```text
Symptom
   ↓
Hypotheses
   ↓
Rank by likelihood
   ↓
Evidence required
   ↓
Inspect / experiment
   ↓
Root cause
   ↓
Minimal fix
```

### Rules

- Do not modify code immediately.
- Establish hypotheses first.
- Prefer evidence over speculation.
- Make the smallest fix addressing the root cause.
- Avoid unrelated refactoring while debugging.

### Definition of Done

The skill can diagnose seeded failures without making multiple speculative changes before identifying a cause.

---

## 9.3 `security-review`

### Purpose

Identify security risks relevant to the actual application.

### Potential frontend areas

- XSS / unsafe HTML rendering
- User-controlled content
- Secrets exposed client-side
- Unsafe URL handling
- Authentication/authorization mistakes when applicable
- Sensitive client storage
- Trust boundaries
- Dangerous dependency or browser API usage when evident

### Rules

- Keep findings contextual.
- Do not generate a generic backend security checklist for a simple frontend challenge.
- Distinguish real vulnerabilities from theoretical concerns.
- Prioritize exploitable or high-impact issues.

### Definition of Done

The skill identifies intentionally seeded frontend security issues while keeping irrelevant findings low.

---

## 9.4 `performance-review`

### Purpose

Identify meaningful performance risks without speculative micro-optimization.

### Review areas

- Unnecessary re-renders
- Duplicate requests
- Request waterfalls
- Expensive render-time computation
- Large-list rendering
- Bundle/import issues
- Assets/images
- Caching opportunities when justified
- Lazy loading/code splitting when justified
- Misuse or unnecessary use of memoization

### Output categories

```text
MEASURE FIRST
LIKELY BOTTLENECK
OPTIMIZATION
NOT RECOMMENDED
```

### Core rule

> Measure before optimizing whenever the performance impact is not evident.

The skill should be able to recommend **against** `useMemo`, `useCallback`, caching, or code splitting when their complexity is not justified.

### Definition of Done

The skill distinguishes a likely bottleneck from a speculative optimization in controlled examples.

---

# 10. Skill Testing Strategy

A skill is not complete because its prompt looks good. Each skill needs behavioral tests.

Suggested structure:

```text
tests/skills/
├── spec/
│   ├── simple-project.md
│   ├── ambiguous-requirements.md
│   └── scope-creep.md
├── arch-design/
│   ├── simple-project.md
│   ├── medium-project.md
│   └── complex-project.md
├── arch-review/
│   ├── architectural-drift.md
│   ├── missing-boundary.md
│   └── overengineered-project.md
├── requirements-review/
│   ├── missing-requirement.md
│   ├── partial-requirement.md
│   └── unrequested-feature.md
├── simplify/
│   └── unnecessary-abstraction.md
└── performance-review/
    ├── real-bottleneck.md
    └── premature-memoization.md
```

Questions to use while evaluating skills:

- Does `arch-design` always recommend the same architecture?
- Does it introduce repositories/services/mappers without justification?
- Does `simplify` remove useful boundaries?
- Does `performance-review` recommend memoization everywhere?
- Does `code-review` return dozens of low-value findings?
- Does `requirements-review` confuse assumptions with requirements?
- Does `feature-implementation` silently modify architecture?
- Does `delivery-check` propose work that cannot fit in the remaining time?

Refine the skill when these behaviors appear.

---

# 11. Recommended Interview Toolbox

Do not try to demonstrate every available skill during a one-hour interview.

Have the toolbox installed, but select skills based on the actual problem.

Recommended default sequence:

```text
spec
    ↓
arch-design
    ↓
feature-implementation
    ↓
test-strategy (if useful)
    ↓
code-review
    ↓
requirements-review
```

Use `delivery-check` at a meaningful checkpoint when time becomes a constraint.

Invoke specialists only when justified:

```text
a11y-review       → relevant UI/accessibility concerns
security-review   → relevant trust/input/security surface
performance-review→ evidence of meaningful performance risk
simplify          → complexity has grown
arch-review       → architecture needs validation
debug             → an actual failure requires diagnosis
```

A good interview explanation is:

> I maintain reusable engineering skills for recurring AI-assisted workflows. I do not run all of them automatically. I choose the specialists that make sense for the problem, while project-specific requirements and architectural decisions remain inside the repository.

---

# 12. Suggested 60-Minute Challenge Workflow

Target only; adapt to the challenge.

```text
00–05 min
Read requirements
Run spec
Review assumptions / clarify important ambiguity

05–08 min
Run arch-design
Review major decisions
Keep ARCHITECTURE.md concise

08–43 min
Implement vertically
Use feature-implementation where it adds speed
Keep the application runnable

~40 min
Optional delivery-check
Reprioritize remaining work

43–52 min
Critical tests
Error/edge states
Contextual a11y/security improvements

52–57 min
code-review / targeted arch-review
Fix only high-value findings

57–60 min
requirements-review
Run application
Demonstrate final result
```

Documentation must accelerate the implementation rather than consume the interview.

For a one-hour challenge, `SPEC.md` and `ARCHITECTURE.md` should remain intentionally concise.

---

# 13. Development Roadmap

## Milestone 0 — Repository foundation

- [ ] Create dedicated repository
- [ ] Define skill directory convention
- [ ] Create installation mechanism
- [ ] Add documentation
- [ ] Verify global skill + local project context workflow

## Milestone 1 — Core workflow

- [ ] `spec`
- [ ] `arch-design`
- [ ] `feature-implementation`
- [ ] `requirements-review`
- [ ] `code-review`
- [ ] Run first 60-minute simulation
- [ ] Refine all P0 skills based on simulation

## Milestone 2 — Decision support

- [ ] `delivery-check`
- [ ] `test-strategy`
- [ ] `arch-review`
- [ ] `simplify`
- [ ] Run second 60-minute simulation
- [ ] Measure whether skills reduce or add cognitive/time overhead

## Milestone 3 — Specialists

- [ ] `a11y-review`
- [ ] `debug`
- [ ] `security-review`
- [ ] `performance-review`

## Milestone 4 — Interview readiness

- [ ] All P0 skills installed globally
- [ ] `delivery-check` installed
- [ ] At least 2–3 full timed simulations completed
- [ ] Skills tested on a clean project
- [ ] Installation/update process verified
- [ ] No setup required during interview
- [ ] Comfortable explaining why each invoked skill is relevant
- [ ] Comfortable rejecting AI recommendations when inappropriate

---

# 14. Success Criteria

The toolbox is successful when it helps the engineer:

1. Understand requirements faster.
2. Make explicit architectural decisions without defaulting to overengineering.
3. Keep implementation aligned with those decisions.
4. Deliver working vertical functionality quickly.
5. Detect missing requirements before delivery.
6. Prioritize correctly under time pressure.
7. Apply specialized reviews only when relevant.
8. Reduce repeated prompting and recurring manual checks.
9. Preserve engineer ownership over decisions.
10. Move between projects without duplicating or rewriting skills.

The goal is not to create the largest possible skill library.

The goal is to build a small, reliable engineering system where AI acts as a set of reusable specialists coordinated by the engineer.
