# MEMORY — build-in-public-alpha-version

Durable facts that survive across sessions. Each entry has provenance.

## Facts

- **Dumbleclaw owns this workstream.** Runs on Hermes harness on EC2. Persona ≠ harness — Dumbleclaw is identity, Hermes is infrastructure. *Provenance: @mel, 2026-05-13.*
- **@mel is the Architect for the la-oficina pod.** Sign-off authority on architecture, scope, naming, license. Async review via GitHub PRs/commits unless a decision is blocking. *Provenance: handbook + repo structure, 2026-05-13.*
- **The local `~/oficina/` tree on @mel's machine is the canonical reference for what a hand-scaffolded agency looks like.** Every implemented script should produce output that matches this reference for the equivalent operation. Use `diff -r` to validate. *Provenance: NEXT-STEPS.md, HANDOFF.md.*
- **Scripts use `bash` + `yq` only** (per SKILL.md `prerequisites.commands`). Don't pull in other dependencies without updating SKILL.md and getting @mel sign-off. *Provenance: SKILL.md, 2026-05-13.*
- **All shell scripts use `set -euo pipefail`** and `eval`-safe output where another script consumes them. Resolve is the precedent. *Provenance: existing scripts/oficina-resolve.sh.*
- **Four-archetype invariant at every level:** identity file + INDEX.md + AGENTS.md + LOG.md. Templates in `templates/` are the source of truth for what each level scaffolds. *Provenance: docs/shape.md.*
- **`.oficina/`, `.pod/`, `.obsidian/` are the only markers.** Walk-up resolution uses them. *Provenance: docs/shape.md.*
- **Build-in-public is non-optional.** Every meaningful implementation step gets a pod-office journal entry. Skipping the journal = breaking the content pipeline that funds Frutero Agency. *Provenance: NEXT-STEPS.md "Build-in-public mandate".*
- **License is AGPL v3 + commercial.** Commercial license needed for billing-agency use; contact `hola@frutero.club`. Don't change. *Provenance: LICENSE, SKILL.md.*
- **Version: `0.1.0` is now tagged.** Future bumps follow semver-on-0.x.x convention. The `0.1.0-pre` label is retired. *Provenance: 2026-05-13 release commit `53b3672`.*

## Avoid

- Generic AI vocabulary in user-facing strings, error messages, or comments: "delve, robust, comprehensive, multifaceted." *Per frutero-direction docs.*
- Calling the local `pods/lab/.../projects/la-oficina/` directory "the skill repo" — it's "the la-oficina project." "The skill repository" refers to the published remote. *Per [[feedback-terminology]].*
- Reintroducing dropped names: godinOS, godinezai, internOS-the-product. La Oficina is the name. *Per NEXT-STEPS.md.*
- Implementing v0.2.0+ items (TASK-019, TASK-020) — alpha first.
- Mocking the live `~/oficina/` tree in tests. Use temp directories or test fixtures, never operate on the reference.
- Force pushes, hook-skipping (`--no-verify`), or destructive git operations on `origin/main` without @mel explicit approval.
