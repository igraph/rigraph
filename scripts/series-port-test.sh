#!/bin/bash
# Check which commits stage 4 offers, offline, against a synthetic remote and
# clone built here -- no network, no fixtures on disk.
#
# The question is what "`main` has it and the series does not" means. `git
# cherry` answers by patch-id over `mb..main`, which counts a commit `main`
# merged for its ancestry alone -- a merge whose tree is its first parent's, so
# nothing of the lineage it records ever entered main's tree. Porting one
# applies a tree from another era on top of this one. Four things are checked.
#
#   1. An ordinary `main` commit the series lacks is offered.
#   2. A commit that reached `main` only through an ancestry-only merge is not.
#   3. Nor is the ancestry-only merge itself.
#   4. A real merge is not an ancestry-only one: its side commits did reach
#      main's tree, so they are still offered. The test is the tree, not the
#      shape of the commit.
#   5. Release paperwork is held back whether or not it moves `Version:`:
#      notes written into NEWS.md for main's next release belong to the release
#      strand, and the series has no section to put them in. A commit that
#      edits DESCRIPTION without moving the version is package content and is
#      still offered.
#
# And one thing about *which* `main` answers. The series live in a fork whose
# `main` is a mirror the Pull app refreshes every six hours, so the fork's copy
# is routinely behind the canonical repository's. The walk reads the canonical
# one, so a commit merged since the last sync is offered rather than silently
# reverted by the tooling sync; with no canonical remote to read, the mirror is
# the fallback and answers with the subset it has.

set -euo pipefail

HERE=$(cd "$(dirname "$0")" && pwd)

SCRATCH=$(mktemp -d)
[ -n "${KEEP:-}" ] || trap 'rm -rf "$SCRATCH"' EXIT
[ -z "${KEEP:-}" ] || echo "scratch: $SCRATCH"

pass=0
fail=0
ok() { pass=$((pass + 1)); echo "  ok   $1"; }
no() { fail=$((fail + 1)); echo "  FAIL $1"; }
has() { case "$2" in *"$3"*) ok "$1" ;; *) no "$1"; echo "       missing: $3" ;; esac; }
hasnt() { case "$2" in *"$3"*) no "$1"; echo "     unexpected: $3" ;; *) ok "$1" ;; esac; }

# --- the fixture -----------------------------------------------------------
#
# A bare remote plus a clone, because stage 4 reads `origin/*`. The shape is
# `main` with three things above the series' seed: an ordinary commit, a
# lineage merged for its ancestry alone, and a lineage merged for its content.

REMOTE=$SCRATCH/remote.git
CANON=$SCRATCH/canonical.git
WORK=$SCRATCH/work
git init -q --bare -b main "$REMOTE"
git init -q --bare -b main "$CANON"

git init -q -b main "$WORK"
cd "$WORK"
git config user.name Test
git config user.email test@example.invalid
git config commit.gpgsign false
git remote add origin "$REMOTE"
git remote add upstream "$CANON"

mkdir -p scripts .github R
for s in series-port.sh setup-git.sh merge-version.sh series-config.sh series-lib.sh vendor-lib.sh; do cp "$HERE/$s" scripts/; done
chmod +x scripts/*.sh
echo 'DESCRIPTION merge=ours-version' > .gitattributes

# The attribute is committed and the name -> command mapping is not, so a fresh
# clone has the first and never the second. Register it here, as every real
# clone does.
scripts/setup-git.sh >/dev/null

printf 'Package: duckdb\nVersion: 1.0.0\n' > DESCRIPTION
echo 'workflow' > .github/ci.yml
echo 'foo <- function() 1' > R/foo.R
git add -A
git commit -qm 'chore: The base both lineages share'
git branch fork-point

# --- the series: a seed on `main`, so the walk is not frozen ----------------

git checkout -q -b s-dev
echo 'flavored' > R/flavor.R
git add -A
git commit -qm 'chore: Update flavor patch to duckdb.test'

# --- what `main` gains ------------------------------------------------------

git checkout -q main
echo 'foo <- function() 2' > R/foo.R
git add -A
git commit -qm 'fix: An ordinary commit the series lacks'

# A lineage from another era, merged for its ancestry alone: `-s ours` keeps
# main's tree, so nothing of it is in the package `main` builds.
git checkout -q -b old-line fork-point
echo 'ancient <- function() 1' > R/ancient.R
git add -A
git commit -qm 'feat: Ancient work that never reached the tree'
echo 'ancient <- function() 2' > R/ancient.R
git add -A
git commit -qm 'fix: More of the same'
git checkout -q main
git merge -q -s ours --no-ff -m 'chore: Record the old tag on the mainline' old-line

# A lineage merged for its content: an ordinary merge, whose commits did reach
# main's tree and are therefore still the series' to take.
git checkout -q -b live-line main
echo 'live <- function() 1' > R/live.R
git add -A
git commit -qm 'feat: Live work that did reach the tree'
git checkout -q main
git merge -q --no-ff -m 'chore: Merge the live line' live-line

# The release strand, in the three shapes that reach `main`: fledge's bump,
# the notes written beside it before the bump lands, and a DESCRIPTION edit
# that is not a bump at all.
printf '# duckdb 1.0.0\n\n- Something a user meets.\n' > NEWS.md
git add -A
git commit -qm 'docs(news): Bullets for what merged since the last bump'

printf 'Package: duckdb\nVersion: 1.0.1\n' > DESCRIPTION
printf '# duckdb 1.0.1\n\n- Something a user meets.\n' > NEWS.md
git add -A
git commit -qm 'fledge: Bump version to 1.0.1'

printf 'Package: duckdb\nVersion: 1.0.1\nImports: DBI\n' > DESCRIPTION
git add -A
git commit -qm 'chore: Declare the dependency the package gained'

git push -q origin main s-dev
git push -q upstream main

# --- the mirror falls behind ------------------------------------------------
#
# One more commit reaches the canonical repository and not the fork's copy of
# `main`, which is the state the fork is in for most of the Pull app's cycle.

echo 'foo <- function() 3' > R/foo.R
git add -A
git commit -qm 'fix: A commit the mirror has not picked up yet'
git push -q upstream main
git checkout -q s-dev

# --- the read ---------------------------------------------------------------

out=$(scripts/series-port.sh s 2>&1)
[ -z "${KEEP:-}" ] || echo "$out"

echo "series-port.sh: which commits stage 4 offers"
has "an ordinary commit is offered" "$out" 'An ordinary commit the series lacks'
hasnt "ancestry-only content is not offered" "$out" 'Ancient work that never reached the tree'
hasnt "nor the rest of that lineage" "$out" 'More of the same'
hasnt "nor the ancestry-only merge itself" "$out" 'Record the old tag on the mainline'
has "a real merge's content is still offered" "$out" 'Live work that did reach the tree'

# The class of the listed commit whose subject contains the given text.
klass() { echo "$out" | grep -F -- "$2" | head -n 1 | awk '{print $1}'; }
is() { # <name> <subject text> <expected class>
  local got
  got=$(klass "$1" "$2")
  if [ "$got" = "$3" ]; then ok "$1"; else no "$1"; echo "       $3 expected, got ${got:-nothing}"; fi
}

echo
echo "series-port.sh: what the release strand covers"
is "fledge's bump is release paperwork" 'Bump version to 1.0.1' VERSION
is "so are notes written without a bump" \
  'Bullets for what merged since the last bump' VERSION
is "a DESCRIPTION edit that is not a bump is package content" \
  'Declare the dependency the package gained' OTHER

echo
echo "series-port.sh: which \`main\` answers"
has "a commit the mirror lacks is offered" "$out" 'A commit the mirror has not picked up yet'
hasnt "and a behind mirror is not a refusal" "$out" 'commit(s) behind'

# With no canonical remote to read, the mirror answers -- with the subset it
# has, and saying so, rather than with a refusal.
out_fork=$(SERIES_CANONICAL= scripts/series-port.sh s 2>&1)
[ -z "${KEEP:-}" ] || echo "$out_fork"
hasnt "the fallback offers only what the mirror has" "$out_fork" 'A commit the mirror has not picked up yet'
has "and still offers what it does have" "$out_fork" 'An ordinary commit the series lacks'

echo
echo "series-port.sh: a line parked in \`main\`'s declaration"
# The series is seeded on `main`, so its lineage says it is not frozen, and a
# line parked by a landing is in exactly that shape: `main` keeps the history
# its seed sits on. The declaration is what says it parked.
git checkout -q main
cat > scripts/series.yaml <<'EOF'
flavors:
  - flavor: duckdb.test
    kind: dev
    series: s
    releases_from: s-baseline
    publishes_from: s-green

  - flavor: duckdb.other
    kind: dev
    series: other
    releases_from: main
    publishes_from: other-green
EOF
git add scripts/series.yaml
git commit -qm 'chore: Park the line of series s'
git push -q upstream main
git checkout -q s-dev
out_parked=$(scripts/series-port.sh s 2>&1)
[ -z "${KEEP:-}" ] || echo "$out_parked"
has "a parked line is frozen" "$out_parked" "s: frozen (parked on s-baseline)"
hasnt "and offers no R-side commit" "$out_parked" 'An ordinary commit the series lacks'

# Its forward is the same line, parked with it.
git push -q origin s-dev:refs/heads/s-fwd-dev
out_fwd=$(scripts/series-port.sh s-fwd 2>&1)
[ -z "${KEEP:-}" ] || echo "$out_fwd"
has "and so is its forward" "$out_fwd" "s-fwd: frozen (parked on s-baseline)"

# A line declared on `main` is live, and says nothing about parking.
git checkout -q main
sed -i 's/releases_from: s-baseline/releases_from: main/' scripts/series.yaml
git add scripts/series.yaml
git commit -qm 'chore: Release the line of series s from main again'
git push -q upstream main
git checkout -q s-dev
out_live=$(scripts/series-port.sh s 2>&1)
[ -z "${KEEP:-}" ] || echo "$out_live"
hasnt "a line releasing from main is not frozen" "$out_live" "frozen"
has "and is offered main's R side" "$out_live" 'An ordinary commit the series lacks'

echo
echo "$pass passed, $fail failed"
[ "$fail" -eq 0 ]
