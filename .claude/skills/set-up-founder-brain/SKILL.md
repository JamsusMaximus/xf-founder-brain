---
name: set-up-founder-brain
description: Set up the founder brain in one of two modes. Both start by reading the founder's LinkedIn PDF and run a "find your edge" step (EF's Edge framework). Mode A (from scratch) runs the founder interview. Mode B (upgrade) takes an existing context folder, maps it to the founder brain, asks only the gaps, and merges the founder rules into the existing instruction file after approval. Detects the mode automatically, checks privacy and tool connections first, offers a quick-win grade of the latest call, and ends by grading the founder's past calls. Use when the user says "set up my founder brain", "upgrade my folder", "onboard me", "run the interview".
---

# Set up the founder brain

Order: detect mode, first-run checks, LinkedIn, quick win, then Mode A (background, edge, rest of the interview) or Mode B (inventory, edge, gaps), and finally grade the rest.

Rules for both modes: one question at a time; probe a vague answer once, then move on; never assume the XF timeline ("don't know yet" is recorded as unverified); collect answers and propose all file changes once at the end, never write mid-interview; leave sensitive personal matters out unless asked in. Follow `guardrails.md`, and the founder's own rules and guardrails win on any conflict.

## Step 0: detect the mode and say which one

Base URL for fetching files: `https://raw.githubusercontent.com/JamsusMaximus/xf-founder-brain/main/`.

- **Mode A (from scratch):** a fresh copy of this repo or an empty folder. `context/founder.md` and the coaching section of `AGENTS.md` are still placeholders.
- **Mode B (upgrade):** the folder already holds the founder's own material: a `CLAUDE.md` or `AGENTS.md` that is not this template, `context/`, goals, notes, or existing skills.
- Unsure? Say what you found and ask. Always announce: "I am in Mode A" or "I am in Mode B, because...". Say the setup takes about 40 minutes, plus grading past calls (about 30 with the short edge version).

## Step 1: first-run checks (about 3 minutes)

1. **Privacy.** Run `git remote -v`.
   - Mode A, remote is the public `JamsusMaximus/xf-founder-brain`: explain that this folder will hold notes about real people, and offer to run `git remote remove origin`.
   - Mode B, any remote: say where it points. If it is a public repo, an old company's org or anything shared, warn before anything lands in `calls/`, and offer to remove or change the remote.
2. **Tool connections, all optional.** Check your MCP list (`/mcp` or the tool list) for Granola and Apollo and say which are connected. Neither is needed: without Granola, paste or drop files in `calls/` (Otter, Fireflies, Zoom exports, voice memos and typed notes all work); without Apollo, `prep-call` uses web search. Do not stop the setup to connect them; point at the README's "Connect your tools" if they want to.

## Step 2: LinkedIn (about 3 minutes, both modes)

So the founder never retypes their history:

"Save your LinkedIn profile as a PDF. On a computer, not the app: click **Me** at the top of LinkedIn, then **View profile**, then **More** (or **Resources**) in your intro section, then **Save to PDF**. Drag the file into this window or give me its path. No LinkedIn, or it won't export? Paste your CV or profile text instead."

- LinkedIn's help says this works on desktop only, and only when the profile language is English ([LinkedIn Help](https://www.linkedin.com/help/linkedin/answer/a541960)).
- Read the PDF directly. If your tool cannot read PDFs, ask for the pasted text.
- Turn it into `context/linkedin.md`: roles with dates, education, skills and recommendations, converted not summarised. It joins the single proposal at the end, like every other file.
- Use it to pre-fill the background and as the first evidence for the edge step. Say what you took from it; never ask a question it already answers.
- Mode B with a `context/linkedin.md` already? Ask if it is current, and skip this if so.

## Step 3: quick win (about 5–10 minutes, skip if no calls)

"Before the interview: want me to grade your most recent customer call? Pull it from Granola, or paste it or drop the file in `calls/`."

Run `customer-discovery-grading` on that one call (save the raw text as `calls/YYYY-MM-DD-<person>.transcript.md`). If no `ideas/` file exists yet, grade the craft and the evidence level only, and note the idea update for after the interview. No call? Move straight on.

## Mode A: from scratch

Run `prompts/founder-interview.md`. After the background section it runs `prompts/edge-interview.md` (find your edge: 10–15 minutes, or 5 in its short version). It ends with one proposal covering `context/founder.md`, `context/linkedin.md`, `context/edge.md`, `ideas/`, `people.md`, the "Coaching style" and "My rules" sections of `AGENTS.md`, and `decisions.md`, approved once. Then the optional market scan, then "Last step".

## Mode B: upgrade an existing folder

Fetch whatever is missing from the base URL (never from memory): `prompts/founder-interview.md`, `prompts/edge-interview.md`, `ideas/_template.md`, `ideas/README.md`, `ideas/killed/README.md`, `calls/README.md`, `AGENTS.md`, `guardrails.md`, `people.md`, and the three `SKILL.md` files under `.claude/skills/` (Claude Code) or `.agents/skills/` (Codex; same content).

1. **Inventory.** Read what exists: instruction files, `context/`, goals, notes, `research/`, competitor dumps, todo files, existing skills, any `guardrails.md` and any index file. Ask before reading anything the founder's own rules mark as off-limits. Then show one short table: file, what it holds, its home in the founder brain, and status:
   - **Staleness:** use file dates and ask "what has changed since you wrote these?". Mark each file CURRENT, STALE or PARTLY. A stale file never answers an interview question. Offer to move stale files to `context/archive-YYYY-MM/` (a move, approved by the founder, not a delete).
   - **Contradictions:** list them (for example two market sizes in two decks) and ask; never pick one silently. Unverified claims become hypotheses in an idea file.
   - **Past calls:** search notes, daily notes, meeting folders and Otter, Zoom or voice-memo transcripts for customer conversations, and offer them as `calls/` entries before going to Granola.
   - **Obsidian or other PKM vault:** ask how they link and file (wikilinks, daily notes, tags) and follow that convention for everything you write.
2. **Find your edge.** Run `prompts/edge-interview.md`. Their existing files are the richest material it will get: mine the inventory, LinkedIn, old company material and their writing first, and ask only what the files cannot answer. If they already have a strengths or positioning doc, build on it rather than replacing it.
3. **Map to the interview.** Show which question each existing file answers, and ask ONLY the gaps, one at a time (the edge section is done: skip it). Do not reorganise their files to match ours.
4. **Instruction-file changes, as one diff.** Propose: the default rules, the session-start read line (merged with any they have, as one line), the line about checking new ideas against `context/edge.md`, the data section, coaching style and 2–4 proposed founder-specific rules from the interview. Before applying, **scan for every conflict**, not just "build fast":
   - speed ("ship daily", "build the MVP first");
   - structure ("never add folders", an existing filing scheme);
   - privacy ("never store client names": use pseudonymised call file names);
   - stale goals or rules from a previous job or company;
   - style versus skill output (format or length rules the skills would break);
   - rituals on every task ("always run tests", "always read X").
   Show a table: existing rule, conflict, proposed resolution. The founder decides; their guardrails always win. Apply after one approval. Notes about removed or changed rules go in `decisions.md`, never in the instruction file.
   - **Which file:** Claude Code reads `CLAUDE.md`, Codex reads `AGENTS.md`. If only a `CLAUDE.md` exists and they use Codex (or both tools), create `AGENTS.md` from it and leave `CLAUDE.md` as the single line `@AGENTS.md`. Ask first.
   - **Old code repo?** Offer to move coding rules and build commands into a scoped file (for example `src/CLAUDE.md`) so the root file stays lean.
5. **Add what is missing.** `ideas/` (with `_template.md`, `README.md`, `killed/README.md`), `calls/` (with `README.md`), `people.md`, and `guardrails.md` if they have none (if they have one, keep theirs and offer only the missing lines). Create `context/founder.md` (thin, pointing at their existing files), `context/linkedin.md`, `context/edge.md` and `decisions.md` if missing. Install the skills where the tool reads them: `.claude/skills/<name>/` for Claude Code, `.agents/skills/<name>/` for Codex (both if unsure).
   - **Name clash** (for example they already have a `prep-call`): agree a new name first (for example `prep-discovery-call`), change the `name:` line, and update every reference to it (`AGENTS.md`, the other two skills, any index).
   - Never overwrite a file with real content: show both and ask. If they keep ideas or call notes elsewhere, ask whether to use that folder instead. If they have an index file, add the new files to it.
6. Turn existing idea notes into `ideas/<name>.md` (with an Edge fit score) and dead ones into `ideas/killed/<name>.md`, all in the same single proposal.
7. **Finish** with what was added, changed, archived and left alone. Then "Last step".

## Last step (both modes): grade the remaining past calls

"Let's grade the rest of your customer calls. I can pull them from Granola if connected, or paste them or drop files in `calls/` (Otter, Fireflies, Zoom, voice memos and typed notes all work)."

1. If Granola is connected, list past customer-style meetings and let the founder tick the real discovery calls. Granola's free plan only reaches the last 30 days: ask them to paste or drop in anything older.
2. **Warn before a large batch.** More than about 5 calls takes several minutes. Offer the 3 most recent first, or the rest in the background.
3. Run `customer-discovery-grading` on each. Add anyone worth a follow-up, and any promised intro, to `people.md`.
4. Finish with its batch-mode synthesis per idea and the recommendation.
5. No past calls? Point at `people.md`: pick three names, draft the ask, and book the first call. Mention `prep-call` as the day-to-day tool.
