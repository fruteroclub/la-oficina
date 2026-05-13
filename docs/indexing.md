# Indexing — INDEX.md conventions

Every level in the La Oficina hierarchy carries an `INDEX.md`. Consistent shape so LLMs can walk the tree by reading INDEX.md at any node and following children.

## Standard INDEX.md shape

```markdown
# <Level type> Index — <name>

<one-line description of this level>

## Children

| <Child type> | Status | Purpose |
|--------------|--------|---------|
| [<child-name>](<path>/<child-identity-file>) | <status> | <one-line purpose> |

## <Level>-level files

- [<identity file>](<identity-file>) — identity
- [AGENTS.md](AGENTS.md) — agent doctrine
- [LOG.md](LOG.md) — structural events
- (additional level-specific files)
```

## Per-level specifics

### Agency INDEX

- Children = pods (each child links to `pods/<name>/.pod/POD.md`)
- Files = README.md, AGENTS.md, LOG.md, .oficina/config.yaml, .oficina/pods.yaml

### Pod INDEX

- Sections:
  - "Pod-level" — links to `.pod/POD.md`, `.pod/BOOTSTRAP.md`, `.pod/STATUS.md`, AGENTS.md, LOG.md
  - "Office (orchestration)" — links to `office/OFFICE.md`, `office/INDEX.md`

### Office INDEX

- Children = workspaces (each child links to `workspaces/<name>/WORKSPACE.md`)
- Files = OFFICE.md, AGENTS.md, LOG.md, CLAUDE.md, journal/

### Workspace INDEX

- Children = projects (each child links to `projects/<name>/PROJECT.md`)
- Files = WORKSPACE.md, AGENTS.md, LOG.md

### Project INDEX

- Children = workstreams (each child links to `workstreams/<name>/BRIEF.md`)
- Files = PROJECT.md, AGENTS.md, TICK.md, LOG.md (project LOG optional, may be omitted if redundant with TICK)

### Workstream INDEX

- Files = BRIEF.md, STATUS.md, MEMORY.md, DECISIONS.md, STAKEHOLDERS.md, RESOURCES.md, SESSIONS.md, docs/

## Auto-regeneration

`oficina index [<path>]` regenerates INDEX.md at the given level (or all levels if no path given). It:

1. Reads the level's identity file for `name` / `description`
2. Reads each child's identity file for `name` / `status` / `purpose`
3. Writes the standard shape

Manual edits to INDEX.md are clobbered by `oficina index`. If a level needs hand-curated content, put it in a sibling file (e.g., `OVERVIEW.md`) and link to it from INDEX.md so the link survives regeneration.

## LLM walkability

The INDEX.md shape is designed so an LLM with one file at a time can:

1. Read INDEX.md at the target level → see all children + their identities at-a-glance.
2. Pick a child of interest → follow link to identity file.
3. Read identity file → understand scope.
4. Drop into that child's INDEX.md → repeat.

No directory listings needed. No `ls` calls. The vault graph (Obsidian) sees these links too, so the wiki layer mirrors the orchestration tree automatically.

## Frontmatter (optional, recommended)

INDEX.md may carry frontmatter for machine indexing:

```yaml
---
kind: office  # one of: agency, pod, office, workspace, project, workstream
name: lab-office
parent: lab
children_count: 1
updated: 2026-05-13
---
```

Tools can query this without parsing the markdown body.
