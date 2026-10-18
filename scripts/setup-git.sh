#!/usr/bin/env bash
# Register repository-local git configuration that cannot live in versioned
# files. Run once per clone, and as the first step of any CI job that rebases,
# cherry-picks, or merges branches in this repo.
#
# The merge-driver *name -> command* mapping must live in .git/config; only the
# `DESCRIPTION merge=ours-version` attribute itself is committed (.gitattributes).
#
# The checkout to configure, so a caller running `main`'s copy of this script
# configures the clone it is operating on rather than the one the script came
# from. The series loop invokes tooling from `main` against another checkout
# (.claude/skills/series-loop/SKILL.md stage 1), and without this the config lands in
# the `main` checkout, the target clone keeps no driver at all, and the only
# report is a success line naming neither. Same variable, and the same worktree
# check, as scripts/vendor-one.sh: one export configures whichever clone the
# firing is working in.
set -euo pipefail

cd "${VENDOR_REPO:-$(dirname "$0")/..}"
toplevel=$(git rev-parse --show-toplevel 2>/dev/null) || {
  echo "Error: $PWD is not a git worktree" >&2
  exit 1
}
[ "$toplevel" -ef . ] || {
  echo "Error: $PWD is not the root of its worktree ($toplevel)" >&2
  exit 1
}

git config merge.ours-version.name   "Combine DESCRIPTION version counters (see scripts/merge-version.sh)"
git config merge.ours-version.driver "scripts/merge-version.sh %O %A %B"

# Remember any genuine conflict resolutions across repeated rebases.
git config rerere.enabled true

# Merge drivers run under the merge backend (default since git 2.26); the
# patch/am backend bypasses them. Pin it so rebases honour the driver.
git config rebase.backend merge

echo "git configured in $toplevel: merge driver 'ours-version', rerere, rebase.backend=merge"
