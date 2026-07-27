#!/bin/bash
# Trigger rcc workflow runs for commits on a branch that don't yet have a build status.
#
# Considers all commits on or after 2026-01-01 in the first-parent history from HEAD.
# For each such commit, checks for an existing rcc build status (success, failure, or
# running/pending).  Commits without any status are triggered in chronological order
# (oldest first).  All qualifying commits are always inspected and all pending ones
# are always triggered — there is no cap.
#
# To re-trigger builds for specific commits: rebase those commits above the boundary
# commit and force-push.  The script will then pick them up on the next run.
#
# Usage:
#   GH_TOKEN=<token> scripts/each-rcc.sh
#
# Local testing example (check out the branch first, then run):
#   git checkout my-feature-dev
#   GH_TOKEN=$(gh auth token) scripts/each-rcc.sh
#
# Environment variables:
#   GH_TOKEN  - GitHub token with statuses:read and actions:write (required)
#   SINCE     - earliest commit date to consider, ISO 8601 (default: 2026-01-01)
#   DRY_RUN   - if non-empty, print what would be triggered without actually running

set -euo pipefail

REF="$(git symbolic-ref HEAD)"
SINCE="${SINCE:-2026-01-01}"

gh auth status

echo "Branch ref: ${REF}"
echo "Scanning all commits on or after ${SINCE}"

commits_to_run=()

while IFS= read -r commit; do
  # Look for any rcc status on this commit (success, failure, pending/running)
  status=$(gh api "repos/{owner}/{repo}/commits/${commit}/statuses" \
    | jq -r '.[] | select(.context == "rcc") | .state' \
    | head -n 1)

  if [[ -n "$status" ]]; then
    echo "${commit}: already has status '${status}', skipping"
  else
    echo "${commit}: no status, queuing"
    commits_to_run+=("$commit")
  fi
done < <(git log --first-parent --pretty=format:"%H" --after="${SINCE}" --)

total="${#commits_to_run[@]}"
echo "Commits to trigger rcc for: ${total}"

if (( total == 0 )); then
  echo "Nothing to do"
  exit 0
fi

# Trigger in chronological order (oldest first)
scheduled=0
for (( i=total-1; i>=0; i-- )); do
  commit="${commits_to_run[$i]}"
  if [[ -n "${DRY_RUN:-}" ]]; then
    echo "[dry-run] Would trigger rcc for commit ${commit}"
  else
    echo "Triggering rcc for commit ${commit}"
    gh workflow run rcc -f ref="$commit" -r "$REF"
  fi
  scheduled=$(( scheduled + 1 ))
done

echo "Scheduled ${scheduled} run(s)"
