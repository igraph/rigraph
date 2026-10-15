#!/bin/bash
# Vendors igraph sources commit-by-commit from the upstream repository.
# Used by the series loop (.claude/skills/series-loop/SKILL.md).
#
# Usage: scripts/vendor-one.sh [--commits N] [--no-check-glue] [<upstream clone>]
#
# The upstream clone must reach both stretches of the line
# (scripts/series-config.sh): the replay branch of krlmlr/igraph, and
# igraph/igraph with its tags. Its HEAD names how far to walk igraph/igraph;
# on the replay the walk ends at the replay tip whatever HEAD says.
#
# Exit status: 0 done or nothing to do, 1 an error, 3 the glue does not compile
# against the vendored headers, 4 a patch neither applies nor reverses,
# 5 the clone's HEAD is on another upstream line, 6 the clone cannot say what
# version it is, 7 the R/C interface could not be generated, 8 the glue check
# could not run.
#
# https://unix.stackexchange.com/a/654932/19205
# Using bash for -o pipefail

set -e
set -x
set -o pipefail

# The checkout to vendor into, so the series loop can run `main`'s copy of this
# script against another worktree. Only *this* script comes from `main` that
# way: everything it invokes by relative path -- `Makefile-cigraph`,
# `patch/*.patch`, `./configure` -- stays the target tree's.
# The engine's names and the glue gate come from this script's own tree, as the
# script does, before the change of directory below.
here=$(cd "$(dirname "$0")" && pwd)
# shellcheck source=vendor-lib.sh
. "$here/vendor-lib.sh"

cd "${VENDOR_REPO:-$here/..}"
toplevel=$(git rev-parse --show-toplevel 2>/dev/null) || {
  echo "Error: $PWD is not a git worktree" >&2
  exit 1
}
[ "$toplevel" -ef . ] || {
  echo "Error: $PWD is not the root of its worktree ($toplevel)" >&2
  exit 1
}

repo_org=${series_upstream_repo%%/*}
repo_name=${series_upstream_repo##*/}
project=${repo_name}
vendor_base_dir=${series_vendor_dir}
vendor_dir=${vendor_base_dir}


upstream_basedir=""
num_commits=1
check_glue=true
strand=false

# Matches the bound in series_vendored_sha() (scripts/series-lib.sh).
base_scan_depth="${BASE_SCAN_DEPTH:-20}"

while [ $# -gt 0 ]; do
  case "$1" in
    --commits|-c)
      num_commits="$2"
      shift 2
      ;;
    --no-check-glue)
      check_glue=false
      shift
      ;;
    --strand)
      # A commit for the vendor strand (scripts/series-vendor.sh): what vendoring
      # writes and nothing of the buffer's -- no counter, no glue gate.
      strand=true
      check_glue=false
      shift
      ;;
    -*)
      echo "Unknown option: $1" >&2
      exit 1
      ;;
    *)
      upstream_basedir="$1"
      shift
      ;;
  esac
done

if [ -z "$upstream_basedir" ]; then
  upstream_basedir=../../../${project}
fi

upstream_dir=${project}

if [ ! -d "$upstream_dir" ]; then
  git clone "$upstream_basedir" "$upstream_dir"
elif [ "$upstream_basedir" != "$upstream_dir" ]; then
  # Update the existing clone, and put its HEAD back where the source's is.
  # The walk checks out every commit it vendors, so a clone this script left
  # behind points at the last commit it touched; a rerun that read that as the
  # tip to walk to would stop early and report done.
  # The source is the authority on what to vendor up to, so re-read it rather
  # than trusting a HEAD this script itself moved.
  git -C "$upstream_dir" fetch origin
  git -C "$upstream_dir" checkout -q --detach \
    "$(git -C "$upstream_basedir" rev-parse --verify HEAD)"
fi

# Make the vendored tree depend on the upstream commit and nothing else.
# igraph's CMake writes `git describe --tags` into igraph_version.h, and git
# sizes the abbreviated commit id in it from the number of objects the clone
# holds, so the same commit vendored from two clones would differ.
git -C "$upstream_dir" config core.abbrev 9

# The version comes from `git describe --tags` in the clone, which answers from
# the history and the tags it can reach; a shallow clone answers wrongly.
if [ "$(git -C "$upstream_dir" rev-parse --is-shallow-repository)" = true ]; then
  echo ""
  echo "=== SHALLOW UPSTREAM CLONE ==="
  echo "$upstream_dir, cloned from $upstream_basedir, is shallow, so"
  echo "'git describe --tags' does not answer what the full history would, and"
  echo "every commit vendored from it would carry a wrong IGRAPH_VERSION."
  echo "  git -C $upstream_basedir fetch --unshallow origin"
  echo "  git -C $upstream_basedir fetch --tags origin"
  echo "Then rerun this script."
  rm -rf "$upstream_dir"
  exit 6
fi
if ! git -C "$upstream_dir" describe --tags HEAD >/dev/null 2>&1; then
  echo ""
  echo "=== NO VERSION IN THE UPSTREAM CLONE ==="
  echo "$upstream_dir, cloned from $upstream_basedir, has no tag that"
  echo "'git describe --tags' can reach, so igraph's CMake cannot say what version"
  echo "it vendors. A clone fetched without tags is the usual cause:"
  echo "  git -C $upstream_basedir fetch --tags origin"
  echo "Then rerun this script."
  rm -rf "$upstream_dir"
  exit 6
fi

if [ -n "$(git status --porcelain)" ]; then
  echo "Error: working directory not clean"
  exit 1
fi

if [ -n "$(git -C "$upstream_dir" status --porcelain)" ]; then
  echo "Warning: working directory $upstream_dir not clean"
fi

start=$(git -C "$upstream_dir" rev-parse --verify HEAD)

# The glue files that failed to compile, one per line, as glue_compiles()
# (scripts/vendor-lib.sh) writes them. Written only by the run that got as far
# as compiling, and read only after that run reported 1 -- so the list a banner
# prints is always the list this check produced, never one an earlier run in
# the same container left behind.
glue_failures=${TMPDIR:-/tmp}/vendor-one-glue-failures.txt

# The upstream SHA the branch has vendored, and the base of the next walk.
# Answering empty is not an option: an empty base makes the range below read
# `..${start}`, whose missing left side git resolves to the upstream clone's
# HEAD -- a range nobody chose, and one that silently vendors the wrong span.
# The same rule, and the same bound, as series_vendored_sha() in
# scripts/series-lib.sh; scripts/vendor.sh has its own copy.
vendored_sha() {
  local subjects sha n
  subjects=$(git log -n "${base_scan_depth}" --format="%s" -- "${series_scan_dir}" | tee /dev/stderr)
  sha=$(sed -rn "$series_sha_sed" <<<"$subjects" | head -n 1)
  if [ -z "$sha" ]; then
    n=$(grep -c . <<<"$subjects" || true)
    echo "Error: no ${repo_org}/${repo_name}@ subject among the newest $n" \
      "${series_scan_dir} commit(s) of $(git rev-parse --abbrev-ref HEAD)" >&2
    if [ "$n" -ge "${base_scan_depth}" ]; then
      echo "  the scan is bounded at ${base_scan_depth}; if that is genuinely too" \
        "shallow, raise BASE_SCAN_DEPTH" >&2
    fi
    return 1
  fi
  echo "$sha"
}

# The tag upstream put on a commit, empty when it has none: `git describe
# --tags` answers a bare tag name only at a tagged commit, and appends
# `-<n>-g<sha>` everywhere else.
exact_tag() { # <upstream commit>
  local d
  d=$(git -C "$upstream_dir" describe --tags "$1" 2>/dev/null) || return 0
  case "$d" in *-*) ;; *) echo "$d" ;; esac
}

commits_vendored=0

while [ $commits_vendored -lt $num_commits ]; do
  echo "=== Vendoring commit $((commits_vendored + 1)) of $num_commits ==="

  # Where the last run left off; re-read every iteration, because each vendored
  # commit moves it.
  if ! base=$(vendored_sha); then
    rm -rf "$upstream_dir"
    exit 1
  fi
  if ! git -C "$upstream_dir" cat-file -e "${base}^{commit}" 2>/dev/null; then
    echo "Error: the clone does not have ${base}, the commit this branch last vendored." >&2
    echo "  It must reach ${series_replay_repo}'s ${series_replay_branch} and ${series_upstream_repo} with its tags." >&2
    rm -rf "$upstream_dir"
    exit 1
  fi

  # Which stretch of the line the branch is on (scripts/series-config.sh):
  # the replay while the base is behind its tip, the seam at the tip, and
  # igraph/igraph after it.
  stretch=upstream
  owner=${series_upstream_repo}
  walk_to=${start}
  if git -C "$upstream_dir" cat-file -e "${series_replay_tip}^{commit}" 2>/dev/null &&
    git -C "$upstream_dir" merge-base --is-ancestor "$base" "$series_replay_tip"; then
    if [ "$(git -C "$upstream_dir" rev-parse "$base")" = "$series_replay_tip" ]; then
      stretch=seam
    else
      stretch=replay
      owner=${series_replay_repo}
      walk_to=${series_replay_tip}
    fi
  fi

  # A tag upstream pushed after `base` was vendored. The walk starts *after*
  # `base`, so it never sees that commit again, and the series keeps a
  # `X.Y.Z-N-g<sha>` stamp for a release. Re-vendor `base` itself with the tag
  # in view, which changes the version stamp and nothing else. It is appended as
  # a commit of its own rather than amended, because the plain one may already
  # be under `-green`, and nothing rewrites that.
  restamp=
  late_tag=$(exact_tag "$base")
  if [ -n "$late_tag" ]; then
    subjects=$(git log -n "${base_scan_depth}" --format="%s" -- "${series_scan_dir}")
    case "$(grep -m 1 -F -- "@${base}" <<<"$subjects" || true)" in
      *"(tag ${late_tag})"*) ;;
      *) restamp=$late_tag ;;
    esac
  fi

  if [ -n "$restamp" ]; then
    echo "Upstream tagged ${base} as ${restamp} after it was vendored; re-stamping it"
    original=$base
  elif [ "$stretch" = seam ]; then
    original=${series_seam}
  else
    original=$(git -C "$upstream_dir" log --first-parent --reverse --format="%H" "${base}".."${walk_to}" --)
  fi

  if [ -z "$original" ]; then
    echo "No more commits to vendor. Done."
    rm -rf "$upstream_dir"
    exit 0
  fi

  # `walk_to` is the clone's HEAD past the seam, so it is the caller who decides
  # which upstream line this buffer continues -- and nothing so far has checked
  # that it is the same line the buffer is already on. The range above excludes
  # what `base` reaches but walks first parents from `walk_to`, so a HEAD on a
  # sibling line yields commits that are not descendants of `base` at all.
  # A contiguous first-parent walk out of `base` starts at a child of `base`, so
  # compare that directly. Off the line, the oldest commit yielded belongs to the
  # other branch, and vendoring it rewrites the tree to whatever that branch
  # carries -- backwards, for a fork whose own line predates the buffer.
  # A re-stamp walks no line: it vendors `base` again, whichever line it is on.
  # The seam is the other deliberate exception: the replay rejoins igraph/igraph
  # there, at a tag whose tree its tip already equals.
  oldest=$(head -n 1 <<<"$original")
  oldest_parent=$(git -C "$upstream_dir" rev-parse --verify "${oldest}^" 2>/dev/null || true)
  if [ -z "$restamp" ] && [ "$stretch" != seam ] &&
    [ "$oldest_parent" != "$(git -C "$upstream_dir" rev-parse --verify "${base}")" ]; then
    echo ""
    echo "=== WRONG UPSTREAM LINE ==="
    echo "The buffer last vendored ${base},"
    echo "which is not on the first-parent line of ${walk_to}"
    echo "($(git -C "$upstream_dir" log -1 --format=%s "$walk_to"))."
    echo "The walk would vendor ${oldest} next, whose first parent is"
    echo "${oldest_parent:-none} -- a different branch, and its tree replaces the"
    echo "buffer's wholesale."
    echo "Check out the upstream branch this series tracks in the clone"
    echo "($upstream_basedir) and rerun."
    rm -rf "$upstream_dir"
    exit 5
  fi

  message=
  is_tag=

  for commit in $original; do
    echo "Importing commit $commit"

    git -C "$upstream_dir" checkout -q "$commit" || {
      echo "Error: Failed to checkout commit $commit"
      rm -rf "$upstream_dir"
      exit 1
    }

    regen_status=0
    series_generate "$upstream_dir" "$([ "$strand" = true ] && echo strand || echo full)" || regen_status=$?
    if [ "$regen_status" = 4 ]; then
      exit 4
    elif [ "$regen_status" != 0 ]; then
      echo ""
      echo "=== GENERATION FAILED for upstream ${commit} ==="
      if [ "$strand" = true ]; then
        echo "CMake, flex or bison failed on the regenerated tree,"
        echo "which is in the working tree, uncommitted; the upstream clone is kept."
        echo "Check that the three are installed. A change upstream that they cannot"
        echo "take needs a patch/ entry, which rides on the strand: keep it outside the tree,"
      else
        echo "CMake, Stimulus or cpp11::cpp_register() failed on the regenerated tree,"
        echo "which is in the working tree, uncommitted; the upstream clone is kept."
        echo "Most often an interface changed upstream: adapt tools/stimulus/*.yaml"
        echo "or add a patch/ entry, keeping the fix outside the tree,"
      fi
      echo "then 'git checkout -- . && git clean -fd src R', put it back, and land it"
      echo "with the vendor commit for ${commit} like this:"
      echo "  git commit -m 'tmp: fix generation' -- <the fix>"
      echo "  $0$([ "$strand" = true ] && echo ' --strand') --commits 1 <upstream>"
      echo "  { git log -1 --format=%B; printf '\\nR-side fix:\\n\\n%s\\n' '<what was adapted>'; } >../vendor.msg"
      echo "  git reset --soft HEAD~2 && git commit -q -F ../vendor.msg"
      exit 7
    fi

    # Always vendor tags
    tag=$(exact_tag "$commit")
    if [ -n "$tag" ]; then
      message="vendor: Update vendored sources (tag ${tag}) to ${owner}@$commit"
      is_tag=true
      break
    fi

    # The engine file always differs, so "more than one" is the test for a
    # real change, over the directory holding the tree and the stamp.
    if [ "$(git status --porcelain -- "${series_scan_dir}" | wc -l)" -gt 1 ]; then
      message="vendor: Update vendored sources to ${owner}@$commit"
      break
    fi
  done

  if [ "$message" = "" ]; then
    echo "No changes found. Done."
    # Nothing was vendored, so leave the tree exactly as the run found it.
    # Regeneration rewrites R/aaa-*.R, src/rinterface.c, src/cpp11.cpp and the
    # src/*.mk files for every candidate it tries, not just ${vendor_dir}, and
    # any leftover would make the next run refuse on a dirty tree.
    # Restoring everything is safe because the run refused to start on one:
    # anything untracked here was created by this run. The clone is ignored,
    # so `git clean` leaves it for `rm -rf` below to remove deliberately.
    git checkout -- .
    git clean -fd
    rm -rf "$upstream_dir"
    exit 0
  fi

  version=$(sed -r -n '/^Version: (.*)$/ s//\1/p' DESCRIPTION)
  version_array=(${version//./ })
  for i in {0..4}; do
    if [ -z "${version_array[i]}" ]; then
      version_array[i]=0
    fi
  done
  version_array[4]=$((version_array[4] + 1))
  new_version=$(IFS=.; echo "${version_array[*]}")

  if [ "$strand" = true ]; then
    echo "Strand commit: the counter stays at $version"
  else
    echo "Updating version from $version to $new_version"
    sed -i.bak -r 's/^(Version: ).*$/\1'"$new_version"'/' DESCRIPTION
    rm DESCRIPTION.bak
  fi

  if [ "$strand" = true ]; then
    # The strand's paths and nothing else; what the generator wrote beyond them
    # is restored after the commit (scripts/series-config.sh).
    git add -A -- "${series_vendor_paths[@]}"
  else
    git add .
  fi

  (
    echo "$message"
    echo
    git -C "$upstream_dir" log -1 --format="Date: %ai" "${commit}"
    echo
    if [ -n "$restamp" ]; then
      echo "Upstream tagged ${restamp} after this commit was vendored,"
      echo "so the earlier vendor commit for it stamps a version past the previous tag;"
      echo "this one differs from it only in the version stamp."
    fi
    if [ "$stretch" = seam ] && [ -z "$restamp" ]; then
      echo "The replay of igraph 0.10.17 to 1.0.1, ${series_replay_repo}@${base},"
      echo "ends here: its tree equals this tag's in src/, include/, vendor/ and tests/."
      echo "From here on this line walks ${series_upstream_repo}'s first-parent history."
    else
      git -C "$upstream_dir" log --first-parent --format="%s" "${base}".."${commit}" |
        tee /dev/stderr |
        sed -r 's%#([0-9]+)%https://redirect.github.com/'"${owner}"'/pull/\1%g'
    fi
  ) | git commit --file /dev/stdin || {
    echo "Error: Failed to commit changes"
    rm -rf "$upstream_dir"
    exit 1
  }
  if [ "$strand" = true ]; then
    git checkout -q -- .
    git clean -fdq
  fi

  commits_vendored=$((commits_vendored + 1))

  echo "Successfully vendored commit $commits_vendored"

  if [ "$check_glue" = true ]; then
    # Not `! glue_compiles`, which would collapse "the check could not run" into
    # "the glue is broken" and send the operator to fix code that compiles.
    glue_status=0
    glue_compiles "$glue_failures" || glue_status=$?
    if [ "$glue_status" = 2 ]; then
      echo ""
      echo "=== GLUE CHECK COULD NOT RUN at $(git rev-parse --short HEAD) (upstream ${commit}) ==="
      echo "Deriving the compile flags needs the Makevars ./configure completes${series_configured_file:+ ($series_configured_file)};"
      echo "reaching this means ./configure failed. Nothing"
      echo "was compiled, so this says nothing about the glue or about the commit"
      echo "at HEAD -- do not amend it."
      echo "Run ./configure and read its output, then rerun this script;"
      echo "--no-check-glue skips the check altogether."
      # Its own code, below the ones already spoken for: 3 is broken glue, 4 a
      # broken patch, 5 the wrong upstream line, 6 a clone that cannot name a
      # version. 7 is left free for a generator that fails before the commit,
      # which a repository whose vendoring runs one takes, so the two stay in
      # step (handbook/operations/vendoring/troubleshooting/README.md).
      exit 8
    elif [ "$glue_status" != 0 ]; then
      echo ""
      echo "=== GLUE BROKEN by $(git rev-parse --short HEAD) (upstream ${commit}) ==="
      echo "Files: $(tr '\n' ' ' < "$glue_failures")"
      echo "The breaking vendor commit is at HEAD and the upstream clone is kept."
      echo "Fix the glue (or tools/stimulus, then regenerate), amend into HEAD"
      echo "appending an 'R-side fix' section to the message, then rerun this script."
      exit 3
    fi
  fi

  if [ -n "${is_tag}" ]; then
    echo "Vendored a tag. Stopping."
    rm -rf "$upstream_dir"
    exit 0
  fi
done

echo "Successfully vendored $commits_vendored commit(s)"
rm -rf "$upstream_dir"
