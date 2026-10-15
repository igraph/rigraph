# What a firing reports

*Reference for [`series-loop`](../SKILL.md)'s report, read before writing one.*

A report is the one thing a human reads of a firing, so it says what moved, what stopped, and what is owed,
and a reading that failed is never written up as a clean result.

**Per series, the verdict and what each stage did.**
`series-check.sh`'s verdict line, then how many commits stage 1 vendored and where the buffer stands upstream,
on the replay, at the seam or past it, with the upstream SHA;
what stage 2 repaired and how, naming each folded commit and its `R-side fix`;
where green, `-build-base` and dev moved, and what stage 4 ported.

**Which source served the verdicts.**
The run path or the `rcc2` store, and any record missing from the store with what it was for.
The store exists to work around Actions access that may have passed,
and retiring it waits on firings that report they never had to open it.
A record no leg published stays missing, since the sweep that filled such gaps is not ported:
say so plainly rather than working around it.

**Anything left stopped.**
A vendor run's exit status with the banner it printed,
a replay or a port stopped on a conflict with the worktree it kept,
a fold left mid-way.
The next firing reaches the same stop, so the report is where a human learns it is waiting for judgement.

**What r-universe made of the previous green**, per target that is not OK,
and the `-dev` commit whose message now records the finding.

**The tooling pull requests** the firing opened or added evidence to, and how long each has been open.

**The seam, and the landing it makes possible.**
When `main-green` first vendors `igraph/igraph@7b4ae766`, tag 1.0.1, the line has reached igraph 1.0.1,
and the first landing of the series on `main` becomes possible ([`series-land`](/.claude/skills/series-land/SKILL.md)).
Say it at the top, on every firing from then until a landing is planned:
the loop never lands anything, and a decision nobody can take from the report is one the report failed to deliver.

**A reading that failed is reported as one.**
When a script says it could not read something, the firing says so too;
otherwise a question that went unanswered reads exactly like an answer of "nothing new".
One such line is not a finding.
`series-check.sh` closes with an `UNSERVED` block for an upstream branch named `vX.Y-<codename>` that no series covers,
duckdb's shape for a release line, which igraph has never cut;
silence there is the expected reading, and a line there is news to report, with no declaration pull request until the user asks.

**A late tag the run did not clear.**
A `LATE TAG` line that stage 1 did not clear goes into the report too,
with the remedy the line names ([`1-vendor.md`](1-vendor.md), "A tag upstream pushed late").
