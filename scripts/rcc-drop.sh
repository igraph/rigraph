#!/bin/bash
# Drop named commits' verdicts from the store on the orphan `rcc2` branch.
#
# A verdict is normally overturned by a newer run judging the same commit
# (scripts/each-shard.sh), and that is the route to prefer: it replaces one
# record with another and leaves the store self-consistent. This script is for
# the case that route cannot reach -- a verdict the *harness* decided, which no
# rerun of the commit as it stands would overturn, because the commit was never
# what failed.
#
# Removing the record is what makes the commit undecided: work selection reads
# presence and nothing else (scripts/rcc-decided.sh), so the next `each-rcc` run
# on the branch plans it like a commit that had never been built. The log goes
# with it, because a log whose record is gone is read by nothing and dated by
# nothing (scripts/rcc-consolidate.sh drops such orphans anyway).
#
# ## When this is the right tool
#
# When the job decided the commit rather than the tree. The shape it was written
# for: a change to `.github/workflows/` reaches every build in the job -- the
# composite actions are resolved from the branch tip that triggered the run, not
# from the commit under test -- so a bad one turns commits red whose own trees
# have nothing to do with it, at the scale of everything the run touched.
# duckdb/duckdb-r#2620 appended `-Wno-redundant-move -Wno-unused-parameter` to
# `~/.R/Makevars`, where `R CMD check --as-cran` read them and refused them as
# non-portable flags; 166 commits across three series were red for it, and every
# one of them went green once duckdb/duckdb-r#2652 had landed and the records
# were dropped.
#
# `retry-<S>-dev` is the answer for one commit and is not this (see
# .claude/skills/series-loop/references/retry.md): it replans the tip of the retry branch alone,
# and it runs the workflow from the *retried commit's* tree, which is a
# different question from "judge it again under the tooling the branch carries
# today".
#
# ## When it is not
#
# A commit the tree genuinely broke is a repair, not a drop. Dropping its record
# only costs a rebuild to learn the same verdict again, and it erases the log
# that says why. The test is whether the same commit, built again on the branch
# as it stands now, would reach a different verdict; if the answer needs no
# change anywhere, this is not the tool.
#
# ## Two things it deliberately does not do
#
# It does not touch the commit's `rcc` commit status. That is a display surface
# and nothing decides from it -- but it means the commit still *shows* red until
# its rebuild writes a fresh one, which is expected, not a second thing to fix.
#
# And it must not be followed by dispatching `rcc-logs.yaml`. That workflow
# derives records for commits the store has no record for, from exactly those
# stale statuses, so a sweep behind a drop puts back what the drop removed.
#
# Usage:
#   scripts/rcc-drop.sh <sha>...          # drop these commits' verdicts
#   scripts/rcc-drop.sh --stdin < shas    # one SHA per line, `#` comments ok
#   scripts/rcc-drop.sh --dry-run <sha>...
#
# Environment variables:
#   GH_TOKEN / GITHUB_TOKEN - token with contents:write on the repository
#   GITHUB_REPOSITORY       - owner/repo (required unless RCC_REMOTE is set)
#   RCC_REMOTE              - remote URL, overriding the above
#   BRANCH                  - default: rcc2
#   RCC_DROP_REASON         - one line quoted into the commit message, saying
#                             what decided these verdicts if not the commits

set -euo pipefail

here="$(cd "$(dirname "$0")" && pwd)"
. "${here}/rcc-lib.sh"

usage='usage: rcc-drop.sh [--dry-run] [--stdin] [<sha>...]'

DRY_RUN=
FROM_STDIN=
shas=()
while [ $# -gt 0 ]; do
  case "$1" in
    --dry-run) DRY_RUN=1; shift ;;
    --stdin) FROM_STDIN=1; shift ;;
    -*) echo "$usage" >&2; exit 1 ;;
    *) shas+=("$1"); shift ;;
  esac
done

if [ -n "${FROM_STDIN}" ]; then
  while IFS= read -r line; do
    line="${line%%#*}"
    line="$(printf '%s' "${line}" | tr -d '[:space:]')"
    [ -n "${line}" ] && shas+=("${line}")
  done
fi

[ "${#shas[@]}" -gt 0 ] || { echo "$usage" >&2; exit 1; }

# Full 40-hex only. An abbreviated SHA names no path in the store, so it would
# drop nothing and report success -- the one failure mode that looks like a
# clean run.
for sha in "${shas[@]}"; do
  case "${sha}" in
    [0-9a-f]*) ;;
    *) echo "not a lowercase hex SHA: ${sha}" >&2; exit 1 ;;
  esac
  [ "${#sha}" -eq 40 ] || {
    echo "not a full 40-character SHA: ${sha}" >&2
    exit 1
  }
done

BRANCH="${BRANCH:-rcc2}"

stage="$(mktemp -d)"
trap 'rm -rf "${stage}"' EXIT

# The staging directory carries removals and nothing else: `rcc-publish.sh`
# reads `.remove` for paths to unstage, and every other file in the directory as
# a path to add. So the drop reuses its whole race protocol -- fetch the tip,
# rebuild the index, retry on a lost push -- and adds no second way to write to
# this branch.
for sha in "${shas[@]}"; do
  rcc_part_path "${sha}" >> "${stage}/.remove"
  printf '\n' >> "${stage}/.remove"
  rcc_log_path "${sha}" >> "${stage}/.remove"
  printf '\n' >> "${stage}/.remove"
done

if [ -n "${DRY_RUN}" ]; then
  echo "Would drop ${#shas[@]} verdict(s) from ${BRANCH}:"
  cat "${stage}/.remove"
  exit 0
fi

message="chore(${BRANCH}): Drop ${#shas[@]} verdict(s) the commits did not decide"
if [ -n "${RCC_DROP_REASON:-}" ]; then
  message="${message}

${RCC_DROP_REASON}"
fi
message="${message}

These commits are undecided again and the next each-rcc run on their branch
plans them. Their stale rcc statuses stay until that run writes fresh ones;
rcc-logs.yaml must not be dispatched behind this, or it derives the dropped
records back from them (scripts/rcc-drop.sh)."

"${here}/rcc-publish.sh" "${message}" "${stage}"
