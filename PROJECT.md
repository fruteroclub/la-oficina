# Project: la-oficina

## Identity

- **Name:** la-oficina
- **Owner:** @mel
- **Workspace:** fruteroclub
- **Pod:** lab
- **Created:** 2026-05-13

## Purpose

**Objective:** Ship La Oficina v0.1.0 — an installable skill that scaffolds the agency / pod / office / workspace / project / workstream hierarchy and supports module-scoped agent loading.

**Problem:** AI-Native agencies running multiple pods need a single canonical home for operational state, knowledge, and orchestration. Existing tooling (intern-os v0.4.1) handles workstreams but not the layers above. La Oficina fills that gap.

**For whom:** Architects running pods under Frutero, LLC initially. Eventually any agency-owner who wants their agent(s) to operate a multi-pod, multi-client surface.

## Scope (v0.1.0)

**Includes:**
- Doctrine (5-level hierarchy spec, indexing, module-loading, BYOA)
- Schemas for each level
- Templates for scaffolding
- 9 CLI commands (oficina init, add-pod, add-workspace, add-project, add-workstream, index, resolve, module-load, seed-wiki)
- Adapter stubs for Hermes, Claude Code, Obsidian, generic
- AGPL v3 + commercial license dual

**Excludes (deferred to v0.2.0+):**
- Filesystem-ACL-based scope enforcement (v0.1.0 is honor-system)
- Cross-pod handoff protocols
- Office Event Ledger (cross-session / cross-harness event capture)
- Promotion / provenance tooling for MEMORY → wiki
- office-doctor health check
- .office/registry.yaml machine registry (v0.1.0 uses .oficina/pods.yaml at agency level only)
- Multi-tenant agency on shared infrastructure

## Success criteria

1. `oficina init` runs cleanly in a fresh agent workspace
2. `oficina add-pod`, `add-workspace`, `add-project`, `add-workstream` all work end-to-end
3. `oficina resolve` correctly identifies module + parent chain from any cwd in the tree
4. `oficina module-load <path>` returns a usable context bundle (markdown)
5. `oficina seed-wiki` reads agent harness config and writes initial LLM-Wiki pages
6. At least one BYOA scenario demonstrated: a separate agent harness loads a workspace via the URL pattern in `docs/byoa.md` and operates inside its scope
7. Repo is pushed to `github.com/fruteroclub/la-oficina` and tagged v0.1.0

## Current state

- **Status:** active
- **Phase:** seed landed; awaiting agent to begin script implementations
- **Next milestone:** working `oficina init` + `oficina add-pod`
- **Blockers:** none

## Operational links

- **TICK.md:** [TICK.md](TICK.md)
- **Workstreams:**
  - [`v0.1.0-launch-content/`](workstreams/v0.1.0-launch-content/BRIEF.md) — Frutero Club blog + build-in-public content arc surrounding v0.1.0 (active, started 2026-05-13, owner @mel)
  - [`build-in-public-alpha-version/`](workstreams/build-in-public-alpha-version/BRIEF.md) — implementation arc for v0.1.x alpha; Dumbleclaw drives skill creation + polish (active, started 2026-05-13, owner @dumbleclaw)

## Notes

This project is dogfooded — the skill being built scaffolds the very pod it's being built in. The lab pod (`~/oficina/pods/lab/`) was hand-scaffolded as the v0.1.0-pre seed; running `oficina init` against a fresh agency root will reproduce that scaffold automatically.

Cross-reference research material at `~/workspace/projects/poktalabs/projects-source-code/intern-os/research/office/` (gitignored in the intern-os repo).
