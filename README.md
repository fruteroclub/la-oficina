# La Oficina

> **Operating System for AI-Native Agencies.** Scaffolds the hierarchy that lets an agent (or a team of agents) operate an agency, pods, organizations, and engagements from one filesystem-canonical, harness-agnostic shape.

**Status:** v0.1.0-pre. Initial seed. The agent operating the lab pod is the first builder of this skill.

**License:** AGPL v3 + commercial license required for commercial deployments. See [LICENSE](LICENSE).

## What it is

A skill that converts an agent harness's workspace into a full Agency Operating System by adding:

1. **`.obsidian/`** — Obsidian vault, the LLM-Wiki second-brain layer
2. **`.oficina/`** — La Oficina marker, agency config + pod registry
3. **`pods/`** — operating system unit container; each pod gets its own `.pod/` marker + `office/` orchestration tree
4. **Office hierarchy** below each pod: `office/workspaces/<org>/projects/<project>/workstreams/<ws>/`

Each level carries identity + INDEX + LOG + AGENTS files, making the tree fully walkable by LLMs and indexable in the Obsidian vault.

## Why

When an agency runs multiple pods (architect-led units, each with multiple clients and projects), the operational state, knowledge, and orchestration need a single canonical home. La Oficina is that home — filesystem-first, harness-agnostic, agent-loadable in scoped modules.

## Install

```bash
# Hermes
hermes skills install fruteroclub/la-oficina

# Claude Code
# (TBD — depends on Claude Code skill install conventions)
```

## Use

```bash
# At your agent harness's workspace root:
oficina init                                    # Scaffold .obsidian/, .oficina/, pods/
oficina add-pod <name>                          # Create pods/<name>/.pod/ + office/
oficina add-workspace <ws> --pod <pod>          # Add an org workspace
oficina add-project <p> --pod <pod> --workspace <ws>
oficina add-workstream <w> --pod <pod> --workspace <ws> --project <p>

# Indexing + resolution:
oficina index [<path>]                          # Regenerate INDEX.md at any level
oficina resolve                                 # Name the current module + parent chain
oficina module-load <path>                      # Emit context bundle for an agent

# Wiki seeding:
oficina seed-wiki                               # Read agent harness config, write LLM-Wiki pages
```

## The hierarchy

```
<agent workspace>             ← agency, harness-defined (SOUL.md lives here)
├── .obsidian/                ← LLM-Wiki vault
├── .oficina/                 ← agency marker
└── pods/
    └── <pod>/
        ├── .pod/             ← pod marker + bootstrap + status
        └── office/
            └── workspaces/<ws>/
                └── projects/<p>/
                    └── workstreams/<w>/
```

See [docs/shape.md](docs/shape.md) for full doctrine.

## Documentation

- [docs/shape.md](docs/shape.md) — the 5-level hierarchy spec
- [docs/indexing.md](docs/indexing.md) — INDEX.md conventions; LLM walkability
- [docs/module-loading.md](docs/module-loading.md) — module-scoped context bundles for agents
- [docs/byoa.md](docs/byoa.md) — bring-your-own-agent pattern; lightweight access via GitHub URL

## Adapters

- [adapters/hermes/SETUP.md](adapters/hermes/SETUP.md)
- [adapters/claude-code/SETUP.md](adapters/claude-code/SETUP.md)
- [adapters/obsidian/SETUP.md](adapters/obsidian/SETUP.md)
- [adapters/generic/SETUP.md](adapters/generic/SETUP.md)

## Project status

This repo is being dogfooded inside its own pod at `~/oficina/pods/lab/office/workspaces/fruteroclub/projects/la-oficina/`. The lab pod's agent is the primary builder. See [PROJECT.md](PROJECT.md) and [TICK.md](TICK.md) for the development plan.

## Built by

[Frutero, LLC](https://frutero.club) — Operating System for AI-Native Agencies.
