#!/usr/bin/env bash

# Self-test for `docs-only.sh`, run as the first step of the action.
# A classifier that wrongly says "documentation only" silently disables all
# checks, so it is worth the couple of seconds this takes.

set -euo pipefail

dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
script="${dir}/docs-only.sh"
patterns="${dir}/patterns.txt"

failures=0

expect() {
  local want="$1"
  shift

  local got
  got=$(printf '%s\n' "$@" | GITHUB_STEP_SUMMARY="" "${script}" "${patterns}" 2>/dev/null)

  if [ "${got}" = "${want}" ]; then
    echo "ok       ${want} <- $*"
  else
    echo "NOT OK   want ${want}, got ${got} <- $*" >&2
    failures=$((failures + 1))
  fi
}

# Documentation only
expect true "README.md"
expect true "NEWS.md"
expect true "README.md" "NEWS.md" "CONTRIBUTING.md"
expect true ".github/ISSUE_TEMPLATE/bug.yml"

expect true "index.md"
expect true "TODO.md"
expect true "cran-comments.md"
expect true "CRAN-SUBMISSION"

# Tooling that neither ships nor runs
expect true ".gitignore"
expect true ".github/.gitignore"
expect true "cynkratemplate.Rproj"
expect true "renovate.json"
expect true ".vscode/settings.json"
expect true ".claude/settings.json"
expect true "CLAUDE.md"
expect true "AGENTS.md"
expect true "data-raw/DATASET.R"

# Config that does have an effect, however harmless it looks
expect false ".gitattributes"
expect false ".Rprofile"
expect false "renv.lock"
expect false "air.toml"
expect false ".Rbuildignore"
expect false "codecov.yml"
expect false ".covrignore"
expect false ".clang-format"
expect false ".lintr"
expect false ".aspell/en_stats.rds"
expect false "inst/WORDLIST"
expect false "Makefile"
expect false "scripts/release.R"
expect false "Dockerfile"
expect false "docker-compose.yml"
expect false ".devcontainer/devcontainer.json"
expect false "revdep/problems.md"

# Web packages: JavaScript is compiled into inst/, so it is code
expect false "srcjs/index.js"
expect false "package.json"
expect false "package-lock.json"

# pkgdown-only articles are still built by the website job
expect false "vignettes/articles/foo.Rmd"

# R code, tests, metadata
expect false "R/foo.R"
expect false "README.md" "R/foo.R"
expect false "tests/testthat/test-foo.R"
expect false "tests/testthat/_snaps/foo.md"
expect false "DESCRIPTION"
expect false "NAMESPACE"
expect false "LICENSE"
expect false "man/foo.Rd"
expect false "vignettes/foo.Rmd"

# Native code: nothing below is documentation, no matter how it is spelled
expect false "src/foo.c"
expect false "src/foo.cpp"
expect false "src/init.c"
expect false "src/Makevars"
expect false "src/Makevars.win"
expect false "src/README.md"
expect false "inst/include/foo.h"
expect false "configure"
expect false "configure.ac"
expect false "cleanup"
expect false "tools/config.R"

# The website and CI itself
expect false "_pkgdown.yml"
expect false "pkgdown/extra.scss"
expect false "inst/pkgdown/_pkgdown.yml"
expect false ".github/workflows/R-CMD-check.yaml"
expect false ".github/workflows/docs-only/patterns.txt"

# Re-rendered and committed back by the smoke test
expect false "README.Rmd"
expect false "README.Rmd" "README.md" "index.md"

# Patterns match the entire path, not a part of it
expect false "docs/README.md"
expect false "README.md.orig"
expect false "old-README.md"

# Nothing at all: we don't know what changed
expect false ""

# Renames: the API's `filename` is the new path, `previous_filename` the old.
# Moving code into a documentation path is still a change to the code.
expect false "data-raw/foo.R" "R/foo.R"

# The same, through the filter the action applies to the API response
expect_api() {
  local want="$1"
  local json="$2"

  local got
  got=$(jq -r ".[] | $(<"${dir}/paths.jq")" <<<"${json}" |
    GITHUB_STEP_SUMMARY="" "${script}" "${patterns}" 2>/dev/null)

  if [ "${got}" = "${want}" ]; then
    echo "ok       ${want} <- ${json}"
  else
    echo "NOT OK   want ${want}, got ${got} <- ${json}" >&2
    failures=$((failures + 1))
  fi
}

expect_api false '[{"filename": "data-raw/foo.R", "previous_filename": "R/foo.R", "status": "renamed"}]'
expect_api true '[{"filename": "data-raw/foo.R", "previous_filename": "data-raw/bar.R", "status": "renamed"}]'
expect_api true '[{"filename": "NEWS.md", "status": "modified"}]'
expect_api false '[{"filename": "NEWS.md", "status": "modified"}, {"filename": "R/foo.R", "status": "modified"}]'

if [ "${failures}" -ne 0 ]; then
  echo "${failures} test(s) failed." >&2
  exit 1
fi

echo "All tests passed."
