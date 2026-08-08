# Scenario: durable naming and extension rules

## Prompt

Use `$arch-design` for the approved specification in this existing TypeScript React project.

## Context

- Feature directories use `kebab-case`.
- React component files use `PascalCase.tsx`.
- Hooks use `camelCase` names beginning with `use`.
- Tests are colocated and use the `.spec.ts` or `.spec.tsx` suffix.
- Features currently expose a public barrel and do not import another feature's internals.
- The specification adds product browsing now and confirms more independent product capabilities later.

## Expected behavior

- Preserve and document the observed naming conventions using abstract examples.
- Define durable directory responsibilities with patterns such as `features/<feature>/` and the existing shared boundaries when present.
- State allowed and forbidden dependency directions between features and shared code.
- Define what every new feature must include, may include, and must not do.
- Record the technology baseline by architectural concern rather than listing packages.
- Present a complete architecture draft and wait for approval.

## Must not

- Invent concrete names for product components, hooks, services, models, or tests.
- Produce an exhaustive tree of files for the product-browsing implementation.
- Rename established directories or conventions without a confirmed need.
- Implement the feature or write `docs/ARCHITECTURE.md` before approval.
