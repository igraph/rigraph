# Troubleshooting

When a vendor run stops or a series commit is red: telling the failure modes apart, and where each one's repair lives.
What the loop is and why is [`series-loop/`](/handbook/operations/vendoring/series-loop/README.md)'s,
and the repairs themselves are steps of its playbook, the `series-loop` skill.

**Start read-only.**
[`scripts/series-check.sh`](/scripts/series-check.sh) is always safe to run.
It prints one verdict per series from the `rcc2` store, with a `PATCH DRIFT`, `TESTS` or `LATE TAG` line where one applies;
where its verdict and the one in the `each-rcc` run that decided the commit disagree, the run is right
([`ci/per-commit/`](/handbook/operations/ci/per-commit/README.md)).
What a branch vendors:

```sh
git log -n 20 --format=%s -- src/vendor | grep -m1 '/igraph@'         # the upstream commit
sed -n 's/^#define IGRAPH_VERSION //p' src/vendor/igraph_version.h    # the version it reports
```

## A vendor run stops

[`scripts/vendor-one.sh`](/scripts/vendor-one.sh) exits with a status that names the failure and prints a banner saying what to do.
What each status asks for, and the fold-in that lands a fix inside its vendor commit, are the playbook's
([`1-vendor.md`](/.claude/skills/series-loop/references/1-vendor.md#the-gate-and-its-exit-status)).
Telling them apart:

* **1, an error.**
  The run refuses a dirty tree.
  Or the base scan found no `<owner>/igraph@` subject ([`pipeline/`](/handbook/operations/vendoring/pipeline/README.md)),
  most often because a vendor subject was reworded.
  Or the clone lacks the commit the branch last vendored: the replay is missing, or held only as a remote-tracking ref.
* **3, `GLUE BROKEN`**, the only status that implicates the commit at `HEAD`:
  the freshly vendored headers broke the glue in `src/`, the banner names the files, and the fix goes into that vendor commit.
* **4, `PATCH BROKEN`**: a `patch/` entry neither applies nor reverses on the regenerated tree, because the code it patches moved.
* **5, `WRONG UPSTREAM LINE`**: the clone's `HEAD` is not on the line the buffer vendors.
  Past the seam the walk ends at that `HEAD`, so it has to be igraph/igraph's `main`.
* **6, one of three banners.**
  `SHALLOW UPSTREAM CLONE` and `NO VERSION IN THE UPSTREAM CLONE` refuse before anything is vendored,
  because igraph's CMake stamps the version from `git describe --tags`.
  `GLUE CHECK COULD NOT RUN` means `./configure` failed and nothing was compiled, so it says nothing about the commit at `HEAD`.
* **7, `GENERATION FAILED`**: CMake, Stimulus or `cpp11::cpp_register()` failed on the regenerated tree, which is left uncommitted.
  Most often upstream renamed or merged a function in its interface definitions, and the fix is in `tools/stimulus/` or `patch/`.

## A red commit on `main-dev`

The playbook's stage 2 owns the repair: where a verdict and its log are read, the classification by what the log contains,
the fix order, and the fold that keeps every commit green on its own
([`2-repair.md`](/.claude/skills/series-loop/references/2-repair.md) has the reasons).
Whose fault the red is decides the path:

* **The infrastructure's**, such as a refused download or a cancelled leg: judge the commit again on `retry-main-dev`, once.
  A commit that fails its retry is the tree's, whatever its log looks like.
* **The tree's**: reproduce it with [`scripts/rcc-one.sh`](/scripts/rcc-one.sh), the gate CI runs, after `git clean -fdx -- src/`,
  and fold the fix into the offending vendor commit.
  Snapshot drift is reviewed as new behaviour before it is folded ([`testing/snapshots/`](/handbook/testing/snapshots/README.md)).
* **Upstream's**, a vendored tree that does not build or pass at that commit:
  folded into the next commit when that one repairs it, and a `patch/` entry only when the next is red too.
  The fold costs the one-to-one match with upstream at that point, and a patch costs a file to carry and trust to retire,
  so the patch is paid for only when no fold is available.
* **The flavor's**, a red on one of the seed's flavor commits, which CI judges first:
  the rename missed a file, and the fix goes into the flavor tooling on `main` as well as into the flavor commit.

A commit with no verdict has not been judged, and is waited for rather than guessed.
A failure on a platform the per-commit gate never covers arrives through r-universe instead,
and is recorded in a `main-dev` commit message rather than repaired by rewinding green.

## A tag upstream pushed late

A vendor commit names a tag only when the tag exists as it vendors, and the version header comes from `git describe --tags`,
so a commit vendored before upstream tagged it reports the previous release, `X.Y.W-N-g<sha>`, rather than `X.Y.Z`.
A landing must not carry that onto `main`, and `series-check.sh` prints a `LATE TAG` line until it is cleared.
While the tagged commit is still the buffer's newest, the next vendor run re-stamps it by itself,
appending a second vendor commit for the same SHA that differs only in the version header and the fifth version component.
Once the buffer has vendored past it, neither strand can take the re-stamp, and the landing re-vendors that commit instead
([`1-vendor.md`](/.claude/skills/series-loop/references/1-vendor.md#a-tag-upstream-pushed-late) has the commands).

## Patch drift

A vendor run applies the buffer's `patch/` stack, not `main-dev`'s,
so an entry that reached `main-dev` alone is absent the next time the buffer vendors,
and the commit that brings the code it patches arrives on `main-dev` with the fix reverted, looking like an ordinary vendor commit.
The port stage carries entries onto the buffer by test-applying each against the buffer's tree.
What the `PATCH DRIFT` line still names after a port is what the carry declined because it takes judgement
([`3-advance.md`](/.claude/skills/series-loop/references/3-advance.md#the-carry-of-patch-entries)):
an entry that fits neither tree yet waits for the code it answers,
while one that would supersede an entry of the buffer's own, or one both stacks carry in different versions, is settled by hand.

## Where a patch goes in the chain

A `patch/` entry belongs in the first commit whose tree carries the code it answers,
folded in with its effect on the vendored tree and an `R-side fix` section, on `main-build` and `main-dev` alike.
That is rarely the commit at which it was written, because an entry is written when someone reads the failure,
and the upstream change that raised it can be far below.
Where the entry first applies (`patch --dry-run`) is a lower bound rather than the answer:
an entry that wraps its subject rather than editing it applies to every version of the file, including those with nothing to fix.
Whether it belongs on `main` too is the same question asked of `main`'s engine,
and a landing that meets a commit vendoring nothing asks it again (`--placed` in the `series-land` skill).

## Generated files that do not reproduce

What vendoring writes is regenerated from the upstream commit, `patch/` and `tools/stimulus/` alone,
so re-vendoring the commit a branch already vendors, with [`scripts/vendor.sh`](/scripts/vendor.sh) and the clone checked out there,
leaves `git status` clean.
A difference is a hand edit to something vendoring owns, or a `patch/` entry aimed at a file vendoring never regenerates,
and the next vendor commit would undo it as a side effect, silently.
Move the change to where it travels, a `patch/` entry for `src/vendor/cigraph/` or `tools/stimulus/` for the R/C interface,
then regenerate and fold.
A port that conflicts in a generated file is resolved the same way, by regenerating on the series' tree rather than merging
([`traps.md`](/.claude/skills/series-loop/references/traps.md)).
