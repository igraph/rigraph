#!/bin/bash
# Print the SHA of every commit the verdict store has decided, one per line.
#
# The verdict store is the orphan `rcc2` branch: one record per commit at
# `runs2.d/<xx>/<sha>.ndjson`, published by the leg that decided it within
# seconds of the verdict existing (scripts/rcc-publish.sh,
# handbook/operations/ci/per-commit/store/README.md). Presence is the whole
# question -- a commit with a record has been
# decided, a commit without one has not -- so the answer is one `ls-tree` over a
# tree-only fetch rather than a request per commit.
#
# This is what work selection reads: scripts/each-plan.sh to choose what to
# build, scripts/each-shard.sh to skip what a previous attempt already decided.
# Both used to read commit statuses instead, which made the record store and the
# status store two answers to the same question that had to be reconciled --
# newest-writer rules, a `PENDING_TTL_HOURS` heuristic, and a backstop that
# derived records *from* statuses. One store needs none of that. Statuses stay,
# as a display surface on the commit list.
#
# The store keeps `RCC_RETENTION_DAYS` of history, so a commit older than that
# reports as undecided. Nothing asks: selection is bounded by `<S>-green`, which
# is far newer than the window, and the cost of being wrong about it is a rebuild
# rather than a wrong verdict.
#
# Reachability is not the same question as emptiness, and the two exit
# differently: no `rcc2` branch on the remote means nothing has been decided yet
# (empty output, success), while a remote that cannot be reached is an error --
# answering "nothing is decided" there would replan every commit in range.
#
# Usage:
#   scripts/rcc-decided.sh > decided.txt
#
# Environment variables:
#   GH_TOKEN / GITHUB_TOKEN - token with contents:read on the repository
#   GITHUB_REPOSITORY       - owner/repo (required unless RCC_REMOTE is set)
#   GITHUB_SERVER_URL       - default: https://github.com
#   RCC_REMOTE              - remote URL, overriding the two above; how the test
#                             harness points this at a local bare repository
#   RCC_READ_DIR            - where the branch clone is cached between calls
#                             (default: $RUNNER_TEMP/rcc-read); must be outside
#                             the workspace, which scripts/each-shard.sh wipes.
#                             Deliberately not RCC_DIR: that one belongs to
#                             scripts/rcc-publish.sh, and the two clones want
#                             different fetch filters.
#   BRANCH                  - default: rcc2

set -euo pipefail

here="$(cd "$(dirname "$0")" && pwd)"
. "${here}/rcc-lib.sh"

RCC_READ_DIR="${RCC_READ_DIR:-${RUNNER_TEMP:-/tmp}/rcc-read}"
BRANCH="${BRANCH:-rcc2}"

rcc_clone_init "${RCC_READ_DIR}"

rc=0
rcc_branch_probe "${RCC_READ_DIR}" "${BRANCH}" || rc=$?
case "${rc}" in
  0) ;;
  2)
    echo "rcc-decided: no ${BRANCH} branch on the remote -- nothing is decided yet" >&2
    exit 0
    ;;
  *)
    echo "rcc-decided: cannot reach the remote to read the ${BRANCH} branch" >&2
    exit 1
    ;;
esac

tip="$(rcc_fetch_tip "${RCC_READ_DIR}" "${BRANCH}")" || {
  echo "rcc-decided: could not fetch ${BRANCH} from the remote" >&2
  exit 1
}

# Anything that is not a well-formed part path is not a verdict, and is dropped
# rather than guessed at.
git -C "${RCC_READ_DIR}" ls-tree -r --name-only "${tip}" -- runs2.d |
  sed -n 's#^runs2\.d/[0-9a-f][0-9a-f]/\([0-9a-f]\{40\}\)\.ndjson$#\1#p'
