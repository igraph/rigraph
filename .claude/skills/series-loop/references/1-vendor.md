# Stage 1: vendor onto `main-vendor`, and pick onto `main-build`

*Reference for stage 1 of [`series-loop`](../SKILL.md), read when the stage has work.*

**The strand is vendored once, and the buffer is derived from it.**
[`scripts/vendor-one.sh`](/scripts/vendor-one.sh) `--strand` writes one commit per upstream commit onto `main-vendor`:
the vendor paths alone (`series_vendor_paths` in [`scripts/series-config.sh`](/scripts/series-config.sh)),
the kept upstream tree with `patch/` applied, the version header, the parsers and the threading header,
no counter and no glue gate; whatever else the generator wrote is restored after the commit.
[`scripts/series-vendor.sh`](/scripts/series-vendor.sh) then picks each strand commit above the buffer's newest twin onto `main-build`,
twins being commits with the same vendor paths blob for blob,
and on the buffer regenerates what reads `tools/stimulus/` and the glue (`series_regenerate()`):
the R/C interface Stimulus generates, the source lists, the cpp11 registration and the dependency lists.
It stamps the fifth component of a vendor commit and runs the glue gate.
The generator comes in two halves with the patch stack applied between them:
`series_generate_tree()` writes the kept tree and the version header from the upstream clone,
and `series_generate_derived()` what the patched tree generates.
The second is told which of the two it writes, because a failure in the R-side half is the buffer's to fix:
a strand run never starts Stimulus, so it needs neither R nor Python.

**The clone's HEAD picks the line past the seam**, so check it out first.
On the replay, [`scripts/vendor-one.sh`](/scripts/vendor-one.sh) walks to the replay tip whatever HEAD says,
and at the tip it vendors the seam, tag 1.0.1, by itself ([`series.md`](series.md)).
From there it reads HEAD as the walk's right-hand end, and nothing else names one:
a clone left wherever the last session parked it vendors that branch onto the strand.
The script refuses when the strand's last vendored commit is off the first-parent line of HEAD (exit 5),
which is the shape a wrong ref takes; treat that refusal as the answer and check out igraph/igraph's `main`.

**`main`'s copy of the scripts, the worktree's everything else.**
The strand and the buffer take no ports, and stage 4 syncs the buffer's tooling only after this stage has run,
so they would otherwise vendor with whatever scripts they last received.
Invoking `main`'s copies closes that without teaching CI to read another branch's tree:
they are scripts the routine runs, not a cross-branch reference.
Only the scripts and their configuration come from `main`.
Everything they invoke by relative path stays the worktree's, because it is coupled to the tree it generates and patches:
`Makefile-cigraph`, `tools/fix-lexers.sh` and `patch/*.patch` the strand's,
`tools/stimulus/`, `rconfigure.py` and `./configure` the buffer's.

**A tag ends the run early.**
Every tag is vendored as a commit of its own, and the script then stops with exit 0 ("Vendored a tag. Stopping."),
whatever budget is left; rerun for the rest of it.
A commit whose regeneration changes nothing but the version header is skipped and folded into the next one that does.

## A tag upstream pushed late

`vendor-one.sh` writes the `(tag X.Y.Z)` marker only for a tag that exists when it vendors the commit,
and upstream sometimes pushes the tag later, onto a commit the strand has already vendored.
igraph's CMake writes `git describe --tags` into `src/vendor/igraph_version.h`,
so that commit then reports the previous release, `X.Y.W-N-g<sha>`, rather than `X.Y.Z`.

**When the tagged commit is the strand's newest, the next run repairs it.**
The script checks the commit it last vendored for a tag before it walks on,
re-vendors it when the tag is there and the marker is not,
and appends the result as a second strand commit for the same upstream SHA, marker included.
The two differ in the version header and nothing else; the pick onto the buffer adds the fifth version component.
The re-stamp is appended rather than amended because the plain commit may already sit under `main-green`, which only fast-forwards,
and it ends the run, as any tag does.
Stage 5 carries it onto `main-dev` like any buffer commit.
A run sees only the tags its upstream clone has, which is why stage 0 fetches the clone with `--tags`.

Two vendor commits for one SHA is why every script that pairs commits by vendored SHA matches the marker as well:
`series-advance.sh` and `series-check.sh` for the commit stage 5 consumes from,
and `series-forward-build.sh` for what a resumed replay has already done.

**`series-check.sh` reports the condition until it is gone.**
A `LATE TAG` line under the series names the tag, the upstream commit, and the buffer commit that vendored it without the marker,
and says whether the next run repairs it or the buffer has vendored past it.

**When the buffer has vendored past it, the landing takes the re-stamp.**
Appending the tagged tree above newer vendor commits would revert them, so neither strand can take it.
A landing that ends at the tag ([`series-land`](/.claude/skills/series-land/SKILL.md)) stops at the plain vendor commit for it,
and re-vendors that same commit before `main` takes it:

```sh
git -C "$U" fetch --tags origin
git -C "$U" checkout --detach X.Y.Z
scripts/vendor.sh "$U"
```

`vendor.sh` vendors the clone's `HEAD` as it stands, which is the commit the landing already carries,
so what it commits is the version header alone, and the landing's own checks judge it.

## The stops, and their exit status

`vendor-one.sh --strand` vendors and stops; it runs no glue gate, because the strand carries no glue.
Its stops are the strand's:

- **4, a patch broken.**
  A `patch/*.patch` neither applies forward nor reverses on the regenerated tree:
  the code it patches moved.
  The regenerated tree is in the working tree, uncommitted, and the upstream clone is kept.
  Rebase the patch against them, keeping the rebased patch outside the tree, then the strand fold-in below.
  Delete it only after confirming its effect is genuinely upstream, however upstream reached it, not its diff;
  a deletion rides in the strand commit too, as `git rm` in the first step.
  A patch whose change is already in the regenerated tree is deleted by the run itself, which is how a `patch/` entry retires,
  and the retirement rides on the strand commit, so the pick carries it to the buffer.
- **5, the wrong upstream line**: above.
- **6, a shallow or untagged clone**, refused before anything is vendored: fetch as stage 0 says.
- **7, the strand could not be generated** (`GENERATOR FAILED`).
  CMake failed on the upstream clone, before the patch stack, or flex or bison on the patched tree;
  what was regenerated is left uncommitted.
  Install what is missing; a grammar flex or bison cannot take needs a `patch/` entry, then the strand fold-in.
- **1** is an error, most often a clone without the replay (stage 0) or a worktree that was not clean.

`series-vendor.sh` picks, regenerates, stamps and gates, and stops with the pick at HEAD of the buffer worktree.
The gate syntax-checks the glue,
every C and C++ file directly in `src/`, generated or hand-written,
against the vendored headers (flags derived from `R CMD SHLIB -n`, no link, no R session);
the check is `glue_compiles()` in [`scripts/vendor-lib.sh`](/scripts/vendor-lib.sh).
Its stops are the buffer's, and the strand commit stays as it is:

- **3, glue broken.**
  Fix the glue: the hand-written C and C++ in `src/`,
  or `tools/stimulus/` and then regenerate in the buffer worktree
  (`(cd "$B" && bash -c '. "$M"/scripts/series-config.sh && series_regenerate')`),
  never `src/vendor/` and never `src/rinterface.c`, `R/aaa-*.R` or the cpp11 files by hand.
  Format what you touched (`air format .` for R), `git -C "$B" add -A && git -C "$B" commit --amend`,
  appending an `R-side fix` section naming the upstream change and what was adapted,
  and rerun the script to finish the picks.
- **7, the R/C interface could not be generated** (`GENERATOR FAILED`).
  Stimulus or `cpp11::cpp_register()` failed on the pick, and the script has undone it: the buffer stands where it did.
  Most often an interface changed upstream: adapt `tools/stimulus/*.yaml`, then the buffer fold-in below;
  a `patch/` entry is the strand's instead.
- **8, the glue check could not run**, because `./configure` failed:
  nothing was compiled, so this says nothing about the commit at HEAD; do not amend it, read `./configure`'s output, rerun.
- **1** is a refusal, or a pick that conflicts: the buffer's vendor paths have drifted from the strand's,
  which happens only when something vendored or patched the buffer directly.

## The fold-ins

The scripts refuse to start on a dirty tree, and a fix a vendor commit needs has to ride in it,
so it lands as a temporary commit the next run vendors or picks on top of, squashed into the commit afterwards.
`$V` and `$B` are the strand and buffer worktrees, `$U` the upstream clone and `$M` the `main` checkout,
as the playbook's stages 0 and 1 set them,
and the commands run from the `main` checkout, so the scripts are still `main`'s copies.
The strand's, for exits 4 and 7 of `vendor-one.sh --strand`:

```sh
git -C "$V" checkout -- . && git -C "$V" clean -fd src     # then put the fix back
git -C "$V" commit -m 'tmp: fix generation' -- <the fix>
VENDOR_REPO=$V scripts/vendor-one.sh --strand --commits 1 "$U"
{ git -C "$V" log -1 --format=%B; printf '\nR-side fix:\n\n%s\n' '<what was adapted, and why>'; } > "$V.msg"
git -C "$V" reset --soft HEAD~2 && git -C "$V" commit -q -F "$V.msg"
```

The buffer's, for exit 7 of `series-vendor.sh`, which has undone the pick, takes it again above the fix:

```sh
git -C "$B" clean -fdq src R     # what the failed run left untracked; then put the fix in
git -C "$B" commit -m 'tmp: fix generation' -- <the fix>
(cd "$B" && "$M"/scripts/series-vendor.sh main --count 1)
{ git -C "$B" log -1 --format=%B; printf '\nR-side fix:\n\n%s\n' '<what was adapted, and why>'; } > "$B.msg"
git -C "$B" reset --soft HEAD~2 && git -C "$B" commit -q -F "$B.msg"
```

The temporary commit vendors nothing and leaves the vendor paths alone,
so the vendored-SHA scan and the twin match both look past it.
The banners print shorter forms of these, run from the worktree;
the `git commit` that ends `PATCH BROKEN`'s opens an editor, which a routine cannot answer, so write the message with `-F` as above.

## What the buffer takes

If no fix can help because the vendored tree itself is broken at that commit,
vendor on and fold the broken commit into the next one, when that repairs it, by the fold rule in stage 2;
the broken tree never stands alone on the chain.

Push `main-vendor` and `main-build` unconditionally: red never blocks the buffer, that is the point of it.
The buffer holds what the code needs to **compile**, because that is what the gate checks at every commit;
tests and R code are `-dev`'s concern, and nothing under `src/vendor/` is edited by hand in this stage.

**A series opened before the strand existed derives one, once.**
`scripts/series-vendor.sh main --init --push` writes `main-vendor` from `main-build`:
for every buffer commit above the seed that touches the vendor paths, a strand commit carrying those paths and nothing else,
with the buffer commit's message and author; nothing is re-vendored.
`series-check.sh` asks for it with a `VENDOR` line, and says so too when the strand is ahead of the buffer, picks being due,
or behind it, where something vendored onto the buffer directly.
