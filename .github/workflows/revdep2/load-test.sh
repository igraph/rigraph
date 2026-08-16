#!/usr/bin/env bash
# Load every named package in its own R session, several at a time, each on a
# clock.
#
# Usage:
#   load-test.sh <package-list-file> <library> <seconds> <jobs>
#
# Reads one package name per line. Prints one line per package:
#
#   OK   <package> <seconds>
#   FAIL <package> <timeout|error> <seconds>
#
# Always exits 0: which packages failed is the caller's business, not the
# shell's.
#
# The `OK` lines are the whole log of a step that otherwise says nothing
# between "load-testing 498 packages" and the summary. They are also the only
# place a package that loads *slowly* -- half a minute of `.onLoad`, every
# time anything downstream of it is checked -- ever shows up. The caller folds
# them into a collapsed group, so the cost of the other 497 is a line nobody
# has to scroll past.
#
# Why one session per package rather than batches:
#
#   * a batch shares one clock, so one package that hangs spends the whole
#     budget and takes 39 innocent packages down with it, and the caller then
#     has to re-run each of them alone to find out which. Per package, the
#     answer is immediate and the blast radius is one.
#   * sessions are independent, so they run at once. A runner has four cores
#     and `loadNamespace()` is mostly I/O and dynamic linking, so the wall
#     clock falls by about the number of jobs.
#   * `timeout` sends TERM at the deadline and KILL a minute later, to the
#     process group, so a package whose `.onLoad` blocks on a socket is
#     actually killed rather than merely abandoned.

set -u

list=$1
lib=$2
seconds=$3
jobs=$4

# One package, one session, one clock. `--vanilla` so nothing in a profile
# loads anything this is supposed to be testing.
load_one() {
  local pkg=$1 status=0 start=${EPOCHSECONDS}
  timeout --kill-after=60s "${seconds}s" \
    Rscript --vanilla -e \
    ".libPaths(c('${lib}', .libPaths())); loadNamespace('${pkg}')" \
    > /dev/null 2>&1 || status=$?
  local took=$((EPOCHSECONDS - start))
  if [ "${status}" -eq 0 ]; then
    echo "OK ${pkg} ${took}"
  # 124 is coreutils' timeout; anything else is R saying something.
  elif [ "${status}" -eq 124 ] || [ "${status}" -eq 137 ]; then
    echo "FAIL ${pkg} timeout ${took}"
  else
    echo "FAIL ${pkg} error ${took}"
  fi
}
export -f load_one
export lib seconds

# GNU parallel where it exists, `xargs -P` where it does not -- the runners
# have both, but a local invocation may not, and the two are interchangeable
# for this.
if command -v parallel > /dev/null 2>&1; then
  parallel --will-cite -j "${jobs}" load_one :::: "${list}"
else
  xargs -a "${list}" -r -n 1 -P "${jobs}" -I '{}' \
    bash -c 'load_one "$@"' _ '{}'
fi

exit 0
