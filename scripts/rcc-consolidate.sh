#!/bin/bash
# Consolidate the orphan `rcc2` branch: drop everything past the retention
# window, and squash the whole history to two commits.
#
# Run by hand, from an operator's checkout, never on a schedule.
# Everything else that writes to this branch is additive and races safely
# (scripts/rcc-publish.sh); this one rewrites it, and the one thing
# that makes a rewrite safe is knowing nothing else is mid-flight. A schedule
# cannot know that. The force-push carries a lease, so if something did land in
# between, the push is refused rather than silently discarding it.
#
# ## Who owns what on the `rcc2` branch
#
# | Writer | Adds | Rewrites |
# |---|---|---|
# | an `each-rcc` leg | its own record and log | a verdict it is overturning |
# | `rcc-logs.sh`, by hand | records for commits it finds undecided | nothing |
# | **this script** | — | **all of it** |
#
# Everything routine is additive and lands one file per commit, which is what
# lets it run concurrently without coordination. The two destructive operations
# -- deleting what has aged out, discarding history -- are collected here, where
# they happen once and under supervision.
#
# ## What it drops
#
# Records and logs alike, past `RCC_RETENTION_DAYS`, plus any log whose commit
# has no record at all -- nothing reads those and nothing can date them.
#
# Dropping records, and not only logs, is what makes the retention window one
# number rather than two. A verdict for a commit decided months ago and long
# since repaired is read by nothing: selection is bounded by `<S>-green`, which
# is far newer, and a commit that somehow did fall outside the window would be
# rebuilt rather than misjudged. The window is load-bearing in the other
# direction too -- scripts/rcc-logs.sh derives its `SINCE` from it, so the
# backstop never re-derives what this script has just deleted.
#
# Logs are still the bulk of what goes: `logs2.d/<xx>/<sha>.log` is ~1 MB of
# harvested output per failed commit against ~2 KB for a record.
#
# Usage:
#   OUT_DIR=runs scripts/rcc-consolidate.sh            # report, change nothing
#   OUT_DIR=runs APPLY=1 scripts/rcc-consolidate.sh    # rewrite and force-push
#
# Environment variables:
#   OUT_DIR             - the `rcc2` worktree to consolidate (default: runs)
#   RCC_RETENTION_DAYS  - keep records and logs at most this old (default: 180);
#                         0 keeps everything, and then only the squash happens
#   APPLY               - if non-empty, commit and force-push; otherwise report
#                         what would change and leave the branch alone
#   BRANCH              - branch to rewrite (default: rcc2)
#   REMOTE              - remote to push to (default: origin)

set -euo pipefail

here="$(cd "$(dirname "$0")" && pwd)"
. "${here}/rcc-lib.sh"

OUT_DIR="${OUT_DIR:-runs}"
APPLY="${APPLY:-}"
BRANCH="${BRANCH:-rcc2}"
REMOTE="${REMOTE:-origin}"

[ -d "${OUT_DIR}" ] || { echo "OUT_DIR does not exist: ${OUT_DIR}" >&2; exit 1; }

git_out() { git -C "${OUT_DIR}" "$@"; }

# Every shape this branch can legitimately have, up front. A branch bootstrapped
# by a leg that has only ever seen successes has no `logs2.d/` at all, so neither
# directory missing is an error -- but under `set -e` every probe below would
# abort on it, and an operator running the dry run to *find out* what state
# the branch is in deserves a report rather than a bare `find` error.
mkdir -p "${OUT_DIR}/runs2.d" "${OUT_DIR}/logs2.d"

before_tip="$(git_out rev-parse HEAD)"
before_commits="$(git_out rev-list --count HEAD)"
before_bytes="$(git_out rev-list --disk-usage --objects HEAD 2>/dev/null || echo 0)"
before_records="$(rcc_record_shas "${OUT_DIR}" | wc -l | tr -d ' ')"
before_logs="$(rcc_log_shas "${OUT_DIR}" | wc -l | tr -d ' ')"

echo "== ${BRANCH} before =="
echo "   commits:  ${before_commits}"
echo "   records:  ${before_records}"
echo "   logs:     ${before_logs}"
echo "   objects:  $(( before_bytes / 1048576 )) MB"
echo

# ------------------------------------------------------------------- triage ---
# The dry run is genuinely dry: rcc_prune computes exactly what the real thing
# would delete and, in this mode, deletes none of it.
echo "== dropping records and logs older than ${RCC_RETENTION_DAYS} day(s) =="
if [ "${RCC_RETENTION_DAYS}" -gt 0 ]; then
  echo "   cutoff: $(rcc_cutoff "${RCC_RETENTION_DAYS}")"
else
  echo "   retention disabled, keeping everything"
fi

mode="dry"
[ -n "${APPLY}" ] && mode="apply"
rcc_prune "${OUT_DIR}" "${RCC_RETENTION_DAYS}" "${mode}"
echo "   records: ${RCC_PRUNED_RECORDS} aged out, ${RCC_KEPT_RECORDS} kept"
echo "   logs:    ${RCC_PRUNED_LOGS} dropped (${RCC_ORPHAN_LOGS} of them without" \
  "a record), ${RCC_KEPT_LOGS} kept"
echo

if [ -z "${APPLY}" ]; then
  echo "== dry run =="
  echo "   Nothing was changed. Re-run with APPLY=1 to rewrite ${BRANCH} and"
  echo "   force-push it as two commits."
  exit 0
fi

# ------------------------------------------------------------------- squash ---
# Two commits: an empty root, and everything. The root is *inherited* when the
# branch already has one -- consolidating twice must not keep minting new roots,
# or every consolidation would invalidate every clone twice over.
message="rcc: consolidated $(date -u +%Y-%m-%dT%H:%M:%SZ)

${RCC_KEPT_RECORDS} records, ${RCC_KEPT_LOGS} logs.
Dropped ${RCC_PRUNED_RECORDS} record(s) and ${RCC_PRUNED_LOGS} log(s) past ${RCC_RETENTION_DAYS} days.
Replaces ${before_commits} commits."

rcc_squash "${OUT_DIR}" "${message}"
new="${RCC_SQUASH_COMMIT}"
if [ "${RCC_ROOT_INHERITED}" = "1" ]; then
  echo "Inheriting the existing empty root ${RCC_INITIAL_ROOT:0:9}"
else
  echo "Minting an empty root ${RCC_INITIAL_ROOT:0:9}"
fi
after_bytes="$(git_out rev-list --disk-usage --objects "${new}" 2>/dev/null || echo 0)"

echo
echo "== ${BRANCH} after =="
echo "   commits:  2 (was ${before_commits})"
echo "   records:  ${RCC_KEPT_RECORDS} (was ${before_records})"
echo "   logs:     ${RCC_KEPT_LOGS} (was ${before_logs})"
echo "   objects:  $(( after_bytes / 1048576 )) MB (was $(( before_bytes / 1048576 )) MB)"
echo

# The lease is what makes "run it manually" a guarantee rather than a hope: a
# writer that landed between our read and this push moves the ref off
# `before_tip`, and the push is refused instead of discarding it.
echo "Force-pushing ${new:0:9} to ${REMOTE}/${BRANCH} (lease on ${before_tip:0:9})"
git_out push --force-with-lease="refs/heads/${BRANCH}:${before_tip}" \
  "${REMOTE}" "${new}:refs/heads/${BRANCH}"

echo "Done. Existing clones need \`git fetch --force\` or a fresh clone."
