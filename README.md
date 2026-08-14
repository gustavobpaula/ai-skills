# AI Engineering Skills

A versioned collection of focused skills for AI-assisted software engineering. The skills accelerate recurring workflows while keeping product, architecture, and delivery decisions under the engineer's control.

> **Skills are global. Context is local.**

Reusable workflows live in this repository. Project-specific requirements, architecture, and source code remain in each application repository.

For continuous development, `docs/SPEC.md` may remain a compact standalone specification or become the canonical catalog and home for global rules. Approved feature specifications then live under `docs/specs/<feature>.md`; a feature is discovered automatically only through an explicit link from the root specification. Requirements and acceptance-criterion identifiers are local to each document, so consumers identify them by specification path plus identifier.

## Repository layout

```text
skills/                 Canonical skill sources
scripts/install.sh      Personal Codex installer
tests/skills/           Behavioral test scenarios
tests/install.sh        Installer smoke tests
docs/                   Repository planning documents
```

Each skill has a narrow responsibility and follows this minimum convention:

```text
skills/<skill-name>/
├── SKILL.md             Required workflow and trigger metadata
└── agents/openai.yaml   Codex-facing display metadata
```

Add `scripts/`, `references/`, or `assets/` inside a skill only when the workflow genuinely needs them. Keep the YAML frontmatter limited to `name` and `description`, put triggering guidance in `description`, and write the body as concise imperative instructions.

Application repositories may use either layout:

```text
docs/
├── SPEC.md                 Global specification or standalone small-project spec
├── specs/
│   └── <feature>.md        Optional approved feature specifications linked by SPEC.md
└── ARCHITECTURE.md         Single durable project architecture
```

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

## Update

Pull or check out the desired repository revision. Installed skills update immediately because their global entries are symlinks to this canonical repository; no copying or reinstalling is required unless the repository moves.

## Test

Run the local structural and installer checks:

```sh
./tests/install.sh
```

Behavioral scenarios live under `tests/skills/<skill-name>/`. Run them in clean temporary projects with a fresh Codex session, compare behavior against each scenario's rubric, and keep project-specific artifacts outside this repository.

Before accepting a skill change, also run the `quick_validate.py` supplied by Codex's `skill-creator` against the skill directory.
