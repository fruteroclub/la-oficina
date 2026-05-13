---
project: la-oficina
title: La Oficina v0.1.0 — initial implementation
schema_version: "1.0"
created: 2026-05-13
updated: 2026-05-13
default_workflow: [backlog, todo, in_progress, review, done]
id_prefix: TASK
next_id: 24
---

## Agents

| Agent | Type | Role | Status | Working On | Last Active | Trust Level |
|-------|------|------|--------|------------|-------------|-------------|
| @mel | human | Architect / owner | idle | - | 2026-05-13 | owner |
| @dumbleclaw | bot | primary Operator (Hermes harness on EC2) | idle | build-in-public-alpha-version | 2026-05-13 | trusted |
| @lab-agent | bot | generic lab Operator (any harness) | idle | - | 2026-05-13 | trusted |

## Tasks

### TASK-001
status: done
priority: high
tags: [seed, doctrine]
> Scaffold initial skill repo at fruteroclub/la-oficina with README/LICENSE/SKILL/VERSION/CHANGELOG. (Done 2026-05-13.)

### TASK-002
status: done
priority: high
tags: [seed, doctrine]
> Write docs/{shape,indexing,module-loading,byoa}.md. (Done 2026-05-13.)

### TASK-003
status: done
priority: high
tags: [seed, schemas]
> Write 6 schemas (oficina, pod, office, workspace, project, workstream). (Done 2026-05-13.)

### TASK-004
status: done
priority: high
tags: [seed, templates]
> Stub 5 template directories (agency-init, pod, workspace, project, workstream). (Done 2026-05-13.)

### TASK-005
status: done
priority: high
tags: [seed, scripts]
> Stub 9 scripts with correct CLI surface (oficina-init, add-pod, add-workspace, add-project, add-workstream, index, resolve, module-load, seed-wiki). (Done 2026-05-13.)

### TASK-006
status: done
priority: high
tags: [seed, adapters]
> Stub adapter SETUP.md for Hermes, Claude Code, Obsidian, generic. (Done 2026-05-13.)

### TASK-007
status: done
priority: high
tags: [v0.1.0, scripts]
> Implement `scripts/oficina-resolve.sh` — walk up from cwd, identify current module (pod/office/workspace/project/workstream), output parent chain. Foundation for module-load and add-*. (Done 2026-05-13. Tested at every level + outside-agency case.)

### TASK-008
status: todo
priority: high
tags: [v0.1.0, scripts]
> Implement `scripts/oficina-init.sh` — create .obsidian/, .oficina/{config.yaml,pods.yaml}, README/INDEX/AGENTS/LOG at agency root, pods/.gitkeep. Idempotent. Validate it's at an agent workspace (best-effort: SOUL.md present, or --force flag).

### TASK-009
status: todo
priority: high
tags: [v0.1.0, scripts]
> Implement `scripts/oficina-add-pod.sh <name>` — create pods/<name>/.pod/{POD.md,BOOTSTRAP.md,STATUS.md} + pods/<name>/{INDEX.md,AGENTS.md,LOG.md} + pods/<name>/office/ scaffold. Update .oficina/pods.yaml registry. Append agency LOG.md entry.

### TASK-010
status: todo
priority: high
tags: [v0.1.0, scripts]
> Implement `scripts/oficina-add-workspace.sh <name> --pod <pod>` — create workspaces/<name>/{WORKSPACE.md,INDEX.md,AGENTS.md,LOG.md,projects/.gitkeep}. Update office's OFFICE.md registry + INDEX.md. Append office LOG.md entry.

### TASK-011
status: todo
priority: high
tags: [v0.1.0, scripts]
> Implement `scripts/oficina-add-project.sh <name> --pod <pod> --workspace <ws>` — create projects/<name>/{PROJECT.md,INDEX.md,AGENTS.md,TICK.md,workstreams/.gitkeep}. Update workspace INDEX. Append workspace LOG.

### TASK-012
status: todo
priority: high
tags: [v0.1.0, scripts]
> Implement `scripts/oficina-add-workstream.sh <name> --pod <pod> --workspace <ws> --project <p>` — create workstreams/<name>/{BRIEF.md,STATUS.md,MEMORY.md,DECISIONS.md,STAKEHOLDERS.md,RESOURCES.md,SESSIONS.md,docs/.gitkeep}. Update project INDEX + TICK. Append project LOG.

### TASK-013
status: todo
priority: medium
tags: [v0.1.0, scripts]
> Implement `scripts/oficina-index.sh [<path>]` — regenerate INDEX.md at the given level (or all levels if no path given). Reads child identity files for names/status.

### TASK-014
status: done
priority: high
tags: [v0.1.0, scripts]
> Implement `scripts/oficina-module-load.sh <path>` — output a markdown context bundle: parent identity files walked up from <path>, plus AGENTS.md/INDEX.md/identity at <path>, plus subtree below <path>. Sibling/higher-content is excluded (identity-only). (Done 2026-05-13. Tested at every level; --children-depth 0|1 supported.)

### TASK-022
status: done
priority: high
tags: [v0.1.0, scripts]
> Implement `bin/oficina` CLI dispatcher — routes `oficina <subcommand>` to `scripts/oficina-<subcommand>.sh`, exposes `help` / `version` meta commands, resolves real path through symlinks. Needed so Hermes installs surface a single `oficina` binary. (Done 2026-05-13.)

### TASK-023
status: in_progress
priority: high
tags: [v0.1.x, workstream, build-in-public]
claimed_by: "@dumbleclaw"
> Drive v0.1.x alpha to completion. Tracked in `workstreams/build-in-public-alpha-version/`. Dumbleclaw owns; @mel supervises. Scope covers TASK-008..016 implementation + tests + dogfooding milestones. This TASK is the project-level pointer; granular task tracking happens inside the workstream + against TASK-008..018 directly.

### TASK-015
status: todo
priority: medium
tags: [v0.1.0, scripts]
> Implement `scripts/oficina-seed-wiki.sh` — read agent harness config files at agency root (SOUL.md, harness bootstrap), write as LLM-Wiki pages with appropriate frontmatter and links. Idempotent: skip pages that already exist unless --force.

### TASK-016
status: todo
priority: medium
tags: [v0.1.0, ci]
> Add `.github/workflows/release.yml` mirroring intern-os pattern: tag-triggered, version-consistency guard (VERSION + SKILL.md `version:` + CHANGELOG entry all match).

### TASK-017
status: todo
priority: medium
tags: [v0.1.0, dogfood]
> Run `oficina init --force` against a temp directory and verify the output matches the hand-scaffolded structure at `~/oficina/`. Document any drift.

### TASK-018
status: todo
priority: low
tags: [v0.1.0, dogfood]
> Demonstrate BYOA: pull this repo into a separate agent harness, load the la-oficina project via module-load, and have that agent contribute a small fix back via PR.

### TASK-019
status: todo
priority: low
tags: [v0.2.0, registry]
> Spec `.office/registry.yaml` at office level (machine-readable workspaces registry, complementing the OFFICE.md markdown table).

### TASK-020
status: todo
priority: low
tags: [v0.2.0, hardening]
> Spec module-scope enforcement options beyond honor-system (filesystem ACLs, symlink jails, container isolation).

### TASK-021
status: in_progress
priority: high
tags: [v0.1.0, content, build-in-public]
> Produce the v0.1.0 launch content arc (Frutero Club blog + derivatives). Tracked in `workstreams/v0.1.0-launch-content/`. First piece ("Por qué La Oficina" ES + EN companion) drafted 2026-05-13, awaiting @mel review. Workstream owns granular tasks; this TASK is the project-level pointer.
