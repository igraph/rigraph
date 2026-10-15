# Stage 7: open a PR for whatever the tooling got wrong

*Reference for stage 7 of [`series-loop`](../SKILL.md), read when the stage has work;
the handbook leaf is [`operations/vendoring/series-loop/`](/handbook/operations/vendoring/series-loop/README.md).*

A firing that had to work around a bug in the tooling
owes `main` a PR before it ends.
Not a fix to this firing — a fix to the next one.

**Check what the setup read.**
If an open PR already covers the cause,
**add this firing's evidence to it** rather than opening a second:
two PRs for one cause split the review
and neither one carries the whole case.
If it has been open across several firings, say so in the report —
the tooling-fix loop's health signal is workarounds per month
([`plan/PLAN-vendoring-simplification.md`](/plan/PLAN-vendoring-simplification.md), §5),
and a fix waiting for review is a workaround that keeps being paid.
Never merge one yourself to get past it.

**Work around by hand first, then write the PR.**
A fix that the current firing depends on
is a fix nobody can review calmly:
it has to merge now, it merges unreviewed,
and the firing that needed it is over before anyone reads it.
So: unstick the series by hand, finish the firing,
and open a PR that prevents the workaround being needed again.
If the workaround cannot be done by hand,
say so in the report and stop —
that is a finding, not a licence to self-merge.

**One PR per cause, small, against `main`.**
`main` is the source of truth for `.github/`, `scripts/` and `.claude/`;
a series never keeps its own fork of the tooling.
Two bugs in one firing are two PRs,
because they will be reviewed —
and merged, or not — independently.
Link the failing firing as evidence:
the run, the commit, the log line that shows the behaviour.
A reviewer should be able to see the bug happen
without reproducing it.

**The fix reaches the series by itself.**
Once merged, stage 4 ports it into every `-dev` branch
on the next firing.
Nothing has to be carried anywhere by hand,
and nothing waits for a forward —
which is the whole reason the port stage exists.

**What is not a tooling PR.**
A red commit whose cause is the vendored tree,
a flake that a retry settles,
a snapshot that drifted because the engine changed:
those are stage 2 repairs.
The test is whether the *same firing done again* would hit it —
a bug in a script or a workflow would,
an upstream commit that did not build would not.
