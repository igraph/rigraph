# Shared helpers for the verdict store on the orphan `rcc2` branch.
#
# Sourced, never executed:
#
#   here="$(cd "$(dirname "$0")" && pwd)"
#   . "${here}/rcc-lib.sh"
#
# ## The store
#
# One file per commit, under a 256-way fan-out on the first two hex digits of
# the SHA:
#
#   runs2.d/<xx>/<sha>.ndjson   the verdict -- one line of JSON, ~2 KB
#   logs2.d/<xx>/<sha>.log      the harvested output of a failure, ~1 MB
#
# and nothing else. Both directories are sharded for the same reason: adding one
# file rewrites one small tree rather than a tree with every record in it, which
# is what lets twenty matrix legs publish at once without a lock. Two writers
# recording different commits write different paths, so there is nothing to
# merge, and the loser of the ref race re-reads the tip and re-commits.
#
# There is no aggregate. `runs2.ndjson` was one file every writer extended, and
# so the one file two writers could genuinely disagree about; it bought "read the
# whole range in one fetch" and cost a merge step, a stale-line rule, a two-layout
# fallback in every reader, and half of the consolidation. Readers read the parts
# (see D2 in ../plan/PLAN-vendoring-simplification.md).
#
# ## Retention
#
# The store keeps `RCC_RETENTION_DAYS` (default 180) of history, records and logs
# alike, and `rcc-consolidate.sh` enforces it. That is one window rather than
# two, and it is load-bearing in both directions: a producer must not look
# further back than the window, or it re-derives every tick what consolidation
# drops, and a consumer must not ask about a commit older than it. Selection is
# bounded by `<S>-green`, which is far newer, and `rcc-logs.sh` derives its
# `SINCE` from this number for exactly this reason.
#
# ## Environment the clone helpers read
#
#   GH_TOKEN / GITHUB_TOKEN - token with contents:read (or write, to publish)
#   GITHUB_REPOSITORY       - owner/repo (required unless RCC_REMOTE is set)
#   GITHUB_SERVER_URL       - default: https://github.com
#   GITHUB_ACTOR            - commit identity, when one is needed
#   RCC_REMOTE              - remote URL, overriding the three above; how the
#                             test harness points a caller at a local bare repo

RCC_RETENTION_DAYS="${RCC_RETENTION_DAYS:-180}"

# --------------------------------------------------------------- store paths --

rcc_part_path() { printf 'runs2.d/%s/%s.ndjson' "${1:0:2}" "$1"; }
rcc_log_path() { printf 'logs2.d/%s/%s.log' "${1:0:2}" "$1"; }

# The instant a record describes, for retention. `status.created_at` is when the
# verdict was written; `run.created_at` is the fallback for a record whose status
# object was thinner. A record with neither is undatable and is never pruned --
# dropping one costs a rebuild, keeping one costs 2 KB.
RCC_RECORD_TIME_JQ='.status.created_at // .run.created_at // ""'

# `<sha> <timestamp>` for every record in a store directory, one per line.
# Records are one line of JSON each, so this is one jq over the concatenation
# rather than one jq per file -- and `fromjson?` drops a line that is not a
# record instead of aborting the pass, because one hand-edited file must not
# take the other few thousand down with it.
#
# A missing directory is an empty one, not an error: a store bootstrapped by a
# leg that has only ever seen successes has no `logs2.d/`, and `find`'s non-zero
# exit would otherwise abort a caller running under `set -e`.
rcc_record_times() { # <store-dir>
  { find "$1/runs2.d" -type f -name '*.ndjson' -exec cat {} + 2>/dev/null || true; } \
    | jq -rR "fromjson? | \"\\(.commit) \\(${RCC_RECORD_TIME_JQ})\"" \
    | LC_ALL=C sort -u -k1,1
}

# Commits a store directory holds a record for, from the filenames: exact even
# when a record's *contents* are unreadable.
rcc_record_shas() { # <store-dir>
  { find "$1/runs2.d" -type f -name '*.ndjson' 2>/dev/null || true; } \
    | sed 's#.*/##; s#\.ndjson$##' | LC_ALL=C sort -u
}

rcc_log_shas() { # <store-dir>
  { find "$1/logs2.d" -type f -name '*.log' 2>/dev/null || true; } \
    | sed 's#.*/##; s#\.log$##' | LC_ALL=C sort -u
}

# UTC timestamp <days> ago, in the format the records carry. GNU and BSD `date`
# spell it differently and both are in use (Actions runners, a maintainer's mac).
rcc_cutoff() { # <days>
  date -u -d "$1 days ago" +%Y-%m-%dT%H:%M:%SZ 2>/dev/null \
    || date -u -v "-$1d" +%Y-%m-%dT%H:%M:%SZ
}

# --------------------------------------------------------------- the remote --

# The URL carries the token the way actions/checkout does. GITHUB_TOKEN is a
# registered secret, so Actions masks it in the log; nothing here echoes it.
rcc_remote_url() {
  if [ -n "${RCC_REMOTE:-}" ]; then
    printf '%s' "${RCC_REMOTE}"
    return
  fi
  local base="${GITHUB_SERVER_URL:-https://github.com}"
  local token="${GH_TOKEN:-${GITHUB_TOKEN:-}}"
  local repo="${GITHUB_REPOSITORY:?GITHUB_REPOSITORY or RCC_REMOTE is required}"
  if [ -n "${token}" ]; then
    printf 'https://x-access-token:%s@%s/%s' "${token}" "${base#https://}" "${repo}"
  else
    printf '%s/%s' "${base}" "${repo}"
  fi
}

# A checkout-less clone of the store, cached between calls. Nothing here ever
# materialises a working tree: readers answer from trees, and the publisher
# builds its commit from the index, so a caller pays for the bytes it names and
# no others.
#
# GIT_NO_LAZY_FETCH is the guard that keeps that true. A partial clone backfills
# on demand, and the demand is easy to trigger by accident -- a plain
# `git write-tree` verifies that every index entry's object is present, which on
# this branch means quietly fetching every harvested log. Turning that into a
# loud failure is worth more than the call it costs.
rcc_clone_init() { # <dir>
  local dir="$1"
  export GIT_NO_LAZY_FETCH=1
  if [ ! -d "${dir}/.git" ]; then
    mkdir -p "$(dirname "${dir}")"
    git init -q "${dir}"
    git -C "${dir}" remote add origin "$(rcc_remote_url)"
  else
    # The token in the URL expires with the job that minted it, so a cached
    # clone gets the current one rather than the one it was created with.
    git -C "${dir}" remote set-url origin "$(rcc_remote_url)"
  fi
  if [ -n "${GITHUB_ACTOR:-}" ]; then
    git -C "${dir}" config user.name "${GITHUB_ACTOR}"
    git -C "${dir}" config user.email "${GITHUB_ACTOR}@users.noreply.github.com"
  else
    git -C "${dir}" config user.name "github-actions[bot]"
    git -C "${dir}" config user.email \
      "41898282+github-actions[bot]@users.noreply.github.com"
  fi
}

# Does the branch exist? The three answers are genuinely different and callers
# act on all three: 0 exists, 2 no such branch (nothing has been decided yet),
# anything else "could not ask" -- which must never be reported as "nothing is
# decided", because that replans every commit in range.
rcc_branch_probe() { # <dir> <branch>
  local rc=0
  git -C "$1" ls-remote --exit-code --heads origin "$2" > /dev/null 2>&1 || rc=$?
  return "${rc}"
}

# Fetch the branch tip and echo it. Empty output with a non-zero return means
# there is nothing to fetch or the fetch failed; use rcc_branch_probe to tell
# those apart when it matters.
#
# `--filter` is a server capability, so a remote without it (or an old client)
# still works, just with the blobs the caller did not want. The fallback is
# recorded in the clone so it is paid once per caller rather than once per call.
#
# The filter is the caller's choice because the two readers want different
# things: `blob:none` for one that only asks which commits are present, and
# `blob:limit=16k` for one that reads records -- every record is far under that
# and every log far over, so one fetch brings the whole verdict history and none
# of its bulk.
rcc_fetch_tip() { # <dir> <branch> [<filter>]
  local dir="$1" branch="$2" filter="${3:---filter=blob:none}"
  local refspec="+refs/heads/${branch}:refs/remotes/origin/${branch}"
  [ -f "${dir}/.no-filter" ] && filter=""
  if ! git -C "${dir}" fetch -q --depth 1 ${filter} origin "${refspec}" 2>/dev/null; then
    [ -n "${filter}" ] || return 1
    : > "${dir}/.no-filter"
    git -C "${dir}" fetch -q --depth 1 origin "${refspec}" 2>/dev/null || return 1
  fi
  git -C "${dir}" rev-parse "refs/remotes/origin/${branch}"
}

# ------------------------------------------------------------------- pruning --

# Drop everything past the retention window from a store *directory*: records
# older than the cutoff, the logs belonging to them, and logs whose commit has no
# record at all -- nothing reads those and nothing can date them.
#
# Records go too, not just logs. Keeping the verdict for a commit decided months
# ago and long since repaired only postpones the same deletion, and it is the
# reason producers are bounded by the same window (see the header).
#
# Reports through globals rather than stdout, so the caller can print its own
# before/after table:
#
#   RCC_PRUNED_RECORDS  records dropped for age
#   RCC_PRUNED_LOGS     logs dropped, for age or for having no record
#   RCC_ORPHAN_LOGS     of those, the ones that had no record
#   RCC_KEPT_RECORDS / RCC_KEPT_LOGS
#
# `mode` is `apply` (default) or anything else for a dry run, which computes and
# reports exactly what the real thing would delete and touches nothing.
rcc_prune() { # <store-dir> <retention-days> [<mode>]
  local dir="$1" days="$2" mode="${3:-apply}" work cutoff sha

  work="$(mktemp -d)"

  rcc_record_shas "${dir}" > "${work}/records"
  rcc_log_shas "${dir}" > "${work}/logs"

  : > "${work}/old"
  if [ "${days}" -gt 0 ]; then
    cutoff="$(rcc_cutoff "${days}")"
    rcc_record_times "${dir}" \
      | awk -v cut="${cutoff}" 'NF > 1 && $2 != "" && $2 < cut { print $1 }' \
      | LC_ALL=C sort -u > "${work}/old"
  fi

  # A log with no record: nothing reads it, and nothing can date it.
  LC_ALL=C comm -23 "${work}/logs" "${work}/records" > "${work}/orphans"
  # Every log that goes: the orphans, plus the ones whose record is aging out.
  # Intersected with the logs that actually exist, because most aged-out records
  # are successes and never had one.
  cat "${work}/old" "${work}/orphans" | LC_ALL=C sort -u > "${work}/doomed"
  LC_ALL=C comm -12 "${work}/doomed" "${work}/logs" > "${work}/drop-logs"

  RCC_PRUNED_RECORDS="$(wc -l < "${work}/old" | tr -d ' ')"
  RCC_PRUNED_LOGS="$(wc -l < "${work}/drop-logs" | tr -d ' ')"
  RCC_ORPHAN_LOGS="$(wc -l < "${work}/orphans" | tr -d ' ')"
  RCC_KEPT_RECORDS=$(( $(wc -l < "${work}/records" | tr -d ' ') - RCC_PRUNED_RECORDS ))
  RCC_KEPT_LOGS=$(( $(wc -l < "${work}/logs" | tr -d ' ') - RCC_PRUNED_LOGS ))

  if [ "${mode}" = "apply" ]; then
    while IFS= read -r sha; do
      rm -f "${dir}/$(rcc_part_path "${sha}")"
    done < "${work}/old"
    while IFS= read -r sha; do
      rm -f "${dir}/$(rcc_log_path "${sha}")"
    done < "${work}/drop-logs"
  fi

  rm -rf "${work}"
}

# ---------------------------------------------------------------- squashing --

# The empty root commit every consolidated store hangs off, called `Initial`.
# *Inherited* when the branch already has one: consolidating twice must not keep
# minting new roots, or every pass would invalidate every clone twice over.
#
# Answers through globals rather than stdout -- RCC_INITIAL_ROOT and
# RCC_ROOT_INHERITED (1 or 0) -- because a caller reading stdout would run this
# in a subshell and never see the second one.
rcc_initial_root() { # <dir> [<ref>]
  local dir="$1" ref="${2:-HEAD}" root
  RCC_ROOT_INHERITED=0
  RCC_INITIAL_ROOT=""
  if git -C "${dir}" rev-parse -q --verify "${ref}" > /dev/null 2>&1; then
    while IFS= read -r root; do
      [ "$(git -C "${dir}" log -1 --format=%s "${root}")" = "Initial" ] || continue
      [ -z "$(git -C "${dir}" ls-tree "${root}")" ] || continue
      RCC_ROOT_INHERITED=1
      RCC_INITIAL_ROOT="${root}"
      return 0
    done < <(git -C "${dir}" rev-list --max-parents=0 "${ref}")
  fi
  RCC_INITIAL_ROOT="$(git -C "${dir}" commit-tree \
    "$(git -C "${dir}" hash-object -t tree /dev/null)" -m "Initial")"
}

# Two commits, from the worktree's current state: the empty root, and everything.
# Leaves the new tip in RCC_SQUASH_COMMIT -- again a global rather than stdout,
# so that RCC_ROOT_INHERITED survives the call -- and pushes nothing: how, and
# with what lease, is the caller's decision.
rcc_squash() { # <dir> <message>
  local dir="$1" message="$2" tree
  git -C "${dir}" add -A
  tree="$(git -C "${dir}" write-tree)"
  rcc_initial_root "${dir}"
  RCC_SQUASH_COMMIT="$(git -C "${dir}" commit-tree "${tree}" \
    -p "${RCC_INITIAL_ROOT}" -m "${message}")"
}
