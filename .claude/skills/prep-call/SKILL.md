---
name: prep-call
description: Prepare a one page pre-call brief for a customer discovery call. Takes a person's name, email, company or LinkedIn URL. Also has a batch mode that preps every call on today's calendar. Use when the user says "prep my call with X", "brief me on X", or "prep today's calls".
---

# Prep a customer discovery call

## Single person
Input: a name, email, company or LinkedIn URL. Ask for one only if none was given.

1. **Enrich.** If the Apollo connector is connected (check `/mcp` or the available tools), use people match / enrichment on whatever identifier you have. Apollo can spend credits: say so before a batch of more than a few.
2. **Fallback.** If Apollo is not connected or finds nothing, use web search (company site, LinkedIn page if public, recent news). Mark anything not confirmed as "unverified". Never invent a job title, employer or fact.
3. **Read the relevant `ideas/` file.** If several fit, pick the one the call most likely tests and say so. If none fit, ask which idea this call is for.
4. **Write `calls/YYYY-MM-DD-<person>-brief.md`** (today's date, person as lowercase-hyphenated name), one page:
   - **Who they are:** role, company, background, in 3-4 lines.
   - **Likely context:** what their world probably looks like around the problem.
   - **Hypothesis this call tests:** quoted from the idea file, plus what answer would change my mind.
   - **Questions (5-7), Mom Test style:** about past behaviour and real specifics ("Tell me about the last time you...", "What did you do about it?", "What does it cost you?", "Who else was involved?"). No pitching, no hypotheticals, no "would you use".
   - **Strong commitment signal:** what would count here (a paid pilot, an intro to the budget holder, a follow-up call booked on the spot, access to their data). Compliments are not signals.
5. Keep it to one page. Skim-friendly.

## Batch mode: "prep today's calls"
Works if a calendar connector (for example Google Calendar) is connected.
1. List today's events. Keep the external 1:1 calls (skip internal and focus blocks), and show the list for a quick confirm.
2. For each attendee, run the single-person steps. Work through them quickly: reuse the same idea file read, enrich in bulk where the tool allows it, and keep each brief to one page.
3. Finish with a table: time, person, company, idea tested, the one question to not forget.
4. If no calendar connector exists, say so and ask the founder to paste the list of names or emails.
