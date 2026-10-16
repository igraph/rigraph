#!/bin/bash
# Which of `main`'s tests does a tree stop running, and which does it change?
#
# Compares `tests/` of two trees and sorts every difference into what takes a
# test away and what changes what one expects. A series' tests are `main`'s:
# they arrive by port, and an engine change may alter what one expects, a
# snapshot redrawn or an error worded anew. What a series may not do is stop one
# from running (handbook/operations/vendoring/series-loop/README.md), because
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
#     that <base> does not make there.
#
# A skip that names the engine its test runs again at,
# `skip_if_engine_before("<version>", "<why>")` from
# `tests/testthat/helper-skip.R`, is a **gate**, the one way a series lets an
# engine older than `main`'s pass a test it cannot pass yet. It is reported apart
# (`gate` while <tip>'s engine predates the version, `expired` once it does not)
# and counts as lost only under --strict, which is what a landing asks: `main`
# takes no gate, live or inert.
#
# Everything else that differs under `tests/` is `changed`: what a test expects,
# which an engine change may move. A changed path is marked as **rewound** when
# a commit in <base>..<tip> that vendors an engine older than <base>'s took a
# line out of it that <tip> still lacks, because a rewind is the one place a
# series has no reason to change a test rather than gate it, and a rewind a
# later commit undid no longer answers for the path.
#
# Each entry names the commit in <base>..<tip> that made it, where both are
# commits: the deletion, or the newest commit that changed how often the line
# occurs. --vendored keeps only what a `vendor:` commit took away, which is the
# reading for a series' `-dev` against a `main` it may not have fully ported
# yet: a test `main` added since the last port is missing from the series by no
# commit of its own.
#
# Usage: series-tests.sh <base> <tip> [--strict] [--vendored] [--porcelain] [-- <path>...]
#   <base> holds the tests the comparison keeps, `main` for a landing; <tip> is
#   the tree held to them. Either is any tree-ish; only commits name a culprit.
#   --strict     a gate is lost too, live or expired, as a landing reads it
#   --vendored   only what a vendor commit in <base>..<tip> took away, no changes
#   --porcelain  one line per entry, `<kind>\t<path>\t<what>\t<commit>`
#   <path>...    narrows the comparison to these paths under `tests/`
#
# It names two trees rather than a series, so it takes no --remote, like
# series-forward-build.sh; the usage contract is the shared one
# (handbook/operations/vendoring/series-loop/README.md).
#
# Exit status: 0 when nothing is lost, 1 when something is, 2 on a usage or
# lookup error.

set -euo pipefail
# A failure inside `$(...)` stops the run too, rather than reading as empty.
shopt -s inherit_errexit
# shellcheck source=series-lib.sh
. "$(dirname "$0")/series-lib.sh"
# Byte order for `sort` and `comm` alike, whatever the caller's locale.
export LC_ALL=C

usage='usage: series-tests.sh <base> <tip> [--strict] [--vendored] [--porcelain] [-- <path>...]'
argerr() { echo "$usage" >&2; exit 2; }

strict='' vendored='' porcelain=''
args=() spec=()
while [ $# -gt 0 ]; do
  case "$1" in
    --strict) strict=1; shift ;;
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
# engine predates a version: both the repository's (scripts/series-config.sh),
# the second read as `engine_before()` in tests/testthat/helper-skip.R reads it,
# so a gate expires here where it expires in the suite.
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

# The commit in <base>..<tip> that answers for an entry, and a word on it.
declare -A ENGINE=()
commit_engine() {
  [ -n "${ENGINE[$1]+x}" ] || ENGINE[$1]=$(engine_of "$1")
  echo "${ENGINE[$1]}"
}
is_vendor() { series_is_vendor "$(git log -1 --format=%s "$1")"; }
rewinds() { # <commit>: does it vendor an engine older than <base>'s?
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

entries=()
add() { # <kind> <path> <what> <commit or empty>
  if [ -n "$vendored" ]; then
    [ -n "$4" ] && is_vendor "$4" || return 0
  fi
  entries+=("$(printf '%s\t%s\t%s\t%s' "$1" "$2" "$3" "$4")")
}

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
          while IFS= read -r d; do
            [ -n "$d" ] || continue
            add block "$p" "test_that($d" "$(culprit "$p" "-Stest_that($d")"
          done < <(comm -23 <(echo "$blocks_base") <(sed -n "s/^B$US//p" <<<"$ol_tip" | sort))
          while IFS=$US read -r d l; do
            [ -n "$l" ] || continue
            # Only a block `main` has, or the top of a file it has: a skip in a
            # test the series added takes nothing away from `main`.
            [ -z "$d" ] || grep -qxF -- "$d" <<<"$blocks_base" || continue
            kind=skip
            if [[ $l =~ ^skip_if_engine_before\(\"([^\"]+)\" ]]; then
              kind=expired
              engine_before "$tip_engine" "${BASH_REMATCH[1]}" && kind=gate
            fi
            add "$kind" "$p" "${d:-(top of file)} $l" "$(culprit "$p" "-S$l")"
          done < <(comm -13 <(sed -n "s/^S$US//p" <<<"$ol_base" | sort) \
            <(sed -n "s/^S$US//p" <<<"$ol_tip" | sort))
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

lost_kinds='deleted|block|snapshot|skip'
[ -z "$strict" ] || lost_kinds="$lost_kinds|gate|expired"
nlost=0
for e in ${entries+"${entries[@]}"}; do
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
[ -n "$strict" ] || section "gated, each running again at the engine it names" 'gate'
[ -n "$strict" ] || section "expired gates, inert and due to go" 'expired'
section "changed, what a test expects" 'changed'
if [ "$nlost" -gt 0 ]; then
  echo "TESTS LOST: $nlost test(s) $(short "$base") runs that $(short "$tip") does not."
  echo "  Restore each where it was taken, or gate it until the engine that brings it"
  echo "  back (.claude/skills/series-loop/SKILL.md, stage 2)."
  exit 1
fi
echo "TESTS KEPT: every test $(short "$base") runs, $(short "$tip") runs too."
