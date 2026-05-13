# Obsidian adapter

How La Oficina integrates with Obsidian as the LLM-Wiki layer.

## Vault root

The agency root becomes an Obsidian vault when `oficina init` creates `.obsidian/`. The vault sees every `.md` file in the entire tree (pods, offices, workspaces, projects, workstreams).

## Minimal default

`oficina init` ships a minimal `.obsidian/` (empty `app.json` and `appearance.json`). Customize freely:

- Install your usual Obsidian plugins
- Adjust themes
- Configure graph view to highlight pods (e.g., color-code by `pods_touched` frontmatter)

Your customizations live in `.obsidian/` and are version-controlled if the agency root is a git repo.

## Wiki layer

La Oficina treats the entire vault as one knowledge graph. Wiki content can live anywhere:

- Agency-root `.md` files for cross-pod knowledge
- Pod-root `.md` files for pod-specific knowledge
- Workspace / project / workstream `.md` files (the operational artifacts are also wiki pages)

Obsidian indexes them all. Use `[[wikilinks]]` to cross-reference.

## Seeding from harness config

`oficina seed-wiki` reads harness config files (SOUL.md, harness bootstrap) and creates initial wiki pages with frontmatter + bidirectional links. After seeding, open the graph view to see the agent's identity surfaced as a node.

## Future enhancements

- Templates plugin integration (use Obsidian templates that match `templates/` in this skill)
- Dataview queries for cross-pod status (`oficina office status` data surfaced in vault)
- Custom graph filters per pod / workspace
