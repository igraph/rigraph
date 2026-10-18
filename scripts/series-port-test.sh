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
#
# And one thing about what --apply writes. A flavored series carries
# scripts/flavor.patch spelled for its own package, and the tooling sync holds
# it to `main`'s copy spelled the same way, on -dev and on the buffer, rather
# than putting `main`'s template back.

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
same() { # <name> <got> <want>
  if [ "$2" = "$3" ]; then ok "$1"; else no "$1"; { diff <(echo "$3") <(echo "$2") || true; } | sed 's/^/       /'; fi
}

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

printf 'Package: igraph\nVersion: 1.0.0\n' > DESCRIPTION
echo 'workflow' > .github/ci.yml
echo 'foo <- function() 1' > R/foo.R
git add -A
git commit -qm 'chore: The base both lineages share'
git branch fork-point

# --- the series: a seed on `main`, so the walk is not frozen ----------------

git checkout -q -b s-dev
echo 'flavored' > R/flavor.R
git add -A
git commit -qm 'chore: Update flavor patch to igraph.test'

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
  - flavor: igraph.test
    kind: dev
    series: s
    releases_from: s-baseline
    publishes_from: s-green

  - flavor: igraph.other
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
echo "series-port.sh --apply: the tooling sync keeps the series' flavor"
# A seed rewrites one tooling file: scripts/flavor.sh spells the template's
# `igraph.1.3` in scripts/flavor.patch as the series' own package. The sync
# holds the series to main's copy spelled the same way, so a port neither
# puts the template back nor mints a sync where the spelling is all that
# differs. A fixture of its own, with a buffer, so --apply runs to the end.

AREMOTE=$SCRATCH/apply-remote.git
ACANON=$SCRATCH/apply-canonical.git
AWORK=$SCRATCH/apply-work
git init -q --bare -b main "$AREMOTE"
git init -q --bare -b main "$ACANON"
git init -q -b main "$AWORK"
cd "$AWORK"
git config user.name Test
git config user.email test@example.invalid
git config commit.gpgsign false
git remote add origin "$AREMOTE"
git remote add upstream "$ACANON"

# The sync names every tooling path, so the fixture has all three.
mkdir -p scripts .github .claude
echo '{}' > .claude/settings.json
for s in series-port.sh series-patch-sync.sh setup-git.sh merge-version.sh series-config.sh series-lib.sh vendor-lib.sh; do
  cp "$HERE/$s" scripts/
done
chmod +x scripts/*.sh
echo 'DESCRIPTION merge=ours-version' > .gitattributes
scripts/setup-git.sh >/dev/null

printf 'Package: igraph\nVersion: 1.0.0\n' > DESCRIPTION
echo 'workflow' > .github/ci.yml
# The template's flavored lines come first, so a hunk `main` appends merges
# onto the flavored copy without touching them.
cat > scripts/flavor.patch <<'EOF'
diff --git a/DESCRIPTION b/DESCRIPTION
--- a/DESCRIPTION
+++ b/DESCRIPTION
@@ -1 +1 @@
-Package: igraph
+Package: igraph.1.3
diff --git a/src/igraph_types.hpp b/src/igraph_1_3_types.hpp
similarity index 100%
rename from src/igraph_types.hpp
rename to src/igraph_1_3_types.hpp
diff --git a/tests/testthat.R b/tests/testthat.R
--- a/tests/testthat.R
+++ b/tests/testthat.R
@@ -1 +1 @@
-test_check("igraph")
+test_check(pkg)
EOF
git add -A
git commit -qm 'chore: The base the series is seeded on'

# The seed's two flavor commits, spelled as scripts/flavor.sh spells them.
spell() { sed -e 's/igraph\.1\.3/igraph.test/g' -e 's/igraph_1_3/igraph_test/g'; }
git checkout -q -b s-dev
spell < scripts/flavor.patch > scripts/flavor.patch.new
mv scripts/flavor.patch.new scripts/flavor.patch
git commit -qam 'chore: Update flavor patch to test'
sed -i 's/^Package: igraph$/Package: igraph.test/' DESCRIPTION
git commit -qam 'chore: Update version to test'
seeded=$(git rev-parse HEAD)
git push -q origin main s-dev s-dev:refs/heads/s-build
git push -q upstream main

out_seed=$(scripts/series-port.sh s --apply 2>&1) && st=0 || st=$?
[ -z "${KEEP:-}" ] || echo "$out_seed"
same "--apply on a fresh seed succeeds" "$st" 0
has "a fresh seed's tooling is main's" "$out_seed" 'tooling: identical to main'
has "so is its buffer's" "$out_seed" 'buffer tooling: identical to main'
same "and a port mints nothing on -dev" "$(git rev-parse origin/s-dev)" "$seeded"
same "nor on the buffer" "$(git rev-parse origin/s-build)" "$seeded"

# `main` moves its tooling twice: a workflow edit, and a hunk appended to the
# flavor template, which arrives spelled `igraph.1.3` whether it is picked or
# synced.
git checkout -q main
echo 'workflow 2' > .github/ci.yml
git commit -qam 'ci: A workflow change the series lacks'
cat >> scripts/flavor.patch <<'EOF'
diff --git a/NAMESPACE b/NAMESPACE
--- a/NAMESPACE
+++ b/NAMESPACE
@@ -1 +1 @@
-useDynLib(igraph, .registration = TRUE)
+useDynLib(igraph.1.3, .registration = TRUE)
EOF
git commit -qam 'fix(flavor): Rename the package in NAMESPACE too'
git push -q origin main
git push -q upstream main
git checkout -q s-dev

out_port=$(scripts/series-port.sh s --apply 2>&1) && st=0 || st=$?
[ -z "${KEEP:-}" ] || echo "$out_port"
same "--apply onto a moved main succeeds" "$st" 0
want=$(git show upstream/main:scripts/flavor.patch | spell)
same "-dev's flavor patch is main's, spelled for the series" \
  "$(git show origin/s-dev:scripts/flavor.patch)" "$want"
same "and the buffer's" "$(git show origin/s-build:scripts/flavor.patch)" "$want"
same "the rest of -dev's tooling is main's" \
  "$(git diff --name-only origin/s-dev upstream/main -- .github scripts)" scripts/flavor.patch
same "and of the buffer's" \
  "$(git diff --name-only origin/s-build upstream/main -- .github scripts)" scripts/flavor.patch

echo
echo "$pass passed, $fail failed"
[ "$fail" -eq 0 ]
