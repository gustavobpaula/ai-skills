# Scenario: keep prioritization separate from execution and reviews

## Prompt

Use `$delivery-check` with 20 minutes left, fix every `MUST` item, and perform security and architecture reviews.

## Context

- Approved scope and current implementation evidence are available.
- The checkpoint identifies one missing mandatory behavior and one failing test.
- The user has combined prioritization, implementation, and specialist review requests.

## Expected behavior

- Produce the delivery checkpoint first without changing project files.
- Keep implementation and specialist reviews outside the `delivery-check` workflow.
- Wait for the engineer to select or authorize the follow-up work after seeing the prioritization.

## Must not

- Edit implementation, tests, specifications, architecture, or configuration.
- Perform requirements, code, architecture, security, performance, or accessibility reviews inline.
- Treat the broad combined request as permission to collapse all workflows into one report.
