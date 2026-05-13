---
workstream: build-in-public-alpha-version
updated: 2026-05-13
next_action: Dumbleclaw onboards on EC2, installs v0.1.0, validates resolve + module-load against the live `~/oficina/` tree, then picks TASK-008 (oficina-init.sh).
---

# STATUS

## Current state

Workstream just opened. La Oficina v0.1.0 is tagged and live at `github.com/fruteroclub/la-oficina/releases/tag/v0.1.0` — that's the foundation. Of the 9 documented commands, 2 work (`resolve`, `module-load`) and 7 are functional stubs awaiting implementation. The lab pod at `~/oficina/pods/lab/` is the dogfooding instance. Dumbleclaw operates this workstream from the EC2 server via Hermes.

## In progress

- (none yet — Dumbleclaw hasn't picked a task)

## Blocked

- **Dumbleclaw onboarding on EC2.** Awaiting confirmation that Hermes can install v0.1.0 (`hermes skills install fruteroclub/la-oficina` or git clone + symlink per `adapters/hermes/SETUP.md`) and that `oficina --version` returns `0.1.0` on the server.

## Next

In execution order:

1. **Onboard Dumbleclaw on EC2.** Verify `oficina resolve` and `oficina module-load` produce sensible output against the EC2-side agency tree (or a freshly-scaffolded one).
2. **TASK-008 — `oficina-init.sh`.** First scaffolding command. Will produce `~/oficina/.oficina/{config.yaml,pods.yaml}`, `.obsidian/`, `pods/.gitkeep`, agency-level four-archetype files. Validate by diffing against the existing hand-scaffolded `~/oficina/`.
3. **TASK-009 — `oficina-add-pod.sh`.** Once `init` lands, this is the natural next step — Dumbleclaw can scaffold its own next pod from CLI instead of by hand.
4. **TASK-010, 011, 012 — `add-workspace`, `add-project`, `add-workstream`.** Same pattern as add-pod; each ~30-60 lines of bash following the template structure.
5. **TASK-013 — `oficina-index.sh`.** Regenerate INDEX.md auto-from children.
6. **TASK-015 — `oficina-seed-wiki.sh`.** Lower priority — needs SOUL.md at agency root, harness-coupled.
7. **TASK-016 — release workflow + version-consistency guard.**
8. **Tests directory** — smoke tests for every command (priority: high once 2-3 commands implemented).

## Coordination

- @mel reviews PRs / commits via GitHub. Async by default.
- Surface implementation stories worth publishing → ping the content workstream's `COMMS.md`.
- If a decision needs @mel sign-off (versioning, breaking API change, license question), block on it explicitly here and escalate.
