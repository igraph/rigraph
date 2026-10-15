#!/bin/bash
# Check scripts/series-lib.sh against scripts/series-config.sh, offline: the
# vendor predicate, the markers, the version ordering, the path filters, and
# the walks, against a synthetic repository built here. A repository that
# changes the configuration runs this first, because every series script reads
# the engine through these helpers and nothing else.
#
# What is checked:
#   1. The vendor predicate: a `vendor:` subject, a bare marker, an ordinary one.
#   2. The SHA a subject names, and the twin key with its `+tag` suffix.
#   3. The release a stamp precedes, and the version ordering the suite's
#      `engine_before()` makes.
#   4. The strand, the regenerated files, the carry filter and the tooling
#      expression, read from the configured paths rather than from literals.
#   5. On a repository: the seed, the base scan past a non-vendor commit in the
#      scan directory, its bound, the `-build` equivalent of a re-stamped
#      commit, and the engine and the stamp read off a tree.
#
# The engine's own formats are the block right below the helpers: what a tree
# holds for `series_engine_of()` and `series_stamped_version()` to read, where
# those files live, and the version pairs whose ordering section 3 asserts. A
# repository whose configuration reads another engine rewrites that block and
# nothing else.
#
# Ported from duckdb/duckdb-r (.series-source): the block is igraph's, and
# sections 1 and 2 also check the second owner rigraph's history names.

set -euo pipefail

HERE=$(cd "$(dirname "$0")" && pwd)
# shellcheck source=series-lib.sh
. "$HERE/series-lib.sh"

SCRATCH=$(mktemp -d)
[ -n "${KEEP:-}" ] || trap 'rm -rf "$SCRATCH"' EXIT

pass=0
fail=0
ok() { pass=$((pass + 1)); echo "  ok   $1"; }
no() { fail=$((fail + 1)); echo "  FAIL $1"; }
is() { if [ "$2" = "$3" ]; then ok "$1"; else no "$1"; echo "       got:  $2"; echo "       want: $3"; fi; }
yes() { if "${@:2}"; then ok "$1"; else no "$1"; fi; }
not() { if "${@:2}"; then no "$1"; else ok "$1"; fi; }

# --- the engine's formats ----------------------------------------------------
#
# engine_tree <sha> <version> [tag]: write what a tree vendoring <sha> at
# <version> holds, in the current directory, as the configured readers read it;
# a re-stamp for <tag> rewrites the engine file as well, because a vendor run
# regenerates the tree and the scan directory must see it.
#
# Here the engine is read from the vendor subjects, and the stamp is what
# igraph's CMake writes from `git describe --tags`: `X.Y.Z-N-g<sha>` follows
# the release `X.Y.Z` and precedes the next one, and a release precedes a later
# one.
engine_tree() {
  printf '#define IGRAPH_VERSION "%s"\n' "$2" > "$series_stamp_file"
}
engine_dirs=("$(dirname "$series_stamp_file")")
snapshot=1.3.9-123-gabc1234 # a stamp past a release, which precedes the next one
release=1.4.0
later_snapshot=1.3.9-124-gdef5678
# The ordering: pairs `series_version_before` answers yes to, and pairs it
# answers no to, as `engine_before()` in the suite reads this engine's versions.
before=("$snapshot $release" "$snapshot 1.5.0" "$snapshot $later_snapshot" "$release 1.5.0" "$release $release-1-gabc1234")
not_before=("$snapshot 1.3.9" "main 1.5.0")

repo=$series_upstream_repo
sha=0123456789abcdef
v="vendor: Update vendored sources to $repo@$sha"
vt="vendor: Update vendored sources (tag $(series_tag_of_release 1.2.3)) to $repo@$sha"

echo "--- 1. the vendor predicate"
yes "a vendor: subject vendors" series_is_vendor "$v"
yes "a bare marker vendors" series_is_vendor "chore: bump to $repo@$sha"
not "an ordinary subject does not" series_is_vendor "fix: the glue reads two"
not "the repository name alone does not" series_is_vendor "docs: $repo is upstream"
yes "a subject naming the replay's owner vendors" series_is_vendor "vendor: Update vendored sources to $series_replay_repo@$sha"

echo "--- 2. the SHA and the twin key"
is "the SHA a subject names" "$(series_sha_of "$v")" "$sha"
is "none for an ordinary subject" "$(series_sha_of "fix: the glue")" ""
is "the SHA a replay subject names" "$(series_sha_of "vendor: Update vendored sources to $series_replay_repo@$sha")" "$sha"
is "the twin key" "$(series_twin_key "$v")" "$sha"
is "the twin key of a re-stamp" "$(series_twin_key "$vt")" "$sha+tag"
is "no key for an ordinary subject" "$(series_twin_key "fix: the glue")" ""
is "the marker, as the subject spells it" "$(series_marker_of "$vt")" "$repo@$sha"
is "one marker for a subject naming two" "$(series_marker_of "$v, after $repo@abc")" "$repo@$sha"

echo "--- 3. versions"
if declare -F series_release_of_stamp >/dev/null; then
  is "the release a snapshot precedes" "$(series_release_of_stamp "$snapshot")" "$release"
  is "none for a release" "$(series_release_of_stamp "$release")" ""
  is "the tag of that release is spelled" "$([ -n "$(series_tag_of_release "$release")" ] && echo yes)" yes
else
  echo "  --   no series_release_of_stamp: the late-tag check asks the vendor commits instead"
fi
for pair in "${before[@]}"; do
  # shellcheck disable=SC2086
  yes "$pair: before" series_version_before $pair
done
for pair in "${not_before[@]}"; do
  # shellcheck disable=SC2086
  not "$pair: not before" series_version_before $pair
done

echo "--- 4. the paths"
yes "the vendored tree is on the strand" series_in_strand "$series_vendor_dir/src/a.cpp"
[ ${#series_makevars[@]} -eq 0 ] || yes "so is a Makevars" series_in_strand "${series_makevars[0]}"
not "DESCRIPTION is not" series_in_strand DESCRIPTION
[ ${#series_regenerated[@]} -eq 0 ] || {
  yes "a regenerated file is regenerated" series_is_regenerated "${series_regenerated[0]}"
  not "a path under it is not" series_is_regenerated "${series_regenerated[0]}/x"
}
# One path of each kind the filter drops, and two it keeps.
dropped=("$series_vendor_dir/src/a.cpp" DESCRIPTION)
for p in "${series_strand[@]}"; do dropped+=("$p/x" "$p"); done
for p in "${series_tooling[@]}" "${series_regenerated_dirs[@]}"; do dropped+=("$p/x"); done
dropped+=("${series_regenerated[@]}")
carried=$(printf '%s\n' "${dropped[@]}" src/glue.cpp tests/testthat/test-a.R | series_carry_filter | tr '\n' ' ')
is "the carry filter keeps the fix and drops the rest" "$carried" "src/glue.cpp tests/testthat/test-a.R "
is "nothing to carry is not an error" "$(printf '%s\n' DESCRIPTION | series_carry_filter; echo "rc=$?")" "rc=0"
is "a glob in a configured path matches as a pathspec does" \
  "$(series_strand=('R/aaa-*.R'); series_in_strand R/aaa-two.R && echo yes)" yes
is "and not beyond its directory" \
  "$(series_strand=('R/aaa-*.R'); series_in_strand src/R/aaa-two.R || echo no)" no
tooling_re=$(series_tooling_re)
yes "the tooling expression matches a tooling path" grep -qE "$tooling_re" <<<"${series_tooling[0]}/x"
not "and not another" grep -qE "$tooling_re" <<<"R/x.R"

echo "--- 5. on a repository"
cd "$SCRATCH"
git init -q -b main .
git config user.name Test
git config user.email test@example.invalid
git config commit.gpgsign false
mkdir -p "${engine_dirs[@]}" "$series_scan_dir"
c() { git add -A; git commit -q --allow-empty -m "$1"; git rev-parse HEAD; }
echo 'Package: x' > DESCRIPTION
c "chore: Update flavor patch to x" > /dev/null
seed=$(c "$series_seed_subject")
echo 'a' > "$series_scan_dir/a"
engine_tree aaaaaaaaaa "$snapshot"
v1=$(c "vendor: Update vendored sources to $repo@aaaaaaaaaa")
echo 'b' > "$series_scan_dir/a"
engine_tree bbbbbbbbbb "$later_snapshot"
v2=$(c "vendor: Update vendored sources to $repo@bbbbbbbbbb")
echo 'c' > "$series_scan_dir/a"
fix=$(c "fix: a patch applied in the vendored tree")
is "the seed" "$(series_seed_of HEAD)" "$seed"
is "no seed below it" "$(series_seed_of "$seed~1")" ""
is "the base scan looks past a non-vendor commit in the scan directory" "$(series_vendored_sha HEAD 2>/dev/null)" "bbbbbbbbbb"
is "and says so when the bound is reached" \
  "$(base_scan_depth=1 series_vendored_sha HEAD 2>&1 >/dev/null | head -n 1)" \
  "vendored_sha: 1 $series_scan_dir commits on HEAD, none of them vendoring;"
is "the engine a tree records" "$(series_engine_of "$v1")" "aaaaaaaaaa"
is "none where the tree has no engine" "$(series_engine_of "$seed")" ""
is "the stamp a tree carries" "$(series_stamped_version "$v2")" "$later_snapshot"
# A re-stamp above the fix: the equivalent of the plain commit is the plain one.
git branch -q build
tag=$(series_tag_of_release "$release")
engine_tree bbbbbbbbbb "$release" "$tag"
v2t=$(c "vendor: Update vendored sources (tag $tag) to $repo@bbbbbbbbbb")
is "the equivalent of a plain vendor commit is the plain one" "$(series_build_equivalent HEAD build bbbbbbbbbb)" "$v2"
is "and of a re-stamp the re-stamp" "$(series_build_equivalent HEAD HEAD bbbbbbbbbb)" "$v2t"
is "the fix is not a vendor commit" "$(series_is_vendor "$(git log -1 --format=%s "$fix")" && echo yes || echo no)" no

echo
echo "$pass passed, $fail failed"
[ "$fail" -eq 0 ]
