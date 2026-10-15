#!/usr/bin/env bash
# Export the per-commit CI verdicts of the igraph 0.10.17 -> 1.0.1 replay
# into statuses.tsv, one row per commit, oldest first.
#
# Usage: export-statuses.sh <igraph clone> [<range>] [<repo>] [<archive repo>]
#
# The clone needs the replay branch and the 0.10.17 tag.
# Statuses are read from <repo> (default krlmlr/igraph),
# and run links are written for <archive repo> (default krlmlr/igraph-old),
# the name the repository carries once a fork has taken its place.
# Needs `gh` with read access to <repo>.

set -euo pipefail

clone="$1"
range="${2:-0.10.17..origin/main-b-dev}"
repo="${3:-krlmlr/igraph}"
archive="${4:-krlmlr/igraph-old}"

printf 'position\tsha\tbuild_cmake\tbuild_cmake_run\tstimulus\tstimulus_run\tsubject\n'

pos=0
git -C "$clone" rev-list --reverse "$range" | while read -r sha; do
  pos=$((pos + 1))
  subject=$(git -C "$clone" log -1 --format=%s "$sha" | tr '\t' ' ')

  # The API lists every status newest first, so the first per context is the verdict that stands.
  verdicts=$(gh api "repos/$repo/commits/$sha/statuses?per_page=100" --jq '
    def latest(ctx): [.[] | select(.context == ctx)] | first // {state: "none", target_url: ""};
    [latest("build-cmake"), latest("stimulus")] | map(.state, .target_url) | @tsv')

  printf '%s\t%s\t%s\t%s\n' "$pos" "$sha" "${verdicts//$repo\//$archive/}" "$subject"
done
