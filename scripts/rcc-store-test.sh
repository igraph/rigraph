#!/bin/bash
# Check the invariants the verdict store rests on, offline, against a local bare
# repository -- optionally seeded from the real `rcc` branch.
#
# The claims in handbook/operations/ci/per-commit/store/README.md are
# measurements, so they should be reproducible: this is what produced them.
# Six things are checked.
#
#   1. N concurrent writers publishing at once lose nothing. Records land at
#      disjoint paths, so the only contention is on the ref, and the loser
#      re-reads the tip and re-commits rather than re-deriving.
#   2. A blobless, shallow, checkout-less clone stays small even against a branch
#      of a few hundred megabytes -- the property that makes publishing from a leg
#      affordable at all. This is the one that regresses silently: a stray
#      `git write-tree` without `--missing-ok` backfills every blob on the branch.
#   3. A newer verdict for a commit that already has one overwrites it -- which is
#      what a retry needs (.claude/skills/series-loop/SKILL.md), and what a re-publish
#      of the *same* verdict must not cost anything -- and a verdict that stops
#      being a failure takes its log with it.
#   4. scripts/rcc-consolidate.sh is a no-op as a dry run, drops records and logs
#      past their retention and keeps a record just inside it, squashes to two
#      commits, inherits its empty root on a second pass, and refuses to push over
#      a writer that landed in between.
#   5. It survives every shape the branch can legitimately have.
#   6. scripts/rcc-cutover.sh turns an `rcc`-shaped tree into a two-commit `rcc2`:
#      the aggregate's records become parts, the flat logs move under the
#      fan-out, an attributable legacy log is recovered, and everything past the
#      window is gone.
#
# Usage:
#   scripts/rcc-store-test.sh              # synthetic branch, fast
#   SEED_FROM=origin/rcc scripts/rcc-store-test.sh
#                                          # seed from the real rcc branch, so the
#                                          # clone-size and cutover checks run
#                                          # against real data
#
# Environment variables:
#   WRITERS    - concurrent writers in the race check (default: 20)
#   PER_WRITER - records each publishes (default: 5)
#   SEED_FROM  - a ref holding an `rcc`-shaped tree to seed the remote with
#   KEEP       - if non-empty, do not delete the scratch directory

set -uo pipefail

WRITERS="${WRITERS:-20}"
PER_WRITER="${PER_WRITER:-5}"
SEED_FROM="${SEED_FROM:-}"

here="$(cd "$(dirname "$0")" && pwd)"
repo="$(cd "${here}/.." && pwd)"
work="$(mktemp -d)"
[ -n "${KEEP:-}" ] || trap 'rm -rf "${work}"' EXIT

failures=0
pass() { echo "  PASS  $*"; }
fail() { echo "  FAIL  $*"; failures=$(( failures + 1 )); }

now="$(date -u +%Y-%m-%dT%H:%M:%SZ)"
ancient="2020-01-01T00:00:00Z"

# UTC timestamp <n> hours ago. Spelled out here rather than taken from
# rcc_cutoff, so a fixture dated against the window does not move with the code
# under test. GNU and BSD `date` spell it differently.
hours_ago() { # <n>
  date -u -d "$1 hours ago" +%Y-%m-%dT%H:%M:%SZ 2>/dev/null \
    || date -u -v "-$1H" +%Y-%m-%dT%H:%M:%SZ
}

sha_for() { # <n> -> a 40-hex pseudo-sha
  printf '%040x' "$(( $1 * 2654435761 & 0xffffffffffff ))"
}
record_for() { # <sha> <state> [<created-at>] [<run-id>]
  printf '{"commit":"%s","status":{"context":"rcc","state":"%s","created_at":"%s"},"run":{"id":%s}}\n' \
    "$1" "$2" "${3:-${now}}" "${4:-1}"
}

# One commit's verdict, staged and published exactly the way a matrix leg does it
# (see publish_record in scripts/each-shard.sh): the record, the log if it failed,
# and otherwise a removal for the log an overturned verdict left behind.
publish() { # <clone-dir> <sha> <state> [<log-file>] [<created-at>] [<run-id>]
  local dir="$1" sha="$2" state="$3" log="${4:-}" created="${5:-}" run="${6:-}"
  local stage="${work}/stage-${sha}"
  rm -rf "${stage}"
  mkdir -p "${stage}/runs2.d/${sha:0:2}"
  record_for "${sha}" "${state}" "${created:-${now}}" "${run:-1}" \
    > "${stage}/runs2.d/${sha:0:2}/${sha}.ndjson"
  if [ "${state}" = "failure" ]; then
    if [ -n "${log}" ]; then
      mkdir -p "${stage}/logs2.d/${sha:0:2}"
      cp -f "${log}" "${stage}/logs2.d/${sha:0:2}/${sha}.log"
    fi
  else
    printf 'logs2.d/%s/%s.log\n' "${sha:0:2}" "${sha}" > "${stage}/.remove"
  fi
  RCC_DIR="${dir}" "${here}/rcc-publish.sh" "test: ${sha:0:9}" "${stage}"
}

on_branch() { # <path> -> 0 if the branch carries it
  git -C "${work}/remote.git" cat-file -e "rcc2:$1" 2>/dev/null
}

git init -q --bare "${work}/remote.git"
git -C "${work}/remote.git" config uploadpack.allowFilter true
# `receive.autogc` is on by default, so every push into this bare repo may fork a
# `git gc --auto`. This test pushes hundreds of loose objects and then immediately
# clones the result, and a clone that reads the repo while gc is repacking it
# fails outright -- the harness runs without `set -e`, so the clone's failure used
# to surface much later as whichever check first found a directory missing. Ruling
# gc out here is what makes the checks below deterministic.
git -C "${work}/remote.git" config gc.auto 0
git -C "${work}/remote.git" config receive.autogc false

export RCC_REMOTE="file://${work}/remote.git"
export GITHUB_ACTOR="rcc-store-test"
export GITHUB_RUN_ID=0

# ---------------------------------------------------------------- the seed ---
# An `rcc`-shaped source tree, which check 7 cuts over and everything before it
# uses only for its bulk. Seeded from the real branch when asked, because the
# clone-size check is only meaningful against real collected logs.
echo "== 0. seeding the old-layout rcc branch =="
if [ -n "${SEED_FROM}" ]; then
  git -C "${repo}" push -q "${work}/remote.git" "${SEED_FROM}:refs/heads/rcc"
else
  git clone -q "${work}/remote.git" "${work}/seed" 2>/dev/null
  git -C "${work}/seed" checkout -q --orphan rcc
  git -C "${work}/seed" config user.name t
  git -C "${work}/seed" config user.email t@e
  mkdir -p "${work}/seed/runs2.d" "${work}/seed/logs2" "${work}/seed/logs"
  for i in $(seq 1 200); do
    record_for "$(sha_for "${i}")" success "${ancient}" "$(( 1000 + i ))"
  done > "${work}/seed/runs2.ndjson"
  # One recent aggregate-only record, so the split has something the window keeps.
  keeper="$(sha_for 4242)"
  record_for "${keeper}" failure "${now}" 4242 >> "${work}/seed/runs2.ndjson"
  # A part that is also in the aggregate, and one that is not.
  parted="$(sha_for 1)"
  mkdir -p "${work}/seed/runs2.d/${parted:0:2}"
  record_for "${parted}" success "${now}" 1001 \
    > "${work}/seed/runs2.d/${parted:0:2}/${parted}.ndjson"
  # Flat logs: one for the recent aggregate-only record, one long expired.
  printf 'the keeper log\n' > "${work}/seed/logs2/${keeper}.log"
  printf 'an ancient log\n' > "${work}/seed/logs2/$(sha_for 2).log"
  # A legacy run-keyed log for a run that decided exactly one commit, and one for
  # a run that decided several -- only the first is attributable.
  printf 'a legacy log\n' > "${work}/seed/logs/4242.log"
  printf 'a run-level log\n' > "${work}/seed/logs/9999.log"
  for i in 501 502; do
    sha="$(sha_for "${i}")"
    mkdir -p "${work}/seed/runs2.d/${sha:0:2}"
    record_for "${sha}" failure "${now}" 9999 \
      > "${work}/seed/runs2.d/${sha:0:2}/${sha}.ndjson"
  done
  rm -f "${work}/seed/logs2/${keeper}.log"   # the legacy one must be recoverable
  git -C "${work}/seed" add -A
  git -C "${work}/seed" commit -qm "seed"
  git -C "${work}/seed" push -q origin HEAD:refs/heads/rcc
fi
seed_mb="$(du -sm "${work}/remote.git" | cut -f1)"
echo "  (old-layout rcc seeded: ${seed_mb} MB)"

echo
echo "== 1. ${WRITERS} concurrent writers, back to back =="
# Warm each writer's clone first, so the race is on the pushes rather than on N
# simultaneous first fetches.
for w in $(seq 1 "${WRITERS}"); do
  publish "${work}/w${w}" "$(sha_for $(( 900000 + w )))" success > /dev/null 2>&1
done

writer() {
  local w="$1" i sha
  for i in $(seq 1 "${PER_WRITER}"); do
    sha="$(sha_for $(( w * 10000 + i )))"
    printf 'log for %s\n' "${sha}" > "${work}/log-${sha}"
    publish "${work}/w${w}" "${sha}" failure "${work}/log-${sha}" \
      >> "${work}/out-${w}" 2>&1
    printf '%s\n' "${sha}" >> "${work}/expected"
  done
}

: > "${work}/expected"
for w in $(seq 1 "${WRITERS}"); do writer "${w}" & done
wait

LC_ALL=C sort -u "${work}/expected" -o "${work}/expected"
git -C "${work}/remote.git" ls-tree -r --name-only rcc2 \
  | sed -n 's#^runs2\.d/../\(.*\)\.ndjson$#\1#p' | LC_ALL=C sort -u > "${work}/actual"
expected_n="$(wc -l < "${work}/expected" | tr -d ' ')"
landed="$(comm -12 "${work}/expected" "${work}/actual" | wc -l | tr -d ' ')"
[ "${landed}" = "${expected_n}" ] \
  && pass "all ${expected_n} records landed, none lost to the race" \
  || fail "only ${landed} of ${expected_n} records landed"

git -C "${work}/remote.git" ls-tree -r --name-only rcc2 \
  | sed -n 's#^logs2\.d/../\(.*\)\.log$#\1#p' | LC_ALL=C sort -u > "${work}/actual-logs"
[ "$(comm -12 "${work}/expected" "${work}/actual-logs" | wc -l | tr -d ' ')" \
    = "${expected_n}" ] \
  && pass "and so did every log, under the same fan-out" \
  || fail "logs went missing, or landed outside logs2.d/<xx>/"

gaveup="$(grep -hc 'Could not publish' "${work}"/out-* 2>/dev/null | paste -sd+ | bc)"
[ "${gaveup:-0}" = "0" ] \
  && pass "no writer exhausted its attempts" \
  || fail "${gaveup} writer(s) gave up"

echo "  attempt distribution:"
grep -ho 'on attempt [0-9]*' "${work}"/out-* | sort -V | uniq -c | sed 's/^/    /'

echo
echo "== 2. a writer's clone stays small =="
clone_kb="$(du -sk "${work}/w1/.git" | cut -f1)"
remote_kb="$(du -sk "${work}/remote.git" | cut -f1)"
echo "  writer clone ${clone_kb} KB against a ${remote_kb} KB remote"
if [ "${remote_kb}" -lt 20000 ]; then
  echo "  (branch too small for this to mean much; use SEED_FROM=origin/rcc)"
elif [ "${clone_kb}" -lt $(( remote_kb / 4 )) ]; then
  pass "the blobless clone did not backfill the branch"
else
  fail "the writer clone is $(( clone_kb * 100 / remote_kb ))% of the remote --" \
    "something is fetching blobs (a write-tree without --missing-ok?)"
fi

echo
echo "== 3. a newer verdict overwrites an older one =="
retry_sha="$(sha_for 555001)"
printf 'the first failure\n' > "${work}/retry-log"
publish "${work}/w1" "${retry_sha}" failure "${work}/retry-log" > /dev/null

before_tip="$(git -C "${work}/remote.git" rev-parse rcc2)"
publish "${work}/w1" "${retry_sha}" failure "${work}/retry-log" > /dev/null
[ "${before_tip}" = "$(git -C "${work}/remote.git" rev-parse rcc2)" ] \
  && pass "re-publishing the same verdict adds no commit" \
  || fail "an unchanged record was pushed again"

# A failure the leg could not capture a log for must leave the branch's alone:
# it is this commit's, from an earlier attempt, and a log we failed to capture is
# no reason to delete one we have.
publish "${work}/w1" "${retry_sha}" failure "" "${now}" 3 > /dev/null
on_branch "logs2.d/${retry_sha:0:2}/${retry_sha}.log" \
  && pass "a failure with no log of its own leaves the branch's in place" \
  || fail "a logless failure deleted the log the branch already had"

publish "${work}/w1" "${retry_sha}" success > /dev/null
landed="$(git -C "${work}/remote.git" cat-file -p \
  "rcc2:runs2.d/${retry_sha:0:2}/${retry_sha}.ndjson" | jq -r '.status.state')"
[ "${landed}" = "success" ] \
  && pass "the newer verdict replaced the record" \
  || fail "the record still says ${landed}"
on_branch "logs2.d/${retry_sha:0:2}/${retry_sha}.log" \
  && fail "the failure log survived a retry to success" \
  || pass "the leg dropped the log its own new verdict overturned"

echo
echo "== 4. consolidation =="
rm -rf "${work}/cons"
git clone -q --single-branch --branch rcc2 "${work}/remote.git" "${work}/cons"
git -C "${work}/cons" config user.name t
git -C "${work}/cons" config user.email t@e

# A record old enough to age out, with a log; a log whose commit has no record
# at all; and a record twelve hours inside the window, which must survive. Dated
# at the edge rather than today, so a window even a day short drops it.
legacy_sha="$(sha_for 666001)"
orphan_sha="$(sha_for 666002)"
ok_sha="$(sha_for 666003)"
mkdir -p "${work}/cons/runs2.d/${legacy_sha:0:2}" "${work}/cons/runs2.d/${ok_sha:0:2}" \
  "${work}/cons/logs2.d/${legacy_sha:0:2}" "${work}/cons/logs2.d/${orphan_sha:0:2}"
record_for "${legacy_sha}" failure "${ancient}" 1 \
  > "${work}/cons/runs2.d/${legacy_sha:0:2}/${legacy_sha}.ndjson"
record_for "${ok_sha}" success "$(hours_ago $(( ${RCC_RETENTION_DAYS:-180} * 24 - 12 )))" 1 \
  > "${work}/cons/runs2.d/${ok_sha:0:2}/${ok_sha}.ndjson"
printf 'an ancient log\n' > "${work}/cons/logs2.d/${legacy_sha:0:2}/${legacy_sha}.log"
printf 'a log nothing records\n' > "${work}/cons/logs2.d/${orphan_sha:0:2}/${orphan_sha}.log"
git -C "${work}/cons" add -A
git -C "${work}/cons" commit -qm "an aged record, an orphaned log, and one just inside the window"
git -C "${work}/cons" push -q origin HEAD:rcc2

before_state="$(git -C "${work}/cons" rev-parse HEAD:)"
OUT_DIR="${work}/cons" "${here}/rcc-consolidate.sh" > "${work}/cons-dry.log" 2>&1
[ "${before_state}" = "$(git -C "${work}/cons" rev-parse HEAD:)" ] \
  && [ -z "$(git -C "${work}/cons" status --porcelain)" ] \
  && pass "a dry run changes nothing" \
  || fail "the dry run modified the worktree"
grep -q '1 aged out' "${work}/cons-dry.log" \
  && pass "the dry run reported the record that ages out" \
  || fail "the dry run did not report the aged record (see ${work}/cons-dry.log)"

OUT_DIR="${work}/cons" APPLY=1 "${here}/rcc-consolidate.sh" > "${work}/cons.log" 2>&1 \
  && pass "the consolidation applied and pushed" \
  || fail "the consolidation failed (see ${work}/cons.log)"

[ "$(git -C "${work}/remote.git" rev-list --count rcc2)" = "2" ] \
  && pass "the branch is two commits" \
  || fail "the branch has $(git -C "${work}/remote.git" rev-list --count rcc2) commits"
root="$(git -C "${work}/remote.git" rev-list --max-parents=0 rcc2)"
[ -z "$(git -C "${work}/remote.git" ls-tree "${root}")" ] \
  && [ "$(git -C "${work}/remote.git" log -1 --format=%s "${root}")" = "Initial" ] \
  && pass "the root is an empty commit called Initial" \
  || fail "the root is not an empty Initial commit"

on_branch "runs2.d/${legacy_sha:0:2}/${legacy_sha}.ndjson" \
  && fail "the aged-out record is still on the branch" \
  || pass "the aged-out record was dropped"
on_branch "logs2.d/${legacy_sha:0:2}/${legacy_sha}.log" \
  && fail "its log outlived the record" \
  || pass "and its log went with it"
on_branch "logs2.d/${orphan_sha:0:2}/${orphan_sha}.log" \
  && fail "the log with no record survived" \
  || pass "the log with no record was dropped"
on_branch "runs2.d/${ok_sha:0:2}/${ok_sha}.ndjson" \
  && pass "a record inside the window was kept" \
  || fail "consolidation dropped a record it should have kept"
[ -z "$(git -C "${work}/remote.git" ls-tree rcc2 -- runs2.ndjson)" ] \
  && pass "no aggregate was resurrected" \
  || fail "runs2.ndjson is on the branch"

# A second pass must reuse the root rather than mint another.
rm -rf "${work}/cons2"
# --no-hardlinks: the consolidation just repacked the bare repo, and
# git's local clone optimisation trips on that. Local paths only.
if ! git clone -q --no-hardlinks --single-branch --branch rcc2 \
     "${work}/remote.git" "${work}/cons2"; then
  # Checked because the harness runs without `set -e`: an unchecked failure here
  # leaves no worktree, and every check below it then reports its own subject
  # rather than the clone that actually broke.
  fail "could not clone the consolidated branch for a second pass"
fi
git -C "${work}/cons2" config user.name t
git -C "${work}/cons2" config user.email t@e
OUT_DIR="${work}/cons2" APPLY=1 "${here}/rcc-consolidate.sh" > "${work}/cons2.log" 2>&1
grep -q "Inheriting the existing empty root" "${work}/cons2.log" \
  && [ "${root}" = "$(git -C "${work}/remote.git" rev-list --max-parents=0 rcc2)" ] \
  && pass "a second consolidation inherits the same root" \
  || fail "the root was re-minted"

# And the lease must refuse a writer that landed in between.
rm -rf "${work}/cons3"
git clone -q --no-hardlinks --single-branch --branch rcc2 \
  "${work}/remote.git" "${work}/cons3"
git -C "${work}/cons3" config user.name t
git -C "${work}/cons3" config user.email t@e
other_sha="$(sha_for 777001)"
publish "${work}/wother" "${other_sha}" success > /dev/null
if OUT_DIR="${work}/cons3" APPLY=1 "${here}/rcc-consolidate.sh" > "${work}/cons3.log" 2>&1; then
  fail "the consolidation pushed over a concurrent writer"
else
  on_branch "runs2.d/${other_sha:0:2}/${other_sha}.ndjson" \
    && pass "the lease refused the push and the other writer's record survived" \
    || fail "the push was refused but the record is gone anyway"
fi

echo
echo "== 5. consolidation survives every branch shape =="
for shape in records-only logs-only empty; do
  d="${work}/shape-${shape}"
  rm -rf "${d}"
  git init -q "${d}"
  git -C "${d}" config user.name t
  git -C "${d}" config user.email t@e
  case "${shape}" in
    records-only) mkdir -p "${d}/runs2.d/aa"
                  record_for "$(sha_for 1)" success > "${d}/runs2.d/aa/$(sha_for 1).ndjson" ;;
    logs-only)    mkdir -p "${d}/logs2.d/aa"
                  printf 'orphaned\n' > "${d}/logs2.d/aa/$(sha_for 1).log" ;;
    empty)        : ;;
  esac
  git -C "${d}" add -A > /dev/null 2>&1 || true
  git -C "${d}" commit -qm "${shape}" --allow-empty
  if OUT_DIR="${d}" "${here}/rcc-consolidate.sh" > "${work}/shape-${shape}.log" 2>&1 \
     && grep -q 'dry run' "${work}/shape-${shape}.log"; then
    pass "${shape}: the dry run reported instead of dying"
  else
    fail "${shape}: the dry run failed (see ${work}/shape-${shape}.log)"
  fi
done

echo
echo "== 6. the cutover =="
# Against a *second* remote, so the rcc2 built above stays where the checks left
# it and the cutover's own refusal to overwrite is testable on its own terms.
git init -q --bare "${work}/cut.git"
git -C "${work}/cut.git" config gc.auto 0
git -C "${work}/cut.git" config receive.autogc false
git -C "${work}/remote.git" push -q "${work}/cut.git" 'refs/heads/rcc:refs/heads/rcc'

rm -rf "${work}/cut"
git clone -q --single-branch --branch rcc "${work}/cut.git" "${work}/cut"
git -C "${work}/cut" config user.name t
git -C "${work}/cut" config user.email t@e

before_state="$(git -C "${work}/cut" rev-parse HEAD:)"
OUT_DIR="${work}/cut" "${here}/rcc-cutover.sh" > "${work}/cut-dry.log" 2>&1
[ "${before_state}" = "$(git -C "${work}/cut" rev-parse HEAD:)" ] \
  && [ -z "$(git -C "${work}/cut" status --porcelain)" ] \
  && pass "a dry run changes nothing" \
  || fail "the cutover dry run modified the worktree"

OUT_DIR="${work}/cut" APPLY=1 "${here}/rcc-cutover.sh" > "${work}/cut.log" 2>&1 \
  && pass "the cutover applied and pushed" \
  || fail "the cutover failed (see ${work}/cut.log)"

cut_on_branch() { git -C "${work}/cut.git" cat-file -e "rcc2:$1" 2>/dev/null; }

[ "$(git -C "${work}/cut.git" rev-list --count rcc2)" = "2" ] \
  && pass "rcc2 is Initial plus one commit" \
  || fail "rcc2 has $(git -C "${work}/cut.git" rev-list --count rcc2) commits"
cut_root="$(git -C "${work}/cut.git" rev-list --max-parents=0 rcc2)"
[ -z "$(git -C "${work}/cut.git" ls-tree "${cut_root}")" ] \
  && [ "$(git -C "${work}/cut.git" log -1 --format=%s "${cut_root}")" = "Initial" ] \
  && pass "its root is an empty commit called Initial" \
  || fail "the cutover's root is not an empty Initial commit"
[ "$(git -C "${work}/cut.git" rev-parse rcc)" \
    != "$(git -C "${work}/cut.git" rev-parse rcc2)" ] \
  && [ -z "$(git -C "${work}/cut.git" merge-base rcc rcc2 2>/dev/null)" ] \
  && pass "rcc2 shares no history with rcc, which is left where it was" \
  || fail "rcc2 was built on rcc's history"

for legacy in runs2.ndjson runs.ndjson runs.json; do
  [ -z "$(git -C "${work}/cut.git" ls-tree rcc2 -- "${legacy}")" ] \
    || fail "${legacy} survived the cutover"
done
[ -z "$(git -C "${work}/cut.git" ls-tree rcc2 -- logs2 logs)" ] \
  && pass "the old layouts are gone: no aggregate, no flat logs/ or logs2/" \
  || fail "an old log directory survived the cutover"

git -C "${work}/cut.git" ls-tree -r --name-only rcc2 > "${work}/cut-tree"
grep -qvE '^(runs2\.d/[0-9a-f]{2}/[0-9a-f]{40}\.ndjson|logs2\.d/[0-9a-f]{2}/[0-9a-f]{40}\.log)$' \
  "${work}/cut-tree" \
  && fail "rcc2 holds a path that is neither a record nor a log" \
  || pass "every path on rcc2 is a record or a log under its fan-out"

if [ -z "${SEED_FROM}" ]; then
  keeper="$(sha_for 4242)"
  cut_on_branch "runs2.d/${keeper:0:2}/${keeper}.ndjson" \
    && pass "an aggregate-only record inside the window became a part" \
    || fail "the aggregate-only record was lost"
  cut_on_branch "logs2.d/${keeper:0:2}/${keeper}.log" \
    && pass "its legacy logs/<run-id>.log was recovered as the commit's log" \
    || fail "the attributable legacy log was not recovered"
  old="$(sha_for 5)"
  cut_on_branch "runs2.d/${old:0:2}/${old}.ndjson" \
    && fail "a record from 2020 survived the retention window" \
    || pass "records past the window are gone, with their logs"
  multi="$(sha_for 501)"
  cut_on_branch "logs2.d/${multi:0:2}/${multi}.log" \
    && fail "a run-level log was attributed to one of several commits" \
    || pass "an unattributable legacy log was dropped rather than guessed at"
fi

# Running it again must refuse rather than discard what has been published since.
rm -rf "${work}/cut2"
git clone -q --no-hardlinks --single-branch --branch rcc "${work}/cut.git" "${work}/cut2"
git -C "${work}/cut2" config user.name t
git -C "${work}/cut2" config user.email t@e
if OUT_DIR="${work}/cut2" APPLY=1 "${here}/rcc-cutover.sh" > "${work}/cut2.log" 2>&1; then
  fail "a second cutover overwrote the branch"
else
  grep -q 'already exists' "${work}/cut2.log" \
    && pass "a second cutover refuses unless forced" \
    || fail "the second cutover failed for the wrong reason (see ${work}/cut2.log)"
fi

echo
if [ "${failures}" -eq 0 ]; then
  echo "All checks passed."
else
  echo "${failures} check(s) failed."
fi
exit "${failures}"
