# Changelog

> **Version scheme:** `0.x.x` to reflect alpha status.

## v0.1.0 — 2026-05-13

First taggable release. Minimum-viable path so the Hermes Agent (and any other harness) can install La Oficina and operate pre-scaffolded pods. Scaffolding commands ship as functional stubs and land in subsequent point releases.

### Added
- `bin/oficina` — CLI dispatcher. Routes `oficina <subcommand>` to `scripts/oficina-<subcommand>.sh`. Includes `help` / `version` meta commands. Handles symlinked invocation, so symlinking into `~/.local/bin/` works.
- `scripts/oficina-resolve.sh` — full implementation. Walks up from a path, detects markers (`.oficina/`, `.pod/`) and identity files (`OFFICE.md`, `WORKSPACE.md`, `PROJECT.md`, `BRIEF.md`), emits one `KEY=value` line per scope variable plus `MODULE_LEVEL`. Output is `eval`-safe. Exit 0 inside an agency, 1 outside.
- `scripts/oficina-module-load.sh` — full implementation. Uses `resolve` under the hood to identify the target, emits the four-section markdown bundle defined in `docs/module-loading.md` (orientation / target / children / scope). Supports `--children-depth 0|1`.
- `adapters/claude-code/SETUP.md` — install procedure documented (was TODO in v0.1.0-pre).

### Changed
- `SKILL.md` — version field bumped from `0.1.0-pre` to `0.1.0`; aligned with `VERSION` file.

### Known limitations
- 7 of the 9 documented commands (`init`, `add-pod`, `add-workspace`, `add-project`, `add-workstream`, `index`, `seed-wiki`) ship as functional stubs that print `TODO: implement` and `exit 1`. They appear in `oficina help` marked `(stub)`. Pod scaffolding requires manual setup until they land in v0.1.x point releases — see TICK.md TASK-008..015.
- Version-consistency guard (TASK-016) and release workflow (`.github/workflows/release.yml`) not yet implemented; release tags applied by hand.
- No tests directory yet; the implemented commands are validated against the live lab pod tree, not via a runnable suite.

## v0.1.0-pre — 2026-05-13

## v0.1.0-pre — 2026-05-13

Initial seed.

### What's here

- **Doctrine** (`docs/`): 5-level hierarchy spec (shape.md), INDEX conventions (indexing.md), module-load protocol (module-loading.md), BYOA pattern (byoa.md).
- **Schemas** (`schemas/`): YAML schemas for oficina, pod, office, workspace, project, workstream identity files.
- **Templates** (`templates/`): scaffolding for agency-init, pod, workspace, project, workstream.
- **Scripts** (`scripts/`): 9 CLI commands as functional stubs (oficina-init, add-pod, add-workspace, add-project, add-workstream, index, resolve, module-load, seed-wiki). **Implementation pending — the lab pod's agent is the primary builder.**
- **Adapters** (`adapters/`): SETUP stubs for Hermes, Claude Code, Obsidian, generic.

### Not done yet

- Script implementations (functional stubs only; agent fills in)
- CLI dispatcher `bin/oficina` (each script is currently standalone)
- Tests
- Release workflow
- Hermes skill install path verification

### Cross-references

- The agency this skill is being developed inside: `~/oficina/`
- The pod hosting the skill source: `~/oficina/pods/lab/`
- Strategy / business context: `~/workspace/projects/poktalabs/projects-source-code/intern-os/research/office/` (intern-os repo, gitignored research dir)
