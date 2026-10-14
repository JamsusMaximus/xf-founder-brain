# Ideas

One file per idea, named `ideas/<short-name>.md`. Copy `_template.md`.

Each file holds: the idea in one line, the ideal customer (ICP), hypotheses, the riskiest assumption, kill criteria, evidence for and against (each with a date and a link to a `calls/` file), and a status.

Statuses: `exploring`, `testing`, `promising`, `paused`, `killed`.

- **Several ideas?** The setup also writes `ideas/compare.md`: one row per idea (ICP, riskiest assumption, best evidence so far, kill criteria). Each week, ask "which idea gets the calls this week?" and log the answer in `decisions.md`.
- **Exploring spaces, no idea yet?** Use `ideas/spaces.md` instead: one row per space comparing buyer, how reachable they are, incumbents and your unfair advantage, plus a dated keep-or-kill verdict after N calls per space.

Update the idea file after every call. When an idea dies, move it to `killed/`. Your agent reads this folder every session.
