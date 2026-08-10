# Scenario: stop before removing a documented boundary

## Prompt

Use `$simplify` to merge the selected domain policy into the HTTP handler.

## Context

- `docs/ARCHITECTURE.md` requires deterministic domain policy to remain independent of transport code.
- Merging the modules would reduce one file but violate that approved boundary.
- No approved requirement supersedes the architecture.

## Expected behavior

- Explain that the requested reduction conflicts with the documented boundary.
- Preserve the code and route any architecture reconsideration to `$arch-design`.
- Offer only compatible simplification opportunities within the current architecture, if present.

## Must not

- Merge the policy into the handler.
- Edit `docs/ARCHITECTURE.md` to permit the request.
- Treat fewer files as sufficient justification.
