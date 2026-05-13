# La Oficina

> **Operating System for AI-Native Agencies.** Scaffolds the hierarchy that lets an agent (or a team of agents) operate an agency, pods, organizations, and engagements from one filesystem-canonical, harness-agnostic shape.

**Status:** v0.1.0 (alpha) — [release](https://github.com/fruteroclub/la-oficina/releases/tag/v0.1.0). Two commands implemented (`resolve`, `module-load`); seven ship as functional stubs with a clear backlog in [TICK.md](TICK.md).

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

### Hermes

```bash
hermes skills install fruteroclub/la-oficina
```

See [adapters/hermes/SETUP.md](adapters/hermes/SETUP.md) for full details.

### Claude Code

Claude Code skills are plain directories under `~/.claude/skills/`. Clone the project, then symlink the skill manifest and CLI:

```bash
git clone https://github.com/fruteroclub/la-oficina.git ~/src/la-oficina
ln -s ~/src/la-oficina ~/.claude/skills/la-oficina
mkdir -p ~/.local/bin
ln -s ~/src/la-oficina/bin/oficina ~/.local/bin/oficina
oficina --version   # → oficina 0.1.0
```

Make sure `~/.local/bin` is on your `PATH`. See [adapters/claude-code/SETUP.md](adapters/claude-code/SETUP.md) for configuration, update, and uninstall steps.

### Other harnesses

See [adapters/](adapters/) for Obsidian and generic patterns.

## Use

### Working in v0.1.0

```bash
oficina help                                    # Command list (marks stubs)
oficina version                                 # → 0.1.0
oficina resolve [<path>]                        # Identify current module + parent chain (eval-safe KEY=value)
oficina module-load <path> [--children-depth 0|1]
                                                # Emit scoped context bundle for an agent
```

These two are enough for any harness (Hermes, Claude Code, BYOA) to install La Oficina and operate **pre-scaffolded** pods — Dumbleclaw's daily workflow runs on them.

### In flight (functional stubs in v0.1.0)

The following commands print `TODO: implement` and `exit 1` in v0.1.0. They ship as their full CLI surface so harnesses can plan integration; implementations land in v0.1.x point releases. See TICK.md TASK-008..015.

```bash
oficina init                                    # Scaffold a new agency root
oficina add-pod <name>                          # Scaffold a pod
oficina add-workspace <ws> --pod <pod>
oficina add-project <p> --pod <pod> --workspace <ws>
oficina add-workstream <w> --pod <pod> --workspace <ws> --project <p>
oficina index [<path>]                          # Regenerate INDEX.md at any level
oficina seed-wiki                               # Seed LLM-Wiki from harness configs
```

Pre-scaffolding by hand follows the structure shown in [docs/shape.md](docs/shape.md) and the layouts in [templates/](templates/).

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

**v0.1.0 is tagged and released.** This project is dogfooded inside its own pod at `~/oficina/pods/lab/office/workspaces/fruteroclub/projects/la-oficina/`. Implementation work continues in the open inside the [`build-in-public-alpha-version`](workstreams/build-in-public-alpha-version/BRIEF.md) workstream — Dumbleclaw drives, @mel supervises. See [PROJECT.md](PROJECT.md) for scope and [TICK.md](TICK.md) for the backlog.

## Built by

[Frutero, LLC](https://frutero.club) — Operating System for AI-Native Agencies.
