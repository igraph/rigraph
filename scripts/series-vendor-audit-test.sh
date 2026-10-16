#!/bin/bash
# Check scripts/series-vendor-audit.sh offline, against a synthetic upstream and
# a synthetic series built here: no network, no fixtures on disk.
#
#   1. A series whose every vendor commit carries upstream's kept tree with the
#      commit's `patch/` stack applied is clean, exit 0; a commit that vendors
#      nothing is passed over, and a patched file is compared patched.
#   2. A series one of whose vendor runs kept a file stale, an upstream edit of
#      the same size, is reported at that commit and every later one until
#      upstream edits the file again, naming the file, exit 1.
#   3. An explicit range narrows the audit to its own vendor commits.
#   4. A file upstream added and the commit lacks, one upstream deleted and the
#      commit keeps, and a `patch/` entry that does not apply are each named.
#   5. No clone, and a clone without a commit the range names, are lookup
#      errors, exit 2; `$UPSTREAM_CLONE` names the clone as `--upstream` does.
#
# Usage:
#   scripts/series-vendor-audit-test.sh
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
is() { if [ "$2" = "$3" ]; then ok "$1"; else no "$1"; echo "       got:  $2"; echo "       want: $3"; fi; }
has() { case "$2" in *"$3"*) ok "$1" ;; *) no "$1"; echo "       missing: $3"; printf '%s\n' "$2" | sed 's/^/       | /' ;; esac; }
hasnt() { case "$2" in *"$3"*) no "$1"; echo "       unexpected: $3" ;; *) ok "$1" ;; esac; }

export GIT_AUTHOR_NAME=Test GIT_AUTHOR_EMAIL=test@example.invalid
export GIT_COMMITTER_NAME=Test GIT_COMMITTER_EMAIL=test@example.invalid
unset UPSTREAM_CLONE SERIES_REMOTE

put() { mkdir -p "$(dirname "$1")"; printf '%s\n' "$2" >"$1"; }
commit() { git add -A; git commit -q -m "$1"; git rev-parse HEAD; }

# --- the upstream ------------------------------------------------------------
#
# Tag 0.10.17, then three commits: one edits src/a.c keeping its size, and the
# header; one adds src/c.c; and one edits src/a.c again and drops src/b.c.
# doc/ is not kept, so a change there is none of the vendored tree's.

UP=$SCRATCH/up
git init -q -b main "$UP"
cd "$UP"
git config commit.gpgsign false
put src/a.c 'int a = 0;'; put src/b.c 'int b;'; put include/igraph.h 'h0'
put interfaces/functions.yaml $'f: 0\ng: 0'; put doc/readme 'd0'; put AUTHORS 'me'
U0=$(commit 'Release 0.10.17')
git tag 0.10.17
put src/a.c 'int a = 1;'; put include/igraph.h 'h1'; put doc/readme 'd1'
U1=$(commit 'Change the default (#11)')
put src/c.c 'int c;'
U2=$(commit 'Add a feature (#12)')
put src/a.c 'int a = 100;'; rm src/b.c
U3=$(commit 'Change it again (#13)')

# --- the series ----------------------------------------------------------------
#
# The package's one patch edits the vendored interfaces, as rigraph's do.
# vendor() regenerates the tree the way scripts/series-config.sh does, less the
# version header, and applies the stack; `stale` restores one file from the
# commit below afterwards, which is what a vendor run that missed an edit leaves.

REMOTE=$SCRATCH/remote.git
WORK=$SCRATCH/work
git init -q --bare -b main "$REMOTE"
git init -q -b main "$WORK"
cd "$WORK"
git config commit.gpgsign false
git config push.negotiate false
git remote add origin "$REMOTE"
mkdir -p scripts patch
for s in series-vendor-audit.sh series-config.sh series-lib.sh; do cp "$HERE/$s" scripts/; done
chmod +x scripts/*.sh
cat >patch/0001-fix.patch <<'EOF'
--- a/src/vendor/cigraph/interfaces/functions.yaml
+++ b/src/vendor/cigraph/interfaces/functions.yaml
@@ -1,2 +1,2 @@
 f: 0
-g: 0
+g: 1
EOF

vendor() { # <upstream sha> [stale <path>]
  rm -rf src/vendor/cigraph
  mkdir -p src/vendor/cigraph
  git -C "$UP" archive "$1" -- src include interfaces AUTHORS | tar -x -m -C src/vendor/cigraph
  for p in patch/*.patch; do patch -s -p1 --forward --no-backup-if-mismatch -i "$p"; done
  if [ "${2:-}" = stale ]; then git checkout HEAD -- "src/vendor/cigraph/$3"; fi
  commit "vendor: Update vendored sources to krlmlr/igraph@$1"
}

vendor "$U0" >/dev/null
SEED=$(git commit -q --allow-empty -m 'chore: Add fifth version component' && git rev-parse HEAD)

# x: clean, with a commit between the vendor commits that vendors nothing.
vendor "$U1" >/dev/null
put R/foo.R 'foo <- function() 1'
commit 'feat: Add foo()' >/dev/null
X2=$(vendor "$U2")
X3=$(vendor "$U3")

# y: the run for U1 kept src/a.c, the same size, and so did the next one.
git checkout -q --detach "$SEED"
Y1=$(vendor "$U1" stale src/a.c)
Y2=$(vendor "$U2" stale src/a.c)
Y3=$(vendor "$U3")

git push -q origin "$SEED:refs/heads/x-green" "$X3:refs/heads/x-dev" \
  "$SEED:refs/heads/y-green" "$Y3:refs/heads/y-dev"

run() { set +e; scripts/series-vendor-audit.sh "$@" 2>&1; echo "EXIT=$?"; set -e; }

echo "=== 1. a clean series"
out=$(run x --upstream "$UP")
[ -z "${KEEP:-}" ] || echo "$out"
has "it exits 0" "$out" "EXIT=0"
has "three vendor commits, the one vendoring nothing passed over" "$out" "audit: 3 vendor commit(s) of origin/x-green..origin/x-dev"
has "and says they match" "$out" "every vendor commit matches upstream"
hasnt "the patched interfaces are compared patched" "$out" "functions.yaml"

echo
echo "=== 2. a stale file"
out=$(run y --upstream "$UP")
[ -z "${KEEP:-}" ] || echo "$out"
has "it exits 1" "$out" "EXIT=1"
has "the run that missed the edit is named, with the file" "$out" \
  "DIVERGED $(git rev-parse --short "$Y1") krlmlr/igraph@${U1:0:10}: 1 file(s): src/a.c (differs)"
has "and the next one, which kept it" "$out" \
  "DIVERGED $(git rev-parse --short "$Y2") krlmlr/igraph@${U2:0:10}: 1 file(s): src/a.c (differs)"
hasnt "but not the one whose upstream edit vendored it anew" "$out" "$(git rev-parse --short "$Y3")"
has "and the count is said" "$out" "2 of 3 vendor commit(s) diverge from upstream"

echo
echo "=== 3. an explicit range"
out=$(run y "$Y2..$Y3" --upstream "$UP")
has "the range's one vendor commit is clean" "$out" "EXIT=0"
has "and only it is audited" "$out" "audit: 1 vendor commit(s) of $Y2..$Y3"
out=$(run y "$Y1..$Y2" --upstream "$UP")
has "the stale one below it is still found" "$out" "EXIT=1"

echo
echo "=== 4. a missing file, an extra one, and a patch that does not apply"
git checkout -q --detach "$X2"
vendor "$U3" >/dev/null
put patch/0002-broken.patch $'--- a/src/vendor/cigraph/src/a.c\n+++ b/src/vendor/cigraph/src/a.c\n@@ -1 +1 @@\n-int a = 42;\n+int a = 43;'
git checkout -q HEAD~ -- src/vendor/cigraph/src/b.c
rm src/vendor/cigraph/src/c.c
git add -A
git commit -q --amend --no-edit
W=$(git rev-parse HEAD)
out=$(run x "$X2..$W" --upstream "$UP")
[ -z "${KEEP:-}" ] || echo "$out"
has "it exits 1" "$out" "EXIT=1"
has "all three are named, in order" "$out" \
  "3 file(s): patch/0002-broken.patch (does not apply), src/b.c (extra), src/c.c (missing)"

echo
echo "=== 5. lookup errors"
out=$(run x)
has "no clone is a lookup error" "$out" "EXIT=2"
has "and says what to pass" "$out" "no upstream clone"
git clone -q --no-local --no-checkout --single-branch --branch 0.10.17 "$UP" "$SCRATCH/old"
out=$(run x --upstream "$SCRATCH/old")
has "a clone without the range's commits is one too" "$out" "EXIT=2"
has "and says how many it lacks" "$out" "lacks 3 upstream commit(s)"
out=$(UPSTREAM_CLONE=$UP run x)
has "UPSTREAM_CLONE names the clone" "$out" "EXIT=0"
out=$(run x "$SEED..nowhere" --upstream "$UP")
has "a range end that is no commit is a lookup error" "$out" "EXIT=2"
out=$(run x "$SEED" --upstream "$UP")
has "a range that is not one is a usage error" "$out" "EXIT=2"

echo
echo "$pass passed, $fail failed"
[ "$fail" -eq 0 ]
