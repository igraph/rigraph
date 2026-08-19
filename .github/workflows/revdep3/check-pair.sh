#!/usr/bin/env bash
# Check one package against both versions of the package under test at once.
#
# The two checks are independent -- separate work directories, separate
# library stacks that differ in exactly one package -- so there is no reason
# to run them one after the other. Running the pair concurrently halves a
# package's wall clock and, when one of them hangs, still gets the other's
# answer instead of never reaching it.
#
# Each half now runs in a container of its own (check-half.sh), and that is
# a categorical change, not a tuning one. On the shared host the two halves
# collided on anything with a global name. The collision that actually
# struck was the PSOCK port: `parallel` picks its default port once per
# session, from the RNG and the clock; `set.seed()` makes the draw
# deterministic; and in run 31893156685 that cost `cia` and `TDApplied`,
# both reported newly broken with nothing wrong with them. The fix then was
# a hand-picked R_PARALLEL_PORT per half -- a patch for exactly that one
# mechanism, with the shared /tmp, the shared process table and every other
# global name still waiting their turn. Per-container namespaces retire the
# whole class at once: each half gets its own loopback, its own /tmp on its
# own disk budget, its own PID space. The port dodge is gone because nothing
# is shared to dodge.
#
# The library stacks still cascade, but the shared trunk is baked into the
# image: check-half.sh puts /revdepx/lib-half in front of /opt/revdepx/lib
# on R_LIBS, and the mounted half-library holds exactly one package -- the
# CRAN release for `old`, the dev build for `new`.
#
# The host design also ran the checks under nice/ionice so the runner agent
# would never starve behind them; per-container `--cpu-shares` (set in
# check-half.sh) does that job now, with the same property of only biting
# when there is more work than cores.
#
# Usage:
#   check-pair.sh <tarball> <workdir> <lib-old> <lib-new> <seconds>
#
# The old shared-library argument is gone: the shared library lives in the
# universe image named by REVDEPX_IMAGE, which -- with the other REVDEPX_*
# knobs -- passes straight through to check-half.sh. Paths must be absolute.
#
# Leaves <workdir>/{old,new}/ holding the .Rcheck directory, `driver.log`
# (what R CMD check said), `status` (its exit code; 124 is the timeout, per
# coreutils `timeout`) and possibly `oom` -- see check-half.sh for the full
# inventory. Always exits 0: which of the two failed, and how, is for the
# caller to read out of those files.

set -u

tarball=$1
work=$2
lib_old=$3
lib_new=$4
seconds=$5

check_half="$(dirname "$0")/../revdepx/check-half.sh"

# Each half is capped at half the machine's memory, less 2 GB kept back for
# the runner agent and the docker daemon, with a 2 GB floor so a small
# machine still gets a workable cap. What the cap buys is *where* the OOM
# kill lands. Uncapped, a hungry check takes the runner down -- "The hosted
# runner lost communication with the server", every package on the shard
# lost. Capped, the kernel kills the one container, check-half.sh records
# `oom` next to the status, and the manifest names the one package. A
# REVDEPX_MEMORY already in the environment wins: the caller sized it
# deliberately. REVDEPX_MEMORY_PER_CHECK is the same knob under the name the
# two engines share -- the yaml sets it to 6g by default; the derivation
# below is the fallback when neither is set.
if [ -z "${REVDEPX_MEMORY:-}" ] && [ -n "${REVDEPX_MEMORY_PER_CHECK:-}" ]; then
  REVDEPX_MEMORY=${REVDEPX_MEMORY_PER_CHECK}
  export REVDEPX_MEMORY
fi
if [ -z "${REVDEPX_MEMORY:-}" ]; then
  mem_kb=$(awk '/^MemTotal:/ { print $2 }' /proc/meminfo 2> /dev/null || echo 0)
  half_mb=$(((mem_kb / 1024 - 2048) / 2))
  if [ "${half_mb}" -lt 2048 ]; then
    half_mb=2048
  fi
  REVDEPX_MEMORY="${half_mb}m"
  export REVDEPX_MEMORY
fi

"${check_half}" old "${tarball}" "${work}" "${lib_old}" "${seconds}" &
old_pid=$!
"${check_half}" new "${tarball}" "${work}" "${lib_new}" "${seconds}" &
new_pid=$!

wait "${old_pid}"
wait "${new_pid}"

exit 0
