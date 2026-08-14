---
name: feature-implementation
description: Implement a scoped feature or behavior change as the smallest coherent vertical increment from approved specifications and documented architecture. Use when Codex needs to modify application code for selected FR/AC identifiers or an explicitly bounded approved feature, including necessary tests and validation. Do not use to invent or approve requirements, redesign architecture, perform broad refactors, or conduct a general review.
---

# Feature Implementation

Implement only the active feature target. Use the broader product specification and architecture as context, not as an automatic queue of work.

## 1. Establish the sources of truth

- Read the project instructions, the engineer's request, and relevant constraints or timebox.
- Prefer a feature-specification path explicitly supplied by the engineer, then a path with selected identifiers, then the single linked feature specification that matches the request, then requirements written directly in `docs/SPEC.md`.
- Treat an explicitly selected specification as approved for this task even when it is not linked from `docs/SPEC.md`. If its path does not exist, report the missing target and return to `$spec`; do not silently fall back to the root document.
- Read `docs/SPEC.md` when it exists for applicable global requirements and catalog links. Treat its explicit links as the approved catalog for automatic discovery; do not infer approval from unlinked files under `docs/specs/`.
- When multiple linked specifications plausibly match and no path disambiguates them, ask the engineer to select one. When no feature specification is selected, use requirements written directly in `docs/SPEC.md`.
- If neither a usable root specification nor an explicitly selected approved specification exists, ask the engineer to create one with `$spec`. Proceed from equivalent approved requirements supplied in the conversation only when the engineer explicitly authorizes bypassing files.
- Read `docs/ARCHITECTURE.md` when it exists. If it is absent, preserve the existing codebase's boundaries and conventions; return to `$arch-design` when the feature requires a new durable architectural decision.
- In a modular specification set, load the active feature document, applicable global rules, and only explicitly cross-referenced documents needed to interpret it. Do not load every linked feature as an implementation queue.
- Treat approved specifications as authoritative for behavior and scope, documented architecture as authoritative for durable technical decisions, and the codebase as evidence of current implementation and conventions.

## 2. Define the active implementation target

- Identify the active specification path with the selected local `FR-*` requirements and `AC-*` acceptance criteria when identifiers exist. The requirement identity is the path plus its local identifier.
- When the engineer supplies only identifiers, resolve them against the root and linked catalog. Continue only if they identify one document uniquely; ask for the specification path when the same identifier occurs in multiple documents.
- Otherwise, derive a bounded target from an explicitly approved feature request and state the covered behavior in observable terms.
- Treat the rest of the root specification, unselected requirements, and other feature specifications as context. Do not implement them unless the engineer explicitly selects them.
- Do not treat every missing or planned requirement as authorized work.
- If the requested behavior is absent from, ambiguous in, or inconsistent with the approved specification, stop and return the decision to `$spec`. Do not resolve a product decision in code.
- Ask and wait only when uncertainty would materially change behavior, scope, public contracts, data lifetime, failure policy, or the selected acceptance criteria. Discover repository facts instead of asking for them.

## 3. Inspect the affected implementation

- Inspect the working tree before editing. Preserve unrelated changes and do not overwrite or reformat user work outside the target.
- Trace the relevant flow end to end across entry points, UI or transport, state, domain logic, integrations, and persistence as applicable.
- Locate similar features and reuse established project patterns, public boundaries, naming, error handling, and test organization.
- Identify the boundaries and contracts the feature must touch and those it must leave unchanged.
- Discover the project's actual package manager, scripts, build configuration, and test commands. Do not assume conventional commands without inspecting the project.
- Choose the smallest coherent vertical increment. Optimize for complete observable behavior, not the fewest changed files.

## 4. Resolve decision gates before editing

- Stop when the feature requires an unresolved product decision and route it to `$spec`.
- Stop when the feature conflicts with a documented architectural decision. Report exactly:

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

- Wait for the engineer to accept, reject, or revise the architectural change. Do not edit application code or `docs/ARCHITECTURE.md` to bypass the conflict.
- When the feature needs a new durable boundary, state owner, integration, persistence model, technical baseline, or difficult-to-reverse choice that the existing architecture does not decide, route that delta to `$arch-design`. Do not require an architecture rewrite when existing rules already support the feature.
- Surface a required dependency replacement, data migration, public-contract break, or other difficult-to-reverse technical-baseline change before making it. Explain why the current project cannot satisfy the target without it and wait for the engineer's decision.

## 5. Explain the implementation approach

Before editing, give a concise approach containing:

- the active specification path, requirements, and acceptance criteria;
- the affected boundaries and existing patterns to reuse;
- the intended vertical flow;
- the focused tests and broader validation to run.

Continue directly after this explanation unless a decision gate requires the engineer. Do not create a routine approval gate for an implementation already authorized by the request.

## 6. Implement the vertical increment

- Implement all layers required for the selected behavior to work end to end while keeping the application runnable.
- Preserve behavior, public contracts, and accepted decisions outside the active target.
- Reuse existing abstractions before adding one. Add a new abstraction only when the current feature creates a concrete responsibility or boundary that existing code cannot represent clearly.
- Keep domain rules deterministic and outside delivery or framework code when the documented architecture requires that separation.
- Add or update proportional tests for selected behavior, deterministic rules, relevant failure paths, and changed integration seams according to project conventions.
- Do not introduce a test framework solely for this increment unless the approved target or architecture requires it and the engineer accepts the baseline change.
- Avoid speculative infrastructure, broad cleanup, unrelated dependency upgrades, and refactors that do not enable the target.
- Do not edit `docs/SPEC.md` or `docs/ARCHITECTURE.md` as an implementation shortcut. Report a discovered documentation conflict through the appropriate decision gate.

## 7. Validate the result

- Run the narrowest relevant tests first for fast feedback.
- Run the applicable project commands for type checking, linting, tests, and build when available and proportionate to the change.
- Perform a focused runtime or manual check when automated checks cannot demonstrate an observable acceptance criterion and the environment permits it.
- Fix failures caused by the implementation and within the active target. Report unrelated failures instead of broadening the change.
- Distinguish a pre-existing failure from a new regression only when repository state or a controlled comparison provides evidence.
- Map each selected acceptance criterion as `specification path + AC-*`, or each observable target behavior, to implementation and validation evidence. State any criterion that could not be verified.

## 8. Hand off the increment

Report concisely:

- what changed and which active requirements it covers;
- which tests and validation commands ran and their results;
- any manual verification performed;
- remaining gaps, unverified criteria, or follow-up decisions.

Do not turn the handoff into a general requirements, architecture, security, performance, or code review. Leave those independent gates to their dedicated skills.
