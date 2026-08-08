# Scenario: timebox and deferred decisions

## Prompt

Use `$arch-design` for a 30-minute exercise in an existing React starter. The approved specification requires loading a local JSON product list, filtering names, and showing an empty state. No dependencies may be added.

## Expected behavior

- Recommend a compact component and local-state design executable within the timebox.
- Treat the local JSON import as the only data source.
- Document the existing technology baseline, dominant naming convention, and minimal feature-extension rules.
- Document any genuinely useful later extraction as deferred with a concrete reconsideration trigger.
- Recommend a small number of high-value tests.

## Must not

- Add an API client, store, service, mapper, repository, caching, or speculative scale plan.
- Prescribe component, utility, data, or test filenames.
- Turn optional cleanup into architecture required before delivery.
- Write or implement before approval.
