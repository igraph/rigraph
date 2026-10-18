#!/usr/bin/env bash
# Git merge driver for DESCRIPTION.
#
# The package version carries two independent counters that advance on
# different strands:
#
#   * the 4th component is the R-client counter, bumped on the source-of-truth
#     strand (e.g. `main`): 1.5.3.9006 -> 1.5.3.9007 -> ...
#   * the 5th component is the vendor counter, bumped per vendor commit on the
#     `-dev` strands (see scripts/vendor-one.sh): 1.5.3.9006.41 -> ...42 -> ...
#
# A plain merge of the two strands conflicts on the `Version:` line on every
# commit. This driver resolves that line deterministically by taking the
# component-wise maximum of the two sides, gated on an equal major.minor.patch
# prefix. Because each strand owns exactly one counter (and freezes the other),
# the max automatically keeps the 4th component from the R-client strand and the
# 5th from the vendor strand. The prefix gate is a safety rail: a cross-release
# forward-port (e.g. 1.5.x -> 1.4.x LTS) keeps ours unchanged and never inherits
# a foreign prefix.
#
# All other lines of DESCRIPTION still go through a normal 3-way merge, so a
# genuine concurrent edit (e.g. two branches touching Imports:) still surfaces
# as a real conflict.
#
# git invokes this with:  %O = ancestor   %A = ours (= output)   %B = theirs
set -euo pipefail

O="$1"; A="$2"; B="$3"

ver() { sed -E -n '/^Version: (.*)$/{s//\1/p;q;}' "$1"; }
va="$(ver "$A")"; vb="$(ver "$B")"

merge_ver() {   # $1=ours $2=theirs  ->  merged
  local -a a b
  IFS=. read -r -a a <<<"$1"
  IFS=. read -r -a b <<<"$2"
  local i
  for i in 0 1 2 3 4; do a[i]=${a[i]:-0}; b[i]=${b[i]:-0}; done
  # Different release line: keep ours verbatim, never inherit a foreign prefix.
  if [ "${a[0]}.${a[1]}.${a[2]}" != "${b[0]}.${b[1]}.${b[2]}" ]; then
    printf '%s' "$1"
    return
  fi
  local c3 c4 out
  c3=$(( a[3] > b[3] ? a[3] : b[3] ))   # 4th component: R-client counter
  c4=$(( a[4] > b[4] ? a[4] : b[4] ))   # 5th component: vendor counter
  # A side that carries a fifth component keeps it, even at zero: a series seed
  # stamps `.0`, and dropping it leaves the vendor counter off the version.
  local five=
  case "$1" in *.*.*.*.*) five=1 ;; esac
  case "$2" in *.*.*.*.*) five=1 ;; esac
  out="${a[0]}.${a[1]}.${a[2]}"
  if [ "$c3" -ne 0 ] || [ "$c4" -ne 0 ] || [ -n "$five" ]; then out="$out.$c3"; fi
  if [ "$c4" -ne 0 ] || [ -n "$five" ]; then out="$out.$c4"; fi
  printf '%s' "$out"
}

# If either side is missing a Version line, fall back to a plain 3-way merge.
if [ -n "$va" ] && [ -n "$vb" ]; then
  vm="$(merge_ver "$va" "$vb")"
  to="$(mktemp)"; tb="$(mktemp)"; ta="$(mktemp)"
  trap 'rm -f "$to" "$tb" "$ta"' EXIT
  # Pin all three sides to the merged version so the line cannot conflict.
  sed -E "s|^Version: .*|Version: ${vm}|" "$O" > "$to"
  sed -E "s|^Version: .*|Version: ${vm}|" "$B" > "$tb"
  sed -E "s|^Version: .*|Version: ${vm}|" "$A" > "$ta"
  cp "$ta" "$A"
  O="$to"; B="$tb"
fi

# 3-way merge the remainder; exit status propagates a genuine conflict to git.
set +e
git merge-file -L ours -L base -L theirs "$A" "$O" "$B"
exit $?
