#!/bin/bash
# Check the forward replay, offline, against a synthetic base series and seed
# built here: no network, no fixtures on disk.
#
# The claim scripts/series-forward-build.sh makes is that a forward keeps the
# base series' `-dev` commits as they are wherever it can, and adapts only where
# the new base asks it to. Ten things were checked where this suite was ported
# from (duckdb/duckdb-r, .series-source); the ninth and tenth are about
# scripts/series-learned.sh and the forward's vendor strand, which this
# repository has not ported, so eight are checked here and the last two are
# kept below only as a record of what is missing.
#
#   1. A non-vendor commit of the buffer's own, a `patch/` entry, refuses the
#      run before anything is replayed, and names the command that places it;
#      a port of a commit `main` carries and a tooling sync are placed by
#      themselves and never named.
#   2. The old `-dev`'s vendor commits are replayed with the fixes folded into
#      them, test-side and glue alike, on the whole of the new base: `main`'s
#      R-side fix and tooling are there from the first commit.
#   3. A pick that would stop a test the seed runs keeps the seed's copy, says
#      so on stdout and in the commit, and takes the rest of the pick; an
#      engine gate stays.
#   4. The buffer's vendor commits above the newest commit `-dev` vendors are
#      replayed after `-dev`'s, from `-build`.
#   5. The counter counts the chain, one step per replayed commit.
#   6. `--buffer` is refused when the buffer lacks the commit `-dev`'s newest
#      vendor commit names, before anything is replayed.
#   7. `--no-keep-tests` lets the pick take the test away, which is what a
#      landing asks, since its own gate refuses a lost test.
#   8. A `-dev` with no vendor commit of its own takes the whole buffer.
#   9. (not ported) series-learned.sh names, per vendor commit of `-dev`, what
#      it carries beyond its `-build` twin, leaves the glue both have
#      unreported, and ranks the files; --diff prints the change itself.
#  10. (not ported) The forward's vendor strand: the series' strand, derived
#      once from its buffer and carried onto the new seed by series-vendor.sh,
#      vendors the same engine as `-fwd-build` at every twin and carries none
#      of the fixes, and `series-learned.sh <S>-fwd --vendor` reports those
#      fixes, on the new base, exactly as 9 reported them on the old one.
#
# Usage:
#   scripts/series-forward-build-test.sh
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
# `main` at a base B, a series seeded on B the way series-forward seeds one, and
# `main` moving on from B: it vendors a newer engine, takes an R-side fix, a test
# change and two tooling changes. The series' `-build` vendors four commits with
# the glue each needed; its `-dev` consumes three of them, folds a test fix into
# the first and deletes a test there, as a rewind did, gates another, ports
# `main`'s fix and syncs the tooling, and its buffer carries a `patch/` entry of
# its own. The forward seeds on `main`'s tip and replays `-dev`, then the buffer.

WORK=$SCRATCH/work
git init -q -b main "$WORK"
cd "$WORK"
git config user.name Test
git config user.email test@example.invalid
git config commit.gpgsign false

mkdir -p scripts R src/vendor/cigraph tests/testthat patch
for s in series-forward-build.sh series-vendor.sh series-tests.sh setup-git.sh merge-version.sh \
  series-config.sh series-lib.sh vendor-lib.sh; do
  cp "$HERE/$s" scripts/
done
chmod +x scripts/*.sh
echo 'DESCRIPTION merge=ours-version' > .gitattributes
scripts/setup-git.sh >/dev/null

desc() { printf 'Package: %s\nVersion: %s\n' "$1" "$2" > DESCRIPTION; }
# The engine as the tree records it, the version igraph's CMake writes from
# `git describe --tags`: a release, or `X.Y.Z-N-g<sha>` N commits past one.
engine() { # <id> <version>
  echo "engine $1" > src/vendor/cigraph/engine.c
  echo "#define IGRAPH_VERSION \"$2\"" > src/vendor/igraph_version.h
}
commit() { git add -A; git commit -qm "$1"; }
test_block() { printf 'test_that("%s", {\n  expect_true(TRUE)\n})\n' "$1"; }

desc igraph 1.5.5.9000
engine aaaa111 1.0.0
echo 'rename igraph.1.3 igraph_1_3' > scripts/flavor.patch
echo 'tool v1' > scripts/tool.sh
echo 'pkg <- "igraph"' > R/package.R
echo 'foo <- function() 1' > R/foo.R
echo 'glue 1' > src/glue.cpp
echo 'test 1' > tests/testthat/test-foo.R
printf 'a\nb\nc\nd\ne\nf\n' > tests/testthat/test-bar.R
test_block gone > tests/testthat/test-gone.R
test_block gate > tests/testthat/test-gate.R
commit 'vendor: Update vendored sources to igraph/igraph@aaaa111 (#1)'
B=$(git rev-parse HEAD)

# `main` moves on.
engine aaaa112 1.0.1
commit 'vendor: Update vendored sources to igraph/igraph@aaaa112 (#2)'
echo 'foo <- function() 2' > R/foo.R
commit 'fix: An R-side fix on main (#3)'
P=$(git rev-parse HEAD)
printf 'a\nb\nc\nd\ne\nf main\n' > tests/testthat/test-bar.R
commit 'test: A test main adjusted (#9)'
echo 'tool v2' > scripts/tool.sh
commit 'ci: A tooling change (#4)'
echo 'tool v3' > scripts/tool.sh
commit 'ci: Another tooling change (#5)'
M=$(git rev-parse HEAD)

# The series' seed on B, as flavor.sh and series-forward write it.
seed() { # <base>: three seed commits on it, HEAD left on the third
  git checkout -q --detach "$1"
  echo 'rename igraph.2.0.dev igraph_2_0_dev' > scripts/flavor.patch
  commit 'chore: Update flavor patch to igraph.2.0.dev'
  echo 'pkg <- "igraph.2.0.dev"' > R/package.R
  desc igraph.2.0.dev "$(git show HEAD:DESCRIPTION | sed -n 's/^Version: //p')"
  commit 'chore: Update version to 2.0.dev'
  desc igraph.2.0.dev 1.99.99.9000.0
  commit 'chore: Add fifth version component'
}
seed "$B"
OLDSEED=$(git rev-parse HEAD)

# `-build`: the glue each engine needed, and nothing a test asked for.
vendor() { # <id> <version> <counter>
  engine "$1" "$2"
  desc igraph.2.0.dev "1.99.99.9000.$3"
  commit "vendor: Update vendored sources to igraph/igraph@$1"
}
git checkout -q -b s-build
echo 'glue 2, adapted to bbbb222' > src/glue.cpp
vendor bbbb222 1.0.1-1-gbbbb222 1
vendor cccc333 1.0.1-2-gcccc333 2
echo 'glue 4, adapted to dddd444' > src/glue.cpp
vendor dddd444 1.0.1-3-gdddd444 3
echo 'a patch the buffer needs' > patch/0001-fix.patch
commit 'chore(patch): Add 0001-fix.patch'
PATCH=$(git rev-parse HEAD)
echo 'tool v2' > scripts/tool.sh
commit 'chore(series): Sync buffer tooling with main'
vendor eeee555 1.0.1-4-geeee555 4

# `-dev`: the same commits with what CI demanded folded in, a port and a sync.
git checkout -q -b s-dev "$OLDSEED"
echo 'glue 2, adapted to bbbb222' > src/glue.cpp
echo 'test 2, as bbbb222 answers' > tests/testthat/test-foo.R
git rm -q tests/testthat/test-gone.R
printf 'test_that("gate", {\n  skip_if_engine_before("9.9.9", "not yet")\n  expect_true(TRUE)\n})\n' \
  > tests/testthat/test-gate.R
vendor bbbb222 1.0.1-1-gbbbb222 1
git cherry-pick -x "$P" >/dev/null
echo 'tool v2' > scripts/tool.sh
commit 'chore(series): Sync tooling with main'
printf 'a\nb v2\nc\nd\ne\nf\n' > tests/testthat/test-bar.R
vendor cccc333 1.0.1-2-gcccc333 2
echo 'glue 4, adapted to dddd444' > src/glue.cpp
echo 'rinterface fix the tests demanded' > src/rinterface_extra.c
vendor dddd444 1.0.1-3-gdddd444 3

# A `-dev` whose newest vendor commit the buffer lacks (claim 6).
git checkout -q -b s-dev-unmirrored s-dev
vendor ffff666 1.0.1-5-gffff666 4

# A `-dev` with no vendor commit of its own (claim 8).
git checkout -q -b s-dev-fresh "$OLDSEED"
git cherry-pick -x "$P" >/dev/null

# The new seed on `main`'s tip, where the forward is built.
seed "$M"
NEWSEED=$(git rev-parse HEAD)
git branch -f fwd-seed "$NEWSEED"

fwd() { # <args...> -> output; EXIT=<status> on the last line
  set +e
  scripts/series-forward-build.sh "$@" --no-check-glue 2>&1
  echo "EXIT=$?"
  set -e
}
version_at() { git show "$1:DESCRIPTION" | sed -n 's/^Version: //p'; }
at() { # <upstream sha> -> the replayed commit vendoring it
  local log
  log=$(git log --format='%H %s' "$NEWSEED..HEAD")
  grep -m1 "igraph@$1" <<<"$log" | cut -d' ' -f1
}

echo "=== 1. the buffer's own commit is named, the port and the sync are placed"
git checkout -q --detach fwd-seed
out=$(fwd s-dev "$B" --buffer s-build)
[ -z "${KEEP:-}" ] || echo "$out"
has "the run refuses" "$out" "EXIT=1"
has "naming the patch entry" "$out" "$(git rev-parse --short "$PATCH")  chore(patch): Add 0001-fix.patch"
has "as the only stranded commit" "$out" "1 commit(s) in $B..s-dev vendor nothing"
hasnt "the port is placed by its trailer" "$out" "fix: An R-side fix on main"
hasnt "the -dev sync by its subject" "$out" "Sync tooling with main"
hasnt "and the buffer sync too" "$out" "Sync buffer tooling with main"
has "the command to rerun names the buffer" "$out" "--placed $(git rev-parse --short "$PATCH") s-dev $B --buffer s-build"
is "nothing was replayed" "$(git rev-parse HEAD)" "$NEWSEED"

echo
echo "=== 2. -dev's commits are replayed with their fixes, on the new base"
out=$(fwd s-dev "$B" --buffer s-build --placed "$PATCH")
[ -z "${KEEP:-}" ] || echo "$out"
has "the replay finishes" "$out" "EXIT=0"
has "replaying four vendor commits" "$out" "replaying 4 vendor commit(s) onto $(git rev-parse --short "$NEWSEED"), counter at 0"
is "the subjects are -dev's, then the buffer's" \
  "$(git log --reverse --format=%s "$NEWSEED..HEAD" | sed 's/.*@//' | tr '\n' ' ')" \
  "bbbb222 cccc333 dddd444 eeee555 "
FIRST=$(at bbbb222)
has "the first pick is a rewind" "$out" "lands on 1.0.1-1-gbbbb222, from 1.0.0; HEAD vendors 1.0.1, so the strand is taken whole"
is "its strand is the series'" "$(git show "$FIRST:src/vendor/cigraph/engine.c")" "engine bbbb222"
is "its glue is -dev's" "$(git show "$FIRST:src/glue.cpp")" "glue 2, adapted to bbbb222"
is "and its test fix is -dev's" "$(git show "$FIRST:tests/testthat/test-foo.R")" "test 2, as bbbb222 answers"
is "main's R-side fix is there from the first commit" "$(git show "$FIRST:R/foo.R")" 'foo <- function() 2'
is "and main's tooling" "$(git show "$FIRST:scripts/tool.sh")" "tool v3"
is "and main's test change, where -dev did not touch it" \
  "$(git show "$FIRST:tests/testthat/test-bar.R" | tail -n 1)" "f main"
THIRD=$(at dddd444)
is "glue a test demanded on -dev comes along" "$(git show "$THIRD:src/rinterface_extra.c")" "rinterface fix the tests demanded"
is "beside the glue the buffer had" "$(git show "$THIRD:src/glue.cpp")" "glue 4, adapted to dddd444"
SECOND=$(at cccc333)
is "-dev's test change and main's meet in one file" \
  "$(git show "$SECOND:tests/testthat/test-bar.R" | sed -n '2p;6p' | tr '\n' ' ')" "b v2 f main "
is "the package is the flavor's" "$(git show "HEAD:DESCRIPTION" | sed -n 's/^Package: //p')" igraph.2.0.dev

echo
echo "=== 3. a pick never stops a test the seed runs"
has "the kept path is said on stdout" "$out" "kept tests/testthat/test-gone.R as $(git rev-parse --short "$NEWSEED") has it"
is "the deleted test is still there" "$(git show "$FIRST:tests/testthat/test-gone.R" | head -n 1)" 'test_that("gone", {'
has "the commit says what was not replayed" "$(git log -1 --format=%B "$FIRST")" \
  "Not replayed, because it would stop a test the base runs:"
has "naming the path" "$(git log -1 --format=%B "$FIRST")" '`tests/testthat/test-gone.R`'
has "and keeps the vendor subject" "$(git log -1 --format=%s "$FIRST")" "igraph/igraph@bbbb222"
has "an engine gate stays" "$(git show "$FIRST:tests/testthat/test-gate.R")" 'skip_if_engine_before("9.9.9"'
is "the test is still there at the tip" "$(git ls-tree --name-only HEAD tests/testthat/test-gone.R)" tests/testthat/test-gone.R
is "a commit above the kept one carries no note" "$(git log -1 --format=%B "$SECOND" | grep -c 'Not replayed' || true)" 0

echo
echo "=== 4. the buffer above -dev's tip is replayed from -build"
FOURTH=$(at eeee555)
is "the fourth commit vendors the buffer's engine" "$(git show "$FOURTH:src/vendor/cigraph/engine.c")" "engine eeee555"
is "with the glue the buffer had" "$(git show "$FOURTH:src/glue.cpp")" "glue 4, adapted to dddd444"
is "and -dev's fixes below it still in place" "$(git show "$FOURTH:tests/testthat/test-foo.R")" "test 2, as bbbb222 answers"
is "the patch entry was not replayed as a commit" \
  "$(git log --format=%s "$NEWSEED..HEAD" | grep -vc '^vendor:' || true)" 0

echo
echo "=== 5. the counter counts the chain"
is "one step per replayed commit" \
  "$(for c in $(git rev-list --reverse "$NEWSEED..HEAD"); do version_at "$c"; done | tr '\n' ' ')" \
  "1.99.99.9000.1 1.99.99.9000.2 1.99.99.9000.3 1.99.99.9000.4 "
has "and the run says where it ended" "$out" "DONE: 4 vendor commit(s) replayed -> $(git rev-parse --short HEAD)"
out=$(fwd s-dev "$B" --buffer s-build --placed "$PATCH")
has "a rerun has nothing left" "$out" "Nothing to replay"

echo
echo "=== 6. a buffer that lacks -dev's newest vendor commit is refused"
git checkout -q --detach fwd-seed
out=$(fwd s-dev-unmirrored "$B" --buffer s-build --placed "$PATCH")
[ -z "${KEEP:-}" ] || echo "$out"
has "the run refuses" "$out" "EXIT=1"
has "naming the commit" "$out" "no commit of s-build vendors igraph/igraph@ffff666"
has "and the remedy" "$out" "mirror the fold onto the buffer first"
is "nothing was replayed" "$(git rev-parse HEAD)" "$NEWSEED"

echo
echo "=== 7. --no-keep-tests lets the pick take the test away"
git checkout -q --detach fwd-seed
out=$(fwd s-dev "$B" --placed "$PATCH" --no-keep-tests)
[ -z "${KEEP:-}" ] || echo "$out"
has "the replay finishes" "$out" "EXIT=0"
hasnt "nothing is kept" "$out" "kept tests/"
is "three commits, -dev's alone without --buffer" "$(git rev-list --count "$NEWSEED..HEAD")" 3
is "the test is gone" "$(git ls-tree --name-only HEAD tests/testthat/test-gone.R)" ""
is "and the commit carries no note" "$(git log -1 --format=%B "$(at bbbb222)" | grep -c 'Not replayed' || true)" 0

echo
echo "=== 8. a -dev with no vendor commit of its own takes the whole buffer"
git checkout -q --detach fwd-seed
out=$(fwd s-dev-fresh "$B" --buffer s-build --placed "$PATCH")
[ -z "${KEEP:-}" ] || echo "$out"
has "the replay finishes" "$out" "EXIT=0"
is "every buffer commit is replayed" \
  "$(git log --reverse --format=%s "$NEWSEED..HEAD" | sed 's/.*@//' | tr '\n' ' ')" \
  "bbbb222 cccc333 dddd444 eeee555 "
is "with the buffer's trees" "$(git show "$(at bbbb222):tests/testthat/test-foo.R")" "test 1"

# 9. is not checked: scripts/series-learned.sh, which it runs, was not ported
# from duckdb/duckdb-r (see the header).
# 10. is not checked either: the forward's vendor strand is read by
# scripts/series-learned.sh, and rigraph does not forward yet (see the header).

echo
echo "$pass passed, $fail failed"
[ "$fail" -eq 0 ]
