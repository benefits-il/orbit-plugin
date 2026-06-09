# Templates — Domain Presets + Field-Tested Library

Two parts: (1) the 5 **domain presets** that pre-fill sub-questions + output schema, and (2) a **library** of field-tested DR prompts/system-prompts with direct URLs, for borrowing structure.

---

## Part 1 — Domain presets (Step 2)

When the topic matches a preset, load its sub-questions + schema into the universal core instead of inventing from scratch. Adapt freely.

### Technology Assessment
*Sub-questions:* maturity/TRL · core capabilities & limits · vendor/implementation landscape · cost & adoption barriers · alternatives & trajectory.
*Schema:* Overview → Capability matrix (table) → Maturity & risks → Recommendation.

### Competitive Landscape
*Sub-questions:* who are the players · positioning & differentiation · pricing/business model · strengths/weaknesses · market share & momentum.
*Schema:* Market map → Competitor table (player | positioning | pricing | strengths | weaknesses) → Gaps & opportunities → Strategic read.

### Policy Research
*Sub-questions:* current rules & jurisdiction · stakeholder positions · empirical evidence of impact · normative debates · likely direction.
*Schema:* Background → Stakeholder perspectives (multi-view) → Empirical vs normative split → Outlook. (Use the interpretable template.)

### Investment Due Diligence
*Sub-questions:* market size & growth · unit economics · competitive moat · team & traction · risks & red flags.
*Schema:* Thesis → Market (funnel data) → Financials table → Moat & risks → Go/No-go with confidence.
*Source bar:* prioritize primary sources — filings, earnings, job listings — over commentary.

### Literature Review
*Sub-questions:* seminal works · current consensus · active debates · methodological approaches · open questions.
*Schema:* Scope → Thematic synthesis → Consensus vs contested table → Gaps & future work. (Use the verifiable template; 2–3 sources per claim.)

---

## Part 2 — Field-tested template library

Borrow structure from these; each has a direct URL. Tool column = where it shines.

| Template | URL | Why it works | Tool |
|---|---|---|---|
| OpenAI Cookbook — Intro to Deep Research API | https://developers.openai.com/cookbook/examples/deep_research_api/introduction_to_deep_research_api | Vendor-authored rewriting + clarifying prompts; the canonical baseline. | ChatGPT/API |
| OpenAI Cookbook — DR API with Agents SDK | https://developers.openai.com/cookbook/examples/deep_research_api/introduction_to_deep_research_api_agents | triage→clarify→instruction→research agent chain. | ChatGPT/API |
| Agents Today #12 — Crafting the Perfect DR Prompt | https://agentstoday.substack.com/p/agents-today-12-crafting-the-perfect | Verifiable vs interpretable templates + accuracy-first principles. | Tool-agnostic |
| ahmadosman — Ultimate DeepResearch Prompt Builder | https://www.ahmadosman.com/blog/my-ultimate-deepresearch-prompt-builder/ | Full 9-section meta-template; "Clarify or Die"; citation audit → rerun. | Tool-agnostic |
| langgptai/awesome-deep-research-prompts | https://github.com/langgptai/awesome-deep-research-prompts | Curated DR prompts incl. "research plan generator". | OpenAI/Gemini |
| aref-vc/deep-research-prompting-guide | https://github.com/aref-vc/deep-research-prompting-guide | 50 business research templates across 5 domains. | Gemini |
| FindSkill — Deep Research Prompt Framework | https://findskill.ai/skills/productivity/deep-research-prompt-framework/ | 8 components, 5 templates, chaining, mistakes→fixes. | Multi |
| BuccoCapital prompt-building guidelines | https://x.com/buccocapital/status/1890745551995424987 | The widely-reused "build a prompt using these guidelines" list. | ChatGPT |
| Token Stream — Mastering OpenAI DR (o3) | https://tokenstream.substack.com/p/mastering-openai-deep-research-o3 | The "Deep Research Meta-Prompt" that generates DR prompts. | ChatGPT |
| Deep Research Agent System Prompt (ai-boost) | https://github.com/ai-boost/awesome-prompts/blob/main/prompts/deep_research.txt | Hardcodes a 6-step loop (Plan/Search/Fetch/Analyze/Synthesize/Verify); forbids ignoring conflicts. | Universal |
| GTM Analysis of Prospect (hayesdavis) | https://gist.github.com/hayesdavis/4d0b73d2161ce7e49885dab02f9f074f | Rigid markdown output; prioritizes primary data (filings, job boards). | ChatGPT/Claude |
| Market Research Deep Prompt (artisanalcode) | https://github.com/artisanalcode/market-research-prompts-llm/blob/main/deep-research.md | Data-quality metadata: tags [Dated - YYYY] and [Assumptions]. | Universal |
| Swayson's DR Protocol | https://gist.github.com/swayson/ed7d8db74dd9c50a3b5568cd969ccad8 | Requires a Source Evaluation Matrix (bias + credibility per URL). | Gemini/ChatGPT |
| Buccocapital Meta Prompt Builder (lmmx) | https://gist.github.com/lmmx/18086cf3ae378b62c6da726bdcbcb654 | 10-step meta-prompt forcing a reasoning model to build optimal DR prompts. | Universal |
| datastudios — Perplexity Prompting Techniques | https://www.datastudios.org/post/perplexity-ai-prompting-techniques-for-better-answers-sources-and-structured-outputs | Retrieval+answer pattern, table/JSON prompts, quote-extraction. | Perplexity |
| rephrase-it — Perplexity "search plan first" | https://rephrase-it.com/blog/perplexity-ai-how-to-write-search-prompts-that-actually-pull | Turns Perplexity into plan→search→synthesize→verify. | Perplexity |
| aiunpacking — Gemini Best Practices | https://aiunpacking.com/guides/gemini-prompts-best-practices/ | Intent+Context+Constraints; Deep Research Max scope/source template. | Gemini |
| swayson gist — leaked Perplexity DR system prompt | https://gist.github.com/swayson/22e38b9d5576b4e0192ea1dbbdecdaed | Verbatim report_format / document_structure / citation rules. | Perplexity |
| XInTheDark — Custom DR prompt for Claude | https://gist.github.com/XInTheDark/6fef041cb3edfe054b507813a03cb47d | research-steps, one-fact-per-query, MCP setup. | Claude |
| DeepResearchArchitect JSON (danielrosehill) | https://github.com/danielrosehill/System-Prompt-Library/blob/main/system-prompts/json/DeepResearchArchitect_270525.json | Encodes persona + objectives as a JSON object — model for the JSON-meta output. | API/Custom |
| Grok 3 System Prompt Leak (matijagrcic) | https://gist.github.com/matijagrcic/a959cf15a84813c2214757460038ef20 | Reveals Grok's "direct answer" + "survey section" mechanics. | Grok |
| teachingnaked — Deep Research Prompts | https://teachingnaked.com/deep-research-prompts/ | Short template + long worked examples (audit, moat, talent brief). | Tool-agnostic |

*Leak archives for source-selection insight (structural only, not ground truth):* elder-plinius/CL4R1T4S — https://github.com/elder-plinius/CL4R1T4S · jujumilk3/leaked-system-prompts — https://github.com/jujumilk3/leaked-system-prompts

---

## Optional JSON-meta output shape (Step 6)

When the user wants automation, emit alongside the brief a JSON object encoding the inputs and schema, e.g.:

```json
{
  "role": "...",
  "objective": "...",
  "decision_served": "...",
  "scope": { "timeframe": "...", "geography": "...", "exclude": ["..."] },
  "sub_questions": ["...", "..."],
  "sources": { "priority": ["primary", "regulatory"], "recency": "24 months", "min_per_claim": 2 },
  "output_schema": { "sections": ["..."], "tables": ["..."], "length_words": 2500, "citation_style": "inline-url" },
  "target_tool": "gemini"
}
```
