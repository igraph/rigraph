#!/bin/bash
# Check how scripts/series-tests.sh reads a tree's tests against `main`'s,
# offline, against a synthetic repository built here: no network, no fixtures.
#
# The claim is that a test `main` runs and a series does not is found from the
# two trees alone, named by the commit that stopped it, and told apart from a
# change to what a test expects. Seven things are checked.
#
#   1. A deleted test file, a deleted `test_that()` block, a deleted snapshot
#      entry and a skip in a block `main` has, or at the top of a file it has,
#      are lost, and the run exits 1; a skip in a block the series added is not.
#   2. Each names the commit that stopped it, and one vendoring an engine older
#      than `main`'s as a rewind.
#   3. An engine gate is apart from a skip: live while the tip's engine
#      predates the version it names, expired once it does not, and lost only
#      under --strict.
#   4. A changed path is marked as rewound when a rewind took out a line the tip
#      still lacks, and not when a later commit put it back.
#   5. --vendored keeps only what a vendor commit stopped: neither a loss by a
#      commit of another kind nor a test `main` added since the series last
#      took its tests.
#   6. A tree that is not a commit is read the same, with no culprit named, and
#      --vendored refuses one.
#   7. A tip that runs every test `main` runs exits 0, and the usage is the
#      shared contract's.
#
# Usage:
#   scripts/series-tests-test.sh
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

# --- the fixture -------------------------------------------------------------
#
# `main` vendors a release and has seven test files and a snapshot. A series
# cut from it rewinds to an older snapshot, vendors two more, and takes one
# commit of another kind; `main` then adds a test the series never took.

WORK=$SCRATCH/work
git init -q -b main "$WORK"
cd "$WORK"
git config user.name Test
git config user.email test@example.invalid
git config commit.gpgsign false
mkdir -p R tests/testthat/_snaps

engine() { echo "duckdb_version <- \"$1\"" > R/version.R; }
block() { printf 'test_that("%s", {\n%b  expect_true(TRUE)\n})\n\n' "$1" "${2:-}"; }
commit() { git add -A; git commit -qm "$1"; }
T=tests/testthat

engine 1.5.6
{ block "a one"; block "a two"; } > $T/test-a.R
block "b one" > $T/test-b.R
{ block "c one"; block "c two"; } > $T/test-c.R
{ block "d one" '  bad <- c("bit", "geometry", NULL)\n'; } > $T/test-d.R
printf 'test_that("e one", {\n  x <- "kept"\n  y <- "rewound and restored"\n})\n' > $T/test-e.R
block "f one" > $T/test-f.R
block "g one" > $T/test-g.R
printf '# a one\n\n    Code\n      1\n\n# a two\n\n    Code\n      2\n\n' > $T/_snaps/a.md
commit 'vendor: Update vendored sources to duckdb/duckdb@0000000 (#1)'

git checkout -q -b s
# A rewind: an engine older than `main`'s, which deletes, rewrites and gates.
engine 1.5.0-dev100
git rm -q $T/test-b.R
block "c one" > $T/test-c.R
{ block "d one" '  bad <- c("bit", NULL)\n'; } > $T/test-d.R
printf 'test_that("e one", {\n  x <- "kept"\n})\n' > $T/test-e.R
{ block "a one" '  skip_if_engine_before("1.6.0-dev10", "a behaviour")\n'; block "a two"; } > $T/test-a.R
printf '# a one\n\n    Code\n      1\n\n' > $T/_snaps/a.md
commit 'vendor: Update vendored sources to duckdb/duckdb@1111111'
V1=$(git rev-parse HEAD)

engine 1.6.0-dev5
{ block "a one" '  skip_if_engine_before("1.6.0-dev10", "a behaviour")\n'
  block "a two" '  skip_on_cran()\n'
  block "a three" '  skip_on_os("windows")\n'; } > $T/test-a.R
{ echo 'skip_if_not(FALSE)'; block "f one"; } > $T/test-f.R
commit 'vendor: Update vendored sources to duckdb/duckdb@2222222'
V2=$(git rev-parse HEAD)

engine 1.6.0-dev20
printf 'test_that("e one", {\n  x <- "changed later"\n  y <- "rewound and restored"\n})\n' > $T/test-e.R
commit 'vendor: Update vendored sources to duckdb/duckdb@3333333'
V3=$(git rev-parse HEAD)

git rm -q $T/test-g.R
commit 'fix: A commit that vendors nothing'
N1=$(git rev-parse HEAD)

git checkout -q main
block "h one" > $T/test-h.R
{ block "a one"; block "a two"; block "a four"; } > $T/test-a.R
commit 'test: A test the series has not taken yet (#2)'
M=$(git rev-parse HEAD)

run() { set +e; "$HERE/series-tests.sh" "$@" 2>&1; echo "EXIT=$?"; set -e; }
short() { git rev-parse --short "$1"; }

# --- 1, 2: what is lost, and by whom ----------------------------------------

echo "== a series that stopped tests main runs"
out=$(run "$M" s)
[ -z "${KEEP:-}" ] || echo "$out"
has "it exits 1" "$out" "EXIT=1"
has "a deleted file is lost" "$out" "deleted   tests/testthat/test-b.R"
has "a deleted block is lost" "$out" 'test_that("c two"'
has "a deleted snapshot entry is lost" "$out" "# a two"
has "a skip in main's block is lost" "$out" '"a two" skip_on_cran()'
has "a skip at the top of main's file is lost" "$out" "(top of file) skip_if_not(FALSE)"
hasnt "a skip in a block the series added is not" "$out" 'skip_on_os'
has "the deletion names its commit, as a rewind" "$out" "by $(short "$V1") duckdb/duckdb@1111111, 1.5.0-dev100, a rewind"
has "the skip names its commit, not as a rewind" "$out" "by $(short "$V2") duckdb/duckdb@2222222, 1.6.0-dev5"
has "a commit of another kind is named too" "$out" "by $(short "$N1") fix: A commit that vendors nothing"
has "and it counts them" "$out" "TESTS LOST: 8 test(s)"

# --- 3: gates ------------------------------------------------------------------

echo
echo "== an engine gate is told from a skip"
has "a gate past its version has expired" "$out" "expired gates, inert and due to go"
pout=$(run "$M" "$V2" --porcelain)
has "a gate before its version is live" "$pout" "$(printf 'gate\ttests/testthat/test-a.R\t"a one" skip_if_engine_before')"
out=$(run "$M" s --strict)
has "--strict counts it as lost" "$out" "TESTS LOST: 9 test(s)"

# --- 4: rewound ------------------------------------------------------------------

echo
echo "== a change a rewind made, and one it no longer answers for"
out=$(run "$M" s)
has "a line the tip still lacks is rewound" "$out" "+1/-1 over 1 commit(s), rewound by $(short "$V1")"
hasnt "a line a later commit restored is not" "$out" "over 2 commit(s), rewound"
has "but the path still changed" "$out" "changed   tests/testthat/test-e.R"

# --- 5: --vendored -------------------------------------------------------------

echo
echo "== --vendored keeps what a vendor commit stopped"
out=$(run "$M" s --vendored --porcelain)
[ -z "${KEEP:-}" ] || echo "$out"
is "every entry names a vendor commit" \
  "$(grep -v '^EXIT' <<<"$out" | cut -f4 | sort -u | tr '\n' ' ')" \
  "$(printf '%s\n' "$V1" "$V2" | sort | tr '\n' ' ')"
hasnt "a deletion by another kind of commit is left out" "$out" "test-g.R"
hasnt "and so is a test main added since" "$out" "test-h.R"
hasnt "or a block main added since" "$out" '"a four"'
hasnt "and no change is listed" "$out" "changed"
has "but the rest is" "$out" "$(printf 'deleted\ttests/testthat/test-b.R')"

# --- 6: a tree -----------------------------------------------------------------

echo
echo "== a tree is read the same, with no culprit"
TREE=$(git rev-parse "s^{tree}")
out=$(run "$M" "$TREE")
has "it is lost the same" "$out" "TESTS LOST: 8 test(s)"
hasnt "with nobody named" "$out" "by $(short "$V1")"
out=$(run "$M" "$TREE" --vendored)
has "--vendored refuses one" "$out" "EXIT=2"
out=$(run "$M" s --porcelain -- $T/test-c.R)
is "a path narrows it" "$(grep -c . <<<"$out")" 3

# --- 7: nothing lost, and the usage --------------------------------------------

echo
echo "== a tip that keeps every test"
out=$(run "$M" "$M")
has "exits 0" "$out" "EXIT=0"
has "and says so" "$out" "TESTS KEPT"
out=$(run "$(git rev-parse "$V3~3")" "$V3~3")
has "a series commit against itself too" "$out" "EXIT=0"
is "no arguments is a usage error" "$(run | tail -n 1)" "EXIT=2"
is "an unknown option too" "$(run "$M" s --bogus | tail -n 1)" "EXIT=2"
is "and a name that is not a tree" "$(run "$M" nothing | tail -n 1)" "EXIT=2"

echo
echo "$pass passed, $fail failed"
[ "$fail" -eq 0 ]
