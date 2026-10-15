# Stage 4: port from `main`

*Reference for stage 4 of [`series-loop`](../SKILL.md), read when the stage has work;
the handbook leaf is [`operations/vendoring/series-loop/`](/handbook/operations/vendoring/series-loop/README.md).*

The goal is identity, not curation:
after this stage,
`.github/`, `scripts/` and `.claude/` on `<S>-dev`
are byte-identical to `main`'s.
CI reads workflows and scripts from the branch it checks,
so this is what puts a fix into effect —
never park a tooling change to wait for a forward.

**Every ref of the series owes that identity, `<S>-build` included.**
A workflow fires from the branch it sits on,
so a ref nobody ports runs the tooling of the day it was seeded,
and a push filter written back then decides what fires today.
The buffer takes no *ports* — its line is upstream commits
and the glue they need — but its **tooling is synced**,
and `series-port.sh` does it in the same run:
one commit appended to `<S>-build` when its tooling differs from `main`'s.
This is not a precaution. `v1.4-andium-build` still carried a
2026-03-26 `R-CMD-check.yaml` whose release pattern matches
the buffer's own name, so pushes to it started the template check
and `R-CMD-check-status.yaml` stamped an `rcc` status
on a commit no `each-rcc` leg had decided —
a status with no record, on a ref the model calls untested.

The sync commit vendors nothing,
so the consumption anchor and the vendored-SHA scans look past it by subject,
and stage 5 skips it rather than replaying it onto `-dev`,
whose tooling this stage has already made `main`'s.
Replaying it held only until `main` moved again.
The sync's diff runs from the buffer's older tooling,
so the pick conflicted, or put back on `-dev` what `main` had removed,
and a sync the anchor never passes was offered again on every firing.

```sh
scripts/series-port.sh <S>                  # list candidates + identity check
scripts/series-port.sh <S> --apply          # cherry-pick all, sync, push
scripts/series-port.sh <S> --apply <sha>…   # a chosen subset instead
```

The script lists **every** commit `main` has that the series lacks,
oldest first,
classified TOOLING / MIXED / OTHER / VENDOR / VERSION by what it touches,
and applies all but VENDOR and VERSION by default.
A MIXED or OTHER commit is a *forward-port*
in `BRANCHES.md`'s sense (invariant S4):
`-dev` has always been vendor commits
plus cherry-picks of `main` commits,
and the port merely batches what used to be manual —
judged by CI like every `-dev` commit.
Picks are whole commits, never split:
a wholesale pick matches its `main` commit by patch-id,
so the next rebase skips it silently,
while a tooling-only half of a MIXED commit would replay —
at best to empty, at worst to a conflict —
and could sever a coupled change
(a script from the test that exercises it),
minting a commit whose message describes more than it contains.
VENDOR commits are listed and never auto-picked:
`main`'s engine is not this series' engine,
and the series' own vendoring owns that strand.
**The subject is what decides one, never the path** —
the same rule as everywhere else in this skill.
The patch stack is applied to the vendored tree in place,
so CRAN and compiler-warning fixes land under `src/duckdb/`
carrying no upstream SHA;
excluding them by path made exactly those fixes wait for a forward,
which is the one thing the port exists to end.
They are ordinary commits, ported like any other.

VERSION commits are listed and never auto-picked either:
`main`'s R-client counter is not this series'.
A `-dev` version says which release line the series was seeded from
and how far its own vendoring has run,
and what `main` is at today is read from `main`
([`operations/releases/versioning/`](/handbook/operations/releases/versioning/README.md)).
Here the **content** decides, not the subject:
the commit carries nothing but release paperwork,
so a bump under a subject other than `fledge:` is held back too,
and a bump riding on real content is not —
that one is a forward-port that happens to bump,
ported whole like any other,
because a pick is never half a commit.
The notes are that strand as much as the bump is:
a commit that writes `NEWS.md` for `main`'s next release and touches nothing else
is held back on the same reasoning,
because the series has neither the section it goes in nor the version that names it,
and the pick's only honest resolution is the empty commit that retires it.
Where DESCRIPTION *is* touched the version still has to move,
since that file also carries the dependency list.

Port volume threatens nothing either:
the readers of the strand — `vendored_sha()` in stage 5,
the base scan in `vendor-one.sh` — look *past* such commits by subject,
bounded, and say so on stderr when the bound is exhausted,
so a ported commit is invisible to them whatever it touched.
After the picks the script closes whatever tooling delta remains
with one sync commit taking `main`'s tooling tree verbatim,
so the identity goal holds even where history diverged
(adaptations folded into vendor commits during repair,
picks dropped as empty).
In steady state the residue is empty and no sync commit is created.
When one appears, read its diff —
it is the residue the commit walk could not explain —
and treat anything it reverts that the series genuinely needs
as a finding for `main`:
make it conditional there;
a series never keeps its own fork of the tooling.
One class the script now names for you rather than leaving to the diff:
a file the sync deletes that something outside the tooling paths still calls.
`main` moved it in a commit the series did not take,
and the caller moved with it, out of the sync's reach —
so port that commit by name and the reference is whole again.

**A frozen series takes no ports by default.**
A series seeded from a release branch keeps the R code it was seeded with —
glue, tests, docs and version alike —
so `main`'s development line,
which belongs to another engine's R side,
is not a backlog it is behind on.
`scripts/series-port.sh` reads that off the lineage under the seed
and skips the walk for such a series,
and does the same for a line `main`'s `scripts/series.yaml` declares parked on its own baseline,
which is how a line parks when another lands on `main` ([`series-land/SKILL.md`](/.claude/skills/series-land/SKILL.md)):
its seed sits on `main`'s own history, where the lineage cannot see the difference,
so the sync commit is their whole default port
and their tooling still follows `main`:
a frozen R side is not a frozen CI,
and the identity goal above holds for every series either way.
Run the script for a frozen series like any other;
the default needs no judgement.

**Frozen is not untouchable.**
A change the r-universe build genuinely needs still lands —
a `configure` fix, whatever keeps the flavor green —
and stage 2 reaches for it the same way it mines a base series:
if the red has already been fixed on `main`,
port that commit rather than rederive it.
Name it, one commit at a time:

```sh
scripts/series-port.sh <S> --list            # walk a frozen series anyway
scripts/series-port.sh <S> --apply <sha>…    # take the ones the build needs
```

Explicit SHAs are never second-guessed,
on a frozen series or any other.
What the freeze buys is that nobody has to read
the whole development line every firing
to find the two commits that matter.
The bar is what the build needs, not what `main` happens to have:
a fix that only tidies R code the series is content with
is not a reason to move the series off its seed.

What stays judgement:

- a conflict stops the sequence in place —
  resolve it in the kept worktree toward `main`'s intent,
  keeping the series' flavor where the two meet
  (`Package:`, `@useDynLib`, `DUCKDB_PACKAGE_NAME`
  keep the series' name),
  `cherry-pick --continue` through the rest, push,
  and rerun the script to finish
  (reruns are exact:
  clean picks dedupe by patch-id,
  resolved ones by their `cherry picked from` trailer);
- an OTHER commit that cannot work against this series' engine —
  apply an explicit subset without it,
  fix it on `main` (a guard, a runtime seam),
  and port the fixed commit instead.

A live forward counterpart changes nothing here.
Both lineages are ported the same way, every firing,
because the thing that says a cutover is safe
is that the two `-dev` branches carry the same package —
and a port that reached one of them and not the other
is precisely a difference nobody can explain at the swap.

Ported and sync commits are ordinary `-dev` commits:
green per commit like everything else,
vendoring nothing —
the consumption anchor of stage 5 reads vendor subjects
and does not see them —
and transient:
a forward's seed already carries their content
and the replay leaves them behind (`series-forward/SKILL.md`);
a rebase drops patch-id equivalents,
and a sync commit whose delta `main` absorbed
rebases to empty and is dropped the same way (`series-rebase/SKILL.md`).
