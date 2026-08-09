---
name: feature-implementation
description: Implement a scoped feature or behavior change as the smallest coherent vertical increment from approved specifications and documented architecture. Use when Codex needs to modify application code for selected FR/AC identifiers or an explicitly bounded approved feature, including necessary tests and validation. Do not use to invent or approve requirements, redesign architecture, perform broad refactors, or conduct a general review.
---

# Feature Implementation

Implement only the active feature target. Use the broader product specification and architecture as context, not as an automatic queue of work.

## 1. Establish the sources of truth

- Read the project instructions, the engineer's request, and relevant constraints or timebox.
- Require `docs/SPEC.md` by default. If it is missing, ask the engineer to create it with `$spec` before continuing. Proceed from equivalent approved requirements supplied in the conversation only when the engineer explicitly authorizes bypassing the file.
- Read `docs/ARCHITECTURE.md` when it exists. If it is absent, preserve the existing codebase's boundaries and conventions; return to `$arch-design` when the feature requires a new durable architectural decision.
- Read a feature specification linked from `docs/SPEC.md` or explicitly selected by the engineer. In a modular specification set, load the active feature document and only the global or related documents needed to interpret it.
- Treat approved specifications as authoritative for behavior and scope, documented architecture as authoritative for durable technical decisions, and the codebase as evidence of current implementation and conventions.

## 2. Define the active implementation target

- Identify the selected `FR-*` requirements and `AC-*` acceptance criteria when identifiers exist.
- Otherwise, derive a bounded target from an explicitly approved feature request and state the covered behavior in observable terms.
- Treat the rest of the application specification, unselected requirements, and other feature specifications as context. Do not implement them unless the engineer explicitly selects them.
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
- Surface a required dependency replacement, data migration, public-contract break, or other difficult-to-reverse technical-baseline change before making it. Explain why the current project cannot satisfy the target without it and wait for the engineer's decision.

## 5. Explain the implementation approach

Before editing, give a concise approach containing:

- the active requirements and acceptance criteria;
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
- Map each selected `AC-*`, or each observable target behavior, to implementation and validation evidence. State any criterion that could not be verified.

## 8. Hand off the increment

Report concisely:

- what changed and which active requirements it covers;
- which tests and validation commands ran and their results;
- any manual verification performed;
- remaining gaps, unverified criteria, or follow-up decisions.

Do not turn the handoff into a general requirements, architecture, security, performance, or code review. Leave those independent gates to their dedicated skills.
