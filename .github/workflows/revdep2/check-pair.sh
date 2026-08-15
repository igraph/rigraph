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

check_one() {
  local phase=$1
  local lib=$2
  local out="${work}/${phase}"
  mkdir -p "${out}"
  # `timeout` sends TERM at the deadline and KILL a minute later, and R CMD
  # check's own children go with it because it runs in its own process group.
  R_LIBS="${lib}:${lib_shared}" \
    timeout --kill-after=60s "${seconds}s" \
    R CMD check --no-manual --as-cran --output="${out}" "${tarball}" \
    > "${out}/driver.log" 2>&1
  echo $? > "${out}/status"
}

check_one old "${lib_old}" &
old_pid=$!
check_one new "${lib_new}" &
new_pid=$!

wait "${old_pid}"
wait "${new_pid}"

exit 0
