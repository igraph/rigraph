#!/usr/bin/env bash
# Run one half of a package's check -- old or new -- in a container of its own.
#
# The container replaces a class of fixes this workflow used to make one at a
# time. Two concurrent checks on a shared host collide on anything with a
# global name, and the collision that actually drew blood was the PSOCK port:
# `parallel` picks its default port once per session, from the RNG and the
# clock; `set.seed()` -- which examples, vignettes and tests call constantly,
# for reproducibility -- makes the draw deterministic, and two halves that
# start together draw the same port. Run 31893156685 reported `cia` and
# `TDApplied` newly broken with nothing wrong with either. The fix then was a
# hand-picked R_PARALLEL_PORT per half: correct, and strictly per-mechanism.
# The next global name -- a socket path in /tmp, a lock file, a port some
# test suite hard-codes -- was still waiting its turn. A container gives each
# half its own network, PID and mount namespaces and its own /tmp, so the
# collisions dissolve as a class: the port hack is gone because there is
# nothing shared left to dodge.
#
# Usage:
#   check-half.sh <half:old|new> <tarball> <workdir> <half-lib> <seconds>
#
# All paths must be absolute -- docker mounts them into the container.
#
# Environment:
#   REVDEPX_IMAGE        - universe image ref to run the check in (required)
#   REVDEPX_MEMORY       - per-container memory cap, e.g. 6g (optional).
#                          --memory-swap is set to the same value, so the cap
#                          is real: no swapping past it; a check that wants
#                          more is OOM-killed inside its container instead of
#                          taking the runner down.
#   REVDEPX_CPU_SHARES   - relative CPU weight under contention (default 512,
#                          half a default container's 1024, so checks yield
#                          to whatever else the runner is doing -- the job
#                          nice/ionice did in the host design)
#   REVDEPX_UNIVERSE_LIB - dependency library inside the image
#                          (default /opt/revdepx/lib)
#
# Leaves <workdir>/<half>/ holding the .Rcheck directory, `driver.log` (what
# R CMD check said, each line stamped with elapsed seconds), `status` (the
# check's exit code; 124 is the timeout, per coreutils `timeout`; 125 and up
# is docker failing, not the package) and `oom` when the kernel's OOM killer
# ended it. Always exits 0: which half failed, and how, is for the caller to
# read out of those files.

set -u

# The environment a check sees. A container starts clean -- that is its whole
# point -- so what the workflow sets for checks is forwarded by name, from
# this one list. `-e NAME` without a value hands the client's current value
# through, and is emitted only for names that are actually set, so the
# container never receives an empty string where the workflow meant "unset".
forward_env=(
  NOT_CRAN
  R_REMOTES_NO_ERRORS_FROM_WARNINGS
  RGL_USE_NULL
  _R_CHECK_CRAN_INCOMING_
  _R_CHECK_SYSTEM_CLOCK_
  _R_CHECK_FUTURE_FILE_TIMESTAMPS_
  _R_CHECK_FORCE_SUGGESTS_
  _R_CHECK_DONTTEST_EXAMPLES_
  _R_CHECK_CRAN_INCOMING_USE_ASPELL_
  _R_CHECK_TIMINGS_
  _R_CHECK_EXAMPLE_TIMING_THRESHOLD_
  _R_CHECK_TESTS_NLINES_
)

half=$1
tarball=$2
work=$3
lib_half=$4
seconds=$5

out="${work}/${half}"
# The container's /tmp and HOME are subdirectories of the half's own workdir:
# per half, on the big disk, gone with the workdir. A check that fills its
# /tmp fills its own, not its sibling's and not the runner's.
mkdir -p "${out}/tmp" "${out}/home"

# Seconds since the check started, in front of every line it prints.
#
# `R CMD check` only reports a stage's own time when it exceeds its
# threshold, and never for the stage it was killed in -- which is the one
# worth knowing about. Stamping the stream costs nothing and turns "timed out
# at * checking examples with --run-donttest" into how long every stage
# before it took, and how long that one had been running. `EPOCHSECONDS` is a
# bash builtin, so this spawns nothing per line.
stamp() {
  local start=${EPOCHSECONDS} line
  while IFS= read -r line; do
    printf '[%5ds] %s\n' "$((EPOCHSECONDS - start))" "${line}"
  done
}

# No --rm: the OOM verdict below is read from the exited container's state,
# which --rm would have deleted before it could be asked. The trap is the
# cleanup instead, and it also covers the outer-timeout path, where the
# docker client is killed while the container is still running.
cidfile="${out}/cid"
rm -f "${cidfile}"
cleanup() {
  if [ -s "${cidfile}" ]; then
    docker rm -f "$(cat "${cidfile}")" > /dev/null 2>&1 || true
  fi
  rm -f "${cidfile}"
}
trap cleanup EXIT

image=${REVDEPX_IMAGE:-}
if [ -z "${image}" ]; then
  echo "REVDEPX_IMAGE is not set; there is nothing to run the check in" \
    > "${out}/driver.log"
  echo 125 > "${out}/status"
  exit 0
fi

src_name=$(basename "${tarball}")
universe_lib=${REVDEPX_UNIVERSE_LIB:-/opt/revdepx/lib}

run_args=(
  # A real PID 1 in front of the command: zombies are reaped, signals are
  # forwarded, and whatever a test suite leaves running dies with the
  # container when the command exits, instead of outliving the check.
  --init
  --cidfile "${cidfile}"
  # Its own loopback -- which *is* the port fix -- plus outbound network for
  # the checks that insist on trying.
  --network bridge
  # A runaway test suite cannot fork the runner to death from in here.
  --pids-limit 2048
  --cpu-shares "${REVDEPX_CPU_SHARES:-512}"
  # The runner's own uid/gid, so everything written into the mounted workdir
  # is the driver's to read and delete. That user has no passwd entry inside
  # the container, hence HOME, USER and LOGNAME by hand -- R and half the
  # packages it checks ask for them.
  --user "$(id -u):$(id -g)"
  -e HOME=/revdepx/out/home
  -e USER=revdepx
  -e LOGNAME=revdepx
  -v "${tarball}:/revdepx/src/${src_name}:ro"
  -v "${out}:/revdepx/out"
  -v "${out}/tmp:/tmp"
  -v "${lib_half}:/revdepx/lib-half:ro"
)
if [ -n "${REVDEPX_MEMORY:-}" ]; then
  run_args+=(--memory "${REVDEPX_MEMORY}" --memory-swap "${REVDEPX_MEMORY}")
fi
for name in "${forward_env[@]}"; do
  if [ -n "${!name+x}" ]; then
    run_args+=(-e "${name}")
  fi
done

# The library stacks cascade exactly as before: the half-specific library in
# front holds one package -- the CRAN release or the dev build -- and the
# shared trunk behind it is baked into the image.
in_container="R_LIBS='/revdepx/lib-half:${universe_lib}' TMPDIR=/tmp \
timeout --kill-after=60s ${seconds}s \
R CMD check --no-manual --as-cran --output=/revdepx/out \
'/revdepx/src/${src_name}'"

# Two clocks. The inner `timeout` is the check's real deadline: TERM at
# <seconds>, KILL a minute later, and its exit 124 comes back through docker
# as the container's own code. The outer one is the safety net for the case
# where the inner one cannot fire -- a wedged container runtime, a daemon
# that stops answering -- with 300 s of slack for container start and
# teardown; when it fires it kills the docker client and the trap removes
# the container. The status is PIPESTATUS[0] because the stamping is
# downstream of it. 125, 126 and 127 out of `docker run` mean docker could
# not run the check at all, and the log says so explicitly rather than
# letting it read as a package failure.
run_started=${EPOCHSECONDS}
timeout "$((seconds + 300))s" \
  docker run "${run_args[@]}" "${image}" sh -c "${in_container}" 2>&1 |
  stamp > "${out}/driver.log"
status=${PIPESTATUS[0]}
# Both clocks exit 124, and they mean different things: the inner one is the
# check hitting its budget (a result about the package), the outer one is a
# wedged container runtime (a result about the runner). Tell them apart by
# when the axe fell -- the outer clock cannot fire before seconds+300 -- and
# report the outer case as a docker-level failure so the manifest does not
# call a healthy package's check "timed out".
if [ "${status}" -eq 124 ] \
  && [ "$((EPOCHSECONDS - run_started))" -ge "$((seconds + 295))" ]; then
  status=125
  echo "the outer safety-net timeout fired at $((seconds + 300))s: the container runtime stopped answering -- the runner's failure, not the package's" \
    >> "${out}/driver.log"
fi
echo "${status}" > "${out}/status"
if [ "${status}" -ge 125 ]; then
  echo "docker run exited ${status}: the container could not run -- the runner's failure, not the package's" \
    >> "${out}/driver.log"
fi

# The one verdict only the container's post-mortem state can give. The
# memory cap turns a hungry check into an OOM kill *inside* the container;
# the check's exit status then looks like any other crash, and this marker
# is what tells the caller the difference.
if [ -s "${cidfile}" ]; then
  if [ "$(docker inspect --format '{{.State.OOMKilled}}' "$(cat "${cidfile}")" \
    2> /dev/null)" = "true" ]; then
    echo "oom" > "${out}/oom"
    echo "the kernel OOM killer ended this check (memory cap ${REVDEPX_MEMORY:-none})" \
      >> "${out}/driver.log"
  fi
fi

exit 0
