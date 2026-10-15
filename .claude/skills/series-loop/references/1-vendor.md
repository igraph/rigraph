# Stage 1: vendor onto `main-build`

*Reference for stage 1 of [`series-loop`](../SKILL.md), read when the stage has work.*

**The clone's HEAD picks the line past the seam**, so check it out first.
On the replay, [`scripts/vendor-one.sh`](/scripts/vendor-one.sh) walks to the replay tip whatever HEAD says,
and at the tip it vendors the seam, tag 1.0.1, by itself ([`series.md`](series.md)).
From there it reads HEAD as the walk's right-hand end, and nothing else names one:
a clone left wherever the last session parked it vendors that branch onto the buffer.
The script refuses when the buffer's last vendored commit is off the first-parent line of HEAD (exit 5),
which is the shape a wrong ref takes; treat that refusal as the answer and check out igraph/igraph's `main`.

**`main`'s copy of the script, the buffer's everything else.**
The buffer takes no ports, and stage 4 syncs its tooling only after this stage has run,
so a buffer would otherwise vendor with whatever script it last received.
Invoking `main`'s copy closes that without teaching CI to read another branch's tree:
it is a script the routine runs, not a cross-branch reference.
Only the script and its configuration come from `main`.
Everything it invokes by relative path, `Makefile-cigraph`, `tools/stimulus/`, `rconfigure.py`, `patch/*.patch`, `./configure`,
stays the buffer's, because those are coupled to the tree they generate and patch.

**A tag ends the run early.**
Every tag is vendored as a commit of its own, and the script then stops with exit 0 ("Vendored a tag. Stopping."),
whatever budget is left; rerun for the rest of it.
A commit whose regeneration changes nothing but the version header is skipped and folded into the next one that does.

## A tag upstream pushed late

`vendor-one.sh` writes the `(tag X.Y.Z)` marker only for a tag that exists when it vendors the commit,
and upstream sometimes pushes the tag later, onto a commit the buffer has already vendored.
igraph's CMake writes `git describe --tags` into `src/vendor/igraph_version.h`,
so that commit then reports the previous release, `X.Y.W-N-g<sha>`, rather than `X.Y.Z`.

**When the tagged commit is the buffer's newest, the next run repairs it.**
The script checks the commit it last vendored for a tag before it walks on,
re-vendors it when the tag is there and the marker is not,
and appends the result as a second vendor commit for the same upstream SHA, marker included.
The two differ in the version header and the fifth version component, and in nothing else.
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

## The gate, and its exit status

After each vendored commit the script syntax-checks the glue,
every C and C++ file directly in `src/`, generated or hand-written,
against the freshly vendored headers (flags derived from `R CMD SHLIB -n`, no link, no R session),
and **stops at the first failure** with the breaking vendor commit at HEAD and the upstream clone kept;
the check is `glue_compiles()` in [`scripts/vendor-lib.sh`](/scripts/vendor-lib.sh).

- **3, glue broken.**
  Fix the glue: the hand-written C and C++ in `src/`,
  or `tools/stimulus/` and then regenerate (`make -f Makefile-cigraph DOCKER=`, `Rscript -e 'cpp11::cpp_register()'`),
  never `src/vendor/` and never `src/rinterface.c`, `R/aaa-*.R` or the cpp11 files by hand.
  Format what you touched (`air format .` for R), amend into HEAD,
  appending an `R-side fix` section naming the upstream change and what was adapted,
  and rerun the script to finish the budget.
- **4, a patch broken.**
  A `patch/*.patch` neither applies forward nor reverses on the regenerated tree:
  the code it patches moved.
  The regenerated sources are in the working tree, uncommitted.
  Rebase the patch against them, keeping the rebased patch outside the tree, then the fold-in below.
  Delete it only after confirming its effect is genuinely upstream, however upstream reached it, not its diff;
  a deletion rides in the vendor commit too, as `git rm` in the first step.
  A patch whose change is already in the regenerated tree is deleted by the run itself, which is how a `patch/` entry retires.
- **5, the wrong upstream line**: above.
- **6, a shallow or untagged clone**, refused before anything is vendored: fetch as stage 0 says.
- **7, the R/C interface could not be generated.**
  CMake, Stimulus or `cpp11::cpp_register()` failed on the regenerated tree, which is left uncommitted.
  Most often an interface changed upstream: adapt `tools/stimulus/*.yaml` or add a `patch/` entry,
  keeping the fix outside the tree, then the fold-in.
- **8, the glue check could not run**, because `./configure` failed:
  nothing was compiled, so this says nothing about the commit at HEAD; do not amend it, read `./configure`'s output, rerun.
- **1** is an error, most often a clone without the replay (stage 0) or a worktree that was not clean.

## The fold-in

The script refuses to start on a dirty tree, and a fix the vendor run needs has to ride in the vendor commit,
so it lands as a temporary commit the next run vendors on top of, squashed into the vendor commit afterwards.
`$B` is the buffer worktree and `$U` the upstream clone, as the playbook's stages 0 and 1 set them,
and the commands run from the `main` checkout, so the script is still `main`'s copy:

```sh
git -C "$B" checkout -- . && git -C "$B" clean -fd src R     # then put the fix back
git -C "$B" commit -m 'tmp: fix generation' -- <the fix>
VENDOR_REPO=$B scripts/vendor-one.sh --commits 1 "$U"
{ git -C "$B" log -1 --format=%B; printf '\nR-side fix:\n\n%s\n' '<what was adapted, and why>'; } > "$B.msg"
git -C "$B" reset --soft HEAD~2 && git -C "$B" commit -q -F "$B.msg"
```

The temporary commit vendors nothing, so the vendored-SHA scan looks past it.
The script's banner prints the same commands, run from the buffer.

## What the buffer takes

If no fix can help because the vendored tree itself is broken at that commit,
vendor on and fold the broken commit into the next one, when that repairs it, by the fold rule in stage 2;
the broken tree never stands alone on the chain.

Push `main-build` unconditionally: red never blocks the buffer, that is the point of it.
The buffer holds what the code needs to **compile**, because that is what the gate checks at every commit;
tests and R code are `-dev`'s concern, and nothing under `src/vendor/` is edited by hand in this stage.
