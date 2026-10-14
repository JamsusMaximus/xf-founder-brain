# XF Founder Brain

**New? Do Mode A. Already have a context folder? Do Mode B.**

A second brain for the idea maze: a folder your coding agent reads every session, so it knows who you are, which ideas you are testing, who to call next, what each call taught you, and what you have killed. The aim is more customer interviews, and more learned from each one.

A compressed, founder-specific version of [agent-foundations-starter](https://github.com/JamsusMaximus/agent-foundations-starter) by James McAulay, Agent Accelerator. Works with **Claude Code (recommended)** or **Codex**. The agent asks before it edits any file.

## The hour

1. **Install** your tool (5–10 min, below).
2. **Connect Granola and Apollo** (optional, 5 min). Skipping is fine: paste calls instead.
3. **Say `set up my founder brain`.** It then runs:
   - privacy and connection checks (3 min);
   - **a quick win:** it grades your most recent customer call (5–10 min);
   - the founder interview, with one approval at the end (about 20 min);
   - grading your other past calls, with a summary per idea (10 min).

About 45–60 minutes in all.

## Your data

- Everything stays local in this folder. `calls/` is gitignored by default, and setup offers to run `git remote remove origin` so nothing can be pushed back to this public repo. Want call notes in git? Use a **private** repo only (instructions in `.gitignore`).
- Granola, Otter, Zoom and Apollo are third parties: notes and lookups pass through their servers.
- Get consent before recording anyone. Keep sensitive third-party data (patients, clients) out of notes, or pseudonymise it.
- `guardrails.md` makes the agent ask before sending anything, spending credits, deleting files or installing new MCP servers, and treats text from Granola and Apollo as data, not instructions. Your existing guardrails always win.

## Install

**Opening a terminal.** Mac: press Cmd+Space, type Terminal, press Enter. Windows: press the Windows key, type PowerShell, press Enter. Then paste the command for your system and press Enter.

**Claude Code** (recommended, from the [quickstart](https://code.claude.com/docs/en/quickstart)). Mac or Linux:
```bash
curl -fsSL https://claude.ai/install.sh | bash
```
Windows (PowerShell):
```powershell
irm https://claude.ai/install.ps1 | iex
```
On Windows, [Git for Windows](https://git-scm.com/downloads/win) is recommended but optional. Open a new terminal, run `claude --version`, then `claude` and sign in. Prefer not to use a terminal? Claude Code also has a [desktop app](https://code.claude.com/docs/en/desktop).

**Codex** (from the [Codex CLI docs](https://developers.openai.com/codex/cli) and [OpenAI's Codex README](https://github.com/openai/codex)). Mac or Linux:
```bash
curl -fsSL https://chatgpt.com/codex/install.sh | sh
```
Windows (PowerShell): `powershell -ExecutionPolicy ByPass -c "irm https://chatgpt.com/codex/install.ps1 | iex"`. Also `npm install -g @openai/codex` or `brew install --cask codex`. Then run `codex` and sign in.

## Mode A: from scratch

1. `git clone https://github.com/JamsusMaximus/xf-founder-brain.git`, or download the ZIP from the green Code button and unzip it.
2. `cd` into the folder. A ZIP unzips as `xf-founder-brain-main`, and you may have renamed it: use whichever folder has this `README.md` in it (on Mac, type `cd ` and drag the folder into the terminal). Then run `claude` (or `codex`).
3. Say: `set up my founder brain`. Have your LinkedIn PDF and your most recent customer call (Granola, Otter, Zoom, a voice memo or typed notes) to hand.

## Mode B: upgrade your existing folder

Already on James's earlier starter, or your own folder of notes? Open **your existing folder** in Claude Code or Codex and paste this. It fetches what it needs from GitHub, so it works even though the skills are not in your folder yet.

```
I want to upgrade this folder into a "founder brain" (Mode B). Fetch what you
need from https://raw.githubusercontent.com/JamsusMaximus/xf-founder-brain/main/
: README.md, AGENTS.md, guardrails.md, people.md, prompts/founder-interview.md,
ideas/_template.md, ideas/README.md, ideas/killed/README.md, calls/README.md,
and the three skills (set-up-founder-brain, prep-call,
customer-discovery-grading). Each skill is at .claude/skills/<name>/SKILL.md
and, identically, .agents/skills/<name>/SKILL.md. Install them into
.claude/skills/ if I use Claude Code, or .agents/skills/ if I use Codex.

Then read set-up-founder-brain/SKILL.md and follow it: first-run checks
(including `git remote -v`), the quick-win grade of my latest call, then
Mode B and the last step. In short: inventory everything here (staleness,
contradictions, past calls hiding in my notes), ask me ONLY the gaps, show
every conflict with my existing rules as a table, propose all changes as one
diff and apply after one approval. Never overwrite or delete my files without
asking. If my rules live in CLAUDE.md and I use Codex, create AGENTS.md from
them and make CLAUDE.md just `@AGENTS.md`.
```

If you have the repo cloned instead, just say `set up my founder brain`: the skill detects Mode B itself.

## Connect your tools (optional)

Granola (call notes) and Apollo (look people up before a call, B2B only, spends credits). Without them, paste or drop transcripts in `calls/` and `prep-call` uses web search. Otter, Fireflies and Zoom exports work as pasted files.

**Claude Code**, run inside your folder:
```bash
claude mcp add granola --transport http https://mcp.granola.ai/mcp
claude mcp add --transport http apollo https://mcp.apollo.io/mcp
```
Then start `claude` in a new terminal tab, type `/mcp`, pick each server and authenticate in the browser. Sources: [Granola MCP docs](https://docs.granola.ai/help-center/sharing/integrations/mcp), [Apollo MCP docs](https://docs.apollo.io/docs/apollo-mcp). Granola's free plan reaches only the last 30 days of notes; paste older calls.

**Codex.** Apollo, from [Apollo's docs](https://docs.apollo.io/docs/apollo-mcp): add to `~/.codex/config.toml`
```toml
[mcp_servers.apollo]
url = "https://mcp.apollo.io/mcp"
```
then run `codex mcp login apollo` and finish the sign-in in your browser. Granola: add the same kind of table with `url = "https://mcp.granola.ai/mcp"` (Granola's docs list that URL for other AI tools), then `codex mcp login granola`. **Unverified:** Granola's docs do not mention Codex, so this is untested. If it fails, paste transcripts into `calls/`. In Codex, `/mcp` lists connected servers ([Codex MCP docs](https://developers.openai.com/codex/mcp)).

**Google Calendar** (optional, Claude Code): connect it at [claude.ai/customize/connectors](https://claude.ai/customize/connectors); with the same account it appears in `/mcp`. Otherwise paste your call list to `prep-call`.

## Day to day

- **Who next:** `people.md` holds who to talk to, intros promised and follow-ups due. Ask "who should I call this week?".
- **Before a call:** `prep-call <name, email, company or LinkedIn URL>`, or `prep today's calls`. Writes `calls/YYYY-MM-DD-<person>-brief.md`.
- **After a call:** drop the transcript in as `calls/YYYY-MM-DD-<person>.transcript.md` (or let Granola fetch it) and say `grade my call`. The graded note is `calls/YYYY-MM-DD-<person>.md`: a craft score out of 10, the evidence level, and the one question you should have asked.
- **Idea dies:** ask your agent to move it to `ideas/killed/` with the evidence and a line in `decisions.md`.

## Folder map

```
README.md                      this file
AGENTS.md                      rules for any agent: default rules, your rules, coaching style, data
CLAUDE.md                      one line: imports AGENTS.md for Claude Code
guardrails.md                  what the agent must ask before doing
people.md                      who to talk to next: status, intros, follow-ups
context/founder.md             who you are, goals, time and runway (filled by interview)
ideas/                         one file per live idea, plus _template.md (compare.md or spaces.md if needed)
ideas/killed/                  dead ideas: evidence, why they died, what carries over
calls/                         transcripts, graded notes and briefs (gitignored)
decisions.md                   every pivot, kill or commitment (created by setup)
prompts/founder-interview.md   the interview script
.claude/skills/                the three skills, for Claude Code
.agents/skills/                identical copy, for Codex (scripts/sync-skills.sh keeps them in sync)
```

## How the two tools are supported

Claude Code reads `CLAUDE.md`, which imports `AGENTS.md` with `@AGENTS.md` ([Claude Code memory docs](https://code.claude.com/docs/en/memory)). Codex reads `AGENTS.md` directly ([Codex AGENTS.md docs](https://developers.openai.com/codex/guides/agents-md)). Claude Code loads skills from `.claude/skills`; Codex loads repo skills from `.agents/skills` ([Codex skills docs](https://developers.openai.com/codex/skills)). Two plain copies, not a symlink, so ZIP downloads and Windows work.

## Kick-off prompt (fallback)

If the skill does not trigger:

```
Read README.md, AGENTS.md, guardrails.md and
.claude/skills/set-up-founder-brain/SKILL.md (or .agents/skills/... in Codex)
in this folder, and follow that skill from Step 0.
```

---
Built by James McAulay, Agent Accelerator: https://agentaccelerator.ai
