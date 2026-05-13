---
name: la-oficina
description: "Operating System for AI-Native Agencies — scaffolds the hierarchy (agency → pod → office → workspaces → projects → workstreams), seeds LLM-Wiki, supports module-scoped agent loading. Works with any agent harness."
version: 0.1.0
repo: https://github.com/fruteroclub/la-oficina
license: AGPL-3.0
license_commercial: "Commercial license required for commercial use. Contact hola@frutero.club"
prerequisites:
  commands: [bash, yq]
  recommended_commands: [obsidian, tick-md]
metadata:
  hermes:
    tags: [Agency, Pod, Office, Orchestration, AI-Native]
    related_skills: [intern-os]
    config:
      - key: oficina.agency_root
        description: Path to the agency root (the agent workspace where SOUL.md lives)
        default: "$HOME/oficina"
        prompt: Agency root directory
---

# La Oficina — Operating System for AI-Native Agencies

A skill that converts an agent harness's workspace into a full agency operating system. Adds the Obsidian vault (LLM-Wiki), the agency marker, and the pod / office / workspace / project / workstream orchestration tree.

## Quick reference

```
<agent workspace>             ← agency (harness-defined; SOUL.md lives here)
├── .obsidian/                ← La Oficina creates: vault
├── .oficina/                 ← La Oficina creates: agency marker
└── pods/<pod>/
    ├── .pod/                 ← pod marker + bootstrap + status
    └── office/workspaces/<ws>/projects/<p>/workstreams/<w>/
```

## Entry points

- `oficina init` — at agency root, scaffold vault + agency marker + `pods/` container
- `oficina add-pod <name>` — scaffold a new pod
- `oficina add-{workspace,project,workstream} <name> [--pod ...]`
- `oficina index [<path>]` — regenerate INDEX.md trees
- `oficina resolve` — identify current module + parent chain
- `oficina module-load <path>` — emit context bundle for an agent

## Doctrine

- 5-level hierarchy with consistent INDEX.md + AGENTS.md + LOG.md at every level
- Pod root contains everything (vault + orchestration) — one pod = one operating system unit
- Module-scoped agent loading: an agent connects to one workspace / project / workstream and sees only that subtree (plus identity-only orientation for parents)
- Bring-your-own-agent: lightweight instructions-based scope contract, GitHub-URL loadable

See `docs/` for full doctrine.

## Status

v0.1.0. The lab pod at `~/oficina/pods/lab/` is the first dogfooding instance. Two commands are fully implemented (`resolve`, `module-load`) — enough for Hermes / Dumbleclaw to install the skill and operate any pre-scaffolded pod. The remaining 7 commands (`init`, `add-pod`, `add-workspace`, `add-project`, `add-workstream`, `index`, `seed-wiki`) are functional stubs that print `TODO: implement` and `exit 1`; they ship as the v0.1.0 implementation backlog (TICK.md TASK-008..015).
