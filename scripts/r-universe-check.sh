#!/bin/bash
# Read-only: what did r-universe make of the refs this repository publishes?
#
# `<S>-green` is what r-universe builds (.claude/skills/series-loop/SKILL.md), on
# platforms the per-commit `rcc` gate never touches -- Windows on x86_64 and
# arm64, macOS on both, wasm. A series can therefore be green commit by commit
# and still ship a package that does not build, and nothing in the harvest on
# branch `rcc2` would say so. This script is that missing read.
#
# For every package built from this repository it prints the version, the
# commit it was built from, the local ref that commit is (when this clone knows
# it), and one line per target that is not OK, with the URL of the log that
# says why.
#
# Usage:
#   r-universe-check.sh [<package>...]    # default: every rigraph package
#   r-universe-check.sh --log <job-id>    # the full job log, to stdout
#   RUNIVERSE="<name>..." r-universe-check.sh  # other universes
#
# Four access facts, each paid for once (2026-08-03, 2026-08-18):
#
#   * **The greens are published in more than one universe**, so reading one of
#     them answers for half the series. `igraph.r-universe.dev` builds the base
#     series' greens, `krlmlr.r-universe.dev` builds the forward (`-fwd`) ones,
#     and a default covering only the first reports "all targets OK" while a
#     `-fwd-green` is failing (`main-fwd-green` bf48f2a8f, two macOS x86_64
#     targets timed out, 2026-08-18). Both are read by default; `RUNIVERSE`
#     takes a space-separated list to narrow or extend that. A universe holds
#     packages from other repositories too -- `krlmlr` publishes a dozen -- so
#     the default package list is filtered to those whose `_upstream` is a
#     `rigraph`; naming packages explicitly overrides the filter.
#   * The `/builds` dashboard answers 403 to some fetchers, and the apex
#     `r-universe.dev` may be unreachable where the per-universe subdomain is
#     not. Everything below is on `https://<universe>.r-universe.dev`, which
#     answers a plain curl.
#   * The build logs live in the GitHub repository `r-universe/<universe>`,
#     which needs authentication and is not a repository this project can be
#     granted. r-universe proxies them: `/api/actions/logs/<job-id>` serves the
#     complete job log anonymously. That is the `--log` mode, and it is the
#     difference between "Windows failed" and the compiler error.
#   * `/api/packages` alone cannot answer this question. Its `_binaries` array
#     is one row per *artifact*, so a target whose build failed outright leaves
#     no row -- and the row from the last version that did build stays, wearing
#     that older version. Reading it as the current state reports success for a
#     target that has been failing for a fortnight. The per-package page's check
#     table is version-scoped and complete, so that is the verdict source here;
#     `_binaries` is read only to report how stale the published binary is.

set -euo pipefail

read -r -a universes <<<"${RUNIVERSE:-igraph krlmlr}"

fetch() { curl -fsSL --retry 3 --max-time 120 "$1"; }

# A job id belongs to whichever universe ran it, and the caller pasting one off
# a log URL does not have to say which; ask each in turn.
if [ "${1:-}" = "--log" ]; then
  job=${2:?usage: r-universe-check.sh --log <job-id>}
  for universe in "${universes[@]}"; do
    curl -fsL --retry 3 --max-time 120 \
      "https://$universe.r-universe.dev/api/actions/logs/$job" && exit
  done
  echo "no universe served job $job" >&2
  exit 1
fi

command -v jq >/dev/null || { echo "jq is required" >&2; exit 1; }

wanted=("$@")

# The ref this clone knows the built commit as. Exact hits only: the built
# commit is a tip by construction (r-universe builds a branch), and walking
# `--contains` over 1300 refs to maybe name an ancestor costs more than the
# answer is worth.
ref_for() {
  git for-each-ref --points-at "$1" --format='%(refname:short)' \
    refs/remotes/origin 2>/dev/null | paste -sd, - || true
}

# One row of the package page's check table -> "<target>\t<result>\t<seconds>\t<job-id>".
# The table is server-rendered, so this parses HTML: split on rows, keep the
# ones carrying a log link, and pull the four fields out of each.
checktable() {
  fetch "$host/$1" |
    sed -e 's|<tr>|\n<tr>|g' |
    grep 'data-apilink="logs/' |
    sed -E 's|.*<td[^>]*>([^<]*)</td>.*<b[^>]*>([A-Z]+)</b>.*<td[^>]*>([0-9]+)</td>.*data-apilink="logs/([0-9]+)".*|\1\t\2\t\3\t\4|'
}

status=0
seen=()

for universe in "${universes[@]}"; do
  host="https://$universe.r-universe.dev"
  packages=$(fetch "$host/api/packages")

  # Naming packages overrides the filter; the default keeps the ones this
  # repository publishes, since a universe carries other people's too.
  if [ ${#wanted[@]} -gt 0 ]; then
    pkgs=("${wanted[@]}")
  else
    mapfile -t pkgs < <(
      jq -r '.[] | select(._upstream | test("/rigraph$")) | .Package' <<<"$packages"
    )
  fi

  header="--- $universe.r-universe.dev"

  for pkg in "${pkgs[@]}"; do
    meta=$(jq --arg p "$pkg" '.[] | select(.Package == $p)' <<<"$packages")
    [ -n "$meta" ] || continue
    seen+=("$pkg")
    [ -n "$header" ] && { echo "$header"; header=; }

    version=$(jq -r '.Version' <<<"$meta")
    commit=$(jq -r '._commit.id' <<<"$meta")
    upstream=$(jq -r '._upstream' <<<"$meta")
    ref=$(ref_for "$commit")

    echo "=== $pkg $version -- ${commit:0:9} ${ref:+($ref) }<$upstream>"

    rows=$(checktable "$pkg" || true)
    if [ -z "$rows" ]; then
      echo "  no check table -- the page moved, or the first build has not finished"
      status=1
      continue
    fi

    bad=0
    while IFS=$'\t' read -r target result seconds job; do
      [ "$result" = OK ] && continue
      bad=$((bad + 1))
      printf '  %-8s %-24s %5ss  %s/api/actions/logs/%s\n' \
        "$result" "$target" "$seconds" "$host" "$job"
    done <<<"$rows"
    [ "$bad" -eq 0 ] && echo "  all $(grep -c . <<<"$rows") targets OK"
    [ "$bad" -eq 0 ] || status=1

    # A target whose newest binary is *older* than the indexed version is one
    # whose build stopped producing artifacts: whoever installs from this
    # universe is served that older one, however long ago it was built. Rows
    # ahead of the index are the ordinary lag between building and indexing and
    # say nothing. Versions compare component-wise as numbers, not as strings:
    # `.9006` is not less than `.999`.
    jq -r --arg v "$version" '
        def vnum: [splits("[.]")] | map(tonumber);
        ($v | vnum) as $cur
        | [ ._binaries[]? | select(.version | vnum < $cur) ]
        | group_by(.os + "-" + (.arch // "?"))
        | map(max_by(.date))
        | .[]
        | [ "\(.os)-\(.arch // "?")", .version, .date[0:10] ]
        | @tsv
      ' <<<"$meta" |
      sort |
      while IFS=$'\t' read -r target older when; do
        printf '  %-8s %-24s newest binary is %s, built %s\n' STALE "$target" "$older" "$when"
      done
  done
done

# A named package missing from one universe is ordinary -- the base and forward
# greens publish to different ones. Missing from all of them is a finding.
for pkg in "${wanted[@]+"${wanted[@]}"}"; do
  printf '%s\n' "${seen[@]+"${seen[@]}"}" | grep -qxF "$pkg" && continue
  echo "=== $pkg: in none of ${universes[*]}"
  status=1
done

exit "$status"
