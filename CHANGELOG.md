# Changelog

> **Version scheme:** `0.x.x` to reflect alpha status.

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
