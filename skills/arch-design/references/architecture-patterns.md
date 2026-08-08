# Architecture Organization Profiles

Use these profiles to compare the smallest viable project organization. Select boundaries from current drivers and translate the selected profile into durable directory and dependency rules, not a file manifest.

## Compact feature flow

Typical direction:

```text
routes/pages -> feature boundary -> shared UI or data boundary -> external source
```

Possible directory patterns:

| Pattern | Responsibility |
|---|---|
| `features/<feature>/` | UI, local state, and straightforward behavior owned by one feature |
| `shared/ui/` | Reusable visual primitives without feature rules |
| `integrations/<provider>/` | External communication when more than one consumer or isolated testing justifies it |

Use when the application has a few screens, behavior is mostly presentation, filtering, navigation, or CRUD, and data is owned by one route or feature.

Start with route or feature-local state. Introduce shared state only when state must survive navigation, coordinate distant consumers, or provide a shared workflow. Avoid separate entities, models, mappers, repositories, and domain layers when they would only rename fields or forward calls.

## Layered integration flow

Typical direction:

```text
features -> application state/controller -> integrations -> external systems
                                      \-> application models
external contracts -> mapping --------^
```

Possible directory patterns:

| Pattern | Responsibility |
|---|---|
| `features/<feature>/` | Feature presentation and feature-owned state |
| `integrations/<provider>/` | External contracts, requests, and provider-specific mapping |
| `shared/data/` | Cross-feature data lifecycle behavior only when genuinely shared |

Use when multiple features consume the same external resources, external contracts differ materially from application needs, or requests require composition, normalization, caching, or consistent failure handling.

Add mapping only when it protects the application from real contract differences, normalizes values, or combines responses. Do not add a repository over a single stable service or a global store for data owned by one feature. Keep server rendering, client rendering, hydration, persistence, and remote-state ownership explicit when relevant.

## Domain-centered flow

Typical direction:

```text
features -> application workflows -> domain rules
                         \-> integrations -> external systems
```

Possible directory patterns:

| Pattern | Responsibility |
|---|---|
| `features/<feature>/` | User interaction and presentation |
| `application/<workflow>/` | Sequencing and I/O coordination for meaningful workflows |
| `domain/<area>/` | Pure rules, invariants, and domain state transitions |
| `integrations/<provider>/` | Translation to and from external systems |

Use when correctness depends on business rules, invariants, decisions, or state transitions; workflows compose multiple asynchronous operations; or rules must be tested without UI, HTTP, or persistence.

Keep domain behavior deterministic where practical. Do not create a domain boundary for display formatting, trivial filtering, or one-to-one CRUD. Do not create one workflow abstraction per action unless orchestration or dependency direction benefits.

## Choosing and evolving

- Begin with the compact profile unless current drivers justify another boundary.
- Add integration and domain boundaries independently; a project may need either one, both, or neither.
- Prefer the existing adequate organization when extending a project.
- Define directory responsibilities and dependency rules before feature-specific decomposition.
- Record naming patterns and extension rules that future features must follow.
- Recommend against a profile when its maintenance cost exceeds the current problem it solves.
