# RESOURCES — build-in-public-alpha-version

Pointers to resources Dumbleclaw needs in the course of operating this workstream.
Each entry carries the 5-field schema: `kind`, `canonical_path`, `owner`, `last_verified`, `why_it_matters`.

## Resources

### Implementation reference

- **kind:** doc (authoritative)
- **canonical_path:** `pods/lab/office/workspaces/fruteroclub/projects/la-oficina/docs/shape.md`
- **owner:** @mel
- **last_verified:** 2026-05-13
- **why_it_matters:** The 5-level hierarchy spec. Every script implementation must match it. Read first if a level/marker question comes up.

- **kind:** doc (authoritative)
- **canonical_path:** `pods/lab/office/workspaces/fruteroclub/projects/la-oficina/docs/indexing.md`
- **owner:** @mel
- **last_verified:** 2026-05-13
- **why_it_matters:** INDEX.md conventions. Drives `oficina-index.sh` (TASK-013).

- **kind:** doc (authoritative)
- **canonical_path:** `pods/lab/office/workspaces/fruteroclub/projects/la-oficina/docs/module-loading.md`
- **owner:** @mel
- **last_verified:** 2026-05-13
- **why_it_matters:** Bundle contract for `oficina-module-load.sh`. Already implemented but consult when revising children-depth >1 support.

- **kind:** doc (authoritative)
- **canonical_path:** `pods/lab/office/workspaces/fruteroclub/projects/la-oficina/docs/byoa.md`
- **owner:** @mel
- **last_verified:** 2026-05-13
- **why_it_matters:** BYOA scope contract. Affects how `oficina-module-load` advertises read/write/forbidden scope.

### Validation reference

- **kind:** live-tree (the ground truth for v0.1.x)
- **canonical_path:** `~/oficina/` (local to @mel's machine; replicate on EC2 as needed)
- **owner:** @mel
- **last_verified:** 2026-05-13
- **why_it_matters:** Hand-scaffolded reference. Every implemented script must produce output that matches the equivalent subtree here. Validate via `diff -r`.

### Templates (what scripts should produce)

- **kind:** templates directory
- **canonical_path:** `pods/lab/office/workspaces/fruteroclub/projects/la-oficina/templates/`
- **owner:** @mel
- **last_verified:** 2026-05-13
- **why_it_matters:** `{{VAR}}`-substitution-ready scaffolds for agency-init, pod, workspace, project, workstream. Each `add-*` script copies from here.

### Schemas

- **kind:** schemas directory
- **canonical_path:** `pods/lab/office/workspaces/fruteroclub/projects/la-oficina/schemas/`
- **owner:** @mel
- **last_verified:** 2026-05-13
- **why_it_matters:** YAML schemas for each level. Frontmatter validation when reading identity files.

### Task list

- **kind:** tick file
- **canonical_path:** `pods/lab/office/workspaces/fruteroclub/projects/la-oficina/TICK.md`
- **owner:** @mel
- **last_verified:** 2026-05-13
- **why_it_matters:** Source of truth for which tasks remain (TASK-008..015 implementation backlog, TASK-016 release workflow, TASK-017-018 dogfooding milestones).

### Already-implemented reference

- **kind:** scripts (in-repo, shipped in v0.1.0)
- **canonical_path:** `pods/lab/office/workspaces/fruteroclub/projects/la-oficina/scripts/oficina-resolve.sh`, `oficina-module-load.sh`, `bin/oficina`
- **owner:** @dumbleclaw
- **last_verified:** 2026-05-13
- **why_it_matters:** Style reference for the unimplemented scripts. Match conventions: `set -euo pipefail`, eval-safe output, `--help` parsing, exit codes (0 / 1 / 2).

### Companion workstream (where stories from here surface as content)

- **kind:** workstream
- **canonical_path:** `pods/lab/office/workspaces/fruteroclub/projects/la-oficina/workstreams/v0.1.0-launch-content/`
- **owner:** @mel
- **last_verified:** 2026-05-13
- **why_it_matters:** The content workstream that adapts implementation source material for external comms. When this workstream produces a story worth telling, drop a pointer in that workstream's STATUS.md or COMMS.md.

### Published artifact

- **kind:** repo
- **canonical_path:** https://github.com/fruteroclub/la-oficina
- **owner:** @mel
- **last_verified:** 2026-05-13
- **why_it_matters:** Public-facing remote. Tag `v0.1.0` is the current release. Push every commit; build-in-public means visible-in-public.

- **kind:** release
- **canonical_path:** https://github.com/fruteroclub/la-oficina/releases/tag/v0.1.0
- **owner:** @mel
- **last_verified:** 2026-05-13
- **why_it_matters:** First taggable release. Reference URL when external content links to "alpha v0.1.0".
