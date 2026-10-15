# igraph replay: per-commit verdicts

*What it measures:* the CI verdict on every commit of the igraph 0.10.17 to 1.0.1 replay,
and how far the replay's final tree is from the `1.0.1` tag.

*When and on what:* exported 2026-10-15 from the commit statuses of `krlmlr/igraph`,
range `0.10.17..main-b-dev` with `main-b-dev` at `3c54c752e6`, 377 commits.
Two checks ran on every commit, each workflow taken from the replay branch itself
and dispatched per commit by that branch's `scripts/each-ci.sh`:

* `build-cmake`: a MinGW UCRT64 shared build of `build_tests`, then `ctest --exclude-regex glpk_error`;
* `stimulus`: `interfaces/` validated against the C headers with Stimulus `ci:validate`.

*What it supports:* the replay as a base on which every commit is green,
for the vendoring series that will walk it.
The handbook leaf that leans on this is not written yet; it will live under `operations/vendoring/`.

*Provenance:* [`export-statuses.sh`](export-statuses.sh), run as `./export-statuses.sh <igraph clone> > statuses.tsv`.
A commit status belongs to the repository that recorded it.
`krlmlr/igraph` is being replaced by a fork of `igraph/igraph` under the same name,
and the original becomes the archive `krlmlr/igraph-old`,
so the run links in [`statuses.tsv`](statuses.tsv) name the archive.

## Result

* 375 of the 377 commits pass both checks.
* The other two are setup commits ahead of the port:
  * position 1, `16081ce604` "Sync GitHub", predates the per-commit workflows and has no verdict;
  * position 19, `b25a27535f` "Ignore", touches only `.gitignore`:
    its build passed, and a later re-run was cancelled, which GitHub records as a failure.
* The replay's tree equals `1.0.1` under `src/`, `include/`, `tests/` and `vendor/`:
  `git diff --stat 1.0.1 3c54c752e6 -- src include tests vendor` prints nothing.
* Under `interfaces/`, the replay adds `igraph_motifs_randesu_callback()` with its `MOTIFS_HANDLER_FUNC` type,
  and spaces two default values of `igraph_layout_gem()` differently.
  Neither is on upstream `main` as of 2026-10-15.
* The rest of the difference is the replay's own tooling and changelog
  (`changelog/`, `.github/`, `tools/`, `scripts/`) and a pruned `CHANGELOG.md`.
