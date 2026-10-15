#!/bin/bash
# The ref motion of the series loop, stages 3 and 5, for one series:
# fast-forward `<S>-green` over the all-green prefix, set `<S>-build-base` to
# the equivalent `-build` commit, and extend `<S>-dev` from the buffer.
#
# Everything here is mechanical and gated; the judgement calls (repairs,
# review) stay with the skill. A failure in the in-flight range still lets
# green take the verified commits below it, and then stops the firing before
# `-dev` is extended — run series-check.sh first and repair.
#
# **Stage 5 carries the base series' fixes** onto a forward series as it
# consumes its buffer. The two branches divide by how far a fix was demanded:
# `-build` holds what the code needs to **compile**, because that is what the
# vendor gate checks at every commit, and `-dev` holds everything CI asked for
# after that -- snapshots, test files, R code, and the glue a test or a check
# turned out to need. A forward's `-fwd-build` was replayed out of the base
# buffer, so it has the first and none of the second, and every one of those
# fixes would be rediscovered as a red commit, at a repair plus a replay of
# everything above it. The base `<S>-dev` proved them already, against the same
# upstream commit; this folds them into the commit that needs them as it is
# minted (duckdb/duckdb-r#2594).
#
# What carries is the **difference** between the twin and its `-build` commit,
# not an allow-list of directories. `src/` is not compile-only territory: the
# buffer already compiles, so glue the `-dev` twin has on top of it was demanded
# by something later than the compiler, and holding it back would strand exactly
# the fixes this exists to move. Taking the difference is also what keeps the
# glue the buffer already carries from being applied twice.
#
# Two kinds are excluded, and neither is a judgement about the fix: the buffer's
# own strand (the vendored tree and `patch/` -- a forward regenerates the tree
# from its own patches) and what vendoring regenerates from it (the R/C interface,
# the cpp11 registration, the source lists; scripts/series-config.sh names both),
# which differs between any two vendor runs of the same SHA and is noise wearing
# the shape of a fix.
# Carried glue is reported as it goes, because glue the base `-dev` has and the
# base `-build` lacks is buffer drift and wants mirroring there.
#
# **A carry never stops a test the forward runs.** A twin folded at a rewind may
# delete a test or skip one for good, where its engine could not pass it, and
# the base's restore of it, if any, is a commit of its own that no carry finds:
# `v2.0-cyanoptera-fwd` took `tests/testthat/test-variant.R`'s deletion this way
# and never its restore (duckdb/duckdb-r#2899). So a path under `tests/` whose
# carry would take a test away keeps what the forward has, read by
# scripts/series-tests.sh, and is named in the commit message; an engine gate,
# which re-arms its test by itself, carries like any fix.
#
# **This stage is attended.** A carry the series has moved out from under stops
# the run with the conflict in a worktree that is kept, because resolving it is
# judgement and guessing costs a wrong commit on a chain CI is about to judge.
# `--continue` picks the run up where it stopped; `--abort` throws the worktree
# away and leaves the refs untouched.
#
# **`--dev-note` writes a stage-3 finding into the commit this stage mints.** An
# r-universe failure has no per-commit record anywhere and no commit of its own,
# so the series keeps it in the message of the next `-dev` commit
# (.claude/skills/series-loop/SKILL.md stage 3). This stage is the one that mints that
# commit and pushes it in the same breath, so a firing that writes the finding
# afterwards pays an amend, a force-push, and one each-rcc run spent on a commit
# it is about to re-mint. The note is appended to the newest minted commit's
# message before the push instead. A note forces the replay route below, because
# the plain ref move has no commit of its own to carry it, and it is an error to
# ask for one when the chunk minted nothing. A note that does not open with an
# `R-side fix` header gets one, because that header is what series-glue.sh and
# stage 2's mining step anchor on: a note written without it lands in the commit
# and is read by nothing, which is the one outcome the option exists to prevent.
#
# **`--canonical` mirrors the green into the repository r-universe reads.**
# The series refs live in the fork, but the base flavors are published from the
# canonical repository, so `<S>-green` has to exist in both and nothing else
# does. The push is a plain one, fast-forward only, and a refusal stops the
# firing rather than being forced: green is the verified frontier, and the only
# thing that legitimately moves it off its lineage is a cutover, which does the
# mirror itself (scripts/series-cutover.sh). Every series' green travels, the
# forward's too: nothing publishes `<S>-fwd-green` from there, but the cutover
# archives the replaced copy against it and deletes it afterwards, so both
# copies of a line's history live where r-universe reads.
# The push runs on every firing, not only on the ones where green moved: an
# idle series whose copy fell behind for some other reason would otherwise
# never be asked about again, and the push is a no-op when the two agree.
#
# It defaults to `upstream`, the name a `gh` clone of a fork gives the repository
# it was forked from, so mirroring is on wherever that name means what it usually
# means. Setting `SERIES_CANONICAL` to the empty string turns it off; leaving it
# unset does not, because a mirror that silently stops is the failure this
# exists to prevent.
#
# Usage: series-advance.sh <series> [--chunk <n>] [--dev-note <file>]
#        series-advance.sh <series> --continue [--dev-note <file>]
#        series-advance.sh <series> --abort          # discard a stopped replay
#
# --remote is spelled the same in every scripts/series-*.sh, and the chunk size
# is an option like vendor-one.sh's --commits rather than a bare number beside
# the series name; see the shared contract in
# handbook/operations/vendoring/series-loop/README.md.

set -euo pipefail
# shellcheck source=series-lib.sh
. "$(dirname "$0")/series-lib.sh"
# shellcheck source=vendor-lib.sh
. "$(dirname "$0")/vendor-lib.sh"

usage='usage: series-advance.sh <series> [--chunk <n>] [--remote <name>] [--canonical <name>] [--dev-note <file>]
       series-advance.sh <series> --continue [--dev-note <file>]
       series-advance.sh <series> --abort'
argerr() { echo "$usage" >&2; exit 2; }
CONTINUE=
ABORT=
DEV_NOTE=
chunk=100
remote=${SERIES_REMOTE:-origin}
# No colon: an explicitly empty SERIES_CANONICAL means "do not mirror", while
# an unset one takes the default.
canonical=${SERIES_CANONICAL-upstream}
args=()
while [ $# -gt 0 ]; do
  case "$1" in
    --continue) CONTINUE=1; shift ;;
    --abort) ABORT=1; shift ;;
    --chunk) [ $# -ge 2 ] || argerr; chunk=$2; shift 2 ;;
    --remote) [ $# -ge 2 ] || argerr; remote=$2; shift 2 ;;
    --canonical) [ $# -ge 2 ] || argerr; canonical=$2; shift 2 ;;
    --dev-note) [ $# -ge 2 ] || argerr; DEV_NOTE=$2; shift 2 ;;
    -h | --help) echo "$usage"; exit 0 ;;
    -*) argerr ;;
    *) args+=("$1"); shift ;;
  esac
done
[ ${#args[@]} -eq 1 ] || argerr
S=${args[0]}
case "$chunk" in '' | *[!0-9]*) echo "Error: --chunk takes a number: $chunk" >&2; exit 2 ;; esac
if [ -n "$DEV_NOTE" ] && [ ! -s "$DEV_NOTE" ]; then
  echo "Error: --dev-note file is missing or empty: $DEV_NOTE" >&2
  exit 1
fi
rcc=${RCC_BRANCH:-rcc2}

# A stopped stage 5 lives here: the worktree it kept, the buffer commit whose
# replay stopped, its base twin, and which half stopped -- `pick` or `carry`.
# Per series, so one stopped series never blocks the firing's other ones.
STATE="$(git rev-parse --git-dir)/series-advance-${S//\//-}"

if [ -n "$ABORT" ]; then
  if [ -f "$STATE" ]; then
    read -r awt _ _ _ < "$STATE"
    [ -d "$awt" ] && git worktree remove --force "$awt"
    rm -f "$STATE"
    echo "$S: stopped replay discarded; no ref was written"
  else
    echo "$S: nothing to abort"
  fi
  exit 0
fi

# Every buffer commit stage 5 replays moves `Version:`, so the `ours-version`
# merge driver decides DESCRIPTION on each pick. The name -> command mapping
# lives in .git/config and cannot be committed, so a fresh clone has the
# attribute (.gitattributes) and not the driver, and the replay stops on a
# DESCRIPTION conflict indistinguishable from one a human has to resolve.
#
# Register it, then refuse if it is still missing. This script already knew how
# to register it -- below, in the replay branch -- and a refusal reached first
# made every firing run scripts/setup-git.sh by hand, because a firing runs in a
# fresh clone. Idempotent, and .git/config is shared with the worktree the
# replay uses. After the --abort branch, so a stopped replay can always be
# discarded.
if [ -x "$(dirname "$0")/setup-git.sh" ]; then
  VENDOR_REPO="$(git rev-parse --show-toplevel)" "$(dirname "$0")/setup-git.sh" >/dev/null
fi
git config --get merge.ours-version.driver >/dev/null ||
  { echo "Error: merge driver not registered, run scripts/setup-git.sh" >&2; exit 1; }

git fetch -q "$remote"
green="$remote/$S-green"; dev="$remote/$S-dev"; build="$remote/$S-build"; base="$remote/$S-build-base"
for r in "$green" "$dev" "$build" "$base"; do
  git rev-parse -q --verify "$r" >/dev/null || { echo "Error: missing ${r#"$remote"/}"; exit 1; }
done

# The first N lines, without closing the pipe on the writer. `head -n N` exits
# as soon as it has them, and the `git rev-list` feeding it dies of SIGPIPE --
# 141 through `pipefail`, which `set -e` turns into a silent abort of the whole
# stage. Only a buffer longer than the chunk ever reaches that, which is why it
# surfaced on main-fwd and on no other series.
first_n() { sed -n "1,${1}p"; }

state_of() {
  local rec
  # One record per commit, and only that; see scripts/rcc-lib.sh and the
  # identical helper in scripts/series-check.sh.
  rec=$(git show "$remote/$rcc:runs2.d/${1:0:2}/$1.ndjson" 2>/dev/null || true)
  [ -z "$rec" ] && { echo missing; return; }
  echo "$rec" | sed -nr 's/.*"status":[^}]*"state": *"([a-z]+)".*/\1/p' | head -n 1
}

# Does this commit vendor? The subject decides, never the path -- the same rule
# the rest of this loop reads state by, and the same predicate series-port.sh
# classifies with (series_is_vendor() in scripts/series-lib.sh, which also
# holds the base scan, series_vendored_sha(), and its bound).
vendors() { # <repo> <commit>
  series_is_vendor "$(git -C "$1" log -1 --format=%s "$2")"
}

# Is $1 a strictly greater version than $2? Component-wise and numeric, so a
# rise the invariant allows is not mistaken for a freeze: a bump in any
# component counts, and the components are compared as numbers rather than as
# text (`10` is above `9`). A non-numeric component makes the answer unknown,
# which is a refusal, not a pass.
version_gt() { # <a> <b>
  local -a x y
  case "$1" in '' | *[!0-9.]*) return 2 ;; esac
  case "$2" in '' | *[!0-9.]*) return 2 ;; esac
  IFS=. read -r -a x <<<"$1"
  IFS=. read -r -a y <<<"$2"
  local i
  for i in 0 1 2 3 4; do
    (( ${x[i]:-0} > ${y[i]:-0} )) && return 0
    (( ${x[i]:-0} < ${y[i]:-0} )) && return 1
  done
  return 1
}

# Raise DESCRIPTION's fifth component to one above the parent's, on a commit
# that vendors. Every vendor commit must be strictly above its parent
# (.claude/skills/series-loop/SKILL.md): gaps are fine, repeats are not, because
# r-universe installs by version and cannot tell a run of commits sharing one
# apart.
#
# The ours-version merge driver hands the pick our side of `Version:` whenever
# the two strands' `major.minor.patch` prefixes differ, which is what this
# repairs; where they agree, -build's own bump comes through and there is
# nothing to do.
restamp() { # <worktree> <buffer commit>
  local wt=$1 c=$2 parent cur new
  vendors . "$c" || return 0
  parent=$(git -C "$wt" show 'HEAD~1:DESCRIPTION' | sed -n 's/^Version: //p')
  cur=$(git -C "$wt" show 'HEAD:DESCRIPTION' | sed -n 's/^Version: //p')
  version_gt "$cur" "$parent" && return 0
  # The counter is the fifth component, and only a dev branch carries one; a
  # four-component version is a strand with no counter to raise, and inventing
  # one here would mint a version the series never chose.
  case "$parent" in
    *.*.*.*.*) ;;
    *) return 0 ;;
  esac
  new="${parent%.*}.$((${parent##*.} + 1))"
  # `-i.bak`, so the one edit works under both GNU and BSD sed.
  sed -i.bak "s/^Version: .*/Version: $new/" "$wt/DESCRIPTION"
  rm -f "$wt/DESCRIPTION.bak"
  git -C "$wt" add DESCRIPTION
  git -C "$wt" commit -q --amend --no-edit
}

# --- the base series' test-side fixes ----------------------------------------
#
# Only a forward series has a base to mine: `<S>-fwd` reads `<S>-dev`. A base
# series' own `-dev` is the thing being built, and after a cutover the ref is
# gone -- both answer empty here, and the stage then behaves exactly as it did
# before this existed.
base_dev=
case "$S" in
  *-fwd)
    if git rev-parse -q --verify "$remote/${S%-fwd}-dev" >/dev/null; then
      base_dev="$remote/${S%-fwd}-dev"
    fi
    ;;
esac

# Equivalence is by vendored upstream SHA, the key the rest of the loop reads
# state by, and by the `(tag ...)` marker beside it: a late tag is re-stamped by
# a second vendor commit for the same SHA
# (.claude/skills/series-loop/references/1-vendor.md), and the carry
# takes the twin's message, so a re-stamp twinned with the plain commit would
# lose its marker (series_twin_key() in scripts/series-lib.sh). One walk,
# because the alternative is a walk per buffer commit.
declare -A TWIN=()
index_twins() {
  [ -n "$base_dev" ] || return 0
  local c subj key
  while IFS=$'\t' read -r c subj; do
    series_is_vendor "$subj" || continue
    key=$(series_twin_key "$subj")
    [ -n "$key" ] || continue
    # Oldest wins: a key appears once on a healthy series, and where a repair
    # left two, the first is the one the chain was verified on.
    [ -n "${TWIN[$key]:-}" ] || TWIN[$key]=$c
  done < <(git log --reverse --format='%H%x09%s' "$base_dev" --not "$green")
  # Bounded by this series' green, whose ancestry is `main`'s history: a base
  # series rewound to an older fork point vendors SHAs `main` vendored long
  # ago, and oldest-wins would otherwise pick `main`'s commit over the series'.
}

twin_of() { # <buffer commit> -> the base -dev commit for the same upstream SHA
  local key
  key=$(series_twin_key "$(git log -1 --format=%s "$1")")
  [ -n "$key" ] || return 0
  echo "${TWIN[$key]:-}"
}

# What the twin folded in beyond vendoring: the paths its own diff touches,
# less the two kinds that are not a fix, and less those the buffer already ends
# up with byte for byte.
#
# The difference is the load-bearing part, and it is what lets `src/` through.
# The gate compiles the glue at every buffer commit, so whatever the buffer
# holds there is already enough to build; anything the `-dev` twin has *on top*
# of it in `src/` was demanded by something later than the compiler -- a test,
# a check, a platform r-universe reached and the gate did not. Those are
# legitimate and they carry. Comparing the resulting blobs is also what stops
# the glue the buffer already has from being applied twice.
#
# **The difference is by content, never by filename.** Excluding every path the
# buffer commit happened to touch drops the twin's further work in that same
# file, and drops it silently: the vendor gate only syntax-checks the glue, so a
# declaration carried without its definition compiles and then fails to link.
# That is duckdb/duckdb-r#2657 -- `84370b8a3` on `main-fwd-dev` took the twin's
# `src/include/rapi.hpp`, `src/connection.cpp` and `src/register.cpp` but not
# its `src/statement.cpp`, because the buffer commit had moved three call sites
# in that file, and the install failed with
# `undefined symbol: duckdb::RCallbackScope::~RCallbackScope()`.
#
# Two kinds are excluded, and neither is a judgement about the fix:
#
#   * the buffer's own strand -- the vendored tree and the patch stack. A
#     forward regenerates `src/vendor/` from its own `patch/`, so a difference
#     there is about which patches the two branches had, not about a fix
#     travelling. Missing compile fixes belong on the buffer, mirrored there.
#   * what vendoring regenerates -- `R/aaa-*.R`, `src/rinterface.c`,
#     `src/cpp11.cpp`, `R/cpp11.R`, the `src/sources-*.mk` lists, and the
#     version in `DESCRIPTION`. Those differ between any two vendor runs of the
#     same upstream SHA, which is noise wearing the shape of a fix; a fix to
#     the interface lives in `tools/stimulus/`, which carries.
#
# Tooling is stage 4's, ported from `main` rather than carried sideways.
#
# **A buffer replayed from the base `-dev` already holds its twin's fix.**
# scripts/series-forward-build.sh replays `<S>-dev`'s vendor commits, fixes
# folded in, onto a seed `main` has moved under, so the buffer's blob differs
# from the twin's wherever `main`'s drift touched the same file and the blob test
# cannot see that the fix is in it. The twin's own change to the path
# reverse-applying to the buffer commit's tree can: such a path is carried
# already, and is left out. What this stage still carries is above the point
# the base `-dev` had reached when the forward was built, where the buffer came
# from `-build`, and whatever the base folded since.
carry_paths() { # <buffer commit> <base -dev commit>
  local c=$1 d=$2 f idx
  idx=$(mktemp)
  GIT_INDEX_FILE=$idx git read-tree "$c"
  git show --format= --name-only --no-renames "$d" | sort -u | series_carry_filter |
    while IFS= read -r f; do
      # Same blob on both sides: the buffer already carries exactly this, and
      # re-applying it is the double application the difference exists to avoid.
      if [ "$(git rev-parse --quiet --verify "$c:$f" 2>/dev/null)" \
           = "$(git rev-parse --quiet --verify "$d:$f" 2>/dev/null)" ]; then
        continue
      fi
      # The twin's change already in the buffer's tree, under a blob `main`
      # moved on: the same double application, seen through the diff.
      if git diff --binary "$d^" "$d" -- "$f" |
        GIT_INDEX_FILE=$idx git apply --cached --reverse --check - 2>/dev/null; then
        continue
      fi
      printf '%s\n' "$f"
    done
  rm -f "$idx"
}

# Glue the base `-dev` has and the base `-build` lacks *entirely* -- a fix
# folded during a repair and never mirrored onto the buffer, so the next tree
# regenerated there still wants it (.claude/skills/series-loop/SKILL.md, stage 2).
# Carried like the rest, but said out loud, because it is buffer drift.
#
# Deliberately the filename test rather than carry_paths': a file the buffer
# also touched is one the buffer knows about, so the twin's further work in it
# is an ordinary carry, not drift the buffer is missing.
glue_paths() { # <buffer commit> <base -dev commit>
  comm -13 \
    <(git show --format= --name-only --no-renames "$1" | sort -u) \
    <(git show --format= --name-only --no-renames "$2" | sort -u) |
    series_carry_filter | grep -E '^src/' || true
}

# Check the counter rather than assume it: a replay that silently froze it
# looks exactly like one that did not. Returns non-zero and leaves the caller
# to clean up, so the worktree is removed on this path like every other.
verify_counter() { # <worktree> <ref the replay started from>
  local wt=$1 from=$2 sha parent cur rc=0
  while IFS= read -r sha; do
    vendors "$wt" "$sha" || continue
    parent=$(git -C "$wt" show "$sha~1:DESCRIPTION" | sed -n 's/^Version: //p')
    cur=$(git -C "$wt" show "$sha:DESCRIPTION" | sed -n 's/^Version: //p')
    version_gt "$cur" "$parent" && continue
    echo "Error: $(git -C "$wt" rev-parse --short "$sha") vendors at $cur," \
      "its parent is $parent — the version counter did not advance"
    rc=1
  done < <(git -C "$wt" rev-list --reverse "$from..HEAD")
  return "$rc"
}

# --- stage 3: the all-green prefix -------------------------------------------
#
# A failure ends the walk the way a missing verdict does, and the prefix below
# it still counts. Every commit under the red one was decided by a run of its
# own, a repair replays only the tail above it, and green is the ref r-universe
# installs -- so refusing the whole stage left verified commits unpublished for
# as long as the repair took, which is the one cost the frontier exists to
# avoid. The red is still fatal, one stage later: green and `-build-base` are
# set first, then the firing stops before stage 5 extends `-dev` onto a tip a
# repair is about to re-mint (.claude/skills/series-loop/SKILL.md, stages 3 and 5).
new_green=$(git rev-parse "$green")
failed='' failed_state=''
while IFS= read -r sha; do
  st=$(state_of "$sha")
  case "$st" in
    success) new_green="$sha" ;;
    missing|pending) break ;;
    *) failed=$sha failed_state=$st; break ;;
  esac
done < <(git rev-list --reverse "$green..$dev")

if [ "$new_green" != "$(git rev-parse "$green")" ]; then
  git merge-base --is-ancestor "$(git rev-parse "$green")" "$new_green" ||
    { echo "Error: green would not fast-forward — verified history was rewritten"; exit 1; }
  git push "$remote" "$new_green:refs/heads/$S-green"
  echo "green -> $(git rev-parse --short "$new_green")"
  green_moved=1

  up=$(series_vendored_sha "$new_green")
  if [ -n "$up" ]; then
    eq=$(series_build_equivalent "$build" "$new_green" "$up")
    if [ -n "$eq" ]; then
      # Set, never advance. -build-base is the one ref of the four that is not
      # fast-forward only: nothing consumes it, and the match is recomputed
      # here from scratch every time, so where the ref sat before says nothing
      # this stage needs (.claude/skills/series-loop/SKILL.md, stage 3). Force,
      # because a write from outside this loop -- a CI job committing onto the
      # branch it ran on -- can leave the ref past the match or beside the
      # buffer, and refusing that stopped stage 5 with it.
      if [ "$(git rev-parse "$base")" != "$eq" ]; then
        git push --force "$remote" "$eq:refs/heads/$S-build-base"
        echo "build-base -> $(git rev-parse --short "$eq")"
      fi
    fi
  fi
else
  echo "green unchanged at $(git rev-parse --short "$green")"
fi

# The canonical repository publishes the base flavors, so its copy of green has
# to move too. No `+` and no lease: a plain push is fast-forward only, and a
# refusal here means the two repositories disagree about verified history, which
# is a thing to look at rather than to overwrite.
#
# It runs whether or not green moved this firing, because the two copies can
# disagree for reasons this firing had no part in: a green promoted before the
# mirroring existed, a firing that ran without `--canonical`, a push that
# failed. Gating it on the move left `v1.4-andium-green` a commit behind in the
# canonical repository for as long as that series stayed idle -- and r-universe
# builds the canonical copy, so what it published was a commit behind with it.
# An already-equal push is a no-op that says so, which is the cheapest possible
# way to keep asking the question.
#
# A base green travels as a plain push, fast-forward only. A forward's green is
# a WIP ref that a rebase resets to a new seed (.claude/skills/series-rebase/SKILL.md),
# and nothing publishes its copy, so that copy follows under a lease on what the
# canonical repository held when this run read it: never silently over a green
# somebody else wrote, and never a reason to stop the firing.
mirror_green() {
  local cur
  case "$S" in
    *-fwd)
      cur=$(git ls-remote "$canonical" "refs/heads/$S-green" | cut -f1)
      git push "--force-with-lease=refs/heads/$S-green:$cur" "$canonical" "$new_green:refs/heads/$S-green"
      ;;
    *) git push "$canonical" "$new_green:refs/heads/$S-green" ;;
  esac
}
if [ -n "$canonical" ]; then
  if ! git remote get-url "$canonical" >/dev/null 2>&1; then
    # Fatal only when this firing promoted something: then the missing remote
    # is a verified commit stranded in the fork. With green where it was there
    # is nothing to strand, and nothing to compare it against either.
    if [ -n "${green_moved:-}" ]; then
      echo "Error: no remote '$canonical' to mirror $S-green into." >&2
      echo "  The canonical repository is where r-universe publishes the base" >&2
      echo "  flavors from, so a green that stays in the fork is a package that" >&2
      echo "  keeps being published as the fork owner's. Name the remote" >&2
      echo "  'upstream', or pass --canonical <name>; SERIES_CANONICAL='' turns" >&2
      echo "  the mirroring off deliberately." >&2
      exit 1
    fi
  elif mirror_green; then
    echo "green mirrored to $canonical"
  else
    echo "Error: $S-green would not fast-forward in $canonical." >&2
    echo "  The fork and the canonical repository disagree about verified" >&2
    echo "  history. Only a cutover moves green off its lineage, and it" >&2
    echo "  mirrors that itself -- so this is a divergence to read, not to" >&2
    echo "  force. r-universe is serving the canonical copy meanwhile." >&2
    exit 1
  fi
fi

# A red commit in flight stops the firing here, with the frontier already moved.
# Stage 2 is going to fold a fix into it and replay everything above, so anything
# stage 5 appended now would be minted only to be re-minted.
if [ -n "$failed" ]; then
  echo "Error: $failed is '$failed_state' — repair before extending -dev" >&2
  exit 1
fi

# --- stage 5: extend -dev from the buffer ------------------------------------

# Finish a stopped replay before anything else, and refuse to start a second one
# beside it: the kept worktree holds a resolution someone made, and a fresh run
# would replay the same commits over the top of it and lose that work.
if [ -f "$STATE" ] && [ -z "$CONTINUE" ]; then
  read -r swt scommit _ _ < "$STATE"
  echo "Error: $S has a stopped replay at $(git rev-parse --short "$scommit")" >&2
  echo "  worktree: $swt" >&2
  echo "  Resolve it and rerun with --continue, or discard it with --abort." >&2
  exit 1
fi
if [ -n "$CONTINUE" ] && [ ! -f "$STATE" ]; then
  echo "Error: $S has no stopped replay to continue" >&2
  exit 1
fi

# A live forward counterpart is not a reason to stop consuming, and this stage
# used to treat it as one. The series being replaced kept its refs and stopped
# moving, which cost twice:
#
#   * **The cutover became unverifiable.** A forward is the same series rebuilt
#     on a newer `main`, so the thing that says it is safe to swap is that the
#     two `-dev` branches carry the same package -- identical, or different only
#     where the forwarding explains it (scripts/series-converge.sh). A base
#     frozen where the forward went live can only be compared at the commit it
#     stopped on, which is the one point the two are known to agree. Every
#     commit the forward vendored afterwards had nothing to be checked against.
#   * **It starved the carry below.** Stage 5 folds the base `-dev`'s test-side
#     fixes into the forward as each buffer commit is consumed, matched by
#     vendored SHA. Past the base's frontier there is no twin to match, so every
#     fix the base had already proved was rediscovered as a red -- a repair plus
#     a replay of everything above it -- or reached the forward by hand out of
#     `-build`, which is what `main-fwd-dev` shows above `main-dev`'s frontier.
#
# So a base series consumes its buffer like any other, and the two lineages run
# level until a human swaps them. It is more CI on a series about to be retired;
# it is also the only thing that makes retiring it a check rather than a hope.
# Pending work does not hold the buffer (.claude/skills/series-loop/SKILL.md stage 5):
# each.yaml plans every commit in green..tip that has no record, so a longer tip
# is more work planned in the same pass, not work deferred. A known failure does
# hold it: stage 2 will fold a fix into that commit and replay everything above,
# so anything appended now is minted only to be re-minted. The stage-3 walk above
# stops at the first commit without a verdict, so it sees a failure only when no
# pending commit precedes it -- scan the whole range here.
red=
while IFS= read -r sha; do
  case "$(state_of "$sha")" in
    success | missing | pending) ;;
    *) red=$sha; break ;;
  esac
done < <(git rev-list --reverse "$new_green..$dev")
if [ -n "$red" ]; then
  echo "$(git rev-parse --short "$red") has failed — repair before extending"
  exit 0
fi

# The consumption anchor on -build: -dev's own tip while it sits on -build's
# line, otherwise the -build commit equivalent to -dev's newest vendor commit.
# Read from the newest vendor commit rather than the tip, because -dev also
# carries commits that vendor nothing — tooling cherry-picked from main, and the
# test/R adaptations folded in during repair. Searched over all of -build, since
# the newest vendor commit may sit at or before the divergence point.
mb=$(git merge-base "$dev" "$build")
if [ "$mb" = "$(git rev-parse "$dev")" ]; then
  anchor=$mb
else
  dev_up=$(series_vendored_sha "$dev")
  [ -n "$dev_up" ] ||
    { echo "Error: no vendor commit in -dev's history — reconcile by hand"; exit 1; }
  anchor=$(series_build_equivalent "$build" "$dev" "$dev_up")
  [ -n "$anchor" ] ||
    { echo "Error: no -build commit vendors $series_upstream_repo@$dev_up — mirror the fold in -build first"; exit 1; }
  # `series_vendored_sha` walks past commits that vendor nothing, and on a -dev that has
  # none of its own it walks past the seed too — answering with what the branch
  # the seed was cut from had vendored. That is every series on its first firing
  # once stage 4 has ported: -dev is the seed plus tooling picks, so the fast
  # path above no longer applies and this one reaches below the divergence.
  # The buffer starts at the merge base whatever -dev's newest vendor commit is.
  if git merge-base --is-ancestor "$anchor" "$mb"; then
    anchor=$mb
  fi
fi
ahead=$(git rev-list --count "$anchor..$build")
if [ "$ahead" -eq 0 ]; then
  echo "buffer empty — vendor"
  exit 0
fi
n=$((ahead < chunk ? ahead : chunk))

# What -dev is at before this stage writes anything, so the closing line can
# report what the stage actually added rather than what it set out to add. The
# replay drops a buffer commit whose content reached -dev by another route
# (`--empty=drop` below), so the two differ, and `git push` moves the
# remote-tracking ref this resolves -- read it once, here.
dev_before=$(git rev-parse "$dev")

# Which commits in this chunk have a test-side fix waiting on the base series.
# Computed before anything is written, because it decides the route: a plain ref
# move cannot carry content, so one carry in the chunk makes the whole chunk a
# replay.
index_twins
declare -A CARRY=()
carries=0
glue_drift=()
if [ -n "$base_dev" ]; then
  for c in $(git rev-list --reverse "$anchor..$build" | first_n "$n"); do
    d=$(twin_of "$c")
    [ -n "$d" ] || continue
    [ -n "$(carry_paths "$c" "$d")" ] || continue
    CARRY[$c]=$d
    carries=$((carries + 1))
    g=$(glue_paths "$c" "$d" | tr '\n' ' ')
    [ -z "$g" ] || glue_drift+=("$(git rev-parse --short "$d") $g")
  done
  [ "$carries" -eq 0 ] ||
    echo "$carries of $n buffered commit(s) carry a fix from $base_dev"
  # Said rather than filtered: the glue travels, and the buffer it is missing
  # from is a separate repair for whoever reads this.
  if [ ${#glue_drift[@]} -gt 0 ]; then
    echo "  ${#glue_drift[@]} of them carry glue the base buffer does not have;" \
      "mirror it onto ${S%-fwd}-build:"
    printf '    %s\n' "${glue_drift[@]}"
  fi
fi

# A note takes the replay route: the fast path pushes the buffer's own commits
# unchanged, so there is nothing of this stage's making to write the finding on.
if [ "$anchor" = "$(git rev-parse "$dev")" ] && [ "$carries" -eq 0 ] &&
   [ -z "$CONTINUE" ] && [ -z "$DEV_NOTE" ]; then
  next=$(git rev-list --reverse "$anchor..$build" | sed -n "${n}p")
  git push "$remote" "$next:refs/heads/$S-dev"
else
  # Replay onto the repaired tip in a throwaway worktree; a conflict means the
  # repair and the buffer touch the same paths — judgement, not mechanics.
  #
  # Every buffer commit bumps DESCRIPTION's vendor counter, so a -dev that has
  # taken a fledge bump conflicts on the `Version:` line at the first replayed
  # commit and at every one after it. That line is what the ours-version merge
  # driver exists for, and the gate at the top of this script has registered it
  # already, so only genuine conflicts reach the judgement above.

  # Where the run stops, and how it says so. The worktree is kept: it holds the
  # conflict, and whoever resolves it needs somewhere to do that. Nothing has
  # been pushed at this point, so a stop costs a rerun and no ref motion.
  stop() { # <worktree> <buffer commit> <twin or -> <pick|carry>
    printf '%s %s %s %s\n' "$1" "$2" "$3" "$4" > "$STATE"
    echo >&2
    if [ "$4" = carry ]; then
      echo "Error: $S — carrying the test-side fix from $(git rev-parse --short "$3") into" >&2
      echo "  $(git rev-parse --short "$2") conflicted: $(git log -1 --format=%s "$2")" >&2
      echo >&2
      echo "The buffer commit is picked and staged; what stopped is the fix the base" >&2
      echo "series folded in for this same upstream commit. Resolve toward this" >&2
      echo "series' own R side -- and read the whole set before deciding, because" >&2
      echo "upstream moves the same file repeatedly and only the last version of it" >&2
      echo "survives the range:" >&2
      echo >&2
      echo "  scripts/series-glue.sh $base_dev" >&2
    else
      echo "Error: $S — replaying $(git rev-parse --short "$2") conflicted:" >&2
      echo "  $(git log -1 --format=%s "$2")" >&2
    fi
    echo >&2
    git -C "$1" diff --name-only --diff-filter=U | sed 's/^/  /' >&2
    echo >&2
    echo "  cd $1" >&2
    echo "  # resolve, then: git add <paths>" >&2
    echo "  scripts/series-advance.sh $S --continue      # or --abort to discard" >&2
    echo >&2
    echo "No ref was written." >&2
    exit 1
  }

  # A carry that applies cleanly can still break the glue. The three-way merge
  # sees the twin's hunk and the buffer's own adaptation of the same upstream
  # change as two unrelated additions when their context differs, and keeps
  # both: `v2.0-cyanoptera-fwd-dev` got a second `TIMESTAMP_TZ_NS` case in
  # `src/transform.cpp`, and `install` failed on a duplicate `case` label. So a
  # carry into the glue is syntax-checked the way vendor-one.sh checks a vendor
  # commit (glue_compiles() in scripts/vendor-lib.sh), and a failure stops the
  # run like a conflict, with the carry staged. A check that cannot run (no
  # `./configure`, no R) warns and carries on.
  carry_glue_gate() { # <worktree> <buffer commit> <twin>
    local wt=$1 st=0 failures bad
    failures=$(mktemp)
    (cd "$wt" && glue_compiles "$failures") || st=$?
    git -C "$wt" clean -fdxq -- src/
    bad=$(tr '\n' ' ' < "$failures")
    rm -f "$failures"
    case "$st" in
      0) return 0 ;;
      2)
        echo "Warning: could not derive the glue compile flags in $wt; carry not checked" >&2
        return 0
        ;;
    esac
    echo >&2
    echo "The carry applied without a conflict, but the glue no longer compiles: $bad" >&2
    echo "Look for the twin's hunk duplicating an adaptation the buffer already has." >&2
    stop "$wt" "$2" "$3" carry
  }

  # Fold the base series' test-side fix into the commit that needs it -- never
  # stacked above it, so every commit of -dev stays independently green and the
  # chain stays bisectable. Three-way, so the failure mode is a conflict in the
  # tree rather than a silent miss.
  #
  # The message comes from the twin: by the commit-message contract that is this
  # commit's own vendor message extended with what was adapted, so taking it
  # keeps the prose with the change it explains.
  apply_carry() { # <worktree> <buffer commit> <twin>
    local wt=$1 c=$2 d=$3 paths patch tpaths=() kept=() p out st=0
    mapfile -t paths < <(carry_paths "$c" "$d")
    [ ${#paths[@]} -gt 0 ] || return 0
    patch=$wt/.series-advance-carry.patch
    git diff "$d^" "$d" -- "${paths[@]}" > "$patch"
    if [ ! -s "$patch" ]; then rm -f "$patch"; return 0; fi
    if ! git -C "$wt" apply --3way --index "$patch"; then
      rm -f "$patch"
      stop "$wt" "$c" "$d" carry
    fi
    rm -f "$patch"
    # A carry never takes a test away (handbook/operations/vendoring/series-loop/).
    # The twin may have deleted a test file or a `test_that()` block, or skipped
    # one for good, because its engine at a rewind asked for that; the loss
    # travels with its vendor commit, and the base's later restore, a commit of
    # its own, does not. So a path under `tests/` whose carry would stop a test
    # this commit runs keeps what this commit has, an engine gate being the one
    # skip that carries, and CI judges the commit: a red there is gated in stage 2.
    mapfile -t tpaths < <(printf '%s\n' "${paths[@]}" | grep '^tests/' || true)
    if [ ${#tpaths[@]} -gt 0 ]; then
      out=$("$(dirname "$0")/series-tests.sh" "$(git -C "$wt" rev-parse HEAD)" \
        "$(git -C "$wt" write-tree)" --porcelain -- "${tpaths[@]}") || st=$?
      if [ "$st" -gt 1 ]; then
        echo "Error: $S: could not read what the carry does to the tests" >&2
        stop "$wt" "$c" "$d" carry
      fi
      mapfile -t kept < <(awk -F'\t' '$1 ~ /^(deleted|block|snapshot|skip)$/ { print $2 }' <<<"$out" | sort -u)
      for p in ${kept+"${kept[@]}"}; do
        git -C "$wt" checkout -q HEAD -- "$p"
        echo "  kept $p as $(git -C "$wt" rev-parse --short HEAD) has it: the carry from" \
          "$(git rev-parse --short "$d") would stop a test there"
      done
    fi
    if printf '%s\n' "${paths[@]}" | grep -qE '^src/'; then
      carry_glue_gate "$wt" "$c" "$d"
    fi
    {
      git log -1 --format=%B "$d"
      echo "Carried from \`$base_dev\` at $(git rev-parse --short "$d"):"
      echo "the test-side fix folded there for this same upstream commit,"
      echo "so the forward starts from what the base series proved."
      if [ ${#kept[@]} -gt 0 ]; then
        echo "Not carried, because it would stop a test this series runs:"
        for p in "${kept[@]}"; do echo "\`$p\`"; done
      fi
    } > "$wt/.series-advance-msg"
    git -C "$wt" commit -q --amend --no-verify \
      --author="$(git log -1 --format='%an <%ae>' "$d")" -F "$wt/.series-advance-msg"
    rm -f "$wt/.series-advance-msg"
  }

  if [ -n "$CONTINUE" ]; then
    read -r wt rc rd rstage < "$STATE"
    [ -d "$wt" ] || { echo "Error: the kept worktree $wt is gone — rerun with --abort" >&2; exit 1; }
    [ -z "$(git -C "$wt" diff --name-only --diff-filter=U)" ] ||
      stop "$wt" "$rc" "$rd" "$rstage"
    echo "$S: resuming at $(git rev-parse --short "$rc")"
    if [ "$rstage" = carry ]; then
      # The resolved tree holds the carry; finish it as one commit with the
      # twin's message, exactly as an unconflicted carry ends.
      {
        git log -1 --format=%B "$rd"
        echo "Carried from \`$base_dev\` at $(git rev-parse --short "$rd"):"
        echo "the test-side fix folded there for this same upstream commit,"
        echo "so the forward starts from what the base series proved."
      } > "$wt/.series-advance-msg"
      git -C "$wt" commit -q --amend --no-verify \
        --author="$(git log -1 --format='%an <%ae>' "$rd")" -F "$wt/.series-advance-msg"
      rm -f "$wt/.series-advance-msg"
    else
      # A resolution that comes out empty is the conflicting twin of the
      # `--empty=drop` case below: the buffer commit's content reached -dev by
      # another route, so the resolved tree is the one -dev already has and git
      # refuses to commit nothing. Drop it, exactly as the unconflicted case
      # does. Letting `cherry-pick --continue` fail here left the stage with no
      # way forward at all -- the operator's own `--skip` then met `no
      # cherry-pick or revert in progress` on the next `--continue`, which is
      # why the sequencer is only driven when one is actually in progress.
      resumed_at=$(git -C "$wt" rev-parse HEAD)
      if git -C "$wt" rev-parse -q --verify CHERRY_PICK_HEAD >/dev/null; then
        git -C "$wt" -c core.editor=true cherry-pick --continue ||
          git -C "$wt" cherry-pick --skip
      fi
      # A dropped pick minted nothing, so there is no version to restamp and no
      # carry to fold in; `remaining` below excludes the resumed commit either
      # way.
      if [ "$(git -C "$wt" rev-parse HEAD)" != "$resumed_at" ]; then
        restamp "$wt" "$rc"
        [ -n "${CARRY[$rc]:-}" ] && apply_carry "$wt" "$rc" "${CARRY[$rc]}"
      fi
    fi
    rm -f "$STATE"
    # The rest of the same chunk, not a fresh one: nothing was pushed, so the
    # anchor is where it was, and the resumed commit is somewhere inside the
    # list this run already computed. Take what follows it.
    remaining=$(git rev-list --reverse "$anchor..$build" | first_n "$n" |
                  awk -v c="$rc" 'seen { print } $0 == c { seen = 1 }')
  else
    wt=$(mktemp -d)
    git worktree add --detach -q "$wt" "$dev"
    remaining=$(git rev-list --reverse "$anchor..$build" | first_n "$n")
  fi

  # `--empty=drop`, as series-port.sh already does: a buffer commit whose content
  # reached -dev by another route replays to nothing, and an empty pick stops the
  # sequencer. Stage 3 sends patch/ entries down both paths on purpose -- the port
  # carries one onto -dev, and the same fix is committed onto -build so the next
  # regenerated tree still has it -- so the redundancy is designed, not a mistake,
  # and it must not abort the extend.
  #
  # One commit at a time, because restamp runs between the picks and reads the
  # parent it is bumping from, and because a carry amends the commit just made.
  #
  # A buffer tooling sync is skipped, never picked. `-dev`'s tooling is stage
  # 4's, which made it `main`'s earlier in this same firing, while the sync's
  # diff runs from whatever tooling the buffer carried before it -- so once
  # `main` has moved again, the pick conflicts, or quietly puts back on `-dev`
  # what `main` removed. And since the sync vendors nothing, the anchor never
  # passes it: one at the buffer's tail is offered again on every firing until
  # a vendor commit lands above it. scripts/series-port.sh writes it under
  # exactly this subject, and scripts/series-check.sh discounts it the same way.
  for c in $remaining; do
    if [ "$(git log -1 --format=%s "$c")" = "chore(series): Sync buffer tooling with main" ]; then
      continue
    fi
    before=$(git -C "$wt" rev-parse HEAD)
    if ! git -C "$wt" cherry-pick --empty=drop "$c"; then
      stop "$wt" "$c" "${CARRY[$c]:--}" pick
    fi
    [ "$(git -C "$wt" rev-parse HEAD)" = "$before" ] && continue
    restamp "$wt" "$c"
    [ -n "${CARRY[$c]:-}" ] && apply_carry "$wt" "$c" "${CARRY[$c]}"
  done
  # The stage-3 finding, onto the newest commit this chunk minted. Appended
  # rather than folded in anywhere else: the commit already carries the vendor
  # message the finding is about, and the readers of these findings --
  # series-glue.sh, and stage 2's mining step -- read exactly this message.
  #
  # Those readers anchor on an `R-side fix` section, so a note that opens with
  # prose is a finding nothing ever reads back. The header is the one part of
  # the note that is the same every time, so the stage writes it when the note
  # does not, and leaves whichever spelling the note chose alone when it does.
  # The spelling written here is the colon one. series-glue.sh reads the
  # section by its opening words under any spelling or case, the same test as
  # the one below, so a header the note brought reads back as well as this one.
  if [ -n "$DEV_NOTE" ]; then
    if [ "$(git -C "$wt" rev-parse HEAD)" = "$(git rev-parse "$dev")" ]; then
      git worktree remove --force "$wt"
      echo "Error: $S — the chunk minted nothing, so --dev-note has no commit" >&2
      echo "  to write the finding on. Record it on the next chunk instead." >&2
      exit 1
    fi
    note_head=
    if ! sed -n '/[^[:space:]]/{p;q;}' "$DEV_NOTE" | grep -qi '^R-side fix'; then
      note_head=$'R-side fix:\n\n'
    fi
    { git -C "$wt" log -1 --format=%B; echo; printf '%s' "$note_head";
      cat "$DEV_NOTE"; } > "$wt/.series-advance-note"
    git -C "$wt" commit -q --amend --no-verify -F "$wt/.series-advance-note"
    rm -f "$wt/.series-advance-note"
  fi

  next=$(git -C "$wt" rev-parse HEAD)
  if ! verify_counter "$wt" "$dev"; then
    git worktree remove --force "$wt"
    exit 1
  fi
  git worktree remove --force "$wt"
  rm -f "$STATE"
  git push "$remote" "$next:refs/heads/$S-dev"
fi
echo "dev -> $(git rev-parse --short "$next") (+$(git rev-list --count "$dev_before..$next"))"
