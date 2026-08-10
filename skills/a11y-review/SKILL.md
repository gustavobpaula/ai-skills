---
name: a11y-review
description: Review current changes or an explicitly selected web frontend surface for evidence-based accessibility barriers against approved project requirements or WCAG 2.2 Level AA by default. Use when Codex needs a read-only specialist review of semantic HTML, accessible names, keyboard interaction, focus, forms, errors and status messages, media, visual presentation, or ARIA. Do not use to certify conformance, implement fixes, review native mobile or documents, or perform general code, security, or performance review.
---

# Accessibility Review

Review the selected web frontend surface for barriers that affect disabled users. Combine source inspection, existing automation, and safe runtime interaction without claiming that any one method proves accessibility.

## 1. Resolve the review target

- Read the engineer's request, project instructions, relevant constraints, and accessibility requirements.
- Prefer an explicitly supplied file set, diff, commit range, feature, page, component, or user flow.
- Without an explicit target, inspect staged, unstaged, and untracked changes. Include untracked contents and trace unchanged callers, styles, components, and routes only as far as needed to understand the selected experience.
- When the working tree is clean and no target is explicit, ask the engineer to choose a review surface and wait. Do not silently audit the whole frontend.
- State the resolved target before reviewing. Exclude unrelated legacy issues unless they prevent verification of the selected surface.
- Stop when the target is not a web frontend. Do not reinterpret native mobile applications or documents as WCAG web-content reviews.

## 2. Establish the baseline

- Use explicitly approved project accessibility requirements, standards, browser support, and user-flow expectations when supplied.
- Otherwise use WCAG 2.2 Level AA as the review baseline. Treat WAI-ARIA Authoring Practices as informative implementation guidance, not as a normative substitute for WCAG.
- Read only the approved specifications and architecture needed to understand the selected experience. Treat code, tests, lint rules, and current runtime behavior as evidence, never as requirements.
- Map a finding to a WCAG success criterion and level only when the relationship is direct and well supported. Do not force a criterion onto a general usability preference.
- Do not issue a conformance claim. A partial diff, component review, automated scan, or limited runtime exercise cannot establish conformance for a full page or complete process.

## 3. Inspect the implementation

- Inspect document language and structure, landmarks, headings, reading and DOM order, native control semantics, links, buttons, tables, lists, images, media alternatives, and decorative content where relevant.
- Inspect accessible names and descriptions, visible labels and instructions, grouping, required and invalid states, error association, and programmatic status communication.
- For label-in-name analysis, compare normalized visible text with the computed accessible name case-insensitively. Allow additional contextual words when the complete visible label remains a contiguous part of the accessible name.
- Trace keyboard reachability, expected keys, activation behavior, focus order and visibility, focus movement after updates, modal focus containment, escape behavior, and focus restoration.
- Inspect responsive reflow, zoom, text resizing, orientation, target size, color reliance, rendered contrast, reduced motion, animation, and time limits only where the selected surface and available evidence make them applicable.
- Prefer native HTML elements and behavior whenever they meet the need. For a justified custom widget, verify role, accessible name, state or value synchronization, focus management, and the complete expected keyboard interaction together.
- Treat ARIA as an accessibility-tree contract, not decoration. Report redundant, invalid, conflicting, stale, or behavior-free ARIA only when it creates a concrete barrier or misleading semantic.
- Consider the affected disability or interaction modality and the complete user task. Do not infer severity from code complexity or remediation effort.

## 4. Gather layered evidence

- Always perform static inspection of the selected source, styles, tests, and directly relevant configuration.
- Discover existing accessibility-specific lint, component, integration, or end-to-end checks from project configuration and documentation. Run the narrowest safe, non-interactive commands that exercise them.
- When accessibility rules are embedded in a broader existing lint or test command, run the narrowest documented invocation that can supply relevant evidence without changing files.
- Do not install dependencies, add an accessibility tool, alter configuration, update snapshots, start external services, request credentials, or use fix modes for the review.
- When the application is already runnable in a safe local or test environment, exercise the selected flow in an available browser. Check keyboard-only operation, focus order and visibility, focus containment and restoration, zoom or reflow, and relevant dynamic states.
- Do not use production for interactive verification. Do not claim screen-reader or assistive-technology coverage unless that technology was actually exercised.
- Treat automated passes as supporting evidence only. Record false positives, unavailable runtime, unmeasured contrast, untested viewports, absent assistive technology, and other residual uncertainty under `Verification Limits`.
- Promote an observation to a finding only when evidence demonstrates a barrier. Put an exact manual check under `Verification Limits` when the outcome cannot be established.

## 5. Classify findings

Assign exactly one severity to each actionable finding:

- `BLOCKER`: Prevents a disabled user from completing a critical flow, traps input or focus, or blocks access to essential content with no viable path around it.
- `MAJOR`: Makes important functionality or information unavailable or substantially harder for an affected user and has no reasonable equivalent in the selected experience.
- `MODERATE`: Creates a localized barrier or meaningful loss of understanding or efficiency, but an equivalent path or practical workaround remains.
- `MINOR`: Causes a limited, concrete accessibility degradation without blocking the task or essential understanding.

- Report only actionable, evidence-backed barriers. Do not fill severities for completeness or report cosmetic preferences, theoretical incompatibilities, or generic checklist items.
- Exclude a functional defect that affects all input modalities equally unless accessibility semantics or interaction create a distinct additional barrier. Route the general defect to `$code-review`; when it prevents an accessibility check, record that check under `Verification Limits` instead of creating an accessibility finding.
- Order findings by severity, then by affected task impact and confidence.
- Distinguish evidence from inference and lower certainty explicitly when runtime or assistive-technology behavior was not verified.

## 6. Report the review

Use this structure:

```markdown
# Accessibility Review

## Review Target

## Baseline and Methods

## Findings

## Verification Limits
```

- Identify the selected surface and any diff base under `Review Target`.
- State the governing project requirement or WCAG 2.2 Level AA default and list the inspection, automated commands, browsers, viewports, input methods, and assistive technologies actually used under `Baseline and Methods`.
- Format each finding heading as `[SEVERITY] Concise title`. Include the most specific location, concrete evidence, affected users or modality, task impact, bounded correction direction, and a WCAG criterion and level when confidently applicable.
- State `No findings.` when no evidence-backed barrier remains. Do not invent advice to avoid an empty report.
- State `None.` under `Verification Limits` only when no material uncertainty remains within the selected target and methods. Never present an unexecuted check as passing.
- Match the language of the engineer's request unless the project establishes another reporting language.

## 7. Preserve workflow boundaries

- Keep the review strictly read-only, including when the request says to review and fix. Do not edit source, styles, tests, specifications, architecture, configuration, dependencies, or generated files.
- Report before correction. Route an explicitly authorized product correction to `$feature-implementation` and dedicated accessibility test prioritization or expansion to `$test-strategy`.
- Leave general defects and delivery gates to `$code-review`, requirement coverage to `$requirements-review`, architecture conformance to `$arch-review`, and security or performance analysis to their specialist skills.
- Do not certify legal compliance, prescribe a broad redesign, add ARIA everywhere, or expand a selected review into a repository-wide accessibility audit.
