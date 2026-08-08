# Architecture Selection Profiles

Use these profiles to compare the smallest viable shapes for a project. Select boundaries from current drivers; do not reproduce every directory in a profile.

## Compact routed data flow

Typical direction:

```text
routes/pages -> feature components -> one data boundary -> external source
```

Use when:

- the application has a few screens and straightforward data operations;
- business behavior is mostly presentation, filtering, navigation, or CRUD;
- data is owned by one route or feature;
- the external contract needs little or no adaptation.

Start with route or feature-local state. Introduce a shared store only when state must survive navigation, coordinate distant consumers, or provide a shared workflow. Keep direct HTTP access behind one small data boundary when request behavior is reused or needs isolated tests.

Avoid separate entities, models, mappers, repositories, and domain layers when they would only rename fields or forward calls. Extract them later when a concrete transformation, reuse point, or rule appears.

## Layered integration flow

Typical direction:

```text
UI/routes -> state/controller -> services -> HTTP/API
                              -> application models
API entities -> mappers ------^
```

Use when:

- multiple screens or features consume the same external resources;
- the external contract is large, unstable, awkward, or meaningfully different from UI needs;
- requests require pagination, composition, normalization, caching, or consistent error handling;
- local persisted state and remote state have different ownership or lifetimes.

Add entities to describe external contracts and application models to describe consumed data. Add mappers only when they protect the application from real contract differences, normalize values, or combine responses. Let services own external communication and request composition. Let state or controllers coordinate UI-visible lifecycle state.

Do not add a mapper for identity transformations, a repository over a single unchanging service, or a global store for data owned by one route. Keep SSR, CSR, hydration, and persistence boundaries explicit when the runtime requires them.

## Domain-centered flow

Typical direction:

```text
UI -> state/controller -> application orchestration -> external adapters
                    \-> pure domain rules
```

Use when:

- correctness depends on business rules, invariants, decisions, or state transitions;
- the workflow composes multiple asynchronous operations;
- rules should be tested without React, HTTP, a database, or global state;
- external data must be adapted before rules can consume it.

Keep domain functions deterministic where practical. Put sequencing and I/O coordination in an application service or similarly named orchestrator. Keep adapters responsible for external contracts. Let UI state invoke the workflow and expose loading, success, and failure states.

Do not create a domain layer for display formatting, trivial filtering, or one-to-one CRUD. Do not create one use-case file per action unless orchestration or dependency direction benefits. Pure rules can begin as feature-local functions and move behind a domain boundary when their importance or reuse justifies it.

## Choosing and evolving

- Begin with the compact profile unless current drivers justify another boundary.
- Add integration layers independently from domain layers; a project may need either one, both, or neither.
- Prefer the existing adequate shape when extending a project.
- Record why each added boundary exists now and the trigger for any deferred extraction.
- Recommend against a pattern when its maintenance cost exceeds the current problem it solves.
