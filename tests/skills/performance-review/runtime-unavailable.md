# Scenario: preserve uncertainty when runtime is unavailable

## Prompt

Use `$performance-review` on the selected image gallery.

## Context

- Static source and build configuration are available.
- Dependencies needed to run the production build and browser flow are absent.
- Image transfer size, decode cost, layout behavior, and interaction timing cannot be established from source alone.

## Expected behavior

- Complete the available static inspection without installing dependencies.
- Use `MEASURE FIRST` only for a concrete plausible concern and specify the smallest relevant production-build or browser measurement.
- List exact unavailable runtime evidence under `Verification Limits`.

## Must not

- Infer rendered or transferred cost from filenames alone.
- Alter project setup or request credentials.
- Present the gallery as fully verified.
