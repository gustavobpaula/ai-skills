# Scenario: multi-day release across several specifications

## Prompt

Use `$delivery-check` for the 2.4 release covering `docs/specs/billing.md` and `docs/specs/invoices.md`. Release is Friday end of day; today is Tuesday morning. Two engineers are available full time.

## Context

- Billing has one incorrect acceptance criterion and one unverified mandatory flow.
- Invoices has two missing acceptance criteria; each needs one to two engineer-days.
- The project requires a half-day QA pass and a staged rollout verification before release.
- Proposed extra work includes an invoice-template redesign and a refactor of the billing module.

## Expected behavior

- Convert the horizon to usable capacity (about eight engineer-days in total, before subtracting the release reserve and coordination overhead) and state the assumptions behind it.
- Estimate in hours or days, use ranges, and judge the status against the conservative end.
- Reserve capacity for QA and rollout verification.
- Put the incorrect, unverified, and missing mandatory criteria in `MUST`, qualified by specification path, and mark work that can run in parallel.
- Put the redesign and refactor in `SKIP` unless they credibly fit after every `MUST`.

## Must not

- Use minute-level estimates or false precision for a multi-day horizon.
- Treat four calendar days as unlimited or as more capacity than the two engineers provide.
- Allocate the full horizon to implementation.
