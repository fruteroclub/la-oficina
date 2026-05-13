---
name: build-in-public-alpha-version
owner: "@dumbleclaw"
supervisor: "@mel"
project: la-oficina
created: 2026-05-13
thread_id: null
status: active
priority: high
---

# Workstream: build-in-public-alpha-version

## Goal

Drive La Oficina v0.1.x from "minimum-viable + 7 stubs" to **a complete, polished, dogfooded alpha** — and document every step of that drive in public. This is the implementation workstream **owned by Dumbleclaw** (running on Hermes), supervised by @mel.

The product output is working scripts + tests + release hygiene. The narrative output is journal entries, decision logs, and bug stories that the content workstreams can adapt for public communication. Build and prove are the same motion.

## Scope

**Includes:**
- Implement the 7 stub scripts in `scripts/oficina-*.sh`: `init`, `add-pod`, `add-workspace`, `add-project`, `add-workstream`, `index`, `seed-wiki` (project TICK TASK-008..015 except 014).
- Land version-consistency guard + release workflow (TICK TASK-016).
- Stand up a tests directory and add coverage for the implemented commands (resolve, module-load, then each new command as it lands).
- Validate the implemented skill against the live `~/oficina/` agency tree on Dumbleclaw's EC2 server — every command must produce output that matches the hand-scaffolded reference structure.
- Capture **implementation learnings** (what worked, what didn't, what surprised) as durable entries in this workstream's MEMORY.md and DECISIONS.md.
- Capture **bugs found and fixed** as a stream of journal entries at the pod office level (`pods/lab/office/journal/YYYY-MM-DD.md`) plus this workstream's SESSIONS.md.
- Feed surface-ready material (stories, decisions, dev-blog-worthy moments) to the active content workstream(s) — currently `v0.1.0-launch-content`.
- Coordinate harness-specific adapter polish: finish `adapters/hermes/SETUP.md` if Hermes install path needs anything beyond the documented one-liner; verify `adapters/claude-code/SETUP.md` on a clean machine.

**Excludes:**
- **External marketing communications** (blog posts, threads, LinkedIn copy) — lives in content workstream(s), not here. This workstream produces source material; content workstream(s) shape it for surfaces.
- **Real client engagement work** — pods 1/2/3 client deliverables live in pod-scoped workstreams, not here.
- **Naming or scope debates about Frutero Agency/Club/LLC** — out of scope, not Dumbleclaw's call.
- **v0.2.0+ architecture decisions** — anything in TICK marked `v0.2.0` waits until alpha is closed (`registry.yaml`, scope-enforcement hardening, cross-pod handoff, brain layer).

## Success criteria

1. **All 9 documented `oficina` commands work end-to-end** — no stubs returning `exit 1`. `oficina help` reflects shipped reality with zero `(stub)` markers.
2. **`oficina init --force --path /tmp/test-agency` reproduces the hand-scaffolded `~/oficina/` reference structure** (validated via `diff -r` against the live tree). Documented drift is acceptable; undocumented drift is a bug.
3. **Tests directory exists** with at minimum a smoke-test runner that exercises every command and verifies expected exit codes / output shape.
4. **`.github/workflows/release.yml` lands** with the version-consistency guard (VERSION + SKILL.md version + CHANGELOG entry must match before tagging).
5. **At least 5 journal entries** at `pods/lab/office/journal/` documenting the implementation arc — bugs, surprises, decisions. These are source material for build-in-public content.
6. **At least 3 entries surfaced into the content workstream** via cross-reference (story → draft pipeline).
7. **Dumbleclaw operates a full pod-day end-to-end inside La Oficina** — loads pod context via `oficina module-load`, picks a task, executes, updates STATUS, writes a journal entry, closes the day. This is the dogfooding milestone.

## Operating discipline (Dumbleclaw, read this every session)

1. **Open.** Load this pod's context: `oficina module-load /path/to/this/workstream`. Read STATUS.md, the latest pod journal entry, and the relevant MEMORY facts.
2. **Pick.** Choose the next concrete task from project `TICK.md` in TASK-008..016 range (or follow-up bugs/polish discovered during work). Update its `status` to `in_progress` and note `claimed_by: @dumbleclaw`.
3. **Work.** Implement. Test against the live `~/oficina/` reference. If a non-trivial decision is needed, log it in DECISIONS.md before committing.
4. **Report.** Update STATUS.md (what's done, what's blocked, what's next), append a session entry to SESSIONS.md, write a pod-office journal entry (`pods/lab/office/journal/YYYY-MM-DD.md`, butter-os style: dense, thematic, factual).
5. **Surface.** If the day's work produced a story worth telling publicly (bug fix with a lesson, design decision with a tradeoff, "we tried X and it failed because Y"), add a pointer to it in this workstream's MEMORY.md or open a draft in `content/blog/dev/` and cross-reference in the content workstream's STATUS.
6. **Sync.** Commit with a clean message. Push to `origin/main`. Continuity lives in git.

## Stakeholders
See STAKEHOLDERS.md.

## Resources
See RESOURCES.md.

## Communications log
This workstream does not produce external comms directly. For tracking the build-in-public material it surfaces, see the active content workstream's `COMMS.md` (currently `workstreams/v0.1.0-launch-content/COMMS.md`).
