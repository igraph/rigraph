---
name: series-open
description: Seed rigraph's one vendoring series, `main`, published as `igraph.dev`. Flavor igraph/rigraph's `main` with `scripts/flavor.sh dev`, stamp the fifth version component, push `main-build`, `main-dev` and `main-build-base` at the seed tip and `main-green` at its base to the fork in one atomic push, mirror `main-green` into igraph/rigraph, and have `igraph.dev` registered with igraph's r-universe. Use when the `main` series does not exist yet and has to be created, or when asked to open, seed or bootstrap a series.
---

# Opening the series

rigraph serves one series, `main`, tracking upstream `main`
and published as the package `igraph.dev` ([`series-loop`](/.claude/skills/series-loop/SKILL.md)).
Opening it is a one-time, human-run move: the loop never creates refs, it serves the ones it finds.
Everything after the push below is the loop's: nobody vendors by hand afterwards.

Opening a series for an upstream release branch, duckdb-r's other half of this skill, is not ported:
igraph cuts no release branches the package serves.

## Before you start

- **No `main-*` series refs exist in the fork.**
  `git ls-remote --heads origin 'main-*'` answers in one line.
  Refs that exist belong to a live series, and replacing them rewrites a green r-universe may be serving;
  that is a forward, which is not ported, not an opening.
- **The canonical `main` carries the tooling**:
  `scripts/vendor-one.sh`, the `scripts/series-*.sh`, [`scripts/flavor.sh`](/scripts/flavor.sh) with its template,
  and [`.github/workflows/each.yaml`](/.github/workflows/each.yaml).
  Every series commit runs the CI its own tree carries, starting with the seed.
- **It vendors an upstream commit the walk can start from.**
  The vendor run finds its base in the newest `<owner>/igraph@<sha>` subject among the 20 newest commits touching `src/vendor/`;
  `main` vendors 0.10.17 (`igraph/igraph@529e7be1`), which is where the replay of 0.10.17 to 1.0.1 starts.
  `git log -n 20 --format=%s upstream/main -- src/vendor | grep -m1 '/igraph@'` shows it.
- **`scripts/series.yaml` declares `igraph.dev`** with `series: main` and `publishes_from: main-green`, and
  [`.github/pull.yml`](/.github/pull.yml) mirrors `main` into the fork; both are on `main` already.

## Steps

1. **Start from the canonical `main`, clean.**

   ```sh
   git fetch upstream main
   git switch --detach upstream/main
   scripts/setup-git.sh
   ```

2. **Flavor it.**

   ```sh
   scripts/flavor.sh dev
   ```

   Two commits, `chore: Update flavor patch to dev` and `chore: Update version to dev`,
   rename the package to `igraph.dev` so it installs beside `igraph`, and regenerate the cpp11 binding for the new name.
   Their subjects are machine-readable:
   [`scripts/series-rc.sh`](/scripts/series-rc.sh) finds the flavor diff it reverses by them,
   and [`scripts/series-port.sh`](/scripts/series-port.sh) the foot of the seed.
   Do not edit or squash them.

3. **Stamp the fifth version component.**

   ```sh
   v=$(sed -n 's/^Version: //p' DESCRIPTION)
   sed -i "s/^Version: .*/Version: $v.0/" DESCRIPTION
   git commit -q -m 'chore: Add fifth version component' -- DESCRIPTION
   ```

   `.0` is the vendor counter's zero: every vendor commit raises it, so every commit on the series is orderable by version.
   The subject is exact, because [`scripts/each-plan.sh`](/scripts/each-plan.sh), `series-rc.sh` and
   [`scripts/series-land.sh`](/scripts/series-land.sh) find the seed tip by it.
   `flavor.sh` never stamps it, and `main` keeps its four-component version.

4. **Check the seed tip locally.**
   Install the package and run [`scripts/rcc-one.sh`](/scripts/rcc-one.sh): every commit the series ever mints stands on this one.
   CI judges it too (step 5), but a rename that does not build is cheaper to see here.

5. **Push the four refs, in one atomic push.**
   Three at the seed tip, and `main-green` at the seed's base, `main` itself,
   so that CI judges the two flavor commits and the stamp before anything publishes them:
   `igraph.dev` is a rename that has never been built (duckdb-r#2868's rule).

   ```sh
   tip=$(git rev-parse HEAD)
   base=$(git rev-parse upstream/main)
   git push --atomic origin \
     "$tip:refs/heads/main-build" "$tip:refs/heads/main-build-base" \
     "$tip:refs/heads/main-dev" "$base:refs/heads/main-green"
   ```

   Atomic, because the loop discovers series from refs and serves them in one firing,
   so a ref landing alone invites a firing into half a series.
   The push to `main-dev` starts `each-rcc` over `main-green..main-dev`, the three seed commits.
   Up to this push the opening is local and a deletion undoes it.

6. **Mirror `main-green` into `igraph/rigraph`.**

   ```sh
   git push upstream "$base:refs/heads/main-green"
   ```

   r-universe builds `igraph.dev` from the canonical repository.
   From the first firing on, `scripts/series-advance.sh` keeps the copy level with a plain fast-forward push on every run.

7. **Have `igraph.dev` registered with igraph's r-universe.**
   A universe is configured by its registry repository,
   `igraph/igraph.r-universe.dev` by r-universe's `<owner>/<owner>.r-universe.dev` convention,
   whose `packages.json` gives each package a `url` and the `branch` to build.
   The entry is `igraph.dev` from `https://github.com/igraph/rigraph`, branch `main-green`,
   and a pull request against that repository is the request, a human's to open, or its owners' to merge.
   Merge it only once the loop has moved `main-green` over the flavor commits:
   until then the branch carries the unflavored package `igraph`, which is not the name registered.
   [`scripts/r-universe-check.sh`](/scripts/r-universe-check.sh) says when it took;
   until then the series is covered by the per-commit gate alone, and stage 3 of the loop has nothing to read back.
   Where the universe does not answer, [`r-universe-org/help`](https://github.com/r-universe-org/help) is its issue tracker.

**This hands the walk over.**
The loop's stage 1 runs `vendor-one.sh --commits 100` against the buffer it now discovers,
and the first firings walk the replay from 0.10.17 on.
The rc strand is not cut here:
it doubles CI, and is cut only when a landing is planned ([`series-rc`](/.claude/skills/series-rc/SKILL.md)).
