#!/bin/bash
# Vendors DuckDB sources commit-by-commit from the upstream repository.
# Used by the series loop (.claude/skills/series-loop/SKILL.md).
# See scripts/VENDORING.md for complete documentation
#
# https://unix.stackexchange.com/a/654932/19205
# Using bash for -o pipefail

set -e
set -x
set -o pipefail

# The checkout to vendor into, so the series loop can run `main`'s copy of this
# script against another worktree. Only *this* script comes from `main` that
# way: everything it invokes by relative path -- `scripts/rconfigure.py`,
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
  # Update existing clone, and put its HEAD back where the source's is.
  #
  # `start` below is the clone's HEAD, and the walk checks out every commit it
  # vendors -- so a clone this script left behind points at the last commit it
  # touched, not at the tip it was cloned from. The glue gate exits with the
  # clone deliberately kept ("rerun this script"), and that rerun read the
  # stopped-on commit as `start`: an empty range, "No more commits to vendor",
  # and a walk silently truncated at the commit the gate stopped on. Observed on
  # the 2026-08-02 main-build rebuild, which reported done with 19 upstream
  # commits still unvendored.
  #
  # The source is the authority on what to vendor up to, so re-read it rather
  # than trusting a HEAD this script itself moved. A detached source HEAD (the
  # series loop hands us a worktree) has no branch to name, which is why this
  # resolves a SHA rather than checking out a ref.
  git -C "$upstream_dir" fetch origin
  git -C "$upstream_dir" checkout -q --detach \
    "$(git -C "$upstream_basedir" rev-parse --verify HEAD)"
fi

# Make the vendored tree depend on the upstream commit and nothing else.
# `DUCKDB_SOURCE_ID` in pragma_version.cpp comes from upstream's
# `git describe --tags --long`, run inside this clone, and git auto-sizes that
# abbreviation from the number of objects the repository holds -- so the same
# commit vendored twice, from clones that have grown apart, writes two different
# strings and two different trees, and re-vendoring a commit to reproduce a
# failure does not reproduce the tree. Set on every run, not only on the clone,
# because the clone may be one someone else made (CI checks upstream out here).
# Ten is DuckDB's own length: its CMake truncates the id to ten characters in
# the built library, which is what ./configure's commit-match guard compares
# against.
git -C "$upstream_dir" config core.abbrev 10

# The version stamp comes from the same clone, and a clone without versioning
# tags stamps a placeholder instead of failing. Upstream's
# `package_build.get_git_describe()` -- which rconfigure.py reaches through
# `build_package()` -- catches the `git describe` failure and answers
# `v0.0.0-0-gdeadbeeff`, so `DUCKDB_VERSION` becomes `v0.0.0` and the tree
# builds, installs and passes the glue gate. What it does not do is load an
# extension: every download then asks
# extensions.duckdb.org/v0.0.0/<platform>/<name>.duckdb_extension.gz and gets
# an HTTP 404, which surfaces a whole CI cycle later as a test failure that
# looks like the engine's.
#
# A shallow clone is the condition the placeholder below was only ever a proxy
# for, and it is the half that still holds on every branch: refuse it directly.
# The clone is the tree the version is read from, so ask it rather than the
# source -- `git clone` of a shallow repository is shallow, and CI checks
# upstream out in `$upstream_dir` itself.
if [ "$(git -C "$upstream_dir" rev-parse --is-shallow-repository)" = true ]; then
  echo ""
  echo "=== SHALLOW UPSTREAM CLONE ==="
  echo "$upstream_dir, cloned from $upstream_basedir, is shallow, so neither"
  echo "'git describe --tags' nor 'git rev-list --count HEAD' answers what the"
  echo "full history would, and every commit vendored from it would carry a"
  echo "DUCKDB_VERSION no extension repository has a directory for."
  echo "  git -C $upstream_basedir fetch --unshallow origin"
  echo "  git -C $upstream_basedir fetch --tags origin"
  echo "Then rerun this script."
  rm -rf "$upstream_dir"
  exit 6
fi

# Ask upstream's own resolver rather than reimplementing its tag match, which
# depends on MAIN_BRANCH_VERSIONING and is upstream's to change.
#
# Upstream keeps the resolver under two names: `get_git_describe()` on the
# release branches, and `git_dev_version()` on `main`, which stopped describing
# tags at all and composes `scripts/ci/release_version.txt` with the commit
# count instead. Importing one name by itself made the probe raise on `main`
# and answer empty, so the guard below stopped guarding the busiest series --
# silently, behind a warning that fired on every vendor run.
#
# The probe is still allowed to fail -- upstream owns that file and may move it
# again -- and says so rather than refusing, because only the placeholder is
# evidence.
upstream_describe=$(cd "$upstream_dir" && python3 -c \
  'import sys; sys.path.insert(0, "scripts"); import package_build
for name in ("get_git_describe", "git_dev_version"):
    fn = getattr(package_build, name, None)
    if fn is not None:
        print(fn())
        break' \
  2>/dev/null) || upstream_describe=
if [ -z "$upstream_describe" ]; then
  echo "Warning: could not read the version $upstream_dir would stamp" >&2
fi
if [ "$upstream_describe" = "v0.0.0-0-gdeadbeeff" ]; then
  echo ""
  echo "=== NO VERSION IN THE UPSTREAM CLONE ==="
  echo "$upstream_dir, cloned from $upstream_basedir, has no versioning tag that"
  echo "'git describe' can reach, so every commit vendored from it would carry"
  echo "DUCKDB_VERSION \"v0.0.0\" and fail to install any extension."
  echo "A clone fetched without tags is the usual cause:"
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
glue_failures=/tmp/vendor-one-glue-failures.txt

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

  # A tag upstream pushed after `base` was vendored. The walk starts *after*
  # `base`, so it never sees that commit again, and the series keeps a `-devNNN`
  # stamp for a release: DUCKDB_VERSION then carries `-dev`, and the engine
  # installs extensions from the source-id directory instead of `/vX.Y.Z/`.
  # Observed for v1.5.6 on 2026-09-28. Re-vendor `base` itself with the tag in
  # view, which changes the version stamp and nothing else. It is appended as a
  # commit of its own rather than amended, because the plain one may already be
  # under `-green`, and nothing rewrites that (scripts/VENDORING.md).
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
  else
    original=$(git -C "$upstream_dir" log --first-parent --reverse --format="%H" "${base}".."${start}" --)
  fi

  if [ -z "$original" ]; then
    echo "No more commits to vendor. Done."
    rm -rf "$upstream_dir"
    exit 0
  fi

  # `start` is the clone's HEAD, so it is the caller who decides which upstream
  # line this buffer continues -- and nothing so far has checked that it is the
  # same line the buffer is already on. The range above excludes what `base`
  # reaches but walks first parents from `start`, so a `start` on a sibling line
  # yields commits that are not descendants of `base` at all. Ancestry is not
  # the test: a fork branch that merged upstream has `base` behind it and passes
  # it while its first-parent line is somewhere else entirely.
  #
  # A contiguous first-parent walk out of `base` starts at a child of `base`, so
  # compare that directly. Off the line, the oldest commit yielded belongs to the
  # other branch, and vendoring it rewrites the tree to whatever that branch
  # carries -- backwards, for a fork whose own line predates the buffer.
  # A re-stamp walks no line: it vendors `base` again, whichever line it is on.
  oldest=$(head -n 1 <<<"$original")
  oldest_parent=$(git -C "$upstream_dir" rev-parse --verify "${oldest}^" 2>/dev/null || true)
  if [ -z "$restamp" ] &&
    [ "$oldest_parent" != "$(git -C "$upstream_dir" rev-parse --verify "${base}")" ]; then
    echo ""
    echo "=== WRONG UPSTREAM LINE ==="
    echo "The buffer last vendored ${base},"
    echo "which is not on the first-parent line of the clone's HEAD ${start}"
    echo "($(git -C "$upstream_dir" log -1 --format=%s "$start"))."
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

    git -C "$upstream_dir" checkout "$commit" || {
      echo "Error: Failed to checkout commit $commit"
      rm -rf "$upstream_dir"
      exit 1
    }

    # The tree is not deleted here: rconfigure.py moves it aside itself and puts
    # back the inode of every regenerated file that did not change, so a file
    # whose content is the same keeps its stat cache entry and every later git
    # command over ~3550 files stays cheap -- which this loop pays twice per
    # candidate, kept or skipped. Files upstream dropped still go: they are in
    # the tree that was moved aside, and never come back from it.
    echo "R: configure"
    DUCKDB_PATH="$upstream_dir" python3 scripts/rconfigure.py || {
      echo "Error: Failed to configure"
      rm -rf "$upstream_dir"
      exit 1
    }

    # `--reverse` needs `--forward` beside it: on its own it prompts
    # ("Unreversed patch detected!  Ignore -R? [n]") and hangs a run whose
    # stdin is a terminal.
    # scripts/vendor.sh has the same three-way split and the same exit 4.
    for f in patch/*.patch; do
      if patch -i "$f" -p1 --forward --dry-run; then
        patch -i "$f" -p1 --forward --no-backup-if-mismatch
      elif patch -i "$f" -p1 --reverse --forward --dry-run; then
        echo "Removing patch $f (its change is already in the regenerated tree)"
        rm "$f"
      else
        echo ""
        echo "=== PATCH BROKEN: $f (upstream ${commit}) ==="
        echo "It neither applies forward nor reverses cleanly, so its change is"
        echo "not in the regenerated tree and cannot be re-applied: the code it"
        echo "patches moved."
        echo "The regenerated sources for ${commit} are in the working tree,"
        echo "uncommitted, and the upstream clone is kept."
        echo "Rebase $f against them, keeping the rebased patch outside the tree,"
        echo "then 'git checkout -- .', put it back, and rerun this script."
        echo "Delete it only after confirming its change is genuinely upstream --"
        echo "the effect it had, however upstream reached it, not this diff."
        echo "A deletion has to ride in the vendor commit for ${commit}, and this"
        echo "script refuses to start on a dirty tree, so land it in three steps:"
        echo "  git checkout -- . && git rm $f && git commit -m 'tmp: retire patch'"
        echo "  $0 --commits 1 <upstream>"
        echo "  git reset --soft HEAD~2 && git commit   # keep the vendor message,"
        echo "                                          # add an 'R-side fix' section"
        exit 4
      fi
    done

    # Always vendor tags
    tag=$(exact_tag "$commit")
    if [ -n "$tag" ]; then
      message="vendor: Update vendored sources (tag ${tag}) to ${repo_org}/${repo_name}@$commit"
      is_tag=true
      break
    fi

    # The engine file always differs, so "more than one" is the test for a
    # real change, over the directory holding the tree and the stamp.
    if [ "$(git status --porcelain -- "${series_scan_dir}" | wc -l)" -gt 1 ]; then
      message="vendor: Update vendored sources to ${repo_org}/${repo_name}@$commit"
      break
    fi
  done

  if [ "$message" = "" ]; then
    echo "No changes found. Done."
    # Nothing was vendored, so leave the tree exactly as the run found it.
    # rconfigure.py rewrites R/version.R, src/Makevars, src/Makevars.win and
    # src/include/sources.mk for every candidate it tries, not just ${vendor_dir},
    # and any leftover of those would make the next run refuse on a dirty tree.
    # Restoring everything is safe because the run refused to start on one:
    # anything untracked here was created by this run. The clone is ignored,
    # so `git clean` leaves it for `rm -rf` below to remove deliberately.
    git checkout -- .
    git clean -fd
    rm -rf "$upstream_dir"
    exit 0
  fi

  our_tag=$(git describe --tags --abbrev=0 | sed -r 's/-[0-9]$//')
  upstream_tag=$(git -C "$upstream_dir" describe --tags --abbrev=0)

  if [ "$our_tag" = "v1.3.3" ]; then
    # Inofficial release v1.3.3
    our_tag="v1.3.2"
  fi

  echo "Our tag: $our_tag"
  echo "Upstream tag: $upstream_tag"

  version=$(sed -r -n '/^Version: (.*)$/ s//\1/p' DESCRIPTION)
  version_array=(${version//./ })
  for i in {0..4}; do
    if [ -z "${version_array[i]}" ]; then
      version_array[i]=0
    fi
  done
  version_array[4]=$((version_array[4] + 1))
  new_version=$(IFS=.; echo "${version_array[*]}")

  echo "Updating version from $version to $new_version"
  sed -i.bak -r 's/^(Version: ).*$/\1'"$new_version"'/' DESCRIPTION
  rm DESCRIPTION.bak

  git add .

  (
    echo "$message"
    echo
    git -C "$upstream_dir" log -1 --format="Date: %ai" "${commit}"
    echo
    if [ -n "$restamp" ]; then
      echo "Upstream tagged ${restamp} after this commit was vendored,"
      echo "so the earlier vendor commit for it stamps a -dev version;"
      echo "this one differs from it only in the version stamp."
    fi
    git -C "$upstream_dir" log --first-parent --format="%s" "${base}".."${commit}" |
      tee /dev/stderr |
      sed -r 's%#([0-9]+)%https://redirect.github.com/'${repo_org}/${repo_name}'/pull/\1%g'
  ) | git commit --file /dev/stdin || {
    echo "Error: Failed to commit changes"
    rm -rf "$upstream_dir"
    exit 1
  }

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
      echo "Fix the glue, run clang-format, amend into HEAD appending an"
      echo "'R-side fix' section to the message, then rerun this script."
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
