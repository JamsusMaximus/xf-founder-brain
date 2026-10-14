# XF Founder Brain

A second brain for the idea maze. It is a folder Claude Code reads every session, so it knows who you are, which ideas you are testing, what you have learned from each customer call, and what you have already killed.

The aim is simple: more customer discovery interviews, and more learned from each one.

It is a compressed, founder-specific version of [agent-foundations-starter](https://github.com/JamsusMaximus/agent-foundations-starter) by James McAulay, Agent Accelerator. Setup takes 45-60 minutes, including a 15 minute interview.

## Set up

1. **Install Claude Code.** Follow the [quickstart](https://code.claude.com/docs/en/quickstart). On Mac or Linux the native install is:
   ```bash
   curl -fsSL https://claude.ai/install.sh | bash
   ```
   Then open a new terminal and run `claude --version` to check it worked. Homebrew (`brew install --cask claude-code`) and Windows installers are on the same page.
2. **Get this repo.** Either `git clone https://github.com/JamsusMaximus/xf-founder-brain.git` or download the ZIP from the green Code button on GitHub and unzip it. If you want your own private copy, make it a private repo afterwards, since it will hold your notes.
3. **Open it.** In a terminal: `cd xf-founder-brain`, then `claude`. Sign in when prompted.
4. **Connect your tools** (see below). Granola and Apollo are worth doing before you start. Calendar is optional.
5. **Say:** `set up my founder brain`

If the skill does not trigger, paste the kick-off prompt at the bottom of this file.

## Connect your tools

Run these inside this folder. Each takes about a minute.

**Granola** (call notes and transcripts)
```bash
claude mcp add granola --transport http https://mcp.granola.ai/mcp
```
Open a new terminal tab, run `claude` again, type `/mcp`, select `granola` and choose Authenticate. Source: [Granola MCP docs](https://docs.granola.ai/help-center/sharing/integrations/mcp). On Granola's free plan, MCP only reaches notes from the last 30 days.

**Apollo** (look people up before a call)
```bash
claude mcp add --transport http apollo https://mcp.apollo.io/mcp
```
Then type `/mcp` inside Claude Code and complete the sign-in in your browser. You need an Apollo account, and enrichment uses Apollo credits. Apollo asks that model training is switched off in your AI account settings. Source: [Apollo MCP docs](https://docs.apollo.io/docs/apollo-mcp). Without Apollo, `prep-call` falls back to web search.

**Google Calendar** (optional, for prepping a whole day of calls at once)
Connect it from Claude's connectors settings at [claude.ai/customize/connectors](https://claude.ai/customize/connectors). Once you are logged into Claude Code with the same claude.ai account, connectors appear in `/mcp` automatically. Claude Code's docs say Google Calendar must be connected this way rather than with `claude mcp add`. Source: [Claude Code MCP docs](https://code.claude.com/docs/en/mcp). The exact click path inside the connectors page was not checked, so look for Google Calendar in the list.

## What happens in the interview

About 15 minutes, one question at a time. Drop in your LinkedIn PDF first so you do not retype your history. It covers your background, your XF context, the idea maze (each idea becomes a file), your goals, and your coaching style. Claude shows you what it will save before saving anything, and never overwrites existing files.

## Day to day

- **Before a call:** `prep-call <name, email, company or LinkedIn URL>`. Writes a one page brief to `calls/`. Say `prep today's calls` to do the whole calendar.
- **After a call:** Granola notes land in `calls/YYYY-MM-DD-<person>.md`. Ask Claude to update the idea file with what you learned.
- **Idea dies:** ask Claude to move it to `ideas/killed/` with the evidence.
- **Grading calls:** `customer-discovery-grading` is a placeholder until the rubric is finalised.

## Folder map

```
README.md                 this file
CLAUDE.md                 rules Claude follows every session (coaching style filled by interview)
context/founder.md        who you are (filled by interview)
ideas/                    one file per live idea, plus _template.md
ideas/killed/             every dead idea: evidence, why it died, what carries over
calls/                    call notes, grades and pre-call briefs
prompts/founder-interview.md   the interview script
.claude/skills/           set-up-founder-brain, prep-call, customer-discovery-grading
```

## Kick-off prompt (fallback)

```
I'm setting up xf-founder-brain. Read README.md, CLAUDE.md and
prompts/founder-interview.md in this folder. Check which of context/founder.md,
ideas/ and the coaching section of CLAUDE.md are still placeholders. Then run
the founder interview one question at a time, starting by asking me for my
LinkedIn PDF. Probe once if I am vague. Show me proposed content before saving,
and never overwrite anything that already has real content.
```

---
Built by James McAulay, Agent Accelerator: https://agentaccelerator.ai
