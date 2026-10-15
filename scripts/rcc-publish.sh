#!/bin/bash
# Publish a staging directory to the verdict store on the orphan `rcc2` branch.
#
# This is the only writer every producer goes through -- the matrix leg
# publishing one commit's verdict as it decides it (scripts/each-shard.sh), and
# the hand-run backstop (scripts/rcc-logs.sh). They differ in what they stage,
# not in how it lands.
#
# One writer is possible because the store is one file per commit and nothing
# else (scripts/rcc-lib.sh): two producers recording different commits stage
# different paths, so there is nothing to merge, and losing the ref race costs a
# tree fetch and a re-commit rather than a re-derivation. That was not true while
# a single `runs2.ndjson` carried every record -- appending to one file from two
# places conflicts on essentially every collision, which is why the old push
# wrapper had to reset onto the winner and re-run the producer to recover. With
# the aggregate gone, so is the recovery, and so is the re-derive command every
# caller had to supply.
#
# The branch is reached through a blobless, shallow, checkout-less clone and
# written with plumbing, because the point is to *not* pay for it: a leg needs
# none of the store's harvested logs to add one file. `--filter=blob:none`
# fetches trees only, `read-tree`/`update-index`/`commit-tree` build the commit
# from the index alone, and the push sends the one new blob.
#
# Usage:
#   scripts/rcc-publish.sh <commit-message> <staging-dir>
#
# <staging-dir> mirrors the branch: every file under it is published at its path
# relative to the staging root. One name is reserved:
#
#   <staging-dir>/.remove   one on-branch path per line, to be deleted
#
# which is how a verdict that stops being a failure takes its log with it.
# Removals are applied after additions, so a path in both wins as a removal --
# but no caller should stage both, and nothing here pretends that is meaningful.
#
# Publishing what the branch already has costs nothing: blob ids are compared in
# the index, so identical content stages nothing and no commit is made. That is
# what makes a re-publish free and a retry -- where a commit is deliberately
# rebuilt on its own SHA to overturn a verdict that was never about its tree
# (.claude/skills/series-loop/SKILL.md) -- land as a replacement.
#
# Environment variables:
#   GH_TOKEN / GITHUB_TOKEN - token with contents:write on the repository
#   GITHUB_REPOSITORY       - owner/repo (required unless RCC_REMOTE is set)
#   GITHUB_SERVER_URL       - default: https://github.com
#   RCC_REMOTE              - remote URL, overriding the two above
#   RCC_DIR                 - where the branch clone is cached between calls
#                             (default: $RUNNER_TEMP/rcc-publish); must be
#                             outside the workspace, which scripts/each-shard.sh
#                             wipes between commits
#   BRANCH                  - default: rcc2
#   ATTEMPTS                - pushes to try before giving up (default: 20; a
#                             retry is a tree fetch and the staged files again,
#                             and the backoff caps at 8 s, so the whole budget is
#                             ~2 min against a build measured in tens of them)

set -euo pipefail

here="$(cd "$(dirname "$0")" && pwd)"
. "${here}/rcc-lib.sh"

if [ "$#" -ne 2 ]; then
  echo "usage: $0 <commit-message> <staging-dir>" >&2
  exit 1
fi

MESSAGE="$1"
STAGE="$2"

RCC_DIR="${RCC_DIR:-${RUNNER_TEMP:-/tmp}/rcc-publish}"
BRANCH="${BRANCH:-rcc2}"
ATTEMPTS="${ATTEMPTS:-20}"

[ -d "${STAGE}" ] || { echo "staging directory does not exist: ${STAGE}" >&2; exit 1; }
STAGE="$(cd "${STAGE}" && pwd)"

work="$(mktemp -d)"
trap 'rm -rf "${work}"' EXIT

# Resolved once: the retry loop re-stages the same files against a new tip, and
# re-walking the directory each time would let a producer still writing into it
# change what a retry publishes.
( cd "${STAGE}" && find . -type f ! -path './.remove' | sed 's#^\./##' ) \
  | LC_ALL=C sort > "${work}/add"
if [ -s "${STAGE}/.remove" ]; then
  grep -v '^[[:space:]]*$' "${STAGE}/.remove" | LC_ALL=C sort -u > "${work}/remove"
else
  : > "${work}/remove"
fi

if [ ! -s "${work}/add" ] && [ ! -s "${work}/remove" ]; then
  echo "Nothing staged; nothing to publish."
  exit 0
fi

rcc_clone_init "${RCC_DIR}"
git_rcc() { git -C "${RCC_DIR}" "$@"; }

# Stage from the index only -- no working tree is ever materialised, so none of
# the branch's blobs have to be fetched. Comparing blob ids rather than existence
# is what lets a retry overwrite: the id is already in the index, so "is this
# byte-for-byte what the branch has?" is answered without fetching the blob.
stage_if_changed() { # <path-on-branch> <source-file>
  local blob current
  blob="$(git_rcc hash-object -w --stdin < "$2")"
  current="$(git_rcc ls-files --format='%(objectname)' -- "$1")"
  [ "${current}" = "${blob}" ] && return 1
  # Staging a *replacement*: fetch the blob being replaced, which the push over
  # https asks for and cannot get. See the push below -- `--no-thin` does not
  # keep git from wanting it there, and a record is ~2 KB, so paying for it
  # here is cheaper than the failure it avoids. Only a replacement pays.
  if [ -n "${current}" ]; then
    ( unset GIT_NO_LAZY_FETCH; git_rcc cat-file blob "${current}" > /dev/null ) \
      || echo "could not fetch the blob at $1; the push may fail" >&2
  fi
  git_rcc update-index --add --cacheinfo "100644,${blob},$1"
  return 0
}

# Removing an index entry needs no blob either, so this is as cheap as staging.
unstage_if_present() { # <path-on-branch>
  git_rcc ls-files --error-unmatch -- "$1" > /dev/null 2>&1 || return 1
  git_rcc update-index --force-remove -- "$1"
  return 0
}

attempt=1
while :; do
  tip="$(rcc_fetch_tip "${RCC_DIR}" "${BRANCH}" || true)"

  if [ -n "${tip}" ]; then
    git_rcc read-tree "${tip}"
  else
    # No such branch on the remote yet, or the fetch failed. Either way, build on
    # nothing: the first producer to publish creates the branch as an orphan root
    # commit, and a rejected push re-enters here with the winner's tip.
    git_rcc read-tree --empty
  fi

  staged=0
  while IFS= read -r rel; do
    stage_if_changed "${rel}" "${STAGE}/${rel}" && staged=$(( staged + 1 ))
  done < "${work}/add"
  while IFS= read -r rel; do
    unstage_if_present "${rel}" && staged=$(( staged + 1 ))
  done < "${work}/remove"

  if [ "${staged}" -eq 0 ]; then
    echo "Already published on ${BRANCH}; nothing to do."
    exit 0
  fi

  # `--missing-ok`: see GIT_NO_LAZY_FETCH in scripts/rcc-lib.sh. Every entry in
  # this index came either from the remote's own tree or from a blob written a
  # few lines up, so there is nothing for the existence check to catch.
  tree="$(git_rcc write-tree --missing-ok)"
  if [ -n "${tip}" ]; then
    commit="$(git_rcc commit-tree "${tree}" -p "${tip}" -m "${MESSAGE}")"
  else
    commit="$(git_rcc commit-tree "${tree}" -m "${MESSAGE}")"
  fi

  # `--no-thin`, and it is not an optimisation. A thin pack lets the sender delta
  # against objects the *receiver* already has, so pushing a record that replaces
  # one already on the branch makes git want to read the old blob as a delta base
  # -- which in this clone is a promised object, and fetching it is exactly what
  # GIT_NO_LAZY_FETCH forbids. The push then fails with "could not fetch ... from
  # promisor remote", and only for a *replacement*: a record at a path the branch
  # has never held has no base to delta against and pushes fine. That is what
  # makes it worth a comment -- it would have been a retry-only failure, invisible
  # until the one path that needs it most.
  #
  # It is also not sufficient, and only over https: the same replacement that
  # pushes cleanly to a file:// remote with `--no-thin` still asks for the old
  # blob against GitHub and dies. That is why the flag alone read as a fix and
  # why rcc-store-test.sh, which pushes to a local remote, agrees that it is
  # one. stage_if_changed fetches the replaced blob for that reason; keep both.
  if git_rcc push -q --no-thin origin "${commit}:refs/heads/${BRANCH}"; then
    echo "Published ${staged} change(s) to ${BRANCH} on attempt ${attempt}."
    exit 0
  fi

  if [ "${attempt}" -ge "${ATTEMPTS}" ]; then
    echo "Could not publish to ${BRANCH} after ${ATTEMPTS} attempts" >&2
    exit 1
  fi

  # Jittered, so two writers rejected in the same instant do not retry in
  # lockstep. The first retry is near-immediate: losing the race means someone
  # else has already finished pushing, and all this one has to redo is a tree
  # fetch and the staged files. There is no re-derivation to wait out, which is
  # the whole point of one file per record.
  backoff=$(( attempt - 1 ))
  [ "${backoff}" -gt 8 ] && backoff=8
  sleep $(( backoff + RANDOM % 2 ))
  attempt=$(( attempt + 1 ))
done
