# The four refs of the series, and what is and is not one

*Reference for [`series-loop`](../SKILL.md)'s branch model, read on a first firing and whenever a ref looks wrong.*

## The vendor subject is machine-readable state

Every vendor commit names the upstream commit it vendors in its subject:

```
vendor: Update vendored sources to <owner>/igraph@<sha>
vendor: Update vendored sources (tag <tag>) to <owner>/igraph@<sha>
```

Equivalence between `-build` and `-dev` commits is by that SHA,
and it is how `vendor-one.sh` finds where a branch stands upstream.
The owner is the repository the SHA lives in,
and every pattern in [`scripts/series-config.sh`](/scripts/series-config.sh) accepts either owner.

**The subject is what decides, never the path.**
`src/vendor/` is not a proxy for "vendored here":
a patch-stack rebuild or a CRAN fix touches the vendored tree and carries no upstream SHA,
and `main` has several such commits above its newest vendor commit today.
A pathspec narrows the walk and nothing more;
a reader of this state looks *past* such commits, and `vendored_sha()` does so 20 deep,
far more than a series stacks above its buffer, and bounded so the walk ends by itself.
Reading the newest commit that merely *touched* the directory answers with a commit that vendored nothing,
which is how duckdb-r's `series-advance.sh` once refused branches that had vendored perfectly well.
Should 20 ever not be enough, the helper says so on stderr rather than answering wrongly; raise `BASE_SCAN_DEPTH` then.

## The upstream line: two stretches and a seam

[`scripts/vendor-one.sh`](/scripts/vendor-one.sh) decides which stretch a branch is on from the ancestry of its newest vendored SHA,
so nothing changes by hand when the seam is crossed.

1. **The replay** of igraph 0.10.17 to 1.0.1, branch `replay-1.0.1` of `krlmlr/igraph`, tip `3c54c752`.
   Its commits exist only there, and their vendor subjects say `krlmlr/igraph@<sha>`.
   While a branch is behind the replay tip, the walk ends at the tip whatever the clone's HEAD says.
2. **The seam**: at the replay tip, one vendor commit vendors `igraph/igraph@7b4ae766`, tag 1.0.1,
   whose tree the replay tip already equals in `src/`, `include/`, `vendor/` and `tests/`.
   Its message says so instead of listing upstream subjects.
3. **igraph/igraph's `main`**, first-parent, subjects `igraph/igraph@<sha>`, up to the clone's HEAD.

`igraph/rigraph`'s `main` vendors 0.10.17 (`igraph/igraph@529e7be1`), which is where the replay starts.

## What a vendor commit regenerates

All of it is written from the upstream tree and `patch/` alone
(`regenerate()` in [`scripts/vendor-lib.sh`](/scripts/vendor-lib.sh)), and none of it is edited by hand:

- `src/vendor/cigraph/`, a keep-list of the upstream tree (`series_keep`), with `patch/*.patch` applied;
- `src/vendor/igraph_version.h`, which igraph's CMake writes from `git describe --tags` in the upstream clone;
- `src/vendor/igraph_threading.h`, `src/vendor/io/` and `src/sources-*.mk`, by `make -f Makefile-cigraph`;
- `src/rinterface.c` and `R/aaa-*.R`, by Stimulus in the same make run, from `tools/stimulus/`;
- `src/cpp11.cpp` and `R/cpp11.R`, by `cpp11::cpp_register()`;
- the fifth `Version:` component in `DESCRIPTION`, one above the parent's.

Two runs of the same upstream commit can differ in the generated files, so none of them is a fix that travels:
a fix to the interface lives in `tools/stimulus/` or `patch/`, which do.

## A series is discovered, not configured

Each firing lists `refs/heads/*-build`, and every `<X>-build` with a sibling `<X>-dev` is a series it serves;
today that is `main` alone.
None of these has a `-build` beside it, so none is mistaken for a series:

- `retry-main-dev`, the retry ledger ([`retry.md`](retry.md));
- `main-rc-dev`, the unflavored mirror of `main-dev` ([`series-rc`](/.claude/skills/series-rc/SKILL.md)),
  derived commit for commit and cut only when a landing is planned;
- `main-land-dev` with its `main-land-green`, a landing on its way onto `main` ([`series-land`](/.claude/skills/series-land/SKILL.md)).

## All four refs exist from day one, and green starts below the flavor commits

The seed is `igraph/rigraph`'s `main`, the two commits `flavor.sh dev` writes,
and a separate `chore: Add fifth version component` commit stamping `.0` ([`series-open`](/.claude/skills/series-open/SKILL.md)),
the vendor counter's zero, so every commit on the series is orderable by version:

    main-build = main-build-base = main-dev = the seed tip
    main-green = the seed's base, igraph/rigraph's main

`main-green` starts below the flavor commits so that CI judges them like any commit in `main-green..main-dev`:
`igraph.dev` is a rename that has never been built, and a green that started above it would publish it unjudged
(duckdb-r#2868's rule).
Stage 1 then populates `-build`, and the other three advance as the loop consumes and verifies;
the first commits green crosses are the flavor commits, once CI has judged them.
What `-green` serves is the flavored package from then on, and r-universe is registered for `igraph.dev` only then.
The fifth component belongs to the series only: `flavor.sh` never stamps it, and `main` keeps its four-component version.
There is never a "no green yet" state: every walk is bounded by `main-green`, from the first firing on.
