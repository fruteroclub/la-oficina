# DECISIONS — v0.1.0-launch-content

D-numbered decisions. Each entry: context, options, choice, rationale.

## D1 — Language strategy: ES canonical, EN companion (not literal translation)
- **Context:** First long-form piece needed a language decision. Frutero's primary audience is LATAM; secondary is international.
- **Options:** (a) Spanish only; (b) English only; (c) Bilingual with ES canonical + EN companion adapted; (d) Literal translation.
- **Choice:** (c) — ES canonical, EN adapted.
- **Rationale:** Honors LATAM primary positioning, keeps door open to international readers, avoids stilted literal translations.
- **Date:** 2026-05-13

## D2 — Name Dumbleclaw publicly + tease Hermes
- **Context:** Whether to name the MVP agent in the launch piece or keep it generic.
- **Options:** (a) Generic "our Operator agent"; (b) Name Dumbleclaw only; (c) Name Dumbleclaw + name Hermes harness.
- **Choice:** (c) — both named, persona/harness distinction explicit.
- **Rationale:** Maximum transparency from day one; sets up future harness-swap stories honestly; gives Dumbleclaw a clean public identity to inherit.
- **Date:** 2026-05-13

## D3 — Drafts live at project-level `content/blog/`, workstream tracks the work
- **Context:** Where blog drafts physically live in the la-oficina project tree.
- **Options:** (a) Inside the workstream's `docs/` or new `drafts/`; (b) At project-level `content/blog/`; (c) Inside the skill repo `/docs`.
- **Choice:** (b) with the workstream referencing via RESOURCES.md.
- **Rationale:** All published/publishable content has one home regardless of which workstream produced it. Workstreams track *work*, projects accumulate *artifacts*. Avoids drift when the next content workstream spins up.
- **Date:** 2026-05-13

## D4 — Workstream named `v0.1.0-launch-content`, not `build-in-public`
- **Context:** Naming the first content workstream.
- **Options:** (a) `build-in-public` (broad, durable); (b) `content-launch` (vague); (c) `v0.1.0-launch-content` (scoped to a release arc).
- **Choice:** (c).
- **Rationale:** "Build-in-public" is the practice, not a workstream — it recurs across many workstreams over time. Each release arc gets its own content workstream so the work has clear start/end and DECISIONS don't pile up indefinitely.
- **Date:** 2026-05-13
