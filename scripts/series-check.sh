#!/bin/bash
# Read-only diagnosis for the series loop: what should a firing do?
#
# For every series (or the ones named), walks `<S>-green..<S>-dev`, looks each
# commit up in the verdict store on branch `rcc2` (read via `git show`, no
# checkout of it), classifies failures by what their log CONTAINS, and prints
# one verdict per series:
#
#   ADVANCE            every in-flight commit has a success run
#   WAIT               runs still missing from the harvest (age of harvest shown);
#                      green holds, but the buffer may still extend onto -dev
#   RETRY <sha> <why>  the oldest failure, and nothing in the commit caused it
#   REPAIR <sha> <why>  the oldest failure and its classification
#   IDLE               nothing in flight and nothing buffered
#
# A forward series that has caught up with the green it replaces additionally
# gets a CUTOVER line: the command to run, for a human to run. The loop never
# swaps a serving green itself (.claude/skills/series-loop/SKILL.md).
#
# A series whose `-dev` carries `patch/` entries its `-build` lacks gets a
# PATCH DRIFT line: the buffer regenerates its tree from its own patch stack, so
# an entry that never reached it is one the next vendor run will not apply.
#
# A series one of whose vendor commits stopped a test `main` runs, or left an
# expired engine gate in one, gets a TESTS line (scripts/series-tests.sh): the
# change travels with that commit into every forward and landing, and a restore
# made later as a commit of its own travels with neither.
#
# A series whose buffer vendored a release before upstream tagged it gets a
# LATE TAG line: the commit stamps the previous release's version, and a
# landing must not carry it onto `main` as it is. Whether vendor-one.sh re-stamps it by itself or the
# landing has to is .claude/skills/series-loop/references/1-vendor.md's,
# "A tag upstream pushed late".
#
# Classification is by positive evidence only (.claude/skills/series-loop/SKILL.md);
# "Job is waiting for a hosted runner" appears in every log and means nothing.
#
# The store is the *copy* of what an `each-rcc` leg wrote, not the source: the
# leg writes the same record and log into its artifact and publishes them here
# (scripts/each-shard.sh). A firing reads the run first and this branch only
# when it cannot (.claude/skills/series-loop/SKILL.md stage 2), so where a verdict
# here and one read from a run disagree, the run is right. The ref geometry
# below -- in flight, buffered, the retry ledger, a ready cutover -- does not
# depend on the source at all, which is why this stays worth running either way.
# Teaching it to read runs directly needs API access this script does not
# assume; that is a change to make when a firing needs it, not before.
#
# The `harvest:` line below is the store's tip, and it is no longer bounded by a
# schedule: the sweep, duckdb-r's `rcc-logs.sh`, is not ported here, so what keeps the
# tip moving is the legs publishing as they decide commits. An old timestamp
# therefore means "no leg has decided anything since", which on a quiet series is
# normal and not a fault. Only a record the sweep alone could supply -- a run
# cancelled whole -- is a reason to ask an operator for one.
#
# The record decides before the log does, for the one thing the log cannot say:
# a commit the shard's `timeout` killed at its budget (exit 124) stops mid-run
# with its stage output still buffered, which reads exactly like a cancelled
# leg. That is a REPAIR — the commit did not finish — and calling it transient
# spends another whole budget to learn the same thing.
#
# RETRY and REPAIR split on the retry ledger: `retry-<S>-dev` pointing at the
# failing commit means it has already had its one rerun, so a failure that still
# looks transient is not, and the verdict is REPAIR regardless. The branch
# pointing anywhere else is a spent retry of some earlier commit, and says
# nothing about this one.
#
# The ledger only decides once the rerun has reported. The retry pair rewrites
# nothing, so the pre-retry `failure` record survives on the same SHA until the
# rerun's own record replaces it; reading the ref alone turns a rerun that is
# still building into REPAIR, and invites amending a commit that is about to go
# green. The harvested run's `head_branch` is what tells the two apart.
#
# One more line is about no series at all: `UNSERVED`, last and in its own
# block, names an upstream release line this repository does not serve yet. A
# series is discovered from its refs, so a line that has none is invisible to
# every other part of the loop, and stays invisible while upstream builds on it.
# The block splits the two halves of an opening, because a firing may do one of
# them: it says whether scripts/series.yaml declares the line's flavor, which is
# an edit and a PR. Cutting the refs is not, and stays
# .claude/skills/series-open/SKILL.md's job, and a human's.
#
# Usage: series-check.sh [<series>...] [--remote <name>] [--upstream <path>]
#   series-check.sh                                 # discover all from refs
#   series-check.sh --upstream ../../../igraph      # fork point too, not just names
#
# --remote, --upstream and --canonical are spelled the same in every
# scripts/series-*.sh; see the shared contract in
# handbook/operations/vendoring/series-loop/README.md.

set -euo pipefail
# shellcheck source=series-lib.sh
. "$(dirname "$0")/series-lib.sh"

usage='usage: series-check.sh [<series>...] [--remote <name>] [--upstream <path>] [--canonical <name>]'
remote=${SERIES_REMOTE:-origin}
rcc=${RCC_BRANCH:-rcc2}

# The repository `main` belongs to, which the fork mirrors. Read only for the
# flavor declaration below, and never written here.
canonical=${SERIES_CANONICAL-upstream}

# Where the release-line check at the end reads upstream. Branch names are all
# that check needs, and `git ls-remote` supplies those from the URL alone, so a
# firing with no clone still gets it; a clone is preferred because it also
# answers with the fork point.
upstream=${UPSTREAM_CLONE:-}
upstream_url=${UPSTREAM_URL:-https://github.com/$series_upstream_repo}

argerr() { echo "$usage" >&2; exit 2; }
args=()
while [ $# -gt 0 ]; do
  case "$1" in
    --remote) [ $# -ge 2 ] || argerr; remote=$2; shift 2 ;;
    --upstream) [ $# -ge 2 ] || argerr; upstream=$2; shift 2 ;;
    --canonical) [ $# -ge 2 ] || argerr; canonical=$2; shift 2 ;;
    -h | --help) echo "$usage"; exit 0 ;;
    -*) argerr ;;
    *) args+=("$1"); shift ;;
  esac
done
set -- ${args+"${args[@]}"}

git fetch -q "$remote"
# The flavor declaration is read from the canonical `main`, so refresh that ref
# too. Best effort: a checkout with no such remote, or no way to reach it, still
# answers every other question here from the fork alone.
if [ -n "$canonical" ] && git remote get-url "$canonical" >/dev/null 2>&1; then
  git fetch -q "$canonical" main 2>/dev/null || true
fi

rcc_tip() { git rev-parse -q --verify "refs/remotes/$remote/$rcc" 2>/dev/null; }

# How many commits of a buffer range are still work for stage 5.
#
# series-advance.sh replays them with `cherry-pick --empty=drop`, so a commit
# whose every path `-dev` already carries at that commit's post-image produces
# nothing and is dropped. Counting one leaves the series reading ADVANCE for
# ever: the firing runs the advance, is told `dev -> … (+0)`, and reads the
# same verdict again next time. Only a new vendor commit on the buffer would
# clear it, by moving the anchor past the whole run.
#
# Observed on v1.4-andium since 2026-08-06 (f52ed130b). A buffer takes no ports
# by design, so its `.github/` predates the removal of the `v*.*-*` push filter
# from R-CMD-check.yaml, and a series ref move still triggers `rcc` there; its
# auto-update step committed a `Config/roxygen2/version` bump onto `-build`
# that `-dev` already carried.
#
# The comparison is by content and not by patch-id: `git cherry` reports such a
# commit as unmerged, because the same post-image was reached on `-dev` by a
# different diff.
#
# A buffer tooling sync is no work whatever it holds: series-advance.sh skips it
# rather than picking it, because `-dev`'s tooling is stage 4's. Counted, the
# one at a quiet buffer's tail would read ADVANCE for ever, exactly as above.
consumable_count() { # <range> <dev> -> commits of <range> that are not no-ops on <dev>
  local range=$1 dev=$2 n=0 c f
  while IFS= read -r c; do
    if [ "$(git log -1 --format=%s "$c")" = "chore(series): Sync buffer tooling with main" ]; then
      continue
    fi
    while IFS= read -r -d '' f; do
      if [ "$(git rev-parse -q --verify "$c:$f" || true)" \
        != "$(git rev-parse -q --verify "$dev:$f" || true)" ]; then
        n=$((n + 1))
        break
      fi
    done < <(git diff-tree --no-commit-id --name-only -r -z "$c")
  done < <(git rev-list "$range")
  echo "$n"
}

# The store's record for a commit: one small blob, published by the matrix leg
# seconds after it decided the commit. One read for every question below, so they
# cannot disagree about which verdict they are describing — which they could
# while the same record lived both in a per-commit part and in an aggregate line
# that caught up later.
record_of() { # <sha> -> the record, empty if the store has none
  git show "$remote/$rcc:runs2.d/${1:0:2}/$1.ndjson" 2>/dev/null || true
}

record_field() { # <sha> <sed expression> -> the first match, empty if none
  local rec
  rec=$(record_of "$1")
  [ -z "$rec" ] && return
  sed -nr "$2" <<<"$rec" | head -n 1
}

state_of() { # <sha> -> success|failure|pending|missing
  local rec
  rec=$(record_of "$1")
  [ -z "$rec" ] && { echo missing; return; }
  sed -nr 's/.*"status":[^}]*"state": *"([a-z]+)".*/\1/p' <<<"$rec" | head -n 1
}

# The branch the harvested record's run was triggered on. This is what tells a
# spent rerun from one still in flight: the retry pair rewrites nothing, so the
# pre-retry record survives on the same SHA until the rerun's replaces it.
run_branch_of() { # <sha> -> head_branch of the harvested run, empty if none
  record_field "$1" 's/.*"head_branch": *"([^"]*)".*/\1/p'
}

# The shard's own verdict on how the commit ended. `timeout` in
# scripts/each-shard.sh reports 124 when it kills rcc-one.sh at the budget, and
# that is the one thing the log cannot say: the killed stage buffers its output
# through run_stage and loses it, so the log simply stops mid-run and reads like
# a cancelled leg. Without this the log rules below call a commit that ran out
# of budget `transient` and the loop reruns it, which costs another full budget
# to learn the same thing.
exit_code_of() { # <sha> -> exit code the shard recorded, empty if none
  record_field "$1" 's/.*"exit_code": *([0-9]+).*/\1/p'
}

duration_of() { # <sha> -> seconds the shard spent on it, empty if none
  record_field "$1" 's/.*"duration_seconds": *([0-9]+).*/\1/p'
}

# The stages the shard recorded as failed, which the log cannot always say. A
# stage that fails before the tests run -- `install` above all, where a glue
# call site the series' engine no longer offers stops the compile -- leaves a
# log with no testthat output in it, which is byte for byte what a cancelled
# leg leaves. Without this the fallback below calls such a commit transient and
# the loop spends a rerun to be told the same thing.
failed_stages_of() { # <sha> -> the stages, comma-separated, empty if none
  record_field "$1" 's/.*"failed_stages": *\[([^]]*)\].*/\1/p' | tr -d '"' | sed 's/,/, /g'
}

# Positive evidence that a gate reached out over the network and was refused.
# Checked only after the tree-shaped classifications above it, so a real test
# failure that happens to mention a URL is not mistaken for a flake.
net_re="cannot open URL|SSL connect error|Could not resolve host"
net_re="$net_re|Connection (timed out|refused|reset)|Timeout was reached"
net_re="$net_re|Failed to connect|curl: \([0-9]+\)|50[234] (Bad Gateway|Service Unavailable|Gateway Time-out)"

failed_gate() { # <log> -> name of the first gate rcc-one.sh's summary marks FAIL
  grep -oE '^\| [A-Za-z0-9_-]+ \| FAIL ' <<<"$1" | head -1 | awk '{print $2}'
}

last_gate() { # <log> -> the gate rcc-one.sh opened last, i.e. where it stopped
  grep -oE '^::group::gate: [a-z]+' <<<"$1" | tail -1 | awk '{print $NF}'
}

classify() { # <sha> -> "<kind>|<one line>"; kind `transient` means rerun, do not repair
  local log gate rc
  log=$(git show "$remote/$rcc:logs2.d/${1:0:2}/$1.log" 2>/dev/null || true)
  [ -z "$log" ] && { echo "unknown|failure, no log harvested yet"; return; }
  # Budget first, and ahead of every log rule: a commit the shard killed never
  # reached a verdict on its own content, so whatever the log shows is what it
  # got through, not what went wrong. Rerunning it buys the same kill again.
  rc=$(exit_code_of "$1")
  if [ "$rc" = 124 ]; then
    gate=$(last_gate "$log")
    echo "budget|killed at the shard budget after $(duration_of "$1")s," \
      "stuck in the ${gate:-unnamed} gate — not a flake, it did not finish"
    return
  fi
  # The same thing one level down: scripts/rcc-one.sh bounds each stage, so a
  # stuck gate is now killed on its own and the leg lives to report it. The leg
  # then exits 1 like any failure, and only this line says the stage ran out of
  # time rather than failing on its merits.
  if grep -q "exceeded its .* budget -- presumed stuck" <<<"$log"; then
    echo "budget|$(grep -oE "stage [a-z]+: exceeded its [0-9]+s budget" <<<"$log" | head -1)" \
      "— the gate did not finish, rerunning it buys the same kill"
    return
  fi
  if grep -qE "Updating snapshots: '" <<<"$log"; then
    echo "snapshot|snapshot drift ($(grep -oE "Updating snapshots: [^.]*" <<<"$log" | head -1))"
  elif grep -qE "Error \('test-[^']+'\)" <<<"$log"; then
    echo "test|test failure ($(grep -oE "Error \('test-[^']+'\)" <<<"$log" | head -1))"
  elif grep -q "Changes detected in workflow_dispatch build" <<<"$log"; then
    echo "style|style/roxygen drift"
  elif grep -qE '^Error: R CMD check found (ERROR|WARNING|NOTE)' <<<"$log"; then
    # The check gate's own verdict, and it is definite: `--as-cran` named the
    # checks it is unhappy about, so a rerun buys the same answer. Ahead of the
    # network rule for that reason, and behind the three above it because a
    # snapshot, a test or a style diff says more precisely what to fix.
    echo "check|$(grep -oE 'R CMD check found .*' <<<"$log" | head -1)" \
      "($(grep -E '^❯ checking' <<<"$log" | sed 's/^❯ //; s/ \.\.\..*//' |
        tr '\n' '\a' | sed 's/\a$//; s/\a/; /g'))"
  elif grep -qE "$net_re" <<<"$log"; then
    gate=$(failed_gate "$log")
    echo "transient|network failure in the ${gate:-unnamed} gate ($(grep -oE "$net_re" <<<"$log" | head -1))"
  elif [ -n "$(failed_stages_of "$1")" ]; then
    # The record named a stage, and that is definite: the stage ran and failed
    # on its merits, so this is a REPAIR however little the log shows. Behind
    # the rules above, which name the fix more precisely, and behind the network
    # rule, since a gate refused a download is transient whichever stage it sat
    # in. Ahead of the fallback, which is only about a leg that decided nothing.
    echo "stage|the $(failed_stages_of "$1") stage failed, and the gates after it did not run"
  elif ! grep -q "test_local\|testthat" <<<"$log"; then
    echo "transient|cancelled or infra (no test phase in log)"
  else
    echo "unknown|unclassified: review logs2.d/${1:0:2}/$1.log on branch $rcc by hand"
  fi
}

# Every series this repository serves, discovered from the refs and never from
# configuration (handbook/branches/model/): an `<X>-build` with a sibling
# `<X>-dev`. Discovered even when the caller named series, because the
# release-line check at the end asks what is served, and a run narrowed to one
# series would otherwise report the rest of them as unserved.
all_series=()
while IFS= read -r b; do
  s=${b#refs/heads/}; s=${s%-build}
  case "$s" in *-build-base) continue ;; esac
  git rev-parse -q --verify "refs/remotes/$remote/$s-dev" >/dev/null && all_series+=("$s")
done < <(git ls-remote --heads "$remote" '*-build' | cut -f2)

series=("$@")
if [ ${#series[@]} -eq 0 ]; then
  series=("${all_series[@]}")
fi

# The shape upstream gives a release line, and the only branches the check at
# the end looks at. `main` is not one: it is a line the package serves under
# that name, and it never stops being the newest.
release_line_re='^v[0-9]+\.[0-9]+-[A-Za-z0-9-]+$'

# `major.minor` as one number, so lines are compared as versions rather than as
# strings -- a string compare puts `v1.10` below `v1.9`, and the floor below
# would then fall silent on the newer line.
line_rank() { # v<major>.<minor>-<codename>[-fwd] -> integer
  local v=${1#v} major minor
  major=${v%%.*}; minor=${v#*.}; minor=${minor%%-*}
  echo $((major * 1000 + minor))
}

# The flavor a line would publish under, by the rule the declaration follows:
# `v2.1-<codename>` is served as `igraph.2.1.dev`. Derived rather than read, so
# that a line with no entry yet still has a name to report.
flavor_of() { # v<major>.<minor>-<codename> -> igraph.<major>.<minor>.dev
  local v=${1#v}
  echo "$series_package.${v%%-*}.dev"
}

# Does `scripts/series.yaml` already name that flavor? An UNSERVED line has no
# refs by definition, so the declaration is the only place a decision about it
# can have been recorded, and it splits two states a firing must not confuse:
# nothing done at all, and the flavor PR merged with only the refs left to cut
# (.claude/skills/series-loop/SKILL.md, "What a firing reports").
#
# Read from a `main` ref rather than the working tree: a firing checks out
# series branches, whose trees lag `main` by whatever stage 4 has not ported
# yet, and the declaration is `main`'s.
#
# The canonical repository comes first, and the fork's mirror of it second. The
# question this answers is whether the flavor PR has merged, so a mirror the
# Pull app has not refreshed yet answers "undeclared" for a PR that merged
# hours ago -- and the skill's rule on an undeclared line is to open one, which
# is how a firing would file the same PR twice
# (.claude/skills/series-loop/SKILL.md, "What a firing reports"). Whichever ref
# is fresher is right, and only the canonical one is guaranteed to be.
declaration() { # -> the file, empty and non-zero when no ref carries it
  local r
  for r in ${canonical:+"refs/remotes/$canonical/main"} \
    "refs/remotes/$remote/main" refs/heads/main; do
    git show "$r:scripts/series.yaml" 2>/dev/null && return 0
  done
  return 1
}

# Upstream's release tags as `<commit> <tag>`, from the clone when there is one and
# from the remote otherwise. An annotated tag is peeled to its commit, which is
# what a vendor subject names. Read once, because every series asks.
upstream_tags() {
  if [ -n "$upstream" ]; then
    git -C "$upstream" for-each-ref \
      --format='%(if)%(*objectname)%(then)%(*objectname)%(else)%(objectname)%(end) %(refname:lstrip=2)' \
      "refs/tags/$series_tag_glob" 2>/dev/null || true
  else
    git ls-remote --tags "$upstream_url" "$series_tag_glob" 2>/dev/null |
      awk '{ t = $2; sub("^refs/tags/", "", t)
             if (sub("\\^\\{\\}$", "", t)) peeled[t] = $1; else plain[t] = $1 }
           END { for (t in plain) print (t in peeled ? peeled[t] : plain[t]), t }' || true
  fi
}

# A release the buffer vendored before upstream tagged it
# (.claude/skills/series-loop/references/1-vendor.md, "A tag upstream pushed
# late"). The buffer's tip still
# stamps `X.Y.Z-devN` although `vX.Y.Z` exists, and the tagged commit is one it
# vendored with no `(tag vX.Y.Z)` marker. The version names the one tag worth
# asking about: a tag the buffer has not reached yet is the walk's to stamp, and
# one it vendored in time leaves no `-dev` behind it.
#
# An engine whose stamp names no release (scripts/series-config.sh leaves
# `series_release_of_stamp` undefined) is asked the other way round: every
# vendor commit of the buffer against the tags, newest first, so that a
# re-stamp is met before the plain commit it re-stamps and that one is not
# reported.
late_tag() { # <build> -> "<tag> <upstream sha> <buffer commit>", empty if none
  local v tag sha lines
  if declare -F series_release_of_stamp >/dev/null; then
    v=$(series_release_of_stamp "$(series_stamped_version "$1")")
    [ -n "$v" ] || return 0
    tag=$(series_tag_of_release "$v")
    sha=$(awk -v t="$tag" '$2 == t { print $1; exit }' <<<"$tags")
    [ -n "$sha" ] || return 0
    lines=$(git log --format='%H %s' "$1" | grep -F "@$sha" || true)
    [ -n "$lines" ] || return 0
    if grep -qF "(tag $tag)" <<<"$lines"; then return 0; fi
    echo "$tag $sha $(head -n 1 <<<"$lines" | cut -d' ' -f1)"
    return 0
  fi
  # The tags sorted, so an abbreviated SHA that is a prefix of two tagged
  # commits meets the same one on every run.
  awk -F'\t' -v ere="$series_marker_ere" '
    FNR == NR { if (split($0, a, " ") >= 2) { n++; sha[n] = a[1]; tag[n] = a[2] } next }
    {
      if (!match($2, ere)) next
      m = substr($2, RSTART, RLENGTH); sub(/^.*@/, "", m)
      for (i = 1; i <= n; i++) {
        if (index(sha[i], m) != 1) continue
        if (index($2, "(tag " tag[i] ")")) seen[m] = 1
        else if (!(m in seen)) { print tag[i], m, $1; exit }
        break
      }
    }' <(printf '%s\n' "$tags" | sort) <(git log --format='%H%x09%s' "$1" -- "$series_scan_dir")
}

# How the clone names an upstream branch: a clone made by `git clone` carries it
# as a remote-tracking ref, and a mirror as a head.
upstream_ref() { # <branch> -> full ref, empty if the clone has none
  local r
  for r in "refs/remotes/origin/$1" "refs/heads/$1"; do
    if git -C "$upstream" rev-parse -q --verify "$r" >/dev/null; then echo "$r"; return; fi
  done
}

# The upstream branch names, from the clone when there is one and from the
# remote otherwise. Empty is not "upstream has no release branches" -- it never
# has none -- it is the reading having failed, and the caller says so rather
# than printing the silence as a clean result.
upstream_branches() {
  if [ -n "$upstream" ]; then
    git -C "$upstream" for-each-ref --format='%(refname:lstrip=3)' "refs/remotes/*/$series_branch_glob" 2>/dev/null || true
    git -C "$upstream" for-each-ref --format='%(refname:lstrip=2)' "refs/heads/$series_branch_glob" 2>/dev/null || true
  else
    git ls-remote --heads "$upstream_url" "$series_branch_glob" 2>/dev/null | cut -f2 | sed 's|^refs/heads/||' || true
  fi
}

# The fork point of a release line: the newest commit on the first-parent chain
# of both upstream branches (handbook/operations/vendoring/model/). Not
# `git merge-base`, which upstream's back-merges of the release branch into
# `main` drag forward by weeks; a series seeded from that
# answer jumps the commits in between in one step, and none of them is ever
# built against the glue. Printed only when a clone can compute it, because a
# wrong fork point is worse than none.
fork_point() { # <upstream branch> -> sha, empty without a clone
  local main_ref rel_ref
  [ -n "$upstream" ] || return 0
  main_ref=$(upstream_ref main); rel_ref=$(upstream_ref "$1")
  [ -n "$main_ref" ] && [ -n "$rel_ref" ] || return 0
  awk 'NR==FNR { seen[$0]; next } $0 in seen { print; exit }' \
    <(git -C "$upstream" rev-list --first-parent "$main_ref") \
    <(git -C "$upstream" rev-list --first-parent "$rel_ref")
}

# The tests every series is held to are `main`'s: the canonical copy where this
# run could fetch it, the fork's mirror otherwise.
main_ref=''
for r in ${canonical:+"refs/remotes/$canonical/main"} "refs/remotes/$remote/main"; do
  if git rev-parse -q --verify "$r" >/dev/null; then main_ref=$r; break; fi
done

tip=$(rcc_tip) || { echo "no $rcc branch on $remote"; exit 1; }
echo "harvest: $(git log -1 --format='%ci (%ar)' "$tip")"
tags=$(upstream_tags)
if [ -z "$tags" ]; then
  # Said, because a reading that failed reads exactly like no late tag at all.
  echo "tags:    could not read upstream tags from ${upstream:-$upstream_url};"
  echo "         no LATE TAG line below means missing data, not a clean result"
fi
echo

for S in "${series[@]}"; do
  green="$remote/$S-green"; dev="$remote/$S-dev"; build="$remote/$S-build"
  for r in "$green" "$dev" "$build"; do
    git rev-parse -q --verify "$r" >/dev/null || { echo "$S: missing ${r#"$remote"/}, skipping"; continue 2; }
  done
  # cutover litter: a forward series whose green is an ancestor of its base's
  # (the base moves on after cutover, so equality cannot be the test)
  cutover=""
  case "$S" in *-fwd)
    base=${S%-fwd}
    if git rev-parse -q --verify "$remote/$base-green" >/dev/null; then
      if git merge-base --is-ancestor "$green" "$remote/$base-green"; then
        echo "$S: green is an ancestor of $base's — cutover litter, ignoring"; continue
      fi
      # Ready to cut over once the forward green vendors the upstream commit the
      # base green vendors: coverage may never regress. Tested by subject, like
      # every other equivalence here, and bounded by the mainline the forward
      # seed was built on — `main`'s own vendor commits sit below that seed and
      # must not answer for the forward chain. A base green that vendors nothing
      # asks for no coverage, exactly as in series-cutover.sh.
      base_up=$(series_vendored_sha "$remote/$base-green")
      # Collected, not piped into grep: `grep -q` leaves early, and under
      # `pipefail` the SIGPIPE it hands `git log` would read as a failed test.
      fwd_vendored=$(git log --format=%s "$remote/main..$green" -- "$series_scan_dir" || true)
      if [ -z "$base_up" ] || grep -qF "@$base_up" <<<"$fwd_vendored"; then
        cutover=$base
      fi
    fi ;;
  esac

  inflight=$(git rev-list --count "$green..$dev")
  # the buffer counts from -dev's consumption anchor on -build: the -dev tip
  # while it sits on -build's line, otherwise the -build commit equivalent to
  # -dev's newest vendor commit — the identical rule, and the identical reasons,
  # as the anchor in scripts/series-advance.sh. It counts what that stage would
  # actually mint, which is why a commit it would drop as empty is not buffered
  # work (consumable_count above).
  mb=$(git merge-base "$dev" "$build")
  if [ "$mb" = "$(git rev-parse "$dev")" ]; then
    buffered=$(consumable_count "$dev..$build" "$dev")
  else
    dev_up=$(series_vendored_sha "$dev")
    anchor=$(series_build_equivalent "$build" "$dev" "${dev_up:-NONE}")
    if [ -n "$anchor" ]; then
      buffered=$(consumable_count "$anchor..$build" "$dev")
    else
      buffered="?"
    fi
  fi
  echo "=== $S: $inflight in flight, $buffered buffered, green=$(git rev-parse --short "$green") dev=$(git rev-parse --short "$dev")"

  oldest="" why="" missing=0
  while IFS= read -r sha; do
    st=$(state_of "$sha")
    case "$st" in
      success) ;;
      missing|pending) missing=$((missing + 1)) ;;
      *) oldest="$sha"; why=$(classify "$sha") ;;   # keep last seen = oldest (list is newest-first)
    esac
  done < <(git rev-list "$green..$dev")

  if [ -n "$oldest" ]; then
    kind=${why%%|*}; desc=${why#*|}
    retried=$(git rev-parse -q --verify "refs/remotes/$remote/retry-$S-dev" || true)
    if [ "$retried" = "$oldest" ]; then
      if [ "$(run_branch_of "$oldest")" = "retry-$S-dev" ]; then
        echo "  REPAIR $oldest"
        echo "         $desc"
        echo "         retry-$S-dev reported on this commit: the rerun was spent, this failure is real"
      else
        echo "  WAIT   retry-$S-dev is on this commit, rerun not harvested yet"
        echo "         the record below is the pre-retry one; do not repair on it"
        echo "         $desc"
      fi
    elif [ "$kind" = transient ]; then
      echo "  RETRY  $oldest"
      echo "         $desc"
    else
      echo "  REPAIR $oldest"
      echo "         $desc"
    fi
  elif [ "$missing" -gt 0 ]; then
    # Pending verdicts hold green, not the buffer: stage 5 extends on pending
    # and stops only on red (.claude/skills/series-loop/SKILL.md stage 5).
    if [ "$buffered" != 0 ]; then
      echo "  WAIT   $missing run(s) not harvested yet — green holds, buffer may still extend"
    else
      echo "  WAIT   $missing run(s) not harvested yet"
    fi
  elif [ "$inflight" -eq 0 ] && [ "$buffered" = 0 ]; then
    echo "  IDLE   nothing in flight, buffer empty — vendor"
  else
    echo "  ADVANCE"
  fi

  # A `patch/` entry that only ever reached `-dev` is absent the next time the
  # buffer vendors: `vendor-one.sh` applies the *buffer's* patch stack to every
  # tree it regenerates (.claude/skills/series-loop/SKILL.md stage 3). Stage 4's port
  # is how such an entry arrives -- it carries whole `main` commits onto `-dev`,
  # `patch/` files included -- and `-build` takes no ports by design, so nothing
  # closes the gap by itself. The drift is quiet while upstream leaves the
  # patched file alone, because the buffer is then internally consistent and its
  # commits carry no delta for that file; it bites the first time upstream
  # touches it, and the fix is reverted on `-dev` by a commit that looks like an
  # ordinary vendor.
  #
  # Reported in both directions, because a renamed entry is one of each and
  # neither half alone says so.
  # Compared by blob, not by name: `main` also edits an entry in place, and the
  # port brings the new content to `-dev` under a name the buffer already has,
  # which a name-only comparison calls level. Such an entry is `edited`, as
  # series-patch-sync.sh calls it, and is never carried.
  only_dev=$(comm -23 \
    <(git ls-tree --name-only "$dev" patch/ | sort) \
    <(git ls-tree --name-only "$build" patch/ | sort))
  only_build=$(comm -13 \
    <(git ls-tree --name-only "$dev" patch/ | sort) \
    <(git ls-tree --name-only "$build" patch/ | sort))
  edited=$(for n in $(comm -12 \
      <(git ls-tree --name-only "$dev" patch/ | sort) \
      <(git ls-tree --name-only "$build" patch/ | sort)); do
    [ "$(git rev-parse "$dev:$n")" = "$(git rev-parse "$build:$n")" ] || echo "$n"
  done)
  if [ -n "$only_dev$only_build$edited" ]; then
    echo "  PATCH DRIFT  the two patch stacks of $S differ:"
    if [ -n "$only_dev" ]; then
      printf '%s\n' "$only_dev" | sed 's|^patch/|               -dev only:    |'
    fi
    if [ -n "$only_build" ]; then
      printf '%s\n' "$only_build" | sed 's|^patch/|               -build only:  |'
    fi
    if [ -n "$edited" ]; then
      printf '%s\n' "$edited" | sed 's|^patch/|               edited:       |'
    fi
    echo "               scripts/series-patch-sync.sh $S --remote $remote says which of these it can carry;"
    echo "               after a port, what is left is what it declined — stage 3 work"
  fi

  # The vendor strand the buffer is derived from (handbook/branches/model/README.md):
  # absent on a series opened before it existed, ahead of the buffer while
  # stage 1's picks are due, or behind it where something vendored onto the
  # buffer directly. Read by the vendor paths blob for blob, as the picks find
  # their twins, so a patch carry counts like a vendor commit.
  vendor="$remote/$S-vendor"
  if ! git rev-parse -q --verify "$vendor" >/dev/null; then
    echo "  VENDOR  $S has no vendor strand; derive it once from the buffer:"
    echo "          scripts/series-vendor.sh $S --init --remote $remote --push"
  elif [ "$(series_vendor_key "$vendor")" != "$(series_vendor_key "$build")" ]; then
    bkey=$(series_vendor_key "$build")
    at=''
    for c in $(git rev-list -n "$base_scan_depth" "$vendor"); do
      if [ "$(series_vendor_key "$c")" = "$bkey" ]; then at=$c; break; fi
    done
    if [ -n "$at" ]; then
      echo "  VENDOR  $S-vendor is $(git rev-list --count "$at..$vendor") commit(s) ahead of $S-build; stage 1 picks them:"
      echo "          scripts/series-vendor.sh $S --remote $remote --push   # from a worktree at $S-build"
    else
      echo "  VENDOR  $S-build's vendor paths match none of the newest $base_scan_depth commits of $S-vendor:"
      echo "          something vendored onto the buffer directly. Vendor onto the strand"
      echo "          (vendor-one.sh --strand) and pick; the buffer never leads it."
    fi
  fi

  # A test `main` runs that a vendor commit of this series stopped, deleted or
  # skipped without an engine gate, and a gate that has expired and is due to
  # go (handbook/operations/vendoring/series-loop/README.md). A landing refuses
  # each, so it is named on every firing, while the commit that took it may
  # still be above green. Only a vendor commit's, because a test `main` added
  # since the last port is stage 4's, and only what the tip still lacks.
  if [ -n "$main_ref" ]; then
    lost=$("$(dirname "$0")/series-tests.sh" "$main_ref" "$dev" --vendored --porcelain 2>/dev/null || true)
    lost=$(awk -F'\t' '$1 ~ /^(deleted|block|snapshot|skip|expired)$/' <<<"$lost")
    if [ -n "$lost" ]; then
      echo "  TESTS  $(grep -c . <<<"$lost") of main's test(s) stopped or still gated by a vendor commit of $S-dev:"
      while IFS=$'\t' read -r k p w c; do
        printf '         %-8s %s, by %s\n' "$k" "$p" "$(git log -1 --format='%h %s' "$c" | cut -c1-72)"
        [ "$k" = deleted ] || printf '                  %s\n' "${w:0:110}"
      done <<<"$lost"
      echo "         Restore each in the commit that took it, or gate it (.claude/skills/series-loop/SKILL.md stage 2):"
      echo "         scripts/series-tests.sh ${main_ref#refs/remotes/} $dev"
    fi
  fi

  # Beside the verdict, like the cutover below: a buffer can be green and idle
  # and still hold a release under a stamp that names the previous one, which a
  # landing (.claude/skills/series-land/SKILL.md) must not carry onto `main`.
  late=$(late_tag "$build")
  if [ -n "$late" ]; then
    read -r lt_tag lt_sha lt_commit <<<"$late"
    echo "  LATE TAG  upstream tagged $lt_tag on $series_upstream_repo@${lt_sha:0:10} after $S-build"
    echo "            vendored it as $(git rev-parse --short "$lt_commit"), which stamps the previous release's version."
    if [ "$(series_vendored_sha "$build")" = "$lt_sha" ]; then
      echo "            It is the buffer's newest vendor commit, so stage 1 re-stamps it;"
      echo "            fetch the upstream clone's tags first (scripts/vendor-one.sh)."
    else
      above=$(git log --format=%s "$lt_commit..$build" -- "$series_scan_dir" | grep -cE "$series_marker_ere" || true)
      echo "            $above vendor commit(s) sit above it, so no run re-stamps it by itself:"
      echo "            .claude/skills/series-loop/references/1-vendor.md, \"A tag upstream pushed late\"."
    fi
  fi

  # Suggested, never done: a firing reports a ready cutover and stops
  # (.claude/skills/series-loop/SKILL.md). Printed beside the verdict rather than as
  # one, because it is orthogonal — a forward series that has caught up still
  # needs repairing, advancing or waiting like any other.
  if [ -n "$cutover" ]; then
    # Named options, and the upstream path filled in when this run was given
    # one: the block a firing hands over is meant to be pasted whole, and a
    # placeholder in the argument that decides whether the coverage gate runs
    # at all is the one word nobody can substitute from the report alone
    # (.claude/skills/series-loop/SKILL.md stage 6).
    echo "  CUTOVER  $S covers $cutover's green — a manual step, never a firing's:"
    echo "           scripts/series-cutover.sh $cutover --remote $remote \\"
    echo "             --upstream ${upstream:-<path to a $series_upstream_repo checkout>}"
    echo "           It archives the replaced lineages in closed pull requests, then"
    echo "           swaps; --prepare prints its gates and review and moves nothing."
    echo "           Coverage is only half of it; what the two branches carry is"
    echo "           the other half, and the cutover prints it before it asks:"
    echo "           scripts/series-converge.sh $cutover --remote $remote"
  fi
done

# An upstream release line this repository does not serve. Printed last and in
# a block of its own, because everything above it is per-series: a firing where
# every series reads ADVANCE or IDLE is the quietest report the loop produces,
# and exactly the one a line lost at the bottom of would be skimmed past. It is
# reported again on every firing until the series exists, because nothing else
# notices it at all -- a series is discovered from refs
# (handbook/branches/model/), so a line that has none is absent rather than
# late, and absence raises nothing anywhere.
#
# The floor is the greatest `major.minor` among the served series. Upstream
# keeps every release branch it ever cut alive, and this repository serves the
# recent ones only, so a line at or below the floor is a decision already taken
# and only a line above it is news. That is the whole rule, and it is why there
# is no list of lines to ignore: such a list is maintained by hand, and the
# firing it would be stale on is the one where a line was just cut. With no
# served series carrying a version token there is no floor, and every release
# line upstream carries is reported -- a repository serving none of them is one
# where each is genuinely unserved.
floor=0
for S in "${all_series[@]}"; do
  case "$S" in
    v[0-9]*.[0-9]*-*) r=$(line_rank "$S"); [ "$r" -gt "$floor" ] && floor=$r ;;
  esac
done

unserved=()
branches=$(upstream_branches | sort -u)
while IFS= read -r b; do
  [ -n "$b" ] || continue
  grep -qE "$release_line_re" <<<"$b" || continue
  [ "$(line_rank "$b")" -gt "$floor" ] || continue
  # Served is the same question every other stage asks, asked of one branch:
  # does a series of that name exist? A line may be served by a `-fwd` series
  # alone, which is one that started as a forward and has no base to replace.
  served=
  for S in "${all_series[@]}"; do
    case "$S" in "$b" | "$b-fwd") served=1; break ;; esac
  done
  [ -n "$served" ] || unserved+=("$b")
done <<<"$branches"

if [ -z "$branches" ]; then
  # A reading that failed reads exactly like a clean result, so say which this
  # is. The same degradation rule as the cutover gate's missing clone.
  echo
  echo "UNSERVED  could not read the upstream branches from ${upstream:-$upstream_url},"
  echo "          so this firing does not know whether a release line was cut."
  echo "          That is missing data, not a clean result."
elif [ ${#unserved[@]} -gt 0 ]; then
  echo
  echo "=============================================================================="
  for b in "${unserved[@]}"; do
    echo "UNSERVED  $b is cut upstream and no series here serves it:"
    echo "          neither $b-build nor $b-dev exists."
    fp=$(fork_point "$b")
    if [ -n "$fp" ]; then
      echo "          Fork point $fp,"
      echo "          $(git -C "$upstream" rev-list --count --first-parent "$fp..$(upstream_ref "$b")") first-parent commits back. That is not what"
      echo "          git merge-base answers here (handbook/operations/vendoring/model/)."
    fi
    # Which half of the opening is still owed. Declaring the flavor is a file
    # edit and a firing may open the PR for it; cutting the refs is not, and
    # never is.
    flav=$(flavor_of "$b"); decl=$(declaration || true)
    if [ -z "$decl" ]; then
      echo "          Could not read scripts/series.yaml, so this firing does not"
      echo "          know whether $flav is declared. Missing data, not a clean result."
    elif grep -qE "^[[:space:]]*-?[[:space:]]*flavor:[[:space:]]*${flav//./\\.}[[:space:]]*\$" <<<"$decl"; then
      echo "          Declared already: scripts/series.yaml names $flav, so only the"
      echo "          refs are missing. Do not open a second declaration PR."
    else
      echo "          Undeclared: scripts/series.yaml has no $flav."
    fi
  done
  # Said once, however many lines are listed: what waiting costs. It is a
  # decision owed an answer rather than a fault -- a line may be opened
  # deliberately, on a released tree, once the current one ships -- and the
  # loop cuts no refs either way, so the rest of this block is to be impossible
  # to miss and to stay inside what branch names can support. How much of the
  # line another series has already vendored is not one of those things:
  # upstream back-merges the release branch into `main`, so some of it may
  # well be built here, and a check that reads names cannot say how much.
  echo "          Open the series: .claude/skills/series-open/SKILL.md"
  echo "          No release can be cut from a line nothing here serves, and"
  echo "          the catch-up walk that opening one costs grows with every"
  echo "          upstream commit on it."
  echo "=============================================================================="
fi
