# AI Research Wiki — Agent Instructions

A personal knowledge base for tracking state-of-the-art AI techniques across papers, blog posts, and lectures. Adapted from Karpathy's [llm-wiki pattern](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f).

The big idea is the same: I curate sources and ask questions; you maintain a persistent, interlinked wiki of markdown files that compounds in value as the field moves. The specialization is the schema below — built for the shape of AI research, where the unit of progress is the *technique* and the connective tissue is *what beats what, when, and why*.

---

## Domain: why AI research needs its own schema

A generic wiki under-serves this domain. AI research has structure worth encoding directly:

- **Techniques are versioned and competitive.** GRPO descends from PPO; FlashAttention-3 supersedes v2; Mamba and Transformers are rivals on the same axis. The wiki must represent lineage and competition, not just topics.
- **Claims are tied to benchmarks.** "X is SOTA" is meaningless without "on which benchmark, at which scale, against what baseline." Every claim needs an anchor.
- **Half-life is short.** A SOTA claim from 18 months ago is often wrong now. The wiki must mark staleness, not just store facts.
- **Vocabulary is dense and overloaded.** "Distillation" means three different things; "reward model" means two. The wiki must disambiguate aggressively.
- **The unit is the idea, not the paper.** Many papers introduce the same idea under different names; many ideas live across a paper trail of 5–10 follow-ups. Pages are about *ideas*; papers are sources that contribute to them.

The page types below are designed around this.

---

## Architecture

Three layers, same as the original pattern.

**`raw/`** — immutable sources. PDFs of papers, archived HTML of blog posts, lecture transcripts, slide decks. You read; never modify. One subfolder per year (`raw/2025/`, `raw/2026/`) keeps things sortable.

**`wiki/`** — the markdown knowledge base you own and maintain entirely. Subfolders by page type (see below).

**`AGENTS.md`** (this file) — the schema. Co-evolves with me; when we discover a pattern that works, write it down here so future sessions inherit it.

---

## Page types

Every wiki page is one of these. The type goes in the frontmatter (`type: technique`) so the linter can enforce type-specific rules.

### 1. `technique/` — the workhorse page

One page per *idea*, not per paper. Example: `wiki/technique/grpo.md` covers Group Relative Policy Optimization across the DeepSeekMath paper, follow-up ablations, and any blog posts dissecting it.

Required sections:
- **TL;DR** — 2–3 sentences. What it is, what it replaces, why it matters.
- **Mechanism** — how it actually works, in enough detail that a practitioner could reimplement the core loop. Equations welcome.
- **Lineage** — what it descends from, what it competes with, what supersedes it (if anything). Linked to other `technique/` pages.
- **Evidence** — table of (benchmark, baseline, this method, scale, source). One row per claim.
- **Caveats & failure modes** — what doesn't work, where it underperforms, replication issues.
- **Open questions** — what's unresolved. Source for future investigation.
- **Sources** — links to every `source/` page that contributed.

Frontmatter:
```yaml
type: technique
status: active | superseded | contested | speculative
introduced: 2024-02   # when the idea first appeared
last_updated: 2026-05-25
supersedes: [ppo, rlhf-standard]
superseded_by: []
competes_with: [dpo, rloo]
tags: [rl, post-training, alignment]
```

### 2. `source/` — one page per paper, post, or talk

The page is a *reading of* the source, not a copy of it. Required sections:
- **Citation** block in format: `**Citation:** Author(s). "Title." Venue, Year. [URL](link) | [Local copy](../../raw/year/category/filename)` with proper URL encoding.
- **Claim** — the central claim in one sentence.
- **Method** — how they support the claim.
- **Results** — key numbers. Always with the benchmark and baseline.
- **What's new** — what this source contributes that prior work didn't.
- **What I'd push on** — weaknesses, missing ablations, suspicious choices.
- **Touches** — links to every `technique/`, `benchmark/`, or other page this updates.

Frontmatter:
```yaml
type: source
source_kind: paper | blog | talk | tweet-thread | repo
date: 2026-03-12
arxiv: 2503.12345
authors: [smith-j, lee-k]
venue: neurips-2026
status: read | skimmed | queued
confidence: high | medium | low   # how much I trust the result
```

### 3. `benchmark/` — one page per evaluation suite

Because "SOTA on X" is the unit of currency. Example: `wiki/benchmark/swe-bench-verified.md`.

Sections: what it measures, known flaws and contamination concerns, current leaderboard (top 5 with date and source), what a meaningful delta on it looks like.

### 4. `concept/` — definitional pages

For overloaded or foundational vocabulary. Example: `wiki/concept/distillation.md` disambiguates response distillation, on-policy distillation, and feature distillation, and points to the `technique/` pages that instantiate each.

Keep these short. If a concept page is growing past ~300 words it probably wants to be split into multiple `technique/` pages with the concept page as a hub.

### 5. `thread/` — evolving narratives

For tracking a research arc over time. Example: `wiki/thread/test-time-compute.md` follows the o1 → r1 → s1 → ... lineage with dated entries. Threads are where you ask the bigger questions: "is the field converging or diverging?"

### 6. `question/` — open questions worth tracking

Things I want to know but don't yet. Each question links to the techniques, sources, and threads relevant to it, and gets updated when new evidence arrives. "Does on-policy data still matter once the model is strong enough to label its own?" lives here.

---

## Special files

**`wiki/index.md`** — catalog. Grouped by page type. Each entry: link, one-line summary, status, last-updated date. Update on every ingest.

**`wiki/log.md`** — append-only. Each entry starts with `## [YYYY-MM-DD] <op> | <subject>` so `grep "^## \[" log.md | tail -20` works. Operations: `ingest`, `query`, `lint`, `refactor`.

**`wiki/_inbox.md`** — when a source mentions a technique, paper, or benchmark we don't yet have a page for, drop a one-liner here with the date. Triage during lint. Prevents losing leads mid-ingest.

---

## Operations

### Ingest (a new source)

When I hand you a paper or blog post, follow this four-phase process:

#### Phase 1: Analysis & Planning
1. **Create task list.** Use TodoWrite to plan and track ingestion progress through all phases.
2. **Path correction for markdown files.** If the source is a markdown file (.md), run `scripts/replace_img_path.sh {year} {category} "{file_path}"` to correct image attachment paths before reading. Skip this step for PDFs and other non-markdown files.
3. **Read thoroughly.** Abstract + intro + method + results + discussion minimum. Note if skipping appendix.
4. **Locate existing connections.** Which `technique/` pages does this touch? Which `benchmark/` pages? Search the wiki, don't guess.
5. **Identify novel elements.** What new techniques, concepts, or claims does this introduce?
6. **Discuss with me first.** Before writing anything: what's the central claim, what's actually new, where does it fit in the lineage, what should I be skeptical of? Two or three exchanges, then write.

#### Phase 2: Content Creation
7. **Create `source/<slug>.md`.** Use the template above.
8. **Create new `technique/` pages.** For novel methods — don't just append to the source page, the idea needs its own home for cross-linking.
9. **Create new `concept/` pages.** For overloaded terminology requiring disambiguation.
10. **Update existing pages.** Add to Evidence tables, update lineage relationships, bump `last_updated` dates.

#### Phase 3: Evidence Integration
11. **Document claims & lineage.** Add benchmark results with proper baselines and scale information. Update supersedes/superseded_by/competes_with relationships across technique pages.
12. **Handle contradictions.** Don't silently overwrite conflicts — surface both sides with quotes for resolution.

#### Phase 4: Cross-Reference & Maintenance
13. **Update `index.md`** with new entries and current counts.
14. **Update `log.md`** with ingestion activity summary.
15. **Update `_inbox.md`** with techniques/papers mentioned that we don't yet cover.
16. **Update `benchmark/` pages** if the source posts new leaderboard numbers.
17. **Update existing `thread/` pages.** Check if the new source contributes to existing research narratives. Add dated entries to relevant threads, or create new threads if this source represents the start of a significant research arc.
18. **Update `README.md`** with current stats (technique/source/concept/thread/question counts) and last updated date.

A single source typically touches 5–15 wiki pages. That's expected.

### Query

When I ask a question:

1. **Read `index.md` first.** Then drill into the relevant pages. Don't guess from filenames.
2. **Answer with citations** — every claim points to either a `source/` page or, for derived synthesis, a `technique/`/`thread/` page.
3. **Distinguish established from speculative.** If I ask "is X better than Y" and the wiki contains a benchmark table that answers it, cite it. If the wiki only contains scattered hints, say so and offer to investigate.
4. **Offer to file the answer back.** Good answers to non-trivial questions belong in the wiki. Comparisons go in a new `technique/` section or a `thread/` page. Resolved open questions get archived from `question/` into the relevant `technique/`. Synthesis shouldn't disappear into chat history.

### Lint (run weekly, or when I ask)

Walk the wiki and report:

- **Stale SOTA claims.** Any `technique/` page where Evidence rows are >9 months old on fast-moving topics (RL post-training, agents, video gen, reasoning) — flag for re-check.
- **Contradictions across pages.** Same technique compared on the same benchmark with conflicting numbers across two `source/` pages. Surface both with quotes; don't pick a side.
- **Orphan pages.** No inbound links. Either link them in or archive.
- **Concept gaps.** Terms appearing in 3+ pages with no `concept/` or `technique/` page of their own.
- **`_inbox.md` triage.** Any leads worth promoting to real pages.
- **`status: contested` and `status: speculative` pages** — do we have new evidence to resolve them?
- **Broken arXiv links and dead URLs.** Cheap to check, easy to fix.

Lint output is a report, not a set of automatic edits. I approve before you touch anything.

---

## Conventions

- **Slugs are lowercase-kebab, paper-agnostic.** `wiki/technique/grpo.md`, not `wiki/technique/deepseekmath-grpo.md`. The page is about the idea.
- **Link with relative paths** (`../technique/grpo.md`) so the wiki works offline and outside of Obsidian.
- **Local file links** use format: `**Local copy**: [raw/YYYY/category/filename.md](../../raw/YYYY/category/filename.md)` with proper URL encoding for spaces (%20).
- **One claim, one citation.** Every empirical claim points to a `source/`. "Generally accepted" without a citation is a bug.
- **Quote sparingly.** Paraphrase the source's argument; quote only when the exact wording matters (a precise definition, a notable hedge, a memorable framing). Never quote more than ~25 words from a single source.
- **Numbers go in tables, not prose.** Benchmark results in markdown tables with a `source:` column.
- **Equations in LaTeX** (`$...$` and `$$...$$`). Define every symbol.
- **Dates in ISO** (`2026-05-25`). Never "last month."
- **Temporal ordering.** Content with timestamps (thread entries, log entries) should be ordered **latest first** (newest to oldest). This applies to `thread/` pages and `log.md`.
- **Hedging is information.** "Outperforms PPO on GSM8K at 7B" is useful. "Outperforms PPO" is not. Always include scale and benchmark.

---

## What I (the human) do vs. what you do

I curate sources, ask questions, decide contested calls, and steer what to read next. I rarely write wiki pages myself.

You read, summarize, cross-reference, update pages, maintain the index and log, flag contradictions, run lint passes, and propose new pages and open questions. You do not silently resolve contradictions or quietly delete claims — you surface and I decide.

When unsure, ask. A two-line clarifying question now beats a fifteen-page refactor I have to undo.

---

## Notes on this schema

This document is meant to evolve. When we find a workflow that works (a new page type, a better lint rule, a frontmatter field that earns its keep), edit this file. When something here is dead weight, delete it. The point is to be a disciplined wiki maintainer for *AI research specifically*, not a generic note-taker.