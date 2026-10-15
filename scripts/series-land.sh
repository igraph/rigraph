#!/bin/bash
# Land a series on `main`: build `<L>-land-dev`, every vendor commit of the
# series replayed without its flavor onto the `main` it will fast-forward
# (.claude/skills/series-land/SKILL.md).
#
# A line moves onto `main` when `main` starts releasing it. The series already
# holds the history `main` needs (one commit per upstream commit, each judged
# by CI with the R-side fix it needed folded in), but on a lineage of its own:
# its seed is an older `main`, everything `main` gained since arrived as ports,
# and the package carries a flavor. None of that may reach `main`, which only
# ever fast-forwards, so the landing is a forward onto `main` itself, with three
# differences from series-forward:
#
#   * the source is the series' rc strand, `<S>-rc-dev`, the package without its
#     flavor commit for commit (.claude/skills/series-rc/SKILL.md), so nothing
#     is renamed on the way and every commit replayed was already judged under
#     the name `main` ships;
#   * the source is `-dev`, not `-build`, because `main` needs the test-side
#     fixes the loop folded on `-dev`, which a buffer never carries;
#   * the base is `main` as it stands, never a seed: no flavor commits and no
#     version chore. Only `vendor:` commits are replayed, each stamped with the
#     prefix the series carries and a counter of its own
#     (series-forward-build.sh --prefix), so the commit `main` ends on carries
#     the version of the series commit it lands.
#
# The replay is scripts/series-forward-build.sh's: a rewind at the foot takes
# the vendored strand whole, a non-vendor commit `main` does not carry stops the
# run before anything is replayed, a conflict stops it with the tree kept, and
# the glue gate syntax-checks the glue where a pick could have broken it. The
# series' ports and tooling syncs are placed by the replay itself, by their
# `-x` trailer and their subject. Its test guard is off here: the landing holds
# the tests to the base with scripts/series-tests.sh below, and refuses with the
# series named, which a copy kept quietly in the replay would hide behind the
# tree check.
#
# **A conflict resolved once is resolved for every rebuild.** setup-git.sh turns
# rerere on, and a stop that rerere resolved completely is continued here rather
# than handed back. A resolution rerere replayed is named again if the landing
# then fails its tree check, because a wrong one is replayed as faithfully as a
# right one; `--attended` stops at every conflict with rerere's answer filled in
# and unstaged, where `git rerere forget <path>` drops it.
#
# **A resumed build follows the rc strand.** A series repaired or extended while
# the build waits is realigned (scripts/series-rc.sh) and taken from where the
# build stands: the replay skips upstream commits it has already landed and
# takes the rest, and the tree check compares against the strand as it is now.
#
# **The landing is checked against the series before it is pushed.** Its tip
# and the rc commit it was built up to must be the same package: the same tree,
# except where the landing takes `main`'s side by construction. That is
# `NEWS.md`, the release paperwork no port carries, and the three READMEs, which
# no port carries either (scripts/series-converge.sh has the evidence for both
# classes). `DESCRIPTION` agrees whole, version included, because the counter
# restarts on `main` exactly as it did on the series. A difference anywhere else
# is a commit `main` has that the series never ported, or a fix on one side
# only, and the commits CI would judge would not be the package the series
# proved. The push is refused until it is resolved. What the check cannot see is
# a file the series lost as well, so the files the landing deletes from `main`
# outside the vendored strand are listed beside it.
#
# **The tests are held to `main`'s, not to the series'.** A test the series
# stopped running is one the tree check passes, because the series lacks it
# too: `v2.0-cyanoptera-fwd` deleted `tests/testthat/test-variant.R` at its
# rewind and skipped four more for good (duckdb/duckdb-r#2899).
# scripts/series-tests.sh compares the landing's tests with its base's, the
# frozen `main` and any tests pinned above it, and the push is refused while one
# is lost: a deleted file, block or snapshot, a skip the base does not make, and
# an engine gate too, live or expired, which `main` never takes. What a test expects may differ, and every such path is
# listed with the commits that moved it, so a review reads the landing's test
# changes off one report rather than out of its commits.
#
# Committer dates are pinned to the base's, so a rebuild from the same inputs
# mints the same SHAs and CI does not judge a commit twice.
#
# **The base may sit above `main`.** `--base` names a commit `main` fast-forwards
# to, whose own commits land with the vendor commits: tests that pin what the
# line must keep, written on `main`'s engine and merged by the landing rather
# than before it. The landing is then `main`, those commits, and the vendor
# commits, in that order, and the tree check expects the series' package with
# the base's own change merged in.
#
# **`<L>-land-green` bounds the per-commit build.** It is pushed at `main`, so
# scripts/each-plan.sh scans `<L>-land-green..<L>-land-dev` as it scans any
# series, the base's own commits included, and `--status` advances it over the
# commits CI has passed, the way stage 3 advances a series' green
# (scripts/series-advance.sh). The landing is ready when the two refs are equal.
# There is no `-land-build`, so the loop's discovery never mistakes the pair for
# a series.
#
# **`--review` writes what a reviewer of `main` reads.** The landing's own diff
# is the engine's, hundreds of thousands of lines; what changes for `main`'s
# maintainers is everything else, the glue, R code and tests the series changed
# on the way. `<L>-land-review` is that alone: the landing's base, one commit
# that removes every workflow, and then, for each landing commit that changes
# anything outside the vendored strand, that change and nothing more, under the
# upstream commit that asked for it. It is written from the pushed
# `<L>-land-dev`, never from a kept build that may be stopped or unchecked.
# Without its engine the R side compiles against nothing, so a check there could
# only fail, and without workflow files a pull request starts nothing that
# builds or tests it. It goes to the canonical repository, where it is opened as
# a draft pull request against `main` and never merged: `main` takes the
# landing itself. It prints the test report the build gated on, for the pull
# request's description.
#
# Usage: series-land.sh <S> [--remote <name>] [--canonical <name>] [--push]
#                       [--base <ref>] [--placed <sha>]... [--no-check-glue] [--attended]
#        series-land.sh <S> --status [--remote <name>] [--canonical <name>] [--push]
#        series-land.sh <S> --review [--landing <ref>] [--suffix <s>] [--remote <name>]
#                       [--canonical <name>] [--push]
#        series-land.sh <S> --abort
#   <S> is the series whose rc strand lands, `v2.0-cyanoptera-fwd` for
#   `v2.0-cyanoptera-fwd-rc-dev`; the refs are named for its line,
#   `v2.0-cyanoptera-land-*`, on --remote. `main` is read from --canonical.
#   Nothing is written to a remote without --push. A stopped build resumes when
#   rerun, from the worktree it kept; --abort discards that worktree.
#   --review pushes `<L>-land-review<s>` to --canonical, from `<L>-land-dev` on
#   --remote or the landing --landing names: an iteration reviewed before the
#   series carries it, for example `--landing <L>-land-v2 --suffix -v2`.
#   --base defaults to `main`; a ref the clone lacks is fetched from --canonical.
#   --source names the ref the landing is built up to, on --remote, in place of
#   `<S>-rc-dev`: it is taken as it stands, with no realignment, for a series
#   that carries no flavor and so has no rc strand.
#   --placed and --no-check-glue are passed to series-forward-build.sh.
#
# --remote and --canonical are spelled the same in every scripts/series-*.sh;
# see the shared contract in handbook/operations/vendoring/series-loop/README.md.

set -euo pipefail
# A failure inside `$(...)` stops the run too, rather than reading as empty.
shopt -s inherit_errexit
# shellcheck source=series-lib.sh
. "$(dirname "$0")/series-lib.sh"

usage='usage: series-land.sh <S> [--remote <name>] [--canonical <name>] [--status | --review | --abort] [--push] [--base <ref>] [--source <ref>] [--landing <ref>] [--suffix <s>] [--placed <sha>]... [--no-check-glue] [--attended]'
argerr() { echo "$usage" >&2; exit 2; }

remote=${SERIES_REMOTE:-origin}
canonical=${SERIES_CANONICAL-upstream}
push='' status='' review='' abort='' attended='' base_arg='' source_arg='' landing_arg='' suffix=''
fwd_args=()
args=()
while [ $# -gt 0 ]; do
  case "$1" in
    --remote) [ $# -ge 2 ] || argerr; remote=$2; shift 2 ;;
    --canonical) [ $# -ge 2 ] || argerr; canonical=$2; shift 2 ;;
    --base) [ $# -ge 2 ] || argerr; base_arg=$2; shift 2 ;;
    --source) [ $# -ge 2 ] || argerr; source_arg=$2; shift 2 ;;
    --landing) [ $# -ge 2 ] || argerr; landing_arg=$2; shift 2 ;;
    --suffix) [ $# -ge 2 ] || argerr; suffix=$2; shift 2 ;;
    --placed) [ $# -ge 2 ] || argerr; fwd_args+=(--placed "$2"); shift 2 ;;
    --no-check-glue) fwd_args+=(--no-check-glue); shift ;;
    --attended) attended=1; shift ;;
    --push) push=1; shift ;;
    --status) status=1; shift ;;
    --review) review=1; shift ;;
    --abort) abort=1; shift ;;
    -h | --help) echo "$usage"; exit 0 ;;
    -*) argerr ;;
    *) args+=("$1"); shift ;;
  esac
done
[ ${#args[@]} -eq 1 ] || argerr
[ $((${status:-0} + ${review:-0} + ${abort:-0})) -le 1 ] || argerr
S=${args[0]}
case "$S" in
  *-rc | *-land) echo "Error: $S is a derived strand; name the series it comes from" >&2; exit 2 ;;
esac
L=${S%-fwd}
here=$(cd "$(dirname "$0")" && pwd)
# Pathspecs below are the repository's, wherever this was started from.
cd "$(git rev-parse --show-toplevel)"

# A stopped or finished build lives here: the worktree it kept, the `main` it
# stands on, the rc commit it builds up to, that strand's seed, the prefix, and
# the series it lands.
STATE="$(git rev-parse --git-dir)/series-land-$L"

if [ -n "$abort" ]; then
  if [ -f "$STATE" ]; then
    read -r awt _ < "$STATE"
    [ -d "$awt" ] && git worktree remove --force "$awt"
    git worktree prune
    rm -f "$STATE"
    echo "$L: the kept landing build is discarded; refs on $remote are untouched"
  else
    echo "$L: nothing to abort"
  fi
  exit 0
fi

# The landing stands on the canonical `main` and on nothing else: a mirror that
# has not caught up is an older `main`, and a landing built on it cannot
# fast-forward the real one.
if [ -z "$canonical" ] || ! git remote get-url "$canonical" >/dev/null 2>&1; then
  echo "Error: no canonical remote \"$canonical\" to read main from." >&2
  echo "  Add $series_canonical_repo as 'upstream', or pass --canonical <name>." >&2
  exit 1
fi
git fetch -q "$canonical" main
main=$(git rev-parse "refs/remotes/$canonical/main" 2>/dev/null || git rev-parse FETCH_HEAD)

dev_ref="refs/remotes/$remote/$L-land-dev"
green_ref="refs/remotes/$remote/$L-land-green"
# The strand the landing is built up to: the rc strand, realigned with `-dev`
# before the build (check_aligned), or the ref --source names, taken as it is.
src_name=${source_arg:-$S-rc-dev}
rc="refs/remotes/$remote/$src_name"
git fetch -q "$remote" "+refs/heads/$L-land-*:refs/remotes/$remote/$L-land-*"

# The vendored strand, as series-forward-build.sh takes it whole, with the
# Makevars generated from it.
strand=("${series_strand[@]}" "${series_makevars[@]}")
strand_excludes=()
for p in "${strand[@]}"; do strand_excludes+=(":(exclude)$p"); done

# Is <tip> a landing on main: main, then the base's own commits, then vendor
# commits only? A fix is folded into the commit that introduced the defect, so
# that every commit passes; nothing sits on top. Prints the first commit out of
# place.
out_of_place() { # <tip>
  local c subj seen=''
  while IFS=$'\t' read -r c subj; do
    # shellcheck disable=SC2254
    case "$subj" in
      vendor:* | $series_vendor_glob) seen=1 ;;
      *) [ -z "$seen" ] || { echo "$c $subj"; return; } ;;
    esac
  done < <(git log --reverse --first-parent --format='%h%x09%s' "$main..$1")
}

# --- --status: what CI has decided, and green over the passed prefix ----------

rcc=${RCC_BRANCH:-rcc2}

# One record per commit; the same helper as scripts/series-advance.sh and
# scripts/series-check.sh, reading the same store.
state_of() {
  local rec
  rec=$(git show "$remote/$rcc:runs2.d/${1:0:2}/$1.ndjson" 2>/dev/null || true)
  [ -z "$rec" ] && { echo missing; return; }
  echo "$rec" | sed -nr 's/.*"status":[^}]*"state": *"([a-z]+)".*/\1/p' | head -n 1
}

if [ -n "$status" ]; then
  for r in "$dev_ref" "$green_ref"; do
    git rev-parse -q --verify "$r" >/dev/null ||
      { echo "Error: ${r#refs/remotes/"$remote"/} does not exist on $remote" >&2; exit 1; }
  done
  git fetch -q "$remote" "+refs/heads/$rcc:refs/remotes/$remote/$rcc" 2>/dev/null || true
  green=$(git rev-parse "$green_ref")
  dev=$(git rev-parse "$dev_ref")
  git merge-base --is-ancestor "$green" "$dev" ||
    { echo "Error: $L-land-green is not an ancestor of $L-land-dev" >&2; exit 1; }
  new_green=$green
  stop='' stop_state=''
  while IFS= read -r sha; do
    st=$(state_of "$sha")
    case "$st" in
      success) new_green=$sha ;;
      *) stop=$sha stop_state=$st; break ;;
    esac
  done < <(git rev-list --reverse --first-parent "$green..$dev")
  total=$(git rev-list --count "$green..$dev")
  passed=$(git rev-list --count "$green..$new_green")
  echo "$L-land-dev: $passed of $total commits above $L-land-green passed"
  if [ -n "$stop" ]; then
    echo "  first not passed: $(git rev-parse --short "$stop") ($stop_state)" \
      "$(git log -1 --format=%s "$stop")"
  fi
  if [ "$new_green" != "$green" ]; then
    if [ -n "$push" ]; then
      # Fast-forward only, as every green: a plain push refuses anything else.
      git push -q "$remote" "$new_green:refs/heads/$L-land-green"
      echo "  $L-land-green -> $(git rev-parse --short "$new_green")"
    else
      echo "  $L-land-green would move to $(git rev-parse --short "$new_green"); --push moves it"
    fi
  fi
  if [ "$new_green" = "$dev" ]; then
    if git merge-base --is-ancestor "$main" "$dev" && [ -z "$(out_of_place "$dev")" ]; then
      echo "READY: every commit has passed, and main ($(git rev-parse --short "$main")) fast-forwards to it:"
      echo "  git push $canonical $(git rev-parse "$dev"):refs/heads/main"
    else
      echo "NOT READY: main ($(git rev-parse --short "$main")) is not the base of $L-land-dev;" \
        "it moved, so the landing has to be rebuilt on it"
      exit 1
    fi
  fi
  exit 0
fi

# --- --review: the landing without its engine, for a draft pull request ------

if [ -n "$review" ]; then
  rb="$L-land-review$suffix"
  if [ -n "$landing_arg" ]; then
    tip=$(git rev-parse -q --verify "$landing_arg^{commit}" ||
      { git fetch -q "$remote" "$landing_arg" && git rev-parse FETCH_HEAD; })
  else
    git rev-parse -q --verify "$dev_ref" >/dev/null ||
      { echo "Error: no $L-land-dev on $remote to review; build and --push it first" >&2; exit 1; }
    tip=$(git rev-parse "$dev_ref")
  fi
  base=$main
  if ! git merge-base --is-ancestor "$base" "$tip" || [ -n "$(out_of_place "$tip")" ]; then
    echo "Error: the landing $(git rev-parse --short "$tip") is not main $(git rev-parse --short "$base")," \
      "the base's own commits, and vendor commits" >&2
    exit 1
  fi
  if [ -f "$STATE" ]; then
    read -r kwt _ < "$STATE"
    if [ -d "$kwt" ] && [ "$(git -C "$kwt" rev-parse HEAD)" != "$tip" ]; then
      echo "Note: the kept build is not the landing reviewed here, $(git rev-parse --short "$tip")"
    fi
  fi

  # `DESCRIPTION` is left out of the diffs because every landing commit moves its
  # `Version:`; a change to any other line of it is carried below.
  excludes=(':(exclude).github/workflows' ':(exclude)DESCRIPTION' "${strand_excludes[@]}")
  unversioned() { git show "$1:DESCRIPTION" | grep -v '^Version:'; }
  main_version=$(git show "$base:DESCRIPTION" | sed -n 's/^Version: //p')

  work=$(mktemp -d)
  trap 'rm -rf "$work"' EXIT
  export GIT_INDEX_FILE="$work/index"
  export GIT_COMMITTER_DATE
  GIT_COMMITTER_DATE=$(git log -1 --format=%cd --date=raw "$base")

  git read-tree "$base"
  git ls-files -z -- .github/workflows | xargs -0 -r git update-index --force-remove --
  head=$(GIT_AUTHOR_DATE=$GIT_COMMITTER_DATE git commit-tree "$(git write-tree)" -p "$base" -m "ci: Remove every workflow from this review branch

The branch carries the R side of the $L landing without its engine,
so it compiles against nothing, and it is never merged.
Without workflow files a pull request from it starts nothing that
builds or tests it.")

  picked=0
  for c in $(git rev-list --reverse --first-parent "$base..$tip"); do
    git diff --binary "$c~1" "$c" -- . "${excludes[@]}" > "$work/diff"
    desc=''
    [ "$(unversioned "$c")" = "$(unversioned "$c~1")" ] || desc=1
    [ -s "$work/diff" ] || [ -n "$desc" ] || continue
    [ -s "$work/diff" ] && git apply --cached --binary --whitespace=nowarn "$work/diff"
    if [ -n "$desc" ]; then
      blob=$(git show "$c:DESCRIPTION" | sed "s/^Version: .*/Version: $main_version/" |
        git hash-object -w --stdin)
      git update-index --cacheinfo "100644,$blob,DESCRIPTION"
    fi
    subj=$(git log -1 --format=%s "$c")
    up=''
    # Named as the subject names it, owner and all, the SHA cut to ten.
    if series_is_vendor "$subj"; then
      up=$(series_marker_of "$subj")
      sha=${up##*@}
      up="${up%@*} ${sha:0:10}"
    fi
    head=$(
      { if series_is_vendor "$subj"; then
          echo "review: The R side of ${up:-$(git rev-parse --short "$c")}"
          echo
          git log -1 --format=%B "$c"
        else
          # The base's own commit, as it lands.
          git log -1 --format=%B "$c"
        fi
        echo "Landing-commit: $c"; } |
        GIT_AUTHOR_NAME=$(git log -1 --format=%an "$c") GIT_AUTHOR_EMAIL=$(git log -1 --format=%ae "$c") \
        GIT_AUTHOR_DATE=$(git log -1 --format=%ad --date=raw "$c") \
        git commit-tree "$(git write-tree)" -p "$head"
    )
    picked=$((picked + 1))
  done
  unset GIT_INDEX_FILE

  echo "=== $rb"
  echo "  $picked of $(git rev-list --count "$base..$tip") landing commits change the R side;" \
    "on main $(git rev-parse --short "$base") -> $(git rev-parse --short "$head")"
  echo "  $(git diff --shortstat "$base" "$head" -- . ':(exclude).github/workflows')"
  # What the tests take from the landing, by the commits that made it, which is
  # the part of the review a reader of `main` most needs named.
  echo
  "$here/series-tests.sh" "$base" "$tip" --strict | sed 's/^/  /' || true
  echo

  slug=$(git remote get-url "$canonical" | sed -E 's#^.*github\.com[:/]##; s#\.git$##')
  old=$(git ls-remote "$canonical" "refs/heads/$rb" | cut -f1)
  if [ "$old" = "$head" ]; then
    echo "$rb: already on $canonical"
  elif [ -z "$push" ]; then
    echo "Not pushed; --push writes $rb to $canonical."
    exit 0
  else
    git push -q "$canonical" "--force-with-lease=refs/heads/$rb:$old" "+$head:refs/heads/$rb"
    echo "$rb -> $(git rev-parse --short "$head") on $canonical"
  fi
  echo "Open it as a draft, never to be merged:"
  echo "  gh pr create --repo $slug --draft --base main --head $rb \\"
  echo "    --title \"Review: the R side of the $L landing${suffix:+, ${suffix#-}}\""
  exit 0
fi

# --- the build -----------------------------------------------------------------

# An rc strand behind its source would land a package CI judged as an older one;
# series-rc.sh recomputes it and says whether the remote holds that.
check_aligned() {
  [ -z "$source_arg" ] || return 0
  "$here/series-rc.sh" "$S" --remote "$remote" >/dev/null || {
    echo "Error: $S-rc-dev is not aligned with $S-dev on $remote;" \
      "realign it first: scripts/series-rc.sh $S --push" >&2
    exit 1
  }
}
write_state() { echo "$wt $base $src $seed $prefix $S" > "$STATE"; }

# The base the build is asked for: `main`, or a commit above it.
base_req=$main
if [ -n "$base_arg" ]; then
  base_req=$(git rev-parse -q --verify "$base_arg^{commit}" ||
    { git fetch -q "$canonical" "$base_arg" && git rev-parse FETCH_HEAD; })
fi
git merge-base --is-ancestor "$main" "$base_req" || {
  echo "Error: --base $base_arg is not above main $(git rev-parse --short "$main")," \
    "so main could not fast-forward onto a landing built on it" >&2
  exit 1
}

if [ -f "$STATE" ]; then
  read -r wt base src seed prefix kept < "$STATE"
  [ "$kept" = "$S" ] ||
    { echo "Error: the kept build lands ${kept:-another series}, not $S; --abort it first" >&2; exit 1; }
  [ -d "$wt" ] || { echo "Error: the kept worktree $wt is gone; rerun with --abort" >&2; exit 1; }
  if [ -n "$base_arg" ] && [ "$base_req" != "$base" ]; then
    echo "Error: the kept build stands on $(git rev-parse --short "$base"), not on --base $base_arg;" \
      "--abort it first" >&2
    exit 1
  fi
  if ! git merge-base --is-ancestor "$main" "$base"; then
    echo "Error: main moved from below $(git rev-parse --short "$base") to $(git rev-parse --short "$main")" >&2
    echo "  since this landing was started, so it can no longer fast-forward main." >&2
    echo "  Freeze main first (.claude/skills/series-land/SKILL.md), then --abort and rebuild." >&2
    exit 1
  fi
  git fetch -q "$remote" "+refs/heads/$src_name:refs/remotes/$remote/$src_name"
  if [ "$(git rev-parse "$rc")" != "$src" ]; then
    check_aligned
    [ "$(series_seed_of "$rc")" = "$seed" ] ||
      { echo "Error: $src_name has a new seed; --abort and rebuild" >&2; exit 1; }
    echo "$L: $src_name moved from $(git rev-parse --short "$src") to $(git rev-parse --short "$rc");" \
      "following it"
    src=$(git rev-parse "$rc")
    write_state
  fi
  echo "$L: resuming the build in $wt, on main $(git rev-parse --short "$base")," \
    "up to $(git rev-parse --short "$src")"
else
  check_aligned
  src=$(git rev-parse "$rc")
  seed=$(series_seed_of "$src")
  [ -n "$seed" ] || { echo "Error: $src_name has no seed" >&2; exit 1; }
  prefix=$(git show "$seed:DESCRIPTION" |
    sed -rn 's/^Version: ([0-9]+\.[0-9]+\.[0-9]+\.[0-9]+)\.[0-9]+$/\1/p')
  [ -n "$prefix" ] || { echo "Error: the seed of $src_name has no five-component version" >&2; exit 1; }
  base=$base_req
  wt=$(mktemp -d "${TMPDIR:-/tmp}/series-land-$L-XXXXXX")
  git worktree add --detach -q "$wt" "$base"
  write_state
  echo "$L: building on $(git rev-parse --short "$base")" \
    "($(git rev-list --count "$main..$base") commits above main), up to $src_name" \
    "$(git rev-parse --short "$src"), stamping $prefix.<n> in $wt"
fi

# The merge driver decides `DESCRIPTION` on every pick; its mapping lives in the
# shared .git/config, and the command it names is the worktree's own.
VENDOR_REPO="$wt" "$here/setup-git.sh" >/dev/null

# The series' ports and tooling syncs vendor nothing and are `main`'s already;
# the replay places them by their `-x` trailer and their subject
# (series-forward-build.sh, placed_by_rule). What a by-hand resolution changed
# beyond `main`'s commit is not lost to this: it is in the series' tree and not
# in the landing's, so the tree check below names it.

export GIT_COMMITTER_DATE
GIT_COMMITTER_DATE=$(git log -1 --format=%cd --date=raw "$base")

# rerere stages what it replays unless the build is attended, appended to
# whatever configuration the environment already passes and only for the
# replay itself.
cfg=()
if [ -z "$attended" ]; then
  i=${GIT_CONFIG_COUNT:-0}
  cfg=("GIT_CONFIG_COUNT=$((i + 1))" "GIT_CONFIG_KEY_$i=rerere.autoUpdate" "GIT_CONFIG_VALUE_$i=true")
fi
wt_git=$(git -C "$wt" rev-parse --absolute-git-dir)
pick_state="$wt_git/series-forward-pick"
# Every path rerere answered in this build, for the tree check to name.
replayed_log="$wt_git/series-land-rerere"
last_stop=''
while :; do
  set +e
  env ${cfg+"${cfg[@]}"} VENDOR_REPO="$wt" "$here/series-forward-build.sh" "$src" "$seed" \
    --prefix "$prefix" --no-keep-tests ${fwd_args+"${fwd_args[@]}"} 2>&1 |
    tee "$wt_git/series-land-run"
  st=${PIPESTATUS[0]}
  set -e
  answered=$(sed -nE "s/^(Resolved|Staged) '(.*)' using previous resolution\.$/\2/p" \
    "$wt_git/series-land-run")
  [ -z "$answered" ] || echo "$answered" >> "$replayed_log"
  # Continued only where rerere answered the stop, so a pick that failed some
  # other way without leaving a conflict is never committed half applied.
  if [ -n "$attended" ] || [ "$st" -ne 1 ] || [ ! -f "$pick_state" ] || [ -z "$answered" ] ||
    [ -n "$(git -C "$wt" diff --name-only --diff-filter=U)" ] ||
    [ "$(cat "$pick_state")" = "$last_stop" ]; then
    break
  fi
  last_stop=$(cat "$pick_state")
  echo "$L: rerere resolved that stop; continuing"
done
if [ "$st" -ne 0 ]; then
  echo
  echo "$L: the build stopped and is kept in $wt."
  echo "  Act there as the message above says, then rerun: scripts/series-land.sh $S"
  exit "$st"
fi

tip=$(git -C "$wt" rev-parse HEAD)
n=$(git rev-list --count "$base..$tip")
odd=$(git log --format='%h %s' "$base..$tip" | grep -v '^[0-9a-f]* vendor:' || true)
if [ -n "$odd" ]; then
  echo "Error: the landing carries commits that vendor nothing:" >&2
  echo "  ${odd//$'\n'/$'\n'  }" >&2
  exit 1
fi

# --- the same package as the series ------------------------------------------

# The series' package, with whatever the base adds above `main` merged in.
expect=$src
if [ "$base" != "$main" ]; then
  if ! expect=$(git merge-tree --write-tree --merge-base="$main" "$src" "$base" | head -n 1); then
    echo "Error: the base's own commits conflict with $src_name $(git rev-parse --short "$src");" \
      "the series has to carry what they change before it can land on them" >&2
    exit 1
  fi
fi

version_of() { git show "$1:DESCRIPTION" | sed -n 's/^Version: //p'; }
row() { printf '%s\t%s\t%s' "$@"; } # <path> <added/deleted> [<why>]
explained=() unexplained=()
while IFS=$'\t' read -r add del path; do
  case "$path" in
    NEWS.md | README.Rmd | README.md | .github/README.md)
      explained+=("$(row "$path" "$add/$del" "main's by construction; no port carries it")") ;;
    DESCRIPTION)
      why=''
      [ "$(version_of "$tip")" = "$(version_of "$expect")" ] ||
        why="version $(version_of "$tip") here, $(version_of "$expect") on the series"
      unexplained+=("$(row "$path" "$add/$del" "$why")")
      ;;
    *) unexplained+=("$(row "$path" "$add/$del")") ;;
  esac
done < <(git diff --numstat "$tip" "$expect")

echo "=== $L-land-dev"
echo "  $n vendor commits on $(git rev-parse --short "$base") -> $(git rev-parse --short "$tip")"
[ "$base" = "$main" ] ||
  echo "  the base is main $(git rev-parse --short "$main") and $(git rev-list --count "$main..$base") commit(s) of its own"
echo "  built up to $src_name $(git rev-parse --short "$src")"
if [ ${#explained[@]} -gt 0 ]; then
  echo
  echo "  explained (${#explained[@]}):"
  printf '%s\n' "${explained[@]}" | awk -F'\t' '{ printf "    %-44s %-9s %s\n", $1, $2, $3 }'
fi
deleted=$(git diff --diff-filter=D --name-only "$main" "$tip" -- . "${strand_excludes[@]}" ':(exclude)tests')
if [ -n "$deleted" ]; then
  echo
  echo "  deleted from main, outside the vendored strand and the tests; the series lacks them too:"
  echo "    ${deleted//$'\n'/$'\n'    }"
fi
if [ ${#unexplained[@]} -gt 0 ]; then
  echo
  echo "  UNEXPLAINED (${#unexplained[@]}):"
  printf '%s\n' "${unexplained[@]}" | awk -F'\t' '{ printf "    %-44s %-9s %s\n", $1, $2, $3 }'
  if [ -s "$replayed_log" ]; then
    echo
    echo "  rerere replayed a resolution for: $(sort -u "$replayed_log" | tr '\n' ' ')"
    echo "  A wrong one is replayed as faithfully as a right one: rebuild with"
    echo "  --abort and --attended, and drop it with 'git rerere forget <path>' at its stop."
  fi
  echo
  echo "DIVERGED: the landing is not the package $src_name holds."
  echo "  Port what main has to $S and realign its rc strand, or fix the series where"
  echo "  the landing differs from it; rerun to follow the strand. Nothing was pushed."
  exit 1
fi

# The tree check holds the landing to the series, so it cannot see a test the
# series lost as well. This holds it to the base, `main` and any tests pinned
# above it: every test the base runs, the landing runs, with no skip the base
# does not make, an engine gate included.
echo
if ! "$here/series-tests.sh" "$base" "$tip" --strict | sed 's/^/  /'; then
  echo
  echo "The landing would stop tests its base runs. Restore each on $S, in the vendor"
  echo "  commit that took it, or drop the gate, realign the rc strand, and rerun."
  echo "  Nothing was pushed."
  exit 1
fi

old_dev=$(git rev-parse -q --verify "$dev_ref" || true)
old_green=$(git rev-parse -q --verify "$green_ref" || true)
# Green keeps what CI has already passed when the chain under it is the same,
# and starts at `main` otherwise, so the base's own commits are judged too.
new_green=$main
if [ -n "$old_green" ] && git merge-base --is-ancestor "$main" "$old_green" 2>/dev/null &&
  git merge-base --is-ancestor "$old_green" "$tip"; then
  new_green=$old_green
fi

if [ "$old_dev" = "$tip" ] && [ "$old_green" = "$new_green" ]; then
  echo
  echo "$L-land-dev: already on $remote"
  exit 0
fi
if [ -z "$push" ]; then
  echo
  echo "Not pushed; --push writes $L-land-dev at $(git rev-parse --short "$tip")" \
    "and $L-land-green at $(git rev-parse --short "$new_green")."
  exit 0
fi
# Both refs or neither: a `-dev` pushed without its green would be planned from
# the start of `main`'s history (scripts/each-plan.sh).
git push -q --atomic "$remote" \
  "--force-with-lease=refs/heads/$L-land-dev:$old_dev" \
  "--force-with-lease=refs/heads/$L-land-green:$old_green" \
  "+$new_green:refs/heads/$L-land-green" \
  "+$tip:refs/heads/$L-land-dev"
echo
echo "$L-land-dev -> $(git rev-parse --short "$tip"), $L-land-green -> $(git rev-parse --short "$new_green")"
echo "The build stays in $wt for repairs; --abort removes it."
