# shellcheck shell=bash
# The helpers every series script shares, reading scripts/series-config.sh:
# which commit vendors, what it vendors, where a walk starts. Sourced by the
# scripts/series-*.sh and scripts/each-plan.sh; nothing here writes a ref.
# shellcheck source=series-config.sh
. "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/series-config.sh"

# How deep a scan looks past commits that touch the scan directory without
# vendoring: the patch stack is applied to the vendored tree in place, so every
# CRAN and compiler-warning fix lands there carrying no upstream SHA, and a
# series stacks a few of them above its buffer. 20 is far more than that, and
# bounded so git ends the walk itself. The variable is shared by every reader,
# so raising it raises every answer at once.
base_scan_depth="${BASE_SCAN_DEPTH:-20}"

# Does a subject say its commit vendored? The `vendor:` prefix vendor-one.sh
# writes, or the `<owner>/<repo>@<sha>` marker that carries the upstream commit
# as machine-readable state. The subject decides, never the path.
series_is_vendor() { # <subject>
  # shellcheck disable=SC2254
  case "$1" in vendor:* | $series_vendor_glob) return 0 ;; esac
  return 1
}

# The upstream SHA a subject names, empty when it names none.
series_sha_of() { # <subject>
  sed -rn "$series_sha_sed" <<<"$1"
}

# The upstream SHA a ref has vendored. The pathspec narrows the walk, the
# subject decides: commits that touch the scan directory without vendoring are
# ordinary, so look past them, `base_scan_depth` deep. Empty is the answer
# being absent, not a wrong answer: callers refuse on it, and the reason is on
# stderr for a human to act on.
series_vendored_sha() { # <ref> -> sha, empty when none
  local subjects sha n
  subjects=$(git log -n "$base_scan_depth" --format=%s "$1" -- "$series_scan_dir" || true)
  sha=$(sed -rn "$series_sha_sed" <<<"$subjects" | head -n 1)
  if [ -z "$sha" ]; then
    n=$(grep -c . <<<"$subjects" || true)
    if [ "$n" -ge "$base_scan_depth" ]; then
      echo "vendored_sha: $base_scan_depth $series_scan_dir commits on $1, none of them vendoring;" >&2
      echo "  if that is genuine, raise BASE_SCAN_DEPTH" >&2
    else
      echo "vendored_sha: no vendor commit among $n $series_scan_dir commits on $1" >&2
    fi
  fi
  echo "$sha"
}

# The -build commit equivalent to <ref>'s newest vendor commit for <sha>: the
# same upstream SHA and the same `(tag ...)` marker. One SHA can have two vendor
# commits, because a tag upstream pushes after its commit was vendored is
# re-stamped by a second one on top (scripts/VENDORING.md). Matched by SHA
# alone, the newer of the two answers for a ref that carries only the older, and
# stage 5 never consumes the re-stamp. A ref re-stamped by hand, whose buffer has
# no such twin, falls back to the SHA alone, which is what it always matched.
series_build_equivalent() { # <build> <ref> <sha> -> commit, empty if none
  local subjects newest lines match
  subjects=$(git log -n "$base_scan_depth" --format=%s "$2" -- "$series_scan_dir" || true)
  newest=$(grep -m 1 -F "@$3" <<<"$subjects" || true)
  lines=$(git log --format='%H %s' "$1" | grep -F "@$3" || true)
  case "$newest" in
    *"(tag "*) match=$(grep -m 1 -F '(tag ' <<<"$lines" || true) ;;
    *) match=$(grep -m 1 -v -F '(tag ' <<<"$lines" || true) ;;
  esac
  [ -n "$match" ] || match=$(head -n 1 <<<"$lines")
  echo "${match%% *}"
}

# What two vendor commits are paired by: the upstream SHA, `+tag` appended for a
# re-stamp, so that a re-stamp pairs with a re-stamp and the plain commit with
# the plain one (scripts/series-advance.sh, scripts/series-forward-build.sh).
series_twin_key() { # <subject> -> key, empty when the subject vendors nothing
  local sha
  sha=$(series_sha_of "$1")
  [ -n "$sha" ] || return 0
  case "$1" in
    *"(tag "*) echo "$sha+tag" ;;
    *) echo "$sha" ;;
  esac
}

# The seed a ref stands on: the newest first-parent commit with the seed's
# subject, empty where the ref has none (a series cut from a parent rather than
# seeded on `main`).
series_seed_of() { # <ref> -> commit, empty when none
  local re
  re=$(printf '%s' "$series_seed_subject" | sed 's/[][\.*^$]/\\&/g')
  git log --first-parent --format=%H --grep="^$re\$" -1 "$1"
}

# Is a path on the vendored strand, including the Makevars generated from it?
# A configured entry is a path or a glob, and matches itself or anything under it.
series_in_strand() { # <path>
  local p
  for p in "${series_strand[@]}" "${series_makevars[@]}"; do
    # shellcheck disable=SC2254
    case "$1" in $p | $p/*) return 0 ;; esac
  done
  return 1
}

# An ERE matching a configured path or glob: dots escaped, `*` and `?` as in a
# pathspec, where `*` crosses directories.
series_re_of() { # <path or glob>
  printf '%s' "$1" | sed 's/[.]/\\./g; s/\*/.*/g; s/?/./g'
}

# Is a path one of the files vendoring regenerates?
series_is_regenerated() { # <path>
  local p
  for p in "${series_regenerated[@]}"; do
    # shellcheck disable=SC2254
    case "$1" in $p) return 0 ;; esac
  done
  return 1
}

# The vendor paths (scripts/series-config.sh) as an ERE, each matched as itself
# or as a directory; a tree's entries under them; and the key two commits are
# twins by, the same vendor paths blob for blob (scripts/series-vendor.sh).
series_vendor_re() {
  local re='' p
  for p in "${series_vendor_paths[@]}"; do re="${re:+$re|}$(series_re_of "$p")"; done
  printf '^(%s)(/|$)' "$re"
}
series_vendor_entries() { # <tree-ish> -> `ls-tree -r` lines under the vendor paths
  git ls-tree -r --full-tree "$1" | awk -F'\t' -v re="$(series_vendor_re)" '$2 ~ re'
}
series_vendor_key() { # <tree-ish> -> one hash
  series_vendor_entries "$1" | git hash-object --stdin
}

# The marker a subject carries, `<owner>/<repo>@<sha>` as the subject spells it,
# for a message that names the commit: a history may carry more than one owner.
series_marker_of() { # <subject> -> marker, empty when none
  { grep -oE "$series_marker_ere" <<<"$1" || true; } | head -n 1
}

# An ERE matching exactly one of those files, for `grep -vxE`.
series_regenerated_re() {
  local re='' p
  for p in "${series_regenerated[@]}"; do re="${re:+$re|}$(series_re_of "$p")"; done
  printf '%s' "$re"
}

# The paths a fix may be carried on, read from stdin: what the twin's diff
# touched, less the buffer's own strand, the tooling stage 4 ports, and what
# vendoring regenerates (scripts/series-advance.sh, scripts/series-learned.sh).
# A strand entry counts as a directory and as a file, whichever it is.
series_carry_filter() {
  local dirs='' files p
  for p in "${series_strand[@]}" "${series_tooling[@]}" "${series_regenerated_dirs[@]}"; do
    dirs="${dirs:+$dirs|}$(series_re_of "$p")/"
  done
  files="DESCRIPTION|$(series_regenerated_re)"
  for p in "${series_strand[@]}"; do files="$files|$(series_re_of "$p")"; done
  { grep -vE "^($dirs)" | grep -vxE "$files"; } || true
}

# An ERE matching the tooling paths, `^(\.github/|scripts/|\.claude/)` here.
series_tooling_re() {
  local re='' p
  for p in "${series_tooling[@]}"; do re="${re:+$re|}$(series_re_of "$p")/"; done
  printf '^(%s)' "$re"
}
