# What a firing reports

*Reference for [`series-loop`](../SKILL.md)'s report, read before writing one;
the handbook leaf is [`operations/vendoring/series-loop/`](/handbook/operations/vendoring/series-loop/README.md).*

The report ends with `series-check.sh`'s `UNSERVED` block, verbatim,
whenever the script prints one:
an upstream release line that no series here covers.
Run the script with stage 1's clone,
`scripts/series-check.sh --upstream <upstream-clone>`,
so the block carries the fork point and not only the branch name.

**It goes last, and it outranks a quiet pass.**
A firing where every series reads ADVANCE or IDLE
is the quietest report this loop writes,
and it is exactly the firing where an unopened series
is the only thing left worth acting on.
So it is not summarised into a sentence among the per-series verdicts,
and not dropped because everything that is served is green.
Loud because it is easy to skim past, not because anything is broken:
a line may be opened deliberately, later and on a released tree,
so what the block reports is a decision owed an answer rather than a fault.

**It repeats until the refs exist.**
Nothing else in the loop can notice the condition:
a series is discovered from its refs,
so a release line that has none is absent from every stage above
rather than late in one, and absence raises nothing anywhere.
The report is the only place it is visible.

**Say it at the top as well, and say what it costs.**
The block goes last because that is where it cannot be lost among the
per-series verdicts, but a report whose only mention of a newborn line is
its final paragraph is one that can be closed after the first screen.
Open the report with it too — one line naming the branch — and carry the
number that makes it urgent rather than merely true:
`scripts/series-cut.sh <S> --upstream <clone> --check` prints the backlog,
the commits of that line nothing here has vendored, and it grows every day
the line stays unopened. Opening v2.0 a week after the cut left 193 to walk;
the same line a fortnight later was past a thousand.

**And `main`'s version is already wrong, whatever is decided about the line.**
Upstream starts declaring the *next* line the week it cuts a branch, so the
series tracking upstream `main` stops previewing the line its version names —
`scripts/preview-prefix.sh --check` on either strand says so and exits 1.
That is owed even if the new series is deliberately not opened yet, which makes
it the one part of an UNSERVED report that is not a suggestion.
Report it in the same block
([`releases/versioning/`](/handbook/operations/releases/versioning/README.md)).

**Declaring the flavor is a PR the firing may open. Cutting the refs is not.**
The two halves of an opening are no longer the same kind of work.
Naming the line — `v2.1-<codename>` is served as `duckdb.2.1.dev` —
is one entry in [`scripts/series.yaml`](/scripts/series.yaml),
reviewable on its own and reversible by closing the PR.
Cutting the four refs moves commits, and stays
`series-open/SKILL.md`'s job and a human's, exactly as a cutover is (stage 6).
So the firing opens the declaration PR and reports the rest:
the line, the fork point, the backlog and the skill.

**Check for the PR before opening one, and read the script's own answer first.**
`series-check.sh` says on the UNSERVED line whether `series.yaml` already
names the flavor. *Declared already* means the PR merged and only the refs
are missing — say so and open nothing. *Undeclared* is not yet a licence:
a PR may be open, or may have been closed on purpose, and a firing that
skips the search files the same PR every time it runs. So search `main`'s
PRs touching `scripts/series.yaml` for the flavor name, **open and closed
both**, and:

- an open one — name it in the report, add nothing, open nothing;
- a closed one — the answer was no; report the line and leave it closed;
- none — open it, one entry, against `main`, titled for the flavor.

A firing that cannot search says so and opens nothing:
duplicating a declaration is worse than deferring one.

**A reading that failed is reported as one.**
When the script says it could not read the upstream branches,
the firing says so too:
otherwise a question that went unanswered
reads exactly like an answer of "nothing new".

**A `LATE TAG` line that stage 1 did not clear goes into the report too.**
Stage 1 re-stamps a tagged commit that is still the buffer's newest,
so a line left after that stage says the buffer has vendored past the tag,
which no firing can repair:
the release branch takes the re-stamp at CUT
([`scripts/VENDORING.md`](/scripts/VENDORING.md#a-tag-upstream-pushed-late)).
Name the series, the tag and the commit, so the release does not wait on someone noticing.

**A due cutover is reported the same way, above the `UNSERVED` block.**
It is the one finding a firing may not act on at all —
an UNSERVED line at least has its declaration PR —
so it is the one it has to hand over completely:
stage 6's block, filled in, every firing `series-check.sh` prints a
`CUTOVER` line, and for the same reason —
a decision nobody can take from the report alone
is a decision the report failed to deliver.
