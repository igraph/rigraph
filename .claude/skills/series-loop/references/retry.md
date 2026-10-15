# Rerun one commit: `retry-main-dev`

*Reference for [`series-loop`](../SKILL.md)'s retry ledger, read before pushing one.*

Some runs fail for reasons the commit had no part in:
a CDN that refused the TLS handshake in the `pkgdown` gate, a leg cancelled mid-flight, a runner that never reported.
The tree is fine and the verdict is wrong, so the commit needs judging again, not repairing.

Amending does rerun it, because the fresh committer timestamp alone mints a new SHA
and `each.yaml` schedules runs for commits without a verdict,
but it re-mints every descendant with it and throws away their verified builds to reprint one.
So ask for that one commit to be judged again, beside the series:

```sh
git push --force-with-lease origin "<the failing commit>:refs/heads/retry-main-dev"
```

One ref, no rewrite: `main-dev` does not move, and the chain the loop walks never learns anything happened.
`-dev` is what `each.yaml` triggers on, and the name is the series' own branch with a prefix, which is the whole trick:
[`scripts/each-plan.sh`](/scripts/each-plan.sh) strips `retry-` and anchors the scan on `main-green`,
so the bound comes from the ref that already marks how far the series is trusted.
The rerun writes a fresh `rcc` status on the **same SHA**.

**The tip is what is being asked about.**
Only it is replanned in spite of its verdict;
the rest of `main-green..tip` keeps the ordinary build-it-if-it-has-no-verdict rule,
so a run lost further down the range comes back in the same pass.
A retry branch naming a series with no green plans nothing at all,
because without the anchor the scan would reach past the seed into `main`, where no commit carries a verdict.

**The branch is the ledger, and nothing deletes it.**
`retry-main-dev` already **on this commit**, with the rerun reported, means it has had its one rerun and failed again:
the failure is not transient, whatever the log looks like.
Classify it from the new log and repair it for real.
Pointing anywhere else, it is a spent retry of an earlier commit and says nothing about this one: force-update it and rerun.
[`scripts/series-check.sh`](/scripts/series-check.sh) reads the ledger the same way:
WAIT while the rerun has not reported, and REPAIR, never RETRY, once it has.
One ref per series, so it records the retry in flight, not the history of them.

The verdict reaches the loop the ordinary way, from the rerun's own run.
That run is on `retry-main-dev`, so its results name that branch
and carry a higher run id than the run that first judged the commit, which is what tells the two apart while both exist.
The pre-retry `failure` does not disappear when the retry is pushed:
it stays the newest result for that SHA until the rerun reports,
and repairing on it amends a commit that is about to go green.
The store applies the same newest-run-wins rule to its copy, so the leg *replaces* a record rather than appending,
the one case where a decided commit legitimately changes state.

**Dropping a result is a store-side operation**, and duckdb-r's script for it, `rcc-drop.sh`, is not ported.
Removing `runs2.d/<xx>/<sha>.ndjson` and `logs2.d/<xx>/<sha>.log` from `rcc2` is what makes the commit undecided,
because work selection reads presence and nothing else ([`scripts/rcc-decided.sh`](/scripts/rcc-decided.sh)),
so the next `each-rcc` run on the branch plans it like a commit that had never been built.
Until the script is ported, a drop is a commit on `rcc2` removing both files, pushed by hand.
A run's own results are immutable; there a newer run is the only thing that supersedes an older one.

**Reach for it when the job decided the commit, not the tree.**
The composite actions come from the branch tip that triggered the run, not from the commit under test,
so a bad workflow turns commits red whose own trees have nothing to do with it, at the scale of everything the run touched.
In duckdb-r's history, duckdb/duckdb-r#2620 put `-Wno-*` flags where `R CMD check --as-cran` refused them as non-portable,
and 166 commits across three series were red for it until the fix landed and the records were dropped.
That is not the retry's question:
the retry replans one tip and runs the workflow from *that commit's* tree,
where a drop asks for a verdict under the tooling the branch carries today.
And it is not a repair either:
dropping the record of a commit its own tree broke costs a rebuild to learn the same verdict, and erases the log that said why.

**Both mechanisms live in the tree at the commit under retry.**
`each.yaml` and its scripts are read from the retried ref, not from `main`,
so a commit whose tree predates them retries by hand:
push the branch, and dispatch `each-rcc` on `retry-main-dev` with `force=true` and `max-commits=1`.
