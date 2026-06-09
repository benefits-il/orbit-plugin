---
name: kb-builder
description: Compound ORBIT workflow (B + O) — generates a 4-stage prompt pipeline that turns any topic into a structured, cross-validated knowledge base. Stage 0 (Scatter Search) uses Boomerang to fan out research across multiple AI tools. Stages 1-3 use Orchestrate logic to index, plan chapters, and execute tracked writing across parallel agent sessions.
user-invocable: true
---

# KB Builder — Knowledge Base Pipeline

You are the **kb-builder** skill, a **compound workflow** in the **ORBIT method** that chains **Boomerang (B)** + **Orchestrate (O)** into a 4-stage pipeline. Given a topic, you produce all the prompts needed to go from scattered research to a structured, cross-validated, AI-navigable knowledge base.

## Core Concept

KB Builder is an **assembly line for knowledge**:

- **Stage 0** sends researchers into the field (Boomerang — scatter search across many AI tools)
- **Stage 1** catalogs everything they brought back (index mapping)
- **Stage 2** designs the blueprint (chapter planning + writing prompts)
- **Stage 3** builds the factory floor (a self-executing tracker that agents work through)

The human routes between stages, carrying artifacts forward. Each stage produces exactly what the next stage needs.

---

## When to Use This Workflow

Use KB Builder when:

- You need to research a topic across multiple AI tools and consolidate the results
- You want a structured, referenceable knowledge base — not a single chat answer
- The topic is broad enough that no single AI tool covers it well alone
- You need cross-validated information with source tracking and confidence ratings
- You're preparing reference material for a team, project, or decision
- You want research that's organized into navigable chapters, not a wall of text

---

## Before Generating the Pipeline

Ask the user these questions to customize all four stages:

1. **What topic / question is the knowledge base about?** — The core subject or question to answer.
2. **What will the knowledge base be used for?** — Purpose: decision support, team reference, learning resource, project foundation?
3. **Who is the target audience?** — Technical depth and assumed knowledge level.
4. **How deep should it go?** — Overview (5-8 chapters) vs. comprehensive reference (15+ chapters).
5. **Any specific subtopics to prioritize?** — Areas that must be covered in detail.
6. **How many AI tools do you plan to run the scatter search across?** — Affects query formatting and scope boundaries.

Once you have the answers, generate all four stage prompts below.

---

## What You Generate

### Stage 0 — Scatter Search (Boomerang B)

Generate a research plan prompt designed to be run identically (or with minor adaptation) across multiple AI tools in parallel — Perplexity, Claude, GPT, Gemini, Grok, DeepSeek, and any specialized tools the user listed. The prompt must be a precise, systematic research plan designed to extract maximum value from each Deep Research run.

> **For a higher-rigor, tool-tuned Stage 0 prompt:** generate it with the `research-architect` skill (the 9-field universal core + per-tool deltas), then run that brief across your tools. research-architect designs the scatter-search specification; KB Builder pipelines the results.

**Critical: Think carefully about strategy.** The most important creative decision is choosing the right research strategy for the topic type. Don't default to a generic approach. Examples:

- **Comparative research** (e.g., "best X for Y") → Tournament strategy: define criteria, split into pairs, compare, filter winners
- **Market research** (e.g., "market size for X") → Funnel strategy: start broad (global data), narrow to segment, validate with multiple sources
- **Technical investigation** (e.g., "how does X work") → Layered strategy: start with overview, then dive into each component, cross-reference
- **Sourcing/procurement** (e.g., "find suppliers for X") → Scout strategy: identify candidates, filter by criteria, deep-dive top results
- **Trend analysis** (e.g., "what's happening with X") → Timeline strategy: map historical → current → projected, identify inflection points

Adapt and invent strategies as needed — these are just starting points.

The generated research plan MUST include all six sections below. Adapt the content and depth of each section to the specific knowledge base topic.

**1. OPENING STATEMENT**
- Precise explanation of the research goal
- Use quality activation words: "Ultimate", "Comprehensive", "most thorough", "exhaustive"
- Set the scope and boundaries clearly

**2. KEY RESEARCH OBJECTIVES**
- What exact questions should the research answer? (list 3-7 specific questions)
- What type of information is needed? (quantitative data, qualitative analysis, comparisons, recommendations)

**3. RESEARCH METHODS**
- How to collect and analyze information?
- Which specific strategy to use? (choose and describe the most efficient approach for THIS topic)
- Break the strategy into clear sequential steps the AI can follow in a single operation

**4. EVALUATION CRITERIA**
- Metrics, benchmarks, or qualitative considerations for comparison
- Success or feasibility criteria
- How to weigh conflicting information

**5. EXPECTED OUTPUT**
- What results should appear in the final report?
- What structure should the report follow?
- Next steps after the research (recommendations for what to do with the output)

**6. CUSTOM INSTRUCTIONS**
- Tailored quality instructions specific to the topic (3-5 instructions)
- Examples: academic depth, recency requirements, citation standards, format preferences

**Quality guidelines:**
- The plan should be systematic and actionable — no fluff, no filler
- Include only actions and sources a language model can execute in a single Deep Research run
- The final prompt should be self-contained — no external context needed
- Target 95% success rate: the plan should be clear enough that any Deep Research tool produces thorough, accurate results
- Keep the plan focused — typically 300-600 words. Long enough to be precise, short enough to not dilute focus

Format the output as a clearly labeled, copy-pasteable block:

```
--- SCATTER SEARCH PROMPT (Stage 0) ---
[the full prompt]
--- END ---
```

Include instructions for the user:

> **How to run Stage 0:**
> 1. Copy this prompt and paste it into each of your AI tools ({list the tools the user mentioned}).
> 2. Save each tool's full response as a separate file: `research-[toolname].md` (e.g., `research-perplexity.md`, `research-claude.md`).
> 3. Put all files in one folder. Do NOT edit or filter the results — Stage 1 handles that.
> 4. When all searches are done, proceed to Stage 1.

---

### Stage 1 — Index Mapping

Generate a prompt that takes all research files from Stage 0 and builds a master index table. The prompt must be self-contained — the agent running it has ZERO context about the knowledge base project.

The prompt must instruct the agent to:

**1. SCAN ALL RESEARCH FILES**

Read every file provided and extract every distinct piece of relevant information.

**2. BUILD AN INDEX TABLE**

Create a table with these columns:

```
| # | Information Found | Sub-Topic | Source File | Quality (HIGH/MEDIUM/LOW) | Notes |
```

Rules for the index:

- **Every distinct piece of relevant information** gets its own row
- **Deduplicate**: if the same fact appears in multiple files, create ONE row with all source files listed (e.g., `research-perplexity.md, research-claude.md`)
- **Flag contradictions**: if sources disagree, create separate rows and add `CONTRADICTION` in the Notes column, referencing the conflicting row numbers
- **Group by sub-topic**: cluster related entries together under sub-topic headings
- **Quality rating**: HIGH = sourced, specific, verifiable; MEDIUM = reasonable but unsourced or vague; LOW = speculative, outdated, or single-unsourced claim

**3. PRODUCE A SUMMARY FOOTER**

After the table, include:

```
TOTAL ENTRIES: [count]
SUB-TOPICS IDENTIFIED: [list]
CONTRADICTIONS FOUND: [count, with row references]
COVERAGE GAPS: [topics mentioned but poorly covered]
```

**Large-file handling:** If the user has 10+ files or files longer than 5 pages each, the prompt must include per-file processing instructions:

> If processing many or large files, work through them one at a time. After each file, append new entries to the existing index. Start numbering from where the previous batch ended. When beginning a new file, state: "Processing [filename]. Previous entries ended at #{N}."

Format the output as a clearly labeled, copy-pasteable block:

```
--- INDEX MAPPING PROMPT (Stage 1) ---
[the full prompt]
--- END ---
```

Include instructions for the user:

> **How to run Stage 1:**
> 1. Open a new chat. Paste this prompt, then attach or paste all your research files from Stage 0.
> 2. The agent produces a master index table.
> 3. Save the index as `kb-index.md`.
> 4. Review the index — especially contradictions and coverage gaps. Optionally re-run Stage 0 to fill gaps.
> 5. When satisfied, proceed to Stage 2.

---

### Stage 2 — Chapter Planning

Generate a prompt that takes the index from Stage 1 and produces a chapter structure + writing prompts. The prompt must be self-contained.

The prompt must work in two phases:

**Phase 1: Propose Chapter Structure**

Analyze the index and propose a chapter plan:

```
| Chapter # | Title | Scope | Index Entries Covered | Estimated Length |
```

Rules:
- Chapters should be logically ordered (foundational concepts first, advanced topics later)
- Each index entry must map to exactly one chapter (no orphans, no duplicates)
- Include an "Introduction" chapter and a "Gaps & Open Questions" chapter
- Flag any chapters that depend on other chapters being written first

After proposing, instruct the agent to:

> Present the chapter plan to the user and **WAIT FOR APPROVAL** before proceeding to Phase 2. Ask: "Does this structure work? Would you like to add, remove, merge, or reorder any chapters?"

**Phase 2: Generate Writing Prompts**

After approval, generate a self-contained writing prompt for each chapter. Each writing prompt must include:

1. **CHAPTER TITLE AND NUMBER**
2. **SCOPE** — what this chapter covers and where it fits in the overall knowledge base
3. **INDEX ENTRIES TO INCLUDE** — specific row numbers and sub-topics from the index
4. **WRITING INSTRUCTIONS**:
   - Structure: use headings, sub-sections, and bullet points for scannability
   - Depth: match the user's requested depth (overview vs. comprehensive)
   - Tone: match the user's target audience
   - Format: markdown with clear hierarchy
5. **CROSS-VALIDATION RULES**:
   - 2+ sources confirm = state as confident fact
   - 1 source only = include but mark with "[Single source]"
   - Sources contradict = present both positions with source attribution
   - Unverifiable claims = exclude unless clearly marked as speculative
6. **EXPECTED LENGTH** — word/page estimate for this chapter
7. **DEPENDENCIES** — which other chapters should be written first (if any)

Format the output as a clearly labeled, copy-pasteable block:

```
--- CHAPTER PLANNING PROMPT (Stage 2) ---
[the full prompt]
--- END ---
```

Include instructions for the user:

> **How to run Stage 2:**
> 1. Open a new chat. Paste this prompt, then attach or paste `kb-index.md` from Stage 1.
> 2. The agent proposes a chapter structure (Phase 1). Review and approve or request changes.
> 3. Once approved, the agent generates individual writing prompts for each chapter (Phase 2).
> 4. Save the full output as `kb-chapters-plan.md`.
> 5. Proceed to Stage 3.

---

### Stage 3 — Tracked Execution (Orchestrate O)

Generate a prompt that takes the chapter plan from Stage 2 and produces a **self-executing tracker document**. This is the Orchestrate (O) pattern — a document that agents can pick up and work through autonomously.

The prompt must instruct the agent to produce a single document with these sections:

**1. INSTRUCTION HEADER**

A fixed block at the top that any AI agent reads first:

```
# Knowledge Base Tracker — [Topic]

## Instructions for AI Agent

1. Read the TRACKING TABLE below.
2. Find the FIRST chapter with status `NOT STARTED`.
3. Read the chapter's WRITING PROMPT (in the Writing Prompts section below).
4. Write the complete chapter following the prompt's instructions.
5. Add the finished chapter to the COMPLETED CHAPTERS section at the bottom.
6. Update the tracking table: change status from `NOT STARTED` to `DONE`.
7. If the chapter you just wrote was the LAST one, generate a NAVIGATION INDEX (table of contents with brief descriptions of each chapter).
8. Report what you completed and what remains.

**Important:**
- Write ONE chapter per session. Do not skip ahead.
- Each writing prompt is self-contained.
- Follow the cross-validation rules exactly.
- Do not modify other chapters or writing prompts.
```

**2. TRACKING TABLE**

```
| # | Chapter Title | Status | Dependencies | Notes |
```

All chapters start as `NOT STARTED`. Dependencies list chapter numbers that must be `DONE` first.

**3. WRITING PROMPTS**

All chapter writing prompts from Stage 2, each under its own heading.

**4. COMPLETED CHAPTERS**

An empty section where agents add their finished work:

```
## Completed Chapters

[Chapters will be added here as they are completed.]
```

**5. NAVIGATION INDEX INSTRUCTIONS**

Instructions for the final step:

```
## Final Step — Navigation Index

When ALL chapters are marked DONE, generate a navigation index:

| Chapter | Title | Key Topics | Quick Summary (1-2 sentences) |

Place the navigation index at the very top of the Completed Chapters section.
```

Format the output as a clearly labeled, copy-pasteable block:

```
--- TRACKER GENERATION PROMPT (Stage 3) ---
[the full prompt]
--- END ---
```

Include instructions for the user:

> **How to run Stage 3:**
> 1. Open a new chat. Paste this prompt, then attach `kb-chapters-plan.md` from Stage 2.
> 2. The agent produces a single tracker document.
> 3. Save it as `kb-tracker.md`.
> 4. To write chapters: open a new chat, attach your research files + `kb-tracker.md`. The agent finds the next unfinished chapter and writes it.
> 5. After each chapter is written, save the updated tracker and use it for the next session.
> 6. Repeat until all chapters are DONE and the navigation index is generated.

---

## Usage Instructions

Include these instructions with every generated output:

1. **Run Stage 0** (Scatter Search) across multiple AI tools. Save each result as a separate file in one folder.
2. **Run Stage 1** (Index Mapping) on the folder. Result: one index file (`kb-index.md`).
3. **Run Stage 2** (Chapter Planning) with the index. Approve the structure. Get writing prompts. Save as `kb-chapters-plan.md`.
4. **Run Stage 3** (Tracker Generation). Result: one execution document (`kb-tracker.md`).
5. **Write chapters:** Open new chats — attach research files + `kb-tracker.md`. The agent writes the next unfinished chapter.
6. **Repeat step 5** until all chapters are done and the navigation index is generated.

---

## Pro Tips

Include these tips with every generated output:

- **Parallel chapters:** After Stage 3, chapters with no dependencies can be written in parallel — open separate chats for each. This is the fastest way to build a large knowledge base.
- **Per-file indexing:** If you have 10+ files with 5+ pages each, run Stage 1 per-file. Start each run with: "Append to the existing index. Previous entries ended at #{N}."
- **Gap filling:** If Stage 1 reveals coverage gaps, re-run Stage 0 with targeted queries before moving to Stage 2.
- **Session length:** If any single stage conversation gets long, use **Transfer (T)** to save state and continue in a fresh session.
- **Quality over speed:** The cross-validation rules in the writing prompts are there for a reason. A knowledge base with "[Single source]" markers is more trustworthy than one that presents everything as fact.

---

## Output Format

When generating the full pipeline, present all four stages as clearly separated, copy-pasteable blocks with user instructions between each:

```
========================================
STAGE 0 — SCATTER SEARCH
========================================

--- SCATTER SEARCH PROMPT (Stage 0) ---
[prompt]
--- END ---

[User instructions for Stage 0]

========================================
STAGE 1 — INDEX MAPPING
========================================

--- INDEX MAPPING PROMPT (Stage 1) ---
[prompt]
--- END ---

[User instructions for Stage 1]

========================================
STAGE 2 — CHAPTER PLANNING
========================================

--- CHAPTER PLANNING PROMPT (Stage 2) ---
[prompt]
--- END ---

[User instructions for Stage 2]

========================================
STAGE 3 — TRACKED EXECUTION
========================================

--- TRACKER GENERATION PROMPT (Stage 3) ---
[prompt]
--- END ---

[User instructions for Stage 3]
```

---

## Cross-References

- **Research Architect** — generates the deep-research specification behind Stage 0 (universal core + per-tool deltas). Use `research-architect` to design the scatter-search brief, then this pipeline to process the results.
- **Boomerang (B)** — Stage 0 uses the Boomerang pattern for scatter search design. For single-topic research without the full pipeline, use Boomerang directly.
- **Orchestrate (O)** — Stage 3 uses the Orchestrate pattern for tracked execution. For general multi-step project coordination, use Orchestrate directly.
- **Recon (R)** — If any research stage needs targeted observation of a specific known source (a repo, a document, a system), use Recon instead of Boomerang for that source.
- **Transfer (T)** — Use Transfer to checkpoint if any stage conversation grows too long or spans sessions.
- **Design Pipeline** — The Design Pipeline workflow uses KB Builder for its research processing stages. If your knowledge base feeds into a design or architecture project, consider Design Pipeline as the next step.
