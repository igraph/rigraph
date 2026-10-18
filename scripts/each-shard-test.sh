#!/bin/bash
# Check scripts/each-shard.sh's deadline rule offline: a stub stands in for
# scripts/rcc-one.sh, and the kill is real, by the leg's own `timeout`.
#
# A commit the leg deadline kills is a verdict only when it is the first the
# leg built, which had the whole budget; one cut short after others is deferred
# with no record, so the next run builds it again
# (handbook/operations/ci/per-commit/README.md). Two legs run side by side
# under DEADLINE_MINUTES=1, the shortest deadline the shard takes, so the test
# runs for about a minute. Two things are checked.
#
#   1. A leg whose first commit outruns the deadline records it as a failure
#      with exit code 124, publishes its record and log, sets its status to
#      failure, and defers the rest of the leg unstarted.
#   2. A leg that has decided a passing and a failing commit records both, and
#      defers the commit the deadline then kills: no record, no index line,
#      nothing published, its status left `pending`. The rest of the leg is
#      deferred unstarted.
#
# The stubs come in through EACH_SHARD_HERE, where the shard resolves its
# helpers (rcc-one.sh, rcc-decided.sh, rcc-publish.sh), and `gh` is stubbed on
# PATH for the statuses. Every commit of the fixture names what its stub run
# does in a file called `stub`.
#
# Usage:
#   scripts/each-shard-test.sh
#
# Environment variables:
#   KEEP - if non-empty, do not delete the scratch directory

set -euo pipefail

HERE=$(cd "$(dirname "$0")" && pwd)
SCRATCH=$(mktemp -d)
[ -n "${KEEP:-}" ] || trap 'rm -rf "$SCRATCH"' EXIT
[ -z "${KEEP:-}" ] || echo "scratch: $SCRATCH"

pass=0
fail=0
ok() { pass=$((pass + 1)); echo "  ok   $1"; }
no() { fail=$((fail + 1)); echo "  FAIL $1"; }
is() { if [ "$2" = "$3" ]; then ok "$1"; else no "$1"; echo "         actual: $2"; echo "       expected: $3"; fi; }
has() { case "$2" in *"$3"*) ok "$1" ;; *) no "$1"; echo "       missing: $3" ;; esac; }

export GIT_AUTHOR_NAME=Test GIT_AUTHOR_EMAIL=test@example.invalid
export GIT_COMMITTER_NAME=Test GIT_COMMITTER_EMAIL=test@example.invalid
export TMPDIR=$SCRATCH/tmp
mkdir -p "$TMPDIR"
# A leg inside a workflow resolves its job and run objects from these; the legs
# here are local, and the run object would need the API.
unset GITHUB_RUN_ID GITHUB_RUN_ATTEMPT RUNNER_NAME

# --- the stubs ---------------------------------------------------------------

STUBS=$SCRATCH/stubs
mkdir -p "$STUBS/bin"

# The gates, as the commit under test asks: pass, fail in `check`, or hang until
# the leg's `timeout` kills it. `exec` makes the sleep the process it kills.
cat >"$STUBS/rcc-one.sh" <<'EOF'
#!/bin/bash
case "$(cat stub)" in
  pass) echo "stub: pass" ;;
  fail) echo "stub: fail"
        printf 'check\tfailure\n' >"$EACH_STAGE_DIR/outcomes.tsv"
        exit 1 ;;
  hang) echo "stub: hang"
        exec sleep 600 ;;
esac
EOF

# An empty store: nothing is decided yet.
printf '#!/bin/bash\nexit 0\n' >"$STUBS/rcc-decided.sh"

# The store's writer, logging what each verdict staged.
cat >"$STUBS/rcc-publish.sh" <<'EOF'
#!/bin/bash
cd "$2" || exit 1
find . -type f ! -name .remove | sed 's|^\./|add |' >>"$STUB_LOG"
[ ! -f .remove ] || sed 's/^/remove /' .remove >>"$STUB_LOG"
EOF

# The statuses, logged as `status <sha> <state>`.
cat >"$STUBS/bin/gh" <<'EOF'
#!/bin/bash
sha=
state=
for a in "$@"; do
  case "$a" in
    */statuses/*) sha=${a##*/} ;;
    state=*) state=${a#state=} ;;
  esac
done
[ -z "$sha" ] || echo "status $sha $state" >>"$STUB_LOG"
EOF

chmod +x "$STUBS"/*.sh "$STUBS/bin/gh"

# --- the fixture -------------------------------------------------------------

FIX=$SCRATCH/fixture
git init -q "$FIX"
commit() { # <behaviour> -> sha
  printf '%s\n' "$1" >"$FIX/stub"
  git -C "$FIX" add stub
  git -C "$FIX" commit -q --allow-empty -m "$1"
  git -C "$FIX" rev-parse HEAD
}

A1=$(commit hang)
A2=$(commit pass)
B1=$(commit pass)
B2=$(commit fail)
B3=$(commit hang)
B4=$(commit pass)

jq -n --arg a1 "$A1" --arg a2 "$A2" \
  --arg b1 "$B1" --arg b2 "$B2" --arg b3 "$B3" --arg b4 "$B4" \
  '{shards: [
     {index: 1, commits: [{sha: $a1}, {sha: $a2}]},
     {index: 2, commits: [{sha: $b1}, {sha: $b2}, {sha: $b3}, {sha: $b4}]}
   ]}' >"$SCRATCH/plan.json"

# --- the legs ----------------------------------------------------------------

# One leg in a clone of its own, since the shard resets and cleans the workspace.
leg() { # <shard>
  local ws=$SCRATCH/ws$1
  git clone -q "$FIX" "$ws"
  (
    cd "$ws"
    PATH="$STUBS/bin:$PATH" EACH_SHARD_HERE="$STUBS" STUB_LOG="$SCRATCH/stub-$1.log" \
      SHARD="$1" PLAN="$SCRATCH/plan.json" LOG_DIR="$SCRATCH/logs$1" DEADLINE_MINUTES=1 \
      GITHUB_STEP_SUMMARY="$SCRATCH/summary-$1.md" \
      bash "$HERE/each-shard.sh"
  ) >"$SCRATCH/leg-$1.out" 2>&1
}

record() { # <shard> <sha> <jq filter> -> the field, or `none` without a record
  jq -r "$3" "$SCRATCH/logs$1/parts/$2.ndjson" 2>/dev/null || echo none
}
indexed() { # <shard> <sha> -> the state on its index line, or `none`
  jq -r --arg c "$2" 'select(.commit == $c) | .state' "$SCRATCH/logs$1/index.ndjson" | grep . || echo none
}
status() { # <shard> <sha> -> the last status set, or `none`
  grep "^status $2 " "$SCRATCH/stub-$1.log" | tail -n 1 | cut -d' ' -f3 | grep . || echo none
}
published() { # <shard> <sha> -> the paths staged for it, space-separated
  grep "/$2\." "$SCRATCH/stub-$1.log" | sort | tr '\n' ' ' | sed 's/ $//'
}

echo "Running two legs under a one-minute deadline..."
touch "$SCRATCH/stub-1.log" "$SCRATCH/stub-2.log"
leg 1 &
p1=$!
leg 2 &
p2=$!
rc1=0
wait "$p1" || rc1=$?
rc2=0
wait "$p2" || rc2=$?

echo
echo "== 1. a leg's first commit, killed at the deadline =="
is "the leg exits 0" "$rc1" 0
is "its kill is recorded as a failure" "$(record 1 "$A1" .status.state)" failure
is "with exit code 124" "$(record 1 "$A1" .timing.exit_code)" 124
is "and indexed" "$(indexed 1 "$A1")" failure
is "its record and log are published" "$(published 1 "$A1")" \
  "add logs2.d/${A1:0:2}/$A1.log add runs2.d/${A1:0:2}/$A1.ndjson"
is "its status is failure" "$(status 1 "$A1")" failure
is "the next commit is not started" "$(status 1 "$A2")" none
is "and has no record" "$(record 1 "$A2" .status.state)" none
has "the summary counts one deferral" "$(cat "$SCRATCH/summary-1.md" 2>/dev/null)" \
  "1 commit(s) deferred to the next run"

echo
echo "== 2. a later commit, killed at the deadline =="
is "the leg exits 0" "$rc2" 0
is "the passing commit before it is recorded" "$(record 2 "$B1" .status.state)" success
is "and so is the failing one" "$(record 2 "$B2" .status.state)" failure
is "with its exit code and stage" "$(record 2 "$B2" '"\(.timing.exit_code) \(.timing.failed_stages | join(","))"')" \
  "1 check"
has "the killed commit is deferred" "$(cat "$SCRATCH/leg-2.out")" \
  "$B3: killed at the leg deadline after"
is "it has no record" "$(record 2 "$B3" .status.state)" none
is "and no index line" "$(indexed 2 "$B3")" none
is "and nothing is published for it" "$(published 2 "$B3")" ""
is "its status stays pending" "$(status 2 "$B3")" pending
is "the next commit is not started" "$(status 2 "$B4")" none
has "the summary counts two deferrals" "$(cat "$SCRATCH/summary-2.md" 2>/dev/null)" \
  "2 commit(s) deferred to the next run"

if [ "$fail" -gt 0 ]; then
  echo
  for n in 1 2; do
    echo "--- leg $n:"
    sed 's/^/    /' "$SCRATCH/leg-$n.out"
  done
fi

echo
echo "$pass passed, $fail failed"
[ "$fail" -eq 0 ]
