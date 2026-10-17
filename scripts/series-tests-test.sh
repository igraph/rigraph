#!/bin/bash
# Check how scripts/series-tests.sh reads a tree's tests against `main`'s,
# offline, against a synthetic repository built here: no network, no fixtures.
#
# The claim is that a test `main` runs and a series does not is found from the
# two trees alone, named by the commit that stopped it, told apart from a
# change to what a test expects, and told apart from a removal of a test whose
# function upstream removed. Eight things are checked.
#
#   1. A deleted test file, a deleted `test_that()` block, a deleted snapshot
#      entry and a skip in a block `main` has, or at the top of a file it has,
#      are lost, and the run exits 1; a skip in a block the series added is not.
#      A skip on the engine's version is a skip like any other, and so is one
#      a helper gained.
#   2. Each names the commit that stopped it, and one vendoring an engine older
#      than `main`'s as a rewind.
#   3. A block a vendor commit took away, leaving a note where it stood that
#      names the upstream commit it vendors, is removed, and so is its snapshot
#      entry; neither is lost. A block the same commit took from elsewhere in
#      the file, a note naming another upstream commit, and a rewind's note are
#      no removal, and a snapshot entry whose block stays is lost still.
#   4. For a tree, the note has to name the tree's own engine and be new to it.
#   5. A changed path is marked as rewound when a rewind took out a line the tip
#      still lacks, and not when a later commit put it back.
#   6. --vendored keeps only what a vendor commit stopped: neither a loss by a
#      commit of another kind nor a test `main` added since the series last
#      took its tests.
#   7. A tree that is not a commit is read the same, with no culprit named, and
#      --vendored refuses one.
#   8. A tip that runs every test `main` runs exits 0, and the usage is the
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
# `main` vendors a release and has ten test files, a helper and two snapshots. A series
# cut from it rewinds to an older snapshot, vendors two more, one of which
# removes a test with its function, and takes one commit of another kind;
# `main` then adds a test the series never took.

WORK=$SCRATCH/work
git init -q -b main "$WORK"
cd "$WORK"
git config user.name Test
git config user.email test@example.invalid
git config commit.gpgsign false
mkdir -p src/vendor tests/testthat/_snaps

# The engine as igraph's CMake writes it, `git describe --tags`: a release, or
# `X.Y.Z-N-g<sha>` for N commits past one, which follows `X.Y.Z`.
engine() { echo "#define IGRAPH_VERSION \"$1\"" > src/vendor/igraph_version.h; }
block() { printf 'test_that("%s", {\n%b  expect_true(TRUE)\n})\n\n' "$1" "${2:-}"; }
commit() { git add -A; git commit -qm "$1"; }
T=tests/testthat

engine 1.0.1
{ block "a one"; block "a two"; } > $T/test-a.R
block "b one" > $T/test-b.R
{ block "c one"; block "c two"; } > $T/test-c.R
{ block "d one" '  bad <- c("bit", "geometry", NULL)\n'; } > $T/test-d.R
printf 'test_that("e one", {\n  x <- "kept"\n  y <- "rewound and restored"\n})\n' > $T/test-e.R
block "f one" > $T/test-f.R
block "g one" > $T/test-g.R
{ block "q one"; block "q two"; } > $T/test-q.R
{ block "r keep one"; block "r gone"; block "r keep two"; block "r far"; } > $T/test-r.R
{ block "p one"; block "p gone"; } > $T/test-p.R
printf 'skip_if_no_x <- function() {\n  invisible()\n}\n' > $T/helper-x.R
printf '# a one\n\n    Code\n      1\n\n# a two\n\n    Code\n      2\n\n' > $T/_snaps/a.md
printf '# r keep one\n\n    Code\n      1\n\n# r gone\n\n    Code\n      2\n\n' > $T/_snaps/r.md
commit 'vendor: Update vendored sources to igraph/igraph@0000000 (#1)'

git checkout -q -b s
# A rewind: an engine older than `main`'s, which deletes, rewrites, and skips on
# the engine's version. Its note names its own upstream commit, and is still no
# removal.
engine 1.0.0-100-g1111111
git rm -q $T/test-b.R
{ block "c one"; echo '# upstream igraph@1111111: c_two() is not there yet'; } > $T/test-c.R
{ block "d one" '  bad <- c("bit", NULL)\n'; } > $T/test-d.R
printf 'test_that("e one", {\n  x <- "kept"\n})\n' > $T/test-e.R
{ block "a one" '  skip_if_engine_before("1.0.1-10-gaaaaaaa", "a behaviour")\n'; block "a two"; } > $T/test-a.R
printf '# a one\n\n    Code\n      1\n\n' > $T/_snaps/a.md
commit 'vendor: Update vendored sources to igraph/igraph@1111111'
V1=$(git rev-parse HEAD)

# Upstream removes gone() and p_gone(): their tests and snapshot go, with a note
# where each test stood. The same commit also loses a test far from the note.
engine 1.0.1-5-g2222222
{ block "a one" '  skip_if_engine_before("1.0.1-10-gaaaaaaa", "a behaviour")\n'
  block "a two" '  skip_on_cran()\n'
  block "a three" '  skip_on_os("windows")\n'; } > $T/test-a.R
{ echo 'skip_if_not(FALSE)'; block "f one"; } > $T/test-f.R
{ block "r keep one"
  printf '# upstream igraph@2222222: gone() is removed, and no R code calls it.\n\n'
  block "r keep two"; } > $T/test-r.R
printf '# r keep one\n\n    Code\n      1\n\n' > $T/_snaps/r.md
{ block "p one"; echo '# upstream igraph@2222222: p_gone() is removed.'; } > $T/test-p.R
printf 'skip_if_no_x <- function() {\n  skip_if(TRUE, "not on this engine")\n}\n' > $T/helper-x.R
commit 'vendor: Update vendored sources to igraph/igraph@2222222'
V2=$(git rev-parse HEAD)

# A note that names another upstream commit than the one this commit vendors.
engine 1.0.1-20-g3333333
printf 'test_that("e one", {\n  x <- "changed later"\n  y <- "rewound and restored"\n})\n' > $T/test-e.R
{ block "q one"; echo '# upstream igraph@2222222: q_two() is removed'; } > $T/test-q.R
commit 'vendor: Update vendored sources to igraph/igraph@3333333'
V3=$(git rev-parse HEAD)

git rm -q $T/test-g.R
commit 'fix: A commit that vendors nothing'
N1=$(git rev-parse HEAD)

# A commit that has the note and the test both, which a tree that drops the
# test is read against (claim 4).
git checkout -q -b noted "$V2"
{ block "r keep one"
  printf '# upstream igraph@2222222: gone() is removed, and no R code calls it.\n\n'
  block "r gone"
  block "r keep two"; } > $T/test-r.R
commit 'test: The note and the test both'
R=$(git rev-parse HEAD)

git checkout -q main
block "h one" > $T/test-h.R
{ block "a one"; block "a two"; block "a four"; } > $T/test-a.R
commit 'test: A test the series has not taken yet (#2)'
M=$(git rev-parse HEAD)

run() { set +e; "$HERE/series-tests.sh" "$@" 2>&1; echo "EXIT=$?"; set -e; }
short() { git rev-parse --short "$1"; }
tab() { local IFS=$'\t'; echo "$*"; }

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
has "a skip on the engine's version is lost like any other" "$out" '"a one" skip_if_engine_before("1.0.1-10-gaaaaaaa"'
has "and so is one a helper gained" "$out" '(outside a test) skip_if(TRUE, "not on this engine")'
has "the deletion names its commit, as a rewind" "$out" "by $(short "$V1") igraph/igraph@1111111, 1.0.0-100-g1111111, a rewind"
has "the skip names its commit, not as a rewind" "$out" "by $(short "$V2") igraph/igraph@2222222, 1.0.1-5-g2222222"
has "a commit of another kind is named too" "$out" "by $(short "$N1") fix: A commit that vendors nothing"
has "and it counts them" "$out" "TESTS LOST: 12 test(s)"
hasnt "nothing names a gate" "$out" "gate"

# --- 3: removals -----------------------------------------------------------------

echo
echo "== a removal is told from a loss"
has "removals are listed apart" "$out" "removed, with the function upstream removed, each noted where it stood"
pout=$(run "$M" s --porcelain)
[ -z "${KEEP:-}" ] || echo "$pout"
has "a block noted where it stood is removed" "$pout" "$(tab removed $T/test-r.R 'test_that("r gone"' "$V2")"
has "and so is its snapshot entry" "$pout" "$(tab removed $T/_snaps/r.md '# r gone')"
has "a block the same commit took elsewhere is lost" "$pout" "$(tab block $T/test-r.R 'test_that("r far"' "$V2")"
has "a note naming another upstream commit makes no removal" "$pout" "$(tab block $T/test-q.R 'test_that("q two"' "$V3")"
has "nor does a rewind's" "$pout" "$(tab block $T/test-c.R 'test_that("c two"' "$V1")"
has "a snapshot entry whose block stays is lost" "$pout" "$(tab snapshot $T/_snaps/a.md '# a two')"
is "the kinds in the file and its snapshots" \
  "$(run "$M" "$V2" --porcelain -- $T/test-r.R $T/_snaps/r.md | cut -f1 | sort | uniq -c | awk '{ printf "%s:%s ", $2, $1 }')" \
  "EXIT=1:1 block:1 changed:2 removed:2 "
out=$(run "$V2^" "$V2" -- $T/test-r.R $T/_snaps/r.md)
has "a removal is no loss" "$out" "TESTS LOST: 1 test(s)"

# --- 4: a tree -------------------------------------------------------------------

echo
echo "== a tree's removal names its own engine, in a note new to it"
pout=$(run "$V1" "$(git rev-parse "$V2^{tree}")" --porcelain -- $T/test-r.R)
has "a step read as a tree is removed by its note" "$pout" "$(tab removed $T/test-r.R 'test_that("r gone"' '')"
pout=$(run "$R" "$(git rev-parse "$V2^{tree}")" --porcelain -- $T/test-r.R)
has "a note the base has is not the step's" "$pout" "$(tab block $T/test-r.R 'test_that("r gone"' '')"
pout=$(run "$V2" "$(git rev-parse "$V3^{tree}")" --porcelain -- $T/test-q.R)
has "nor one naming another engine than the tree's" "$pout" "$(tab block $T/test-q.R 'test_that("q two"' '')"

# --- 5: rewound ------------------------------------------------------------------

echo
echo "== a change a rewind made, and one it no longer answers for"
out=$(run "$M" s)
has "a line the tip still lacks is rewound" "$out" "+1/-1 over 1 commit(s), rewound by $(short "$V1")"
hasnt "a line a later commit restored is not" "$out" "over 2 commit(s), rewound"
has "but the path still changed" "$out" "changed   tests/testthat/test-e.R"

# --- 6: --vendored -------------------------------------------------------------

echo
echo "== --vendored keeps what a vendor commit stopped"
out=$(run "$M" s --vendored --porcelain)
[ -z "${KEEP:-}" ] || echo "$out"
is "every entry names a vendor commit" \
  "$(grep -v '^EXIT' <<<"$out" | cut -f4 | sort -u | tr '\n' ' ')" \
  "$(printf '%s\n' "$V1" "$V2" "$V3" | sort | tr '\n' ' ')"
hasnt "a deletion by another kind of commit is left out" "$out" "test-g.R"
hasnt "and so is a test main added since" "$out" "test-h.R"
hasnt "or a block main added since" "$out" '"a four"'
hasnt "and no change is listed" "$out" "changed"
has "but the rest is" "$out" "$(printf 'deleted\ttests/testthat/test-b.R')"
has "removals among them" "$out" "$(tab removed $T/test-r.R 'test_that("r gone"' "$V2")"

# --- 7: a tree -----------------------------------------------------------------

echo
echo "== a tree is read the same, with no culprit"
TREE=$(git rev-parse "s^{tree}")
out=$(run "$M" "$TREE")
has "it is lost the same, and the removals by an earlier engine with it" "$out" "TESTS LOST: 15 test(s)"
hasnt "with nobody named" "$out" "by $(short "$V1")"
out=$(run "$M" "$TREE" --vendored)
has "--vendored refuses one" "$out" "EXIT=2"
out=$(run "$M" s --porcelain -- $T/test-c.R)
is "a path narrows it" "$(grep -c . <<<"$out")" 3

# --- 8: nothing lost, and the usage --------------------------------------------

echo
echo "== a tip that keeps every test"
out=$(run "$M" "$M")
has "exits 0" "$out" "EXIT=0"
has "and says so" "$out" "TESTS KEPT: every test $(short "$M") runs, $(short "$M") runs too."
out=$(run "$(git rev-parse "$V3~3")" "$V3~3")
has "a series commit against itself too" "$out" "EXIT=0"
out=$(run "$V2^" "$V2" -- $T/test-p.R)
has "a tip that took away nothing but a removal exits 0" "$out" "EXIT=0"
has "counting it" "$out" "runs too, but 1 removed with their function upstream."
is "no arguments is a usage error" "$(run | tail -n 1)" "EXIT=2"
is "an unknown option too" "$(run "$M" s --bogus | tail -n 1)" "EXIT=2"
is "and a name that is not a tree" "$(run "$M" nothing | tail -n 1)" "EXIT=2"

echo
echo "$pass passed, $fail failed"
[ "$fail" -eq 0 ]
