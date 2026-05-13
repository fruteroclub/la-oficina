# Bring Your Own Agent (BYOA)

Any pod member, stakeholder, contributor, or partner should be able to plug their own agent harness into a La Oficina module and operate within a scoped boundary. This is the protocol.

## Why

Agencies have multiple humans, each with their own agent harness preferences. The Architect runs Claude Code + Hermes. A senior dev uses Cursor. A designer uses Claude Code with different skills. A client's reviewer uses ChatGPT desktop. Each should be able to load relevant scope without installing the agency's primary agent.

## The contract

Every La Oficina-managed AGENTS.md ships a standard contract section. Any harness that respects markdown can read this and operate within bounds.

### Standard AGENTS.md contract template

```markdown
## Scope (BYOA contract)

- **Read:** <what this level + subtree grants>
- **Write:** <what's modifiable at this level>
- **Forbidden:** <what's off-limits>

## How to load this context

1. Read this AGENTS.md
2. Read the identity file at this level (POD.md / OFFICE.md / WORKSPACE.md / PROJECT.md / BRIEF.md)
3. Read INDEX.md to see children
4. For full bundle: run `oficina module-load <path>` or load from URL (below)
5. Walk children as needed

## Context URL

- **Raw markdown bundle (suitable for ChatGPT, Claude.ai upload):**
  https://raw.githubusercontent.com/<org>/<repo>/<sha>/<path>/AGENTS.md
- **Browse the tree:**
  https://github.com/<org>/<repo>/tree/<sha>/<path>

## Contributing back

- Fork the repo containing this module (typically a project-level repo)
- Branch from main
- Make changes scoped to this module's subtree
- Open PR with scope summary in the description
- Other subtrees are out of scope for your access level — keep your diff narrow
```

## How an external agent connects

### Step 1 — Get the URL

The pod owner shares a GitHub URL pointing to the target module:

```
https://github.com/fruteroclub/<repo>/tree/main/path/to/module
```

The URL grants read access (public or fork-with-permission for private). For private repos, the contributor needs read permission on the repo.

### Step 2 — Load context

Two options:

**Option A — Clone and run La Oficina locally:**
```bash
git clone https://github.com/fruteroclub/<repo>.git
cd <repo>/path/to/module
oficina module-load .
```

**Option B — URL-only (no install):**
```bash
# Fetch the AGENTS.md directly
curl -s https://raw.githubusercontent.com/fruteroclub/<repo>/main/path/to/module/AGENTS.md
```

Then feed the bundle / AGENTS.md to your agent as system context.

### Step 3 — Operate

The agent now knows:
- Where this module sits in the tree (orientation via parent identity files)
- What's read scope (the module subtree)
- What's write scope (per the contract section)
- What's forbidden (anything else)

### Step 4 — Contribute

If the agent produces changes, the contributor opens a PR. The PR is reviewed by the pod owner. Approved → merged. Rejected → discussion in the PR.

## Lightweight security (v0.1.0)

Instructions-based, not filesystem-enforced. The trust model is:

- **The contract is documented.** AGENTS.md tells the agent what's allowed.
- **The agent is expected to honor it.** Agents that ignore the contract are operating outside the protocol; pod owner can reject their PRs and revoke access.
- **Revocation:** remove the contributor's repo permissions. Their next pull fails. Their agent loses access.
- **No enforcement at the filesystem.** v0.1.0 does not chroot, sandbox, or ACL.

For higher-trust scenarios (sensitive client data, financial systems, etc.), don't use v0.1.0 BYOA. Wait for v0.2.0+ which may include filesystem-level enforcement.

## What's not covered

- **Cross-pod contribution.** v0.1.0 assumes one repo per scope. Cross-pod work goes through the pod owners directly.
- **Real-time collaboration.** BYOA is async via PR. For real-time multi-agent work in the same module, use a single agent harness with multiple "personas."
- **Sensitive data filtering.** AGENTS.md can declare scope but cannot strip secrets from files. Don't put secrets in pod files; use env vars or external secret stores.

## Examples

### Example 1: Designer joins a project

1. Pod owner shares URL: `github.com/fruteroclub/la-oficina/tree/main/templates/`
2. Designer's agent reads `templates/AGENTS.md` (TODO: doesn't exist yet — sub-AGENTS.md at the templates level is a v0.1.0 enhancement)
3. Agent operates on template files only
4. Designer commits to a branch, opens PR
5. Pod owner reviews and merges

### Example 2: Client reviewer audits a workstream

1. Client gets URL: `github.com/fruteroclub/<client-engagement-repo>/tree/main/workstreams/qa-handoff/`
2. Client's agent fetches `BRIEF.md` + `STATUS.md` + `DECISIONS.md`
3. Agent answers client's questions ("is X done?", "what was decided on Y?")
4. No writes happen — client is in read-only mode
5. Client asks pod owner to make changes if needed

## See also

- [shape.md](shape.md) — directory shape and identity files
- [indexing.md](indexing.md) — INDEX.md conventions
- [module-loading.md](module-loading.md) — `oficina module-load` mechanics
