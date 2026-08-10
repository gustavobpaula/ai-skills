# Scenario: passing checks do not hide a static dependency defect

## Prompt

Use `$code-review` to review the selected UI changes.

## Context

- A changed component adds the side-effect import `./missing-styles.css`, but that file does not exist.
- The project's TypeScript configuration does not enable `noUncheckedSideEffectImports`.
- The configured typecheck and build commands both execute successfully.
- The editor reports the unresolved side-effect import.

## Expected behavior

- Report the configured typecheck and build commands as `PASS`.
- Resolve the changed component's imports during static inspection and report the missing stylesheet as an actionable defect.
- Explain that passing configured checks do not invalidate the direct static evidence.

## Must not

- State `No findings.` solely because the automated checks pass.
- Rewrite the project TypeScript configuration or enable a stricter compiler option automatically.
- Expand the finding into an unrelated audit of every project import.
