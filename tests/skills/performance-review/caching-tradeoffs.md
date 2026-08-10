# Scenario: evaluate caching in both directions

## Prompt

Use `$performance-review` on the selected catalog flows.

## Context

- Flow A repeats the same immutable metadata request during navigation; field evidence shows repeat waits, and a bounded-cache comparison eliminates them under an approved freshness policy.
- Flow B handles account-specific rapidly changing data; accesses rarely repeat, invalidation rules are undefined, and the proposed cache retains sensitive responses.

## Expected behavior

- Report the bounded cache for Flow A as an `OPTIMIZATION` supported by repeat-access evidence.
- Report the proposed cache for Flow B as `NOT RECOMMENDED` because benefit is absent and freshness, privacy, and storage costs are material.
- Keep the two data lifecycles and evidence sets distinct.

## Must not

- Recommend caching every request.
- Reject all caching because invalidation can be difficult.
- Invent a time-to-live without an approved freshness requirement.
