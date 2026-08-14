---
name: requirements-review
description: Review an implementation against the correct approved specification and active delivery target, producing an evidence-based, traceable coverage report. Use when Codex needs to validate selected FR/AC identifiers, a feature specification, or a complete delivery scope across a modular specification set before delivery. Classify implemented, partial, missing, incorrect, unrequested, and ambiguous behavior. Do not use for general code quality, architecture, security, performance review, or automatic fixes.
---

# Requirements Review

Compare the current implementation with the approved active delivery target. Read the broader specification catalog for context without treating every planned feature as delivered scope.

## 1. Establish the approved specification catalog

- Read project instructions, the engineer's request, relevant constraints, and `docs/SPEC.md` when it exists.
- Prefer a specification path explicitly selected by the engineer. Treat it as an approved review target even when it is not linked from `docs/SPEC.md`; if the path does not exist, report the missing target and return to `$spec` without silently falling back.
- When no path is selected, require `docs/SPEC.md` by default. If it is missing, ask the engineer to create it with `$spec` before continuing. Proceed from equivalent approved requirements supplied in the conversation only when the engineer explicitly authorizes bypassing files.
- Treat `docs/SPEC.md` as the canonical global specification or index. Load every feature specification it explicitly links as part of the approved catalog.
- Add an explicitly selected unlinked specification to the approved catalog for this review only. Do not infer approval from any other unlinked file merely because it exists under `docs/`.
- Follow explicit cross-references needed to interpret a requirement, but do not scan unrelated documentation as product scope.
- Treat approved specifications as the only source of required behavior. Treat code, tests, configuration, runtime output, and architecture documents as implementation evidence or technical context, never as sources of new requirements.

## 2. Resolve the active review target

- Prefer an explicitly supplied specification path, then a path with selected `FR-*` and `AC-*` identifiers, then the single linked specification that matches the request, then requirements written directly in `docs/SPEC.md`.
- Treat every requirement identity as its specification path plus local identifier. Allow different documents to reuse `FR-1` or `AC-1`; never merge their coverage units.
- When the engineer supplies bare identifiers, resolve them across the root and linked catalog. Ask for a path when the identifiers occur in more than one document.
- Otherwise, infer the target from the engineer's request, the root specification's links, and the behavior affected by the current changes or requested delivery.
- When exactly one catalog entry matches, state the inferred target and continue. When multiple entries remain plausible, present the candidates and ask the engineer to select the target before classifying coverage.
- When no approved catalog entry covers the requested behavior, return the gap to `$spec`; do not create a requirement from the implementation.
- Allow the active target to span more than one specification or identifier set when the engineer selects them together, and keep each local identifier qualified by its source path.
- Use each active `AC-*` as the primary review unit. Review an `FR-*` directly only when it has no acceptance criteria. Review mandatory constraints separately when they apply to the target.
- Include global requirements or constraints only when they explicitly reference the active feature or state that they apply universally.
- Exclude assumptions, deferred work, open questions, and out-of-scope items from mandatory coverage.
- Keep unselected and future feature specifications in the catalog for scope interpretation. Do not classify their unimplemented requirements as `MISSING`.
- State the resolved target, each source path with its local identifiers, applicable global rules, and exclusions before reporting findings.

## 3. Collect requirement evidence

- Inspect the working tree and determine whether the review covers the current repository, a requested diff, or another explicitly supplied implementation surface.
- Trace each active review unit end to end through relevant entry points, UI or transport, state, domain logic, integrations, persistence, and public contracts as applicable.
- Inspect focused tests and configuration that provide evidence for the required behavior. A test proves only what it executes and does not make its expectations authoritative over the specification.
- Discover and run targeted existing checks when they materially improve confidence in an observable criterion. Leave general typecheck, lint, build, and code-quality validation to `$code-review` unless a command directly supplies requirement evidence.
- Perform a focused runtime or manual check when static inspection cannot demonstrate an observable criterion and the environment permits it.
- Cite concrete evidence using file locations, executed commands and results, or observed runtime behavior. Do not claim a check ran when it did not.
- Record unavailable tools, inaccessible integrations, failed setup, and other evidence limits under `Verification Limits`. Do not convert an environment limitation into specification ambiguity.

## 4. Classify coverage

Assign one status to every active review unit:

- `IMPLEMENTED`: sufficient evidence covers the complete required behavior.
- `PARTIAL`: evidence covers part of the required behavior, but one or more explicit clauses remain absent. State the implemented and missing portions.
- `MISSING`: no implementation evidence covers the required behavior.
- `INCORRECT`: implementation evidence contradicts an explicit requirement. Prefer this over `PARTIAL` when present behavior is observably wrong.
- `AMBIGUOUS`: the approved specification is internally inconsistent or lacks a product decision required to determine compliance. State the ambiguity and return it to `$spec`.

Apply `UNREQUESTED` only to concrete product behavior, public contracts, or scope-changing surfaces that are absent from the entire approved specification catalog. Do not use it for internal structure, naming, refactoring, tests, or implementation details.

Do not classify a minimal defensive fallback as `UNREQUESTED` when it only rejects malformed, unsupported, or out-of-scope input safely and does not add a product capability, broaden an approved contract, or contradict specified failure behavior. Record it only when the fallback itself creates observable scope or conflicts with an approved requirement.

When behavior is outside the active target but covered by another approved specification, do not classify it as `UNREQUESTED`. Report it under `Outside Active Target` with the owning specification and `FR-*` or `AC-*` identifiers. Do not assess that other specification's remaining coverage unless it is added to the active target.

## 5. Report the review

Use this structure:

```markdown
# Requirements Review

## Active Target
## Coverage Summary
## Coverage Matrix
## Unrequested Behavior
## Outside Active Target
## Verification Limits
```

- In `Active Target`, identify each reviewed specification, identifier, applicable global rule, and explicit exclusion.
- In `Coverage Summary`, count active units by status and lead with delivery-affecting gaps.
- In `Coverage Matrix`, use the columns `Status | Spec | Requirement | Evidence | Gap`. Include every active unit, including implemented ones.
- Order gaps as `MISSING`, `INCORRECT`, `PARTIAL`, then `AMBIGUOUS`; keep implemented evidence concise.
- In `Unrequested Behavior`, cite concrete implementation evidence and explain why no catalog item authorizes the behavior. State `None` when no such behavior is found.
- In `Outside Active Target`, map observed behavior to the owning approved specification and identifiers. State `None` when no such behavior is found.
- In `Verification Limits`, distinguish static evidence from executed verification and state any criterion that could not be conclusively checked.
- Match the language of the active specification unless the project establishes another reporting language.

## 6. Preserve review boundaries

- Keep the review read-only. Do not edit implementation, specifications, architecture, tests, configuration, or dependencies.
- Do not recommend unrelated refactors or expand findings into architecture, style, maintainability, security, accessibility, or performance review.
- Do not infer mandatory behavior from conventions, likely user expectations, test names, architecture choices, or common best practices.
- Route specification ambiguity to `$spec`. Route missing, partial, or incorrect implementation to `$feature-implementation` only after the engineer explicitly requests a fix.
- Report evidence and impact without designing the correction. Keep the engineer in control of scope and follow-up decisions.
