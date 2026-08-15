#!/usr/bin/env bash
# Check one package against both versions of the package under test at once.
#
# The two checks are independent -- separate processes, separate check
# directories, and separate library stacks that differ in exactly one package
# -- so there is no reason to run them one after the other. A runner has four
# cores and one `R CMD check` keeps about one of them busy; running the pair
# concurrently halves a package's wall clock and, when one of them hangs, still
# gets the other's answer instead of never reaching it.
#
# The library stacks cascade. `R_LIBS` is a search path, so the shared library
# holding every dependency is named by both, and the version-specific library
# in front of it holds exactly one package: the CRAN release for `old`, the dev
# build for `new`. Nothing is installed or uninstalled between the phases,
# which is what used to force them apart.
#
# Usage:
#   check-pair.sh <tarball> <workdir> <lib-old> <lib-new> <lib-shared> <seconds>
#
# Leaves <workdir>/{old,new}/ holding the .Rcheck directory, `driver.log` (what
# R CMD check said) and `status` (its exit code; 124 is the timeout, per
# coreutils `timeout`). Always exits 0: which of the two failed, and how, is
# for the caller to read out of those files.

set -u

tarball=$1
work=$2
lib_old=$3
lib_new=$4
lib_shared=$5
seconds=$6

# Seconds since the check started, in front of every line it prints.
#
# `R CMD check` only reports a stage's own time when it exceeds its threshold,
# and never for the stage it was killed in -- which is the one worth knowing
# about. Stamping the stream costs nothing and turns "timed out at * checking
# examples with --run-donttest" into how long every stage before it took, and
# how long that one had been running. `EPOCHSECONDS` is a bash builtin, so
# this spawns nothing per line.
stamp() {
  local start=${EPOCHSECONDS} line
  while IFS= read -r line; do
    printf '[%5ds] %s\n' "$((EPOCHSECONDS - start))" "${line}"
  done
}

check_one() {
  local phase=$1
  local lib=$2
  local out="${work}/${phase}"
  mkdir -p "${out}"
  # `timeout` sends TERM at the deadline and KILL a minute later, and R CMD
  # check's own children go with it because it runs in its own process group.
  # The status is PIPESTATUS[0] because the stamping is downstream of it.
  R_LIBS="${lib}:${lib_shared}" \
    timeout --kill-after=60s "${seconds}s" \
    R CMD check --no-manual --as-cran --output="${out}" "${tarball}" 2>&1 |
    stamp > "${out}/driver.log"
  echo "${PIPESTATUS[0]}" > "${out}/status"
}

check_one old "${lib_old}" &
old_pid=$!
check_one new "${lib_new}" &
new_pid=$!

wait "${old_pid}"
wait "${new_pid}"

exit 0
