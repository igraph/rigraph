#!/bin/bash
# Derive the release-candidate strand of a series: `<S>-rc-dev`, the package
# without its flavor, commit for commit (.claude/skills/series-rc/SKILL.md).
#
# Each rc commit is a function of one commit of `<S>-dev`: its
# tree with the seed's flavor diff reversed, its message with an
# `Unflavored-from:` trailer naming it, and its author and committer, dates
# included. The seed is the source's `chore: Add fifth version component` with
# the two `flavor.sh` commits under it dropped. Nothing else goes into a commit,
# so a rerun over an unchanged source mints the same SHAs, and "aligned" is a
# fact to check rather than a history to trust: this prints what it would write
# and whether that differs from what the remote holds.
#
# A commit that edits a flavored region makes the reverse diff fail. The two
# generated bindings, `src/cpp11.cpp` and `R/cpp11.R`, are then taken from the
# source commit with the flavor's names spelled back, which is how
# `cpp11::cpp_register()` would have written them; anything else stops the run
# and names the commit. `DESCRIPTION` and `scripts/flavor.patch` are spelled
# back outright: the flavor changes one line of the first, beside a `Version:`
# every commit moves, and the tooling sync overwrites the second with `main`'s
# template.
#
# Usage: series-rc.sh <S> [--remote <name>] [--push]
#   <S> is the source series, `v2.0-cyanoptera-fwd` for `v2.0-cyanoptera-fwd-rc-*`.
#   --push writes the strand, leased on what the remote held when this run read it.

set -euo pipefail
# A failure inside `$(...)` stops the run too, rather than minting an empty SHA.
shopt -s inherit_errexit
# shellcheck source=series-lib.sh
. "$(dirname "$0")/series-lib.sh"

usage='usage: series-rc.sh <S> [--remote <name>] [--push]'
argerr() { echo "$usage" >&2; exit 2; }

remote=${SERIES_REMOTE:-origin}
push=
args=()
while [ $# -gt 0 ]; do
  case "$1" in
    --remote) [ $# -ge 2 ] || argerr; remote=$2; shift 2 ;;
    --push) push=1; shift ;;
    -h | --help) echo "$usage"; exit 0 ;;
    -*) argerr ;;
    *) args+=("$1"); shift ;;
  esac
done
[ ${#args[@]} -eq 1 ] || argerr
S=${args[0]}
case "$S" in *-rc) echo "Error: $S is an rc series already; name its source" >&2; exit 2 ;; esac

git fetch -q "$remote" "+refs/heads/$S-*:refs/remotes/$remote/$S-*"

git rev-parse -q --verify "refs/remotes/$remote/$S-dev" >/dev/null ||
  { echo "Error: $S-dev does not exist on $remote" >&2; exit 1; }

subject() { git log -1 --format=%s "$1"; }

# The seed tip, the flavor pair under it, and the `main` commit under that.
seed=$(series_seed_of "refs/remotes/$remote/$S-dev")
[ -n "$seed" ] || { echo "Error: no seed on $S-dev" >&2; exit 1; }
case "$(subject "$seed~1")" in "chore: Update version to "*) ;; *) bad=1 ;; esac
case "$(subject "$seed~2")" in "chore: Update flavor patch to "*) ;; *) bad=1 ;; esac
if [ -n "${bad:-}" ]; then
  echo "Error: the seed $(git rev-parse --short "$seed") does not stand on the two flavor.sh commits;" >&2
  echo "  a series reflavored after its cut has no single flavor diff to reverse." >&2
  echo "  Cut its rc once it has been forwarded, which regenerates the seed." >&2
  exit 1
fi
flavor=$(subject "$seed~1" | sed 's/^chore: Update version to //')
base=$(git rev-parse "$seed~3")

work=$(mktemp -d)
trap 'rm -rf "$work"' EXIT
git diff --binary "$base" "$seed~1" -- . ':(exclude)DESCRIPTION' ':(exclude)scripts/flavor.patch' \
  > "$work/flavor.diff"
export GIT_INDEX_FILE="$work/index"

# The flavor's names, spelled back: `duckdb.2.0.dev` and `duckdb_2_0_dev`.
dotted="$series_package.$flavor"
underscored="${series_package}_${flavor//./_}"
unname() { sed -e "s/${dotted//./\\.}/$series_package/g" -e "s/$underscored/$series_package/g"; }
# flavor.sh's template spells the flavor `1.3`, and every flavor is written from it.
untemplate() { sed -e "s/${dotted//./\\.}/$series_package.1.3/g" -e "s/$underscored/${series_package}_1_3/g"; }

# <source commit> -> the tree of its unflavored twin
unflavored_tree() {
  local c=$1 f blob
  git read-tree "$c"
  if ! git apply --cached -R "$work/flavor.diff" 2>/dev/null; then
    git read-tree "$c"
    git apply --cached -R "$work/flavor.diff" --exclude=src/cpp11.cpp --exclude=R/cpp11.R 2>/dev/null || {
      echo "Error: $(git rev-parse --short "$c") edits a flavored region: $(subject "$c")" >&2
      echo "  Reverse the flavor on it by hand, or teach this script the region." >&2
      return 1
    }
    for f in src/cpp11.cpp R/cpp11.R; do
      blob=$(git show "$c:$f" | unname | git hash-object -w --stdin)
      git update-index --cacheinfo "100644,$blob,$f"
    done
  fi
  blob=$(git show "$c:DESCRIPTION" | sed "s/^Package: ${dotted//./\\.}\$/Package: $series_package/" |
    git hash-object -w --stdin)
  git update-index --cacheinfo "100644,$blob,DESCRIPTION"
  blob=$(git show "$c:scripts/flavor.patch" | untemplate | git hash-object -w --stdin)
  git update-index --cacheinfo "100644,$blob,scripts/flavor.patch"
  git write-tree
}

# <source commit> <parent> [<tree>] -> the rc commit, with the source's metadata
mint() {
  local c=$1 p=$2 t=${3:-}
  [ -n "$t" ] || t=$(unflavored_tree "$c")
  git log -1 --format=%B "$c" |
    git interpret-trailers --if-exists replace --trailer "Unflavored-from: $(git rev-parse "$c")" |
    GIT_AUTHOR_NAME=$(git log -1 --format=%an "$c") GIT_AUTHOR_EMAIL=$(git log -1 --format=%ae "$c") \
    GIT_AUTHOR_DATE=$(git log -1 --format=%ad --date=raw "$c") \
    GIT_COMMITTER_NAME=$(git log -1 --format=%cn "$c") GIT_COMMITTER_EMAIL=$(git log -1 --format=%ce "$c") \
    GIT_COMMITTER_DATE=$(git log -1 --format=%cd --date=raw "$c") \
    git commit-tree "$t" -p "$p"
}

rc_seed=$(mint "$seed" "$base")

# Every commit above the seed, oldest first. A merge has no single diff to
# mirror, and `-dev` is linear by invariant, so one is refused.
src="refs/remotes/$remote/$S-dev"
if [ -n "$(git rev-list --merges "$seed..$src")" ]; then
  echo "Error: $S-dev has merges above its seed" >&2
  exit 1
fi
new=$rc_seed
for c in $(git rev-list --reverse --first-parent "$seed..$src"); do
  new=$(mint "$c" "$new")
done

ref="refs/heads/$S-rc-dev"
old=$(git rev-parse -q --verify "refs/remotes/$remote/$S-rc-dev" || true)
if [ "$old" = "$new" ]; then
  echo "$S-rc-dev: aligned at $(git rev-parse --short "$new")"
  exit 0
fi
echo "$S-rc-dev: ${old:+$(git rev-parse --short "$old") -> }$(git rev-parse --short "$new")" \
  "($(git rev-list --count "$rc_seed..$new") above the unflavored seed)"
if [ -z "$push" ]; then
  echo "Not aligned; --push writes it."
  exit 1
fi
unset GIT_INDEX_FILE
git push "$remote" "--force-with-lease=$ref:$old" "+$new:$ref"
