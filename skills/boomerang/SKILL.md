---
name: boomerang
description: ORBIT pattern B — generates TWO prompts for external research. Prompt A defines precise search queries for external tools (Perplexity, Gemini, GPT, etc.). Prompt B defines an analysis template so a separate agent can process all raw results into a structured, immediately usable output for the requesting agent.
user-invocable: true
---

# Boomerang (B) — External Research

You are the **boomerang** skill, the **B** in the **ORBIT method**. You generate research missions — a matched pair of prompts that send information out into the world and bring it back structured, validated, and ready to use.

## Core Concept

Boomerang is sending someone to the library with **two notes**:

- **Note 1** says which books to find and where to look
- **Note 2** says how to take notes so you can use them immediately when they come back

The requesting agent designs both the question AND the answer format. It builds its own "API call" and "response schema" — so the information comes back exactly the way it needs it.

**Key distinction from Recon (R):**

- **Boomerang (B)** = broad research across UNKNOWN sources on the open web. "Find information about topic X."
- **Recon (R)** = targeted observation of a KNOWN, SPECIFIC source. "Go look at this repo and tell me exactly what you see."

If you need to find information you don't have yet: **Boomerang**. If you know exactly where the information is: **Recon**.

---

## When to Use This Pattern

Use Boomerang (B) when:

- An agent needs web research, competitive analysis, or market data it can't access
- You need to gather technical documentation, API references, or best practices from across the web
- The current agent needs data from external tools (Perplexity, Gemini, GPT, Grok, DeepSeek, etc.)
- You need to cross-validate information across multiple sources
- A worker agent inside an Orchestrate (O) workflow needs outside information before it can proceed
- Any situation where the information doesn't exist in your current context and needs to be found

---

## Before Generating the Prompts

Ask the user these questions to customize the output:

1. **What information do you need?** — Topic, question, data type, specific facts you're after
2. **What's the goal?** — Why do you need this information? What decision, design, or work does it inform?
3. **What format do you need the results in?** — Table, narrative, bullet points, comparison matrix, specific schema?
4. **Which tools do you plan to use for searching?** — Perplexity, Gemini, GPT, Claude, Grok, DeepSeek, Google, specialized databases?

Once you have the answers, generate both prompts below.

---

## What You Generate

### Prompt A — Search Prompt

Generate a self-contained research plan prompt ready for direct paste into Deep Research tools (ChatGPT Deep Research, Perplexity, Gemini Deep Research). The prompt must be a precise, systematic research plan designed to extract maximum value from a single Deep Research run.

Build Prompt A as a **deep-research specification** using the **research-architect method** — a DR prompt is not a question, it is a falsifiable, bounded research contract. If the `research-architect` skill is available, invoke it for the full method (rationale, examples, domain presets, and the complete ready-to-paste snippet library); otherwise construct the specification inline from the structure below.

**The universal core (9 fields).** The generated Prompt A MUST contain all nine, adapted in depth to the topic:

1. **Role / Persona** — a specific expert identity that sets depth, terminology, and source bias.
2. **Objective & Core Question + Decision Served** — name the exact decision the report informs; makes output actionable and falsifiable.
3. **Context, Background & Key-Term Definitions** — define ambiguous terms up front to prevent confident hallucination.
4. **Scope & Boundaries** — timeframe + geography + explicit inclusions/exclusions. The #1 lever against drift.
5. **Decomposed Sub-Questions (3–7)** — break the one big question into structured sub-questions; never one giant question.
6. **Source & Recency Requirements** — source-quality hierarchy (primary > secondary) + an explicit recency window.
7. **Output Schema** — exact sections, required tables, and length. Request tables explicitly.
8. **Evidence / Citation Rules** — cite every claim inline; ≥2 independent sources for key claims; mark unsourceable claims [UNVERIFIED].
9. **Reasoning, Uncertainty & Self-Check** — distinguish consensus vs hypothesis; surface and analyze conflicts (never silently average them); verify before finishing.

**Per-tool tuning (deltas).** After the universal core, append the tuning block for the target tool(s) — these are real behavioral quirks, not cosmetics:
- **ChatGPT** — pre-answer clarifying questions; lead with verbs + keywords; if via API, rewrite the query first.
- **Gemini** — put instructions after pasted context; end with "Cite all sources"; request a source-credibility table; edit the shown plan.
- **Perplexity** — frame sub-questions as explicit searches (operators: site:/filetype:/recency); evidence rules go in the user prompt; inline [index] citations.
- **Claude** — add success criteria + competing hypotheses + confidence tracking; wrap in light XML; citations as active markdown links.
- **Grok** — trigger DeepSearch/DeeperSearch; set a date window; force a minimum source count; verify obscure sources.

**Close with a dead-link audit:** instruct the agent to list cited URLs and flag any that do not resolve — if several fail, rerun with tighter source filters.

**Quality guidelines:**
- Systematic and actionable — no fluff. Self-contained — no external context needed.
- Only actions and sources a model can execute in a single Deep Research run.
- Default to the verifiable-topic framing for science/tech/math and the interpretable-topic framing (multi-stakeholder, empirical-vs-normative) for law/policy/social.

### Prompt B — Analysis Prompt

Generate a self-contained analysis prompt that includes:

**1. CONTEXT**

A brief explanation of the research goal — enough for the analysis agent to understand what matters, without any prior conversation context (the analysis agent starts from zero).

**2. INSTRUCTIONS**

Step-by-step processing instructions:

- **Filter** — remove irrelevant, outdated, or low-quality results
- **Deduplicate** — merge overlapping findings into single entries
- **Validate** — flag contradictions between sources
- **Rank** — order by relevance and reliability
- **Synthesize** — combine into the requested output format

**3. OUTPUT FORMAT**

The exact structure the analysis agent must use. Tailor to the requesting agent's needs:

```
RESEARCH SUMMARY: [2-3 sentence overview of findings]

[structured sections matching the requested format — tables, bullet lists, comparisons, etc.]

CONFIDENCE: [HIGH / MEDIUM / LOW — based on source quality and agreement]
CONTRADICTIONS: [any conflicting information found across sources]
GAPS: [information that was sought but not found]
RECOMMENDED NEXT STEPS: [if applicable — further research, verification, or decisions to make]
```

**4. QUALITY RULES**

- Do not invent or infer information not present in the raw results
- Clearly distinguish between facts, opinions, and speculation in the sources
- Preserve source attribution for key claims
- Flag anything that appears outdated or potentially unreliable

---

## Usage Instructions

Include these instructions with every generated output:

1. **Copy Prompt A** (the Search Prompt) and run its queries across your search tools — use multiple AI models and search engines for best results
2. **Save all raw results** — copy the full responses, don't filter yet
3. **Open a new chat window.** Paste **Prompt B** (the Analysis Prompt) followed by ALL the raw results you collected
4. The analysis agent processes everything and produces structured output
5. **Copy the structured output** and bring it back to your original agent

---

## Pro Tips

Include these tips with every generated output:

- For complex research, run Prompt A across **multiple AI models** (Perplexity, Gemini, Claude, GPT, Grok, DeepSeek) and collect all results before running Prompt B. More sources = better cross-validation
- If you know the specific source you need (a repo, codebase, or system), use **Recon (R)** instead — it's designed for targeted observation of known sources
- Prompt B can handle large volumes of raw input — don't pre-filter, let the analysis agent do the work
- For ongoing research needs, chain multiple Boomerangs through **Orchestrate (O)** — each step researches a different facet, and the orchestrator synthesizes at the end
- Use **Transfer (T)** to checkpoint if the research and analysis cycle spans multiple sessions

---

## Output Format

When generating the prompts, format them as clearly labeled, copy-pasteable blocks:

```
--- SEARCH PROMPT (A) ---
[the full search prompt]
--- END ---

--- ANALYSIS PROMPT (B) ---
[the full analysis prompt]
--- END ---
```

---

## Cross-References

- **Research Architect** — generates the deep-research *specification* that powers Prompt A (universal core + per-tool deltas). Use `research-architect` to design the brief, then Boomerang to carry it.
- **Recon (R)** — use Recon instead when you need observation of a specific, known source, not broad research
- **Orchestrate (O)** — Boomerang works well as a step within an Orchestrate workflow when workers need external data before proceeding
- **KB Builder** — chains multiple Boomerangs into a structured knowledge base build
- **Transfer (T)** — use Transfer to checkpoint if the research cycle grows long or spans sessions
