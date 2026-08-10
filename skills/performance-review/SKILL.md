---
name: performance-review
description: Review current changes or an explicitly selected web frontend surface for evidence-backed performance risks and justified optimizations. Use when Codex needs a read-only specialist review of rendering work, large lists, network requests and waterfalls, bundle or import cost, assets and images, caching, memoization, lazy loading, or code splitting. Do not use to implement fixes, review backend or infrastructure performance, run production load tests, or perform general code, architecture, security, or accessibility review.
---

# Performance Review

Review the selected web frontend surface for meaningful performance risks. Measure when practical, distinguish hypotheses from demonstrated impact, and recommend complexity only when the expected gain is real.

## 1. Resolve the review target

- Read the engineer's request, project instructions, relevant constraints, performance requirements, and timebox.
- Prefer an explicitly supplied file set, diff, commit range, feature, page, component, user flow, or repository-wide frontend target.
- Without an explicit target, inspect staged, unstaged, and untracked changes. Include untracked contents and trace unchanged callers, styles, routes, dependencies, and configuration only as far as needed to understand the selected experience.
- When the working tree is clean and no target is explicit, ask the engineer to choose a review surface and wait. Do not silently audit the whole frontend.
- State the resolved target before reviewing. Exclude unrelated legacy issues unless they prevent verification of the selected surface.
- Stop when the target is not a web frontend. Do not reinterpret backend, database, native mobile, or infrastructure work as a frontend performance review.

## 2. Establish the performance context

- Read approved user flows, performance budgets, service-level targets, supported devices, browsers, network conditions, traffic or data shapes, and field measurements when supplied.
- Prefer representative field evidence and approved budgets over laboratory scores. Use controlled local measurements to isolate mechanisms and compare alternatives, not to invent product targets.
- When no approved threshold exists, describe the observed cost or relative change without declaring an arbitrary pass or failure boundary.
- Separate cold and warm loads, cached and uncached behavior, development and production builds, and laboratory and field data whenever those distinctions affect the conclusion.
- Treat code, tests, profiler traces, browser timings, build output, and existing telemetry as evidence, never as requirements.

## 3. Inspect likely cost centers

- Trace the selected user flow through rendering, state updates, effects, request initiation, resource loading, and interaction completion.
- Inspect unnecessary or cascading renders, repeated state derivation, expensive render-time computation, unstable identities, layout or paint pressure, and work performed outside the visible path.
- Inspect large collections for realistic item counts, per-item cost, update frequency, pagination or virtualization behavior, and interaction responsiveness.
- Inspect duplicate requests, serial requests that could safely overlap, retry loops, overfetching, request timing, and client behavior that creates a waterfall. Do not infer server or database causes without evidence.
- Inspect bundle and import behavior, route or feature boundaries, third-party code, initial versus deferred resources, asset dimensions and formats, image loading, fonts, and work shipped but not needed for the selected flow.
- Consider frequency and user impact together. A costly operation outside a realistic path is not automatically a meaningful bottleneck.

## 4. Evaluate optimization mechanisms

- Evaluate memoization, caching, lazy loading, and code splitting when the selected evidence makes them relevant; do not recommend or reject them by default.
- Recommend adding or adjusting an optimization only when measurement or direct evidence supports a meaningful gain for the selected flow.
- For memoization, compare avoided computation or rendering with dependency tracking, retained memory, comparison work, invalidation frequency, and cognitive cost.
- For caching, compare repeat access and avoided latency or computation with freshness, invalidation, storage, memory, privacy, and consistency costs.
- For lazy loading and code splitting, compare initial bytes and work avoided with added requests, loading transitions, chunk fragmentation, preloading needs, and latency when the deferred feature is first used.
- Evaluate existing optimizations as well as proposed ones. Recommend removal or simplification when an optimization adds cost or complexity without a supported benefit.
- When the gain cannot be established, prescribe the smallest discriminating measurement instead of an implementation change. Tie the decision to an approved budget or a before-and-after comparison rather than inventing a threshold.

## 5. Gather evidence safely

- Always perform static inspection of the selected source, tests, manifests, build configuration, and directly relevant generated reports already present.
- Discover existing performance-specific scripts, benchmarks, profiler artifacts, bundle reports, browser tests, and documented production-build commands. Run only the narrowest safe, non-interactive command that can answer the performance question.
- When the application is already runnable in a safe local or test environment, exercise the selected flow with available browser or profiling capabilities. Record the build mode, device or viewport, network or CPU conditions, cache state, data shape, sample count, and metric actually observed.
- Repeat noisy measurements enough to detect instability and report ranges or representative values. Do not treat one synthetic run, one score, or an uncontrolled comparison as proof of a regression or gain.
- Do not install tools, alter configuration, update snapshots, instrument production, run load against production, request credentials, or use corrective modes for the review.
- Keep generated diagnostic output outside tracked source when the tool permits it. Compare repository status before and after commands; if tracked files change unexpectedly, stop, preserve the evidence, and do not revert user files automatically.
- Treat unavailable runtime, missing production builds, absent field data, unsupported devices, and uncontrolled environments as verification limits. Never present an unexecuted measurement as passing.

## 6. Classify observations

Assign exactly one category to each actionable observation:

- `MEASURE FIRST`: A plausible performance concern lacks enough evidence to justify a change. State the mechanism, affected flow, smallest useful measurement, and decision comparison.
- `LIKELY BOTTLENECK`: Static or runtime evidence identifies costly work on a realistic path, but its user-visible magnitude is not yet quantified. State the evidence, expected impact, confidence, and confirmation step.
- `OPTIMIZATION`: Measured or direct evidence demonstrates a meaningful gain from adding, adjusting, or removing a bounded optimization. State the evidence, expected gain, costs, and correction direction.
- `NOT RECOMMENDED`: A requested, proposed, or existing optimization has no demonstrated meaningful gain or costs more than it saves. State the unsupported assumption, introduced cost, and why the simpler behavior should remain or be restored.

- Do not fill categories for completeness or convert generic best practices into findings.
- Use `OPTIMIZATION` only when the evidence supports action now. Use `LIKELY BOTTLENECK` when the mechanism is credible but magnitude remains uncertain, and `MEASURE FIRST` when even the premise needs validation.
- Use `NOT RECOMMENDED` only for a concrete proposal or existing technique in the selected target. Do not invent optimizations merely to reject them.
- Order observations by user impact, strength of evidence, and frequency in the selected flow. Distinguish evidence from inference and state confidence explicitly.

## 7. Report the review

Use this structure:

```markdown
# Performance Review

## Review Target

## Performance Context and Methods

## Findings

## Verification Limits
```

- Identify the selected surface and any diff base under `Review Target`.
- State approved budgets or their absence and list the builds, commands, environments, profiles, cache states, data shapes, and measurements actually used under `Performance Context and Methods`.
- Format each finding heading as `[CATEGORY] Concise title`. Include the most specific location, concrete evidence, affected flow, likely user impact, confidence, and bounded measurement or correction direction.
- State `No findings.` when no actionable observation remains. Do not add speculative tuning advice to avoid an empty report.
- State `None.` under `Verification Limits` only when no material uncertainty remains within the selected target and methods.
- Match the language of the engineer's request unless the project establishes another reporting language.

## 8. Preserve workflow boundaries

- Keep the review strictly read-only, including when the request says to review and fix. Do not edit source, tests, specifications, architecture, configuration, dependencies, telemetry, or generated files.
- Report before correction. Route an explicitly authorized product correction to `$feature-implementation` and dedicated performance regression tests or benchmarks to `$test-strategy`.
- Leave general defects and delivery gates to `$code-review`, requirement coverage to `$requirements-review`, architecture conformance to `$arch-review`, and accessibility or security analysis to their specialist skills.
- Report a frontend performance consequence discovered in the selected surface without expanding into backend, database, native mobile, infrastructure, or repository-wide performance analysis.
- Do not promise a score, certify performance, prescribe broad rewrites, or recommend memoization, caching, lazy loading, code splitting, virtualization, or preloading without evidence that the selected flow benefits.
