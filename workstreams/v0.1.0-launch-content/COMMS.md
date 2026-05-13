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

### 2026-05-13 | x-twitter | public | short-form (draft)
- **By:** Claude Opus 4.7 + @mel
- **Title / handle:** Launch thread (ES, 7 tweets)
- **Canonical path or URL:** `content/social/2026-05-13-launch-thread.es.md`
- **References:** Cut of the ES long-form launch post for X/Twitter distribution.
- **Status:** draft — awaiting @mel review; character counts unverified per-tweet
- **Notes:** Includes links to repo, long-form, and handbook. Verify each tweet ≤280 chars before scheduling.

### 2026-05-13 | x-twitter | public | short-form (draft)
- **By:** Claude Opus 4.7 + @mel
- **Title / handle:** Launch thread (EN, 7 tweets)
- **Canonical path or URL:** `content/social/2026-05-13-launch-thread.en.md`
- **References:** EN companion of the ES launch thread.
- **Status:** draft — awaiting @mel review
- **Notes:** Same review gates as the ES thread.

### 2026-05-13 | linkedin | public | short-form (draft)
- **By:** Claude Opus 4.7 + @mel
- **Title / handle:** Launch post (ES, LinkedIn)
- **Canonical path or URL:** `content/social/2026-05-13-launch-linkedin.es.md`
- **References:** Cut of the ES launch post for LinkedIn. More conversational/professional tone than the thread.
- **Status:** draft — awaiting @mel review
- **Notes:** Includes hashtag set tuned for LATAM tech audience.

### 2026-05-13 | linkedin | public | short-form (draft)
- **By:** Claude Opus 4.7 + @mel
- **Title / handle:** Launch post (EN, LinkedIn)
- **Canonical path or URL:** `content/social/2026-05-13-launch-linkedin.en.md`
- **References:** EN companion of the ES LinkedIn post.
- **Status:** draft — awaiting @mel review
- **Notes:** Hashtag set kept similar but slightly adjusted for international audience.

### 2026-05-13 | repo | public | announcement
- **By:** @mel + Claude Opus 4.7
- **Title / handle:** v0.1.0 release tagged + GitHub release published
- **Canonical path or URL:** https://github.com/fruteroclub/la-oficina/releases/tag/v0.1.0
- **References:** First taggable release. Two commands implemented (resolve, module-load) + bin/oficina dispatcher. Anchor that the launch content arc points at.
- **Status:** published
- **Notes:** Honest release notes — 7/9 commands ship as stubs and we say so. Hermes deployable. Tag also created locally: `v0.1.0`. Once @mel approves the launch blog/thread/LinkedIn drafts, they should link to the tagged release URL (not `main`) so references stay stable across future commits.
