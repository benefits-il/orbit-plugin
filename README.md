<p align="center">
  <img src="images/orbit-banner.svg" alt="ORBIT Plugin" width="600">
</p>

<h1 align="center">ORBIT</h1>

<p align="center">
  <strong>Stop prompting. Start routing.</strong>
</p>

<p align="center">
  <a href="https://benefits-il.github.io/orbit-plugin">Landing Page</a> ·
  <a href="#installation">Installation</a> ·
  <a href="#the-5-patterns">Patterns</a> ·
  <a href="#how-it-works">How It Works</a> ·
  <a href="README-he.md">עברית</a>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Claude_Code-Plugin-00d4ff?style=flat-square&logo=data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAxMDAgMTAwIj48Y2lyY2xlIGN4PSI1MCIgY3k9IjUwIiByPSI0MCIgZmlsbD0ibm9uZSIgc3Ryb2tlPSIjMDBkNGZmIiBzdHJva2Utd2lkdGg9IjQiLz48Y2lyY2xlIGN4PSI1MCIgY3k9IjEwIiByPSI4IiBmaWxsPSIjMDBkNGZmIi8+PC9zdmc+" alt="Claude Code Plugin">
  <img src="https://img.shields.io/badge/Patterns-5+2-7c3aed?style=flat-square" alt="5+2 Patterns">
  <img src="https://img.shields.io/badge/License-MIT-f59e0b?style=flat-square" alt="MIT License">
</p>

---

## What is ORBIT?

You know that thing where you have Claude open in one tab, GPT in another, maybe Perplexity for research, and you're copy-pasting between them like a human USB cable? ORBIT turns that chaos into a methodology. Instead of writing prompts from scratch every time, you ask one agent to generate a prompt for another agent. Every generated prompt is completely self-contained — the receiving agent has zero context about your project. You become a router, carrying structured artifacts between specialized agents. You coordinate the orchestra — you don't play every instrument.

---

## The 5 Patterns

| Letter | Pattern | Description |
|--------|---------|-------------|
| **O** | **Orchestrate** | Your AI project manager — coordinates multi-step projects across agents |
| **R** | **Recon** | Your eyes on target — structured observation with a defined report format |
| **B** | **Boomerang** | Your research department — generates both search queries and analysis template |
| **I** | **Interchange** | Your referral system — clean agent-to-agent handoff with zero context loss |
| **T** | **Transfer** | Your save game button — full state capture for session continuity |

Plus **2 compound workflows**:
- **KB Builder** (B + O) — 4-stage pipeline from scattered research to organized knowledge base
- **Design Pipeline** (B + KB + O) — 10-stage pipeline from PRD to production-ready design system

---

## Bundled Extension — Research Architect

Beyond the 5 patterns and 2 workflows, the plugin bundles **research-architect** — the ORBIT research-spec engine. It turns any topic into a world-class, tool-tuned **deep-research specification** (a precise brief, not a vague question) that you paste straight into ChatGPT, Gemini, Perplexity, Claude, or Grok. It builds a 9-field universal core, appends ready-to-paste per-tool deltas, and runs a failure-mode self-check before emitting the brief.

This is an **extension to ORBIT, not a sixth pattern** — the 5 atomic patterns and 2 compound workflows above remain the methodology. research-architect is the engine that **Boomerang (B)** and **KB Builder** call to write their research brief, and you can also invoke it directly with `/orbit:research-architect`.

---

## Installation

### Option 1 — CLI (recommended)

```
/install-plugin github:benefits-il/orbit-plugin
```

### Option 2 — Manual Download

1. **[Download orbit-plugin.zip](https://github.com/benefits-il/orbit-plugin/releases/latest/download/orbit-plugin.zip)**
2. Extract and copy the contents into your project's `.claude/plugins/orbit/` directory
3. Restart Claude Code

---

Verify with `/orbit:help` — you should see all 5 atomic patterns and 2 compound workflows.

Try your first pattern: `/orbit:boomerang` with a simple research task.

---

## Slash Commands

| Command | What it does |
|---------|-------------|
| `/orbit:orchestrate` | Set up a planning agent for multi-step projects |
| `/orbit:recon` | Generate observation prompts for a specific target |
| `/orbit:boomerang` | Generate research + analysis prompt pair |
| `/orbit:interchange` | Generate agent-to-agent handoff prompts |
| `/orbit:transfer` | Generate a full state capture for session continuity |
| `/orbit:kb-builder` | Run the 4-stage research-to-knowledge-base pipeline |
| `/orbit:design-pipeline` | Run the 10-stage design research pipeline |
| `/orbit:research-architect` | Build a tool-tuned deep-research specification (bundled extension) |
| `/orbit:help` | Show all commands and quick usage guide |

---

## How It Works

Let's walk through a real example. Say you need to research your competitors' pricing strategies before a board meeting.

**Step 1: Describe the mission to ORBIT**
Open Claude Code and run `/orbit:boomerang`. Describe the mission: "I need a competitive analysis of pricing models for developer tools in the AI space — specifically Cursor, Windsurf, and Copilot." ORBIT asks a few clarifying questions, then generates two prompts. Under the hood, ORBIT builds Prompt A with its bundled **research-architect** engine — so the brief is a tool-tuned research specification, not a vague query.

**Step 2: Carry Prompt A to your research tools**
Prompt A contains specific search queries, optimized for the tools you'll use. Paste it into Perplexity, or GPT with web search, or whatever you prefer. The prompt tells the tool exactly what to look for, what format to return results in, and what to ignore. Collect the raw findings.

**Step 3: Bring the results back with Prompt B**
Paste the raw research results back into Claude Code along with Prompt B. This prompt is an analysis template — it tells the agent how to process, compare, and structure the findings. The output is a clean, structured competitive analysis. Not a wall of text — a document with clear categories, comparisons, and takeaways.

**Step 4: Route the output wherever it needs to go**
Maybe the analysis feeds into a presentation (use `/orbit:interchange` to hand it off to a presentation-building agent). Maybe it feeds into a larger strategy document (use `/orbit:orchestrate` to coordinate the full project). The output is always structured enough to become input for the next step.

That's the loop. Describe the mission, ORBIT generates the prompts, carry them between agents, structured artifacts flow back. The human in the middle is the router — the agents do the heavy lifting.

---

## When to Use What

| Situation | Use This | Why |
|-----------|----------|-----|
| Multi-step project with 3+ agents involved | **Orchestrate** | You need a planner to coordinate the sequence and track progress |
| Need to analyze a codebase or repo you have access to | **Recon** | Structured observation with a defined report format |
| Research a topic using multiple AI tools | **Boomerang** | Generates both the search queries and the analysis framework |
| One agent finished work, another needs to continue it | **Interchange** | Clean handoff with zero context loss |
| Conversation getting too long, need a fresh start | **Transfer** | Full state capture so you lose nothing |
| Need to build a comprehensive knowledge base from scratch | **KB Builder** | End-to-end pipeline from scattered research to organized document |
| Designing a product UI/UX with research backing | **Design Pipeline** | Full 10-stage process from brief to production design system |
| Not sure which pattern to use | Start with **Boomerang** | Research first, then decide your next move based on findings |

---

## Local Development

```bash
git clone https://github.com/benefits-il/orbit-plugin.git
cd orbit-plugin
# Follow local setup instructions in CONTRIBUTING.md
```

---

## Full Documentation

See the [landing page](https://benefits-il.github.io/orbit-plugin) for full bilingual documentation, interactive FAQ, and visual guides.

---

## License

MIT — see [LICENSE](LICENSE) for full terms.

---

<p align="center">
  <sub>Built by <a href="https://github.com/benefits-il">Ben Akiva</a></sub>
</p>
