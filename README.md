# XF Founder Brain

**New? Do Mode A. Already have a context folder? Do Mode B.**

A second brain for the idea maze: a folder your coding agent reads every session, so it knows who you are, which ideas you are testing, what each customer call taught you, and what you have killed. The aim is more customer interviews, and more learned from each one.

A compressed, founder-specific version of [agent-foundations-starter](https://github.com/JamsusMaximus/agent-foundations-starter) by James McAulay, Agent Accelerator. About 45-60 minutes, including a 15 minute interview. Works with **Claude Code (recommended)** or **Codex**.

## Hour checklist

1. Install your tool (below).
2. Mode A or Mode B (below).
3. Connect Granola and Apollo (below).
4. **Last step, both modes: grade your past calls.** The setup ends by offering to pull every past customer interview from Granola (or from transcripts you paste or drop in `calls/`) and grade each one, then a summary per idea.

## Install

**Claude Code** (recommended). Follow the [quickstart](https://code.claude.com/docs/en/quickstart). Mac or Linux:
```bash
curl -fsSL https://claude.ai/install.sh | bash
```
Open a new terminal and run `claude --version`. Sign in when you first run `claude`.

**Codex.** Per [OpenAI's Codex CLI docs](https://developers.openai.com/codex/cli), Mac or Linux:
```bash
curl -fsSL https://chatgpt.com/codex/install.sh | sh
```
Windows (PowerShell): `powershell -ExecutionPolicy ByPass -c "irm https://chatgpt.com/codex/install.ps1 | iex"`. Also available via `npm install -g @openai/codex` or `brew install --cask codex`. Then run `codex` and sign in.

## Mode A: from scratch

1. `git clone https://github.com/JamsusMaximus/xf-founder-brain.git`, or download the ZIP from the green Code button and unzip it. **Make your own copy private** (a private repo, or just keep it local): `calls/` will hold notes about real people.
2. `cd xf-founder-brain`, then `claude` (or `codex`).
3. Say: `set up my founder brain`. It will say it is in Mode A and run the interview. Have your LinkedIn PDF ready.

## Mode B: upgrade your existing folder

Already on James's earlier starter, or your own folder of notes? Open **your existing folder** in Claude Code or Codex and paste this. It fetches what it needs from GitHub, so it works even though the skills are not in your folder yet.

```
I want to upgrade this folder into a "founder brain" (Mode B). Fetch what you
need from https://github.com/JamsusMaximus/xf-founder-brain (raw files at
https://raw.githubusercontent.com/JamsusMaximus/xf-founder-brain/main/):
README.md, AGENTS.md, prompts/founder-interview.md, ideas/_template.md,
ideas/README.md, ideas/killed/README.md, calls/README.md, and the three
SKILL.md files under .claude/skills/ (set-up-founder-brain, prep-call,
customer-discovery-grading). Read .claude/skills/set-up-founder-brain/SKILL.md
and follow its Mode B.

In short:
1. Inventory what exists here (CLAUDE.md / AGENTS.md, context/, goals, notes,
   skills) and summarise it back in a few lines.
2. Map it to the founder interview. Ask me ONLY the gaps, one question at a time.
3. Show my instruction-file changes as a diff: lean founder rules, read
   context/, ideas/ and calls/ each session, a decisions log, my coaching
   style. Merge with my existing rules, flag conflicts (e.g. a rule that
   encourages building), and apply only after I approve.
4. Add what is missing: ideas/ (template plus killed/), calls/, and the three
   skills, in .claude/skills/ for Claude Code or .agents/skills/ for Codex.
   Never overwrite a file with the same name: show both and ask.
5. List what you added, changed and left alone.
6. LAST STEP: offer to pull every past customer interview from Granola (or
   from transcripts I paste or drop into calls/; Granola's free plan only
   reaches the last 30 days). Warn me before grading a large batch. Run the
   customer-discovery-grading skill on each, then its batch-mode synthesis
   per idea.
```

If you have the repo cloned instead, just say `set up my founder brain`: the skill detects Mode B itself.

## Connect your tools

Granola (call notes) and Apollo (look people up before a call) are worth doing before the last step. Calendar is optional.

**Claude Code**, run inside your folder:
```bash
claude mcp add granola --transport http https://mcp.granola.ai/mcp
claude mcp add --transport http apollo https://mcp.apollo.io/mcp
```
Then start `claude`, type `/mcp`, pick each server and authenticate in the browser. Sources: [Granola MCP docs](https://docs.granola.ai/help-center/sharing/integrations/mcp), [Apollo MCP docs](https://docs.apollo.io/docs/apollo-mcp). Granola's free plan reaches only the last 30 days of notes. Apollo needs an account, and enrichment uses credits. Without Apollo, `prep-call` falls back to web search.

**Codex.** Apollo, from [Apollo's docs](https://docs.apollo.io/docs/apollo-mcp): add to `~/.codex/config.toml`
```toml
[mcp_servers.apollo]
url = "https://mcp.apollo.io/mcp"
```
then run `codex mcp login apollo` and finish the sign-in in your browser. Granola, same pattern from [Codex's MCP docs](https://developers.openai.com/codex/mcp) (`codex mcp add <name> --url <url>`; `codex mcp login <name>`; `/mcp` in the TUI lists servers):
```bash
codex mcp add granola --url https://mcp.granola.ai/mcp
codex mcp login granola
```
**Unverified:** Granola's own docs do not mention Codex, so that Granola command is built from the two docs above and not tested. If it fails, add a `[mcp_servers.granola]` table with `url = "https://mcp.granola.ai/mcp"` in `config.toml`, as for Apollo. No Granola in Codex? Paste transcripts into `calls/` instead.

**Google Calendar** (optional, Claude Code): connect it in Claude's connectors settings at [claude.ai/customize/connectors](https://claude.ai/customize/connectors); with the same account it appears in `/mcp`. See the [Claude Code MCP docs](https://code.claude.com/docs/en/mcp). I have not checked the exact click path. Not set up for Codex here; skip it and paste call lists to `prep-call`.

## Day to day

- **Before a call:** `prep-call <name, email, company or LinkedIn URL>`, or `prep today's calls`. Writes a one page brief to `calls/`.
- **After a call:** notes land in `calls/YYYY-MM-DD-<person>.md`. Say `grade my call` for a craft score out of 10, the evidence level, and the one question you should have asked.
- **Idea dies:** ask your agent to move it to `ideas/killed/` with the evidence and a line in `decisions.md`.

## Folder map

```
README.md                      this file
AGENTS.md                      canonical rules for any agent (coaching style filled by interview)
CLAUDE.md                      one line: imports AGENTS.md for Claude Code
context/founder.md             who you are (filled by interview)
ideas/                         one file per live idea, plus _template.md
ideas/killed/                  dead ideas: evidence, why they died, what carries over
calls/                         call notes, grades and pre-call briefs
decisions.md                   every pivot, kill or commitment (created by setup)
prompts/founder-interview.md   the interview script
.claude/skills/                the three skills, for Claude Code
.agents/skills/                identical copy, for Codex (scripts/sync-skills.sh keeps them in sync)
```

## How the two tools are supported

Claude Code reads `CLAUDE.md`, which imports `AGENTS.md` with `@AGENTS.md` ([Claude Code memory docs](https://code.claude.com/docs/en/memory)). Codex reads `AGENTS.md` directly ([Codex AGENTS.md docs](https://developers.openai.com/codex/guides/agents-md)). Claude Code loads skills from `.claude/skills`; Codex loads repo skills from `.agents/skills` ([Codex skills docs](https://developers.openai.com/codex/skills)). Two plain copies, not a symlink, so ZIP downloads and Windows work. `AGENTS.md` also says where the skills live, as a fallback for any other tool.

## Kick-off prompt (Mode A fallback)

If the skill does not trigger:

```
I'm setting up xf-founder-brain (Mode A). Read README.md, AGENTS.md and
prompts/founder-interview.md in this folder. Check which of context/founder.md,
ideas/ and the coaching section of AGENTS.md are still placeholders. Run the
founder interview one question at a time, starting by asking for my LinkedIn
PDF. Probe once if I am vague. Show me proposed content before saving, and
never overwrite anything with real content. Last step: offer to pull my past
customer interviews from Granola (free plan: last 30 days) or from transcripts
in calls/, warn me before a large batch, grade each with
customer-discovery-grading, then give me its batch synthesis per idea.
```

---
Built by James McAulay, Agent Accelerator: https://agentaccelerator.ai
