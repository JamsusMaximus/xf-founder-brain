---
name: customer-discovery-grading
description: Grade a customer discovery interview from its transcript or Granola notes. Scores the interview craft out of 10, separately rates the strength of the demand evidence, flags false positives, and updates the matching ideas/ file. Also has a batch mode that synthesises across all calls for one idea. Use when the user says "grade my call", "score this interview", "how did that call go", "grade today's calls", or "what have my calls told me about <idea>".
---

# Customer discovery grading

Two separate judgements, never merged into one number:

1. **Interview craft (out of 10):** did I run the interview well? This is about the founder's behaviour.
2. **Evidence strength:** what did the market actually tell me? A beautifully run interview can show no demand, and a clumsy one can still surface a real lead.

**Most of these calls are pure research.** Founders at this stage often have no product, no solution and nothing to pitch, and that is exactly right. Never penalise the absence of a pitch, a demo or a solution: a call that only explores the person's world can score 10/10. Mentions of pitching below only apply when a founder chose to describe a solution.

Built from The Mom Test (Rob Fitzpatrick), Steve Blank's customer development, Jobs-to-be-Done switch interviews (Bob Moesta) and Teresa Torres's interview snapshots. There is no published, validated universal rubric for this; treat the score as a coaching tool for getting better call by call, not as proof of anything.

## Input

- A Granola note or transcript (pull it via the Granola connector if connected (free plan: last 30 days only), by person name or meeting time), or text the founder pastes.
- If the transcript labels speakers (for example "Me" and "Them"), use that for talk ratio. If it does not, say talk ratio could not be measured and score that criterion from the questions alone.
- Read the matching `calls/YYYY-MM-DD-<person>-brief.md` if it exists (it states which hypothesis the call was meant to test) and the matching `ideas/<idea>.md`.
- If the call was exploratory (a space, not a hypothesis), that is fine: grade the craft the same way and record what was learned about the space instead of a verdict.

## Part 1: interview craft, 0–2 per criterion, total out of 10

0 = not done, 1 = partly, 2 = done well. Quote the transcript for every score.

| # | Criterion | 2 looks like | 0 looks like |
|---|---|---|---|
| 1 | **Right person** | They have lived the problem recently; their role (user, buyer, approver) is clear | A friendly contact with no real exposure, or role unknown |
| 2 | **Their life, not my idea** | The call stays on their world: no leading questions, and no solution described (or, if one is, only after the problem was fully explored). A pure research call with no solution in it scores 2 | Leading questions ("wouldn't it be great if..."), or a solution described before the problem was explored |
| 3 | **A specific past episode** | "Tell me about the last time..." reconstructed step by step: trigger, what happened, who was involved | "Do you usually...", "Would you...", opinions about the future |
| 4 | **Workarounds and cost** | Learned what they do today AND put a number on what it costs (hours, £, people, risk) | Never asked what they do today |
| 5 | **Listening and digging** | Founder under 30% of the words AND at least two vague answers probed ("how long did that take?", "what happened next?") | Founder over 45% of the words, or no probing at all |

1 sits between: criterion 4 scores 1 when the workaround is known but the cost is never quantified; criterion 5 scores 1 at 30–45% talk, or under 30% with only one probe. When in doubt between two scores, give the lower one: the score is for improving, and generous scores teach nothing. Each gap is penalised once, under the criterion that owns it (a missing cost question is criterion 4, not 5).

**Score = sum (0–10).**

## Part 2: evidence strength (not added to the score)

Record the **strongest** signal from this call on this ladder, weakest first:

0. **Nothing, or compliments only:** "great idea", "keep me posted". This is not a signal.
1. **Says:** describes the pain but no cost, no workaround, no action.
2. **Has acted already:** paid for an alternative, built a workaround, assigned someone, actively searching.
3. **Gives time:** books a follow-up on the spot, agrees to a deeper session.
4. **Gives reputation:** introduces their boss, the budget holder or peers; offers to champion internally.
5. **Gives access:** shares their screen, real data or workflow; agrees to a scoped pilot.
6. **Gives money:** deposit, pre-order, letter of intent, paid pilot.

Judge every commitment against what it costs *this* person.

- **Promised, not yet delivered:** score the level and mark it **pending** (for example "4, pending: CFO intro promised"). Next time this person comes up, check whether it happened; if not, drop it to the level actually delivered.
- **Solved problem:** if they already bought or built something that fully solves it and they are happy, that is evidence *against*, not level 2. Record it as a counterexample.
- **Actions survive, opinions do not:** if the founder did describe a solution, a costly action afterwards (a deposit, an intro, data access) still counts. Opinions and enthusiasm after it do not.

**False positives to flag explicitly:** compliments, feature requests, hypothetical willingness to pay ("I'd pay £50 for that"), and opinions given in reaction to a described solution. List each with its quote. They can suggest questions, never prove demand. A call with no false positives simply lists none.

## Part 3: what changed

- **Hypothesis verdict:** for the hypothesis the call was meant to test: supported, leans supported, unresolved, leans contradicted, or contradicted, with the quote that decides it. If the hypothesis has two parts (for example "they have the pain AND would pay"), give each part its own verdict. Look hardest for contradicting evidence. For an exploratory call, list what was learned about the space instead.
- **Surprises:** anything the founder did not expect.
- **Next test:** the single cheapest next step.

## Output

1. Write or append to `calls/YYYY-MM-DD-<person>.md`:
   - **Snapshot:** who (role, segment), the episode they described, verbatim quotes (kept separate from interpretation), current workaround, cost, buyer path.
   - **Craft score:** X/10 with the five criterion scores and one quote each.
   - **Evidence:** ladder level and the quote or action behind it; false positives listed.
   - **Coaching point:** the one question the founder should have asked, at the moment it should have been asked (quote the line they moved past).
   - **Verdict and next test.**
2. Update `ideas/<idea>.md`: add a row to the Evidence table and, if the ladder level is 3 or higher, to Commitment signals so far. Show the founder the proposed edits before saving.
3. Reply in chat with three lines only: the score, the evidence level, and the coaching point.

## Batch mode: "grade today's calls" or "what have my calls told me about <idea>"

1. Grade any ungraded calls for that idea first, one by one.
2. Then synthesise **within one segment at a time** (never mix users with buyers, or one customer type with another):
   - How many people raised the problem **unprompted**, out of how many.
   - Recurring episodes, workarounds and costs, each linked to the calls they came from.
   - Counterexamples: people for whom the problem does not exist or is solved.
   - The highest evidence level reached, and how many people reached it.
   - Craft score trend across the calls (is the founder getting better?).
3. Recommend one of: **keep interviewing**, **narrow the segment**, **test a solution with a real commitment** (only once the problem is clearly real), or **kill the idea**. If kill, offer to move the idea file to `ideas/killed/` with the evidence and the reason.

## How many interviews

There is no magic number, and sources disagree. Start with a batch of about 5–8 people in one narrowly defined segment, synthesise, then keep going until new interviews stop changing the themes or the decision. Some practitioners suggest 12–30 per segment for B2B, with separate counts for users and buyers. More interviews raise confidence in a pattern; they never turn "says" evidence into "does" evidence. Only commitments do that.

## Rules

- Never invent a quote. If the transcript does not support a score, give it 0 or 1 and say what was missing.
- Do not soften the craft score to be kind. The founder asked for the truth.
- Notes about real people stay in this repo, which should be private.
