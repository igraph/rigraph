#!/bin/bash
# Vendors DuckDB sources from the upstream repository (manual vendoring).
# See scripts/VENDORING.md for complete documentation
#
# https://unix.stackexchange.com/a/654932/19205
# Using bash for -o pipefail

set -e
set -x
set -o pipefail

cd "$(dirname "$0")"/..

project=duckdb
vendor_base_dir=src/duckdb
vendor_dir=${vendor_base_dir}
repo_org=${project}
repo_name=${project}


if [ -z "$1" ]; then
  upstream_basedir=../../../${project}
else
  upstream_basedir="$1"
fi

upstream_dir=${project}

if [ "$upstream_basedir" != "$upstream_dir" ]; then
  git clone "$upstream_basedir" "$upstream_dir"
fi

# Make the vendored tree depend on the upstream commit and nothing else.
# `DUCKDB_SOURCE_ID` in pragma_version.cpp comes from upstream's
# `git describe --tags --long`, run inside this clone, and git auto-sizes that
# abbreviation from the number of objects the repository holds -- so the same
# commit vendored twice, from clones that have grown apart, writes two different
# strings and two different trees. Ten is DuckDB's own length: its CMake
# truncates the id to ten characters in the built library, which is what
# ./configure's commit-match guard compares against.
git -C "$upstream_dir" config core.abbrev 10

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
subjects=$(git log -n "${base_scan_depth}" --format="%s" -- ${vendor_dir} | tee /dev/stderr)
base=$(sed -nr '/^.*'${repo_org}.${repo_name}'@([0-9a-f]+)( .*)?$/{s//\1/;p;}' <<<"$subjects" | head -n 1)
if [ -z "$base" ]; then
  n=$(grep -c . <<<"$subjects" || true)
  echo "Error: no ${repo_org}/${repo_name}@ subject among the newest $n ${vendor_dir} commit(s)" >&2
  if [ "$n" -ge "${base_scan_depth}" ]; then
    echo "  the scan is bounded at ${base_scan_depth}; if that is genuinely too shallow, raise BASE_SCAN_DEPTH" >&2
  fi
  exit 1
fi

original=$(git -C "$upstream_dir" rev-parse --verify HEAD)

message=
is_tag=

for commit in $original; do
  echo "Importing commit $commit"

  # The tree is not deleted here: rconfigure.py moves it aside itself and puts
  # back the inode of every regenerated file that did not change, so a file
  # whose content is the same keeps its stat cache entry and every later git
  # command over ~3550 files stays cheap. Files upstream dropped still go -- they
  # are in the tree that was moved aside, and never come back from it.
  echo "R: configure"
  DUCKDB_PATH="$upstream_dir" python3 scripts/rconfigure.py

  # `--reverse` needs `--forward` beside it: on its own it prompts
  # ("Unreversed patch detected!  Ignore -R? [n]") and hangs a run whose
  # stdin is a terminal.
  # scripts/vendor-one.sh has the same three-way split and the same exit 4.
  for f in patch/*.patch; do
    if patch -i "$f" -p1 --forward --dry-run; then
      patch -i "$f" -p1 --forward --no-backup-if-mismatch
    elif patch -i "$f" -p1 --reverse --forward --dry-run; then
      echo "Removing patch $f (its change is already in the regenerated tree)"
      rm "$f"
    else
      echo ""
      echo "=== PATCH BROKEN: $f (upstream ${commit}) ==="
      echo "It neither applies forward nor reverses cleanly, so its change is"
      echo "not in the regenerated tree and cannot be re-applied: the code it"
      echo "patches moved."
      echo "The regenerated sources for ${commit} are in the working tree,"
      echo "uncommitted, and the upstream clone is kept."
      echo "Rebase $f against them, keeping the rebased patch outside the tree,"
      echo "then 'git checkout -- .' and put it back."
      echo "Before rerunning, remove ./duckdb or pass it as the argument:"
      echo "this script always clones, so a leftover clone makes it fail."
      echo "Delete $f only after confirming its change is genuinely upstream."
      exit 4
    fi
  done

  # Always vendor tags
  if [ "$(git -C "$upstream_dir" describe --tags "$commit" | grep -c -- -)" -eq 0 ]; then
    message="vendor: Update vendored sources (tag $(git -C "$upstream_dir" describe --tags "$commit")) to ${repo_org}/${repo_name}@$commit"
    is_tag=true
    break
  fi

  # pragma_version.cpp always differs, so "more than one" is the test for a
  # real change.
  if [ "$(git status --porcelain -- ${vendor_base_dir} | wc -l)" -gt 1 ]; then
    message="vendor: Update vendored sources to ${repo_org}/${repo_name}@$commit"
    break
  fi
done

if [ "$message" = "" ]; then
  echo "No changes."
  # Nothing was vendored, so leave the tree exactly as the run found it.
  # rconfigure.py rewrites R/version.R, src/Makevars, src/Makevars.win and
  # src/include/sources.mk as well as ${vendor_dir}, and any leftover of those
  # would make the next run refuse on a dirty tree. Regenerating can also add
  # files upstream has that we do not, which `checkout` will not take back.
  # Restoring everything is safe because the run refused to start on a dirty
  # tree: anything untracked here was created by this run. The clone is
  # ignored, so `git clean` leaves it for the `rm -rf` below.
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
  git -C "$upstream_dir" log --first-parent --format="%s" "${base}".."${commit}" |
    tee /dev/stderr |
    sed -r 's%#([0-9]+)%https://redirect.github.com/'${repo_org}/${repo_name}'/pull/\1%g'
) | git commit --file /dev/stdin

rm -rf "$upstream_dir"

# Remove "unused" warnings
# Keep the variable for consistency between vendor.sh and vendor-one.sh
true "${is_tag}"
