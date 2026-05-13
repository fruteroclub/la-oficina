# AGENTS.md — agency level

Doctrine for agents operating at the agency root. Canonical, harness-agnostic.

## Scope
- **Read:** entire agency tree
- **Write:** agency-scoped files (this AGENTS.md, INDEX.md, LOG.md, README.md, `.oficina/`)
- **Forbidden:** pod-scoped writes go through pod-level AGENTS

## Principles
1. One source of truth per artifact
2. AGENTS.md canonical at every level; CLAUDE.md optional Claude Code companion
3. LLM-Wiki spans the entire agency vault
4. Orchestration is pod-scoped

See the la-oficina skill for full BYOA contract.
