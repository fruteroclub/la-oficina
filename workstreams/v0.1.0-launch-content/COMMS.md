# COMMS — v0.1.0-launch-content

Append-only log of communications produced inside this workstream — what was said, when, by whom, on which surface, and to which audience.

Two purposes:
1. **Operational truth.** A single place to check what's gone out so we don't duplicate or contradict ourselves.
2. **Build-in-public traceability.** Every public claim ties back to a specific milestone, decision, or engagement (per workstream success criterion #5).

## Format

Each entry uses the fields below. Append at the bottom — never edit or remove past entries (corrections go as a new entry referencing the corrected one).

```
### YYYY-MM-DD | <surface> | <audience> | <type>
- **By:** <person or agent>
- **Title / handle:** <short label>
- **Canonical path or URL:** <repo path | external URL | "internal-only">
- **References:** <what milestone, decision, or engagement this traces to>
- **Status:** draft | scheduled | published | archived
- **Notes:** <one or two sentences>
```

**Surfaces (controlled vocabulary):** `repo` (commits/PRs/releases), `frutero.club-blog`, `x-twitter`, `linkedin`, `newsletter`, `internal-doc`, `direct-channel` (DM, email, call).

**Audiences:** `public`, `frutero-club`, `prospective-operators`, `prospective-clients`, `internal`.

**Types:** `long-form`, `short-form`, `handbook`, `case-study`, `announcement`, `correction`, `decision-log`.

---

## Entries

### 2026-05-13 | repo | public | announcement
- **By:** @mel + Claude Opus 4.7
- **Title / handle:** `fruteroclub/la-oficina` made public on GitHub
- **Canonical path or URL:** https://github.com/fruteroclub/la-oficina
- **References:** v0.1.0 launch arc; first concrete external surface for the project
- **Status:** published
- **Notes:** Repo created public from day one (per @mel decision). Initial commits visible: seed scaffold + v0.1.0-launch-content workstream + first long-form drafts + handbook v1. README and SKILL.md describe the project.

### 2026-05-13 | repo | public | long-form (draft)
- **By:** Claude Opus 4.7 + @mel (drafter / reviewer)
- **Title / handle:** "Por qué Frutero está construyendo La Oficina" (ES canonical)
- **Canonical path or URL:** `content/blog/2026-05-13-por-que-la-oficina.es.md` (in-repo, visible publicly via GitHub)
- **References:** Launches the v0.1.0 narrative. Defines Talent Accelerator + Agency Services positioning. Introduces Dumbleclaw on Hermes publicly. D2 (name agent publicly), D1 (ES canonical).
- **Status:** draft — awaiting @mel review; not yet published on frutero.club blog
- **Notes:** Frontmatter says `status: draft`. Final pre-publication checks: confirm Frutero Club / Operator / engagement links, confirm pod 1 attribution kept generic, confirm voice with @mel.

### 2026-05-13 | repo | public | long-form (draft)
- **By:** Claude Opus 4.7 + @mel
- **Title / handle:** "Why Frutero is building La Oficina" (EN companion)
- **Canonical path or URL:** `content/blog/2026-05-13-why-la-oficina.en.md`
- **References:** Companion to the ES canonical. Adapted, not literal translation.
- **Status:** draft
- **Notes:** Same review gates as the ES version before publication.

### 2026-05-13 | repo | public | handbook (draft, living)
- **By:** Claude Opus 4.7 + @mel
- **Title / handle:** "Manual de Frutero Agency" (ES, living doc)
- **Canonical path or URL:** `content/handbook/frutero-agency-handbook.es.md`
- **References:** Companion to the launch post: blog = "why", handbook = "how". Sections per audience (Club members, prospective Operators, prospective clients).
- **Status:** draft — awaiting @mel review
- **Notes:** Designed to be updated as reality changes; not a one-shot publication. Once approved, gets a stable URL on frutero.club.
