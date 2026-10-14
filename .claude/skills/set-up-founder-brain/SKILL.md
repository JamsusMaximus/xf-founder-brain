---
name: set-up-founder-brain
description: Set up the founder brain in one of two modes. Mode A (from scratch) runs the 15 minute founder interview. Mode B (upgrade) takes an existing context folder, maps it to the founder brain, asks only the gaps, and merges the founder rules into the existing instruction file after approval. Detects the mode automatically. Ends by grading the founder's past calls. Use when the user says "set up my founder brain", "upgrade my folder", "onboard me", "run the interview".
---

# Set up the founder brain

## Step 0: detect the mode and say which one

Base URL for fetching files: `https://raw.githubusercontent.com/JamsusMaximus/xf-founder-brain/main/` (also `github.com/JamsusMaximus/xf-founder-brain`).

Look at the current folder.

- **Mode A (from scratch):** this is a fresh copy of the repo, or an empty folder. Signs: `context/founder.md` and the coaching section of `AGENTS.md` still say "Placeholder" or "Not yet captured", and there is nothing else of substance.
- **Mode B (upgrade):** the folder already holds the founder's own material. Signs: a `CLAUDE.md` or `AGENTS.md` with real content that is not this repo's template, a `context/` folder, a goals file, a notes folder, or existing skills (`.claude/skills`, `.agents/skills`, `skills/`).
- Unsure? Say what you found and ask which mode. Always announce: "I am in Mode A" or "I am in Mode B, because...".

Rules for both modes: one question at a time; probe a vague answer once, then move on; never assume the XF programme timeline, ask for dates; propose then save, never write mid-interview; never overwrite a file with real content; leave sensitive personal matters out unless asked in.

## Mode A: from scratch

Follow `prompts/founder-interview.md` exactly.

1. Tell the founder in a few lines what is filled and what is a gap.
2. Ask for the LinkedIn PDF (or pasted profile) first, summarise it back, confirm.
3. Run the interview. Write live ideas to `ideas/<name>.md` from `ideas/_template.md`, killed ideas to `ideas/killed/<name>.md`, background, XF context and goals to `context/founder.md`, and only replace the coaching placeholder in `AGENTS.md`.
4. Go to "Last step" below.

## Mode B: upgrade an existing folder

Fetch whatever is missing from the base URL (never from memory): `prompts/founder-interview.md`, `ideas/_template.md`, `ideas/README.md`, `ideas/killed/README.md`, `calls/README.md`, `AGENTS.md`, and the three `SKILL.md` files under `.claude/skills/`.

1. **Inventory.** Read what exists: `CLAUDE.md`, `AGENTS.md`, `context/`, goals, notes, existing skills. Summarise it back in a few lines and ask the founder to correct it.
2. **Map to the founder brain.** Go through the interview questions (background, XF context, idea maze, goals, coaching style). Show a short table: question, answered by which existing file, or gap. Ask ONLY the gaps, one at a time. Do not reorganise their files to match ours; point at where the answer already lives.
3. **Suggest instruction-file changes as a diff.** Show the proposed edit to their instruction file: the six firm rules from `AGENTS.md`, the read-`context/`-`ideas/`-`calls/`-every-session line, the decisions log, and the coaching style from the gap answers. Apply only after the founder approves.
   - Merge, never overwrite. Keep every existing rule.
   - **Flag conflicts** before applying: for example an existing rule that encourages building fast, shipping an MVP, or writing code first. Show both rules and ask which wins.
   - Which file: if they use one tool, edit its file (`CLAUDE.md` for Claude Code, `AGENTS.md` for Codex). If they use both, offer: put the content in `AGENTS.md` and make `CLAUDE.md` contain only `@AGENTS.md` (Claude Code reads `AGENTS.md` alone only when no `CLAUDE.md` exists, so the import is needed). Ask first.
4. **Add what is missing.** Add `ideas/` (with `_template.md`, `README.md`, `killed/README.md`), `calls/` (with `README.md`) and the three skills. Install skills into the folder the tool reads: `.claude/skills/<name>/SKILL.md` for Claude Code, `.agents/skills/<name>/SKILL.md` for Codex (copy to both if unsure). Never overwrite an existing file with the same name; if one clashes, show both and ask. If they already keep ideas or call notes elsewhere, ask whether to keep using that folder instead of creating a new one.
5. Turn any existing idea notes into `ideas/<name>.md` and dead ones into `ideas/killed/<name>.md`, showing each first.
6. **Finish** with a list of what was added, what was changed, and what was left alone. Then go to "Last step".

## Last step (both modes): grade the past calls

Setup is not finished until this is offered. Say:

"Last step: let's grade the customer interviews you have already done. I can pull them from Granola if it is connected, or you can paste transcripts or drop files into `calls/`. Granola's free plan only reaches the last 30 days of notes."

1. If Granola is connected, list the founder's past customer-style meetings and let them tick which are real customer discovery calls. Otherwise ask for pasted transcripts or files in `calls/`.
2. **Warn before a large batch.** More than about 5 calls takes a while (several minutes). Offer to start with the 3 most recent, or to run the rest in the background.
3. Run `customer-discovery-grading` on each call, one by one, saving `calls/YYYY-MM-DD-<person>.md`.
4. Finish with its **batch mode** synthesis per idea (segment by segment), and the recommendation: keep interviewing, narrow, test with a real commitment, or kill.
5. If there are no past calls, say so, point at `prep-call`, and book the first one.
6. Mention `prep-call` as the day-to-day tool.
