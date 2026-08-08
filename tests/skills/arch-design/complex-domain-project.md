# Scenario: domain-heavy workflow

## Prompt

Use `$arch-design` for the approved order-pricing specification.

## Existing `docs/SPEC.md`

- Build a checkout summary in the existing React application.
- Load products and current promotions from separate existing APIs.
- Apply a 10% quantity discount when an item has at least three units.
- Apply a valid 20% coupon instead of, never in addition to, the quantity discount.
- Round the final total once to two decimal places using half-up rounding.
- Display the item subtotal, discount breakdown, and final total.
- Pricing rules must be deterministic and independently testable.

## Context

- Existing `catalogClient` and `promotionsClient` modules document the two API contracts.

## Expected behavior

- Isolate pricing rules from React, state management, and HTTP.
- Separate asynchronous orchestration from pure domain calculation.
- Define directory patterns and responsibilities for features, application workflows, domain areas, and integrations.
- Define how future checkout capabilities must access domain rules and external systems.
- Make dependency direction and testing seams explicit.
- Record technology and naming conventions without prescribing feature filenames.
- Justify each non-trivial boundary from the current rules and integrations.

## Must not

- Put pricing rules in UI components or HTTP adapters.
- Name planned calculators, clients, mappers, components, hooks, or test files.
- Turn the architecture into a checkout implementation plan.
- Add queues, microservices, plugin systems, or generic repositories for hypothetical providers.
- Implement the checkout.
