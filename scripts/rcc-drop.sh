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
# ## What it deliberately does not do
#
# It does not touch the commit's `rcc` commit status. That is a display surface
# and nothing decides from it -- but it means the commit still *shows* red until
# its rebuild writes a fresh one, which is expected, not a second thing to fix.
#
# ## What it reports
#
# A named commit the store holds no record for is undecided already. It is
# named on stderr and left out, and the drop goes on with the others: a drop
# run twice, or one naming a commit no leg has decided yet, is not an error.
# A string that is not a full SHA is one, before anything is read.
#
# Usage:
#   scripts/rcc-drop.sh <sha>...          # drop these commits' verdicts
#   scripts/rcc-drop.sh --stdin < shas    # one SHA per line, `#` comments ok
#   scripts/rcc-drop.sh --dry-run <sha>...  # read the store, change nothing
#
# Environment variables:
#   GH_TOKEN / GITHUB_TOKEN - token with contents:write on the repository
#   GITHUB_REPOSITORY       - owner/repo (required unless RCC_REMOTE is set)
#   RCC_REMOTE              - remote URL, overriding the above
#   RCC_DIR, RCC_READ_DIR   - where scripts/rcc-publish.sh and
#                             scripts/rcc-decided.sh cache their clones
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

# Full 40-hex only, lowercase, and the whole string. An abbreviated SHA names no
# path in the store, so it would drop nothing and report success -- the one
# failure mode that looks like a clean run.
for sha in "${shas[@]}"; do
  [[ "${sha}" =~ ^[0-9a-f]{40}$ ]] || {
    echo "not a full 40-character lowercase hex SHA: ${sha}" >&2
    exit 1
  }
done

# A commit named twice is dropped once, and counted once.
mapfile -t shas < <(printf '%s\n' "${shas[@]}" | awk '!seen[$0]++')

BRANCH="${BRANCH:-rcc2}"

work="$(mktemp -d)"
trap 'rm -rf "${work}"' EXIT
stage="${work}/stage"
mkdir "${stage}"

# The commits the store holds a record for, read the way work selection reads
# them (scripts/rcc-decided.sh). A store that cannot be reached stops the drop
# there; a named commit with no record is reported and left out, so that the
# count below is of verdicts actually dropped.
BRANCH="${BRANCH}" "${here}/rcc-decided.sh" > "${work}/decided"
found=()
for sha in "${shas[@]}"; do
  if grep -qxF -- "${sha}" "${work}/decided"; then
    found+=("${sha}")
  else
    echo "${sha}: no record on ${BRANCH}, so it is undecided already" >&2
  fi
done

if [ "${#found[@]}" -eq 0 ]; then
  echo "Nothing to drop from ${BRANCH}."
  exit 0
fi

# The staging directory carries removals and nothing else: `rcc-publish.sh`
# reads `.remove` for paths to unstage, and every other file in the directory as
# a path to add. So the drop reuses its whole race protocol -- fetch the tip,
# rebuild the index, retry on a lost push -- and adds no second way to write to
# this branch.
for sha in "${found[@]}"; do
  printf '%s\n%s\n' "$(rcc_part_path "${sha}")" "$(rcc_log_path "${sha}")"
done > "${stage}/.remove"

if [ -n "${DRY_RUN}" ]; then
  echo "Would drop ${#found[@]} verdict(s) from ${BRANCH}:"
  cat "${stage}/.remove"
  exit 0
fi

message="chore(${BRANCH}): Drop ${#found[@]} verdict(s) the commits did not decide"
if [ -n "${RCC_DROP_REASON:-}" ]; then
  message="${message}

${RCC_DROP_REASON}"
fi
message="${message}

These commits are undecided again and the next each-rcc run on their branch
plans them. Their stale rcc statuses stay until that run writes fresh ones
(scripts/rcc-drop.sh)."

"${here}/rcc-publish.sh" "${message}" "${stage}"
