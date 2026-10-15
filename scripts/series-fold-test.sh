#!/bin/bash
# Check scripts/series-fold.sh offline, against a synthetic landing built here:
# no network, no fixtures on disk.
#
# The claim the script makes is that a fix written on the landing commit that
# introduced a defect ends up in that commit and in every commit above it,
# and nowhere else, with the landing's shape and dates kept. Seven things are
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

mkdir -p src/duckdb R
printf 'one\ntwo\nthree\nfour\nfive\n' > src/glue.cpp
echo 0 > src/duckdb/engine
echo 'f <- function() 1' > R/f.R
git add -A
git commit -q -m 'main'
main=$(git rev-parse HEAD)

for i in 1 2 3 4 5; do
  echo "$i" > src/duckdb/engine
  [ "$i" != 3 ] || sed -i 's/^four$/four (adapted)/' src/glue.cpp
  GIT_AUTHOR_DATE="$((1700000000 + i * 100)) +0000" git commit -q -a -m "vendor: Update vendored sources to duckdb/duckdb@00$i

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
is "the engine is each commit's own" "$(for i in 4 3 2 1 0; do git show "$new~$i:src/duckdb/engine"; done | tr '\n' ' ')" "1 2 3 4 5 "

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

echo
echo "$pass passed, $fail failed"
[ "$fail" -eq 0 ]
