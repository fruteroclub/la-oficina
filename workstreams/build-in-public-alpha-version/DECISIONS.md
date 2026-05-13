# DECISIONS — build-in-public-alpha-version

D-numbered decisions. Each entry: context, options, choice, rationale.

## D1 — Dumbleclaw owns this workstream; @mel is Architect supervisor
- **Context:** Need a clear owner for the implementation arc — someone who picks tasks, makes implementation-level decisions, writes journal entries, and ships.
- **Options:** (a) @mel owns directly; (b) Dumbleclaw owns with @mel supervising; (c) Co-ownership.
- **Choice:** (b).
- **Rationale:** This is exactly the operating model La Oficina is built for — Architect-led pod with AI Operator delivering. Dogfooding the model proves it. Frees @mel to focus on engagement-side and content-side work. Co-ownership has ambiguous accountability; @mel-direct doesn't dogfood.
- **Date:** 2026-05-13

## D2 — Implementation work lives in this workstream; comms work lives in content workstream(s)
- **Context:** Where does "build-in-public" actually run? Both implementation AND comms are public-facing.
- **Options:** (a) One workstream covers both; (b) Implementation here, comms elsewhere with cross-references; (c) Separate but synced via shared docs.
- **Choice:** (b) — this workstream produces source material (journal entries, decisions, bug stories), content workstream(s) shape it for surfaces.
- **Rationale:** Separation of concerns. Implementation cadence ≠ publication cadence. A junior contributor reading this workstream should see implementation work, not marketing copy. A marketing reviewer should see polished drafts in the content workstream, not raw bug logs. Cross-references via SESSIONS / MEMORY pointers preserve the link without conflating ownership.
- **Date:** 2026-05-13

## D3 — Validation reference is the live `~/oficina/` tree
- **Context:** How do we know an implemented script produced the right output?
- **Options:** (a) Reference fixture files in `tests/fixtures/`; (b) Diff against live `~/oficina/` hand-scaffolded reference; (c) Schema-only validation (run yq, check fields present).
- **Choice:** (b) for v0.1.x, (a) added incrementally as fixtures stabilize.
- **Rationale:** The hand-scaffolded `~/oficina/` was deliberately produced as the v0.1.0-pre reference per HANDOFF.md. Using it as ground truth avoids fixture drift while implementations are still in flux. Once a command is stable, freeze its expected output as a fixture in `tests/`.
- **Date:** 2026-05-13
