#!/bin/bash
# Check scripts/series-fold.sh offline, against a synthetic landing built here:
# no network, no fixtures on disk.
#
# The claim the script makes is that a fix written on the landing commit that
# introduced a defect ends up in that commit and in every commit above it,
# and nowhere else, with the landing's shape and dates kept. Twelve things are
# checked.
#
#   1. The commits below the lowest target keep their SHAs, and the landing
#      keeps its length and its subjects.
#   2. Each target carries its fix, and its message keeps its subject and its
#      text and gains the note as a paragraph above its trailers.
#   3. Every commit above a target carries the fix, a later commit's own change
#      included.
#   4. Committer dates stay the landing's, so a rerun mints the same SHAs.
#   5. --exec runs after every commit from the lowest target up.
#   6. A fix that conflicts with a commit above its target stops the replay,
#      and --continue finishes it with the resolution.
#   7. A fix that is not a commit on its target is refused before anything is
#      replayed.
#   8. A note follows the upstream subjects a vendor commit's message ends with,
#      which look like trailers but are not.
#   9. Run from the worktree it rewrites, as the skills run it, the fold folds
#      into a target that does not carry the script and into one that carries
#      an older copy alike: the replay runs the copy it started with.
#  10. A fold step that fails stops the replay, and --continue runs it again
#      rather than past it, so the fold is in the result and only then done.
#  11. A replay that ends without a fold is not done: status 3, the fix named.
#  12. A fix that conflicts at its target is folded once, by --continue, and the
#      check says it was resolved by hand.
#
# Usage:
#   scripts/series-fold-test.sh
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
hasnt() { case "$2" in *"$3"*) no "$1"; echo "    unexpected: $3" ;; *) ok "$1" ;; esac; }

# --- the fixture -----------------------------------------------------------
#
# `main`, then five vendor commits, each vendoring an engine version and the
# third also changing the glue. The landing's committer dates are all `main`'s,
# as scripts/series-land.sh pins them.

WORK=$SCRATCH/work
git init -q -b main "$WORK"
cd "$WORK"
git config user.name Test
git config user.email test@example.invalid
git config rerere.enabled true
export GIT_COMMITTER_DATE='1700000000 +0000' GIT_AUTHOR_DATE='1700000000 +0000'

mkdir -p src/vendor/cigraph R
printf 'one\ntwo\nthree\nfour\nfive\n' > src/glue.cpp
echo 0 > src/vendor/cigraph/engine
echo 'f <- function() 1' > R/f.R
git add -A
git commit -q -m 'main'
main=$(git rev-parse HEAD)

for i in 1 2 3 4 5; do
  echo "$i" > src/vendor/cigraph/engine
  [ "$i" != 3 ] || sed -i 's/^four$/four (adapted)/' src/glue.cpp
  GIT_AUTHOR_DATE="$((1700000000 + i * 100)) +0000" git commit -q -a -m "vendor: Update vendored sources to igraph/igraph@00$i

R-side fix
----------

Adapted the glue to engine $i.

Unflavored-from: 000000000$i"
done
landing=$(git rev-parse HEAD)
v() { git rev-parse "$landing~$((5 - $1))"; } # the landing's vendor commit $1

# Fixes, each a commit on its target: one on vendor 2 to the glue, which the
# commits above must carry past vendor 3's own change to the next line, and one
# on vendor 4 to the R side.
git checkout -q --detach "$(v 2)"
sed -i 's/^two$/two (fixed)/' src/glue.cpp
git commit -q -a -m 'fix: The glue reads two correctly'
fix2=$(git rev-parse HEAD)
git checkout -q --detach "$(v 4)"
echo 'f <- function() 2' > R/f.R
git commit -q -a -m 'fix: f() returns two'
fix4=$(git rev-parse HEAD)
git checkout -q --detach "$landing"
unset GIT_COMMITTER_DATE GIT_AUTHOR_DATE

echo "=== 1. the shape below and around the folds"
"$HERE/series-fold.sh" "$landing" --fold "$(v 2)=$fix2:Folded in landing v2: the glue reads two (finding 3)." \
  --fold "$(v 4)=$fix4" --exec 'git rev-parse --short HEAD >> ../exec.log' > "$SCRATCH/out" 2>&1 ||
  { no "the fold finishes"; cat "$SCRATCH/out"; }
new=$(git rev-parse HEAD)
is "the landing is not moved" "$(git rev-parse "$landing")" "$landing"
is "the commit below the lowest target keeps its SHA" "$(git rev-parse "$new~4")" "$(v 1)"
is "the landing keeps its length" "$(git rev-list --count "$main..$new")" 5
is "and its subjects" "$(git log --format=%s "$main..$new")" "$(git log --format=%s "$main..$landing")"
is "and its authors' dates" "$(git log --format=%ad "$main..$new")" "$(git log --format=%ad "$main..$landing")"

echo "=== 2. each target carries its fix, with a note above its trailers"
is "the glue fix is in vendor 2" "$(git show "$new~3:src/glue.cpp" | sed -n 2p)" "two (fixed)"
is "the R fix is in vendor 4" "$(git show "$new~1:R/f.R")" 'f <- function() 2'
is "and not below it" "$(git show "$new~2:R/f.R")" 'f <- function() 1'
msg=$(git log -1 --format=%B "$new~3")
has "the message keeps its text" "$msg" "Adapted the glue to engine 2."
is "the note sits above the trailers" "$(sed -n '/^Folded/,$p' <<<"$msg")" \
  "Folded in landing v2: the glue reads two (finding 3).

Unflavored-from: 0000000002"
has "a fold without a note is named by the fix's subject" "$(git log -1 --format=%B "$new~1")" \
  "fix: f() returns two

Unflavored-from: 0000000004"
is "a commit above a target gains no note" "$(git log -1 --format=%B "$new~2" | grep -c 'Folded' || true)" 0

echo "=== 3. every commit above a target carries its fix"
is "vendor 3 carries the glue fix beside its own change" "$(git show "$new~2:src/glue.cpp" | sed -n '2p;4p' | tr '\n' '|')" \
  "two (fixed)|four (adapted)|"
is "vendor 5 carries both" "$(git show "$new:src/glue.cpp" | sed -n 2p) $(git show "$new:R/f.R")" \
  "two (fixed) f <- function() 2"
is "the engine is each commit's own" "$(for i in 4 3 2 1 0; do git show "$new~$i:src/vendor/cigraph/engine"; done | tr '\n' ' ')" "1 2 3 4 5 "

echo "=== 4. dates stay the landing's, so a rerun mints the same SHAs"
is "every committer date is main's" "$(git log --format=%cd --date=raw "$main..$new" | sort -u)" "1700000000 +0000"
git checkout -q --detach "$landing"
"$HERE/series-fold.sh" "$landing" --fold "$(v 2)=$fix2:Folded in landing v2: the glue reads two (finding 3)." \
  --fold "$(v 4)=$fix4" > /dev/null 2>&1 || no "the rerun finishes"
is "a rerun mints the same tip" "$(git rev-parse HEAD)" "$new"

echo "=== 5. --exec runs after every commit from the lowest target up"
is "four commits, each once" "$(wc -l < ../exec.log | tr -d ' ')" 4

echo "=== 6. a fix that conflicts above its target stops, and --continue finishes"
git checkout -q --detach "$(v 1)"
sed -i 's/^four$/four (fixed)/' src/glue.cpp
GIT_COMMITTER_DATE='1700000000 +0000' git commit -q -a -m 'fix: The glue reads four correctly'
fix1=$(git rev-parse HEAD)
git checkout -q --detach "$landing"
set +e
"$HERE/series-fold.sh" "$landing" --fold "$(v 1)=$fix1" > "$SCRATCH/out" 2>&1
st=$?
set -e
is "the replay stops on vendor 3's change to the same line" "$st" 1
has "and says how to go on" "$(cat "$SCRATCH/out")" "--continue"
sed -i '/^<<<<<<<\|^=======\|^>>>>>>>/d; /^four$/d; /^four (fixed)$/d' src/glue.cpp
sed -i 's/^four (adapted)$/four (fixed, adapted)/' src/glue.cpp
git add src/glue.cpp
"$HERE/series-fold.sh" --continue > "$SCRATCH/out" 2>&1 || { no "--continue finishes"; cat "$SCRATCH/out"; }
is "the resolution is carried to the tip" "$(git show HEAD:src/glue.cpp | sed -n 4p)" "four (fixed, adapted)"
is "and the dates stay pinned" "$(git log --format=%cd --date=raw "$main..HEAD" | sort -u)" "1700000000 +0000"

echo "=== 7. a fix that is not on its target is refused"
git checkout -q --detach "$landing"
set +e
"$HERE/series-fold.sh" "$landing" --fold "$(v 3)=$fix2" > "$SCRATCH/out" 2>&1
st=$?
set -e
is "with status 2" "$st" 2
has "naming the fix" "$(cat "$SCRATCH/out")" "is not a commit on its target"
is "and nothing is replayed" "$(git rev-parse HEAD)" "$landing"

echo "=== 8. a note follows the upstream subjects a message ends with"
git checkout -q --detach "$main"
echo 6 > src/vendor/cigraph/engine
GIT_COMMITTER_DATE='1700000000 +0000' git commit -q -a -m "vendor: Update vendored sources to krlmlr/igraph@006

Date: 2026-04-18 13:02:06 +0000

nfc: remove RNG_BEGIN()/RNG_END() macros
chore: update CHANGELOG"
subjects=$(git rev-parse HEAD)
echo 'f <- function() 6' > R/f.R
GIT_COMMITTER_DATE='1700000000 +0000' git commit -q -a -m 'fix: f() returns six'
fix6=$(git rev-parse HEAD)
git checkout -q --detach "$subjects"
"$HERE/series-fold.sh" "$subjects" --fold "$subjects=$fix6:R-side fix: f() returns six." > "$SCRATCH/out" 2>&1 ||
  { no "the fold finishes"; cat "$SCRATCH/out"; }
is "the note is the last paragraph" "$(git log -1 --format=%B HEAD | sed -n '/^Date/,$p')" \
  "Date: 2026-04-18 13:02:06 +0000

nfc: remove RNG_BEGIN()/RNG_END() macros
chore: update CHANGELOG

R-side fix: f() returns six."

echo "=== 9. a target without the script, or with an older copy, folds alike"
# A line of its own on main: the first target carries no scripts/, the second an
# older copy that would fold nothing, and a tooling sync above them brings this
# one, which the fold is run as, from the worktree at the tip.
git checkout -q --detach "$main"
echo 7 > src/vendor/cigraph/engine
GIT_COMMITTER_DATE='1700000000 +0000' git commit -q -a -m 'vendor: Update vendored sources to igraph/igraph@007'
bare=$(git rev-parse HEAD)
mkdir -p scripts
printf '#!/bin/bash\necho ran >> %q\nexit 0\n' "$SCRATCH/stale.log" > scripts/series-fold.sh
chmod +x scripts/series-fold.sh
echo 8 > src/vendor/cigraph/engine
git add -A
GIT_COMMITTER_DATE='1700000000 +0000' git commit -q -m 'vendor: Update vendored sources to igraph/igraph@008'
stale=$(git rev-parse HEAD)
cp "$HERE/series-fold.sh" scripts/series-fold.sh
GIT_COMMITTER_DATE='1700000000 +0000' git commit -q -a -m 'chore(series): Sync tooling with main'
echo 9 > src/vendor/cigraph/engine
GIT_COMMITTER_DATE='1700000000 +0000' git commit -q -a -m 'vendor: Update vendored sources to igraph/igraph@009'
synced=$(git rev-parse HEAD)
git checkout -q --detach "$bare"
echo 'f <- function() 7' > R/f.R
GIT_COMMITTER_DATE='1700000000 +0000' git commit -q -a -m 'fix: f() returns seven'
fix7=$(git rev-parse HEAD)
git checkout -q --detach "$stale"
sed -i 's/^one$/one (fixed)/' src/glue.cpp
GIT_COMMITTER_DATE='1700000000 +0000' git commit -q -a -m 'fix: The glue reads one correctly'
fix8=$(git rev-parse HEAD)
git checkout -q --detach "$synced"
set +e
scripts/series-fold.sh "$synced" --fold "$bare=$fix7" --fold "$stale=$fix8" > "$SCRATCH/out" 2>&1
st=$?
set -e
is "the fold finishes" "$st" 0
has "and says so" "$(cat "$SCRATCH/out")" "series-fold: done at"
is "the target without the script carries its fix" "$(git show HEAD~3:R/f.R)" 'f <- function() 7'
is "and so does the one with an older copy" "$(git show HEAD~2:src/glue.cpp | sed -n 1p)" "one (fixed)"
is "which never ran" "$(cat "$SCRATCH/stale.log" 2>/dev/null)" ""
is "the tip carries both" "$(git show HEAD:R/f.R) $(git show HEAD:src/glue.cpp | sed -n 1p)" 'f <- function() 7 one (fixed)'
is "and the git dir keeps nothing of the fold" "$(cd "$(git rev-parse --absolute-git-dir)" && ls -d series-fold* 2>/dev/null)" ""

echo "=== 10. a fold step that fails is run again by --continue"
# The --exec takes the copy's execute bit away after every commit, so the second
# fold step fails to start, as one would where the script was missing.
# shellcheck disable=SC2016  # the rebase's shell expands it, at every exec
sabotage='chmod -x "$(git rev-parse --absolute-git-dir)/series-fold.sh"'
copy=$(git rev-parse --absolute-git-dir)/series-fold.sh
git checkout -q --detach "$landing"
set +e
"$HERE/series-fold.sh" "$landing" --fold "$(v 2)=$fix2" --fold "$(v 4)=$fix4" --exec "$sabotage" > "$SCRATCH/out" 2>&1
st=$?
set -e
is "the replay stops at the failed step" "$st" 1
hasnt "and is not done" "$(cat "$SCRATCH/out")" "done at"
set +e
"$HERE/series-fold.sh" --continue > "$SCRATCH/out" 2>&1
st=$?
set -e
is "--continue runs the step again, which fails again" "$st" 1
hasnt "and is still not done" "$(cat "$SCRATCH/out")" "done at"
chmod +x "$copy"
"$HERE/series-fold.sh" --continue > "$SCRATCH/out" 2>&1 || { no "--continue finishes once the step can run"; cat "$SCRATCH/out"; }
has "and is done then" "$(cat "$SCRATCH/out")" "done at"
is "with both fixes folded" "$(git show HEAD~3:src/glue.cpp | sed -n 2p) $(git show HEAD~1:R/f.R)" "two (fixed) f <- function() 2"

echo "=== 11. a replay that ends without a fold is not done"
git checkout -q --detach "$landing"
set +e
"$HERE/series-fold.sh" "$landing" --fold "$(v 2)=$fix2" --fold "$(v 4)=$fix4" --exec "$sabotage" > /dev/null 2>&1
GIT_SEQUENCE_EDITOR="sed -i '/--apply/d'" git rebase --edit-todo
chmod +x "$copy"
"$HERE/series-fold.sh" --continue > "$SCRATCH/out" 2>&1
st=$?
set -e
is "--continue past a lost fold step ends with status 3" "$st" 3
hasnt "and is not done" "$(cat "$SCRATCH/out")" "done at"
has "naming the fix" "$(cat "$SCRATCH/out")" "the fix $(git rev-parse --short "$fix4") is not in"
is "the fold before it is in the result" "$(git show HEAD~3:src/glue.cpp | sed -n 2p)" "two (fixed)"
is "the landing is not moved" "$(git rev-parse "$landing")" "$landing"
git checkout -q --detach "$landing"
"$HERE/series-fold.sh" "$landing" --fold "$(v 4)=$fix4" > /dev/null 2>&1 || no "a fold starts again afterwards"

echo "=== 12. a fix that conflicts at its target is folded once, by --continue"
git checkout -q --detach "$(v 4)"
sed -i 's/^two$/two (v4)/' src/glue.cpp
GIT_COMMITTER_DATE='1700000000 +0000' git commit -q -a -m 'fix: The glue reads two as engine 4 does'
fix4b=$(git rev-parse HEAD)
git checkout -q --detach "$landing"
set +e
"$HERE/series-fold.sh" "$landing" --fold "$(v 2)=$fix2" --fold "$(v 4)=$fix4b:Folded: the glue reads two as engine 4 does." \
  > "$SCRATCH/out" 2>&1
st=$?
set -e
is "the fix stops at its target, where the fold below changed the same line" "$st" 1
has "and says so" "$(cat "$SCRATCH/out")" "does not apply at"
git show HEAD:src/glue.cpp | sed 's/^two (fixed)$/two (fixed, v4)/' > src/glue.cpp
git add src/glue.cpp
"$HERE/series-fold.sh" --continue > "$SCRATCH/out" 2>&1 || { no "--continue finishes"; cat "$SCRATCH/out"; }
has "and is done" "$(cat "$SCRATCH/out")" "done at"
has "naming the fold resolved by hand" "$(cat "$SCRATCH/out")" "$(git rev-parse --short "$fix4b") was resolved by hand"
is "the resolution is carried to the tip" "$(git show HEAD:src/glue.cpp | sed -n 2p)" "two (fixed, v4)"
is "the note is added once" "$(git log -1 --format=%B HEAD~1 | grep -c '^Folded: ')" 1
is "the landing keeps its length" "$(git rev-list --count "$main..HEAD")" 5

echo
echo "$pass passed, $fail failed"
[ "$fail" -eq 0 ]
