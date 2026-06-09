# Tool Deltas — Per-Tool Tuning Blocks

The universal core (`method.md`) pastes into any tool. These deltas are **additive lines** appended for the chosen target tool(s). Each tool has real behavioral quirks; ignoring them degrades the run. The ready-to-paste snippets below are written to be dropped at the end of the universal brief.

---

## Decision: where to spend effort

- **If the tool exposes an editable plan (ChatGPT, Gemini):** front-load constraints, but plan to refine the shown plan in-product rather than over-specifying the prompt.
- **If using a DR API (no clarification step):** always run a lighter rewriter model first to expand the query into full scope/metrics/regions/sources/format before the DR model runs.
- **One-shot paste / automation:** write a fully-specified prompt that pre-empts clarifying questions.

**Clarifying-questions conflict (flag to the user):** ChatGPT and the OpenAI cookbook favor asking 3–6 clarifying questions; GPT-5.x guidance and the leaked Perplexity prompt instruct the model to NOT ask and instead cover all plausible intents. Context decides — interactive UI use → answer the questions; API / one-shot paste → pre-empt them by full specification.

---

## ChatGPT Deep Research
*Behavior:* proactively asks clarifying questions before starting; rewards a strong single front-loaded prompt; can integrate uploaded files + connected SharePoint/Drive; inline citations + source list.

**Snippet:**
> Lead with clear action verbs (compare, evaluate, recommend) and concrete keywords for web search. When you pause to ask clarifying questions, ask the 3–5 highest-value ones, then proceed. Provide a verifiable table of contents and an activity history of sources consulted.

*If via the Responses API (no clarification step):* first rewrite this query with a lighter model to include desired scope, comparisons, metrics, regions, preferred sources, and output format.

---

## Gemini Deep Research
*Behavior:* does not proactively ask — shows an **editable plan**; needs "Cite all sources" or it leans on training weights; may read snippets not full pages; native charts; instructions land best **after** the pasted context (Role+Task+Format wastes tokens on Gemini 3.x).

**Snippet (append AFTER any pasted context):**
> Start narrow. Produce a source-credibility table (source | type | date | reliability). Generate charts/graphs directly from the researched data where useful. For deep document analysis, I will upload PDFs.
> **Cite all sources.**

*Workflow note for the user:* click "Edit plan" to add competitors/criteria before authorizing the full run; verify any synthesized (orange) claims against directly-sourced (green) ones.

---

## Perplexity Deep Research
*Behavior:* "does exactly what you tell it, and no more" — frame as **explicit searches, not intent**; retrieval ignores system-style instructions, so evidence constraints go in the user prompt; citations are structurally embedded as inline `[index]` with NO SPACE; DR report variant has no end references list.

**Snippet:**
> Run these as explicit searches, not as a single intent. For each sub-question, issue focused queries using operators where helpful (site:, filetype:, recency filter). Prioritize the source types named above. Cite inline with bracketed indices. State explicitly when no valid source is found rather than inferring.

*Workflow note:* for repeat use, hardcode these rules into a dedicated Perplexity Space to force Pro Search toward exhaustive depth.

---

## Claude (Research mode)
*Behavior:* will not pause to ask unless told; rewards explicit success criteria + hypothesis-tracking; near-perfect adherence to negative constraints in XML tags; needs explicit instruction to format citations as active markdown links.

**Snippet (wrap the brief in light XML for attention retention):**
> `<success_criteria>` Define what a complete, high-quality answer looks like. `</success_criteria>`
> Develop competing hypotheses, track your confidence in each, self-critique, and keep research notes as you go.
> `<constraints>` Use live search only; format every citation as an active markdown hyperlink to the original URL; do not rely on training weights for factual claims. `</constraints>`

---

## Grok DeepSearch / DeeperSearch
*Behavior:* must be explicitly triggered; strong on real-time / X.com sentiment; can terminate retrieval early; source quality varies (blogs/tweets beside Reuters); splits output into a direct answer + a deep survey.

**Snippet:**
> Use DeepSearch (or DeeperSearch for credibility over speed). Restrict to the date window [Month–Month YYYY]. Force a scan of at least 50 sources/posts before concluding — do not terminate early. Output a direct answer section plus a deep survey section, ending with a Key Citations list with descriptive titles. Verify obscure sources (blogs, tweets) before relying on them.

---

## Quick reference

| Tool | One-line tuning |
|---|---|
| ChatGPT | Pre-answer clarifying Qs; lead with verbs + keywords; rewrite first if via API. |
| Gemini | Instructions after data; "Cite all sources"; source-credibility table; edit the plan. |
| Perplexity | Explicit searches not intent; operators; inline [index]; evidence rules in user prompt. |
| Claude | Success criteria + competing hypotheses + confidence; XML constraints; markdown-link citations. |
| Grok | Trigger the mode; date window; force min source count; direct-answer + survey; verify obscure sources. |
