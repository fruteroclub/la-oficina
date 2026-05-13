# Module loading — scoped context bundles for agents

The mechanism by which an agent (any harness) plugs into one La Oficina module and receives only the context for that scope.

## The contract

An agent declares a target module by its path. La Oficina emits a **context bundle** — a single concatenated markdown document — containing:

1. **Orientation:** identity files walked up from the target (POD → OFFICE → WORKSPACE → PROJECT → BRIEF, as applicable). These tell the agent where it sits.
2. **AGENTS.md + INDEX.md at the target level.** Doctrine and child registry.
3. **Identity files of immediate children** (one level down). Enough for the agent to see what's available but not the full subtree at once.
4. **Full subtree below the target** is NOT in the bundle — the agent reads files directly from its read-scope. The bundle is the init context; subtree reads happen on demand.

## CLI

```bash
oficina module-load <path>
```

`<path>` is any directory inside a pod. The script:

1. Walks up from `<path>` collecting identity files at each level (`.pod/POD.md`, then `office/OFFICE.md`, then walking down into the target's parent chain).
2. Determines the target level by checking which identity file lives at `<path>`.
3. Reads `<path>/AGENTS.md`, `<path>/INDEX.md`, and the identity file at `<path>`.
4. Reads identity files of immediate children referenced in `INDEX.md`.
5. Concatenates with H1 separators and `<!-- bundle: <section> -->` markers.
6. Writes to stdout.

## Bundle shape

```markdown
<!-- bundle: orientation -->

# Pod: <pod-name>
<contents of .pod/POD.md>

# Office: <office-name>
<contents of office/OFFICE.md>

# Workspace: <ws-name>
<contents of workspaces/<ws>/WORKSPACE.md>

<!-- bundle: target -->

# Project: <project-name>
<contents of projects/<p>/PROJECT.md>
<contents of projects/<p>/AGENTS.md>
<contents of projects/<p>/INDEX.md>

<!-- bundle: children -->

## Workstream: <ws1-name>
<contents of workstreams/<ws1>/BRIEF.md>

## Workstream: <ws2-name>
<contents of workstreams/<ws2>/BRIEF.md>

<!-- bundle: scope -->

Read scope: <target>/**
Write scope: per AGENTS.md at <target>
Forbidden: anything outside <target>/

Loading complete. Next: read children identity files on demand, or BRIEF.md
of a target workstream to begin execution.
```

## Scope enforcement (v0.1.0)

**Honor system.** The bundle includes an explicit scope statement at the bottom. Agents that respect AGENTS.md doctrine stay in scope; agents that don't break the protocol.

Future versions may add filesystem ACLs, symlink jails, or container-based isolation. v0.1.0 keeps it simple.

## Composability

`oficina module-load` is idempotent and side-effect-free. Run it any number of times. The bundle is fresh-read each time.

For very large subtrees, the bundle's "children" section can be parameterized:

```bash
oficina module-load <path> --children-depth 0   # no children, target only
oficina module-load <path> --children-depth 1   # identity files of immediate children (default)
oficina module-load <path> --children-depth 2   # plus grandchildren identity files
```

## Use cases

- **Agent onboarding to a workstream:** `oficina module-load <ws-path>` returns the workstream BRIEF + parent chain. Agent reads, begins.
- **Cross-pod consultant (BYOA):** consultant's agent is given a path to a workspace it has access to. Loads bundle. Sees only that workspace and its parent identities. Higher / sibling work is opaque.
- **Periodic context refresh:** long-running agent re-loads bundle every N hours to catch drift in parent identity / doctrine without scanning the whole subtree.

## Cross-reference

- INDEX shape: [indexing.md](indexing.md)
- BYOA contract: [byoa.md](byoa.md)
