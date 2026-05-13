# Changelog

> **Version scheme:** `0.x.x` to reflect alpha status.

## Unreleased — 2026-05-13 (continued)

### Added
- `bin/oficina` — CLI dispatcher. Routes `oficina <subcommand>` to `scripts/oficina-<subcommand>.sh`. Includes `help` / `version` meta commands. Handles symlinked invocation. Lets a Hermes install of the skill expose a single `oficina` binary on the user's PATH.
- `scripts/oficina-resolve.sh` — full implementation. Walks up from a path, detects markers (`.oficina/`, `.pod/`) and identity files (`OFFICE.md`, `WORKSPACE.md`, `PROJECT.md`, `BRIEF.md`), emits one `KEY=value` line per scope variable plus `MODULE_LEVEL`. Output is `eval`-safe.
- `scripts/oficina-module-load.sh` — full implementation. Uses `resolve` under the hood to identify the target, emits the four-section markdown bundle defined in `docs/module-loading.md` (orientation / target / children / scope). Supports `--children-depth 0|1`.

### Notes for downstream consumers
- This is the minimum-viable v0.1.0 path for the Hermes Agent: resolve + module-load + dispatcher are enough for Dumbleclaw to load any pod and operate inside it. The remaining script stubs (`init`, `add-*`, `index`, `seed-wiki`) still `exit 1` with TODO — see TICK.md TASK-008..015.
- `VERSION` file currently reads `0.1.0`; `SKILL.md` frontmatter still reads `0.1.0-pre`. Version-consistency reconciliation is TASK-016 and will land with the release workflow.

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
