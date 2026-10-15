#!/bin/bash
# Check the argument contract every scripts/series-*.sh shares, offline.
#
# The contract is in handbook/operations/vendoring/series-loop/README.md, and
# it exists because the two arguments a cutover takes are a remote of this
# repository and a path to an upstream checkout on disk. While both were
# positional in duckdb-r, passing one where the other belonged reported
# `coverage would regress` -- a wrong answer about the refs for what was a typo
# in an argument. Names cannot be swapped, so they are names now; this keeps
# them that way.
#
# Every check runs before any script touches git, so the suite needs no
# repository, no network and no fixtures. That is also what makes it worth
# running: uniformity is the property that rots silently, one script at a time,
# because every script works fine on its own while it drifts.
#
# Usage: series-args-test.sh

set -euo pipefail

HERE=$(cd "$(dirname "$0")" && pwd)

pass=0
fail=0
is() { # <what> <got> <want>
  if [ "$2" = "$3" ]; then
    pass=$((pass + 1))
    echo "  ok   $1"
  else
    fail=$((fail + 1))
    echo "  FAIL $1"
    echo "         got: $2"
    echo "        want: $3"
  fi
}
isnt() { # <what> <got> <unwanted>
  if [ "$2" != "$3" ]; then
    pass=$((pass + 1))
    echo "  ok   $1"
  else
    fail=$((fail + 1))
    echo "  FAIL $1"
    echo "         got: $2, which is what it must not be"
  fi
}

# Run a script with the working directory somewhere that is not a repository at
# all, so anything reaching git fails loudly rather than reading a real tree.
rc() { # <script> <args...> -> exit status, output discarded
  local s=$1
  shift
  set +e
  (cd / && "$HERE/$s" "$@" >/dev/null 2>&1)
  local r=$?
  set -e
  echo "$r"
}
out() { # <script> <args...> -> first line of stdout; the usage goes there
  local s=$1
  shift
  set +e
  (cd / && "$HERE/$s" "$@" 2>/dev/null | head -n 1)
  set -e
}

# Every series script, and what a valid first positional looks like for it.
# series-forward-build.sh and series-tests.sh name two refs rather than a series,
# which is why they take no --remote; the option spelling and the exit status
# are still shared.
# The list is the series scripts this repository has: the port from
# duckdb/duckdb-r (.series-source) left out series-alpha.sh, series-converge.sh,
# series-cut.sh, series-cutover.sh, series-glue.sh, series-learned.sh and
# series-prune.sh, and the standalone preview-prefix.sh and reflavor.sh, so
# their checks are gone with them.
scripts=(
  series-advance.sh
  series-check.sh
  series-forward-build.sh
  series-land.sh
  series-patch-sync.sh
  series-port.sh
  series-rc.sh
  series-tests.sh
)
remote_scripts=(
  series-advance.sh
  series-check.sh
  series-land.sh
  series-patch-sync.sh
  series-port.sh
  series-rc.sh
)
upstream_scripts=(series-check.sh)
canonical_scripts=(series-advance.sh series-check.sh series-land.sh series-port.sh)

echo "== -h and --help print the usage and exit 0"
for s in "${scripts[@]}"; do
  is "$s -h"       "$(rc "$s" -h)" 0
  is "$s --help"   "$(rc "$s" --help)" 0
  is "$s names itself" "$(out "$s" --help | sed -n 's/^usage: \([a-z-]*\.sh\).*/\1/p')" "$s"
done

echo
echo "== an unknown option is a usage error, exit 2"
for s in "${scripts[@]}"; do
  is "$s --bogus" "$(rc "$s" --bogus)" 2
done

echo
echo "== an option with no value is a usage error, not an unset variable"
for s in "${remote_scripts[@]}"; do
  is "$s --remote (bare)" "$(rc "$s" --remote)" 2
done
for s in "${upstream_scripts[@]}"; do
  is "$s --upstream (bare)" "$(rc "$s" --upstream)" 2
done
for s in "${canonical_scripts[@]}"; do
  is "$s --canonical (bare)" "$(rc "$s" --canonical)" 2
done
is "series-forward-build.sh --placed (bare)"     "$(rc series-forward-build.sh a b --placed)" 2
is "series-forward-build.sh --graft-from (bare)" "$(rc series-forward-build.sh a b --graft-from)" 2
is "series-forward-build.sh --prefix (bare)"     "$(rc series-forward-build.sh a b --prefix)" 2
is "series-forward-build.sh --buffer (bare)"     "$(rc series-forward-build.sh a b --buffer)" 2
is "series-land.sh --placed (bare)"              "$(rc series-land.sh s --placed)" 2
is "series-land.sh --status --review"            "$(rc series-land.sh s --status --review)" 2
is "series-land.sh --base (bare)"                "$(rc series-land.sh s --base)" 2
is "series-land.sh --source (bare)"              "$(rc series-land.sh s --source)" 2
is "series-land.sh --landing (bare)"             "$(rc series-land.sh s --landing)" 2
is "series-land.sh --suffix (bare)"              "$(rc series-land.sh s --suffix)" 2

echo
echo "== the remote and the upstream clone are named, never positional"
# The regression this suite is for: these are the old spellings, and taking them
# quietly is how a remote name reached `git -C`.
is "series-advance.sh <S> <chunk>"         "$(rc series-advance.sh s 25)" 2
is "series-patch-sync.sh <S> <extra>"      "$(rc series-patch-sync.sh s x)" 2
is "series-tests.sh <base>"                "$(rc series-tests.sh a)" 2
is "series-tests.sh <base> <tip> <extra>"  "$(rc series-tests.sh a b c)" 2
for s in "${remote_scripts[@]}"; do
  is "$s accepts --remote" "$(out "$s" --help | grep -c -- '--remote <name>')" 1
done
for s in "${upstream_scripts[@]}"; do
  is "$s accepts --upstream" "$(out "$s" --help | grep -c -- '--upstream <path>')" 1
done
for s in "${canonical_scripts[@]}"; do
  is "$s accepts --canonical" "$(out "$s" --help | grep -c -- '--canonical <name>')" 1
done

echo
echo "== --chunk takes a number"
isnt "series-advance.sh --chunk 25 is not a usage error" \
  "$(rc series-advance.sh s --chunk 25)" 2
is "series-advance.sh --chunk origin" "$(rc series-advance.sh s --chunk origin)" 2

echo
echo "== --dev-note takes a file, and only where a commit is minted"
for s in series-advance.sh series-port.sh; do
  is "$s --dev-note (bare)" "$(rc "$s" s --dev-note)" 2
done
is "series-port.sh --dev-note without --apply" \
  "$(rc series-port.sh s --dev-note /dev/null)" 2

echo
echo "== a missing series is a usage error too"
for s in series-advance.sh series-land.sh series-patch-sync.sh series-port.sh; do
  is "$s with no series" "$(rc "$s")" 2
done
# series-check.sh is the one whose series list is optional: it discovers them.
isnt "series-check.sh with no series is not a usage error" \
  "$(rc series-check.sh)" 2

echo
echo "$pass passed, $fail failed"
[ "$fail" -eq 0 ]
