#!/bin/bash
# Build one shard of an `each-rcc` plan: many commits, one job, one workspace.
#
# Walks its slice of `plan.json` oldest-first, and for every commit resets the
# workspace to it, runs `scripts/rcc-one.sh`, and writes the `rcc` commit-status
# -- which is a display surface: `scripts/rcc-logs.sh` and the repair skills read
# the record on the `rcc2` branch, and nothing decides from the status.
#
# Why the reuse works even though every commit starts from a clean tree:
# `R CMD build` copies the package and `R CMD check` compiles from the copy, so
# object timestamps never survive a commit anyway. The mechanism that does
# survive is **ccache**, which is content-addressed and lives on the runner's
# local disk for the whole job. A typical adjacent vendor commit recompiles only
# the handful of unity objects it invalidates -- ~98% hits, measured in
# plan/superseded/vendoring-loop.md, Appendix A.2. That is the whole point of putting
# consecutive commits in one job.
#
# Stopping is graceful, not fatal. The leg stops at its own deadline and reports
# what it did not reach, rather than being killed at GitHub's 6-hour job limit
# mid-commit. Progress is durable per commit (the status), so the next run simply
# replans whatever is left; nothing is checkpointed.
#
# Two consequences of "durable per commit" are load-bearing when a leg dies for
# reasons of its own -- a lost runner, a cancellation, a platform hiccup:
#
#   * The leg *resumes*. Re-running a failed job replays its whole shard from
#     plan.json, so without a check it would rebuild the commits it had already
#     decided -- up to five hours of work to redo, on a cold cache. A commit the
#     verdict store already holds a record for is therefore skipped here, which
#     makes "Re-run failed jobs" cost only what was actually lost. The store is
#     what the planner selects from too (scripts/rcc-decided.sh), so the two
#     cannot disagree about what "decided" means.
#     Not every decided commit, though: a forced replan and the tip of a
#     `retry-<S>-dev` branch are in the plan *because* they already have a
#     verdict, and skipping those would make the retry a no-op. The planner
#     names them in `replanned_despite_verdict`, so the leg reads the intent
#     from the plan rather than trying to re-derive it.
#   * The leg *publishes as it goes*. Every verdict is pushed to the `rcc2` branch
#     the moment it exists (scripts/rcc-publish.sh), so a leg that dies takes
#     nothing with it but the commit it was in the middle of. The artifact is
#     the backstop for the push itself failing, and is what a firing reads
#     anyway (.claude/skills/series-loop/SKILL.md stage 2) -- which is why each.yaml
#     names it per run *attempt*: a resumed leg's index covers only what it
#     rebuilt, so overwriting would delete the previous attempt's copy of
#     anything that attempt decided but could not publish.
#
# Usage:
#   SHARD=1 PLAN=plan.json LOG_DIR=/tmp/each-logs GH_TOKEN=<token> \
#     scripts/each-shard.sh
#
# Environment variables:
#   GH_TOKEN          - token with statuses:write and contents:write
#                       (required unless DRY_RUN)
#   SHARD             - shard number from plan.json; 1 is the oldest slice of
#                       the plan and N the branch tip (required)
#   PLAN              - plan file (default: plan.json)
#   LOG_DIR           - where per-commit logs, records and the index are written;
#                       must be outside the workspace, which is wiped per commit
#                       (default: $RUNNER_TEMP/each-logs)
#   DEADLINE_MINUTES  - stop starting new commits past this (default: 300)
#   LOG_TAIL          - trailing lines kept per commit (default: 10000)
#   SUMMARY_TAIL      - trailing lines of every failed stage quoted into the job
#                       summary (default: 50; 0 keeps the excerpts out)
#   SUMMARY_MAX_BYTES - stop adding excerpts past this much summary text
#                       (default: 900000; GitHub truncates a step summary at
#                       1 MiB, and a truncated summary loses the table too)
#   FORCE             - if non-empty, rebuild every commit in the shard, decided
#                       or not; the plan's own `replanned_despite_verdict` list
#                       already covers the forced and retried ones
#   NO_PUBLISH        - if non-empty, do not push records to the `rcc2` branch;
#                       the artifact still carries them
#   DRY_RUN           - if non-empty, list the commits and exit

set -uo pipefail

SHARD="${SHARD:?SHARD is required}"
PLAN="${PLAN:-plan.json}"
LOG_DIR="${LOG_DIR:-${RUNNER_TEMP:-/tmp}/each-logs}"
DEADLINE_MINUTES="${DEADLINE_MINUTES:-300}"
LOG_TAIL="${LOG_TAIL:-10000}"
SUMMARY_TAIL="${SUMMARY_TAIL:-50}"
SUMMARY_MAX_BYTES="${SUMMARY_MAX_BYTES:-900000}"
FORCE="${FORCE:-}"
NO_PUBLISH="${NO_PUBLISH:-}"

# Helpers resolve from `here`, and the loop below resets the workspace to each
# commit it builds -- so every commit is checked by the harness *it carries*. That
# is the intent, not a bug: we are vendoring, so a commit is either solid, or
# broken and the next loop run fixes it, or broken-but-green and the mandatory
# rebase before a release catches it either way. The run-level scripts use the tip
# (each-plan.sh) -- a different question.
here="$(cd "$(dirname "$0")" && pwd)"

# This file is one of the ones that reset wipes, and bash reads a script
# incrementally, by byte offset: crossing a commit that changed *this* script
# lets the running shell resume at a stale offset in whatever content replaced
# it. That is undefined behaviour, and it is independent of the choice above --
# nothing about walking commits with the harness they carry requires executing
# the walker out of the tree being walked.
#
# So run from a copy taken before the first reset. `here` survives the re-exec,
# so the helpers still resolve from the workspace and every commit is still
# checked by the harness it carries. The copy lives outside the workspace rather
# than in a `.gitignore`d directory inside it, because `.gitignore` comes from
# the commit under test: an in-tree staging directory is untracked and unignored
# at every commit older than the entry, and `rcc-one.sh`'s `clean` gate fails on
# it -- exactly in the rewind case this protects.
if [ -z "${EACH_SHARD_HERE:-}" ]; then
  staged="${RUNNER_TEMP:-${TMPDIR:-/tmp}}/each-shard"
  mkdir -p "${staged}"
  cp "${here}/$(basename "$0")" "${staged}/each-shard.sh"
  EACH_SHARD_HERE="${here}" exec bash "${staged}/each-shard.sh" "$@"
fi
here="${EACH_SHARD_HERE}"

started="$(date -u +%s)"
deadline=$(( started + DEADLINE_MINUTES * 60 ))

mkdir -p "${LOG_DIR}" "${LOG_DIR}/parts"
index="${LOG_DIR}/index.ndjson"
: > "${index}"

# Scratch, deliberately *not* under LOG_DIR: that directory is uploaded as the
# leg's artifact, and the per-stage logs are the commit log sliced up, so
# shipping both would double every artifact for nothing.
workdir="$(mktemp -d)"
trap 'rm -rf "${workdir}"' EXIT
stage_dir="${workdir}/stages"
excerpts="${workdir}/excerpts.md"
excerpts_omitted=0
: > "${excerpts}"

mapfile -t commits < <(jq -r --argjson s "${SHARD}" '.shards[] | select(.index == $s) | .commits[].sha' "${PLAN}")

# Commits the planner put in the plan even though they already carry a verdict.
# Newline-delimited so the lookup below is a plain substring test on a small set.
replanned="$(jq -r '(.replanned_despite_verdict // [])[]' "${PLAN}" 2>/dev/null || true)"

if [ "${#commits[@]}" -eq 0 ]; then
  echo "Shard ${SHARD}: no commits in ${PLAN}"
  exit 0
fi

echo "Shard ${SHARD}: ${#commits[@]} commit(s), deadline in ${DEADLINE_MINUTES} min"
for sha in "${commits[@]}"; do
  echo "  ${sha}  $(git log -1 --format=%s "${sha}" 2>/dev/null | cut -c1-72)"
done

if [ -n "${DRY_RUN:-}" ]; then
  echo "[dry-run] not building"
  exit 0
fi

# ------------------------------------------------------------- status sink --
# Point the status at *this leg's* job rather than the whole run, so clicking
# through from a commit lands on the log that decided it. The URL still contains
# /actions/runs/<id>/, which is what scripts/rcc-logs.sh parses out.
job_url="${GITHUB_SERVER_URL:-https://github.com}/${GITHUB_REPOSITORY:-}/actions/runs/${GITHUB_RUN_ID:-0}"
if [ -n "${GITHUB_RUN_ID:-}" ] && [ -n "${RUNNER_NAME:-}" ]; then
  # A runner executes one job at a time, so its name identifies this leg
  # unambiguously -- more robust than matching the rendered job name.
  resolved="$(gh api \
    "repos/{owner}/{repo}/actions/runs/${GITHUB_RUN_ID}/attempts/${GITHUB_RUN_ATTEMPT:-1}/jobs" \
    --paginate --jq '.jobs[] | select(.runner_name == env.RUNNER_NAME) | .html_url' 2>/dev/null \
    | tail -n 1)"
  [ -n "${resolved}" ] && job_url="${resolved}"
fi
description="${GITHUB_WORKFLOW:-each-rcc} / shard ${SHARD}"
echo "Status target: ${job_url}"

set_status() {
  local sha="$1" state="$2"
  gh api --method POST \
    -H "Accept: application/vnd.github+json" \
    -H "X-GitHub-Api-Version: 2022-11-28" \
    "repos/{owner}/{repo}/statuses/${sha}" \
    -f "state=${state}" \
    -f "target_url=${job_url}" \
    -f "description=${description}" \
    -f "context=rcc" > /dev/null
}

# What the verdict store already holds, read once. The same source the planner
# selects from (scripts/rcc-decided.sh), so "decided" means the same thing in
# both places -- a record on the `rcc2` branch, not a commit status, which is a
# display surface and in particular carries the `pending` a killed leg leaves
# behind.
#
# A snapshot at leg start is the right granularity: the commits this leg might
# skip are the ones a *previous attempt* of it decided, and no other leg is
# deciding a commit in this shard. Failing to read it is not fatal -- an empty
# list rebuilds, which is what a leg with no store at all has always done.
decided_file="${workdir}/decided"
: > "${decided_file}"
if ! "${here}/rcc-decided.sh" > "${decided_file}" 2>/dev/null; then
  echo "Could not read the verdict store; nothing will be skipped as already decided."
  : > "${decided_file}"
fi

decided() { grep -qxF -- "$1" "${decided_file}"; }

# --------------------------------------------------------------- publisher ----
# The run object, once. Every record this leg writes carries it, so the
# hand-run backstop does not have to reconstruct one; the projection is shared
# (scripts/rcc-run-fields.jq) so both writers agree byte for byte. A failure
# here is not worth aborting a five-hour leg over -- fall back to what the
# environment already tells us, and let the reader see a thinner run object.
run_json='{}'
if [ -n "${GITHUB_RUN_ID:-}" ]; then
  run_json="$(gh api "repos/{owner}/{repo}/actions/runs/${GITHUB_RUN_ID}" \
    | jq -c -f "${here}/rcc-run-fields.jq" 2>/dev/null || true)"
  if [ -z "${run_json}" ]; then
    echo "Could not read the run object; records will carry a minimal one."
    run_json="$(jq -c -n --argjson id "${GITHUB_RUN_ID}" \
      --arg name "${GITHUB_WORKFLOW:-each-rcc}" \
      --arg head_branch "${GITHUB_REF_NAME:-}" \
      --argjson run_attempt "${GITHUB_RUN_ATTEMPT:-1}" \
      '{id: $id, name: $name, head_branch: $head_branch,
        status: "in_progress", conclusion: null, run_attempt: $run_attempt}')"
  fi
fi

# The record, in the shape `runs2.d/<xx>/<sha>.ndjson` holds. Written into
# LOG_DIR so it travels in the artifact too: that copy is what a firing reads,
# and it is the same bytes as the record published here, which is what keeps the
# two paths from drifting apart.
write_record() { # <sha> <state> <duration> <exit-code> <failed-stages-json>
  local sha="$1" state="$2" duration="$3" rc="$4" stages="$5" now
  now="$(date -u +%Y-%m-%dT%H:%M:%SZ)"
  jq -c -n \
    --arg commit "${sha}" \
    --arg state "${state}" \
    --arg target_url "${job_url}" \
    --arg description "${description}" \
    --arg now "${now}" \
    --argjson run "${run_json}" \
    --argjson shard "${SHARD}" \
    --argjson duration "${duration}" \
    --argjson rc "${rc}" \
    --argjson stages "${stages}" \
    '{commit: $commit,
      status: {context: "rcc", state: $state, target_url: $target_url,
               description: $description, created_at: $now, updated_at: $now},
      run: $run,
      timing: {shard: $shard, duration_seconds: $duration, exit_code: $rc,
               failed_stages: $stages}}' \
    > "${LOG_DIR}/parts/${sha}.ndjson"
}

# One commit's verdict, staged in the shape of the branch and handed to the one
# writer every producer goes through (scripts/rcc-publish.sh).
#
# A verdict that is *not* a failure lists the log for removal rather than staging
# one: there is nothing to compare against, so any log the branch still holds
# belongs to a verdict this record overturns -- which is what a retry
# (.claude/skills/series-loop/SKILL.md) leaves behind.
#
# Never fatal: the artifact remains, and it is what a firing reads, so the worst
# a failed publish costs is that the store does not learn this verdict until
# `scripts/rcc-logs.sh` is run by hand.
publish_record() { # <sha> <state>
  local sha="$1" state="$2" stage="${workdir}/publish"
  [ -n "${NO_PUBLISH}" ] && return 0

  rm -rf "${stage}"
  mkdir -p "${stage}/runs2.d/${sha:0:2}"
  cp -f "${LOG_DIR}/parts/${sha}.ndjson" "${stage}/runs2.d/${sha:0:2}/${sha}.ndjson"
  if [ "${state}" = "failure" ]; then
    # A failure with no log of its own leaves the branch's alone: it is either
    # this commit's from an earlier attempt, or nothing, and neither is something
    # to delete on the strength of a log we could not capture.
    if [ -f "${LOG_DIR}/${sha}.log" ]; then
      mkdir -p "${stage}/logs2.d/${sha:0:2}"
      cp -f "${LOG_DIR}/${sha}.log" "${stage}/logs2.d/${sha:0:2}/${sha}.log"
    fi
  else
    printf 'logs2.d/%s/%s.log\n' "${sha:0:2}" "${sha}" > "${stage}/.remove"
  fi

  if ! "${here}/rcc-publish.sh" \
       "each-rcc: ${sha:0:9} (run ${GITHUB_RUN_ID:-local})" "${stage}"; then
    echo "${sha}: could not publish to the rcc2 branch; it is in the artifact"
  fi
}

# --------------------------------------------------------------- excerpts ----
# What a red commit owes the reader of the run summary: which stage broke, and
# enough of its tail to tell a compile error from a failing test -- without
# opening a 40-minute job log and scrolling to the end of it. The full log is
# still harvested onto the `rcc2` branch; this is an excerpt, not the record.
#
# Fenced with four backticks, because R, roxygen and pkgdown output can contain
# a triple fence of its own, and stripped of SGR escapes, which Markdown renders
# as line noise.
emit_excerpt() {
  local sha="$1" stage="$2" log="$3"
  [ -f "${log}" ] || return 0
  if [ "$(wc -c < "${excerpts}")" -ge "${SUMMARY_MAX_BYTES}" ]; then
    excerpts_omitted=$(( excerpts_omitted + 1 ))
    return 0
  fi
  {
    printf '<details><summary><code>%s</code> &mdash; <b>%s</b> (last %s lines)</summary>\n\n' \
      "${sha:0:9}" "${stage}" "${SUMMARY_TAIL}"
    printf '````text\n'
    tail -n "${SUMMARY_TAIL}" "${log}" | sed -e 's/\r$//' -e 's/\x1b\[[0-9;?]*[a-zA-Z]//g'
    printf '````\n\n</details>\n\n'
  } >> "${excerpts}"
}

# One excerpt per failed stage, in the order the stages ran. `outcomes.tsv` is
# written by scripts/rcc-one.sh; a stage with a log but no verdict in it is the
# one the `timeout` killed, and it is the one worth showing.
write_excerpts() {
  local sha="$1" dir="$2" fallback="$3"
  local outcomes="${dir}/outcomes.tsv"
  local -a stages=()
  local stage log

  [ "${SUMMARY_TAIL}" -gt 0 ] || return 0

  if [ -s "${outcomes}" ]; then
    mapfile -t stages < <(awk -F'\t' '$2 == "failure" { print $1 }' "${outcomes}")
  fi
  for log in "${dir}"/*.log; do
    [ -f "${log}" ] || continue
    stage="$(basename "${log}" .log)"
    awk -F'\t' -v n="${stage}" '$1 == n { seen = 1 } END { exit !seen }' \
      "${outcomes}" 2>/dev/null || stages+=("${stage}")
  done

  if [ "${#stages[@]}" -eq 0 ]; then
    # No stage detail at all: rcc-one.sh died before the first stage, or the
    # checkout is old enough not to write any. The commit's own tail beats
    # nothing.
    emit_excerpt "${sha}" "whole commit" "${fallback}"
    return 0
  fi

  for stage in "${stages[@]}"; do
    emit_excerpt "${sha}" "${stage}" "${dir}/${stage}.log"
  done
}

# ------------------------------------------------------------------- loop ----
built=0
failed=0
skipped=0
resumed=0
last_duration=0

for sha in "${commits[@]}"; do
  now="$(date -u +%s)"
  remaining=$(( deadline - now ))

  # Before anything expensive: has this commit already been decided? On a first
  # run nothing has, and the lookup is a grep over a list read once. On a re-run
  # of a leg that died it is the difference between redoing the lost commit and
  # redoing the whole shard. A commit the planner deliberately replanned is
  # exempt -- its verdict is the thing being overturned.
  if [ -z "${FORCE}" ] \
     && ! grep -qxF -- "${sha}" <<<"${replanned}" \
     && decided "${sha}"; then
    echo "${sha}: already decided, skipping (re-run of a partially built shard)"
    resumed=$(( resumed + 1 ))
    continue
  fi

  # Stop before starting a commit that the trailing pace says will not finish.
  # Always attempt the first one, or a leg whose budget was mis-estimated would
  # make no progress at all and the next run would repeat the mistake.
  if [ "${built}" -gt 0 ] && [ "${remaining}" -le "${last_duration}" ]; then
    echo "Deadline reached with ${remaining}s left (last commit took ${last_duration}s); stopping."
    skipped=$(( skipped + 1 ))
    continue
  fi
  if [ "${remaining}" -le 0 ]; then
    skipped=$(( skipped + 1 ))
    continue
  fi

  echo "::group::${sha}  $(git log -1 --format=%s "${sha}" | cut -c1-72)"
  commit_started="$(date -u +%s)"

  # A full reset per commit. `R CMD build` runs ./cleanup, which tars up
  # src/duckdb and deletes it; leaving that behind would poison the next
  # commit's configure step. Cleaning is cheap and makes every commit's verdict
  # identical to one from a fresh checkout -- ccache, which lives outside the
  # workspace, carries the reuse.
  if ! git checkout --force --detach "${sha}"; then
    echo "::endgroup::"
    echo "${sha}: cannot check out (rewritten history?); leaving it undecided."
    skipped=$(( skipped + 1 ))
    continue
  fi
  # `-e .ccache` is belt and braces: the workflow pins CCACHE_DIR outside the
  # workspace, but hendrikmuhs/ccache-action has historically defaulted it to
  # `.ccache` here, and wiping the cache every commit would defeat the shard.
  git clean -qfdx -e .ccache

  set_status "${sha}" "pending"

  log="${LOG_DIR}/${sha}.log"
  full_log="${LOG_DIR}/${sha}.full"
  rm -rf "${stage_dir}"
  mkdir -p "${stage_dir}"
  EACH_STAGE_DIR="${stage_dir}" \
    timeout "${remaining}s" "${here}/rcc-one.sh" > "${full_log}" 2>&1
  rc=$?
  tail -n "${LOG_TAIL}" "${full_log}" > "${log}"
  rm -f "${full_log}"
  cat "${log}"

  commit_ended="$(date -u +%s)"
  last_duration=$(( commit_ended - commit_started ))

  failed_stages='[]'
  if [ -s "${stage_dir}/outcomes.tsv" ]; then
    failed_stages="$(awk -F'\t' '$2 == "failure" { print $1 }' "${stage_dir}/outcomes.tsv" \
      | jq -Rsc 'split("\n") | map(select(length > 0))')"
  fi

  if [ "${rc}" -eq 0 ]; then
    state="success"
    built=$(( built + 1 ))
  else
    state="failure"
    failed=$(( failed + 1 ))
    built=$(( built + 1 ))
    write_excerpts "${sha}" "${stage_dir}" "${log}"
  fi
  set_status "${sha}" "${state}"

  # The full record first, then the index line: the index is what the summary
  # and a reader of the artifact walk, so it must never name a record that was
  # not written.
  write_record "${sha}" "${state}" "${last_duration}" "${rc}" "${failed_stages}"
  jq -c -n \
    --arg commit "${sha}" \
    --arg state "${state}" \
    --arg target_url "${job_url}" \
    --arg description "${description}" \
    --argjson shard "${SHARD}" \
    --argjson duration "${last_duration}" \
    --argjson rc "${rc}" \
    --argjson failed_stages "${failed_stages}" \
    '{commit: $commit, state: $state, target_url: $target_url,
      description: $description, shard: $shard,
      duration_seconds: $duration, exit_code: $rc,
      failed_stages: $failed_stages}' >> "${index}"
  publish_record "${sha}" "${state}"

  echo "::endgroup::"
  echo "${sha}: ${state} (${last_duration}s, exit ${rc})"

  if command -v ccache > /dev/null 2>&1; then
    ccache --show-stats --verbose 2>/dev/null | head -n 12 || true
  fi
done

# ---------------------------------------------------------------- summary ----
elapsed=$(( $(date -u +%s) - started ))
echo
echo "Shard ${SHARD}: ${built} built (${failed} failed), ${resumed} already decided," \
  "${skipped} deferred, ${elapsed}s elapsed"

if [ -n "${GITHUB_STEP_SUMMARY:-}" ]; then
  {
    echo "### Shard ${SHARD}"
    echo
    echo "| Commit | Result | Duration |"
    echo "| --- | --- | --- |"
    jq -r '"| `\(.commit[0:9])` | \(.state)"
           + ((.failed_stages // []) | if length > 0 then " (" + join(", ") + ")" else "" end)
           + " | \(.duration_seconds)s |"' "${index}"
    if [ "${resumed}" -gt 0 ]; then
      echo
      echo "${resumed} commit(s) were already decided and were not rebuilt."
    fi
    if [ "${skipped}" -gt 0 ]; then
      echo
      echo "${skipped} commit(s) deferred to the next run (leg deadline)."
    fi
    if [ -s "${excerpts}" ]; then
      echo
      echo "#### Failing stages"
      echo
      cat "${excerpts}"
      if [ "${excerpts_omitted}" -gt 0 ]; then
        echo "${excerpts_omitted} further excerpt(s) omitted to keep this summary under" \
             "${SUMMARY_MAX_BYTES} bytes; the full logs are on the \`rcc\` branch."
        echo
      fi
    fi
  } >> "${GITHUB_STEP_SUMMARY}"
fi

# Deliberately succeed even when commits failed: a red commit is a *result*, not
# a broken leg, and failing the job here would only obscure which one it was.
# The `rcc` statuses carry the verdicts.
exit 0
