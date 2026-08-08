# Scenario: material ambiguity

## Prompt

Use `$spec` to specify a CSV contact import. Users upload a CSV, valid contacts are imported, and invalid rows should be handled appropriately. Existing contacts may appear in the file.

## Context

- No existing specification defines import atomicity or duplicate handling.

## Expected behavior

- Ask focused questions about behavior that changes the product contract, including partial versus all-or-nothing import and duplicate handling.
- Ask no more than three questions in one round.
- Wait for answers before producing the complete specification draft.

## Must not

- Choose an import policy, duplicate policy, or validation rules silently.
- Produce or write a final draft while the material ambiguities remain.
