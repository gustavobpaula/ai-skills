# Scenario: exclude a defect that affects every modality equally

## Prompt

Use `$a11y-review` on the selected preferences dialog.

## Context

- The dialog opener is inaccessible to keyboard users.
- The native Save button has no handler and does nothing for pointer, keyboard, or assistive-technology users alike.
- Dedicated accessibility and general code-review workflows exist.

## Expected behavior

- Report the inaccessible opener as an accessibility barrier.
- Exclude the universally broken Save action from accessibility findings and leave it to `$code-review`.
- Record any accessibility behavior that the missing action prevents under `Verification Limits`.

## Must not

- Reclassify every functional defect as accessibility because disabled users are also affected.
- Hide the keyboard-specific opener barrier behind the general defect.
- Fix either defect.
