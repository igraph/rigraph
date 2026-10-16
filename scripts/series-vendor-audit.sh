#!/bin/bash
# Does each vendor commit of a range carry the tree upstream has at the commit
# its subject names?
#
# A vendor commit's subject names the upstream commit it vendors
# (scripts/series-config.sh), and its tree under `series_vendor_dir` is meant to
# be that commit's `series_keep` with the commit's own `patch/` stack applied,
# byte for byte (series_generate_tree(), scripts/vendor-one.sh). Nothing else
# compares the two, so a vendor run that kept a file stale is found by a
# compiler at best, and not at all where the stale file still compiles
# (.claude/skills/series-loop/references/traps.md).
#
# Each vendor commit of the range, oldest first, is compared with upstream blob
# for blob: every blob under the kept paths against the same path under
# `series_vendor_dir`. The paths the commit's `patch/` entries touch are taken
# from upstream instead, patched as a vendor run patches them, and hashed. A
# commit that differs gets one line, naming the files by their upstream path:
#
#   DIVERGED <commit> <owner>/igraph@<sha>: <n> file(s): <path> (<how>), ...
#
# <how> is `differs`, `missing` where upstream has the file and the commit lacks
# it, `extra` for the reverse, and `does not apply` for a `patch/` entry that
# neither applies nor is upstream's already. An entry upstream already carries
# is passed over, as a vendor run retires it.
#
# Usage: series-vendor-audit.sh <series> [<from>..<to>] [--remote <name>] [--upstream <path>]
#   <series>      whose `<S>-green..<S>-dev` on the remote is the range, fetched first
#   <from>..<to>  the range instead, read as the caller's refs have it, unfetched
#   --upstream    a clone of igraph/igraph holding every upstream commit the range
#                 names, the replay's included; `$UPSTREAM_CLONE` otherwise
#
# --remote and --upstream are spelled the same in every scripts/series-*.sh; see
# the shared contract in handbook/operations/vendoring/series-loop/README.md.
#
# Exit status: 0 when every vendor commit matches, 1 when one does not, 2 on a
# usage or lookup error, a clone that lacks a commit the range names among them.

set -euo pipefail
# A failure inside `$(...)` stops the run too, rather than reading as empty.
shopt -s inherit_errexit
# shellcheck source=series-lib.sh
. "$(dirname "$0")/series-lib.sh"
# Byte order for `sort`, as for git's own listings, whatever the caller's locale.
export LC_ALL=C

usage='usage: series-vendor-audit.sh <series> [<from>..<to>] [--remote <name>] [--upstream <path>]'
argerr() { echo "$usage" >&2; exit 2; }
lookup() { echo "Error: $*" >&2; exit 2; }

remote=${SERIES_REMOTE:-origin}
upstream=${UPSTREAM_CLONE:-}
args=()
while [ $# -gt 0 ]; do
  case "$1" in
    --remote) [ $# -ge 2 ] || argerr; remote=$2; shift 2 ;;
    --upstream) [ $# -ge 2 ] || argerr; upstream=$2; shift 2 ;;
    -h | --help) echo "$usage"; exit 0 ;;
    -*) argerr ;;
    *) args+=("$1"); shift ;;
  esac
done
case ${#args[@]} in 1 | 2) ;; *) argerr ;; esac
S=${args[0]} range=${args[1]:-}
case "$range" in *...*) argerr ;; '' | ?*..?*) ;; *) argerr ;; esac

[ -n "$upstream" ] || lookup "no upstream clone: pass --upstream <path>, or set UPSTREAM_CLONE"
git -C "$upstream" rev-parse --git-dir >/dev/null 2>&1 || lookup "$upstream is not a git repository"

if [ -z "$range" ]; then
  git fetch -q "$remote" || lookup "could not fetch $remote"
  range="$remote/$S-green..$remote/$S-dev"
fi
from=${range%%..*} to=${range#*..}
for r in "$from" "$to"; do
  git rev-parse -q --verify "$r^{commit}" >/dev/null || lookup "$r is not a commit"
done

# The vendor commits, oldest first, as `<commit> <upstream sha>`: the subject
# decides, never the path (scripts/series-lib.sh). A SHA the clone cannot
# resolve stops the run before anything is compared, because a clone without
# the replay misses every commit of it.
vendor=() unknown=()
while read -r c subject; do
  sha=$(series_sha_of "$subject")
  [ -n "$sha" ] || continue
  full=$(git -C "$upstream" rev-parse -q --verify "$sha^{commit}" 2>/dev/null || true)
  if [ -z "$full" ]; then unknown+=("$sha"); continue; fi
  vendor+=("$c $full")
done < <(git log --reverse --format='%H %s' "$from..$to")
if [ ${#unknown[@]} -gt 0 ]; then
  echo "Error: $upstream lacks ${#unknown[@]} upstream commit(s) the range vendors, ${unknown[0]} first." >&2
  echo "  It must reach $series_replay_repo's $series_replay_branch and $series_upstream_repo" \
    "(.claude/skills/series-loop/SKILL.md, stage 0)." >&2
  exit 2
fi

scratch=$(mktemp -d)
trap 'rm -rf "$scratch"' EXIT

# `<path>\t<blob>` lines, the path as upstream names it: the blobs an upstream
# commit keeps, and the blobs a commit vendors. Only blobs: a vendor run
# extracts files, and a directory or a submodule is none.
upstream_blobs() { # <sha>
  git -C "$upstream" ls-tree -r --full-tree "$1" -- "${series_keep[@]}" |
    awk -F'\t' '{ split($1, m, " "); if (m[2] == "blob") print $2 "\t" m[3] }'
}
vendored_blobs() { # <commit>
  git ls-tree -r --full-tree "$1" -- "$series_vendor_dir" |
    awk -F'\t' -v p="$series_vendor_dir/" '{
      split($1, m, " ")
      if (m[2] == "blob" && index($2, p) == 1) print substr($2, length(p) + 1) "\t" m[3]
    }'
}

# What the commit's `patch/` stack makes of the paths it touches, as `<path>\t<blob>`,
# `<path>\t-` for a path it deletes, and `<entry>\t!` for an entry that neither
# applies nor reverses. The entries are applied in the order a vendor run's
# `patch/*.patch` glob takes them, from a root laid out like the package's, to
# the touched files alone, which is all a patch reads.
patched_blobs() { # <commit> <sha> <upstream blobs file>
  local c=$1 sha=$2 dir=$scratch/tree p
  local -a entries=() touched=()
  mapfile -t entries < <(git ls-tree --name-only --full-tree "$c" patch/ | grep '\.patch$' || true)
  [ ${#entries[@]} -gt 0 ] || return 0
  rm -rf "$dir" "$scratch/patch"
  mkdir -p "$dir" "$scratch/patch"
  for p in "${entries[@]}"; do git show "$c:$p" >"$scratch/$p"; done
  # The paths of the `---` and `+++` headers, less their `-p1` component; a hunk
  # line that reads like one only adds a file that is compared unpatched.
  mapfile -t touched < <(awk -v d="$series_vendor_dir/" '/^(---|\+\+\+) / {
      p = $2; sub(/^[^\/]+\//, "", p)
      if (index(p, d) == 1) print substr(p, length(d) + 1)
    }' "${entries[@]/#/$scratch/}" | sort -u)
  for p in "${touched[@]}"; do
    awk -F'\t' -v p="$p" '$1 == p { found = 1 } END { exit !found }' "$3" || continue
    mkdir -p "$(dirname "$dir/$series_vendor_dir/$p")"
    git -C "$upstream" cat-file blob "$sha:$p" >"$dir/$series_vendor_dir/$p"
  done
  # The three-way split scripts/vendor-one.sh makes, with `--batch` so that a
  # file the patch names and upstream lacks is a failure rather than a prompt.
  for p in "${entries[@]}"; do
    if patch -d "$dir" -p1 --forward --batch --dry-run -s -i "$scratch/$p" >/dev/null 2>&1; then
      patch -d "$dir" -p1 --forward --batch --no-backup-if-mismatch -s -i "$scratch/$p" >/dev/null 2>&1
    elif ! patch -d "$dir" -p1 --reverse --forward --batch --dry-run -s -i "$scratch/$p" >/dev/null 2>&1; then
      printf '%s\t!\n' "$p"
    fi
  done
  for p in "${touched[@]}"; do
    if [ -f "$dir/$series_vendor_dir/$p" ]; then
      printf '%s\t%s\n' "$p" "$(git hash-object --no-filters "$dir/$series_vendor_dir/$p")"
    else
      printf '%s\t-\n' "$p"
    fi
  done
}

# `<path> (<how>)` per difference, sorted: the upstream blobs with the patched
# ones laid over them, against the vendored ones.
differences() { # <upstream blobs> <patched blobs> <vendored blobs>
  awk -F'\t' '
    FILENAME == ARGV[1] { want[$1] = $2; next }
    FILENAME == ARGV[2] {
      if ($2 == "!") print $1 " (does not apply)"
      else if ($2 == "-") delete want[$1]
      else want[$1] = $2
      next
    }
    { have[$1] = $2 }
    END {
      for (p in want) if (!(p in have)) print p " (missing)"; else if (have[p] != want[p]) print p " (differs)"
      for (p in have) if (!(p in want)) print p " (extra)"
    }' "$@" | sort
}

echo "audit: ${#vendor[@]} vendor commit(s) of $range against $upstream"
diverged=0
for e in ${vendor[@]+"${vendor[@]}"}; do
  c=${e% *} sha=${e#* }
  upstream_blobs "$sha" >"$scratch/want"
  patched_blobs "$c" "$sha" "$scratch/want" >"$scratch/patched"
  vendored_blobs "$c" >"$scratch/have"
  diffs=$(differences "$scratch/want" "$scratch/patched" "$scratch/have")
  [ -n "$diffs" ] || continue
  diverged=$((diverged + 1))
  n=$(grep -c . <<<"$diffs")
  # Named in full up to eight, which a defect of the kind this is for never
  # reaches; a tree replaced wholesale is said to be one.
  list=$(head -n 8 <<<"$diffs" | paste -sd, - | sed 's/,/, /g')
  [ "$n" -le 8 ] || list="$list, and $((n - 8)) more"
  marker=$(series_marker_of "$(git log -1 --format=%s "$c")")
  echo "DIVERGED $(git rev-parse --short "$c") ${marker%@*}@${sha:0:10}: $n file(s): $list"
done

if [ "$diverged" -gt 0 ]; then
  echo "$diverged of ${#vendor[@]} vendor commit(s) diverge from upstream"
  exit 1
fi
echo "every vendor commit matches upstream"
