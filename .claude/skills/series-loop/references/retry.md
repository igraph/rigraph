# Rerun one commit: `retry-<S>-dev`

*Reference for [`series-loop`](../SKILL.md)'s retry ledger, read before pushing one;
the handbook leaf is [`operations/ci/per-commit/selection/`](/handbook/operations/ci/per-commit/selection/README.md).*

Some runs fail for reasons the commit had no part in:
a CDN that refused the TLS handshake in the `pkgdown` gate,
a leg cancelled mid-flight, a runner that never reported.
The tree is fine and the verdict is wrong,
so the commit needs judging again, not repairing.

Amending does rerun it —
the fresh committer timestamp alone mints a new SHA,
and `each.yaml` schedules runs for commits without a verdict —
but it re-mints every descendant with it.
The `pkgdown` flake this was written for sat 22 green commits
below the `main-fwd-dev` tip:
amending would have thrown away 22 verified builds to reprint one.

So ask for that one commit to be judged again, beside the series:

```sh
git push --force-with-lease origin \
  "<the failing commit>:refs/heads/retry-<S>-dev"
```

One ref, no rewrite; `<S>-dev` does not move
and the chain the loop walks never learns anything happened.
`-dev` is what `each.yaml` triggers on,
and the name is the series' own branch with a prefix,
which is the whole trick:
`each-plan.sh` strips `retry-` and anchors the scan on `<S>-green`,
so the bound comes from the ref
that already marks how far the series is trusted.
The retry branch needs no ref of its own for it.
The rerun writes a fresh `rcc` status on the **same SHA**.

**The tip is what is being asked about.**
Only it is replanned in spite of its verdict;
the rest of `<S>-green..tip` keeps the ordinary
build-it-if-it-has-no-verdict rule,
so a run lost further down the range comes back in the same pass.
A retry branch naming a series with no green plans nothing at all:
without the anchor the scan falls back to
first-parent history since `SINCE`,
which reaches past the seed into `main`,
where no commit carries an `rcc` verdict —
14 of them, for the failure this was written for,
every one queued as a build.

**The branch is the ledger, and nothing deletes it.**
`retry-<S>-dev` already **on this commit** means
it has had its one rerun and failed again:
the failure is not transient, whatever the log looks like.
Classify it from the new log and repair it for real.
Pointing anywhere else, it is a spent retry of an earlier commit
and says nothing about this one — force-update it and rerun.
`series-check.sh` reads the ledger the same way:
the failure a retry branch sits on is REPAIR, never RETRY.
One ref per series, so it records the retry in flight,
not the history of them.

The verdict reaches the loop the ordinary way — from the rerun's own run.
That run is on `retry-<S>-dev`, so its results name that branch
and carry a higher run id than the run that first judged the commit,
which is what tells the two apart while both exist.
The pre-retry `failure` does not disappear when the retry is pushed:
it stays the newest result for that SHA until the rerun reports,
and repairing on it amends a commit that is about to go green.
The store applies the same newest-run-wins rule to its copy,
so the leg *replaces* a record rather than appending —
the one case where a decided commit legitimately changes state.

**Dropping a result by hand is a store-side operation**:

```sh
scripts/rcc-drop.sh <sha>...          # or --stdin, one per line
```

It removes `runs2.d/<xx>/<sha>.ndjson` and `logs2.d/<xx>/<sha>.log`,
which is what makes the commit undecided —
work selection reads presence and nothing else (`rcc-decided.sh`) —
so the next `each-rcc` run on the branch plans it
like a commit that had never been built.
A run's own results are immutable;
there a newer run is the only thing that supersedes an older one.

**Reach for it when the job decided the commit, not the tree.**
The composite actions come from the branch tip that triggered the run,
not from the commit under test,
so a bad workflow turns commits red
whose own trees have nothing to do with it,
at the scale of everything the run touched:
duckdb/duckdb-r#2620 put `-Wno-*` flags in `~/.R/Makevars`,
where `R CMD check --as-cran` refused them as non-portable,
and 166 commits across three series were red for it
until duckdb/duckdb-r#2652 landed and the records were dropped.
That is not `retry-<S>-dev`'s question:
the retry replans one tip and runs the workflow from *that commit's* tree,
where a drop asks for a verdict under the tooling the branch carries today.
And it is not a repair either —
dropping the record of a commit its own tree broke
costs a rebuild to learn the same verdict
and erases the log that said why.

**Do not run `rcc-logs.sh` behind a drop.**
The commit keeps its stale `rcc` status until the rebuild writes a fresh one,
and that sweep derives records for undecided commits from exactly those,
so it puts back what the drop removed.
Where the sweep *is* what is wanted —
a record the leg never published, from a run cancelled whole —
there is nothing to drop first.

**Both mechanisms live in the tree at the commit under retry.**
`each.yaml` and its scripts are read from the retried ref, not from `main`,
so a series whose commits predate them retries by hand:
push the branch, dispatch `each-rcc` on `retry-<S>-dev`
with `force=true` and `max-commits=1`,
and — on the store path only — drop the stale record once the rerun is green,
both copies of it, per above.
A rebase onto a newer mainline (`series-rebase/SKILL.md`)
is what carries the automatic path into a forward series.
