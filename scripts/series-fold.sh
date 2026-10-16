#!/bin/bash
# Fold fixes into the commits that introduced their defects, and replay
# everything above them: the landing commits of an iteration
# (.claude/skills/series-land/SKILL.md, step 4), or the vendor commits of a
# series' `-dev` under repair (.claude/skills/series-loop/SKILL.md, stage 2).
#
# An iteration of a landing answers a review by folding each fix into the
# commit that introduced the defect, so that every commit from there on carries
# it and every intermediate commit passes; nothing is stacked on top of the
# vendor commits, which scripts/series-land.sh refuses. A repair on `-dev`
# follows the same rule, so that every commit of the chain stays independently
# green. A fix is written as a commit whose parent is the commit it folds into,
# on any branch, so it applies where it was written; the replay carries it up
# through every commit above.
#
# The fold is one `git rebase --interactive` over the landing's first-parent
# chain, from the lowest target up: each target is picked, and the fix is
# applied onto it with `git cherry-pick --no-commit` and amended in. The
# amended commit keeps its author, its subject and its message, with the note
# added as a paragraph of its own above the trailers, so a reader of the commit
# learns what the iteration changed there. Committer dates stay those of the
# landing, so a rerun from the same inputs mints the same SHAs.
#
# A conflict stops the replay where git stops it: resolve it, `git add`, and
# rerun with --continue, which keeps the pinned date. rerere is on
# (scripts/setup-git.sh), so a resolution made once is made again on a rerun.
# A fix that no longer applies at its target stops the replay the same way.
#
# Usage: series-fold.sh <tip> --fold <target>=<fix>[:<note>]... [--exec <cmd>]
#        series-fold.sh --continue | --abort
#   <tip>      the tip to rewrite, a landing or a `-dev`, any commit-ish; it is
#              not moved, the result is left detached in the current worktree
#              and printed
#   --fold     fold commit <fix> into commit <target> of the chain; <fix> must have
#              <target> as its parent; the note defaults to the fix's subject
#   --exec     run <cmd> after every replayed commit from the lowest target up,
#              as `git rebase --exec` does: a failure stops the replay there
#
# Runs in the current worktree, which must be clean; like
# scripts/series-forward-build.sh it names commits rather than a series, so it
# takes no --remote.
#
# Exit status: 0 when the replay finished, 1 when it stopped, 2 on a usage or
# lookup error.

set -euo pipefail
# A failure inside `$(...)` stops the run too, rather than reading as empty.
shopt -s inherit_errexit

usage='usage: series-fold.sh <tip> --fold <target>=<fix>[:<note>]... [--exec <cmd>] | --continue | --abort'
argerr() { echo "$usage" >&2; exit 2; }

self=$(cd "$(dirname "$0")" && pwd)/$(basename "$0")
gitdir=$(git rev-parse --absolute-git-dir)
DATE_FILE="$gitdir/series-fold-date"
# The note of a fold that stopped on a conflict, for --continue to amend in.
PENDING="$gitdir/series-fold-pending"

# --- the fold step, run by the rebase as an `exec` line -----------------------

# The note goes above a closing block of trailers, `Key: value` lines, or at
# the end when there is none. A trailer's key starts with a capital letter, as
# git's (`Co-Authored-By`, `Signed-off-by`) and this repository's
# (`Claude-Session`, `Unflavored-from`) do: a vendor commit's message ends with
# the subjects of the upstream commits it carries, and those read `nfc: ...`
# or `fix: ...`, which a note must follow rather than precede.
add_note() { # <message file> <note>
  awk -v note="$2" '
    { line[NR] = $0 }
    END {
      n = NR
      while (n > 0 && line[n] == "") n--
      start = n + 1
      for (i = n; i > 0 && line[i] ~ /^[A-Z][A-Za-z0-9-]*: /; i--) start = i
      if (start > n || line[start - 1] != "") start = n + 1
      for (i = 1; i < start; i++) {
        if (i == start - 1 && line[i] == "") continue
        print line[i]
      }
      if (start > 1) print ""
      print note
      if (start <= n) {
        print ""
        for (i = start; i <= n; i++) print line[i]
      }
    }' "$1"
}

amend_note() { # <note>: amend what is staged into HEAD, with the note added
  local msg
  msg=$(mktemp)
  git log -1 --format=%B HEAD > "$msg"
  add_note "$msg" "$1" > "$msg.new"
  git commit -q --amend --no-verify --allow-empty -F "$msg.new"
  rm -f "$msg" "$msg.new"
}

if [ "${1:-}" = --apply ]; then
  fix=$2 note=$3
  printf '%s\n%s\n' "$fix" "$note" > "$PENDING"
  git cherry-pick --no-commit "$fix" || {
    echo "series-fold: the fix $(git rev-parse --short "$fix") does not apply at" \
      "$(git rev-parse --short HEAD); resolve, git add, and rerun with --continue" >&2
    exit 1
  }
  amend_note "$note"
  rm -f "$PENDING"
  echo "series-fold: folded $(git rev-parse --short "$fix") into $(git log -1 --format='%h %s' HEAD)"
  exit 0
fi

if [ "${1:-}" = --continue ] || [ "${1:-}" = --abort ]; then
  [ $# -eq 1 ] || argerr
  [ -f "$DATE_FILE" ] || { echo "Error: no fold in progress here" >&2; exit 2; }
  if [ "$1" = --abort ]; then
    git rebase --abort
    rm -f "$DATE_FILE" "$PENDING"
    exit 0
  fi
  GIT_COMMITTER_DATE=$(cat "$DATE_FILE")
  export GIT_COMMITTER_DATE
  if [ -f "$PENDING" ]; then
    [ -z "$(git diff --name-only --diff-filter=U)" ] ||
      { echo "Error: the fix still has conflicts; resolve and git add them" >&2; exit 1; }
    amend_note "$(sed -n 2p "$PENDING")"
    echo "series-fold: folded $(git rev-parse --short "$(sed -n 1p "$PENDING")") into $(git log -1 --format='%h %s' HEAD)"
    rm -f "$PENDING"
  fi
  if git rebase --continue; then
    rm -f "$DATE_FILE"
    echo "series-fold: done at $(git rev-parse HEAD)"
    exit 0
  fi
  exit 1
fi

# --- the replay ----------------------------------------------------------------

landing='' exec_cmd=''
folds=()
while [ $# -gt 0 ]; do
  case "$1" in
    --fold) [ $# -ge 2 ] || argerr; folds+=("$2"); shift 2 ;;
    --exec) [ $# -ge 2 ] || argerr; exec_cmd=$2; shift 2 ;;
    -h | --help) echo "$usage"; exit 0 ;;
    -*) argerr ;;
    *) [ -z "$landing" ] || argerr; landing=$1; shift ;;
  esac
done
[ -n "$landing" ] && [ ${#folds[@]} -gt 0 ] || argerr
tip=$(git rev-parse -q --verify "$landing^{commit}") ||
  { echo "Error: $landing is not a commit" >&2; exit 2; }
[ -z "$(git status --porcelain --untracked-files=no)" ] ||
  { echo "Error: the worktree has changes; fold in a clean one" >&2; exit 2; }
[ ! -f "$DATE_FILE" ] || { echo "Error: a fold is in progress here; --continue or --abort it" >&2; exit 2; }

chain=$(git rev-list --first-parent "$tip")
declare -A FIX=() NOTE=()
lowest='' lowest_pos=-1
for f in "${folds[@]}"; do
  spec=${f%%:*} note=''
  [ "$spec" = "$f" ] || note=${f#*:}
  t=${spec%%=*} x=${spec#*=}
  [ "$t" != "$spec" ] || argerr
  t=$(git rev-parse -q --verify "$t^{commit}") || { echo "Error: target ${spec%%=*} is not a commit" >&2; exit 2; }
  x=$(git rev-parse -q --verify "$x^{commit}") || { echo "Error: fix ${spec#*=} is not a commit" >&2; exit 2; }
  grep -qx "$t" <<<"$chain" ||
    { echo "Error: $(git rev-parse --short "$t") is not on the first-parent chain of $landing" >&2; exit 2; }
  [ "$(git rev-parse "$x^")" = "$t" ] ||
    { echo "Error: the fix $(git rev-parse --short "$x") is not a commit on its target $(git rev-parse --short "$t")" >&2; exit 2; }
  [ -z "${FIX[$t]+x}" ] || { echo "Error: two fixes for $(git rev-parse --short "$t"); make them one commit" >&2; exit 2; }
  FIX[$t]=$x
  NOTE[$t]=${note:-$(git log -1 --format=%s "$x")}
  pos=$(grep -nx "$t" <<<"$chain" | cut -d: -f1)
  if [ "$pos" -gt "$lowest_pos" ]; then lowest=$t lowest_pos=$pos; fi
done

# Every commit of the replay, oldest first, and the todo the rebase follows.
todo=$(mktemp)
q() { printf "'%s'" "${1//\'/\'\\\'\'}"; }
while IFS= read -r c; do
  echo "pick $c"
  if [ -n "${FIX[$c]+x}" ]; then
    echo "exec $(q "$self") --apply ${FIX[$c]} $(q "${NOTE[$c]}")"
  fi
  [ -z "$exec_cmd" ] || echo "exec $exec_cmd"
done < <(git rev-list --reverse --first-parent "$lowest^..$tip") > "$todo"

GIT_COMMITTER_DATE=$(git log -1 --format=%cd --date=raw "$lowest")
export GIT_COMMITTER_DATE
echo "$GIT_COMMITTER_DATE" > "$DATE_FILE"
echo "series-fold: replaying $(grep -c '^pick' "$todo") commits from $(git rev-parse --short "$lowest")," \
  "folding ${#folds[@]} fix(es)"
git checkout -q --detach "$tip"
set +e
GIT_SEQUENCE_EDITOR="cp $(q "$todo")" git rebase -q --interactive --no-autosquash \
  --rebase-merges=no-rebase-cousins --onto "$lowest^" "$lowest^" 2>&1 | grep -v '^Executing:'
st=${PIPESTATUS[0]}
set -e
rm -f "$todo"
if [ "$st" -ne 0 ]; then
  echo "series-fold: stopped; resolve, git add, and rerun with --continue (or --abort)" >&2
  exit 1
fi
rm -f "$DATE_FILE"
echo "series-fold: done at $(git rev-parse HEAD)"
