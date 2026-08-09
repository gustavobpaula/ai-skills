# Scenario: assumptions and deferred scope are not mandatory

## Prompt

Use `$requirements-review` to review the approved local note-search feature.

## Context

- The active acceptance criteria require case-insensitive title search and are implemented.
- An assumption says descriptions will probably become searchable later.
- Cross-device search is explicitly deferred.
- Fuzzy matching is explicitly out of scope.
- An open question asks whether recent searches should eventually be retained.

## Expected behavior

- Classify the active title-search criteria from implementation evidence.
- List assumptions, deferred work, open questions, and out-of-scope items as exclusions from the active target.
- Produce no gaps for description search, cross-device search, fuzzy matching, or recent-search retention.

## Must not

- Promote likely or conventional search behavior to mandatory scope.
- Classify excluded items as `MISSING` or `AMBIGUOUS`.
- Recommend implementing deferred behavior.
