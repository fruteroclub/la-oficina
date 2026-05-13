# Claude Code adapter

How to install and use La Oficina with Claude Code.

## Install

Claude Code does not have a centralized skill installer — skills are plain directories under `~/.claude/skills/`. Install La Oficina by cloning the project somewhere durable, then symlinking the skill manifest and the CLI.

```bash
# 1. Clone the project somewhere stable
git clone https://github.com/fruteroclub/la-oficina.git ~/src/la-oficina

# 2. Make Claude Code discover the skill
ln -s ~/src/la-oficina ~/.claude/skills/la-oficina

# 3. Make the `oficina` command available on PATH
mkdir -p ~/.local/bin
ln -s ~/src/la-oficina/bin/oficina ~/.local/bin/oficina

# 4. Confirm
oficina --version           # → oficina 0.1.0
oficina help                # → command list
```

Using symlinks (rather than copying) means `git pull` in the project directory upgrades both the skill manifest and the CLI atomically.

If `~/.local/bin` isn't already on your `PATH`, add this to your shell rc:

```bash
export PATH="$HOME/.local/bin:$PATH"
```

## Configure

Claude Code resolves the current pod / workspace / project / workstream via cwd — the working directory when starting the session. `oficina resolve` walks up from cwd and identifies the module (`agency`, `pod`, `office`, `workspace`, `project`, `workstream`) plus the full parent chain.

From any directory inside a managed agency:

```bash
oficina resolve              # KEY=value output, eval-safe
oficina module-load .        # full scoped context bundle (markdown)
```

## SessionStart context loading

Until a SessionStart hook ships, the recommended pattern is to wire context loading via the CLAUDE.md companion at the office level (see below). The agent reads CLAUDE.md early, sees the `oficina module-load` instruction, and runs it before doing other work.

A future SessionStart hook will:

1. Detect if cwd is inside a La Oficina-managed tree (`oficina resolve` exits 0).
2. Run `oficina module-load $PWD` to produce the scoped context bundle.
3. Inject the bundle as initial session context.

When that lands, it goes into this adapter as a `hook` definition.

## CLAUDE.md companion

Each office-level directory ships an optional `CLAUDE.md` — a thin pointer to `AGENTS.md` plus a load instruction. Claude Code reads this file early in a session. See `pods/<pod>/office/CLAUDE.md` in the lab pod for the reference shape:

```markdown
# CLAUDE.md — office level (<pod>)

Thin pointer for Claude Code. Canonical doctrine is `AGENTS.md`.

## Essentials

1. Read `AGENTS.md` first.
2. Use `oficina resolve` to identify current module; `oficina module-load <path>` to get scoped context.
3. Office orchestration layer — read `OFFICE.md` for workspaces registry.
4. Daily narrative lives in `journal/YYYY-MM-DD.md` (butter-os style: dense, thematic, silence-when-nothing).
5. Write scope: this office and below per AGENTS.md. Pod-level (`.pod/`) is off-limits.
```

CLAUDE.md is optional at other levels but recommended for any directory where an agent will start sessions.

## Skill routing (future)

When the user invokes `/oficina`-prefixed commands inside Claude Code, the dispatcher at `bin/oficina` is the entry point. Slash-command wiring for Claude Code's skill router is not yet specified — see `bin/oficina` to invoke directly.

## Updating

```bash
cd ~/src/la-oficina
git pull
```

Symlinks resolve through to the new code automatically.

## Uninstall

```bash
rm ~/.claude/skills/la-oficina
rm ~/.local/bin/oficina
rm -rf ~/src/la-oficina       # if you want the source gone too
```
