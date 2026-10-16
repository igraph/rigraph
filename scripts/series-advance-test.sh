#!/bin/bash
# Check stage 5's carry of the base series' test-side fixes, offline, against a
# synthetic remote and clone built here -- no network, no fixtures on disk.
#
# The split this rests on is how far a fix was demanded (duckdb/duckdb-r#2594):
# `-build` holds what the code needs to **compile**, because that is what the
# vendor gate checks, and `-dev` holds everything CI asked for after that --
# including glue, which is why the carry is a difference and not an allow-list.
# A forward series inherits only the first when its buffer is replayed out of
# `-build`, and both when it is replayed out of `-dev`
# (scripts/series-forward-build.sh). Twenty things are checked.
#
#   1. A buffered commit whose base `-dev` twin folded a test-side fix is minted
#      with that fix in the same commit -- not stacked above it -- carrying the
#      twin's message and a trailer naming where it came from.
#   2. Glue the twin has beyond its `-build` commit is carried, because the
#      buffer already compiles and anything on top of it was demanded by
#      something later than the compiler -- and it is reported, because glue
#      missing from the base buffer is drift that wants mirroring there.
#   3. Glue the buffer already carries is applied once, by the pick. That is
#      what taking the difference buys over replaying the twin wholesale.
#   4. The buffer's own strand is never carried: `src/vendor/cigraph/` and
#      `patch/`, which a forward regenerates from its own patches.
#   5. What vendoring regenerates is never carried -- `R/aaa-*.R`,
#      `src/sources-*.mk` -- since it differs between any two runs of the
#      same upstream SHA and is noise, not a fix.
#   6. A series with no base to mine -- not a forward, or a forward whose base
#      is gone after cutover -- behaves exactly as it did before this existed,
#      and a chunk with no carry still moves the ref rather than replaying.
#   7. A conflicting carry stops the run with the conflict in a worktree that is
#      kept, writes no ref, and names both commits.
#   8. `--continue` finishes the resolved commit with the twin's message and
#      completes the rest of the chunk.
#   9. Starting a second run while one is stopped refuses rather than replaying
#      over the resolution; `--abort` discards it and writes no ref.
#  10. The fifth version component still rises once per vendor commit, carry or
#      no carry.
#  11. A base series with a *live* forward counterpart consumes its buffer like
#      any other. It used to be refused, which froze the branch a cutover is
#      measured against and left the forward with no twin to mine.
#  12. A replay in which every buffer commit drops as empty reports that nothing
#      was added, rather than an empty buffer, and leaves the ref where it was.
#  13. `--dev-note` appends a stage-3 finding to the newest commit the chunk
#      mints -- taking the replay route so there is one to write it on -- under
#      an `R-side fix` header it writes when the note brought none, and
#      refuses when the chunk minted nothing or the file is not there.
#  14. A replay whose conflict resolves to nothing is dropped rather than
#      stopping the stage: the buffer commit's content reached `-dev` by another
#      route, which is claim 12 arrived at through a conflict. The chunk also
#      finishes when the operator dropped the pick by hand first.
#  15. A red commit in flight does not hold back the verified commits below it:
#      green and its canonical copy take them, and the firing then stops
#      before stage 5 extends `-dev` onto a tip a repair is about to re-mint.
#  16. A buffer tooling sync is skipped, never replayed: `-dev`'s tooling is
#      stage 4's, and a sync taken against older tooling would conflict or put
#      back what `main` removed. The vendor commits above it are consumed.
#  17. A twin is looked up above the forward's green only: `main`'s history
#      below the seed may vendor the same SHA, and its commit is not the fix
#      the base series folded.
#  18. A carry never stops a test the forward runs: a twin that deleted a test
#      file or skipped a test for good leaves the forward's copy where it is,
#      and the commit message says so, while an engine gate and a snapshot
#      fold in the same twin carry as usual.
#  19. A buffer replayed from the base `-dev` carries nothing twice: the twin's
#      fix is in the buffer commit under a blob `main`'s drift moved on, the
#      twin's own change reverse-applies there, and the chunk is a plain ref
#      move with no provenance trailer.
#  20. A late tag's re-stamp -- a second vendor commit for the upstream SHA
#      `-dev` already vendored, carrying `(tag ...)` -- is consumed rather than
#      taken for the anchor, and a forward series keeps its marker when the base
#      has a twin for the plain commit only.
#
# Usage:
#   scripts/series-advance-test.sh
#
# Environment variables:
#   KEEP - if non-empty, do not delete the scratch directory

set -euo pipefail

HERE=$(cd "$(dirname "$0")" && pwd)
SCRATCH=$(mktemp -d)
[ -n "${KEEP:-}" ] || trap 'rm -rf "$SCRATCH"' EXIT
[ -z "${KEEP:-}" ] || echo "scratch: $SCRATCH"

pass=0
fail=0
ok() { pass=$((pass + 1)); echo "  ok   $1"; }
no() { fail=$((fail + 1)); echo "  FAIL $1"; }
is() { if [ "$2" = "$3" ]; then ok "$1"; else no "$1"; echo "         actual: $2"; echo "       expected: $3"; fi; }
has() { case "$2" in *"$3"*) ok "$1" ;; *) no "$1"; echo "       missing: $3" ;; esac; }
hasnt() { case "$2" in *"$3"*) no "$1"; echo "     unexpected: $3" ;; *) ok "$1" ;; esac; }

# --- the fixture -----------------------------------------------------------
#
# A bare remote plus a clone, because stage 5 reads `origin/*` and pushes. The
# shape is one base series that has been through repair -- so its `-dev` carries
# folds its `-build` never saw -- and a forward series whose buffer was replayed
# out of that `-build` and therefore has none of them.
#
# The verdict store is stubbed on an `rcc2` branch: stage 5 refuses to extend
# over a `failure`, and reads `missing` for anything absent, which is what a
# freshly pushed commit looks like.

REMOTE=$SCRATCH/remote.git
WORK=$SCRATCH/work
git init -q --bare -b main "$REMOTE"

git init -q -b main "$WORK"
cd "$WORK"
git config user.name Test
git config user.email test@example.invalid
git config commit.gpgsign false
git remote add origin "$REMOTE"

mkdir -p scripts src/vendor/cigraph tests/testthat/_snaps R patch
for s in series-advance.sh series-tests.sh setup-git.sh merge-version.sh series-config.sh series-lib.sh vendor-lib.sh; do
  cp "$HERE/$s" scripts/
done
chmod +x scripts/*.sh
echo 'DESCRIPTION merge=ours-version' > .gitattributes

# The attribute is committed and the name -> command mapping is not, so a fresh
# clone has the first and never the second -- which is what series-advance.sh
# refuses on up front (duckdb/duckdb-r#2659). Register it here, as every real
# clone does, or the suite fails at the refusal rather than at what it checks.
scripts/setup-git.sh >/dev/null

desc() { printf 'Package: igraph\nVersion: %s\n' "$1" > DESCRIPTION; }
# The R interface Stimulus generates from the vendored tree, one of the files
# vendoring regenerates (series_regenerated in scripts/series-config.sh).
iface() { echo "# Generated from $1" > R/aaa-structural.R; }

# `main`'s history, below every seed, already vendored a SHA the base series
# vendors again after rewinding to an older fork point (claim 17).
echo 'main history of the snapshot' > tests/testthat/_snaps/sql.md
desc 0.9.0
git add -A
git commit -qm 'vendor: Update vendored sources to igraph/igraph@aaaaaaa (#1)'

desc 1.0.0.9000.0
iface seed
echo 'seed glue' > src/glue.cpp
echo 'snapshot one' > tests/testthat/_snaps/sql.md
echo 'snapshot types' > tests/testthat/_snaps/types.md
echo 'foo <- function() 1' > R/foo.R
mkdir -p src/vendor/cigraph
echo 'vendored at the seed' > src/vendor/cigraph/seed.c
echo 'generated sources list' > src/sources-igraph.mk
git add -A
git commit -qm 'vendor: Update vendored sources to igraph/igraph@0000000'
git branch base-seed

# The seed carries a vendor commit because a real one does: a forward's seed is
# a flavored `main`, whose history is vendor commits. `vendored_sha` walks past
# a `-dev` that has none of its own and lands there, which is how stage 5 finds
# the anchor on a forward series' first extension.

# --- the base series' buffer: compile-side only -----------------------------
bvendor() { # <sha> <version> <file> [<glue>]
  mkdir -p src/vendor/cigraph
  echo "vendored $1" > "src/vendor/cigraph/$3"
  [ -z "${4:-}" ] || echo "$4" > src/glue.cpp
  desc "$2"; iface "build-$1"
  echo "generated sources list for $1" > src/sources-igraph.mk
  git add -A
  git commit -qm "vendor: Update vendored sources to igraph/igraph@$1"
}

bvendor aaaaaaa 1.0.0.9000.1 a.c
bvendor bbbbbbb 1.0.0.9000.2 b.c 'glue adapted for bbbbbbb'
bvendor ccccccc 1.0.0.9000.3 c.c
bvendor ddddddd 1.0.0.9000.4 d.c
bvendor eeeeeee 1.0.0.9000.5 e.c
git branch base-build

# --- the base series' -dev: the same, with what CI demanded folded in -------
git checkout -q -b base-dev base-seed
amend() { git add -A; git log -1 --format=%B | { cat; echo; echo "$1"; } | git commit -q --amend -F-; }

# aaaaaaa: a snapshot fold -- the archetype (claim 1).
bvendor aaaaaaa 1.0.0.9000.1 a.c
echo 'snapshot one, corrected' > tests/testthat/_snaps/sql.md
amend 'Snapshot corrected for the new engine output.'

# bbbbbbb: the buffer's own glue, unchanged (claim 3), plus a second glue file
# the tests demanded (claim 2), the buffer's strand (claim 4) and the
# regenerated bookkeeping (claim 5).
bvendor bbbbbbb 1.0.0.9000.2 b.c 'glue adapted for bbbbbbb'
echo 'rinterface fix the tests demanded' > src/rinterface_extra.c
echo 'patched' > patch/0001-fix.patch
echo 'in-place patch effect' >> src/vendor/cigraph/b.c
echo 'generated sources list, per dev' > src/sources-igraph.mk
iface 'dev-bbbbbbb'
amend 'Glue fix a test demanded, plus bookkeeping that is not a fix.'

# ccccccc: nothing folded at all.
bvendor ccccccc 1.0.0.9000.3 c.c

# ddddddd: an R-code fix (claim 1, second shape).
bvendor ddddddd 1.0.0.9000.4 d.c
echo 'foo <- function() 2' > R/foo.R
amend 'foo() returns 2 now.'

# eeeeeee: a snapshot the forward series has since changed for itself (claim 5).
bvendor eeeeeee 1.0.0.9000.5 e.c
echo 'snapshot types, per the base' > tests/testthat/_snaps/types.md
amend 'Types snapshot follows the engine.'

git branch base-green base-dev
git branch base-build-base base-build

# --- the forward series -----------------------------------------------------
# Its buffer is the base buffer's content -- compile side only -- and its -dev
# starts at the seed with one commit of its own R side, so the last carry
# conflicts.
git checkout -q -b base-fwd-build base-build
git checkout -q -b base-fwd-dev base-seed
echo 'snapshot types, per the forward' > tests/testthat/_snaps/types.md
git add -A
git commit -qm 'test: the forward series has its own types snapshot'
git branch base-fwd-green base-fwd-dev
git branch base-fwd-build-base base-fwd-build

# --- the base series' own buffer, one commit past its -dev (claim 11) --------
# Added after `base-fwd-build` was branched, so the forward's buffer stays at
# five and only the base has something left to consume. `base-fwd-green` carries
# a commit `base-green` does not, so the forward is live rather than cutover
# litter -- which is the shape this stage used to refuse to extend over.
git checkout -q base-build
bvendor fff9999 1.0.0.9000.6 h.c

# --- a series with no forward and no base to mine (claim 4) -----------------
git checkout -q -b solo-dev base-seed
git branch solo-green solo-dev
git checkout -q -b solo-build base-seed
bvendor fff1111 1.0.0.9000.1 f.c
bvendor fff2222 1.0.0.9000.2 g.c
git branch solo-build-base base-seed

# --- a series for the stage-3 finding note (claim 13) -----------------------
# Same shape as `solo`, so the note is checked on a chunk that would otherwise
# have taken the plain ref move -- which is the route the note has to override.
git checkout -q -b note-dev base-seed
git branch note-green note-dev
git checkout -q -b note-build base-seed
bvendor fff4444 1.0.0.9000.1 j.c
bvendor fff5555 1.0.0.9000.2 k.c
git branch note-build-base base-seed

# --- the same, for a note that brings no header of its own (claim 13) -------
git checkout -q -b bare-dev base-seed
git branch bare-green bare-dev
git checkout -q -b bare-build base-seed
bvendor fff6666 1.0.0.9000.1 l.c
bvendor fff7777 1.0.0.9000.2 m.c
git branch bare-build-base base-seed

# --- a buffer commit whose content already reached -dev (claim 12) ----------
# Stage 3 sends a patch/ entry down both paths on purpose, so the replay drops
# it (`--empty=drop`) and the stage adds nothing. The subject on the -dev side
# is not a vendor one, so the anchor looks past it to the seed and the buffer
# still reads as one commit ahead -- which is what makes the drop reachable.
git checkout -q -b dup-dev base-seed
bvendor fff3333 1.0.0.9000.1 i.c
git commit -q --amend -m 'chore: Carry the same content by another route'
git branch dup-green base-seed
git checkout -q -b dup-build base-seed
bvendor fff3333 1.0.0.9000.1 i.c
git branch dup-build-base base-seed

# --- a buffer commit whose conflict resolves to nothing (claim 14) ----------
# The same drop as above, reached through a conflict instead of a clean merge:
# `-build` carries no ports, so its flavor rename still names the path the port
# has since moved on `-dev`, and the two renames of one file collide. Resolving
# toward what `-dev` already has leaves nothing to commit.
git checkout -q -b emptyres-seed base-seed
mkdir -p inst
echo 'types' > inst/types.hpp
git add -A
git commit -qm 'chore: Add the types header the flavor renames'

git checkout -q -b emptyres-dev emptyres-seed
mkdir -p src/include
git mv inst/types.hpp src/include/flavored.hpp
git commit -qm 'chore: Reflavor, and take the move a port brought'
git branch emptyres-green emptyres-seed
git checkout -q -b emptyres-build emptyres-seed
git mv inst/types.hpp inst/flavored.hpp
git commit -qm 'chore: Reflavor'
git branch emptyres-build-base emptyres-seed

# --- a verified prefix under a red tip (claim 15) ---------------------------
# Two commits in flight, the older one green and the newer one red, and a buffer
# commit waiting behind them. Stage 3 owes the frontier the commit it proved;
# stage 5 owes the buffer nothing while a repair is pending.
git checkout -q -b red-dev base-seed
bvendor fff7777 1.0.0.9000.1 l.c
RED_OK=$(git rev-parse HEAD)
bvendor fff8888 1.0.0.9000.2 m.c
RED_BAD=$(git rev-parse HEAD)
git branch red-green base-seed
git checkout -q -b red-build red-dev
bvendor fff9990 1.0.0.9000.3 n.c
git branch red-build-base base-seed

# --- a buffer tooling sync above the anchor (claim 16) ----------------------
# The buffer's sync took main's tooling as it was then; stage 4 has since given
# -dev main's tooling as it is now, and the two disagree on the same file. A
# pick of the sync conflicts there; the vendor commit above it is the real work.
git checkout -q -b tsync-build base-seed
bvendor ggg1111 1.0.0.9000.1 p.c
TSYNC_V1=$(git rev-parse HEAD)
mkdir -p .github/workflows
echo 'jobs: as main had them at the buffer sync' > .github/workflows/w.yaml
git add -A
git commit -qm 'chore(series): Sync buffer tooling with main'
bvendor ggg2222 1.0.0.9000.2 q.c
git checkout -q -b tsync-dev "$TSYNC_V1"
mkdir -p .github/workflows
echo 'jobs: as main has them now' > .github/workflows/w.yaml
git add -A
git commit -qm 'chore(series): Sync tooling with main'
git branch tsync-green tsync-dev
git branch tsync-build-base "$TSYNC_V1"

# --- a base whose rewind took tests away, and its forward (claim 18) --------
# The seed runs three tests; the base twin of the one buffer commit deletes the
# first, skips the second for good, gates the third and folds a snapshot, as a
# rewind did on `v2.0-cyanoptera-fwd`.
git checkout -q -b loss-seed base-seed
for t in gone skip gate; do
  printf 'test_that("%s", {\n  expect_true(TRUE)\n})\n' "$t" > "tests/testthat/test-$t.R"
done
git add -A
git commit -qm 'test: Three tests main runs'
git checkout -q -b loss-build loss-seed
bvendor ace1111 1.0.0.9000.1 o.c
git checkout -q -b loss-dev loss-seed
bvendor ace1111 1.0.0.9000.1 o.c
git rm -q tests/testthat/test-gone.R
printf 'test_that("skip", {\n  skip_on_cran()\n  expect_true(TRUE)\n})\n' > tests/testthat/test-skip.R
printf 'test_that("gate", {\n  skip_if_engine_before("9.9.9", "not yet")\n  expect_true(TRUE)\n})\n' \
  > tests/testthat/test-gate.R
echo 'snapshot one, as ace1111 renders it' > tests/testthat/_snaps/sql.md
amend 'Rewound: test-gone.R removed, test-skip.R skipped, test-gate.R gated.'
git branch loss-green loss-dev
git branch loss-build-base loss-build
git branch loss-fwd-build loss-build
git branch loss-fwd-build-base loss-build
git branch loss-fwd-dev loss-seed
git branch loss-fwd-green loss-seed

# --- a forward whose buffer was replayed from the base -dev (claim 19) -------
# scripts/series-forward-build.sh replays `-dev`'s vendor commits, fixes folded
# in, onto a seed `main` has moved under. The buffer commit therefore holds the
# twin's snapshot fix in a file `main` has since added a line to, so the two
# blobs differ although the fix is there; the R fix sits in a file `main` left
# alone, so those blobs agree.
git checkout -q -b kept-dev base-seed
bvendor kkk1111 1.0.0.9000.1 r.c
echo 'snapshot one, corrected' > tests/testthat/_snaps/sql.md
echo 'foo <- function() 2' > R/foo.R
amend 'Snapshot corrected, and foo() returns 2 now.'
git checkout -q -b kept-seed base-seed
printf 'snapshot one\nmain added a snapshot\n' > tests/testthat/_snaps/sql.md
git add -A
git commit -qm 'test: main added a snapshot since the base was seeded'
git checkout -q -b kept-fwd-build kept-seed
bvendor kkk1111 1.0.0.9000.1 r.c
printf 'snapshot one, corrected\nmain added a snapshot\n' > tests/testthat/_snaps/sql.md
echo 'foo <- function() 2' > R/foo.R
amend 'Snapshot corrected, and foo() returns 2 now.'
git branch kept-fwd-dev kept-seed
git branch kept-fwd-green kept-seed
git branch kept-fwd-build-base kept-seed

# --- a late tag's re-stamp on the buffer (claim 20) -------------------------
# Upstream tagged abc1111 after the buffer vendored it, so vendor-one.sh
# appended a second vendor commit for the same SHA, differing in the version
# stamp alone. -dev carries the plain one with a fold in it, which puts it off
# the buffer's line, so stage 5 has to find the anchor by subject. The forward
# counterpart was replayed from that buffer before the base -dev took the
# re-stamp, so the base has a twin for the plain commit only.
git checkout -q -b late-build base-seed
bvendor abc1111 1.0.0.9000.1 r.cpp
LATE_V1=$(git rev-parse HEAD)
echo '#define IGRAPH_VERSION "9.9.9"' > src/vendor/igraph_version.h
desc 1.0.0.9000.2
git add -A
git commit -qm 'vendor: Update vendored sources (tag 9.9.9) to igraph/igraph@abc1111'
git checkout -q -b late-dev "$LATE_V1"
echo 'snapshot one, per the new engine' > tests/testthat/_snaps/sql.md
amend 'Snapshot corrected for the new engine output.'
git branch late-green late-dev
git branch late-build-base "$LATE_V1"
git branch late-fwd-build late-build
git branch late-fwd-dev base-seed
git branch late-fwd-green base-seed
git branch late-fwd-build-base base-seed

# The store stub: stage 5 refuses over a `failure` and reads `missing` for
# anything absent, which is what a freshly pushed commit looks like. The `red`
# series is the one case that needs real records, so it gets two.
git checkout -q --orphan rcc2
git rm -rqf .
rec() { # <sha> <state>
  mkdir -p "runs2.d/${1:0:2}"
  printf '{"commit":"%s","status":{"context":"rcc","state":"%s"}}\n' "$1" "$2" \
    > "runs2.d/${1:0:2}/$1.ndjson"
}
rec "$RED_OK" success
rec "$RED_BAD" failure
git add -A
git commit -q -m 'chore: store stub'

git checkout -q main
git push -q origin main base-seed base-build base-dev base-green base-build-base \
  base-fwd-build base-fwd-dev base-fwd-green base-fwd-build-base \
  solo-build solo-dev solo-green solo-build-base \
  note-build note-dev note-green note-build-base \
  bare-build bare-dev bare-green bare-build-base \
  dup-build dup-dev dup-green dup-build-base \
  red-build red-dev red-green red-build-base \
  tsync-build tsync-dev tsync-green tsync-build-base \
  emptyres-build emptyres-dev emptyres-green emptyres-build-base \
  loss-build loss-dev loss-green loss-build-base \
  loss-fwd-build loss-fwd-dev loss-fwd-green loss-fwd-build-base \
  kept-dev kept-fwd-build kept-fwd-dev kept-fwd-green kept-fwd-build-base \
  late-build late-dev late-green late-build-base \
  late-fwd-build late-fwd-dev late-fwd-green late-fwd-build-base rcc2
git fetch -q origin

# A canonical remote, because `red` is the one series here whose green moves,
# and the mirror is what r-universe reads. Only `red-green` lives there, the way
# only green travels out of the fork.
CANON=$SCRATCH/canonical.git
git init -q --bare -b main "$CANON"
git remote add upstream "$CANON"
git push -q upstream red-green

run() { set +e; scripts/series-advance.sh "$@" 2>&1; echo "EXIT=$?"; set -e; }
# Collected, then matched -- never piped straight into `grep -m1`. The grep
# leaves as soon as it matches, and the SIGPIPE that hands `git log` surfaces
# through `pipefail` as a failed command, aborting the whole run with 141
# instead of failing a check. Whether it fires at all depends on how much the
# log still had to write, so the same suite passes three times and dies on the
# fourth. The same rule, for the same reason, as scripts/series-check.sh.
at() { # <series> <upstream sha> -> the -dev commit vendoring it
  local log
  log=$(git log --format='%H %s' "origin/$1-green..origin/$1-dev")
  grep -m1 "igraph@$2" <<<"$log" | cut -d' ' -f1
}
wat() { # <upstream sha> -> the same, inside the kept worktree
  local log
  log=$(git -C "$WT" log --format='%H %s')
  grep -m1 "igraph@$1" <<<"$log" | cut -d' ' -f1
}

# --- claims 1-3, 5, 8: extend the forward series ----------------------------
echo
echo "== extending base-fwd from its buffer, mining base-dev"
out=$(run base-fwd)

has "reports how many carry a fix" "$out" 'carry a fix from origin/base-dev'
has "stops on the conflicting carry" "$out" 'conflicted'
has "names the twin it came from"    "$out" 'carrying the test-side fix from'
has "names the stage-5 resume"       "$out" 'series-advance.sh base-fwd --continue'
has "says no ref was written"        "$out" 'No ref was written.'

git fetch -q origin
is "nothing was pushed" \
  "$(git rev-list --count origin/base-fwd-green..origin/base-fwd-dev)" 0

WT=$(awk '{print $1}' .git/series-advance-base-fwd)
is "the worktree is kept"    "$([ -d "$WT" ] && echo yes)" yes
is "with the conflict in it" "$(git -C "$WT" diff --name-only --diff-filter=U)" 'tests/testthat/_snaps/types.md'
# The pick lands and the carry conflicts on top of it, so the fifth commit
# exists and is waiting for its amend -- which is why the resume knows to
# finish it as a carry rather than as a pick.
is "five commits made, the last awaiting its carry" \
  "$(git -C "$WT" rev-list --count origin/base-fwd-dev..HEAD)" 5
is "and the stopped half is recorded as the carry" \
  "$(awk '{print $4}' .git/series-advance-base-fwd)" carry

# 1. the fold rode in, in the commit that needed it, not stacked above it.
A=$(wat aaaaaaa)
is "carried commit holds the corrected snapshot" \
  "$(git -C "$WT" show "$A:tests/testthat/_snaps/sql.md")" 'snapshot one, corrected'
has "and keeps the twin's prose" "$(git -C "$WT" log -1 --format=%B "$A")" 'Snapshot corrected'
has "and names its provenance"   "$(git -C "$WT" log -1 --format=%B "$A")" 'Carried from `origin/base-dev`'
is "the carry is folded in, not stacked" \
  "$(git -C "$WT" rev-list --count "origin/base-fwd-dev..$A")" 1

D=$(wat ddddddd)
is "the R-code fix is carried too" "$(git -C "$WT" show "$D:R/foo.R")" 'foo <- function() 2'

# 2. glue beyond the buffer's carries, and is reported as drift.
B=$(wat bbbbbbb)
is "glue the tests demanded is carried" \
  "$(git -C "$WT" show "$B:src/rinterface_extra.c")" 'rinterface fix the tests demanded'
has "and the drift is reported"       "$out" 'carry glue the base buffer does not have'
has "naming where to mirror it"       "$out" 'mirror it onto base-build'
has "and the path"                    "$out" 'src/rinterface_extra.c'

# 3. glue the buffer already has is the pick's, applied once.
is "shared glue applied once" \
  "$(git -C "$WT" show "$B:src/glue.cpp")" 'glue adapted for bbbbbbb'
is "and is not in the carry set" \
  "$(git -C "$WT" show --format= --name-only "$B" | grep -c '^src/glue.cpp$')" 1

# 4, 5. the buffer's strand and the regenerated bookkeeping stay behind.
is "no patch/ is carried" \
  "$(git -C "$WT" show --format= --name-only "$B" | grep -c '^patch/' || true)" 0
is "the in-place src/vendor/cigraph repair is not carried" \
  "$(git -C "$WT" show "$B:src/vendor/cigraph/b.c")" 'vendored bbbbbbb'
is "R/aaa-structural.R stays the buffer's" \
  "$(git -C "$WT" show "$B:R/aaa-structural.R")" '# Generated from build-bbbbbbb'
is "src/sources-igraph.mk stays the buffer's" \
  "$(git -C "$WT" show "$B:src/sources-igraph.mk")" 'generated sources list for bbbbbbb'

# 8. the counter rises once per vendor commit.
is "counter runs 1..5 over the commits made so far" \
  "$(git -C "$WT" log --reverse --format=%H origin/base-fwd-dev..HEAD |
       while read -r c; do git -C "$WT" show "$c:DESCRIPTION" | sed -n 's/^Version: //p'; done | tr '\n' ' ')" \
  '1.0.0.9000.1 1.0.0.9000.2 1.0.0.9000.3 1.0.0.9000.4 1.0.0.9000.5 '

# --- claim 7: a second run refuses --------------------------------------------
echo
echo "== refusing to start beside a stopped replay"
out=$(run base-fwd)
has "refuses a fresh run"      "$out" 'has a stopped replay'
has "and points at both exits" "$out" '--continue, or discard it with --abort'
git fetch -q origin
is "still nothing pushed" "$(git rev-list --count origin/base-fwd-green..origin/base-fwd-dev)" 0

out=$(run base-fwd --continue)
has "and --continue on an unresolved tree stops again" "$out" 'conflicted'

# --- claim 7, second half: --abort discards a stopped replay ------------------
echo
echo "== --abort discards it"
out=$(run base-fwd --abort)
has "abort says what it did"    "$out" 'stopped replay discarded; no ref was written'
is "the worktree is gone"       "$([ -d "$WT" ] && echo yes || echo no)" no
is "and the state file with it" "$(ls .git | grep -c series-advance || true)" 0
git fetch -q origin
is "and still nothing pushed" "$(git rev-list --count origin/base-fwd-green..origin/base-fwd-dev)" 0

# Aborting leaves the work to be done, so the next run reaches the same stop.
out=$(run base-fwd)
has "the next run stops at the same place" "$out" 'conflicted'
WT=$(awk '{print $1}' .git/series-advance-base-fwd)

# --- claim 6: resolve and continue --------------------------------------------
echo
echo "== resolving and continuing"
echo 'forward types snapshot, updated for the engine' > "$WT/tests/testthat/_snaps/types.md"
git -C "$WT" add tests/testthat/_snaps/types.md
out=$(run base-fwd --continue)
has "resumes at the stopped commit" "$out" 'resuming at'
has "and pushes the extended dev"   "$out" 'dev ->'

git fetch -q origin
is "all five buffered commits are now on dev" \
  "$(git rev-list --count origin/base-fwd-green..origin/base-fwd-dev)" 5
E=$(at base-fwd eeeeeee)
is "the resolved commit keeps the resolution" \
  "$(git show "$E:tests/testthat/_snaps/types.md")" 'forward types snapshot, updated for the engine'
has "and takes the twin's message" "$(git log -1 --format=%B "$E")" 'Types snapshot follows the engine'
has "with the provenance trailer"  "$(git log -1 --format=%B "$E")" 'Carried from `origin/base-dev`'
is "no state file survives"        "$(ls .git | grep -c series-advance || true)" 0
is "the kept worktree is gone"     "$([ -d "$WT" ] && echo yes || echo no)" no

is "nothing to abort once finished" "$(run base-fwd --abort)" "base-fwd: nothing to abort
EXIT=0"

# --- claim 4: a series with no base to mine -----------------------------------
echo
echo "== a series with no base series to mine"
out=$(run solo)
hasnt "says nothing about carrying" "$out" 'carry a fix from'
has   "and moves the ref"           "$out" 'dev ->'
git fetch -q origin
is "the dev tip is a buffer commit verbatim, not a replay" \
  "$(git rev-parse origin/solo-dev)" "$(git rev-parse origin/solo-build)"

# --- claim 11: a base series with a live forward counterpart still consumes ---
echo
echo "== a base series whose forward counterpart is live"
is "the forward is live, not cutover litter" \
  "$(git merge-base --is-ancestor origin/base-fwd-green origin/base-green &&
       echo litter || echo live)" live
out=$(run base)
hasnt "does not refuse over the counterpart" "$out" 'live forward counterpart'
has   "and moves the ref"                    "$out" 'dev ->'
hasnt "with nothing to mine, being a base"   "$out" 'carry a fix from'
git fetch -q origin
is "the buffered commit reached dev" \
  "$(git rev-list --count origin/base-green..origin/base-dev)" 1
F=$(at base fff9999)
is "replayed onto the base's own tip, not the buffer's" \
  "$(git rev-parse "$F^")" "$(git rev-parse origin/base-green)"
is "and the counter rose once for it" \
  "$(git show "$F:DESCRIPTION" | sed -n 's/^Version: //p')" 1.0.0.9000.6

# --- claim 12: a replay that drops every commit says so -----------------------
echo
echo "== a buffer commit whose content already reached -dev"
before=$(git rev-parse origin/dup-dev)
out=$(run dup)
hasnt "does not report an empty buffer" "$out" 'buffer empty'
has   "reports nothing added"           "$out" "dev -> $(git rev-parse --short "$before") (+0)"
git fetch -q origin
is "and leaves dev where it was" "$(git rev-parse origin/dup-dev)" "$before"

# --- claim 14: a conflict whose resolution is empty ---------------------------
echo
echo "== a buffer commit whose conflict resolves to nothing"
before=$(git rev-parse origin/emptyres-dev)
out=$(run emptyres)
has "stops with the conflict" "$out" 'conflicted'
WT=$(awk '{print $1}' .git/series-advance-emptyres)
# Resolving toward what -dev already has is resolving to HEAD's tree.
git -C "$WT" read-tree --reset -u HEAD
out=$(run emptyres --continue)
has "resumes at the stopped commit" "$out" 'resuming at'
has "and reports nothing added"     "$out" "dev -> $(git rev-parse --short "$before") (+0)"
is "no state file survives"         "$(ls .git | grep -c series-advance || true)" 0
is "the kept worktree is gone"      "$([ -d "$WT" ] && echo yes || echo no)" no
git fetch -q origin
is "and leaves dev where it was" "$(git rev-parse origin/emptyres-dev)" "$before"

# The same stop with the operator's own `git cherry-pick --skip` in between:
# that used to meet `no cherry-pick or revert in progress` and leave the chunk
# with no way to finish at all.
out=$(run emptyres)
has "the next run stops at the same place" "$out" 'conflicted'
WT=$(awk '{print $1}' .git/series-advance-emptyres)
git -C "$WT" read-tree --reset -u HEAD
git -C "$WT" cherry-pick --skip
out=$(run emptyres --continue)
has "finishes after a hand-skipped pick" \
  "$out" "dev -> $(git rev-parse --short "$before") (+0)"
git fetch -q origin
is "and still leaves dev where it was" "$(git rev-parse origin/emptyres-dev)" "$before"

# --- claim 13: --dev-note carries a stage-3 finding into the minted commit ----
echo
echo "== --dev-note, the stage-3 finding with no fix to carry"
NOTE=$SCRATCH/finding.txt
printf 'R-side fix:\n\nmacos-oldrel-x86_64 timed out at the hour budget.\n' > "$NOTE"
out=$(run note --dev-note "$NOTE")
has "moves the ref" "$out" 'dev ->'
git fetch -q origin
is "both buffered commits reached dev" \
  "$(git rev-list --count origin/note-green..origin/note-dev)" 2
is "the tip is a replay, not the buffer commit verbatim" \
  "$([ "$(git rev-parse origin/note-dev)" = "$(git rev-parse origin/note-build)" ] &&
       echo verbatim || echo replay)" replay
has "the newest commit carries the finding" \
  "$(git log -1 --format=%B origin/note-dev)" 'macos-oldrel-x86_64 timed out'
has "and keeps its own vendor subject" \
  "$(git log -1 --format=%s origin/note-dev)" 'igraph@fff5555'
hasnt "the commit below it does not" \
  "$(git log -1 --format=%B origin/note-dev^)" 'macos-oldrel-x86_64 timed out'
is "and the counter still rose once per vendor commit" \
  "$(git show origin/note-dev:DESCRIPTION | sed -n 's/^Version: //p')" 1.0.0.9000.2
is "the header the note brought is not doubled" \
  "$(git log -1 --format=%B origin/note-dev | grep -ci '^R-side fix')" 1

echo
echo "== --dev-note that brings no header of its own"
BARE=$SCRATCH/bare-finding.txt
printf '\nmacos-release-x86_64 timed out at the hour budget.\n' > "$BARE"
out=$(run bare --dev-note "$BARE")
has "moves the ref" "$out" 'dev ->'
git fetch -q origin
has "the finding still lands" \
  "$(git log -1 --format=%B origin/bare-dev)" 'macos-release-x86_64 timed out'
has "under a header the readers anchor on" \
  "$(git log -1 --format=%B origin/bare-dev)" 'R-side fix'
is "written exactly once" \
  "$(git log -1 --format=%B origin/bare-dev | grep -ci '^R-side fix')" 1
is "in the colon spelling" \
  "$(git log -1 --format=%B origin/bare-dev | grep -c '^R-side fix:')" 1

echo
echo "== --dev-note when the chunk minted nothing"
before=$(git rev-parse origin/dup-dev)
out=$(run dup --dev-note "$NOTE")
has "refuses rather than dropping the finding" "$out" 'has no commit'
has "and exits non-zero"                       "$out" 'EXIT=1'
git fetch -q origin
is "leaving dev where it was" "$(git rev-parse origin/dup-dev)" "$before"

echo
echo "== --dev-note naming a file that is not there"
before=$(git rev-parse origin/note-dev)
out=$(run note --dev-note "$SCRATCH/absent.txt")
has "refuses before reading any ref" "$out" 'missing or empty'
has "and exits non-zero"             "$out" 'EXIT=1'
git fetch -q origin
is "leaving dev where it was" "$(git rev-parse origin/note-dev)" "$before"

echo
echo "== a verified prefix under a red tip"
before=$(git rev-parse origin/red-dev)
out=$(run red)
git fetch -q origin
is "green takes the commit the run proved" \
  "$(git rev-parse origin/red-green)" "$RED_OK"
is "and the canonical copy takes it too" \
  "$(git --git-dir="$CANON" rev-parse red-green)" "$RED_OK"
has "the red commit is named"    "$out" "$RED_BAD"
has "as the reason to stop"      "$out" 'repair before extending'
has "and the firing exits non-zero" "$out" 'EXIT=1'
is "dev is left for the repair" "$(git rev-parse origin/red-dev)" "$before"
is "and the buffer commit is not consumed" \
  "$(git rev-list --count origin/red-dev..origin/red-build)" 1

echo
echo "== a buffer tooling sync above the anchor"
out=$(run tsync)
git fetch -q origin
has "the chunk completes" "$out" 'EXIT=0'
hasnt "without stopping on the sync" "$out" 'conflicted'
is "-dev keeps the tooling stage 4 gave it" \
  "$(git show origin/tsync-dev:.github/workflows/w.yaml)" 'jobs: as main has them now'
has "the vendor commit above the sync is consumed" \
  "$(git log -1 --format=%s origin/tsync-dev)" 'igraph@ggg2222'
is "and the sync itself never reaches -dev" \
  "$(git log --format=%s origin/tsync-green..origin/tsync-dev | grep -c 'Sync buffer tooling' || true)" 0

# The forward first: once the base -dev takes the re-stamp, it has a tagged
# twin too, and the case this checks is the one where it does not.
echo
echo "== a late tag's re-stamp, on a forward whose base has only the plain twin"
out=$(run late-fwd)
git fetch -q origin
has "the chunk completes" "$out" 'EXIT=0'
is "both buffer commits are consumed" \
  "$(git rev-list --count origin/late-fwd-green..origin/late-fwd-dev)" 2
has "the plain one takes its twin's fold" \
  "$(git log -1 --format=%B origin/late-fwd-dev~1)" 'Carried from'
is "the re-stamp keeps its own subject" \
  "$(git log -1 --format=%s origin/late-fwd-dev)" \
  'vendor: Update vendored sources (tag 9.9.9) to igraph/igraph@abc1111'

echo
echo "== a late tag's re-stamp above the commit -dev vendored"
out=$(run late)
git fetch -q origin
has "the chunk completes" "$out" 'EXIT=0'
hasnt "without reading the buffer as empty" "$out" 'buffer empty'
is "the re-stamp is consumed" \
  "$(git log -1 --format=%s origin/late-dev)" \
  'vendor: Update vendored sources (tag 9.9.9) to igraph/igraph@abc1111'
is "carrying the tag's stamp" "$(git show origin/late-dev:src/vendor/igraph_version.h)" \
  '#define IGRAPH_VERSION "9.9.9"'
is "and the counter rose for it" \
  "$(git show origin/late-dev:DESCRIPTION | sed -n 's/^Version: //p')" 1.0.0.9000.2
out=$(run late)
has "a second run finds nothing left to consume" "$out" 'buffer empty'

echo
echo "== a carry that would stop a test the forward runs"
out=$(run loss-fwd)
[ -z "${KEEP:-}" ] || echo "$out"
git fetch -q origin
L=$(at loss-fwd ace1111)
has "the chunk completes" "$out" 'EXIT=0'
has "it names what it kept" "$out" 'kept tests/testthat/test-gone.R'
is "a deleted test is still there" "$(git show "$L:tests/testthat/test-gone.R" | head -n 1)" 'test_that("gone", {'
hasnt "a test skipped for good is not skipped" "$(git show "$L:tests/testthat/test-skip.R")" 'skip_on_cran'
has "a gated test carries its gate" "$(git show "$L:tests/testthat/test-gate.R")" 'skip_if_engine_before("9.9.9"'
is "and the snapshot fold carries" "$(git show "$L:tests/testthat/_snaps/sql.md")" 'snapshot one, as ace1111 renders it'
has "the message says what was not carried" "$(git log -1 --format=%B "$L")" \
  'Not carried, because it would stop a test this series runs:'
has "naming the path" "$(git log -1 --format=%B "$L")" "\`tests/testthat/test-skip.R\`"

echo
echo "== a buffer replayed from the base -dev carries nothing twice"
out=$(run kept-fwd)
[ -z "${KEEP:-}" ] || echo "$out"
git fetch -q origin
has "the chunk completes" "$out" 'EXIT=0'
hasnt "nothing is reported as carried" "$out" 'carry a fix from'
is "the buffer commit moved as it was, a plain ref move" \
  "$(git rev-parse origin/kept-fwd-dev)" "$(git rev-parse origin/kept-fwd-build)"
K=$(at kept-fwd kkk1111)
hasnt "so it carries no provenance trailer" "$(git log -1 --format=%B "$K")" 'Carried from'
is "the snapshot holds the fix and main's line both" \
  "$(git show "$K:tests/testthat/_snaps/sql.md" | tr '\n' '|')" 'snapshot one, corrected|main added a snapshot|'

echo
echo "$pass passed, $fail failed"
[ "$fail" -eq 0 ]
