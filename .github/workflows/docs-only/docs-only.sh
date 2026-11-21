#!/usr/bin/env bash

# Classify a list of changed paths, read from standard input, one per line.
#
# Usage: docs-only.sh <patterns-file>...
#
# Prints `true` if *every* path matches one of the patterns,
# and `false` otherwise.
# An empty list of paths also gives `false`:
# if we don't know what changed, we check everything.
#
# Patterns are extended regular expressions matched against the entire path,
# blank lines and lines starting with `#` are ignored,
# and pattern files that don't exist are silently ignored,
# so that callers can pass an optional repository-specific file
# without checking for its existence first.
#
# If `GITHUB_STEP_SUMMARY` is set, a table of the paths and their
# classification is appended to it.

set -euo pipefail

# Number of paths shown in the job summary
max_report=100

if [ "$#" -eq 0 ]; then
  echo "Usage: $0 <patterns-file>..." >&2
  exit 1
fi

patterns=$(mktemp)
trap 'rm -f "${patterns}"' EXIT

for file in "$@"; do
  if [ ! -f "${file}" ]; then
    continue
  fi

  # `|| true`: a file that only contains comments is fine
  grep -v -e '^[[:space:]]*#' -e '^[[:space:]]*$' "${file}" >>"${patterns}" || true
done

if [ ! -s "${patterns}" ]; then
  echo "No patterns configured, treating all changes as relevant." >&2
  echo "false"
  exit 0
fi

docs_only=true
seen=false
n=0
report=""

while IFS= read -r path; do
  if [ -z "${path}" ]; then
    continue
  fi

  seen=true

  # `-x`: the pattern must match the entire path
  if grep -qxE -f "${patterns}" <<<"${path}"; then
    kind="documentation"
  else
    kind="code"
    docs_only=false
  fi

  echo "${kind}: ${path}" >&2

  n=$((n + 1))
  if [ "${n}" -le "${max_report}" ]; then
    report="${report}| \`${path}\` | ${kind} |"$'\n'
  fi
done

if [ "${seen}" != "true" ]; then
  echo "No changed paths found, treating all changes as relevant." >&2
  docs_only=false
fi

if [ -n "${GITHUB_STEP_SUMMARY:-}" ]; then
  {
    echo "## Changed paths"
    echo
    echo "| Path | Kind |"
    echo "| --- | --- |"
    printf '%s' "${report}"
    if [ "${n}" -gt "${max_report}" ]; then
      echo "| ... and $((n - max_report)) more | |"
    fi
    echo
    if [ "${docs_only}" = "true" ]; then
      echo "Documentation only, skipping the checks."
    else
      echo "Relevant changes found, running the checks."
    fi
  } >>"${GITHUB_STEP_SUMMARY}"
fi

echo "${docs_only}"
