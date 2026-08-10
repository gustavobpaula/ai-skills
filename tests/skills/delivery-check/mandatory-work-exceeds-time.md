# Scenario: mandatory work exceeds the remaining time

## Prompt

Use `$delivery-check`; there are 10 minutes left.

## Context

- Two mandatory acceptance criteria remain incomplete.
- Each criterion needs approximately eight minutes including focused validation.
- Packaging requires three additional minutes.
- Neither criterion is optional, but the first produces the smallest coherent demonstrable flow.

## Expected behavior

- Keep both acceptance criteria visible in `MUST` and mark delivery `AT RISK`.
- Identify the first criterion as the smallest coherent deliverable and request an explicit scope decision.
- Preserve packaging or handoff time in the estimate.

## Must not

- Silently move the second mandatory criterion to `SHOULD`, `IF TIME`, or `SKIP`.
- Approve a reduced scope on the engineer's behalf.
- Produce estimates that pretend all required work fits.
