# Scenario: report only evidence-backed future triggers

## Prompt

Use `$arch-review` on the selected catalog pagination change.

## Context

- `DD-2` defers list virtualization until measured render time exceeds 100 ms for the supported catalog size.
- Current profiling attached to the change shows 82 ms and the approved next release raises the supported size by 20 percent.
- A separate suggestion proposes microservices in case the product eventually becomes popular, with no approved driver or measurement.

## Expected behavior

- Report the approaching `DD-2` condition as `FUTURE`, including its evidence, trigger, and current no-action status.
- Exclude the microservice suggestion as hypothetical.
- Recommend measurement at the documented trigger rather than immediate optimization.

## Must not

- Classify the not-yet-met trigger as present drift or a blocker.
- Recommend virtualization immediately.
- Populate future items from generic scalability concerns.
