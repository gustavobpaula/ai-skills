---
name: debug
description: Diagnose and, when authorized, minimally fix bounded software failures through reproducible evidence, ranked hypotheses, discriminating experiments, root-cause confirmation, focused regression tests, and proportionate validation. Use when Codex needs to investigate an explicit application runtime, test, build, configuration, or integration failure in a local, test, or safely observable production environment. Do not use to invent expected behavior, implement new features, perform broad refactors or general reviews, mutate production without explicit approval, or make speculative changes without evidence.
---

# Debug

Diagnose a selected failure from evidence before changing code. Correct the confirmed cause rather than suppressing its symptom.

## 1. Resolve intent, symptom, and target

- Read the engineer's request, project instructions, relevant constraints, and timebox.
- Treat an imperative request to debug or fix a selected failure as authorization to apply the smallest confirmed correction. Treat a request to analyze, diagnose, investigate, or explain as read-only.
- Require an explicit symptom or failing behavior. Establish the expected result, observed result, affected operation, and known environment or input. A dirty working tree alone is not a debugging target.
- Accept an explicitly described regression or contract as the expected behavior when it is sufficiently clear, even when `docs/SPEC.md` is absent.
- Read approved requirements when they define the selected behavior. Ask and wait when competing interpretations would materially change the expected result; route unresolved product behavior to `$spec` instead of choosing it during debugging.
- State the resolved mode, target, expected behavior, and observed symptom before investigating. Preserve unrelated user work throughout the task.

## 2. Establish the baseline and reproduction

- Inspect staged, unstaged, and untracked changes before running experiments or editing. Trace relevant callers, configuration, tests, integrations, and recent history only as far as needed to understand the selected failure.
- Discover the project's actual runtime, package manager, commands, test framework, and local conventions from manifests, configuration, CI, and documentation. Do not assume conventional commands.
- Reproduce the symptom with the narrowest safe command or interaction available. Record the exact command, input, environment, outcome, and whether the failure is deterministic.
- When direct reproduction is unavailable, characterize the failure from reliable logs, traces, test output, crash reports, or equivalent supplied evidence. Distinguish observed facts from reports that were not independently verified.
- Do not change tracked source, tests, expectations, configuration, dependencies, or runtime state merely to make the initial reproduction pass.
- Treat missing tools, dependencies, services, credentials, or incompatible environments as possible environmental causes or verification limits, not automatically as code defects.

## 3. Form and rank hypotheses

- Derive a small set of plausible, falsifiable hypotheses from the symptom, execution path, error output, state, inputs, configuration, dependencies, and relevant changes.
- Rank hypotheses by likelihood and by how cheaply a discriminating observation can confirm or reject them. Do not produce a generic checklist or an exhaustive list of remote possibilities.
- For each active hypothesis, identify the expected evidence if it is true, the evidence that would contradict it, and the smallest safe experiment that distinguishes it from the nearest alternative.
- Prefer inspecting values at ownership and integration boundaries over guessing from the final error location. A stack-frame location, failing assertion, or visible UI symptom is not automatically the root cause.
- Keep the external hypothesis summary concise and auditable. Do not expose hidden chain-of-thought or narrate every low-value attempt.

## 4. Gather discriminating evidence

- Run the highest-information, lowest-risk experiment first. Prefer focused tests, controlled inputs, existing diagnostics, targeted logs, static tracing, and read-only inspection over source edits.
- Change one relevant variable at a time when practical. Compare outcomes against the hypothesis prediction and update the ranking from evidence rather than attachment to the first explanation.
- Repeat intermittent or timing-sensitive experiments enough to distinguish a stable failure from noise. Record frequency, conditions, and sample limits; do not claim a flaky cause from one occurrence.
- Use task-relevant services and credentials already configured for local or test environments when needed. Avoid exposing secrets in commands, output, artifacts, or the final report.
- Limit production investigation to safe read-only observation such as existing logs, metrics, traces, and state queries. Require explicit approval before production writes, replays, load generation, migrations, or other mutation.
- Add temporary instrumentation only after a concrete hypothesis justifies it and only in an edit-authorized task. Keep it narrow, identify it as diagnostic, and remove only the instrumentation introduced by this task before handoff.
- Consider a cause confirmed only when it explains the complete symptom and discriminating evidence supports it over the closest alternatives. A focused reproduction that fails before the change and passes for the predicted reason after it can supply this evidence.

## 5. Resolve decision gates

- When the failure cannot be reproduced or the cause remains unconfirmed, do not edit autonomously. Report the evidence, remaining hypotheses, and next discriminating experiment, then end the turn with a direct question asking whether to continue investigating or authorize a hypothesis-based correction. Do not merely state that no correction was applied.
- When the confirmed correction would change approved product behavior, return the decision to `$spec`. Do not disguise a new requirement as a bug fix.
- When the correction conflicts with `docs/ARCHITECTURE.md` or requires a new durable boundary, route the decision to `$arch-design` before editing.
- Surface a dependency replacement, migration, public-contract break, destructive operation, or other difficult-to-reverse baseline change and wait for explicit approval.
- Route new features and broad behavior changes to `$feature-implementation`; route broad regression-test expansion to `$test-strategy`. Keep the selected failure and confirmed cause as the debugging boundary.

## 6. Apply the smallest confirmed correction

- In edit-authorized mode, explain the confirmed cause, correction boundary, affected files or components, and intended validation before editing. Continue without a redundant approval gate unless Section 5 applies.
- Change only the cause and directly necessary callers, tests, fixtures, or configuration. Preserve public contracts, accepted architecture, and behavior outside the selected failure.
- Prefer an established project pattern over introducing a new abstraction. Avoid unrelated cleanup, broad renames, formatting churn, dependency upgrades, and opportunistic fixes.
- Do not suppress evidence by weakening assertions, blindly rewriting snapshots, deleting or skipping tests, swallowing errors, adding arbitrary retries or delays, or special-casing only the observed example when the confirmed cause is broader.
- Add or adjust a focused regression test when an existing framework and stable public seam can reproduce the failure proportionately. Explain why no automated regression test was added when one would be fragile, nondeterministic, or disproportionately expensive.
- If evidence shows that a test expectation is wrong, change it only when an approved requirement or explicit contract establishes the correct behavior. Do not assume production behavior is correct merely because changing the test makes it pass.

## 7. Validate the correction

- Run the original reproduction first and confirm that it now behaves as predicted by the root-cause analysis.
- Run the focused regression test, then proportionate typecheck, lint, test, build, or runtime checks discovered from the project.
- Compare repository status before and after the work. Remove task-created diagnostic instrumentation and artifacts without reverting or overwriting user changes.
- Fix validation failures caused by the correction and within the selected scope. Report unrelated or pre-existing failures without broadening the task.
- Never claim an unexecuted check passed. Record exact commands and distinguish `PASS`, `FAIL`, `NOT AVAILABLE`, and `NOT RUN` outcomes where useful.

## 8. Report the investigation

Use this structure:

```markdown
# Debug Report

## Target and Symptom
## Reproduction
## Hypotheses and Evidence
## Root Cause
## Correction
## Validation
## Remaining Uncertainty
```

- Summarize only hypotheses that materially affected the investigation and the evidence that confirmed or rejected them.
- State `Not confirmed.` under `Root Cause` when the evidence threshold was not met. Do not present the leading hypothesis as fact.
- When the cause is not confirmed, summarize the available decision paths under `Remaining Uncertainty` and end with the direct decision question required by Section 5.
- In read-only mode, state `Not applied — read-only investigation.` under `Correction` and give only a bounded correction direction when supported.
- State `None.` under `Remaining Uncertainty` only when no material uncertainty remains within the selected target and performed validation.
- Match the language of the engineer's request unless the project establishes another reporting language.

## 9. Preserve workflow boundaries

- Do not turn debugging into a general code, requirements, architecture, security, performance, or accessibility review.
- Keep obvious specialist consequences tied to the selected cause without expanding the investigation; route broader analysis to the appropriate review skill.
- Do not deploy, publish, mutate production, edit specifications or architecture, create new product behavior, or perform broad refactoring under this skill.
