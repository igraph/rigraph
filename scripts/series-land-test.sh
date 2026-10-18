#!/bin/bash
# Check the landing of a series on `main`, offline, against a synthetic fork,
# canonical repository and clone built here: no network, no fixtures on disk.
#
# The claim scripts/series-land.sh makes is that `<L>-land-dev` is `main` plus
# the series' vendor commits and nothing else, and that its tip is the package
# the series' rc strand holds. Fourteen things are checked.
#
#   1. Without --push the build writes no ref, and says what it would write.
#   2. Only vendor commits land, on `main` itself, unflavored.
#   3. Each is stamped with the series' prefix and a counter of its own.
#   4. A first pick whose old parent vendors another engine than `main` takes
#      the vendored strand whole, and the glue and test fix it folded with it.
#      A later pick that conflicts with what `main` changed stops the build,
#      which resumes on a rerun without skipping a version number.
#   5. A tooling sync the base cannot reverse-apply is placed by its subject
#      rather than stranding the run, and a port `main` carries is not replayed.
#   6. The tree check explains what the landing takes from `main` by
#      construction, `NEWS.md` and the READMEs, and nothing else; the counter
#      reproduces the series' version even where `main` carries five components
#      of its own, so `DESCRIPTION` agrees.
#   7. --push writes `<L>-land-dev` and `<L>-land-green` at the base together.
#   8. A rebuild from the same inputs mints the same SHAs, and the conflict
#      resolved once is resolved again by rerere without stopping.
#   9. --status advances green over the commits the store passed, names the
#      first one it has not, and prints the fast-forward once every one passed.
#      --review writes the landing's R side alone onto `main`, one commit per
#      landing commit that changes it, with every workflow removed first.
#  10. A resolution rerere replays wrongly is named when the check fails, and
#      an attended rebuild stops there so it can be forgotten and redone. A
#      kept build follows the rc strand when the series moves on.
#  11. A landing stands on a base above `main`: the base's own commit lands
#      with it, is expected by the tree check, is judged by CI from `main` up,
#      and shows in the review as it is.
#  12. The tests are held to the base's: a landing whose tip runs them all says
#      so, and one that stops a test the base runs is refused before anything
#      is pushed, naming the test and the commit, though the tree check passes.
#  13. A `main` that moved stops a kept build and is not READY, and a rebuild
#      on it that the series has not ported is refused before anything is
#      pushed, `DESCRIPTION` included.
#  14. --review --series writes the R side of a series' green without a
#      landing: from the rc twins of its vendor commits above the series' base,
#      onto `main`, leaving out the tooling syncs and ports `main` has, and each
#      commit naming its series commit. It shows what `series_review_hidden`
#      leaves: the interface's R half, `man/` and the hand-written build files,
#      but not its C half, the registration or the source and dependency lists.
#      It writes a local branch, pushes only with --push and to --review-remote,
#      and refuses a series that lacks a change of `main`'s and a commit among
#      its vendor commits that is not `main`'s. --base stands it on the older
#      `main` the series has ported, and refuses one the series does not carry,
#      one below a commit it ported, and one not on `main`.
#
# Usage:
#   scripts/series-land-test.sh
#
# Environment variables:
#   KEEP - if non-empty, do not delete the scratch directory

set -euo pipefail

HERE=$(cd "$(dirname "$0")" && pwd)
SCRATCH=$(mktemp -d)
[ -n "${KEEP:-}" ] || trap 'rm -rf "$SCRATCH"' EXIT
[ -z "${KEEP:-}" ] || echo "scratch: $SCRATCH"
export TMPDIR=$SCRATCH

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
# `main` moving on from B: it vendors a newer engine of its own line, takes an
# R-side fix and two tooling changes, and bumps its version. The series ports
# the fix and syncs the tooling twice, and vendors three commits of its own line.

FORK=$SCRATCH/fork.git
CANON=$SCRATCH/canonical.git
WORK=$SCRATCH/work
git init -q --bare -b main "$FORK"
git init -q --bare -b main "$CANON"

git init -q -b main "$WORK"
cd "$WORK"
git config user.name Test
git config user.email test@example.invalid
git config commit.gpgsign false
git remote add origin "$FORK"
git remote add upstream "$CANON"

mkdir -p scripts R src/vendor/cigraph tests/testthat .github/workflows
for s in series-land.sh series-forward-build.sh series-rc.sh series-tests.sh setup-git.sh merge-version.sh \
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

desc igraph 1.5.5.9000
engine aaaa111 1.0.0
echo 'rename igraph.1.3 igraph_1_3' > scripts/flavor.patch
echo 'tool v1' > scripts/tool.sh
echo 'on: pull_request' > .github/workflows/ci.yaml
echo 'pkg <- "igraph"' > R/package.R
echo 'foo <- function() 1' > R/foo.R
echo 'glue 1' > src/glue.cpp
echo 'test 1' > tests/testthat/test-foo.R
printf 'a\nb\nc\n' > tests/testthat/test-bar.R
echo '# igraph 1.5.5.9000' > NEWS.md
echo 'readme at the base' > README.md
commit 'vendor: Update vendored sources to igraph/igraph@aaaa111 (#1)'
B=$(git rev-parse HEAD)

# `main` moves on.
engine aaaa112 1.0.1
commit 'vendor: Update vendored sources to igraph/igraph@aaaa112 (#2)'
echo 'foo <- function() 2' > R/foo.R
commit 'fix: An R-side fix on main (#3)'
P=$(git rev-parse HEAD)
printf 'a\nb main\nc\n' > tests/testthat/test-bar.R
commit 'test: A test main adjusted (#9)'
Q=$(git rev-parse HEAD)
echo 'tool v2' > scripts/tool.sh
commit 'ci: A tooling change (#4)'
echo 'tool v3' > scripts/tool.sh
commit 'ci: Another tooling change (#5)'
desc igraph 1.5.6.9001.7
echo '# igraph 1.5.6.9001.7' > NEWS.md
commit 'fledge: Bump version to 1.5.6.9001.7 (#6)'
echo 'readme on main' > README.md
commit 'docs: The README main renders today (#7)'
M=$(git rev-parse HEAD)
git push -q upstream main
git push -q origin main

# The series: three seed commits on B, as flavor.sh and series-forward write them.
git checkout -q -b s "$B"
echo 'rename igraph.2.0.dev igraph_2_0_dev' > scripts/flavor.patch
commit 'chore: Update flavor patch to igraph.2.0.dev'
echo 'pkg <- "igraph.2.0.dev"' > R/package.R
desc igraph.2.0.dev 1.5.5.9000
commit 'chore: Update version to 2.0.dev'
desc igraph.2.0.dev 1.99.99.9000.0
commit 'chore: Add fifth version component'

engine bbbb222 1.0.1-1-gbbbb222
echo 'glue 2, adapted to bbbb222' > src/glue.cpp
echo 'test 2, as bbbb222 answers' > tests/testthat/test-foo.R
desc igraph.2.0.dev 1.99.99.9000.1
commit 'vendor: Update vendored sources to igraph/igraph@bbbb222'
git cherry-pick -x "$P" >/dev/null
echo 'tool v2' > scripts/tool.sh
commit 'chore(series): Sync tooling with main'
engine cccc333 1.0.1-2-gcccc333
printf 'a\nb v2\nc\n' > tests/testthat/test-bar.R
desc igraph.2.0.dev 1.99.99.9000.2
commit 'vendor: Update vendored sources to igraph/igraph@cccc333'
# The port of `main`'s test change meets the line cccc333 adapted, and is
# resolved by hand, as stage 4 resolves one.
git cherry-pick -x "$Q" >/dev/null 2>&1 || true
printf 'a\nb v2 main\nc\n' > tests/testthat/test-bar.R
git add tests/testthat/test-bar.R
GIT_EDITOR=true git cherry-pick --continue >/dev/null
echo 'tool v3' > scripts/tool.sh
commit 'chore(series): Sync tooling with main'
engine dddd444 1.0.1-3-gdddd444
echo 'test 3, as dddd444 answers' > tests/testthat/test-foo.R
desc igraph.2.0.dev 1.99.99.9000.3
commit 'vendor: Update vendored sources to igraph/igraph@dddd444'
git push -q origin s:refs/heads/v2.0-x-fwd-dev
git checkout -q main

scripts/series-rc.sh v2.0-x-fwd --push >/dev/null 2>&1
git fetch -q origin
RC=$(git rev-parse origin/v2.0-x-fwd-rc-dev)

# The resolution the port above recorded would answer the landing's conflict
# too, since rerere matches the hunk whichever side it is on; a clone that never
# saw it is the case to check first.
rm -rf "$(git rev-parse --git-common-dir)/rr-cache"

# --- 1: a build without --push ------------------------------------------------

echo "== a build stops on a conflict, and resumes"
out=$(scripts/series-land.sh v2.0-x-fwd --no-check-glue 2>&1) && st=0 || st=$?
[ -z "${KEEP:-}" ] || echo "$out"
is "the build stops" "$st" 1
has "on the pick that meets main's change" "$out" "Conflict at"
has "and keeps the build" "$out" "the build stopped and is kept"
read -r WT _ < "$(git rev-parse --git-dir)/series-land-v2.0-x"
printf 'a\nb v2 main\nc\n' > "$WT/tests/testthat/test-bar.R"
git -C "$WT" add tests/testthat/test-bar.R

echo
echo "== a build without --push writes no ref"
out=$(scripts/series-land.sh v2.0-x-fwd --no-check-glue 2>&1) || true
[ -z "${KEEP:-}" ] || echo "$out"
has "it reports the landing" "$out" "3 vendor commits on $(git rev-parse --short "$M")"
has "and that it was not pushed" "$out" "Not pushed; --push writes v2.0-x-land-dev"
is "no land-dev on the fork" "$(git ls-remote origin refs/heads/v2.0-x-land-dev | wc -l)" 0
rout=$(scripts/series-land.sh v2.0-x-fwd --review 2>&1) && st=0 || st=$?
is "nothing to review before the landing is pushed" "$st" 1
has "and it says so" "$rout" "build and --push it first"

TIP=$(git -C "$WT" rev-parse HEAD)

# --- 2, 3, 4, 5: what landed ------------------------------------------------

echo
echo "== only vendor commits land, on main, unflavored, counted"
is "the first landing commit stands on main" "$(git rev-parse "$TIP~3")" "$M"
is "every commit above main vendors" \
  "$(git log --format=%s "$M..$TIP" | grep -vc '^vendor:' || true)" 0
is "the subjects are the series' own, oldest first" \
  "$(git log --reverse --format=%s "$M..$TIP" | sed 's/.*@//' | tr '\n' ' ')" \
  "bbbb222 cccc333 dddd444 "
is "the versions count this chain" \
  "$(for c in $(git rev-list --reverse "$M..$TIP"); do
       git show "$c:DESCRIPTION" | sed -n 's/^Version: //p'; done | tr '\n' ' ')" \
  "1.99.99.9000.1 1.99.99.9000.2 1.99.99.9000.3 "
is "the package is main's name" "$(git show "$TIP:DESCRIPTION" | sed -n 's/^Package: //p')" igraph
is "and so is the R code the flavor renames" "$(git show "$TIP:R/package.R")" 'pkg <- "igraph"'

FIRST=$(git rev-parse "$TIP~2")
is "the rewind took the strand whole" "$(git show "$FIRST:src/vendor/cigraph/engine.c")" "engine bbbb222"
is "src/vendor/igraph_version.h with it" "$(git show "$FIRST:src/vendor/igraph_version.h")" \
  '#define IGRAPH_VERSION "1.0.1-1-gbbbb222"'
is "and the glue it folded" "$(git show "$FIRST:src/glue.cpp")" "glue 2, adapted to bbbb222"
is "and the test fix" "$(git show "$FIRST:tests/testthat/test-foo.R")" "test 2, as bbbb222 answers"
is "main's R-side fix is there from the start" "$(git show "$FIRST:R/foo.R")" 'foo <- function() 2'
is "and main's tooling" "$(git show "$FIRST:scripts/tool.sh")" "tool v3"

# --- 6: the tree check ------------------------------------------------------

echo
echo "== the tip is the package the rc strand holds"
has "NEWS.md is main's" "$out" "NEWS.md"
has "the README is main's" "$out" "README.md"
is "the tip carries the series' version" "$(git show "$TIP:DESCRIPTION" | sed -n 's/^Version: //p')" \
  "$(git show "$RC:DESCRIPTION" | sed -n 's/^Version: //p')"
hasnt "so DESCRIPTION is no difference at all" "$out" "DESCRIPTION"
hasnt "nothing is unexplained" "$out" "UNEXPLAINED"
has "and every test main runs, the landing runs" "$out" "TESTS KEPT"
is "the trees agree everywhere else" \
  "$(git diff --name-only "$TIP" "$RC" -- . ':(exclude)NEWS.md' ':(exclude)README.md' ':(exclude)DESCRIPTION')" ""

# --- 7: --push --------------------------------------------------------------

echo
echo "== --push writes both refs"
out=$(scripts/series-land.sh v2.0-x-fwd --no-check-glue --push 2>&1) || true
[ -z "${KEEP:-}" ] || echo "$out"
git fetch -q origin
is "land-dev is the tip" "$(git rev-parse origin/v2.0-x-land-dev)" "$TIP"
is "land-green is main" "$(git rev-parse origin/v2.0-x-land-green)" "$M"

# --- 8: a rebuild mints the same SHAs ---------------------------------------

echo
echo "== a rebuild from the same inputs is the same chain"
scripts/series-land.sh v2.0-x-fwd --abort >/dev/null
out=$(scripts/series-land.sh v2.0-x-fwd --no-check-glue --push 2>&1) || true
[ -z "${KEEP:-}" ] || echo "$out"
has "rerere resolved the conflict" "$out" "rerere resolved that stop; continuing"
has "nothing to push" "$out" "v2.0-x-land-dev: already on origin"

# --- 9: --status ------------------------------------------------------------

echo
echo "== --status moves green over what passed"
C1=$(git rev-parse "$TIP~2")
C2=$(git rev-parse "$TIP~1")
git checkout -q --orphan rcc2
git rm -rqf .
rec() { # <sha> <state>
  mkdir -p "runs2.d/${1:0:2}"
  printf '{"commit":"%s","status":{"context":"rcc","state":"%s"}}\n' "$1" "$2" \
    > "runs2.d/${1:0:2}/$1.ndjson"
}
rec "$C1" success
rec "$C2" success
commit 'chore: store stub'
git push -q origin rcc2
git checkout -q main

out=$(scripts/series-land.sh v2.0-x-fwd --status --push 2>&1) || true
[ -z "${KEEP:-}" ] || echo "$out"
has "it counts what passed" "$out" "2 of 3 commits above v2.0-x-land-green passed"
has "and names the first that has not" "$out" "first not passed: $(git rev-parse --short "$TIP") (missing)"
git fetch -q origin
is "green moved over the two" "$(git rev-parse origin/v2.0-x-land-green)" "$C2"
hasnt "it is not ready" "$out" "READY"

git checkout -q rcc2
rec "$TIP" success
commit 'chore: store stub, the tip'
git push -q origin rcc2
git checkout -q main
out=$(scripts/series-land.sh v2.0-x-fwd --status --push 2>&1) || true
[ -z "${KEEP:-}" ] || echo "$out"
has "every commit passed" "$out" "READY: every commit has passed"
has "and it prints the fast-forward" "$out" "git push upstream $TIP:refs/heads/main"

echo
echo "== --review writes the R side alone"
out=$(scripts/series-land.sh v2.0-x-fwd --review --push 2>&1) || true
[ -z "${KEEP:-}" ] || echo "$out"
has "it counts the commits that change the R side" "$out" "3 of 3 landing commits change the R side"
has "and prints the draft pull request" "$out" "gh pr create --repo"
has "with what the landing does to the tests" "$out" "changed   tests/testthat/test-foo.R"
git fetch -q upstream v2.0-x-land-review
REV=$(git rev-parse upstream/v2.0-x-land-review)
is "it stands on main" "$(git rev-parse "$REV~4")" "$M"
is "its first commit removes every workflow" "$(git ls-tree -r --name-only "$REV~3" -- .github/workflows | wc -l)" 0
is "the engine is main's" "$(git show "$REV:src/vendor/cigraph/engine.c")" "engine aaaa112"
is "and so is the version" "$(git show "$REV:DESCRIPTION" | sed -n 's/^Version: //p')" "1.5.6.9001.7"
is "everything else is the landing's" \
  "$(git diff --name-only "$REV" "$TIP" -- . ':(exclude)src/vendor/cigraph' ':(exclude)src/vendor/igraph_version.h' \
    ':(exclude)DESCRIPTION' ':(exclude).github/workflows')" ""
is "no subject reads as a vendor commit" "$(git log --format=%s "$M..$REV" | grep -c '/igraph@' || true)" 0
is "each names the landing commit it halves" \
  "$(git log -1 --format=%B "$REV" | sed -n 's/^Landing-commit: //p')" "$TIP"
sleep 1 # a date not pinned would differ by now
out=$(scripts/series-land.sh v2.0-x-fwd --review --push 2>&1) || true
has "a rerun mints the same branch" "$out" "v2.0-x-land-review: already on upstream"

# --- 10: a wrong resolution, replayed --------------------------------------

echo
echo "== a resolution rerere replays wrongly is named, and can be redone"
scripts/series-land.sh v2.0-x-fwd --abort >/dev/null
rm -rf "$(git rev-parse --git-common-dir)/rr-cache"
scripts/series-land.sh v2.0-x-fwd --no-check-glue >/dev/null 2>&1 || true
read -r WT _ < "$(git rev-parse --git-dir)/series-land-v2.0-x"
printf 'a\nb wrong\nc\n' > "$WT/tests/testthat/test-bar.R"
git -C "$WT" add tests/testthat/test-bar.R
scripts/series-land.sh v2.0-x-fwd --no-check-glue >/dev/null 2>&1 || true
scripts/series-land.sh v2.0-x-fwd --abort >/dev/null
out=$(scripts/series-land.sh v2.0-x-fwd --no-check-glue 2>&1) && st=0 || st=$?
[ -z "${KEEP:-}" ] || echo "$out"
is "the replayed rebuild is refused" "$st" 1
has "the check names the path" "$out" "tests/testthat/test-bar.R"
has "and says rerere answered it" "$out" "rerere replayed a resolution for: tests/testthat/test-bar.R"

scripts/series-land.sh v2.0-x-fwd --abort >/dev/null
out=$(scripts/series-land.sh v2.0-x-fwd --no-check-glue --attended 2>&1) && st=0 || st=$?
[ -z "${KEEP:-}" ] || echo "$out"
is "an attended rebuild stops at the conflict" "$st" 1
has "with rerere's answer filled in" "$out" "Resolved 'tests/testthat/test-bar.R' using previous resolution"
read -r WT _ < "$(git rev-parse --git-dir)/series-land-v2.0-x"
git -C "$WT" rerere forget tests/testthat/test-bar.R >/dev/null 2>&1
printf 'a\nb v2 main\nc\n' > "$WT/tests/testthat/test-bar.R"
git -C "$WT" add tests/testthat/test-bar.R
out=$(scripts/series-land.sh v2.0-x-fwd --no-check-glue --attended 2>&1) || true
[ -z "${KEEP:-}" ] || echo "$out"
has "redone, the landing is the series' again" "$out" "v2.0-x-land-dev: already on origin"

# The series vendors one more commit while the build waits.
git checkout -q s
engine eeee555 1.0.1-4-geeee555
desc igraph.2.0.dev 1.99.99.9000.4
commit 'vendor: Update vendored sources to igraph/igraph@eeee555'
git push -q origin s:refs/heads/v2.0-x-fwd-dev
git checkout -q main
scripts/series-rc.sh v2.0-x-fwd --push >/dev/null 2>&1
out=$(scripts/series-land.sh v2.0-x-fwd --no-check-glue 2>&1) || true
[ -z "${KEEP:-}" ] || echo "$out"
has "the kept build follows the moved strand" "$out" "following it"
has "and lands the new commit too" "$out" "4 vendor commits on $(git rev-parse --short "$M")"
hasnt "and is the series' package" "$out" "DIVERGED"

# --- 11: a base above main ---------------------------------------------------

echo
echo "== a landing stands on a base above main"
scripts/series-land.sh v2.0-x-fwd --abort >/dev/null
git checkout -q -b pin "$M"
echo 'test_that("a pinned expectation", expect_true(TRUE))' > tests/testthat/test-pin.R
commit 'test: Pin what the line must keep (#10)'
PIN=$(git rev-parse HEAD)
git push -q upstream pin
git checkout -q main
out=$(scripts/series-land.sh v2.0-x-fwd --no-check-glue --base pin --push 2>&1) || true
[ -z "${KEEP:-}" ] || echo "$out"
has "it builds on the base" "$out" "4 vendor commits on $(git rev-parse --short "$PIN")"
has "and names the base's own commits" "$out" "1 commit(s) of its own"
hasnt "the base's own change is expected by the check" "$out" "UNEXPLAINED"
git fetch -q origin
LTIP=$(git rev-parse origin/v2.0-x-land-dev)
is "the base's commit lands with it" "$(git rev-parse "$LTIP~4")" "$PIN"
is "green starts at main, so CI judges that commit too" "$(git rev-parse origin/v2.0-x-land-green)" "$M"

git checkout -q rcc2
for c in $(git rev-list "$M..$LTIP"); do rec "$c" success; done
commit 'chore: store stub, the landing on a base'
git push -q origin rcc2
git checkout -q main
out=$(scripts/series-land.sh v2.0-x-fwd --status --push 2>&1) || true
[ -z "${KEEP:-}" ] || echo "$out"
has "the base's commit counts among those CI passed" "$out" "5 of 5 commits above v2.0-x-land-green passed"
has "and main fast-forwards across both" "$out" "git push upstream $LTIP:refs/heads/main"

out=$(scripts/series-land.sh v2.0-x-fwd --review --push 2>&1) || true
[ -z "${KEEP:-}" ] || echo "$out"
git fetch -q upstream v2.0-x-land-review
is "the review shows the base's commit as it lands" \
  "$(git log --format=%s "$M..upstream/v2.0-x-land-review" | grep -c '^test: Pin what the line must keep')" 1

# An iteration reviewed before the series carries it: the fix folded into the
# commit that introduced the defect, and everything above it replayed.
git checkout -q -b land-v2 "$LTIP"
git checkout -q --detach "$LTIP~3"
echo 'glue 2, adapted to bbbb222, and fixed' > src/glue.cpp
git add src/glue.cpp
git commit -q --amend --no-edit
git cherry-pick "$LTIP~3..$LTIP" >/dev/null
git branch -f land-v2 HEAD
git push -q origin "land-v2:refs/heads/v2.0-x-land-v2"
git checkout -q main
out=$(scripts/series-land.sh v2.0-x-fwd --review --landing v2.0-x-land-v2 --suffix -v2 --push 2>&1) || true
[ -z "${KEEP:-}" ] || echo "$out"
has "an iteration gets a review branch of its own" "$out" "v2.0-x-land-review-v2 ->"
has "and a title that names it" "$out" "the R side of the v2.0-x landing, v2"
git fetch -q upstream v2.0-x-land-review-v2
R1=$(git log --format=%H -F --grep='The R side of igraph/igraph bbbb222' upstream/v2.0-x-land-review-v2)
is "with the folded fix in the commit that introduced it" \
  "$(git show "$R1:src/glue.cpp")" 'glue 2, adapted to bbbb222, and fixed'

# A fix stacked on top of the vendor commits is not a landing.
git checkout -q -b land-v3 land-v2
echo 'one more' > src/more.cpp
commit 'fix: A commit on top'
git push -q origin "land-v3:refs/heads/v2.0-x-land-v3"
git checkout -q main
out=$(scripts/series-land.sh v2.0-x-fwd --review --landing v2.0-x-land-v3 --suffix -v3 2>&1) && st=0 || st=$?
is "a commit on top of the vendor commits is refused" "$st" 1
LAND_BEFORE=$LTIP

# --- 12: a test the base runs, which the series stopped ----------------------

echo
echo "== a landing that stops a test its base runs is not pushed"
git checkout -q s
engine ffff666 1.0.1-5-gffff666
git rm -q tests/testthat/test-bar.R
desc igraph.2.0.dev 1.99.99.9000.5
commit 'vendor: Update vendored sources to igraph/igraph@ffff666'
git push -q origin s:refs/heads/v2.0-x-fwd-dev
git checkout -q main
scripts/series-rc.sh v2.0-x-fwd --push >/dev/null 2>&1
out=$(scripts/series-land.sh v2.0-x-fwd --no-check-glue --push 2>&1) && st=0 || st=$?
[ -z "${KEEP:-}" ] || echo "$out"
is "the build is refused" "$st" 1
has "the report names the test" "$out" "deleted   tests/testthat/test-bar.R"
has "and the commit that stopped it" "$out" "igraph/igraph@ffff666"
hasnt "though the series lacks it too" "$out" "DIVERGED"
has "and nothing is pushed" "$out" "Nothing was pushed"
git fetch -q origin
is "land-dev is where it was" "$(git rev-parse origin/v2.0-x-land-dev)" "$LAND_BEFORE"

# --- 13: main moves ---------------------------------------------------------

echo
echo "== a main that moved is not landed on blindly"
git checkout -q main
echo 'foo <- function() 3' > R/foo.R
printf 'Imports: DBI\n' >> DESCRIPTION
commit 'fix: A fix the series never ported (#8)'
git push -q upstream main
out=$(scripts/series-land.sh v2.0-x-fwd --status 2>&1) && st=0 || st=$?
is "the pushed landing is not ready on it" "$st" 1
has "and says main moved" "$out" "NOT READY"
out=$(scripts/series-land.sh v2.0-x-fwd --no-check-glue 2>&1) && st=0 || st=$?
[ -z "${KEEP:-}" ] || echo "$out"
is "the kept build refuses" "$st" 1
has "and says main moved" "$out" "Error: main moved from below $(git rev-parse --short "$PIN")"

scripts/series-land.sh v2.0-x-fwd --abort >/dev/null
out=$(scripts/series-land.sh v2.0-x-fwd --no-check-glue --push 2>&1) && st=0 || st=$?
[ -z "${KEEP:-}" ] || echo "$out"
is "a rebuild the series does not match fails" "$st" 1
has "it names the path" "$out" "R/foo.R"
has "and DESCRIPTION, whose difference is not its version" "$out" "    DESCRIPTION"
has "and refuses to push" "$out" "DIVERGED"
git fetch -q origin
is "land-dev is where it was" "$(git rev-parse origin/v2.0-x-land-dev)" "$LAND_BEFORE"

scripts/series-land.sh v2.0-x-fwd --abort >/dev/null

# --- 14: a series reviewed before any landing --------------------------------
#
# A series seeded on the older `main` M, with `main`'s fix since brought in front
# of its vendor commits as one commit. `main` then changes its tooling and its R
# code, which the series syncs and ports among its vendor commits, and bumps
# its version, which the series leaves out by construction.

echo
echo "== --review --series reads the R side of a series without a landing"
echo 'tool v4' > scripts/tool.sh
commit 'ci: A tooling change after the seed (#13)'
echo 'bar <- function() 1' > R/bar.R
commit 'fix: Another R-side fix on main (#14)'
FIX=$(git rev-parse HEAD)
git checkout -q -b y "$M"
echo 'rename igraph.3.0.dev igraph_3_0_dev' > scripts/flavor.patch
commit 'chore: Update flavor patch to igraph.3.0.dev'
echo 'pkg <- "igraph.3.0.dev"' > R/package.R
desc igraph.3.0.dev 1.5.6.9001.7
commit 'chore: Update version to 3.0.dev'
ydesc() { desc igraph.3.0.dev "1.5.6.9002.$1"; printf 'Imports: DBI\n' >> DESCRIPTION; }
ydesc 0
sed -i '/^Imports/d' DESCRIPTION
commit 'chore: Add fifth version component'
echo 'foo <- function() 3' > R/foo.R
ydesc 0
commit "chore(series): Bring main's changes since the seed in front of the vendor commits"
engine a1a1777 1.0.1-1-ga1a1777
echo 'glue 3, adapted to a1a1777' > src/glue.cpp
echo 'a1a1_impl <- function() NULL' > R/aaa-auto.R
echo 'test 3, as a1a1777 answers' > tests/testthat/test-foo.R
# What is generated with it, and the build files written by hand.
mkdir -p man
echo 'SEXP R_igraph_a1a1(void);' > src/rinterface.c
echo 'glue.o: glue.cpp vendor/cigraph/a1a1.h' > src/glue.dd
echo 'GLUE_CPP_SOURCES=glue.o' > src/sources-glue-cpp.mk
echo 'the help page roxygen writes for a1a1' > man/a1a1.Rd
echo 'PKG_CPPFLAGS = -DA1A1' > src/Makevars.in
echo '#define HAVE_A1A1 1' > src/vendor/config.h
ydesc 1
commit 'vendor: Update vendored sources to igraph/igraph@a1a1777'
echo 'tool v4' > scripts/tool.sh
commit 'chore(series): Sync tooling with main'
SYNC=$(git rev-parse --short HEAD)
# An interface change the engine makes, with nothing under tools/stimulus/.
engine b2b2888 1.0.1-2-gb2b2888
echo 'b2b2_impl <- function() NULL' > R/aaa-auto.R
echo 'SEXP R_igraph_b2b2(void);' > src/rinterface.c
echo 'b2b2 registered' > src/cpp11.cpp
echo 'b2b2 registered' > R/cpp11.R
ydesc 2
commit 'vendor: Update vendored sources to igraph/igraph@b2b2888'
git cherry-pick -x "$FIX" >/dev/null
PORT=$(git rev-parse --short HEAD)
# Generated C alone, which the review does not show.
engine c3c3999 1.0.1-3-gc3c3999
echo 'SEXP R_igraph_c3c3(void);' > src/rinterface.c
echo 'GLUE_C_SOURCES=rinterface.o' > src/sources-glue-c.mk
ydesc 3
commit 'vendor: Update vendored sources to igraph/igraph@c3c3999'
engine d4d4000 1.0.1-4-gd4d4000
ydesc 4
echo 'LinkingTo: cpp11' >> DESCRIPTION
commit 'vendor: Update vendored sources to igraph/igraph@d4d4000'
YG=$(git rev-parse HEAD)
engine e5e5111 1.0.1-5-ge5e5111
echo 'foo <- function() 5' > R/foo.R
ydesc 5
echo 'LinkingTo: cpp11' >> DESCRIPTION
commit 'vendor: Update vendored sources to igraph/igraph@e5e5111'
git push -q origin "$YG:refs/heads/v3.0-y-green" y:refs/heads/v3.0-y-dev
git checkout -q main
desc igraph 1.5.6.9001.8
printf 'Imports: DBI\n' >> DESCRIPTION
echo '# igraph 1.5.6.9001.8' > NEWS.md
commit 'fledge: Bump version to 1.5.6.9001.8 (#11)'
M9=$(git rev-parse HEAD)
git push -q upstream main

out=$(scripts/series-land.sh v3.0-y --review --series 2>&1) && st=0 || st=$?
[ -z "${KEEP:-}" ] || echo "$out"
is "a series is reviewed without a landing" "$st" 0
has "it counts the series commits that change the R side" "$out" "3 of 6 series commits change the R side"
has "and leaves out main's tooling sync" "$out" "left out, main's own: $SYNC chore(series): Sync tooling with main"
has "and main's commit the series ported" "$out" "left out, main's own: $PORT fix: Another R-side fix on main (#14)"
REV=$(git rev-parse -q --verify v3.0-y-land-review || echo none)
has "it writes a local branch, named in full" "$out" "-> $REV"
has "and says it was not pushed" "$out" "Not pushed; the local branch v3.0-y-land-review holds it"
is "nothing reaches the canonical repository" "$(git ls-remote upstream refs/heads/v3.0-y-land-review | wc -l)" 0
is "it stands on main" "$(git rev-parse "$REV~4")" "$M9"
is "its first commit removes every workflow" "$(git ls-tree -r --name-only "$REV~3" -- .github/workflows | wc -l)" 0
has "and says what still runs" "$(git log -1 --format=%B "$REV~3")" "A \`pull_request_target\` workflow runs all the same"
has "for the series" "$(git log -1 --format=%B "$REV~3")" "the R side of the v3.0-y series"
is "the engine is main's" "$(git show "$REV:src/vendor/cigraph/engine.c")" "engine aaaa112"
is "and so is the version" "$(git show "$REV:DESCRIPTION" | sed -n 's/^Version: //p')" "1.5.6.9001.8"
has "but not the rest of DESCRIPTION" "$(git show "$REV:DESCRIPTION")" "LinkingTo: cpp11"
is "the package is main's name" "$(git show "$REV:DESCRIPTION" | sed -n 's/^Package: //p')" igraph
is "and so is the R code the flavor renames" "$(git show "$REV:R/package.R")" 'pkg <- "igraph"'
is "the generated interface's R half is shown" "$(git show "$REV:R/aaa-auto.R")" 'b2b2_impl <- function() NULL'
is "and so are the build files written by hand" \
  "$(git show "$REV:src/Makevars.in" "$REV:src/vendor/config.h")" "$(printf 'PKG_CPPFLAGS = -DA1A1\n#define HAVE_A1A1 1')"
is "but not its C half, the registration or the source and dependency lists" \
  "$(git ls-tree -r --name-only "$REV" -- src/rinterface.c src/cpp11.cpp R/cpp11.R src/sources-glue-c.mk \
    src/sources-glue-cpp.mk src/glue.dd)" ""
is "man/ is shown, the rendered documentation being what a reviewer needs" \
  "$(git show "$REV:man/a1a1.Rd")" "the help page roxygen writes for a1a1"
is "nothing above green is" "$(git show "$REV:R/foo.R")" 'foo <- function() 3'
is "what main has is main's" "$(git show "$REV:R/bar.R")" 'bar <- function() 1'
is "each commit is titled by its upstream commit" \
  "$(git log --reverse --format=%s "$REV~3..$REV" | sed 's|^review: The R side of igraph/igraph ||' | tr '\n' ' ')" \
  "a1a1777 b2b2888 d4d4000 "
is "and names the series commit it halves" "$(git log -1 --format=%B "$REV" | sed -n 's/^Series-commit: //p')" "$YG"
has "whose message it carries" "$(git log -1 --format=%B "$REV")" "vendor: Update vendored sources to igraph/igraph@d4d4000"
hasnt "no commit names a landing" "$(git log --format=%B "$M9..$REV")" "Landing-commit:"
has "it reports what the series does to the tests" "$out" "changed   tests/testthat/test-foo.R"

mkdir -p "$SCRATCH/krlmlr"
git init -q --bare "$SCRATCH/krlmlr/rigraph.git"
git remote add review "$SCRATCH/krlmlr/rigraph.git"
out=$(scripts/series-land.sh v3.0-y --review --series --review-remote review --push 2>&1) || true
[ -z "${KEEP:-}" ] || echo "$out"
has "--push writes it to --review-remote" "$out" "v3.0-y-land-review -> $REV on review"
is "which holds it" "$(git ls-remote review refs/heads/v3.0-y-land-review | cut -f1)" "$REV"
is "and the canonical repository still does not" "$(git ls-remote upstream refs/heads/v3.0-y-land-review | wc -l)" 0
has "the pull request names the head by its owner" "$out" "--head krlmlr:v3.0-y-land-review"
has "and the series in its title" "$out" "Review: the R side of the v3.0-y series"

# An aligned rc strand on the remote is taken as it is, and is the same.
scripts/series-rc.sh v3.0-y --push >/dev/null 2>&1
git fetch -q origin
sleep 1 # a date not pinned would differ by now
out=$(scripts/series-land.sh v3.0-y --review --series --review-remote review --push 2>&1) || true
[ -z "${KEEP:-}" ] || echo "$out"
has "a rerun from the aligned rc strand mints the same branch" "$out" "v3.0-y-land-review: already on review"
is "everything else is the series' green without its flavor, but for what is generated" \
  "$(git diff --name-only "$REV" origin/v3.0-y-rc-dev~1 -- . ':(exclude)src/vendor/cigraph' \
    ':(exclude)src/vendor/igraph_version.h' ':(exclude)DESCRIPTION' ':(exclude)NEWS.md' ':(exclude).github/workflows' |
    tr '\n' ' ')" \
  "R/cpp11.R src/cpp11.cpp src/glue.dd src/rinterface.c src/sources-glue-c.mk src/sources-glue-cpp.mk "

# Where the configuration does not name what a review hides, the Makevars are
# hidden with the strand.
echo 'unset series_review_hidden' >> scripts/series-config.sh
out=$(scripts/series-land.sh v3.0-y --review --series --suffix -default 2>&1) || true
git checkout -q -- scripts/series-config.sh
[ -z "${KEEP:-}" ] || echo "$out"
has "by default the interface change alone is not shown" "$out" "2 of 6 series commits change the R side"
is "nor is the generated interface" "$(git ls-tree --name-only v3.0-y-land-review-default -- R/aaa-auto.R)" ""

echo
echo "== --review --series refuses what it cannot read onto main"
echo 'foo <- function() 4' > R/foo.R
commit 'fix: A fix the series lacks (#12)'
git push -q upstream main
out=$(scripts/series-land.sh v3.0-y --review --series 2>&1) && st=0 || st=$?
[ -z "${KEEP:-}" ] || echo "$out"
is "a series that lacks a change of main's is refused" "$st" 1
has "naming the path" "$out" "  R/foo.R"
hasnt "but not the version" "$out" "  DESCRIPTION"
hasnt "nor NEWS.md" "$out" "  NEWS.md"
has "and names --base for the main it has ported" "$out" "or name the main commit it has ported with --base"
out=$(scripts/series-land.sh v3.0-y --review --series --base "$M9" --suffix -older 2>&1) && st=0 || st=$?
[ -z "${KEEP:-}" ] || echo "$out"
is "it is reviewed on the older main it has ported, named with --base" "$st" 0
has "which it says" "$out" "the base is the main v3.0-y-green has ported; main $(git rev-parse --short HEAD) has 1 commit(s) above it"
is "the same review as on that main" "$(git rev-parse -q --verify v3.0-y-land-review-older)" "$REV"
out=$(scripts/series-land.sh v3.0-y --review --series --base "$M" --suffix -older 2>&1) && st=0 || st=$?
[ -z "${KEEP:-}" ] || echo "$out"
is "a base below a commit the series ported is refused" "$st" 1
has "naming the port" "$out" "fix: Another R-side fix on main (#14) stands among the vendor commits"
MAIN=$(git rev-parse --short HEAD)
out=$(scripts/series-land.sh v3.0-y --review --series --base "$MAIN" --suffix -older 2>&1) && st=0 || st=$?
[ -z "${KEEP:-}" ] || echo "$out"
is "so is a base with a change the series lacks" "$st" 1
has "naming the path" "$out" "  R/foo.R"
has "and the base" "$out" "--base $MAIN is not the main v3.0-y-green has ported"
out=$(scripts/series-land.sh v3.0-y --review --series --base v3.0-y-land-review --suffix -older 2>&1) && st=0 || st=$?
is "and a base not on main" "$st" 1
has "which it says" "$out" "--base v3.0-y-land-review is not on main"
git reset -q --hard "$M9"
echo 'glue 1, on main' > src/glue.cpp
commit 'fix: Glue main changed since the series took it (#15)'
git push -q -f upstream main
out=$(scripts/series-land.sh v3.0-y --review --series 2>&1) && st=0 || st=$?
[ -z "${KEEP:-}" ] || echo "$out"
is "a vendor commit that does not apply to main is refused" "$st" 1
has "and named" "$out" "vendor: Update vendored sources to igraph/igraph@a1a1777 does not apply onto main"
git reset -q --hard "$M9"
git push -q -f upstream main

git checkout -q y
echo 'one more' > src/more.cpp
commit 'fix: A commit among the vendor commits'
engine f6f6222 1.0.1-6-gf6f6222
ydesc 6
commit 'vendor: Update vendored sources to igraph/igraph@f6f6222'
git push -q -f origin y:refs/heads/v3.0-y-dev y:refs/heads/v3.0-y-green
git checkout -q main
out=$(scripts/series-land.sh v3.0-y --review --series 2>&1) && st=0 || st=$?
[ -z "${KEEP:-}" ] || echo "$out"
is "a commit among the vendor commits is refused" "$st" 1
has "and named" "$out" "fix: A commit among the vendor commits"

scripts/series-land.sh v3.0-y --series >/dev/null 2>&1 && st=0 || st=$?
is "--series without --review is a usage error" "$st" 2
scripts/series-land.sh v3.0-y --review --series --landing v2.0-x-land-v2 >/dev/null 2>&1 && st=0 || st=$?
is "and so is --series with --landing" "$st" 2

echo
echo "$pass passed, $fail failed"
[ "$fail" -eq 0 ]
