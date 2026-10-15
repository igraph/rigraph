# The pipeline

The machinery that turns one upstream commit into one vendor commit.

**Two scripts**, both regenerating everything vendoring owns, re-applying the patch stack, and committing:
[`scripts/vendor.sh`](/scripts/vendor.sh) vendors the upstream clone's `HEAD` as it stands, for a one-off run,
and [`scripts/vendor-one.sh`](/scripts/vendor-one.sh) walks to the next unvendored upstream commit,
one per invocation unless `--commits` asks for more, bumps the fifth version component, and runs the glue gate after each commit.
Both refuse a dirty tree, and both recover the base by scanning the newest commits that touch `src/vendor/` for an `<owner>/igraph@<sha>` subject,
refusing rather than guessing when the scan, bounded by `BASE_SCAN_DEPTH` (20), comes up empty.
A candidate is worth a commit when it is an exact tag or changes more than one file under `src/vendor/`,
because `src/vendor/igraph_version.h` changes for every commit off a tag.

**The upstream clone** is a full clone of igraph/igraph with its tags, plus the branch `replay-1.0.1` from `krlmlr/igraph`;
a shallow or tagless clone is refused, because igraph's CMake derives the version from `git describe --tags`.
Its `HEAD` says how far to walk upstream `main`; on the replay the walk ends at the replay's tip whatever `HEAD` says
([`model/`](/handbook/operations/vendoring/model/README.md)).

**What one commit regenerates** ([`scripts/vendor-lib.sh`](/scripts/vendor-lib.sh)):

* `src/vendor/cigraph/`: the upstream tree, keeping only what the build, Stimulus and the licence need
  (the keep-list in [`scripts/series-config.sh`](/scripts/series-config.sh));
* `src/vendor/igraph_version.h`, from igraph's CMake, with the abbreviated commit id pinned to nine characters so that two clones agree;
* the patch stack, applied to the vendored tree in place;
* `make -f Makefile-cigraph`: `src/vendor/igraph_threading.h`, the lexers and parsers in `src/vendor/io/`,
  `src/rinterface.c` and `R/aaa-*.R` from Stimulus, and `src/sources-*.mk` from `rconfigure.py`;
* `cpp11::cpp_register()`: `src/cpp11.cpp` and `R/cpp11.R`;
* the `src/*.dd` dependency lists.

**The glue gate** syntax-checks every C and C++ file directly in `src/` against the freshly vendored headers, after every vendor commit,
and stops the walk at the first break with the breaking commit at `HEAD` (exit 3).
A generator that fails (exit 7) stops before the commit, with the regenerated tree in place;
the fix is usually a Stimulus definition ([`adaptation/`](/handbook/operations/vendoring/adaptation/README.md)).

**The patch stack** under [`patch/`](/patch) carries every change this package needs in the vendored tree, and nothing outside it.
A patch that applies forward is applied.
One that reverses cleanly is already in the regenerated tree, so the run deletes it: this is how a patch retires once upstream carries it.
One that does neither stops the run (exit 4) with the regenerated sources uncommitted, for a rebase by hand.
Patches are numbered, numbers are never reused or renumbered, and each fix is sent upstream as well.

**The `DESCRIPTION` merge driver** ([`scripts/merge-version.sh`](/scripts/merge-version.sh), registered by [`scripts/setup-git.sh`](/scripts/setup-git.sh))
keeps the fourth version component, which `main` advances, and the fifth, which vendoring advances, mergeable across cherry-picks.

**A vendor commit's subject is machine-readable state**, and the shape is fixed:

```text
vendor: Update vendored sources to <owner>/igraph@<commit_hash>

Date: <author date of the upstream commit>

<subjects of the upstream first-parent commits since the previously vendored commit>
```

A tag says so, `vendor: Update vendored sources (tag 1.0.1) to igraph/igraph@<commit_hash>`, and `vendor-one.sh` ends its run there.
`<owner>` is `krlmlr` on the replay and `igraph` everywhere else.
Every script recovers where a branch stands in upstream history by parsing that SHA out of the subject, so do not reword it,
and do not squash vendor commits without keeping the newest SHA in the subject.
