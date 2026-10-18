#!/bin/bash
# Check scripts/series-patch-sync.sh offline, against a synthetic series built
# here: no network, no fixtures on disk. The carry lands on the vendor strand
# where the series has one (handbook/branches/model/README.md), and on the
# buffer where it has none.
#
#   1. The report: one entry of each kind -- carry, satisfied, stale,
#      superseded, edited, buffer-own -- read by test-applying against the
#      strand's tree, and nothing written without --apply.
#   2. --apply: one strand commit holding the carried entry with its effect,
#      the satisfied entry alone, what the generator derives from the patched
#      tree, and nothing the generator left outside the vendor paths.
#   3. A series without a strand takes the carry onto its buffer, as before.

set -euo pipefail

HERE=$(cd "$(dirname "$0")" && pwd)

SCRATCH=$(mktemp -d)
[ -n "${KEEP:-}" ] || trap 'rm -rf "$SCRATCH"' EXIT
[ -z "${KEEP:-}" ] || echo "scratch: $SCRATCH"

pass=0
fail=0
ok() { pass=$((pass + 1)); echo "  ok   $1"; }
no() { fail=$((fail + 1)); echo "  FAIL $1"; }
is() { if [ "$2" = "$3" ]; then ok "$1"; else no "$1"; echo "       got:  $2"; echo "       want: $3"; fi; }
has() { case "$2" in *"$3"*) ok "$1" ;; *) no "$1"; echo "       missing: $3"; printf '%s\n' "$2" | sed 's/^/       | /' ;; esac; }
hasnt() { case "$2" in *"$3"*) no "$1"; echo "     unexpected: $3" ;; *) ok "$1" ;; esac; }

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

mkdir -p scripts src/vendor/cigraph patch
for s in series-patch-sync.sh series-config.sh series-lib.sh vendor-lib.sh; do cp "$HERE/$s" scripts/; done
chmod +x scripts/*.sh
# The generator's strand half, stubbed: it derives a file under the vendor
# paths from the patched tree, and leaves a byproduct outside them.
cat >> scripts/series-config.sh <<'EOF'
series_generate_derived() {
  echo "derived from: $(head -n 2 src/vendor/cigraph/a.cpp | tail -n 1)" > src/vendor/cigraph/derived.txt
  echo byproduct > byproduct.txt
}
EOF

commit() { git add -A; git commit -qm "$1"; git rev-parse HEAD; }
# mkpatch <entry> <path> <old> <new>: a unified diff `patch -p1` applies.
mkpatch() {
  printf '%b' "$3" > "$SCRATCH/old"
  printf '%b' "$4" > "$SCRATCH/new"
  { printf -- '--- a/%s\n+++ b/%s\n' "$2" "$2"; diff -u "$SCRATCH/old" "$SCRATCH/new" | tail -n +3 || true; } > "patch/$1"
}

printf 'one\ntwo\nthree\n' > src/vendor/cigraph/a.cpp
printf 'alpha\nbeta\n' > src/vendor/cigraph/b.cpp
printf 'x\ny\n' > src/vendor/cigraph/c.cpp
echo 'Package: x' > DESCRIPTION
commit 'vendor: Update vendored sources to igraph/igraph@aaaa111' > /dev/null
echo 'Version: 1.0.0.0.0' >> DESCRIPTION
commit 'chore: Add fifth version component' > /dev/null
SEED=$(git rev-parse HEAD)

# The strand: `b.cpp` already carries what the satisfied entry does, and the
# strand's own entry speaks for `c.cpp`.
printf 'alpha\nbeta fixed\n' > src/vendor/cigraph/b.cpp
mkpatch 0004-own.patch src/vendor/cigraph/c.cpp 'x\ny\n' 'x\ny\nz\n'
mkpatch 0006-edited.patch src/vendor/cigraph/a.cpp 'three\n' 'three\nold\n'
STRAND=$(commit 'vendor: Update vendored sources to igraph/igraph@bbbb222')

# `-dev`: the candidates, one of each kind, and the edited entry's new version.
git checkout -q --detach "$SEED"
mkdir -p patch
mkpatch 0001-carry.patch src/vendor/cigraph/a.cpp 'one\ntwo\nthree\n' 'one\ntwo patched\nthree\n'
mkpatch 0002-satisfied.patch src/vendor/cigraph/b.cpp 'alpha\nbeta\n' 'alpha\nbeta fixed\n'
mkpatch 0003-stale.patch src/vendor/cigraph/a.cpp 'nine\n' 'ten\n'
mkpatch 0005-super.patch src/vendor/cigraph/c.cpp 'x\ny\n' 'x\nY\n'
mkpatch 0006-edited.patch src/vendor/cigraph/a.cpp 'three\n' 'three\nnew\n'
DEV=$(commit 'fix: patches arrived by port')

git push -q origin "$STRAND:refs/heads/v2.0-x-vendor" "$STRAND:refs/heads/v2.0-x-build" "$DEV:refs/heads/v2.0-x-dev" \
  "$SEED:refs/heads/v2.0-y-build" "$DEV:refs/heads/v2.0-y-dev" "$SEED:refs/heads/main"
git fetch -q origin
git checkout -q main 2>/dev/null || git checkout -q -b main "$SEED"

run() { set +e; scripts/series-patch-sync.sh "$@" 2>&1; echo "EXIT=$?"; set -e; }

echo "=== 1. the report, read against the strand"
out=$(run v2.0-x)
[ -z "${KEEP:-}" ] || echo "$out"
has "it exits 0" "$out" "EXIT=0"
has "the entry that applies is a carry" "$out" "carry       patch/0001-carry.patch"
has "the one whose effect is there is satisfied" "$out" "satisfied   patch/0002-satisfied.patch"
has "the one upstream moved from under is stale" "$out" "stale       patch/0003-stale.patch"
has "the one touching a file the strand's own entry speaks for supersedes" "$out" "supersedes  patch/0005-super.patch"
has "the one both carry in different versions is edited" "$out" "edited      patch/0006-edited.patch"
has "and the strand's own is listed" "$out" "buffer-own  patch/0004-own.patch"
has "nothing is written without --apply" "$out" "(report only"
is "the strand did not move" "$(git ls-remote origin refs/heads/v2.0-x-vendor | cut -f1)" "$STRAND"

echo
echo "=== 2. --apply carries onto the strand"
out=$(run v2.0-x --apply)
[ -z "${KEEP:-}" ] || echo "$out"
has "it exits 0" "$out" "EXIT=0"
has "the strand is pushed" "$out" "vendor -> "
git fetch -q origin
V=origin/v2.0-x-vendor
is "one commit above the strand" "$(git rev-list --count "$STRAND..$V")" 1
is "named for the strand" "$(git log -1 --format=%s "$V")" "fix(patch): Carry 2 entries from v2.0-x-dev onto v2.0-x-vendor"
has "the body names the carried entry" "$(git log -1 --format=%B "$V")" "carried with its effect: patch/0001-carry.patch"
has "and the satisfied one" "$(git log -1 --format=%B "$V")" "entry taken to match the names: patch/0002-satisfied.patch"
is "the carried entry's effect is in the tree" "$(git show "$V:src/vendor/cigraph/a.cpp" | sed -n 2p)" "two patched"
is "and the entry itself" "$(git cat-file -t "$V:patch/0001-carry.patch")" blob
is "the satisfied entry is taken, its effect already there" "$(git cat-file -t "$V:patch/0002-satisfied.patch")" blob
is "with b.cpp as it was" "$(git show "$V:src/vendor/cigraph/b.cpp" | sed -n 2p)" "beta fixed"
is "the stale entry is not" "$(git cat-file -t "$V:patch/0003-stale.patch" 2>&1 | grep -c blob || true)" 0
is "nor the superseding one" "$(git cat-file -t "$V:patch/0005-super.patch" 2>&1 | grep -c blob || true)" 0
is "the edited entry keeps the strand's version" "$(git show "$V:patch/0006-edited.patch" | grep -c '+old' || true)" 1
is "what the generator derives from the patched tree is in the commit" "$(git show "$V:src/vendor/cigraph/derived.txt")" "derived from: two patched"
is "and its byproduct outside the vendor paths is not" "$(git ls-tree --name-only "$V" byproduct.txt | wc -l)" 0
is "the buffer is untouched; the next pick brings the carry" "$(git ls-remote origin refs/heads/v2.0-x-build | cut -f1)" "$STRAND"
out=$(run v2.0-x --apply)
has "a second run finds the stacks level on what it can carry" "$out" "nothing to carry"

echo
echo "=== 3. a series without a strand takes the carry onto its buffer"
out=$(run v2.0-y --apply)
[ -z "${KEEP:-}" ] || echo "$out"
has "it exits 0" "$out" "EXIT=0"
has "the buffer is pushed" "$out" "build -> "
git fetch -q origin
B=origin/v2.0-y-build
is "one commit above the buffer" "$(git rev-list --count "$SEED..$B")" 1
is "named for the buffer, every candidate applying to the unpatched seed" "$(git log -1 --format=%s "$B")" "fix(patch): Carry 4 entries from v2.0-y-dev onto v2.0-y-build"
is "the carry's effect is there" "$(git show "$B:src/vendor/cigraph/a.cpp" | sed -n 2p)" "two patched"
is "and the generator's strand half did not run" "$(git ls-tree --name-only "$B" src/vendor/cigraph/derived.txt | wc -l)" 0

echo
echo "$pass passed, $fail failed"
[ "$fail" -eq 0 ]
