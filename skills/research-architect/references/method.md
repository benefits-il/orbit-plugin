# Method — The Universal Deep-Research Core

This is the full reference for building the tool-agnostic core of a deep-research brief. The same ~9-field spec pastes into any DR tool; per-tool tuning lives in `tool-deltas.md`.

---

## The 10 input vectors (Step 1)

Collect or infer these before writing. Fill gaps open-ended; never invent the user's preferences.

| # | Vector | Why it matters |
|---|---|---|
| 1 | Topic / raw idea | The seed. |
| 2 | Core question + **decision served** | Makes the report actionable and falsifiable — name the decision it informs. |
| 3 | Audience & persona/tone | Sets depth and terminology. |
| 4 | Scope: timeframe · geography · inclusions/exclusions | The #1 lever against verbosity and drift. |
| 5 | Key terms to define | Prevents confident hallucination. |
| 6 | Known sub-questions / angles (optional) | You fill gaps open-ended. |
| 7 | Source preferences & quality bar | Output quality tracks source quality. |
| 8 | Recency window | Prevents stale + current data mixing. |
| 9 | Output shape: sections · tables · length · citation style | The single biggest usability lever. |
| 10 | Target tool(s) | Triggers the per-tool deltas. |

---

## The 9-field universal core (Step 3)

Order matters — front-loaded role and objective anchor the model's attention through a long autonomous loop.

### 1. Role / Persona
*Rationale:* frames tone, depth, source bias; forces the model out of generalist surface-level mode.
*Example:* "You are a senior policy analyst at a think tank." / "Act as a competitive-intelligence analyst for a performance-marketing team."

### 2. Objective & Core Question + Decision Served
*Rationale:* makes output actionable and falsifiable.
*Example:* "Determine which lab-grown-meat firms are closest to price parity, to inform a VC investment decision."

### 3. Context, Background & Key-Term Definitions
*Rationale:* prevents confident hallucination; grounds the model.
*Example:* "Define 'price parity' as retail $/lb at conventional-meat levels."

### 4. Scope & Boundaries (timeframe, geography, inclusions/exclusions)
*Rationale:* the #1 lever against verbosity and drift.
*Example:* "US + EU only; 2023–2026; exclude pre-2020 data."

### 5. Decomposed Sub-Questions (3–7)
*Rationale:* structured sub-questions beat one giant question; mirror expert research flow.
*Example:* "1) Who has regulatory approval? 2) What consumer-acceptance data exists? 3) …"

### 6. Source & Recency Requirements
*Rationale:* output quality tracks source quality; a recency window prevents stale mixing.
*Example:* "Prioritize peer-reviewed studies, regulatory filings, earnings reports; prefer the last 24 months; tag anything older than 2 years as [Dated - YYYY]."

### 7. Output Schema (exact sections + tables)
*Rationale:* the single biggest usability lever; an agent returning from a 30-minute loop dumps a wall of text without one. Request tables explicitly.
*Example:* "Return: Exec Summary → Findings → Comparison table (Company | Approval | $/lb | Source) → Risks → Recommendation; ~2,500 words."

### 8. Evidence / Citation Rules
*Rationale:* grounding and auditability. Citations must be required **up front** — the model structures its research differently when it knows from the start (FindSkill).
*Example:* "Cite every claim inline with a direct URL; ≥2 independent sources for key claims; mark unsourceable claims [UNVERIFIED]; prioritize primary sources (filings, official docs, clinical data) over commentary."

### 9. Reasoning, Uncertainty & Self-Check
*Rationale:* reduces overconfidence and silent consolidation.
*Example:* "Distinguish consensus vs hypothesis vs speculation; actively investigate conflicts between sources and explain why they disagree — do not silently average or drop outliers; before finishing, verify every section is addressed and every citation resolves."

---

## Two base templates (pick by topic type)

Default to **verifiable** for science/tech/math, **interpretable** for law/policy/ethics/social.

### Verifiable-topic template (Step 3 variant)
Add to the core: "Distinguish established consensus from active hypothesis from speculation. Require 2–3 independent sources per key claim. Where quantitative, report the number, its source, and its date. Flag any single-sourced claim."

### Interpretable-topic template (Step 3 variant)
Add to the core: "Present multiple stakeholder perspectives. Separate empirical claims (what is) from normative claims (what ought to be). Use neutral framing — ask for risks AND benefits. Attribute each position to its proponents."

---

## Failure-modes → fixes (Step 5 QA guard)

Run the brief against every row before emitting. Each fix is a clause the brief should already contain.

| Failure mode | Documented fix (clause to include) |
|---|---|
| Vague / over-broad scope | Narrow to a falsifiable question with timeframe + geography. |
| One giant question | Decompose into 3–7 sub-questions. |
| No output schema | Specify exact sections + tables + length up front. |
| Citations as an afterthought | "Include citation requirements IN the original prompt" — require them from the start. |
| No recency window | State explicit dates ("last 24 months," "2023–2026"). |
| Single-source claims | Require ≥2 independent sources for key claims. |
| Hallucinated citations (fake DOIs/URLs) | Demand verifiable sources; mark unsourceable as [UNVERIFIED]; audit links. |
| Temporal hallucination | Audit each document's timestamp; tag old data [Dated - YYYY]. |
| Silent consolidation (ignoring conflicts) | Hunt for discrepancies; document and analyze why sources disagree. |
| Surface-level synthesis | Require strategic implications, not just summary (e.g., apply a framework). |
| Keyword dumping / loop failure | Run focused, single-concept queries; decompose before searching. |
| Leading / loaded questions | Use neutral framing; request risks AND benefits. |
| Memory reliance (bypassing retrieval) | "Use live web search exclusively; do not rely on training weights for factual claims." |
| Over-retrieval / no stopping criterion | Specify completion criteria and the exact deliverable set. |

---

## QA / dead-link loop (Step 5 closing clause)

Always embed a closing instruction in the generated brief:

> After producing the report, list every cited URL and flag any that do not resolve. If several links are dead, that signals weak sourcing — rerun the research with tighter source filters (e.g., restrict to primary sources or a narrower recency window).

---

## Worked example (compact)

**User:** "תתכנן לי מחקר על פלטפורמות no-code לבניית משחקי לוח דיגיטליים" → comparative topic → Tournament strategy → verifiable template.

The emitted brief opens with a Role ("senior no-code tooling analyst"), states the decision ("which platform an independent creator with no dev background should adopt"), bounds scope (2025+, includes RTL/Hebrew support as a criterion), decomposes into 5 sub-questions, sets a weighted criteria table as the output schema, requires ≥2 sources + direct links, and closes with the dead-link audit. If the user chose Gemini, the per-tool adapter (from `tool-deltas.md`) appends "Cite all sources" + a source-credibility table request after the pasted context.

---

## Caveats to carry into briefs when relevant

- DR tools change fast; treat version/quota specifics as point-in-time.
- The same DR prompt yields different reports across runs (reference overlap ~5–50% across tools). No prompt guarantees identical output — favor structural rigor over expecting reproducibility.
- Leaked vendor system prompts are community extractions — structural insight, not ground truth.
