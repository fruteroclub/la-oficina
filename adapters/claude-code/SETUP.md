# Claude Code adapter

How to install and use La Oficina with Claude Code.

## Install

```bash
# TODO: verify Claude Code skill install command
# Likely: copy this repo to ~/.claude/skills/la-oficina/
```

## Configure

Claude Code resolves the current pod / workspace / project / workstream via cwd (the user's working directory when starting the session). The `oficina resolve` command handles the walk-up.

## SessionStart hook

A future SessionStart hook (TODO) will:

1. Detect if cwd is inside a La Oficina-managed tree
2. Run `oficina resolve` to identify the module
3. Inject the scoped context bundle into session start

For now, manually run `oficina module-load .` and paste the output as initial context.

## Skill routing

When the user invokes `/oficina`-prefixed commands (TBD), Claude Code routes to this skill's scripts.

## CLAUDE.md companion

Each office-level directory ships an optional `CLAUDE.md` (thin pointer to AGENTS.md). Claude Code reads this first if present.
