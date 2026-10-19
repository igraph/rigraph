#!/bin/bash
# shellcheck disable=SC2317  # gates are dispatched indirectly as gate_${gate}
#
# Run the per-commit `rcc` gate against the working tree, once.
#
# This is the gate set that the `rcc-smoke` job of `.github/workflows/
# R-CMD-check.yaml` applies on its per-commit `workflow_dispatch` path -- the
# path the retired per-commit dispatcher drove -- expressed as a script so that
# `scripts/each-shard.sh` can run it many times in one job. A workflow cannot
# loop over composite actions, so the gates have to be callable from a shell
# loop; this file is that seam.
#
# Deliberately a *subset* of what `rcc-smoke` does, matching what actually runs
# under `workflow_dispatch`, plus the one check `rcc-smoke` does not make:
#
#   | rcc-smoke step        | here                                            |
#   |-----------------------|-------------------------------------------------|
#   | custom/after-install  | gate `regen`, the migration-drift half of it    |
#   | (none)                | gate `regen`, the Stimulus and cpp11 interface  |
#   | versions-matrix       | skipped upstream too (workflow_dispatch, no opt-in) |
#   | dep-suggests-matrix   | skipped upstream too                            |
#   | flavor-package-name   | gate `flavor`, the two flavor-only scans of it   |
#   | style                 | gate `style`                                    |
#   | update-snapshots      | gate `snapshots`, incl. the snapshot-<sha> branch |
#   | roxygenize            | gate `roxygen`                                  |
#   | custom/after-install  | gate `warnings`, scripts/warnings.sh glue       |
#   | render-readme         | skipped upstream too (no Config/cynkra/render-readme) |
#   | commit                | gate `clean` -- workflow_dispatch fails on any diff |
#   | check                 | gate `check`                                    |
#   | pkgdown-build         | gate `pkgdown`                                  |
#   | pkgdown-deploy        | skipped upstream too (push only)                |
#   | covr                  | skipped: an upload to Codecov, not a verdict     |
#
# Outcome semantics mirror `rcc-smoke` exactly: every gate runs even when an
# earlier one failed, and the exit status is the AND over all of them. That is
# what makes a failing commit's log show *all* the problems, not just the first.
#
# Assumes the caller has already installed R, the package dependencies, ccache,
# and the formatting tools, and that the working tree is a clean checkout of the
# commit under test.
#
# Usage:
#   scripts/rcc-one.sh
#
# Environment variables:
#   EACH_GATES            - space-separated subset of
#                           "regen flavor style snapshots roxygen clean warnings check pkgdown"
#                           (default: all of them, parity with rcc-smoke)
#   EACH_SNAPSHOT_BRANCH  - publish the snapshot-<sha>-rcc-smoke-null branch when
#                           the snapshots gate changed anything
#                           (default: true under GITHUB_ACTIONS, false locally)
#   EACH_STAGE_DIR        - when set, each stage's combined output is also kept
#                           in <dir>/<stage>.log and its verdict appended to
#                           <dir>/outcomes.tsv, so scripts/each-shard.sh can
#                           quote the failing stage into the run summary
#   CLANG_FORMAT          - the C++ formatter the style gate runs
#                           (default: clang-format-21, what CI installs)
#   RCMDCHECK_ERROR_ON    - passed through to rcmdcheck (default: note)
#   EACH_VENV_DIR         - where the regen gate keeps the Stimulus virtualenvs,
#                           one per content of tools/build-requirements.txt and
#                           tools/py-stimulus; must be outside the workspace,
#                           which scripts/each-shard.sh wipes between commits
#                           (default: $RUNNER_TEMP/each-venv)
#   EACH_TIMEOUT_<STAGE>  - seconds a stage may take before it is presumed stuck
#                           and killed (see stage_budget below); 0 disables the
#                           bound for that stage

set -uo pipefail

ALL_GATES="regen flavor style snapshots roxygen clean warnings check pkgdown"
GATES="${EACH_GATES:-${ALL_GATES}}"
SNAPSHOT_BRANCH="${EACH_SNAPSHOT_BRANCH:-${GITHUB_ACTIONS:-false}}"
STAGE_DIR="${EACH_STAGE_DIR:-}"
VENV_DIR="${EACH_VENV_DIR:-${RUNNER_TEMP:-${TMPDIR:-/tmp}}/each-venv}"

# peter-evans/create-pull-request commits as this identity by default, not as
# the repository's git config. Reproduced verbatim so the published branches stay
# byte-comparable with the ones the retired dispatch path created.
CPR_NAME="github-actions[bot]"
CPR_EMAIL="41898282+github-actions[bot]@users.noreply.github.com"
CPR_MESSAGE="[create-pull-request] automated change"

rscript_dir="$(mktemp -d)"
trap 'rm -rf "${rscript_dir}"' EXIT

# How a bounded stage re-enters this script; see run_stage. Resolved before
# anything can change directory, so the child is found from wherever it runs.
self="$(cd "$(dirname "$0")" && pwd)/$(basename "$0")"
STAGE_ONLY="${EACH_STAGE_ONLY:-}"

names=()
outcomes=()
status=0

# The leg has a timeout of its own (scripts/each-shard.sh), and it kills the
# process group this script runs in. A bounded stage is not in that group: the
# nested `timeout` moved it into one of its own, which is what lets it take a
# stuck `Rscript` down with it. So a leg that runs out of budget kills this
# script and leaves the stage running -- measured, not feared: an orphaned
# `R CMD INSTALL` kept compiling after its leg was gone, and it would still be
# writing into src/ while the shard checks out the next commit.
#
# Forward the signal so the stage goes when we go.
#
# Signalling the nested `timeout` is not enough: on a signal it *receives* it
# passes it to its direct child only, so `R CMD INSTALL` dies and the `make`,
# `ccache` and `cc1plus` below it are reparented and carry on compiling. Kill
# the stage's process group instead -- the one `timeout` created for it, which
# is every process the stage spawned.

# `R CMD INSTALL` holds a 00LOCK directory for the length of an install and
# removes it on the way out, which a killed install never reaches. The library
# lives outside the workspace, so the shard's `git clean` does not take it
# either, and the next commit's install fails on a lock left by a commit that is
# already decided. Ours is the only install in this workspace, so any 00LOCK
# still standing is the one we just killed.
drop_install_lock() {
  local lib
  lib="$(Rscript -e 'cat(.libPaths()[1])' 2>/dev/null || true)"
  [ -n "${lib}" ] && rm -rf "${lib}"/00LOCK-*
  return 0
}

stage_pid=
stage_name=
forward_term() {
  trap - TERM INT
  if [ -n "${stage_pid}" ]; then
    local pgid
    pgid="$(ps -o pgid= --ppid "${stage_pid}" 2>/dev/null | tr -d ' ' | head -n 1)"
    kill -TERM "${stage_pid}" 2>/dev/null
    if [ -n "${pgid}" ]; then
      kill -TERM -- "-${pgid}" 2>/dev/null
      sleep 5
      kill -KILL -- "-${pgid}" 2>/dev/null
    fi
    wait "${stage_pid}" 2>/dev/null
    [ "${stage_name}" = install ] && drop_install_lock
  fi
  exit 143
}
trap forward_term TERM INT

# Not in a stage child: it shares the parent's STAGE_DIR, and truncating the
# file here would throw away the verdicts of every stage that already ran.
if [ -n "${STAGE_DIR}" ] && [ -z "${STAGE_ONLY}" ]; then
  mkdir -p "${STAGE_DIR}"
  : > "${STAGE_DIR}/outcomes.tsv"
fi

has_gate() {
  case " ${GATES} " in
    *" $1 "*) return 0 ;;
    *) return 1 ;;
  esac
}

# What a stage is allowed to take before it is presumed stuck.
#
# The leg already has a `timeout`, but it is the whole shard budget (5 h), so a
# stage that hangs eats every commit the shard had left and takes its own
# evidence with it: run_stage buffers a stage's output and only prints it once
# the stage returns, and a killed rcc-one.sh never returns. That is how a hung
# `snapshots` gate came back as a bare "no test phase in log" and read like a
# cancelled leg.
#
# A per-stage bound turns that into an ordinary failure: the stage is killed,
# rcc-one.sh survives to print the partial log and mark the stage FAIL, and the
# remaining commits in the shard still get built.
# The numbers are the observed cost with plenty of headroom,
# so an honest stage never sees them
# and a stuck one is cut off in minutes rather than hours.
# Measured on a 4-core machine (scripts/each-plan.sh has the details),
# a warm commit takes ~1510 s all-in and a cold ccache adds about a minute;
# each bound is three to ten times its stage's time,
# and longer where the stage downloads.
# Their sum stays under the shard budget,
# which keeps the leg's timeout the backstop it is meant to be.
# Override any of them with EACH_TIMEOUT_<STAGE> (seconds; 0 disables).
stage_budget() {
  local override
  override="EACH_TIMEOUT_$(echo "$1" | tr '[:lower:]' '[:upper:]')"
  if [ -n "${!override:-}" ]; then
    echo "${!override}"
    return
  fi
  case "$1" in
    install) echo 1200 ;;    # cold ccache, no reuse at all: ~100 s
    regen) echo 600 ;;       # ~15 s; a leg's first also builds the venv
    flavor) echo 300 ;;      # a base-R scan of the checkout
    style) echo 600 ;;
    snapshots) echo 1800 ;;  # the snapshot tests: ~350 s
    roxygen) echo 900 ;;     # ~60 s, after installing the vendored roclet
    clean) echo 900 ;;
    warnings) echo 600 ;;    # recompiles the ten glue files: ~10 s
    check) echo 2700 ;;      # rebuilds the package, then the suite again: ~400 s
    pkgdown) echo 2700 ;;    # every reference page and article: ~650 s
    *) echo 3600 ;;
  esac
}

# The per-stage verdict, in execution order. A stage that has a log here but no
# line in this file is one that never returned -- which is exactly the stage the
# leg's timeout killed, and the one worth showing.
note_stage() {
  [ -n "${STAGE_DIR}" ] || return 0
  printf '%s\t%s\n' "$1" "$2" >> "${STAGE_DIR}/outcomes.tsv"
}

record() {
  names+=("$1")
  outcomes+=("$2")
  note_stage "$1" "$2"
  [ "$2" = "failure" ] && status=1
  return 0
}

# Run one stage, keeping a copy of its combined output when EACH_STAGE_DIR is
# set. Nothing is lost by buffering it: the caller (scripts/each-shard.sh)
# already redirects the whole commit to a file and prints it once the commit is
# over, so there is no live stream here to interleave with. What is gained is a
# log that begins and ends at the stage boundary, which is what makes a useful
# excerpt -- slicing the combined log back apart would mean parsing it.

#
# The stage also runs under its own timeout. `timeout` wants a command, and a
# gate is a shell function closing over this script's state, so the bound
# re-enters the script for that one stage: EACH_STAGE_ONLY names the function
# and the child defines everything exactly as the parent did, because it is the
# same script. `install` already passes a real command and is run directly.
#
# `timeout` then does the hard part itself -- it puts the command in a process
# group of its own and signals the group, so a stuck `Rscript` and everything
# below it goes too, and --kill-after covers a stage that ignores SIGTERM.
run_stage() {
  local name="$1"
  shift
  local rc=0 budget
  budget="$(stage_budget "${name}")"
  local -a cmd=("$@")
  [ "$(type -t "$1")" = function ] && cmd=(env "EACH_STAGE_ONLY=$1" bash "${self}")
  [ "${budget}" -gt 0 ] && cmd=(timeout --kill-after=30s "${budget}" "${cmd[@]}")
  # Backgrounded and waited on rather than run in the foreground, so forward_term
  # below can fire at all: bash defers a trap until the foreground command it is
  # running returns, which for a stuck stage is never.
  if [ -z "${STAGE_DIR}" ]; then
    "${cmd[@]}" &
  else
    "${cmd[@]}" > "${STAGE_DIR}/${name}.log" 2>&1 &
  fi
  stage_pid=$!
  stage_name="${name}"
  wait "${stage_pid}" || rc=$?
  stage_pid=
  [ -n "${STAGE_DIR}" ] && cat "${STAGE_DIR}/${name}.log"
  if [ "${rc}" -eq 124 ] || [ "${rc}" -eq 137 ]; then
    echo "stage ${name}: exceeded its ${budget}s budget -- presumed stuck, killed"
    [ "${name}" = install ] && drop_install_lock
  fi
  return "${rc}"
}

run_gate() {
  local gate="$1"
  if ! has_gate "${gate}"; then
    record "${gate}" "skipped"
    return 0
  fi
  echo "::group::gate: ${gate}"
  local outcome="success"
  if ! run_stage "${gate}" "gate_${gate}"; then
    outcome="failure"
  fi
  echo "::endgroup::"
  echo "gate ${gate}: ${outcome}"
  record "${gate}" "${outcome}"
}

# Writes an R program to a temp file and runs it, the way `shell: Rscript {0}`
# does in the workflow, so the R sources here stay byte-comparable with the
# composite actions they mirror.
rscript() {
  local file="${rscript_dir}/gate.R"
  cat > "${file}"
  Rscript "${file}"
}

# ------------------------------------------------------------------ install --
# Not a gate: `rcc-smoke` installs before the continue-on-error block, so an
# install failure ends the commit right there. Everything downstream needs the
# package loadable anyway (roxygen2, testthat, pkgdown).
# A stage child is on its way to one gate and the package is already installed;
# reinstalling it here would cost the parent's whole budget before the gate it
# was called for even started.
if [ -z "${STAGE_ONLY}" ]; then
  echo "::group::install"
  if ! run_stage install env _R_SHLIB_STRIP_=true R CMD INSTALL .; then
    note_stage install failure
    echo "::endgroup::"
    echo "install: failure -- skipping the remaining gates"
    echo "| install | failure |"
    exit 1
  fi
  note_stage install success
  echo "::endgroup::"
fi

# -------------------------------------------------------------------- gates --

# The working tree as a tree object, untracked files included and ignored ones
# left out, written through a temporary index so the real one is not touched.
# Hashing the whole checkout this way takes well under a second.
worktree_tree() {
  local index="${rscript_dir}/worktree-index"
  rm -f "${index}"
  GIT_INDEX_FILE="${index}" git read-tree HEAD || return 1
  GIT_INDEX_FILE="${index}" git add -A || return 1
  GIT_INDEX_FILE="${index}" git write-tree
}

# Put back every path that differs between two worktree_tree() snapshots,
# as it was in the first: files the second added are removed,
# and the rest are checked out from the first through a temporary index.
restore_worktree() { # <tree-before> <tree-after>
  local index="${rscript_dir}/restore-index"
  git diff --name-only -z --no-renames --diff-filter=A "$1" "$2" \
    | xargs -0 -r rm -f -- || return 1
  rm -f "${index}"
  GIT_INDEX_FILE="${index}" git read-tree "$1" || return 1
  git diff --name-only -z --no-renames --diff-filter=DMT "$1" "$2" \
    | GIT_INDEX_FILE="${index}" xargs -0 -r git checkout-index -f -- || return 1
}

# One Stimulus virtualenv per content of what it is built from,
# outside the workspace: scripts/each-shard.sh wipes `.venv` with every commit,
# and Makefile-cigraph's own stamp only compares mtimes,
# so it would not notice a commit that changed tools/py-stimulus.
# Keyed on the index rather than the files, so build products pip leaves behind
# do not change the key.
stimulus_venv() {
  local key
  key="$(git ls-files -s -- tools/build-requirements.txt tools/py-stimulus \
    | git hash-object --stdin)" || return 1
  printf '%s/%s' "${VENV_DIR}" "${key:0:16}"
}

# The generated half of the R/C interface, regenerated from its sources,
# and the commit judged by whether that changes anything.
# `src/rinterface.c` and `R/aaa-*.R` are Stimulus output (AGENTS.md),
# `src/cpp11.cpp` and `R/cpp11.R` are cpp11's ("do not edit by hand"),
# and the lexers and parsers under `src/vendor/io` are flex's and bison's.
# None of them is edited by hand, and this is the gate that holds every commit to it.
# It also takes over the drift check of the argument-migration blocks
# from .github/workflows/custom/after-install,
# which the per-commit workflow does not run because it would judge the tip.
#
# `make -B` regenerates every target rather than those whose inputs are newer,
# because mtimes after a checkout say which files that checkout rewrote,
# not which are stale: a hand edit to a generated file would otherwise pass
# whenever its inputs happened to be written first.
# `-o` exempts the virtualenv, which stimulus_venv() has already keyed on content.
# `DOCKER=` runs the host's flex and bison, the versions CI installs.
#
# A failure prints the diff and then puts the tree back the way it found it,
# so the gates after this one judge the commit as committed:
# the `clean` gate fails on its own drift only,
# and series-check.sh reads a regen failure as one rather than as style drift.
gate_regen() {
  local rc=0 before after venv
  before="$(worktree_tree)" || return 1
  venv="$(stimulus_venv)" || return 1
  if [ ! -f "${venv}/stamp" ]; then
    rm -rf "${venv}"
    mkdir -p "${VENV_DIR}"
    make -f Makefile-cigraph PYVENV="${venv}" venv || return 1
  fi
  make -f Makefile-cigraph -B -o "${venv}/stamp" DOCKER= PYVENV="${venv}" || rc=1
  Rscript -e 'cpp11::cpp_register()' || rc=1
  if [ -f tools/generate-migrations.R ]; then
    Rscript tools/generate-migrations.R || rc=1
  fi
  after="$(worktree_tree)" || return 1
  if [ "${before}" != "${after}" ]; then
    echo "Generated files differ from what Makefile-cigraph, cpp11::cpp_register()" \
      "and tools/generate-migrations.R write from their sources."
    echo "Regenerate them and commit the result. Diff:"
    git --no-pager diff --stat "${before}" "${after}"
    git --no-pager diff "${before}" "${after}"
    restore_worktree "${before}" "${after}"
    if [ "$(worktree_tree)" != "${before}" ]; then
      echo "Could not restore the tree; the gates after this one see the regenerated files."
    fi
    rc=1
  fi
  return "${rc}"
}

# The flavor-rename scans of scripts/flavor-package-name.R
# that only a flavored checkout can answer.
#
# They return early when `DESCRIPTION` names the mainline package,
# so on `main`, where `rcc-smoke` runs, they are no-ops by construction.
# On a flavored series branch the per-commit gate is the only thing judging,
# so a file that arrived under the mainline name goes unnoticed
# unless the scans run here.
# In duckdb-r, where this gate comes from,
# one did for a fortnight while every commit on its branch was judged green.
#
# `flavor_package_name_offenders()` is deliberately not here:
# it does not return early, and a hard-coded package name in the R sources
# is a question for the code that carries it,
# not for a file that arrived under the wrong name and nothing rewrote.
gate_flavor() {
  rscript <<'EOF'
source("scripts/flavor-package-name.R")

unflavored <- flavor_unflavored_paths(".")
if (length(unflavored) > 0) {
  writeLines(unflavored)
  stop(
    "A file scripts/flavor.patch renames still carries the mainline name; ",
    "see scripts/flavor-package-name.R for how to resolve this."
  )
}
writeLines("No file left under the mainline name.")

readmes <- flavor_mainline_readme_offenders(".")
if (length(readmes) > 0) {
  writeLines(readmes)
  stop(
    "A generated README still tells a reader to install the mainline package; ",
    "see scripts/flavor-package-name.R for how to resolve this."
  )
}
writeLines("No generated README pointing at the mainline package.")

binding <- flavor_binding_prefix_offenders(".")
if (length(binding) > 0) {
  writeLines(binding)
  stop(
    "An entry point in R/cpp11.R does not carry this flavor's .Call() prefix; ",
    "regenerate the binding with cpp11::cpp_register()."
  )
}
writeLines("Both halves of the cpp11 binding carry this flavor's prefix.")
EOF
}

# Mirrors cynkra/cynkratemplate's style action. Tool installation is the caller's
# job; this only runs the formatters.
# rigraph configures air and no `.clang-format`,
# so only air runs today; the C++ half follows the action in case that changes.
#
# A formatter that is not installed is not a style violation, and it used to read
# as one: `clang-format-21` absent leaves `git status --short` empty and still
# returns 1, so the gate reports `style failure` about a tree it never looked at
# (duckdb/duckdb-r#2669). Say which of the two it is.
#
# The name stays pinned. CI installs clang-format-21, different majors format
# differently, and falling back to whatever `clang-format` resolves to would
# trade a legible failure for a verdict that is not CI's -- either reformatting
# code CI is happy with, or passing code CI will reject. `CLANG_FORMAT` is for a
# host that has the right major under another name, not for using another major.
gate_style() {
  local rc=0 clang_format="${CLANG_FORMAT:-clang-format-21}"
  if [ -f air.toml ]; then
    air format . || rc=1
  fi
  if [ -f .clang-format ]; then
    if ! command -v "${clang_format}" >/dev/null 2>&1; then
      echo "Error: ${clang_format} is not on PATH, so the C++ sources were not" \
        "formatted -- this says nothing about the tree." >&2
      echo "  Install it (see cynkra/cynkratemplate's style action), or set" \
        "CLANG_FORMAT to a build of the same major." >&2
      rc=1
    else
      shopt -s nullglob
      "${clang_format}" -i src/*.{c,cc,cpp,h,hpp} || rc=1
      shopt -u nullglob
    fi
  fi
  git status --short
  return "${rc}"
}

# Mirrors the "Create pull request" step of
# cynkra/cynkratemplate's update-snapshots action, which publishes the accepted
# snapshots as a branch off the commit under test. The pull request itself never
# materialises on this path -- its base is a SHA, not a branch -- but the branch
# does, and tooling looks those up by name, so it has to keep being produced.
#
# The name is deliberately frozen rather than derived. Upstream builds it from
# `github.job` (`rcc-smoke`) and an empty matrix (`null`); here the job is
# `build` and there *is* a matrix, so deriving it the same way would silently
# rename the successors of every existing branch.
#
# Committed through a temporary index so the working tree keeps its diff -- the
# `clean` gate still has to see it and fail the commit.
publish_snapshot_branch() {
  if [ "${SNAPSHOT_BRANCH}" != "true" ]; then
    return 0
  fi
  if [ -z "$(git status --porcelain -- tests/testthat/_snaps)" ]; then
    return 0
  fi

  local sha branch tree commit index
  sha="$(git rev-parse HEAD)"
  branch="snapshot-${sha}-rcc-smoke-null"
  index="${rscript_dir}/snapshot-index"
  rm -f "${index}"

  # `mkdir -p` because a commit may have deleted the last snapshot, and
  # `git add` on a missing pathspec is an error.
  mkdir -p tests/testthat/_snaps

  GIT_INDEX_FILE="${index}" git read-tree HEAD || return 1
  GIT_INDEX_FILE="${index}" git add -A -- tests/testthat/_snaps || return 1
  tree="$(GIT_INDEX_FILE="${index}" git write-tree)" || return 1
  commit="$(
    GIT_AUTHOR_NAME="${CPR_NAME}" GIT_AUTHOR_EMAIL="${CPR_EMAIL}" \
    GIT_COMMITTER_NAME="${CPR_NAME}" GIT_COMMITTER_EMAIL="${CPR_EMAIL}" \
      git commit-tree "${tree}" -p "${sha}" -m "${CPR_MESSAGE}"
  )" || return 1

  echo "Publishing accepted snapshots as ${branch}"
  git push --force origin "${commit}:refs/heads/${branch}"
}

# Mirrors the "Run tests on test files that use snapshots" step of
# cynkra/cynkratemplate's update-snapshots action. Accepting the snapshots leaves
# the diff in the tree; the `clean` gate below is what turns it into a failure,
# exactly as the upstream `commit` step does on workflow_dispatch.
gate_snapshots() {
  local rc=0
  rscript <<'EOF' || rc=1
rx <- "^test-(.*)[.][rR]$"
files <- dir("tests/testthat", pattern = rx)
has_snapshot <- vapply(
  files,
  function(.x) any(grepl("snapshot", readLines(file.path("tests/testthat", .x)), fixed = TRUE)),
  logical(1)
)
if (any(has_snapshot)) {
  patterns <- gsub(rx, "^\\1$", files[has_snapshot])
  pattern <- paste0(patterns, collapse = "|")
  tryCatch(
    {
      Sys.setenv(TESTTHAT_PARALLEL = FALSE)
      result <- as.data.frame(testthat::test_local(pattern = pattern, reporter = "location", stop_on_failure = FALSE))
      failures <- result[result$failed + result$warning > 0, ]
      if (nrow(failures) > 0) {
        writeLines("Snapshot tests failed/warned.")
        print(failures[names(failures) != "result"])
        print(failures$result)
        testthat::snapshot_accept()
      } else {
        writeLines("Snapshot tests ran successfully.")
      }
    },
    error = print
  )
} else {
  writeLines("No snapshots found.")
}
EOF
  publish_snapshot_branch || rc=1
  return "${rc}"
}

# Mirrors cynkra/cynkratemplate's roxygenize action, after installing the
# C-docs roclet vendored in tools/igraph.r2cdocs as
# .github/workflows/custom/after-install does for `rcc-smoke`. Installed per
# commit, so each commit is documented by its own copy of the roclet; its
# dependencies come with Config/Needs/roxygen2.
gate_roxygen() {
  if [ -d tools/igraph.r2cdocs ]; then
    R CMD INSTALL tools/igraph.r2cdocs || return 1
  fi
  rscript <<'EOF'
roxygen2::roxygenize()
EOF
}

# Mirrors the "Write diff and fail for workflow_dispatch" step of
# cynkra/cynkratemplate's commit action: on a per-commit build, any change the
# gates above produced means the commit is not canonical.
gate_clean() {
  if [ -z "$(git status --porcelain)" ]; then
    return 0
  fi
  # Wording matched to the upstream `commit` action verbatim: series-check.sh
  # classifies a failure as style/roxygen drift by grepping the harvested log
  # for this exact string.
  echo "Changes detected in workflow_dispatch build. Diff:"
  git --no-pager diff
  git status --porcelain
  return 1
}

# The compiler-warning gate (handbook/build/warnings/): the glue must compile
# without warnings under the gate's flags; what src/vendor/ says is counted, so
# a vendored commit that brings a new upstream warning does not turn red here.
gate_warnings() {
  scripts/warnings.sh glue
}

# Mirrors r-lib/actions/check-r-package@v2 as invoked by
# cynkra/cynkratemplate's check action.
gate_check() {
  local rc=0
  RCMDCHECK_ERROR_ON="${RCMDCHECK_ERROR_ON:-note}" rscript <<'EOF' || rc=1
# The action's own defaults, set before the check and only when unset.
# `--as-cran` otherwise turns the CRAN incoming checks on, and a flavored
# package is not on CRAN, so every commit picks up a "New submission" NOTE.
if (Sys.getenv("_R_CHECK_FORCE_SUGGESTS_", "") == "") Sys.setenv("_R_CHECK_FORCE_SUGGESTS_" = "false")
if (Sys.getenv("_R_CHECK_CRAN_INCOMING_", "") == "") Sys.setenv("_R_CHECK_CRAN_INCOMING_" = "false")
# .github/workflows/custom/before-install sets this for every job in CI;
# set it here too, so a run outside Actions does not pick up the size NOTE.
if (Sys.getenv("_R_CHECK_PKG_SIZES_", "") == "") Sys.setenv("_R_CHECK_PKG_SIZES_" = "FALSE")
rcmdcheck::rcmdcheck(
  args = c("--no-manual", "--as-cran", "--no-multiarch"),
  build_args = "--no-manual",
  error_on = Sys.getenv("RCMDCHECK_ERROR_ON", "note"),
  check_dir = "check"
)
EOF
  # The upstream action always shows the test output, pass or fail.
  echo "::group::Test output"
  find check -name '*.Rout*' -exec head -n 1000000 '{}' \; 2>/dev/null || true
  echo "::endgroup::"
  return "${rc}"
}

# Mirrors cynkra/cynkratemplate's pkgdown-build action.
gate_pkgdown() {
  rscript <<'EOF'
pkgdown::build_site()
EOF
}

# A bounded stage re-enters here, having defined every gate exactly as the
# parent did. It runs the one it was called for and nothing else -- no summary
# table, no outcomes line: the parent owns both, and records this stage's
# verdict from the exit code below.
if [ -n "${STAGE_ONLY}" ]; then
  if [ "$(type -t "${STAGE_ONLY}")" != function ]; then
    echo "rcc-one.sh: EACH_STAGE_ONLY=${STAGE_ONLY} is not a stage" >&2
    exit 2
  fi
  "${STAGE_ONLY}"
  exit $?
fi

# ALL_GATES is the order as well as the list.
for gate in ${ALL_GATES}; do
  run_gate "${gate}"
done

# ----------------------------------------------------------------- summary ---
echo
echo "| Gate | Result |"
echo "| --- | --- |"
for i in "${!names[@]}"; do
  case "${outcomes[$i]}" in
    success) icon="OK" ;;
    skipped) icon="--" ;;
    *) icon="FAIL" ;;
  esac
  printf '| %s | %s %s |\n' "${names[$i]}" "${icon}" "${outcomes[$i]}"
done

exit "${status}"
