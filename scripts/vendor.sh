#!/bin/bash
# Vendors igraph sources from the upstream repository (manual vendoring):
# the commit checked out in <upstream clone>, as one vendor commit.
# The series loop uses scripts/vendor-one.sh instead, which walks upstream
# one commit at a time.
#
# Usage: scripts/vendor.sh [<upstream clone>]
#
# Exit status as scripts/vendor-one.sh's: 4 a patch neither applies nor
# reverses, 7 the R/C interface could not be generated.
#
# https://unix.stackexchange.com/a/654932/19205
# Using bash for -o pipefail

set -e
set -x
set -o pipefail

script_dir=$(cd "$(dirname "$0")" && pwd)
. "$script_dir/series-config.sh"
. "$script_dir/vendor-lib.sh"

cd "$script_dir"/..

project=${series_package}
vendor_base_dir=src/vendor
vendor_dir=${series_vendor_dir}

if [ -z "$1" ]; then
  upstream_basedir=../../../${project}
else
  upstream_basedir="$1"
fi

upstream_dir=${project}

if [ "$upstream_basedir" != "$upstream_dir" ]; then
  git clone "$upstream_basedir" "$upstream_dir"
fi

# Make the vendored tree depend on the upstream commit and nothing else:
# igraph's CMake writes `git describe --tags` into igraph_version.h, and git
# sizes the abbreviated commit id in it from the size of the clone.
# scripts/vendor-one.sh pins the same width.
git -C "$upstream_dir" config core.abbrev 9

if [ -n "$(git status --porcelain)" ]; then
  echo "Error: working directory not clean"
  exit 1
fi

if [ -n "$(git -C "$upstream_dir" status --porcelain)" ]; then
  echo "Warning: working directory $upstream_dir not clean"
fi

# The upstream SHA the branch has vendored. Answering empty is not an option:
# an empty base makes the message body below read `${base}..${commit}` with a
# missing left side, which git resolves to the clone's HEAD and which writes a
# changelog nobody chose. The same rule, and the same bound, as vendored_sha()
# in scripts/series-advance.sh; scripts/vendor-one.sh has its own copy.
base_scan_depth="${BASE_SCAN_DEPTH:-20}"
subjects=$(git log -n "${base_scan_depth}" --format="%s" -- "${series_scan_dir}" | tee /dev/stderr)
base=$(sed -En "$series_sha_sed" <<<"$subjects" | head -n 1)
if [ -z "$base" ]; then
  n=$(grep -c . <<<"$subjects" || true)
  echo "Error: no <owner>/igraph@ subject among the newest $n ${series_scan_dir} commit(s)" >&2
  if [ "$n" -ge "${base_scan_depth}" ]; then
    echo "  the scan is bounded at ${base_scan_depth}; if that is genuinely too shallow, raise BASE_SCAN_DEPTH" >&2
  fi
  exit 1
fi

commit=$(git -C "$upstream_dir" rev-parse --verify HEAD)

# A commit of the replay lives in krlmlr/igraph only, and its subject says so
# (scripts/series-config.sh).
owner=${series_upstream_repo}
if git -C "$upstream_dir" cat-file -e "${series_replay_tip}^{commit}" 2>/dev/null &&
  git -C "$upstream_dir" merge-base --is-ancestor "$commit" "$series_replay_tip" &&
  ! git -C "$upstream_dir" merge-base --is-ancestor "$commit" "$series_seam"; then
  owner=${series_replay_repo}
fi

echo "Importing commit $commit"

regen_status=0
regenerate "$commit" || regen_status=$?
if [ "$regen_status" != 0 ]; then
  echo "Error: regeneration failed with status $regen_status; the tree is left as it got." >&2
  echo "  Before rerunning, remove ./${upstream_dir} or pass it as the argument:" >&2
  echo "  this script always clones, so a leftover clone makes it fail." >&2
  exit "$regen_status"
fi

message=
# Always vendor tags
if [ "$(git -C "$upstream_dir" describe --tags "$commit" | grep -c -- -)" -eq 0 ]; then
  message="vendor: Update vendored sources (tag $(git -C "$upstream_dir" describe --tags "$commit")) to ${owner}@$commit"
# igraph_version.h always differs off a tag, so "more than one" is the test for
# a real change.
elif [ "$(git status --porcelain -- ${vendor_base_dir} | wc -l)" -gt 1 ]; then
  message="vendor: Update vendored sources to ${owner}@$commit"
fi

if [ "$message" = "" ]; then
  echo "No changes."
  # Nothing was vendored, so leave the tree exactly as the run found it.
  # Regeneration rewrites R/aaa-*.R, src/rinterface.c, src/cpp11.cpp and the
  # src/*.mk files as well as ${vendor_dir}, and any leftover would make the next
  # run refuse on a dirty tree. Restoring everything is safe because the run
  # refused to start on a dirty tree: anything untracked here was created by
  # this run. The clone is ignored, so `git clean` leaves it for the `rm -rf`.
  git checkout -- .
  git clean -fd
  rm -rf "$upstream_dir"
  exit 0
fi

git add .

(
  echo "$message"
  echo
  git -C "$upstream_dir" log -1 --format="Date: %ai" "${commit}"
  echo
  if git -C "$upstream_dir" merge-base --is-ancestor "$base" "$commit"; then
    git -C "$upstream_dir" log --first-parent --format="%s" "${base}".."${commit}" |
      tee /dev/stderr |
      sed -r 's%#([0-9]+)%https://redirect.github.com/'"${owner}"'/pull/\1%g'
  else
    echo "Vendored by hand, not a walk from ${base}, which this commit does not descend from."
  fi
) | git commit --file /dev/stdin

rm -rf "$upstream_dir"
