# AI Engineering Skills

A versioned collection of focused skills for AI-assisted software engineering. The skills accelerate recurring workflows while keeping product, architecture, and delivery decisions under the engineer's control.

> **Skills are global. Context is local.**

Reusable workflows live in this repository. Project-specific requirements, architecture, and source code remain in each application repository.

For continuous development, `docs/SPEC.md` may remain a compact standalone specification or become the canonical catalog and home for global rules. Approved feature specifications then live under `docs/specs/<feature>.md`; a feature is discovered automatically only through an explicit link from the root specification. Requirements and acceptance-criterion identifiers are local to each document, so consumers identify them by specification path plus identifier.

## Repository layout

```text
skills/                       Canonical skill sources
scripts/install.sh            Core installer (defaults to Codex's skills directory)
scripts/install-claude.sh     Claude Code installer (installs into ~/.claude/skills)
tests/skills/                 Behavioral test scenarios
tests/install.sh              Installer smoke tests
tests/speckit-sandbox.sh      Spec Kit sandbox for behavioral scenarios
docs/                         Repository planning documents
```

Each skill has a narrow responsibility and follows this minimum convention:

```text
skills/<skill-name>/
├── SKILL.md             Required workflow and trigger metadata
└── agents/openai.yaml   Codex-facing display metadata
```

Add `scripts/`, `references/`, or `assets/` inside a skill only when the workflow genuinely needs them. Keep the YAML frontmatter limited to `name` and `description`, put triggering guidance in `description`, and write the body as concise imperative instructions.

`SKILL.md`'s `name`/`description` frontmatter is the same convention Claude Code reads, so no per-skill changes are needed to support it. `agents/openai.yaml` is Codex-only display metadata; Claude Code ignores it.

Application repositories may use either layout:

```text
docs/
├── SPEC.md                 Global specification or standalone small-project spec
├── specs/
│   └── <feature>.md        Optional approved feature specifications linked by SPEC.md
└── ARCHITECTURE.md         Single durable project architecture
```

## Using with GitHub Spec Kit

The skills work alongside [GitHub Spec Kit](https://github.com/github/spec-kit). Spec Kit owns specification, planning, and task execution under `specs/<feature>/`; these skills act as quality and decision gates around it. Pass a Spec Kit feature path explicitly (for example `$requirements-review specs/003-chat/spec.md`), or let the skills resolve the active feature that Spec Kit records in `.specify/feature.json` (or the current branch, when the `git` extension creates one).

Keep the layers distinct: `.specify/memory/constitution.md` holds principles and governance, `docs/ARCHITECTURE.md` holds the concrete durable structure maintained by `arch-design`, and each feature's `plan.md` applies that structure to one feature. `arch-review` checks delivered code, and the plan behind it, against `docs/ARCHITECTURE.md` and the constitution's structural principles. `requirements-review` remains the independent coverage gate over each acceptance scenario (`US<n>/AC<n>`) and `FR-###`, and `feature-implementation` handles targeted corrections outside an in-progress `tasks.md`. See section 11 of `docs/SKILLS_DEVELOPMENT_PLAN.md` for the full flow.

## Install for Codex

Install one or more skills by name:

```sh
./scripts/install.sh spec arch-design feature-implementation requirements-review code-review delivery-check test-strategy arch-review simplify a11y-review debug performance-review
```

The installer creates symlinks in `${HOME}/.agents/skills` by default. Override the destination for an isolated environment or test:

```sh
AI_SKILLS_TARGET_DIR=/path/to/skills ./scripts/install.sh spec arch-design
```

The installer never replaces an existing file, directory, or different symlink. If Codex does not detect a newly installed skill, restart Codex.

## Install for Claude Code

Same skill names, same installer logic, different default destination:

```sh
./scripts/install-claude.sh spec arch-design feature-implementation requirements-review code-review delivery-check test-strategy arch-review simplify a11y-review debug performance-review
```

`scripts/install-claude.sh` is a thin wrapper around `scripts/install.sh` that defaults the target to `${HOME}/.claude/skills` (Claude Code's personal skills directory) instead of Codex's. Override it the same way:

```sh
AI_SKILLS_TARGET_DIR=/path/to/skills ./scripts/install-claude.sh spec arch-design
```

Claude Code follows symlinks when scanning `~/.claude/skills`, so the same canonical source in this repository backs both agents. It also picks up newly installed skills within the session, so no restart is required (a restart is only needed the first time `~/.claude/skills` is created, since Claude Code must start watching the new directory).

Install for both agents by running both installers; each only touches its own target directory.

## Update

Pull or check out the desired repository revision. Installed skills update immediately because their global entries are symlinks to this canonical repository; no copying or reinstalling is required unless the repository moves. To pin a release, check out its tag, for example `git checkout v0.2.0`.

## Versioning

The repository is versioned as a whole with [Semantic Versioning](https://semver.org); individual skills are not versioned separately. Git tags (`vX.Y.Z`) and [CHANGELOG.md](CHANGELOG.md) are the only sources of the version.

- **MAJOR**: breaks what projects rely on, such as document paths, identifier formats, output structures other skills consume, or a removed or renamed skill.
- **MINOR**: adds a compatible capability, such as a new skill or integration.
- **PATCH**: adjusts a rule within the existing contract.

While the version is below 1.0.0, contracts may still change between minor versions. Record every change under `Unreleased` in the changelog. To release, rename that section to the new version and date, commit, tag the commit, push the commit and tag, and publish a GitHub Release whose notes are that version's changelog section:

```sh
gh release create vX.Y.Z --verify-tag --title vX.Y.Z --notes-file <notes.md>
```

## Test

Run the local structural and installer checks:

```sh
./tests/install.sh
```

Behavioral scenarios live under `tests/skills/<skill-name>/`. Run them in clean temporary projects with a fresh agent session, compare behavior against each scenario's rubric, and keep project-specific artifacts outside this repository.

Scenarios named `spec-kit-*` need a Spec Kit project. Create one with `./tests/speckit-sandbox.sh <dir> [claude] [codex]` and follow `tests/SPEC_KIT_RUNBOOK.md`.

Before accepting a skill change, also run the `quick_validate.py` supplied by Codex's `skill-creator` against the skill directory.
