#!/bin/bash
# Check scripts/series-vendor.sh offline, against a synthetic series built here:
# no network, no fixtures on disk. The vendor strand is pure vendoring, vendored
# once and carried by a rebase (handbook/branches/model/README.md), and the
# three operations are checked in the order a series meets them.
#
#   1. --init derives `<S>-vendor` from a buffer: one commit per buffer commit
#      that touches the vendor paths, with those paths blob for blob and nothing
#      else -- no counter, no glue -- and a tooling commit is skipped.
#   2. The default extends the buffer from the strand: a strand commit vendored
#      after the derivation is picked onto `-build` with its counter stamped and
#      the glue left alone, a patch carry is picked without a counter, and a
#      level buffer picks nothing.
#   3. --forward onto a seed that vendors an engine the strand has: the commits
#      above it are rebased, each twin equal under the vendor paths and the
#      seed's own R side kept.
#   4. --forward onto a seed off the strand, a rewind: the foot is written whole
#      and the rest picked, with the same equalities.
#   5. --forward onto a seed at the strand's tip: an empty strand at the seed.
#
# Ported from duckdb/duckdb-r (.series-source), against rigraph's configuration:
# the vendor paths under src/vendor/ and patch/, igraph's version header, and
# `series_regenerate()` run on every pick, with Makefile-cigraph and R stubbed so
# that what it writes is the vendored tree's and nothing is built. Claim 2 also
# checks that the pick is regenerated. rigraph does not forward yet, so 3 to 5
# check upstream's path against this configuration and nothing calls it here.

set -euo pipefail

HERE=$(cd "$(dirname "$0")" && pwd)
# shellcheck source=series-lib.sh
. "$HERE/series-lib.sh"

SCRATCH=$(mktemp -d)
[ -n "${KEEP:-}" ] || trap 'rm -rf "$SCRATCH"' EXIT
[ -z "${KEEP:-}" ] || echo "scratch: $SCRATCH"

pass=0
fail=0
ok() { pass=$((pass + 1)); echo "  ok   $1"; }
no() { fail=$((fail + 1)); echo "  FAIL $1"; }
yes() { if "${@:2}"; then ok "$1"; else no "$1"; fi; }
hasnt() { case "$2" in *"$3"*) no "$1"; echo "     unexpected: $3" ;; *) ok "$1" ;; esac; }
is() { if [ "$2" = "$3" ]; then ok "$1"; else no "$1"; echo "       got:  $2"; echo "       want: $3"; fi; }
has() { case "$2" in *"$3"*) ok "$1" ;; *) no "$1"; echo "       missing: $3"; printf '%s\n' "$2" | sed 's/^/       | /' ;; esac; }

# --- the fixture -----------------------------------------------------------

REMOTE=$SCRATCH/remote.git
WORK=$SCRATCH/work
git init -q --bare -b main "$REMOTE"
git init -q -b main "$WORK"
cd "$WORK"
git config user.name Test
git config user.email test@example.invalid
git config commit.gpgsign false
git remote add origin "$REMOTE"

mkdir -p scripts R src/vendor/cigraph src/vendor/io patch
for s in series-vendor.sh series-config.sh series-lib.sh vendor-lib.sh; do cp "$HERE/$s" scripts/; done
chmod +x scripts/*.sh

# What `series_regenerate()` runs in the buffer: Makefile-cigraph's Stimulus and
# source-list targets, and R for the cpp11 registration, stubbed. The interface
# is written from the vendored tree, so a pick that vendors changes it.
printf '%s\n' '.PHONY: all src/rinterface.c r_wrappers src/sources.mk' 'all:' \
  'src/rinterface.c:' '	cp src/vendor/cigraph/engine.c $@' \
  'r_wrappers:' '	cp src/vendor/cigraph/engine.c R/aaa-auto.R' \
  'src/sources.mk:' '	ls src/vendor/cigraph > src/sources-igraph.mk' > Makefile-cigraph
STUBS=$SCRATCH/stubs
mkdir -p "$STUBS"
printf '#!/bin/sh\nexit 0\n' > "$STUBS/Rscript"
chmod +x "$STUBS/Rscript"
export PATH=$STUBS:$PATH

desc() { printf 'Package: %s\nVersion: %s\n' "$1" "$2" > DESCRIPTION; }
engine() { # <id> <version>
  echo "engine $1" > src/vendor/cigraph/engine.c
  echo "#define IGRAPH_VERSION \"$2\"" > src/vendor/igraph_version.h
  echo "parser for $1" > src/vendor/io/parser.c
}
commit() { git add -A; git commit -qm "$1"; git rev-parse HEAD; }
vendor_paths() { git ls-tree -r "$1" -- "${series_vendor_paths[@]}" | awk '{ print $3, $4 }'; }
same_vendor() { [ "$(vendor_paths "$1")" = "$(vendor_paths "$2")" ]; }

desc igraph 1.5.5.9000
engine aaaa111 1.0.0
echo 'glue 1' > src/glue.cpp
echo 'tool v1' > scripts/tool.sh
echo 'foo <- function() 1' > R/foo.R
commit 'vendor: Update vendored sources to igraph/igraph@aaaa111 (#1)' > /dev/null
B=$(git rev-parse HEAD)

seed() { # <base> <flavor>: the seed on it, HEAD left on its third commit
  git checkout -q --detach "$1"
  echo "rename $2" > scripts/flavor.patch
  commit "chore: Update flavor patch to $2" > /dev/null
  desc "$2" "$(git show HEAD:DESCRIPTION | sed -n 's/^Version: //p')"
  commit "chore: Update version to ${2#igraph.}" > /dev/null
  desc "$2" 1.99.99.9000.0
  commit 'chore: Add fifth version component'
}
SEED=$(seed "$B" igraph.2.0.dev)

# The buffer: three vendor commits with a glue fix in the second, a patch carry
# between the second and the third, and a tooling sync that touches no vendor path.
bump() { desc igraph.2.0.dev "1.99.99.9000.$1"; }
engine bbbb001 1.0.1-1-gbbbb001; bump 1
V1=$(commit 'vendor: Update vendored sources to igraph/igraph@bbbb001 (#2)')
engine bbbb002 1.0.1-2-gbbbb002; bump 2
echo 'glue 2, as bbbb002 needs' > src/glue.cpp
git add -A
git commit -q -F - <<'EOF'
vendor: Update vendored sources to igraph/igraph@bbbb002 (#3)

Date: 2026-01-02

R-side fix
----------
The glue reads two, as bbbb002 answers.
EOF
V2=$(git rev-parse HEAD)
echo 'patched' >> src/vendor/cigraph/engine.c
echo 'diff' > patch/0001-fix.patch
P1=$(commit 'chore(patch): Carry 0001-fix.patch onto the buffer')
echo 'tool v2' > scripts/tool.sh
commit 'chore: Sync tooling from main' > /dev/null
engine bbbb003 1.0.1-3-gbbbb003; bump 3
V3=$(commit 'vendor: Update vendored sources to igraph/igraph@bbbb003 (#4)')
git push -q origin "HEAD:refs/heads/v2.0-x-build" "$SEED:refs/heads/v2.0-x-dev" "$B:refs/heads/main"
git fetch -q origin

run() { set +e; scripts/series-vendor.sh "$@" 2>&1; echo "EXIT=$?"; set -e; }

echo "=== 1. --init derives the strand from the buffer"
out=$(run v2.0-x --init --push)
[ -z "${KEEP:-}" ] || echo "$out"
has "it exits 0" "$out" "EXIT=0"
has "four commits above the seed" "$out" "v2.0-x-vendor: 4 commit(s) above $(git rev-parse --short "$SEED")"
git fetch -q origin
VENDOR=origin/v2.0-x-vendor
is "pushed with four commits" "$(git rev-list --count "$SEED..$VENDOR")" 4
is "the subjects are the buffer's, the tooling sync left out" \
  "$(git log --reverse --format=%s "$SEED..$VENDOR" | cut -c1-40 | tr '\n' '|')" \
  "vendor: Update vendored sources to igrap|vendor: Update vendored sources to igrap|chore(patch): Carry 0001-fix.patch onto |vendor: Update vendored sources to igrap|"
n=0; for pair in "$V1 $VENDOR~3" "$V2 $VENDOR~2" "$P1 $VENDOR~1" "$V3 $VENDOR"; do
  # shellcheck disable=SC2086
  same_vendor $pair && n=$((n + 1))
done
is "each strand commit carries its twin's vendor paths blob for blob" "$n" 4
is "and never the counter" "$(git show "$VENDOR:DESCRIPTION" | sed -n 's/^Version: //p')" 1.99.99.9000.0
is "nor the glue" "$(git show "$VENDOR:src/glue.cpp")" "glue 1"
is "the authors travel" "$(git log -1 --format=%an "$VENDOR")" Test
hasnt "the message stops before the R-side fix section, which explains glue the strand lacks" \
  "$(git log -1 --format=%B "$VENDOR~2")" "R-side fix"
has "and keeps what precedes it" "$(git log -1 --format=%B "$VENDOR~2")" "Date: 2026-01-02"
out=$(run v2.0-x --init)
has "a second --init refuses" "$out" "EXIT=1"
has "and says why" "$out" "v2.0-x-vendor exists on origin"

echo
echo "=== 2. the buffer is extended from the strand"
git checkout -q --detach "$VENDOR"
engine bbbb004 1.0.1-4-gbbbb004
V4=$(commit 'vendor: Update vendored sources to igraph/igraph@bbbb004 (#5)')
echo 'diff two' > patch/0002-fix.patch
echo 'patched twice' >> src/vendor/cigraph/engine.c
P2=$(commit 'chore(patch): Carry 0002-fix.patch onto the buffer')
git push -q origin "HEAD:refs/heads/v2.0-x-vendor"
git fetch -q origin
git checkout -q --detach origin/v2.0-x-build
out=$(run v2.0-x --no-check-glue --push)
[ -z "${KEEP:-}" ] || echo "$out"
has "it exits 0" "$out" "EXIT=0"
has "two picks" "$out" "v2.0-x-build: 2 commit(s) picked from v2.0-x-vendor"
git fetch -q origin
BUILD=origin/v2.0-x-build
is "the buffer grew by two" "$(git rev-list --count "$V3..$BUILD")" 2
is "the vendor commit's counter is stamped" "$(git show "$BUILD~1:DESCRIPTION" | sed -n 's/^Version: //p')" 1.99.99.9000.4
is "the patch carry's is not" "$(git show "$BUILD:DESCRIPTION" | sed -n 's/^Version: //p')" 1.99.99.9000.4
yes "the vendor commit's paths are the strand's" same_vendor "$V4" "$BUILD~1"
yes "and so are the carry's" same_vendor "$P2" "$BUILD"
is "the buffer's glue is kept" "$(git show "$BUILD:src/glue.cpp")" "glue 2, as bbbb002 needs"
is "and so is its tooling" "$(git show "$BUILD:scripts/tool.sh")" "tool v2"
is "the subject is the strand's" "$(git log -1 --format=%s "$BUILD~1")" "$(git log -1 --format=%s "$V4")"
is "the pick is regenerated in the buffer" "$(git show "$BUILD~1:src/rinterface.c")" "engine bbbb004"
is "and so is the carry above it" "$(git show "$BUILD:R/aaa-auto.R" | head -n 1)" "engine bbbb004"
out=$(run v2.0-x --no-check-glue)
has "a level buffer picks nothing" "$out" "nothing to pick"
git checkout -q --detach "$SEED"
out=$(run v2.0-x --no-check-glue)
has "a worktree below the buffer is refused" "$out" "EXIT=1"
has "and told where to stand" "$out" "HEAD is not at or above v2.0-x-build"

echo
echo "=== 3. --forward onto a seed that vendors an engine the strand has"
# main moved on to the strand's second engine, with its own R side and glue.
git checkout -q --detach "$B"
engine bbbb002 1.0.1-2-gbbbb002
echo 'foo <- function() 2' > R/foo.R
echo 'glue main' > src/glue.cpp
M=$(commit 'vendor: Update vendored sources to igraph/igraph@bbbb002 (#6)')
NEWSEED=$(seed "$M" igraph.2.0.dev)
out=$(run v2.0-x --forward "$NEWSEED" --push)
[ -z "${KEEP:-}" ] || echo "$out"
has "it exits 0" "$out" "EXIT=0"
has "the seed's engine is found on the strand" "$out" "vendors bbbb002, which v2.0-x-vendor has as $(git rev-parse --short "$VENDOR~4")"
has "and the commits above it are rebased" "$out" "rebasing 4 commit(s) above it onto the seed"
git fetch -q origin
FWD=origin/v2.0-x-fwd-vendor
is "four commits on the new seed" "$(git rev-list --count "$NEWSEED..$FWD")" 4
is "the seed is theirs" "$(git merge-base "$NEWSEED" "$FWD")" "$NEWSEED"
n=0; for pair in "$P1 $FWD~3" "$V3 $FWD~2" "$V4 $FWD~1" "$P2 $FWD"; do
  # shellcheck disable=SC2086
  same_vendor $pair && n=$((n + 1))
done
is "each twin is equal under the vendor paths" "$n" 4
is "the new seed's R side is kept" "$(git show "$FWD:R/foo.R")" "foo <- function() 2"
is "and its glue" "$(git show "$FWD:src/glue.cpp")" "glue main"
is "the subjects travel" "$(git log -1 --format=%s "$FWD~2")" "$(git log -1 --format=%s "$V3")"

echo
echo "=== 4. --forward onto a seed off the strand: a rewind"
git checkout -q --detach "$B"
engine aaaa112 1.0.1
echo 'foo <- function() 3' > R/foo.R
M2=$(commit 'vendor: Update vendored sources to igraph/igraph@aaaa112 (#7)')
RWSEED=$(seed "$M2" igraph.2.0.dev)
out=$(run v2.0-x --forward "$RWSEED" --push)
[ -z "${KEEP:-}" ] || echo "$out"
has "it exits 0" "$out" "EXIT=0"
has "the seed's engine is not on the strand" "$out" "vendors aaaa112, which v2.0-x-vendor does not have: a rewind"
has "the foot is written whole and the rest picked" "$out" "the foot $(git rev-parse --short "$VENDOR~5") is written on the seed whole, and 5 commit(s) cherry-picked above it"
git fetch -q origin
FWD=origin/v2.0-x-fwd-vendor
is "six commits on the rewind seed" "$(git rev-list --count "$RWSEED..$FWD")" 6
yes "the foot carries the strand's first engine whole" same_vendor "$V1" "$FWD~5"
is "the foot's subject is the strand's" "$(git log -1 --format=%s "$FWD~5")" "$(git log -1 --format=%s "$V1")"
n=0; for pair in "$V2 $FWD~4" "$P1 $FWD~3" "$V3 $FWD~2" "$V4 $FWD~1" "$P2 $FWD"; do
  # shellcheck disable=SC2086
  same_vendor $pair && n=$((n + 1))
done
is "each pick is equal to its twin under the vendor paths" "$n" 5
is "the rewind seed's R side is kept" "$(git show "$FWD:R/foo.R")" "foo <- function() 3"
is "the counter is the seed's throughout" "$(git log --format=%H "$RWSEED..$FWD" | while read -r c; do git show "$c:DESCRIPTION" | sed -n 's/^Version: //p'; done | sort -u)" 1.99.99.9000.0
has "the ref was force-pushed under a lease" "$out" "forced update"

echo
echo "=== 5. --forward onto a seed at the strand's tip"
# main's tree is the strand's at its newest vendor commit, the retired patch's
# entry still there.
git checkout -q --detach "$B"
mkdir -p patch
engine bbbb004 1.0.1-4-gbbbb004
echo 'diff' > patch/0001-fix.patch
M3=$(commit 'vendor: Update vendored sources to igraph/igraph@bbbb004 (#8)')
TIPSEED=$(seed "$M3" igraph.2.0.dev)
out=$(run v2.0-x --forward "$TIPSEED")
[ -z "${KEEP:-}" ] || echo "$out"
has "it exits 0" "$out" "EXIT=0"
has "the strand's commit for the engine is the newest vendor commit" "$out" "which v2.0-x-vendor has as $(git rev-parse --short "$VENDOR~1")"
has "one commit, the carry above it, is rebased" "$out" "rebasing 1 commit(s) above it onto the seed"
is "the local ref is written" "$(git rev-list --count "$TIPSEED..refs/heads/v2.0-x-fwd-vendor")" 1
has "and not pushed" "$out" "Not pushed"

echo
echo "$pass passed, $fail failed"
[ "$fail" -eq 0 ]
