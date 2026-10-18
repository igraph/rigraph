#!/bin/bash
# Which of `main`'s tests does a tree stop running, and which does it change?
#
# Compares `tests/` of two trees and sorts every difference into what takes a
# test away and what changes what one expects. A series' tests are `main`'s:
# they arrive by port, and an engine change may alter what one expects, a
# snapshot redrawn or an error worded anew. What a series may not do is stop one
# from running (handbook/operations/vendoring/adaptation/README.md), because
# nothing brings it back. A deletion or a skip folded into a vendor commit
# travels with every replay that takes vendor commits, and a restore made later
# as a commit of its own travels with none of them: that is how
# `tests/testthat/test-variant.R` left `v2.0-cyanoptera-fwd` at its rewind and
# reached the landing review (duckdb/duckdb-r#2899).
#
# What counts as taking a test away, read from the two trees alone:
#
#   * `deleted`: a file under `tests/` that <base> has and <tip> lacks;
#   * `block`: a `test_that()` block, by its description, in a `test-*.R` file
#     both have;
#   * `snapshot`: a `# <test>` entry of a `_snaps/` file both have;
#   * `skip`: a skip call in a block <base> has, or at the top of a file it has,
#     that <base> does not make there, or anywhere in a `helper*.R` or
#     `setup*.R` file both have, where it stops every test that reaches it. A
#     skip on the engine's version is one too: a series carries no engine gates.
#
# One way of taking a test away is not a loss: a **removal**, of a test whose
# function upstream removed, which goes in the vendor commit that removes the
# function and leaves a note where it stood. A block is `removed` when <tip>
# carries, at the top level of its file and between the blocks <base> has on
# either side of it, a line
#
#   # upstream igraph@<sha>: <what upstream removed>
#
# (`series_test_note_prefix` in scripts/series-config.sh) naming the upstream
# commit of the step that removed it: the commit in <base>..<tip> that took the
# block, which must be a vendor commit, or, for a tree, <tip>'s own engine where
# its version stamp names one, the note being new to <tip>. A tree is one step,
# a pick or a carry, so one spanning several vendor commits reads the removals
# of all but the last as losses. A rewind is never the step: a function an
# older engine lacks is one it does not have yet. A snapshot entry goes with its
# block, and a `_snaps/` file with the blocks of every entry it had. A deleted
# test file is never a removal, since the note has nowhere to stand. Why the
# note marks a removal, and not the commit message, is
# handbook/operations/vendoring/adaptation/README.md's.
#
# Everything else that differs under `tests/` is `changed`: what a test expects,
# which an engine change may move. A changed path is marked as **rewound** when
# a commit in <base>..<tip> that vendors an engine older than <base>'s took a
# line out of it that <tip> still lacks, because what a rewind adapts to an
# older engine is due back in the commit that brings <base>'s, and a rewind a
# later commit undid no longer answers for the path.
#
# Each entry names the commit in <base>..<tip> that made it, where both are
# commits: the deletion, or the newest commit that changed how often the line
# occurs. --vendored keeps only what a `vendor:` commit took away, which is the
# reading for a series' `-dev` against a `main` it may not have fully ported
# yet: a test `main` added since the last port is missing from the series by no
# commit of its own.
#
# Usage: series-tests.sh <base> <tip> [--vendored] [--porcelain] [-- <path>...]
#   <base> holds the tests the comparison keeps, `main` for a landing; <tip> is
#   the tree held to them. Either is any tree-ish; only commits name a culprit.
#   --vendored   only what a vendor commit in <base>..<tip> took away, no changes
#   --porcelain  one line per entry, `<kind>\t<path>\t<what>\t<commit>`
#   <path>...    narrows the comparison to these paths under `tests/`
#
# It names two trees rather than a series, so it takes no --remote, like
# series-forward-build.sh; the usage contract is the shared one
# (handbook/operations/vendoring/series-loop/README.md).
#
# Exit status: 0 when nothing is lost, 1 when something is, 2 on a usage or
# lookup error. A removal is not lost.

set -euo pipefail
# A failure inside `$(...)` stops the run too, rather than reading as empty.
shopt -s inherit_errexit
# shellcheck source=series-lib.sh
. "$(dirname "$0")/series-lib.sh"
# Byte order for `sort` and `comm` alike, whatever the caller's locale.
export LC_ALL=C

usage='usage: series-tests.sh <base> <tip> [--vendored] [--porcelain] [-- <path>...]'
argerr() { echo "$usage" >&2; exit 2; }

vendored='' porcelain=''
args=() spec=()
while [ $# -gt 0 ]; do
  case "$1" in
    --vendored) vendored=1; shift ;;
    --porcelain) porcelain=1; shift ;;
    --) shift; spec=("$@"); break ;;
    -h | --help) echo "$usage"; exit 0 ;;
    -*) argerr ;;
    *) args+=("$1"); shift ;;
  esac
done
[ ${#args[@]} -eq 2 ] || argerr
base=${args[0]} tip=${args[1]}
[ ${#spec[@]} -gt 0 ] || spec=(tests)

for r in "$base" "$tip"; do
  git rev-parse -q --verify "$r^{tree}" >/dev/null ||
    { echo "Error: $r is neither a commit nor a tree" >&2; exit 2; }
done
range=''
if git rev-parse -q --verify "$base^{commit}" >/dev/null 2>&1 &&
  git rev-parse -q --verify "$tip^{commit}" >/dev/null 2>&1; then
  range="$(git rev-parse "$base^{commit}")..$(git rev-parse "$tip^{commit}")"
fi
[ -z "$vendored" ] || [ -n "$range" ] ||
  { echo "Error: --vendored needs two commits, to find the vendor commits between them" >&2; exit 2; }

# The engine a tree vendors, as its version stamp declares it, and whether one
# engine predates a version: both the repository's (scripts/series-config.sh).
engine_of() { series_stamped_version "$1"; }
engine_before() { series_version_before "$@"; }

base_engine=$(engine_of "$base")
tip_engine=$(engine_of "$tip")

# The blocks of a test file and the skips in each, one pass. `B <desc>` per
# `test_that()` and `S <desc> <line>` per skip call, the description empty above
# the first block, where a skip stops the rest of the file. Comments are not
# calls, and a helper defined under a `skip_` name is not one either. The fields
# are split on the unit separator, because `read` collapses an empty field
# between two tabs.
US=$'\x1f'
outline() { # <tree> <path>
  { git show "$1:$2" 2>/dev/null || true; } | awk -v us="$US" '
    /^[ \t]*#/ { next }
    match($0, /^[ \t]*test_that\([ \t]*"([^"\\]|\\.)*"/) {
      cur = substr($0, RSTART, RLENGTH)
      sub(/^[ \t]*test_that\([ \t]*/, "", cur)
      print "B" us cur
      next
    }
    /(^|[^A-Za-z0-9_.])skip(_[A-Za-z0-9_]+)?\(/ {
      l = $0
      gsub(/^[ \t]+|[ \t]+$/, "", l)
      print "S" us cur us l
    }'
}

# Where a removal looks for its note, one pass: `B <line> <desc>` per block and
# `N <line> <sha> <text>` per removal note, the note being a comment at the top
# level that opens with the prefix and an upstream SHA of at least seven digits.
layout() { # <tree> <path>
  { git show "$1:$2" 2>/dev/null || true; } |
    awk -v us="$US" -v note="$series_test_note_prefix" '
    index($0, note) == 1 {
      rest = substr($0, length(note) + 1)
      if (match(rest, /^[0-9a-f]+/) && RLENGTH >= 7) print "N" us NR us substr(rest, 1, RLENGTH) us $0
      next
    }
    /^[ \t]*#/ { next }
    match($0, /^[ \t]*test_that\([ \t]*"([^"\\]|\\.)*"/) {
      cur = substr($0, RSTART, RLENGTH)
      sub(/^[ \t]*test_that\([ \t]*/, "", cur)
      print "B" us NR us cur
    }'
}

# The commit in <base>..<tip> that answers for an entry, and a word on it.
declare -A ENGINE=()
commit_engine() {
  [ -n "${ENGINE[$1]+x}" ] || ENGINE[$1]=$(engine_of "$1")
  echo "${ENGINE[$1]}"
}
is_vendor() { series_is_vendor "$(git log -1 --format=%s "$1")"; }
rewinds() { # <commit or tree>: does it vendor an engine older than <base>'s?
  local e
  e=$(commit_engine "$1")
  [ -n "$e" ] && [ -n "$base_engine" ] && engine_before "$e" "$base_engine"
}
label() { # <commit> -> "<short> <upstream SHA or subject>, <engine>[, a rewind]"
  local s up sha e r=''
  s=$(git log -1 --format=%s "$1")
  up=$(series_marker_of "$s")
  [ -z "$up" ] || { sha=${up##*@}; up="${up%@*}@${sha:0:10}"; }
  e=$(commit_engine "$1")
  if rewinds "$1"; then r=', a rewind'; fi
  printf '%s %s%s%s' "$(git rev-parse --short "$1")" "${up:-${s:0:48}}" "${e:+, $e}" "$r"
}
# Does <tip> still lack a line the rewind <commit> took out of <path>? A rewind
# that a later commit undid touched the path and no longer answers for it.
still_rewound() { # <commit> <path>
  local now l
  now=$(git show "$tip:$2" 2>/dev/null || true)
  while IFS= read -r l; do
    [ -n "${l//[[:space:]]/}" ] || continue
    grep -qxF -- "$l" <<<"$now" || return 0
  done < <(git diff -U0 "$1^" "$1" -- "$2" | sed -n '/^@@/,$ s/^-//p')
  return 1
}
culprit() { # <path> <git log options...> -> the newest commit, or nothing
  local p=$1
  shift
  [ -n "$range" ] || return 0
  git log -1 --format=%H "$@" "$range" -- "$p"
}

# Is the loss of block <desc> a removal? The layouts of its file in <base> and
# <tip> are $lay_base and $lay_tip. The step that took it vendors one upstream
# commit, and the note naming that commit stands in <tip> between the nearest
# blocks <base> has on either side of <desc> that <tip> still has.
removal() { # <desc> <commit or empty>
  local d=$1 c=$2 sha='' lo=0 hi=0 i j k n s t found=''
  local -a order=()
  local -A at=()
  if [ -n "$range" ]; then
    [ -n "$c" ] && is_vendor "$c" || return 1
    ! rewinds "$c" || return 1
    sha=$(series_sha_of "$(git log -1 --format=%s "$c")")
    [ -n "$sha" ] || return 1
  else
    ! rewinds "$tip" || return 1
    [[ ! $tip_engine =~ -g([0-9a-f]+)$ ]] || sha=${BASH_REMATCH[1]}
  fi
  mapfile -t order < <(awk -F"$US" '$1 == "B" { print $3 }' <<<"$lay_base")
  while IFS=$US read -r k n t; do
    [ -n "${at[$t]+x}" ] || at[$t]=$n
  done < <(grep "^B$US" <<<"$lay_tip" || true)
  for i in "${!order[@]}"; do [ "${order[i]}" != "$d" ] || { found=1; break; }; done
  [ -n "$found" ] || return 1
  for ((j = i - 1; j >= 0; j--)); do
    [ -z "${at[${order[j]}]+x}" ] || { lo=${at[${order[j]}]}; break; }
  done
  for ((j = i + 1; j < ${#order[@]}; j++)); do
    [ -z "${at[${order[j]}]+x}" ] || { hi=${at[${order[j]}]}; break; }
  done
  while IFS=$US read -r k n s t; do
    if [ "$n" -le "$lo" ] || { [ "$hi" -gt 0 ] && [ "$n" -ge "$hi" ]; }; then continue; fi
    [ -z "$sha" ] || [[ $sha == "$s"* || $s == "$sha"* ]] || continue
    # For a tree, the step is <base> to <tip>, and a note <base> has is not its.
    [ -n "$range" ] ||
      ! NOTE=$t awk -F"$US" '$1 == "N" && $4 == ENVIRON["NOTE"] { f = 1 } END { exit !f }' <<<"$lay_base" ||
      continue
    return 0
  done < <(grep "^N$US" <<<"$lay_tip" || true)
  return 1
}

entries=()
add() { # <kind> <path> <what> <commit or empty>
  if [ -n "$vendored" ]; then
    [ -n "$4" ] && is_vendor "$4" || return 0
  fi
  entries+=("$(printf '%s\t%s\t%s\t%s' "$1" "$2" "$3" "$4")")
}

# The blocks removed, by path and description, for the snapshot entries they
# wrote.
declare -A REMOVED=()
removed_key() { printf '%s\t%s' "$1" "$2"; } # <test file> <desc>, quoted

while IFS=$'\t' read -r st p; do
  case "$p" in tests/*) ;; *) continue ;; esac
  case "$st" in
    D)
      add deleted "$p" "the file" "$(culprit "$p" --diff-filter=D)"
      continue
      ;;
    A) ;;
    *)
      case "$p" in
        tests/*/test-*.R)
          ol_base=$(outline "$base" "$p")
          ol_tip=$(outline "$tip" "$p")
          blocks_base=$(sed -n "s/^B$US//p" <<<"$ol_base" | sort)
          lay_base='' lay_tip=''
          while IFS= read -r d; do
            [ -n "$d" ] || continue
            c=$(culprit "$p" "-Stest_that($d")
            if [ -z "$lay_base" ]; then
              lay_base=$(layout "$base" "$p")
              lay_tip=$(layout "$tip" "$p")
            fi
            if removal "$d" "$c"; then
              REMOVED[$(removed_key "$p" "$d")]=1
              add removed "$p" "test_that($d" "$c"
            else
              add block "$p" "test_that($d" "$c"
            fi
          done < <(comm -23 <(echo "$blocks_base") <(sed -n "s/^B$US//p" <<<"$ol_tip" | sort))
          while IFS=$US read -r d l; do
            [ -n "$l" ] || continue
            # Only a block `main` has, or the top of a file it has: a skip in a
            # test the series added takes nothing away from `main`.
            [ -z "$d" ] || grep -qxF -- "$d" <<<"$blocks_base" || continue
            add skip "$p" "${d:-(top of file)} $l" "$(culprit "$p" "-S$l")"
          done < <(comm -13 <(sed -n "s/^S$US//p" <<<"$ol_base" | sort) \
            <(sed -n "s/^S$US//p" <<<"$ol_tip" | sort))
          ;;
        tests/*/helper*.R | tests/*/setup*.R)
          while IFS=$US read -r d l; do
            [ -n "$l" ] || continue
            add skip "$p" "(outside a test) $l" "$(culprit "$p" "-S$l")"
          done < <(comm -13 <(outline "$base" "$p" | sed -n "s/^S$US//p" | sort) \
            <(outline "$tip" "$p" | sed -n "s/^S$US//p" | sort))
          ;;
        tests/*/_snaps/*.md)
          while IFS= read -r h; do
            [ -n "$h" ] || continue
            add snapshot "$p" "$h" "$(culprit "$p" "-S$h")"
          done < <(comm -23 <({ git show "$base:$p" | grep '^# ' || true; } | sort) \
            <({ git show "$tip:$p" | grep '^# ' || true; } | sort))
          ;;
      esac
      ;;
  esac
  [ -z "$vendored" ] || continue
  # What the path expects now, how many commits moved it, and whether a rewind
  # among them took out a line the tip still lacks.
  what=$(git diff --numstat --no-renames "$base" "$tip" -- "$p" | awk '{ print "+" $1 "/-" $2 }')
  [ "$st" != A ] || what=added
  cs=()
  if [ -n "$range" ]; then
    mapfile -t cs < <(git log --format=%H "$range" -- "$p")
    what="$what over ${#cs[@]} commit(s)"
    for c in ${cs+"${cs[@]}"}; do
      if rewinds "$c" && still_rewound "$c" "$p"; then
        what="$what, rewound by $(git rev-parse --short "$c")"
        break
      fi
    done
  fi
  add changed "$p" "$what" "${cs[0]:-}"
done < <(git diff --no-renames --name-status "$base" "$tip" -- "${spec[@]}")

# A snapshot entry, `# <desc>` in `_snaps/[<variant>/]<name>.md`, goes with the
# block `test_that("<desc>"` of `test-<name>.R` beside `_snaps/`, and a deleted
# `_snaps/` file with the blocks of every entry <base> had in it.
removed_snapshot() { # <snapshot path> <header>
  local name=${1##*/} key
  key=$(removed_key "${1%%/_snaps/*}/test-${name%.md}.R" "\"${2#\# }\"")
  [ -n "${REMOVED[$key]+x}" ]
}
if [ ${#REMOVED[@]} -gt 0 ]; then
  for i in "${!entries[@]}"; do
    IFS=$'\t' read -r k p w c <<<"${entries[i]}"
    case "$k:$p" in
      snapshot:*) removed_snapshot "$p" "$w" || continue ;;
      deleted:tests/*/_snaps/*.md)
        hs=$({ git show "$base:$p" | grep '^# ' || true; })
        [ -n "$hs" ] || continue
        while IFS= read -r h; do removed_snapshot "$p" "$h" || continue 2; done <<<"$hs"
        ;;
      *) continue ;;
    esac
    entries[i]=$(printf '%s\t%s\t%s\t%s' removed "$p" "$w" "$c")
  done
fi

lost_kinds='deleted|block|snapshot|skip'
nlost=0 nremoved=0
for e in ${entries+"${entries[@]}"}; do
  case "${e%%$'\t'*}" in removed) nremoved=$((nremoved + 1)) ;; esac
  [[ ${e%%$'\t'*} =~ ^($lost_kinds)$ ]] && nlost=$((nlost + 1))
done

if [ -n "$porcelain" ]; then
  [ ${#entries[@]} -eq 0 ] || printf '%s\n' "${entries[@]}"
  [ "$nlost" -eq 0 ] && exit 0
  exit 1
fi

short() { git rev-parse --short "$1" 2>/dev/null || echo "$1"; }
section() { # <heading> <kind regex>
  local e k p w c out=()
  for e in ${entries+"${entries[@]}"}; do
    IFS=$'\t' read -r k p w c <<<"$e"
    [[ $k =~ ^($2)$ ]] || continue
    out+=("$(printf '    %-9s %s\n              %s' "$k" "$p" "$w")")
    [ -z "$c" ] || out+=("              by $(label "$c")")
  done
  [ ${#out[@]} -gt 0 ] || return 0
  echo "  $1:"
  printf '%s\n' "${out[@]}"
  echo
}

echo "=== tests of $(short "$tip") (${tip_engine:-no engine}) against $(short "$base") (${base_engine:-no engine})"
echo
section "LOST, tests $(short "$base") runs and $(short "$tip") does not" "$lost_kinds"
section "removed, with the function upstream removed, each noted where it stood" 'removed'
section "changed, what a test expects" 'changed'
if [ "$nlost" -gt 0 ]; then
  echo "TESTS LOST: $nlost test(s) $(short "$base") runs that $(short "$tip") does not."
  echo "  Restore each in the vendor commit that took it, adapted to that commit's engine,"
  echo "  or, where upstream removed its function, leave the note that makes it a removal"
  echo "  (.claude/skills/series-loop/SKILL.md, stage 2)."
  exit 1
fi
removed_note=''
[ "$nremoved" -eq 0 ] || removed_note=", but $nremoved removed with their function upstream"
echo "TESTS KEPT: every test $(short "$base") runs, $(short "$tip") runs too$removed_note."
