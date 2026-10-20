# Changelog

All notable changes to this repository are documented here. The format follows [Keep a Changelog](https://keepachangelog.com/en/1.1.0/), and the repository is versioned as a whole following [Semantic Versioning](https://semver.org/spec/v2.0.0.html), as described in the README's Versioning section.

## [Unreleased]

### Changed

- The release process in the README now includes publishing a GitHub Release with the version's changelog notes.

## [0.2.0] - 2026-10-20

### Added

- Claude Code support: `scripts/install-claude.sh` installs the skills into `~/.claude/skills`, with installer smoke tests and README instructions.
- GitHub Spec Kit integration across `spec`, `arch-design`, `arch-review`, `feature-implementation`, `requirements-review`, `test-strategy`, and `delivery-check`:
  - Resolve the active feature from an explicit path, `SPECIFY_FEATURE_DIRECTORY` or `.specify/feature.json`, then the Git branch.
  - Understand `FR-###`, `SC-###`, and acceptance scenarios as `US<n>/AC<n>`.
  - Read the constitution as governing principles and feature plans, tasks, and checklists as evidence, never as requirements or as the architecture baseline.
- `arch-review` gives each structural constitution principle a `FOLLOWED`, `VIOLATED`, or `NOT AFFECTED` status and checks feature plans against `docs/ARCHITECTURE.md`.
- `arch-design` suggests a constitution principle that ties feature plans to `docs/ARCHITECTURE.md`.
- `tests/speckit-sandbox.sh` and `tests/SPEC_KIT_RUNBOOK.md` for running behavioral scenarios in Spec Kit projects, plus 15 new scenarios.
- Spec Kit workflow, layer responsibilities, and horizon-based effort allocation in `docs/SKILLS_DEVELOPMENT_PLAN.md`.

### Changed

- `delivery-check` works against a delivery horizon (deadline, release date, remaining duration, or capacity) instead of only remaining minutes. It converts the horizon to usable capacity, reserves time for validation and release activities, uses ranges for multi-day horizons, and always reports all four categories.
- `delivery-check` marks delivery `AT RISK` when the conservative `MUST` total reaches or exceeds usable capacity.
- `spec` asks only blocking questions: it writes criteria at the detail the requirements support and records non-blocking refinements under `Open Questions`.
- `spec` defers to Spec Kit in projects that use it instead of creating a parallel `docs/SPEC.md` catalog.
- `feature-implementation` leaves a Spec Kit feature with an in-progress `tasks.md` to Spec Kit unless the engineer selects units to implement.
- `arch-review` reserves `BLOCKER` for direct, unambiguous violations of structural constitution principles and no longer reports `FUTURE` items that disappear when a current finding is fixed.
- The workflow documentation targets product delivery instead of timed interview exercises.

## [0.1.0] - 2026-08-14

### Added

- Skills: `spec`, `arch-design`, `feature-implementation`, `requirements-review`, `code-review`, `delivery-check`, `test-strategy`, `arch-review`, `simplify`, `a11y-review`, `debug`, and `performance-review`.
- `scripts/install.sh` for installing skills into Codex through symlinks, with installer smoke tests.
- Behavioral test scenarios under `tests/skills/`.
- Modular specifications for continuous delivery: `docs/SPEC.md` as a global specification and catalog of linked `docs/specs/<feature>.md` documents, with identifiers local to each document.

[Unreleased]: https://github.com/gustavobpaula/ai-skills/compare/v0.2.0...HEAD
[0.2.0]: https://github.com/gustavobpaula/ai-skills/compare/v0.1.0...v0.2.0
[0.1.0]: https://github.com/gustavobpaula/ai-skills/releases/tag/v0.1.0
