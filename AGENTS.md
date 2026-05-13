# AGENTS.md — project level (la-oficina)

Doctrine for any agent operating in the la-oficina project.

## What this level is

The project that develops the La Oficina skill itself. Dogfooded — the agent's workspace IS scaffolded by the very skill being built here.

## Scope

- **Read:** entire project subtree.
- **Write:**
  - Skill source files (docs/, schemas/, templates/, scripts/, adapters/, README/LICENSE/SKILL/VERSION/CHANGELOG) — full write, commit to repo.
  - Project metadata (PROJECT.md, this AGENTS.md, INDEX.md, TICK.md) — full write but consider committing to repo separately from skill source.
  - Workstream files (under `workstreams/<ws>/`) per intern-os v0.4.1 doctrine.
- **Forbidden:** writes outside this project directory.

## Build priority (from TICK.md)

The agent's first job is implementing scripts in this priority order:
1. `oficina-resolve.sh` — foundation
2. `oficina-init.sh` — agency scaffold (must reproduce what's at `~/oficina/`)
3. `oficina-add-pod.sh`
4. `oficina-add-workspace.sh`, `add-project.sh`, `add-workstream.sh` (similar pattern)
5. `oficina-module-load.sh` — agent-facing API for BYOA
6. `oficina-index.sh` — INDEX regeneration
7. `oficina-seed-wiki.sh` — depends on harness landing first

## Loading

1. `PROJECT.md` — project identity + scope
2. `TICK.md` — active task list
3. `README.md` — what the skill is
4. `docs/shape.md` — the hierarchy spec
5. `docs/module-loading.md` — agent contract
6. `docs/byoa.md` — BYOA protocol

## Contribution conventions

- Conventional commits (`feat(scripts): implement oficina-resolve.sh`)
- One script per PR when possible
- Add tests under `tests/` for each script (TODO: spec test framework — bats? plain bash?)
- Update CHANGELOG.md when shipping a meaningful change
