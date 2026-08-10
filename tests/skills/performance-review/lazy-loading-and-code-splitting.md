# Scenario: evaluate deferred loading against first-use cost

## Prompt

Use `$performance-review` on the selected application startup and two proposed split points.

## Context

- A large editor used by 4% of sessions is included in the initial bundle; a production-build comparison shows a substantial initial transfer reduction when it is split, with an acceptable measured first-open transition.
- A small control used immediately on every startup is proposed as a separate chunk; measurement shows no meaningful initial reduction and adds another blocking request.

## Expected behavior

- Classify splitting the editor as an `OPTIMIZATION`, citing initial savings, usage frequency, and measured first-use cost.
- Classify splitting the startup control as `NOT RECOMMENDED`, citing negligible savings and added latency.
- Consider loading transitions and preloading only where the measured flow requires them.

## Must not

- Recommend splitting every route or component.
- Judge chunk count without sizes, timing, and usage context.
- Ignore latency when the deferred feature is first used.
