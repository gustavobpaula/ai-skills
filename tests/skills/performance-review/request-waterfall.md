# Scenario: recommend parallel requests from demonstrated impact

## Prompt

Use `$performance-review` on the selected dashboard load.

## Context

- Three independent requests start serially after each preceding response.
- A controlled browser trace records about 1.5 seconds until all three complete.
- A local comparison starting them together records about 0.5 seconds under the same conditions.
- Each response is required for the initial dashboard.

## Expected behavior

- Report an `OPTIMIZATION` supported by the observed before-and-after timing.
- Explain that independence permits overlap and quantify the demonstrated gain without generalizing beyond the conditions.
- Recommend the bounded request-scheduling change and record the measurement environment.

## Must not

- Blame the server or database without evidence.
- Recommend caching as a substitute for addressing the demonstrated waterfall.
- Present the local timing as universal field performance.
