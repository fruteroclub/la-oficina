# Shape — the 5-level hierarchy

The spec for La Oficina's directory model. Read this first.

## Levels

| Level | Identity file | Role | Owner |
|-------|---------------|------|-------|
| **Agency** | (harness-defined, e.g., SOUL.md) | The agent's workspace; container for pods | Agent harness |
| **Pod** | `.pod/POD.md` | One operating system unit (vault + orchestration) | La Oficina |
| **Office** | `OFFICE.md` | Orchestration layer; container for workspaces | La Oficina |
| **Workspace** | `WORKSPACE.md` | Organization unit (client / partner / internal) | La Oficina |
| **Project** | `PROJECT.md` | Coordination unit | La Oficina + intern-os |
| **Workstream** | `BRIEF.md` | Execution unit | intern-os |

## Canonical tree

```
<agent workspace>                              ← agency root
├── SOUL.md                                    ← agent harness identity (not touched by La Oficina)
├── <other harness bootstrap>                  ← not touched
├── .obsidian/                                 ← Obsidian vault config (LLM-Wiki marker)
├── .oficina/                                  ← La Oficina marker
│   ├── config.yaml                            ← conventions + version
│   └── pods.yaml                              ← machine-readable pod registry
├── README.md                                  ← agency one-pager
├── INDEX.md                                   ← agency navigation
├── AGENTS.md                                  ← agency-level agent doctrine
├── LOG.md                                     ← agency structural events (append-only)
├── <LLM-Wiki content>                         ← markdown files; indexed by Obsidian; spans agency
└── pods/
    └── <pod-name>/
        ├── .pod/
        │   ├── POD.md                         ← pod identity
        │   ├── BOOTSTRAP.md                   ← agent context-loading instructions
        │   └── STATUS.md                      ← internOS status at pod level
        ├── INDEX.md
        ├── AGENTS.md
        ├── LOG.md
        └── office/
            ├── OFFICE.md
            ├── INDEX.md
            ├── AGENTS.md
            ├── LOG.md
            ├── CLAUDE.md                      ← optional Claude Code companion
            ├── journal/
            │   ├── INDEX.md
            │   └── YYYY-MM-DD.md              ← daily shift-handoff narrative
            └── workspaces/
                └── <workspace-name>/
                    ├── WORKSPACE.md
                    ├── INDEX.md
                    ├── AGENTS.md
                    ├── LOG.md
                    └── projects/
                        └── <project-name>/
                            ├── PROJECT.md
                            ├── INDEX.md
                            ├── AGENTS.md
                            ├── TICK.md        ← tick.md task file
                            └── workstreams/
                                └── <workstream-name>/
                                    ├── BRIEF.md
                                    ├── STATUS.md
                                    ├── MEMORY.md
                                    ├── DECISIONS.md
                                    ├── STAKEHOLDERS.md
                                    ├── RESOURCES.md
                                    ├── SESSIONS.md
                                    └── docs/
```

## Markers

Three filesystem markers identify what La Oficina is operating on:

| Marker | Where | Meaning |
|--------|-------|---------|
| `.obsidian/` | Agency root | Tree is an Obsidian vault (LLM-Wiki active) |
| `.oficina/` | Agency root | La Oficina is installed at this agency |
| `.pod/` | Pod root | Directory is a La Oficina pod |

Walk-up resolution uses these markers:

- `oficina resolve` walks up from cwd; the first `.pod/` it finds names the pod; continues walking to first `.oficina/` for agency context.
- An agent at any level inside a pod can determine its module (pod / office / workspace / project / workstream) by checking for identity files (`POD.md` / `OFFICE.md` / `WORKSPACE.md` / `PROJECT.md` / `BRIEF.md`) at successive parent levels.

## Universal level invariants

Every directory La Oficina manages carries the **four-archetype set**:

1. **Identity file** — what this level is (POD.md / OFFICE.md / WORKSPACE.md / PROJECT.md / BRIEF.md)
2. **INDEX.md** — navigation hub with a `children` table
3. **AGENTS.md** — agent doctrine specific to this level
4. **LOG.md** — append-only structural events log

Plus the level-specific subdirectories (e.g., `workspaces/` under office, `projects/` under workspace, `workstreams/` under project).

## Why the marker pattern (and not embedded fields)

Markers (`.obsidian/`, `.oficina/`, `.pod/`) are filesystem-grep-able with no parsing. An agent can detect "am I in a pod?" with one `[ -d .pod ]` test, no YAML reader needed. This keeps the protocol harness-agnostic and shell-script-friendly.

## What the agency root is

The agency root is **whatever the agent harness defines as the agent's workspace**. La Oficina does not introduce its own concept of an agency — it adds to whatever the harness gave you. Examples:

- Hermes: `~/.hermes/workspace/` (or similar; verify per Hermes version)
- Claude Code: a cwd-bound directory where the user starts a session
- OpenClaw: whatever OpenClaw defines as agent root
- Generic (no harness yet): any directory the user picks (`oficina init` will use `--path` or default to `~/oficina/`)

## What stays harness-specific

- `SOUL.md` and any harness bootstrap files at agency root → owned by the harness
- Harness-specific session state, caches, logs → not in La Oficina's scope
- Wiki seeding (`oficina seed-wiki`) reads harness config files but writes LLM-Wiki pages in La Oficina format

## Future levels

v0.1.0 stops at workstream (matching intern-os v0.4.1). Possible future extensions:

- **Sub-workstreams** — hand-off branches within a workstream. Already supported by intern-os v0.4.0 isolated-handoff doctrine; La Oficina inherits it.
- **Cross-pod handoff** — one pod's office hands off to another. Deferred to v0.2.0+.
- **Brain layer** above wiki — explicit Karpathy-style LLM-wiki tier with promotion rules. Deferred; v0.1.0 treats the whole vault as wiki.
