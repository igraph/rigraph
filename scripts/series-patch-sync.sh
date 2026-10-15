#!/bin/bash
# Carry `patch/` entries from `<S>-dev` onto `<S>-build`, the way stage 5 carries
# tests and glue onto a forward series.
#
# `vendor-one.sh` applies the *buffer's* `patch/*.patch` to every tree it
# regenerates, so the buffer is where an entry has to live to have any effect on
# what the series vendors next. Entries arrive on `-dev` two ways, and only one
# of them puts them there:
#
#   * a firing writes one during a repair -- stage 3 says to commit it onto
#     `<S>-build` in the same firing, and that is the half that works;
#   * stage 4's port carries whole `main` commits onto `-dev`, `patch/` files
#     included, so an entry born as a pull request against `main` reaches every
#     `-dev` without any firing deciding to put it there -- and reaches no
#     buffer at all, because `-build` takes no ports by design (stage 1).
#
# The second half is what this closes. The drift is quiet while upstream leaves
# the patched file alone, because the buffer is then internally consistent and
# its commits carry no delta for that file; it bites the first time upstream
# touches one, and the fix is reverted on `-dev` by a commit that reads as an
# ordinary vendor.
#
# **What carries is decided by test-applying, never by the file list.** A buffer
# runs ahead of `main`, so an entry that `main` needs may not fit the engine the
# buffer has vendored, and committing it there regardless would break the next
# vendor run outright (`vendor-one.sh`'s `PATCH BROKEN` exit) rather than help
# anything. Each candidate is applied against the buffer's own tree first, and
# the three answers are three different situations:
#
#   carry      applies cleanly -- taken, with its effect on the tree
#   satisfied  reverse-applies: the effect is already in the buffer's tree, so
#              only the entry itself is taken, to keep the two stacks identical
#   stale      neither -- upstream moved the code out from under it. Reported and
#              left alone: on this series' engine the entry answers nothing, and
#              it reaches the buffer if and when the code it answers does.
#
# A candidate is any entry `-dev` has and the buffer does not have at all. One
# both carry in different versions is **edited**, and never a candidate: `main`
# changed it in place -- widened it to cover more, or re-rooted it after upstream
# moved -- and the port brought the new version to `-dev` while the buffer kept
# the old, under the same name. `0009-Remove-stderr-for-zstd` is the standing
# example. A name-only comparison calls those two stacks level, so both are read
# by blob; but the buffer's tree already carries the old version's effect, and
# test-applying the new one against it answers for neither -- it comes out
# `stale`, which it is not. Trading one version for the other is a reverse and an
# apply, and whether the new one fits this engine at all is judgement, so an
# edited entry is reported and never carried.
#
# A candidate whose files are also touched by an entry the buffer has and `-dev`
# does not is a **supersession**, not an addition -- `0003-Fix-clang-warnings-in-re2`
# replacing `0003-Try-to-ignore-clang-warnings` is the standing example, the real
# fix displacing the pragma that used to stand in for it. Which of the two the
# buffer should end up with is judgement, and applying both is how the next
# vendor run breaks, so those are reported and never carried.
#
# Entries the buffer has and `-dev` does not are the series' own, written by a
# repair against an engine `main` has not reached. They are listed for the sake
# of the other direction of this question -- one that applies to `main`'s tree
# today belongs on `main`, where stage 4 spreads it by itself
# (.claude/skills/series-loop/SKILL.md stage 3) -- and never removed here.
#
# Usage: series-patch-sync.sh <series> [--apply] [--remote <name>]
#   Without --apply it reports and writes nothing.
#
# --remote is spelled the same in every scripts/series-*.sh; see the shared
# contract in handbook/operations/vendoring/series-loop/README.md.

set -euo pipefail

usage='usage: series-patch-sync.sh <series> [--apply] [--remote <name>]'
argerr() { echo "$usage" >&2; exit 2; }
apply=
remote=${SERIES_REMOTE:-origin}
args=()
while [ $# -gt 0 ]; do
  case "$1" in
    --apply) apply=1; shift ;;
    --remote) [ $# -ge 2 ] || argerr; remote=$2; shift 2 ;;
    -h | --help) echo "$usage"; exit 0 ;;
    -*) argerr ;;
    *) args+=("$1"); shift ;;
  esac
done
[ ${#args[@]} -eq 1 ] || argerr
S=${args[0]}

git fetch -q "$remote"

build="refs/remotes/$remote/$S-build"
dev="refs/remotes/$remote/$S-dev"
for r in "$build" "$dev"; do
  git rev-parse -q --verify "$r" >/dev/null || { echo "$S: no $r" >&2; exit 1; }
done

targets() { sed -nr 's|^\+\+\+ b/(.*)$|\1|p' "$1" | sed 's/\t.*//' | sort -u; }

dev_only=$(comm -23 \
  <(git ls-tree --name-only "$dev" patch/ | sort) \
  <(git ls-tree --name-only "$build" patch/ | sort))
build_only=$(comm -13 \
  <(git ls-tree --name-only "$dev" patch/ | sort) \
  <(git ls-tree --name-only "$build" patch/ | sort))

# An entry can drift without either side gaining or losing a name: `main` edits
# one in place and the port brings the new version to `-dev` while the buffer
# keeps the old. The entries both sides have are compared by blob, and one that
# differs is `edited` -- reported beside the candidates, never among them (above).
both=$(comm -12 \
  <(git ls-tree --name-only "$dev" patch/ | sort) \
  <(git ls-tree --name-only "$build" patch/ | sort))
edited=$(for n in $both; do
  [ "$(git rev-parse "$dev:$n")" = "$(git rev-parse "$build:$n")" ] || echo "$n"
done)

if [ -z "$dev_only$build_only$edited" ]; then
  echo "$S: patch stacks level"
  exit 0
fi

wt=$(mktemp -d "${TMPDIR:-/tmp}/series-patch-sync-$S-XXXXXX")
trap 'git worktree remove --force "$wt" 2>/dev/null || true' EXIT
git worktree add -q --detach "$wt" "$build"

# Files the buffer's own entries speak for; a candidate touching one of them is
# a supersession for somebody to decide, not an addition to make.
claimed=$(for n in $build_only; do
  git show "$build:$n" > "$wt/.sync-patch" && targets "$wt/.sync-patch"
done | sort -u)
rm -f "$wt/.sync-patch"

carried=() satisfied=() stale=() superseded=()
for n in $dev_only; do
  p="$wt/.sync-candidate"
  git show "$dev:$n" > "$p"
  if [ -n "$claimed" ] && comm -12 <(targets "$p") <(printf '%s\n' "$claimed") | grep -q .; then
    superseded+=("$n"); rm -f "$p"; continue
  fi
  if patch -d "$wt" -i "$p" -p1 --forward --dry-run >/dev/null 2>&1; then
    carried+=("$n")
  elif patch -d "$wt" -i "$p" -p1 --reverse --forward --dry-run >/dev/null 2>&1; then
    satisfied+=("$n")
  else
    stale+=("$n")
  fi
  rm -f "$p"
done

report() {
  local label=$1 first=1; shift
  for x in "$@"; do
    [ -n "$x" ] || continue
    printf '  %-11s %s\n' "$([ "$first" = 1 ] && echo "$label")" "$x"
    first=0
  done
}
echo "=== $S"
report carry "${carried[@]:-}"
report satisfied "${satisfied[@]:-}"
report stale "${stale[@]:-}"
report supersedes "${superseded[@]:-}"
# shellcheck disable=SC2086  # one entry per line, split deliberately
report edited $edited
# shellcheck disable=SC2086  # one entry per line, split deliberately
report buffer-own $build_only

if [ -z "$apply" ]; then
  [ "${#carried[@]}${#satisfied[@]}" = "00" ] || echo "  (report only — rerun with --apply)"
  exit 0
fi
if [ "${#carried[@]}" = 0 ] && [ "${#satisfied[@]}" = 0 ]; then
  echo "  nothing to carry"
  exit 0
fi

for n in "${carried[@]:-}" "${satisfied[@]:-}"; do
  [ -n "$n" ] || continue
  mkdir -p "$wt/patch"
  git show "$dev:$n" > "$wt/$n"
done
for n in "${carried[@]:-}"; do
  [ -n "$n" ] || continue
  patch -d "$wt" -i "$wt/$n" -p1 --forward --no-backup-if-mismatch
done

git -C "$wt" add -A
git -C "$wt" commit -q -F - <<EOF
fix(patch): Carry $((${#carried[@]} + ${#satisfied[@]})) entr$([ $((${#carried[@]} + ${#satisfied[@]})) -eq 1 ] && echo y || echo ies) from $S-dev onto the buffer

\`vendor-one.sh\` applies the buffer's own \`patch/*.patch\` to every tree it
regenerates, so an entry that only ever reached \`-dev\` is absent from the next
vendor run and the commit that reaches \`-dev\` from it arrives broken again.

Each was test-applied against this buffer's tree before being taken:
${carried[*]:+carried with its effect: ${carried[*]}}
${satisfied[*]:+already in the tree, entry taken to match the names: ${satisfied[*]}}
EOF

next=$(git -C "$wt" rev-parse HEAD)
git push "$remote" "$next:refs/heads/$S-build"
echo "  build -> $(git rev-parse --short "$next")"
