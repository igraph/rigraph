#!/bin/bash
# Check scripts/vendor-one.sh offline, against a synthetic upstream built here:
# no network, and stubs for CMake and R, so that what is under test is the walk
# and the commits it writes rather than the build.
#
# The claims are about which upstream commit comes next and how its vendor
# commit is written, along the two stretches of the line and across the seam
# between them (scripts/series-config.sh), and about the vendor strand, where
# `--strand` writes the vendoring alone and scripts/series-vendor.sh derives the
# buffer from it, and about the generator failing on either. Thirteen things
# are checked.
#
#   1. On the replay, the walk vendors the replay's next commit whatever the
#      clone's HEAD says, names it krlmlr/igraph@, links krlmlr/igraph's pull
#      requests, and bumps the fifth version component.
#   2. A patch/ entry upstream now carries is retired in the vendor commit that
#      makes it redundant, and applied until then.
#   3. The walk ends at the replay tip, and the seam comes next: tag 1.0.1, one
#      vendor commit naming igraph/igraph@ that changes the version header and
#      nothing else vendored, and says the replay ends there. A tag ends the run.
#   4. Past the seam, the walk follows igraph/igraph's first parents, a commit
#      that changes nothing kept is folded into the next one, and the body lists
#      both with links to igraph/igraph's pull requests.
#   5. The version header is `git describe --tags` with a nine-character id.
#   6. A tag upstream pushed after its commit was vendored is re-stamped by a
#      second vendor commit for the same SHA, which differs from the first in
#      the version header and the fifth component only, and ends the run;
#      the next run walks on.
#   7. With nothing left to vendor, a run exits 0 and leaves the tree as it was.
#   8. A clone whose HEAD is on another line is refused with exit 5.
#   9. A clone without tags, and a shallow one, are refused with exit 6.
#  10. `--strand` writes a commit of the vendor paths alone (`series_vendor_paths`),
#      the parsers and the threading header among them, with no counter, and
#      restores whatever else the generator wrote.
#  11. A patch/ entry upstream now carries is retired in the strand commit.
#  12. series-vendor.sh picks the strand commits onto the buffer, regenerates
#      what the buffer owns there (`series_regenerate()`), stamps the counter,
#      and carries the retirement; a level buffer picks nothing.
#  13. A generator that fails stops with exit 7 and commits nothing: on the
#      strand in either phase, the tree (CMake) or what is derived from the
#      patched tree, and on the buffer in the regeneration, whose pick is
#      undone. A stack every entry of which has retired vendors on.
#
# Usage:
#   scripts/vendor-one-test.sh
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

export GIT_AUTHOR_NAME=Test GIT_AUTHOR_EMAIL=test@example.invalid
export GIT_COMMITTER_NAME=Test GIT_COMMITTER_EMAIL=test@example.invalid
export TMPDIR=$SCRATCH/tmp
mkdir -p "$TMPDIR"

# --- the stubs ---------------------------------------------------------------
#
# igraph's CMake, as far as vendoring reads it: the version header, from
# `git describe --tags` in the source tree, failing when FAIL_CMAKE is set.
# R is only asked to register cpp11, which has nothing to register here.
# Makefile-cigraph is the package's, below.

STUBS=$SCRATCH/stubs
mkdir -p "$STUBS"
cat >"$STUBS/cmake" <<'EOF'
#!/bin/bash
[ -z "${FAIL_CMAKE:-}" ] || exit 1
while [ $# -gt 0 ]; do
  case "$1" in -S) src=$2; shift 2 ;; -B) build=$2; shift 2 ;; *) shift ;; esac
done
mkdir -p "$build/include"
printf '#define IGRAPH_VERSION "%s"\n' "$(git -C "$src" describe --tags)" >"$build/include/igraph_version.h"
EOF
printf '#!/bin/sh\nexit 0\n' >"$STUBS/Rscript"
chmod +x "$STUBS/cmake" "$STUBS/Rscript"
export PATH=$STUBS:$PATH

# --- the upstream --------------------------------------------------------------
#
# Tag 0.10.17, then two lines out of it. The replay (`replay-1.0.1`) ports three
# changes, the second of which carries what the package's one patch adds. `main`
# reaches the replay tip's tree in one commit, tagged 1.0.1, the seam, and goes
# on with a commit that touches nothing kept, then two that do. A side line
# leaves `main` below the seam.

UP=$SCRATCH/up
git init -q -b main "$UP"
cd "$UP"
put() { mkdir -p "$(dirname "$1")"; echo "$2" >"$1"; }
# A minute apart, as upstream's commits are: `git archive` stamps every file with
# its commit's time, and two extractions with the same stamp and the same size
# can read as unchanged to `git status` when they also land in the same second.
# Counted from the commits already there, because callers run it in a subshell.
commit() {
  local when=$((1700000000 + 60 * $(git rev-list --count --all 2>/dev/null || echo 0)))
  git add -A
  GIT_AUTHOR_DATE="$when +0000" GIT_COMMITTER_DATE="$when +0000" git commit -q -m "$1"
  git rev-parse HEAD
}

put src/a.c a0; put include/igraph.h h0; put doc/readme d0
T0=$(commit 'Release 0.10.17')
git tag 0.10.17

git checkout -q -b replay-1.0.1
put src/a.c a1
R1=$(commit 'Port the first change (#11)')
put src/a.c a2; put src/b.c fix
R2=$(commit 'Port the second change (#12)')
put include/igraph.h h1
RT=$(commit 'Finish the replay (#13)')

git checkout -q main
put src/a.c a2; put src/b.c fix; put include/igraph.h h1; put doc/readme d1
SEAM=$(commit 'Release 1.0.1 (#21)')
git tag 1.0.1
put doc/readme d2
U1=$(commit 'Update the documentation (#22)')
put src/a.c a3
U2=$(commit 'Fix a bug (#23)')
put src/c.c c1
U3=$(commit 'Add a feature (#24)')

git checkout -q -b side "$T0"
put src/a.c side
SIDE=$(commit 'Work on a side line (#31)')

# As the playbook leaves it: HEAD detached on `main`.
git checkout -q --detach main

# --- the package -----------------------------------------------------------------
#
# Vendored at 0.10.17 with its one patch applied, and the vendoring scripts
# outside it, run against it as the loop runs `main`'s copy against the buffer.

PKG=$SCRATCH/pkg
git init -q -b main "$PKG"
cd "$PKG"
echo '/igraph/' >.gitignore
printf 'Package: igraph\nVersion: 2.2.1.9003.0\n' >DESCRIPTION
printf 'all:\n\t@true\n' >Makefile-cigraph
mkdir -p patch src/vendor/cigraph/src src/vendor/cigraph/include
cat >patch/0001-Add-b.patch <<'EOF'
--- /dev/null
+++ b/src/vendor/cigraph/src/b.c
@@ -0,0 +1 @@
+fix
EOF
echo a0 >src/vendor/cigraph/src/a.c
echo fix >src/vendor/cigraph/src/b.c
echo h0 >src/vendor/cigraph/include/igraph.h
echo '#define IGRAPH_VERSION "0.10.17"' >src/vendor/igraph_version.h
git add -A
git commit -q -m "vendor: Update vendored sources (tag 0.10.17) to igraph/igraph@$T0"

SCRIPTS=$SCRATCH/scripts
mkdir -p "$SCRIPTS"
cp "$HERE/vendor-one.sh" "$HERE/vendor-lib.sh" "$HERE/series-config.sh" \
  "$HERE/series-lib.sh" "$HERE/series-vendor.sh" "$SCRIPTS/"
sed -i -E "s/^series_replay_tip=.*/series_replay_tip=$RT/; s/^series_seam=.*/series_seam=$SEAM/" "$SCRIPTS/series-config.sh"
grep -q "^series_replay_tip=$RT\$" "$SCRIPTS/series-config.sh" &&
  grep -q "^series_seam=$SEAM\$" "$SCRIPTS/series-config.sh" || {
  echo "could not point the configuration at the synthetic upstream" >&2
  exit 1
}

# Runs the script under test against the package; `status` and `log` are what it left.
run() { # <name> <clone> [<option>...]
  local name=$1 clone=$2
  shift 2
  log=$SCRATCH/$name.log
  # Through a pipe rather than straight into the log: the script tees to
  # /dev/stderr, which reopens a file and truncates it under the run.
  set +e
  VENDOR_REPO=$PKG bash "$SCRIPTS/vendor-one.sh" --no-check-glue "$@" "$clone" 2>&1 | cat >"$log"
  status=${PIPESTATUS[0]}
  set -e
}
subject() { git -C "$PKG" log -1 --format=%s "${1:-HEAD}"; }
body() { git -C "$PKG" log -1 --format=%b "${1:-HEAD}"; }
version() { git -C "$PKG" show "${1:-HEAD}:DESCRIPTION" | sed -n 's/^Version: //p'; }
header() { git -C "$PKG" show "${1:-HEAD}:src/vendor/igraph_version.h" | sed -En 's/^#define IGRAPH_VERSION "(.*)"$/\1/p'; }
changed() { git -C "$PKG" diff --name-only "$1" "$2" | tr '\n' ' ' | sed 's/ $//'; }
clean() { [ -z "$(git -C "$PKG" status --porcelain)" ] && echo clean || echo dirty; }
clean_in() { [ -z "$(git -C "$1" status --porcelain)" ] && echo clean || echo dirty; }
subject_in() { git -C "$1" log -1 --format=%s; }

# --- the replay (claims 1 and 2) ---------------------------------------------------

echo "the replay"
run replay-1 "$UP" --commits 1
is "one commit vendors with exit 0" "$status" 0
is "the replay's first commit comes next, whatever the clone's HEAD says" \
  "$(subject)" "vendor: Update vendored sources to krlmlr/igraph@$R1"
has "its body links krlmlr/igraph's pull request" "$(body)" \
  "Port the first change (https://redirect.github.com/krlmlr/igraph/pull/11)"
is "the fifth component is bumped" "$(version)" 2.2.1.9003.1
is "the patch is still applied while upstream lacks its change" \
  "$(git -C "$PKG" show HEAD:src/vendor/cigraph/src/b.c)" fix
is "and stays in patch/" "$(git -C "$PKG" ls-tree --name-only HEAD patch/)" patch/0001-Add-b.patch

# --- the seam (claims 3 and 5) -----------------------------------------------------

echo "the seam"
run replay-2 "$UP" --commits 10
is "the run ends with exit 0" "$status" 0
has "and stops at the tag" "$(cat "$log")" "Vendored a tag. Stopping."
is "the replay's second commit" "$(subject HEAD~2)" "vendor: Update vendored sources to krlmlr/igraph@$R2"
is "retires the patch whose change it carries" "$(git -C "$PKG" ls-tree --name-only HEAD~2 patch/)" ""
is "and keeps the change" "$(git -C "$PKG" show HEAD~2:src/vendor/cigraph/src/b.c)" fix
is "the replay tip" "$(subject HEAD~1)" "vendor: Update vendored sources to krlmlr/igraph@$RT"
is "stamps git describe with a nine-character id" "$(header HEAD~1)" "0.10.17-3-g${RT:0:9}"
is "the seam comes next, under igraph/igraph and its tag" \
  "$(subject)" "vendor: Update vendored sources (tag 1.0.1) to igraph/igraph@$SEAM"
has "and says the replay ends there" "$(body)" "ends here"
is "it changes the version header and the version, and nothing else" \
  "$(changed HEAD~1 HEAD)" "DESCRIPTION src/vendor/igraph_version.h"
is "its header names the tag" "$(header)" 1.0.1
is "each of the three bumped the fifth component" "$(version)" 2.2.1.9003.4

# --- past the seam (claim 4) -----------------------------------------------------------

echo "past the seam"
run upstream-1 "$UP" --commits 1
is "one commit vendors with exit 0" "$status" 0
is "the walk takes igraph/igraph's first parents, and skips a commit that changes nothing kept" \
  "$(subject)" "vendor: Update vendored sources to igraph/igraph@$U2"
has "the body lists the skipped commit" "$(body)" \
  "Update the documentation (https://redirect.github.com/igraph/igraph/pull/22)"
has "and the vendored one" "$(body)" "Fix a bug (https://redirect.github.com/igraph/igraph/pull/23)"
is "its header counts from the seam's tag" "$(header)" "1.0.1-2-g${U2:0:9}"

run upstream-2 "$UP" --commits 1
is "the next commit vendors, untagged" "$(subject)" "vendor: Update vendored sources to igraph/igraph@$U3"

# --- a tag upstream pushed late (claim 6) -----------------------------------------------

echo "a late tag"
git -C "$UP" tag 1.0.2 "$U3"
git -C "$UP" checkout -q main
U4=$(cd "$UP" && put src/a.c a4 && commit 'Fix another bug (#25)')
git -C "$UP" checkout -q --detach main
plain=$(git -C "$PKG" rev-parse HEAD)

run late-1 "$UP" --commits 5
is "the re-stamp ends the run with exit 0" "$status" 0
has "and says why" "$(cat "$log")" "Upstream tagged $U3 as 1.0.2 after it was vendored"
is "a second vendor commit for the same SHA, with the tag" \
  "$(subject)" "vendor: Update vendored sources (tag 1.0.2) to igraph/igraph@$U3"
is "appended above the plain one" "$(git -C "$PKG" rev-parse HEAD~1)" "$plain"
has "its body says it is a re-stamp" "$(body)" "Upstream tagged 1.0.2 after this commit was vendored"
is "it differs from the plain one in the version header and the version only" \
  "$(changed HEAD~1 HEAD)" "DESCRIPTION src/vendor/igraph_version.h"
is "its header names the tag" "$(header)" 1.0.2

run late-2 "$UP" --commits 5
is "the next run walks on, with exit 0" "$status" 0
is "to the commit after the tag" "$(subject)" "vendor: Update vendored sources to igraph/igraph@$U4"
is "without re-stamping again" "$(subject HEAD~1)" "vendor: Update vendored sources (tag 1.0.2) to igraph/igraph@$U3"
is "its header counts from the late tag" "$(header)" "1.0.2-1-g${U4:0:9}"

# --- nothing left (claim 7) -----------------------------------------------------------

echo "nothing left"
done_at=$(git -C "$PKG" rev-parse HEAD)
run idle "$UP" --commits 5
is "a run with nothing to do exits 0" "$status" 0
is "and vendors nothing" "$(git -C "$PKG" rev-parse HEAD)" "$done_at"
is "and leaves the tree clean" "$(clean)" clean
is "and removes its clone" "$([ -e "$PKG/igraph" ] && echo kept || echo removed)" removed

# --- refusals (claims 8 and 9) -------------------------------------------------------------

echo "refusals"
git -C "$UP" checkout -q --detach side
run wrong-line "$UP" --commits 1
is "a clone on another line is refused with exit 5" "$status" 5
has "naming the line" "$(cat "$log")" "WRONG UPSTREAM LINE"
is "and nothing is vendored" "$(git -C "$PKG" rev-parse HEAD)" "$done_at"
is "and the tree is clean" "$(clean)" clean
git -C "$UP" checkout -q --detach main

git clone -q --no-tags "$UP" "$SCRATCH/no-tags" 2>/dev/null
git -C "$SCRATCH/no-tags" tag -l | xargs -r git -C "$SCRATCH/no-tags" tag -d >/dev/null
run no-tags "$SCRATCH/no-tags" --commits 1
is "a clone without tags is refused with exit 6" "$status" 6
has "saying so" "$(cat "$log")" "NO VERSION IN THE UPSTREAM CLONE"

git clone -q --depth 3 "file://$UP" "$SCRATCH/shallow" 2>/dev/null
run shallow "$SCRATCH/shallow" --commits 1
is "a shallow clone is refused with exit 6" "$status" 6
has "saying so" "$(cat "$log")" "SHALLOW UPSTREAM CLONE"
is "and nothing is vendored" "$(git -C "$PKG" rev-parse HEAD)" "$done_at"

# --- the vendor strand (claims 10 to 12) ---------------------------------------------
#
# A second package, as `main` is seeded: vendored at 0.10.17 with its one patch,
# the seed's fifth component, and a Makefile-cigraph whose targets write from
# the vendored tree what the real one writes. The strand's targets also leave a
# file outside the vendor paths, which the run must restore; FAIL_DERIVED and
# FAIL_REGENERATE fail the strand's and the buffer's.

echo "the vendor strand"
git -C "$UP" checkout -q --detach main
REMOTE=$SCRATCH/remote.git
git init -q --bare -b main "$REMOTE"
STRAND=$SCRATCH/strand
git init -q -b main "$STRAND"
cd "$STRAND"
git remote add origin "$REMOTE"
echo '/igraph/' >.gitignore
printf 'Package: igraph.dev\nVersion: 2.2.1.9003.0\n' >DESCRIPTION
# shellcheck disable=SC2016  # make expands the recipes, not this shell
printf '%s\n' '.PHONY: all patches src/vendor/igraph_threading.h src/rinterface.c r_wrappers src/sources.mk' \
  'all:' \
  'patches:' \
  '	test -z "$(FAIL_DERIVED)"' \
  '	mkdir -p src/vendor/io && cat src/vendor/cigraph/src/*.c >src/vendor/io/parser.c && echo stray >src/stray.txt' \
  'src/vendor/igraph_threading.h:' '	cp src/vendor/cigraph/include/igraph.h $@' \
  'src/rinterface.c:' '	test -z "$(FAIL_REGENERATE)"' '	cat src/vendor/cigraph/src/a.c >$@' \
  'r_wrappers:' '	mkdir -p R && cat src/vendor/cigraph/src/a.c >R/aaa-auto.R' \
  'src/sources.mk:' '	ls src/vendor/cigraph/src >src/sources-igraph.mk' >Makefile-cigraph
mkdir -p patch src/vendor/cigraph/src src/vendor/cigraph/include
git -C "$PKG" show "$(git -C "$PKG" rev-list --max-parents=0 HEAD):patch/0001-Add-b.patch" >patch/0001-Add-b.patch
echo a0 >src/vendor/cigraph/src/a.c
echo fix >src/vendor/cigraph/src/b.c
echo h0 >src/vendor/cigraph/include/igraph.h
echo '#define IGRAPH_VERSION "0.10.17"' >src/vendor/igraph_version.h
git add -A
git commit -q -m "vendor: Update vendored sources (tag 0.10.17) to igraph/igraph@$T0"
git commit -q --allow-empty -m 'chore: Add fifth version component'
SEED=$(git rev-parse HEAD)
git push -q origin "$SEED:refs/heads/main-vendor" "$SEED:refs/heads/main-build"

set +e
VENDOR_REPO=$STRAND bash "$SCRIPTS/vendor-one.sh" --strand --commits 2 "$UP" 2>&1 | cat >"$SCRATCH/strand.log"
status=${PIPESTATUS[0]}
set -e
strand_changed() { git -C "$STRAND" diff --name-only "$1~1" "$1" | tr '\n' ' ' | sed 's/ $//'; }
is "the strand run exits 0" "$status" 0
is "two strand commits, for the replay's first two" \
  "$(git -C "$STRAND" log --format=%s "$SEED..HEAD" | tr '\n' '|')" \
  "vendor: Update vendored sources to krlmlr/igraph@$R2|vendor: Update vendored sources to krlmlr/igraph@$R1|"
is "the first carries the vendor paths alone, the parsers and the threading header among them" \
  "$(strand_changed HEAD~1)" \
  "src/vendor/cigraph/src/a.c src/vendor/igraph_threading.h src/vendor/igraph_version.h src/vendor/io/parser.c"
is "and no counter" "$(git -C "$STRAND" show HEAD:DESCRIPTION | sed -n 's/^Version: //p')" 2.2.1.9003.0
is "what the generator wrote elsewhere is restored" \
  "$([ -e "$STRAND/src/stray.txt" ] && echo kept || echo restored) $(clean_in "$STRAND")" "restored clean"
is "the second retires the patch whose change it carries, on the strand" \
  "$(git -C "$STRAND" ls-tree --name-only HEAD patch/)" ""
has "the retirement is in the strand commit" "$(strand_changed HEAD)" "patch/0001-Add-b.patch"
git -C "$STRAND" push -q origin HEAD:refs/heads/main-vendor

BUILD=$SCRATCH/build
git -C "$STRAND" worktree add -q --detach "$BUILD" origin/main-build
pick() {
  set +e
  (cd "$BUILD" && bash "$SCRIPTS/series-vendor.sh" main --no-check-glue "$@") 2>&1 | cat >"$SCRATCH/pick.log"
  status=${PIPESTATUS[0]}
  set -e
}
pick
is "series-vendor.sh picks with exit 0" "$status" 0
has "both strand commits" "$(cat "$SCRATCH/pick.log")" "main-build: 2 commit(s) picked from main-vendor"
is "each pick has its strand commit's vendor paths, blob for blob" \
  "$(for c in HEAD~1 HEAD; do git -C "$BUILD" diff --quiet "origin/main-vendor${c#HEAD}" "$c" -- \
       src/vendor/cigraph src/vendor/igraph_version.h src/vendor/igraph_threading.h src/vendor/io patch && echo same; done | tr '\n' ' ')" \
  "same same "
is "the buffer regenerates the interface from the picked tree" "$(git -C "$BUILD" show HEAD:src/rinterface.c)" a2
is "and the R wrappers and the source lists" \
  "$(git -C "$BUILD" show HEAD:R/aaa-auto.R) $(git -C "$BUILD" show HEAD:src/sources-igraph.mk | tr '\n' ' ')" "a2 a.c b.c "
is "each pick stamps the counter" \
  "$(for c in HEAD~1 HEAD; do git -C "$BUILD" show "$c:DESCRIPTION" | sed -n 's/^Version: //p'; done | tr '\n' ' ')" \
  "2.2.1.9003.1 2.2.1.9003.2 "
is "the retirement rides along" "$(git -C "$BUILD" ls-tree --name-only HEAD patch/)" ""
pick
has "a level buffer picks nothing" "$(cat "$SCRATCH/pick.log")" "nothing to pick"

# --- the generator failing (claim 13) ---------------------------------------------------

echo "the generator failing"
strand_run() { # <name> [VAR=value...]: one strand commit
  local name=$1
  shift
  set +e
  env "$@" VENDOR_REPO="$STRAND" bash "$SCRIPTS/vendor-one.sh" --strand --commits 1 "$UP" 2>&1 | cat >"$SCRATCH/$name.log"
  status=${PIPESTATUS[0]}
  set -e
}
before=$(git -C "$STRAND" rev-parse HEAD)
strand_run strand-cmake FAIL_CMAKE=1
is "CMake failing on the tree stops the strand with exit 7" "$status" 7
has "under the generator's banner" "$(cat "$SCRATCH/strand-cmake.log")" "GENERATOR FAILED regenerating the tree"
is "and commits nothing" "$(git -C "$STRAND" rev-parse HEAD)" "$before"
git -C "$STRAND" checkout -q -- .
strand_run strand-derived FAIL_DERIVED=1
is "the derived phase failing stops it with exit 7" "$status" 7
has "under the generator's banner" "$(cat "$SCRATCH/strand-derived.log")" "GENERATOR FAILED deriving from the patched tree"
is "and commits nothing" "$(git -C "$STRAND" rev-parse HEAD)" "$before"
git -C "$STRAND" checkout -q -- . && git -C "$STRAND" clean -fdq
strand_run strand-retired
is "with every patch/ entry retired, the strand vendors on" \
  "$status $(subject_in "$STRAND")" "0 vendor: Update vendored sources to krlmlr/igraph@$RT"
git -C "$STRAND" push -q origin HEAD:refs/heads/main-vendor

before=$(git -C "$BUILD" rev-parse HEAD)
FAIL_REGENERATE=1 pick
is "the buffer's regeneration failing stops the pick with exit 7" "$status" 7
has "under the generator's banner" "$(cat "$SCRATCH/pick.log")" "GENERATOR FAILED after picking"
is "the pick is undone, and the buffer stands where it did" \
  "$(git -C "$BUILD" rev-parse HEAD) $(clean_in "$BUILD")" "$before clean"
pick
is "the rerun takes the pick" "$status $(git -C "$BUILD" rev-list --count "$before..HEAD")" "0 1"

echo
echo "$pass passed, $fail failed"
[ "$fail" = 0 ]
