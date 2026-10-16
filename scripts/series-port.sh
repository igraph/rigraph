#!/bin/bash
# Bring a series' -dev branch level with `main` — stage 4 of the series loop
# (.claude/skills/series-loop/SKILL.md).
#
# The goal is identity, not curation: after a successful --apply, the tooling
# paths — .github/, scripts/, .claude/ — of <S>-dev are byte-identical to
# `main`'s, and a tooling change never waits for a forward.
#
# **<S>-build owes the same identity, and is synced here too.** A workflow
# fires from the branch it sits on, so a ref nobody ports runs the tooling of
# the day it was seeded, and a push filter written back then decides what fires
# today. The buffer takes no *ports* — its line is upstream commits and the glue
# they need — but its tooling is brought level, by one commit appended when it
# differs. Measured rather than feared: `v1.4-andium-build` still carried a
# 2026-03-26 R-CMD-check.yaml whose release pattern matches the buffer's own
# name, so pushes to it started the template check and R-CMD-check-status.yaml
# stamped an `rcc` status on a commit no per-commit leg had decided — a status
# with no record, which is exactly what breaks a reader trusting one against
# the other.
#
# To every reader of the vendor strand the sync commit is invisible: it vendors
# nothing, so the consumption anchor and the vendored-SHA scans look past it by
# subject. Stage 5 skips it rather than replaying it onto -dev, whose tooling
# this stage has already made main's (scripts/series-advance.sh). Replaying it
# was the first design, and it held only until `main` moved again: the sync's
# diff runs from the buffer's older tooling, so the pick conflicted or restored
# what main had removed -- and a sync the anchor never passes was offered again
# on every firing. The skip reads the subject written below, in series-advance.sh
# and series-check.sh alike, so a change to it is a change to all three.
#
# The script lists EVERY commit on `main` since the series' base that has no
# patch-id equivalent on <S>-dev (`git cherry`), oldest first, classified by
# what it touches: TOOLING (only tooling paths), MIXED (tooling and more),
# OTHER (no tooling), VENDOR, VERSION.
# --apply cherry-picks everything except VENDOR and VERSION — a MIXED or OTHER
# commit is a forward-port like any other, judged by CI like every -dev commit —
# or exactly the SHAs given, for when judgement says a commit cannot work
# against this series' engine yet. Picks are always whole commits: a pick
# that matches its main commit is skipped by patch-id at the next rebase,
# a half-pick would only replay. VENDOR commits are never auto-picked,
# because main's engine is not this series' engine: the series' own
# vendoring owns that strand.
#
# **A VERSION commit is not auto-picked either**, because `main`'s R-client
# counter is not this series'. A series' version says which release line it was
# seeded from and how far its own vendoring has run; what `main` is at today is
# read from `main` (duckdb-r#2496). Porting fledge's bumps made the fourth component
# free-run behind `main` instead of staying at the seed, which is the opposite
# of the model handbook/operations/releases/ describes. The class is
# read from the content -- the commit carries nothing but release paperwork --
# not from the `fledge:` subject, so a bump under another name is caught and a
# bump riding on real content is not. The class covers the notes as well as the
# bump: a commit that writes NEWS.md for `main`'s next release and touches
# nothing else is the same strand, and the series has neither the section it
# goes in nor the version that names it. Dropping one leaves NEWS.md at the
# state the series was seeded with; that file is the release strand's and
# already outside the sync commit's path set. Naming a VERSION commit
# explicitly still ports it, like any other SHA.
#
# **The subject is what decides a VENDOR commit, never the path.** The patch
# stack is applied to the vendored tree in place, so CRAN and
# compiler-warning fixes land under src/vendor/ carrying no upstream SHA, and
# excluding them by path made exactly those fixes wait for a forward — the
# one thing this script exists to end. The readers of the vendor strand look
# past such commits by subject and say so when their bound is exhausted
# (series_vendored_sha() in scripts/series-lib.sh,
# the base scans in scripts/vendor-one.sh and scripts/vendor.sh), so a ported
# commit under src/vendor/ is invisible to them whether or not this class
# names it. After the picks, whatever tooling
# delta remains (history that diverged inside vendor commits, picks dropped
# as empty) is closed with one sync commit that takes `main`'s tooling tree
# verbatim; its diff is the residue the commit walk could not explain, and
# reading it is part of the port. In steady state the residue is empty and
# no sync commit is created.
#
# One class of residue is worth more than an eye over a diff, so the sync names
# it: a file it deletes that is still referenced from outside the tooling paths.
# `main` moved the file in a commit this series did not take, and the caller
# that moved with it is somewhere the sync cannot reach. The warning says which
# file and which callers; the remedy is to port that commit by name.
#
# A frozen series takes no ports by default: a line seeded from a release
# branch keeps the R code it was seeded with, so `main`'s development line is
# not a backlog it is behind on. The walk is skipped for those and the sync
# commit is the whole default port, so their tooling still follows `main` — a
# frozen R side is not a frozen CI. The freeze is not a refusal, though: a fix
# the build genuinely needs is picked by name, and --list shows the walk when
# you are looking for one. Frozen is detected from the lineage under the seed,
# or declared when a line parks on its own baseline; see the seed check below.
#
# A conflict stops the sequence in place and keeps the worktree: resolving it
# is the routine's judgement. Continue the sequence there, push, and rerun
# this script to finish — the patch-id filter makes reruns cheap and exact.
#
# Ported and sync commits are ordinary -dev commits: they vendor nothing (the
# consumption anchor in scripts/series-advance.sh reads vendor subjects), and
# they are transient — a forward's seed already carries their content, and a
# rebase drops patch-id equivalents and empty leftovers.
#
# **`--dev-note` writes a stage-3 finding into the newest commit this stage
# mints.** An r-universe failure has no per-commit record anywhere and no commit
# of its own, so the series keeps it in the message of the next `-dev` commit
# (.claude/skills/series-loop/SKILL.md stage 3). Normally that is stage 5's, and
# scripts/series-advance.sh takes the note. A firing whose buffer is empty mints
# no vendor commit at all, though, and then the ports this stage makes are the
# only `-dev` commits of the whole firing -- so it takes the same option, with
# the same meaning, rather than leaving the firing to amend and force-push after
# the push here and spend an each-rcc run on a commit it is about to re-mint.
#
# Usage: series-port.sh <series> [--list] [--apply] [--remote <name>] [--dev-note <file>] [sha...]
#
# --remote is spelled the same in every scripts/series-*.sh; see the shared
# contract in handbook/operations/vendoring/series-loop/README.md.

set -euo pipefail
# shellcheck source=series-lib.sh
. "$(dirname "$0")/series-lib.sh"

usage='usage: series-port.sh <series> [--list] [--apply] [--remote <name>] [--canonical <name>] [--dev-note <file>] [sha...]'
argerr() { echo "$usage" >&2; exit 2; }
# --list walks a frozen series anyway, for when the question is which commit of
# `main` to name. No effect on any other series: the walk is their default.
list=
apply=
DEV_NOTE=
remote=${SERIES_REMOTE:-origin}
# The repository `main` belongs to, which the fork mirrors. Same name and same
# default as series-advance.sh's, and where this script reads `main` from.
canonical=${SERIES_CANONICAL-upstream}
args=()
while [ $# -gt 0 ]; do
  case "$1" in
    --list) list=1; shift ;;
    --apply) apply=1; shift ;;
    --remote) [ $# -ge 2 ] || argerr; remote=$2; shift 2 ;;
    --canonical) [ $# -ge 2 ] || argerr; canonical=$2; shift 2 ;;
    --dev-note) [ $# -ge 2 ] || argerr; DEV_NOTE=$2; shift 2 ;;
    -h | --help) echo "$usage"; exit 0 ;;
    -*) argerr ;;
    *) args+=("$1"); shift ;;
  esac
done
[ ${#args[@]} -ge 1 ] || argerr
S=${args[0]}
set -- ${args+"${args[@]:1}"}
[ -n "$apply" ] || [ $# -eq 0 ] || argerr
if [ -n "$DEV_NOTE" ]; then
  # The note rides on a commit, and only --apply mints one.
  if [ -z "$apply" ]; then
    echo "Error: --dev-note needs --apply — the note rides on a commit this" >&2
    echo "  run mints, and a listing run mints none." >&2
    argerr
  fi
  if [ ! -s "$DEV_NOTE" ]; then
    echo "Error: --dev-note file is missing or empty: $DEV_NOTE" >&2
    exit 1
  fi
fi

# The identity set: what CI and the routine execute. patch/ stays out
# (vendor-coupled: applied by vendor runs, refreshed by repairs), as do the
# docs that are flavored per branch or belong to the release strand —
# commits touching them are still listed and picked like any other,
# but the sync commit never rewrites them.
#
# `.github/README.md` is one of those, and it is the reason `.github` cannot be
# taken whole: it is the README GitHub renders, it is generated from the
# flavored `README.Rmd`, and taking main's copy would put the mainline name at
# the top of every flavored series' front page — the defect duckdb-r#2517 and duckdb-r#2518
# were about, in the file most likely to be read.
tooling=("${series_tooling[@]}" ':(exclude).github/README.md')
paths_re=$(series_tooling_re)
flavored_docs_re='^\.github/README\.md$'
# A vendor commit is one whose subject says it vendored: the `vendor:` prefix
# vendor-one.sh writes, or the `<owner>/<repo>@<sha>` reference that carries the
# upstream commit as machine-readable state. Same rule as every other reader of
# the strand — see the header on why the path is not the rule.
vendor_subject_re="^vendor:|$series_marker_ere"

# scripts/flavor.sh's first commit, and so the foot of every seed
# (series-open step 2, series-forward step 1).
seed_re='^chore: Update flavor patch to '

# A pick that moves `Version:` is decided by the `ours-version` merge driver,
# whose name -> command mapping lives in .git/config and cannot be committed.
# A fresh clone has the attribute and not the driver, so register it here and
# refuse only if it is still missing -- refusing first made every firing run
# scripts/setup-git.sh by hand for a step this script already took under
# --apply. Idempotent; .git/config is shared with the worktree.
if [ -x "$(dirname "$0")/setup-git.sh" ]; then
  VENDOR_REPO="$(git rev-parse --show-toplevel)" "$(dirname "$0")/setup-git.sh" >/dev/null
fi
git config --get merge.ours-version.driver >/dev/null ||
  { echo "Error: merge driver not registered, run scripts/setup-git.sh" >&2; exit 1; }

git fetch -q "$remote"
dev="$remote/$S-dev"
git rev-parse -q --verify "$dev" >/dev/null || { echo "Error: no $S-dev on $remote"; exit 1; }

# `main` is read from the canonical repository, not from the fork's mirror of
# it. The series live in the fork, but this script's whole output is "what does
# the series not have that main has", and the sync commit takes that main's
# tooling tree *verbatim* -- so a mirror that has not caught up is not a smaller
# answer but a wrong one: every commit merged since it last ran is reverted onto
# the series, silently and on all of them at once.
#
# That is not hypothetical: on 2026-09-14 a firing ported while the fork's main
# was two commits behind duckdb/duckdb-r#2743 and #2745, which had moved the
# composite actions out of `.github/workflows/`. The sync pointed `each.yaml`
# back at `./.github/workflows/git-identity`, which no longer exists anywhere,
# and every `each-rcc` leg on every series died at that step within seconds.
# Nothing was judged until the mirror was pushed forward and the ports rerun.
#
# Reading the canonical tip is what removes that failure mode rather than
# detecting it. This script used to ask the canonical repository only whether
# the mirror was stale, and refuse while it was -- which turned the Pull app's
# six-hour cycle into a six-hour window where no series could be ported at all,
# against a repository the run could read the whole time
# (handbook/branches/mirrors/README.md). Nothing here writes to the fork's
# `main`, and the mirror keeps serving the badges that measure against it.
main=
if [ -n "$canonical" ]; then
  if git remote get-url "$canonical" >/dev/null 2>&1 &&
    git fetch -q "$canonical" main 2>/dev/null; then
    # A fetch of a named branch also updates the remote-tracking ref when the
    # remote carries the usual refspec, and that ref is what messages below
    # name. FETCH_HEAD is the fallback for a remote configured without one; it
    # is read here, before any later fetch overwrites it.
    if git rev-parse -q --verify "refs/remotes/$canonical/main" >/dev/null; then
      main="$canonical/main"
    else
      main=$(git rev-parse -q --verify FETCH_HEAD || true)
    fi
  fi
  [ -n "$main" ] || {
    echo "Warning: could not read main from '$canonical'; falling back to" >&2
    echo "  $remote/main, which the mirror may have left behind. Add the" >&2
    echo "  canonical repository as that remote, or pass --canonical <name>." >&2
  }
fi
# No canonical remote named at all (SERIES_CANONICAL='') or none reachable: the
# mirror is what is left. It is only ever behind, never ahead, so a fallback
# offers a subset of the truth -- worth saying and not worth refusing over.
[ -n "$main" ] || main="$remote/main"

mb=$(git merge-base "$dev" "$main" 2>/dev/null || true)
if [ -z "$mb" ]; then
  # A series seeded from an orphan mirror shares no history with `main`, so
  # there is no base to bound the walk at and `git cherry` has nothing to
  # compare against. Say so instead of dying on the empty expansion.
  echo "$S: no merge base with main — the series is an unrelated lineage," >&2
  echo "  so stage 4 cannot port onto it; sync its tooling by hand" >&2
  exit 2
fi

# Frozen is read off the series, not listed here. A series is seeded from the R
# package's `main` (series-open step 2), and a forward regenerates that seed
# on current `main` (series-forward step 1), so a well-seeded series has its
# flavor commit sitting directly on the merge base and `git cherry` offers what
# `main` gained since the last port. Seeded from a release line instead, the
# seed sits on that line's own commits, and the walk reaches back to where that
# lineage left `main` — the whole R development line of another engine.
#
# The lineage under the seed is what separates them, and it is the one quantity
# that does not move: the candidate list and the distance to the join both grow
# as `main` does, while a well-seeded series stays near zero however long it
# runs. Naming the series here instead would age — every LTS line opened or
# retired would be an edit to this script, and a firing would trust the list
# over the branch in front of it.
#
# What is counted is the part of that lineage `main` does not already have.
# Counting commits instead made one seeding fix enough to freeze a series:
# `v1.5-variegata-fwd` carried a single `fix(flavor)` commit below its flavor
# commit — `main`'s own, replayed into the seed — and took no ports at all,
# until its `-dev` differed from the base series' on 18 paths the convergence
# report could not explain. A release-seeded lineage is not one commit off:
# `v1.4-andium` has 56 commits under its seed, 45 of them `main`'s by no
# reading, which is the shape the freeze is for.
seed=$(git rev-list "$mb..$dev" --grep="$seed_re" | tail -n 1)
under=0
[ -n "$seed" ] && under=$(git cherry "$main" "$seed^" "$mb" | grep -c '^+' || true)
frozen=
[ "$under" != 0 ] && frozen=1

# A line that parks when another one lands on `main` is the case the lineage
# cannot see. Its seed sits on `main`'s own history, and `main` keeps that
# history when it fast-forwards onto the new line
# (.claude/skills/series-land/SKILL.md), so nothing under the seed is foreign
# and the walk would offer the new line's R side as a backlog. The parking is
# recorded where the badge table and the mirror rules already read it:
# `releases_from` in `main`'s scripts/series.yaml, which names the line's own
# baseline once it stops releasing from `main` (handbook/branches/mirrors/).
# Read from `main` for the reason series-check.sh reads it there: a series'
# tree lags `main` by whatever this stage has not ported yet.
releases_from() { # <series> -> its `releases_from`, empty when undeclared
  { git show "$main:scripts/series.yaml" 2>/dev/null || true; } |
    awk -v s="$1" '
      /^  - / { if (ser == s) print rf; ser = ""; rf = "" }
      /^    series:/ { ser = $2 }
      /^    releases_from:/ { rf = $2 }
      END { if (ser == s) print rf }'
}
parked=$(releases_from "${S%-fwd}" | head -n 1)
[ "$parked" != main ] || parked=''
[ -z "$parked" ] || frozen=1

# Files a version bump is allowed to carry and still be nothing but a bump:
# DESCRIPTION itself, plus the release paperwork fledge writes beside it. Both
# belong to the release strand, and neither is in the tooling set the sync
# commit rewrites, so dropping the commit drops nothing the series executes.
bump_paths_re='^(DESCRIPTION|NEWS\.md|cran-comments\.md)$'

# Is this commit release paperwork and nothing else? Two questions, both of
# which have to answer yes:
#
#   * it carries nothing outside the release strand, and something inside it. A
#     commit that bumps the version *and* changes the package is a forward-port
#     that happens to bump, and it is ported like any other, because a pick is a
#     whole commit and never half of one. `Sync with main` (4e41675f9) is the
#     shape this guards: a bump riding on 130 files of tooling, R code, tests
#     and patches, which classifying by the version line alone would have
#     dropped whole.
#   * where it touches DESCRIPTION, `Version:` moved -- read against the first
#     parent rather than from the diff, so a merge commit answers as truthfully
#     as an ordinary one. The content is the fact, not the subject: a bump is
#     one whatever it is called, and `fledge:` is only today's name for it.
#     DESCRIPTION also carries the dependency list, so a commit that edits it
#     without moving the version is package content and ported like any other.
#
# **A commit that leaves DESCRIPTION alone is paperwork without a bump.** Notes
# written into NEWS.md for `main`'s next release are the release strand's just
# as fledge's bumps are, and the series has neither the section they go in nor
# the version that names it: the pick conflicts on every series at once and its
# only honest resolution is the empty commit that retires it. Requiring a moved
# `Version:` let exactly those through -- 8f48159063 and dcfb3d2c2a, one firing,
# four series, four hand resolutions (2026-09-28).
version_bump() { # <sha>
  local before after f touched= desc=
  while IFS= read -r f; do
    [[ "$f" =~ $bump_paths_re ]] || return 1
    case "$f" in DESCRIPTION) desc=1 ;; esac
    touched=1
  done < <(git diff-tree --no-commit-id --name-only -r "$1")
  [ -n "$touched" ] || return 1
  if [ -n "$desc" ]; then
    before=$(git show "$1^:DESCRIPTION" 2>/dev/null | sed -n 's/^Version: //p' || true)
    after=$(git show "$1:DESCRIPTION" 2>/dev/null | sed -n 's/^Version: //p' || true)
    [ -n "$after" ] && [ "$before" != "$after" ] || return 1
  fi
  return 0
}

classify() { # <sha> -> TOOLING | MIXED | OTHER | VENDOR | VERSION
  local f t='' o=''
  if [[ "$(git log -1 --format=%s "$1")" =~ $vendor_subject_re ]]; then echo VENDOR; return; fi
  if version_bump "$1"; then echo VERSION; return; fi
  while IFS= read -r f; do
    if [[ "$f" =~ $paths_re && ! "$f" =~ $flavored_docs_re ]]; then t=1; else o=1; fi
  done < <(git diff-tree --no-commit-id --name-only -r "$1")
  if [ -n "$t" ] && [ -n "$o" ]; then
    echo MIXED
  elif [ -n "$t" ]; then
    echo TOOLING
  else
    echo OTHER
  fi
}

# What `main` gained through an ancestry-only merge: a merge whose tree is its
# first parent's, so nothing of the lineage it records ever entered main's
# tree. `git cherry` offers those commits like any other -- they are ancestors
# of `main` carrying no patch-id the series has -- and porting one applies a
# tree from another era on top of this one.
#
# duckdb-r#2713 recorded the v1.1.3-2 tag that way, and the next firing was offered 13
# commits dated 2024-12 to 2025-01 for every non-frozen series, `feat: Limit
# automatic materialization by number of rows or number of cells (duckdb-r#1017)` among
# them. A default --apply would have cherry-picked all of them.
#
# The test is the merge's own tree and not its subject: `-s ours` is one way to
# write "ancestry only", a hand-resolved merge that kept our side is another,
# and both leave the same fact behind.
ancestry_only_commits() {
  local m parents
  while IFS= read -r m; do
    [ "$(git rev-parse "$m^{tree}")" = "$(git rev-parse "$m^1^{tree}")" ] || continue
    parents=$(git rev-list --parents -n 1 "$m" | cut -d' ' -f3-)
    [ -n "$parents" ] || continue
    # shellcheck disable=SC2086  # a parent list, deliberately word-split
    git rev-list $parents --not "$m^1"
  done < <(git rev-list --merges "$mb..$main")
}

candidates=()
declare -A klass=()

# Every commit of `main` the series does not carry, oldest first. Two dedupe
# layers make reruns exact: `git cherry` bounds the walk at the merge base and
# drops patch-id equivalents (clean picks), and the `-x` trailer written into
# every ported commit excludes picks whose resolution diverged from the
# original patch — those would otherwise be re-offered and re-conflict on
# every rerun.
#
# Both layers need a commit to read, so a pick whose *resolution* comes out
# empty has to be committed empty rather than skipped. That happens wherever
# the series already carries main's change under its own flavor's name: the
# tree is right, the patch-id is not main's, and `git cherry-pick --skip` —
# which is what git itself suggests there — leaves neither a patch-id nor a
# trailer, so the same pick is offered and reconflicts on every firing. The
# guidance below says so; `--empty=drop` cannot reach this case, because it
# judges the pick before the resolution exists.
#
# A frozen series skips the walk rather than listing what it will not take by
# default: the list is long — an LTS line joins `main` far back, so `git cherry`
# offers the whole development line since the fork — and reading it every firing
# is the cost the freeze exists to remove. --list asks for it anyway, which is
# what to do when the series needs a fix `main` already has.
if [ -n "$frozen" ] && [ -z "$list" ]; then
  echo "$S: frozen${parked:+ (parked on $parked)}; nothing is ported by default, and tooling follows main." \
    "Name a fix the build needs with --apply <sha>, or --list to see candidates"
else
  declare -A ported=()
  while IFS= read -r x; do ported[$x]=1; done < <(
    git log --format=%B "$mb..$dev" |
      sed -n 's/^(cherry picked from commit \([0-9a-f]\{40\}\))$/\1/p')
  declare -A ancestry_only=()
  while IFS= read -r m; do ancestry_only[$m]=1; done < <(ancestry_only_commits)
  mapfile -t all < <(git cherry "$dev" "$main" | sed -n 's/^+ //p')
  for sha in "${all[@]}"; do
    [ -n "${ported[$sha]:-}" ] && continue
    [ -n "${ancestry_only[$sha]:-}" ] && continue
    candidates+=("$sha")
    klass[$sha]=$(classify "$sha")
    printf '%-7s %s %s\n' "${klass[$sha]}" \
      "$(git rev-parse --short "$sha")" "$(git log -1 --format=%s "$sha")"
  done
fi

if git diff --quiet "$dev" "$main" -- "${tooling[@]}"; then
  echo "tooling: identical to main"
else
  echo "tooling: differs from main —$(git diff --shortstat "$dev" "$main" -- "${tooling[@]}")"
fi

# The buffer's own answer to the same question. Reported even when it is
# identical, because "nothing to say about -build" and "-build has no tooling
# delta" are different sentences and only one of them is reassuring.
buildref="$remote/$S-build"
if ! git rev-parse -q --verify "$buildref" > /dev/null; then
  echo "buffer tooling: no $S-build on $remote"
elif git diff --quiet "$buildref" "$main" -- "${tooling[@]}"; then
  echo "buffer tooling: identical to main"
else
  echo "buffer tooling: differs from main —$(git diff --shortstat "$buildref" "$main" -- "${tooling[@]}")"
fi

[ -n "$apply" ] || exit 0

# A pick can still meet DESCRIPTION's `Version:` -- a named VERSION commit, a
# forward-port that carries one -- and the ours-version merge driver is what
# keeps that line off the conflict list. The gate at the top of this script has
# registered it already.

# The default fill is what a frozen series does not get: `--list --apply` shows
# the walk and still ports nothing, because seeing the candidates is not the
# same as choosing them. Explicit SHAs are the choosing, and they always apply.
picks=("$@")
if [ ${#picks[@]} -eq 0 ] && [ -z "$frozen" ]; then
  for sha in "${candidates[@]}"; do
    case "${klass[$sha]}" in VENDOR | VERSION) continue ;; esac
    picks+=("$sha")
  done
fi

wt=$(mktemp -d)
git worktree add --detach -q "$wt" "$dev"

# `-x` records the main commit in the message; `--empty=drop` skips a pick
# whose content arrived some other way. On conflict the worktree stays: the
# sequencer holds the remaining picks, so one --continue walks the rest.
#
# The `-x` trailer is the second dedupe layer, not decoration, so the guidance
# below names it: a resolution that diverges from main's patch has no patch-id
# in common with it, and the trailer is then the only thing that stops the pick
# being offered and reconflicting on every firing. It prints the SHA in full,
# because the reader above matches 40 hex digits and every other SHA on screen
# is abbreviated.
if [ ${#picks[@]} -gt 0 ] && ! git -C "$wt" cherry-pick -x --empty=drop "${picks[@]}"; then
  echo "Conflict; worktree kept at $wt, conflicted files:"
  git -C "$wt" diff --name-only --diff-filter=U | sed 's/^/  /'
  echo "Resolve toward main's intent, then:"
  echo "  git -C $wt cherry-pick --continue    # repeats through the rest"
  echo "Writing the message by hand instead? Keep the trailer it would have"
  echo "written, or this pick is offered again on every firing:"
  echo "  (cherry picked from commit $(git -C "$wt" rev-parse CHERRY_PICK_HEAD))"
  echo "A resolution that comes out empty is committed empty, never skipped —"
  echo "the empty commit is what carries the trailer that retires the pick:"
  echo "  git -C $wt commit --allow-empty --cleanup=strip --no-edit"
  echo "  git -C $wt push $remote HEAD:refs/heads/$S-dev"
  echo "  git worktree remove --force $wt"
  echo "  scripts/series-port.sh $S --apply    # finish: leftovers + sync"
  exit 1
fi

# Close the residue: make the tooling paths byte-identical to main's. `git rm`
# first, so a file the series has and main does not is deleted rather than
# kept — checkout alone only adds and overwrites.
if ! git -C "$wt" diff --quiet "$main" -- "${tooling[@]}"; then
  git -C "$wt" rm -qr --ignore-unmatch -- "${tooling[@]}"
  git -C "$wt" checkout "$main" -- "${tooling[@]}"
  git -C "$wt" commit -q -m "chore(series): Sync tooling with main" \
    -m "Takes main's ${tooling[*]} verbatim on top of the ported commits;
the diff is the residue the commit walk could not explain."

  # A file the sync deletes can still be named from outside the tooling paths:
  # `main` moved it in a commit this series did not take, and the caller that
  # moved with it lives where the sync cannot reach. `configure` calling
  # `scripts/setup-makeflags.R` is the case this was written for -- the call is
  # guarded with `|| echo ""`, so the tree stays green and simply builds
  # single-threaded, which is the kind of loss nobody finds by reading a diff.
  # Name it instead, and name the remedy: port the commit that moved the file.
  while read -r gone; do
    [ -n "$gone" ] || continue
    callers=$(git -C "$wt" grep -lF -- "$gone" -- . \
      ':(exclude).github' ':(exclude)scripts' ':(exclude).claude' || true)
    [ -n "$callers" ] || continue
    echo "warning: the sync deleted $gone, still referenced by:"
    echo "$callers" | sed 's/^/  /'
    echo "  port the commit that moved it: scripts/series-port.sh $S --apply <sha>"
  done <<EOF
$(git -C "$wt" diff --diff-filter=D --name-only HEAD^ HEAD)
EOF
fi
git -C "$wt" diff --quiet "$main" -- "${tooling[@]}" ||
  { echo "Error: tooling still differs after sync"; exit 1; }

if [ "$(git -C "$wt" rev-parse HEAD)" = "$(git rev-parse "$dev")" ] &&
  [ -n "$DEV_NOTE" ]; then
  git worktree remove --force "$wt"
  echo "Error: $S — the port minted nothing, so --dev-note has no commit" >&2
  echo "  to write the finding on. Record it on the next one instead." >&2
  exit 1
fi

# The stage-3 finding, onto the newest commit this run minted — the same place
# and the same reason as in scripts/series-advance.sh: the readers of these
# findings, scripts/series-glue.sh and stage 2's mining step, read exactly this
# message. They anchor on an `R-side fix` section, so a note that does not open
# with that header gets the one series-advance.sh writes, by the same test.
if [ -n "$DEV_NOTE" ]; then
  note_head=
  if ! sed -n '/[^[:space:]]/{p;q;}' "$DEV_NOTE" | grep -qi '^R-side fix'; then
    note_head=$'R-side fix:\n\n'
  fi
  { git -C "$wt" log -1 --format=%B; echo; printf '%s' "$note_head";
    cat "$DEV_NOTE"; } > "$wt/.series-port-note"
  git -C "$wt" commit -q --amend --no-verify -F "$wt/.series-port-note"
  rm -f "$wt/.series-port-note"
fi

next=$(git -C "$wt" rev-parse HEAD)
git worktree remove --force "$wt"
if [ "$next" = "$(git rev-parse "$dev")" ]; then
  echo "nothing to port"
else
  git push "$remote" "$next:refs/heads/$S-dev"
  echo "dev -> $(git rev-parse --short "$next")"
fi

# The buffer, brought level the same way and for the same reason (see the
# header). An append, never a rewrite: `-build`'s force-push is reserved for
# mirroring a fold, and nothing here touches an upstream commit.
#
# A series with no buffer -- one pending cutover -- has nothing to sync or to
# carry `patch/` entries onto, and that is an ordinary state rather than an
# error.
git rev-parse -q --verify "$buildref" > /dev/null || exit 0
if ! git diff --quiet "$buildref" "$main" -- "${tooling[@]}"; then
  bwt=$(mktemp -d)
  git worktree add --detach -q "$bwt" "$buildref"
  git -C "$bwt" rm -qr --ignore-unmatch -- "${tooling[@]}"
  git -C "$bwt" checkout "$main" -- "${tooling[@]}"
  git -C "$bwt" commit -q -m "chore(series): Sync buffer tooling with main" \
    -m "Takes main's ${tooling[*]} verbatim onto the buffer, so a workflow firing
from this ref is main's rather than the seed's. Vendors nothing, so stage 5
skips it rather than replaying it onto -dev."
  # The same check as the -dev sync's, and it matters more here: vendor-one.sh
  # runs scripts/rconfigure.py and friends from the buffer's own tree. The
  # remedy differs, because the buffer takes no ports.
  while read -r gone; do
    [ -n "$gone" ] || continue
    callers=$(git -C "$bwt" grep -lF -- "$gone" -- . \
      ':(exclude).github' ':(exclude)scripts' ':(exclude).claude' || true)
    [ -n "$callers" ] || continue
    echo "warning: the buffer sync deleted $gone, still referenced by:"
    echo "$callers" | sed 's/^/  /'
    echo "  the buffer takes no ports: make main compatible, or fold the move into -build by hand"
  done <<EOF
$(git -C "$bwt" diff --diff-filter=D --name-only HEAD^ HEAD)
EOF
  git -C "$bwt" diff --quiet "$main" -- "${tooling[@]}" ||
    { echo "Error: buffer tooling still differs after sync; worktree kept at $bwt"; exit 1; }

  bnext=$(git -C "$bwt" rev-parse HEAD)
  git worktree remove --force "$bwt"
  git push "$remote" "$bnext:refs/heads/$S-build"
  echo "build -> $(git rev-parse --short "$bnext")"
fi

# A port is how a `patch/` entry written against `main` reaches this series, and
# `-dev` is not where it does anything: `vendor-one.sh` applies the *buffer's*
# stack to every tree it regenerates. Carrying it on is part of porting, not a
# separate errand somebody remembers -- so it runs here, on every --apply, and
# whether or not this run had commits to pick. The carry decides by
# test-applying against the buffer's own tree, because a buffer runs ahead of
# `main` and an entry that does not fit its engine would break the next vendor
# run rather than help it. It runs after the tooling sync and fetches again, so
# it builds on the buffer tip that sync pushed.
"$(dirname "$0")/series-patch-sync.sh" "$S" --apply --remote "$remote"
