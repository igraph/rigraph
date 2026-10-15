#!/bin/bash
# Apply a package flavor: rewrite scripts/flavor.patch to the target name
# (say, igraph.dev), apply it, and commit the rename. What the patch rewrites is
# the rename surface, and scripts/flavor-package-name.R is the guard that keeps
# the package name from being written anywhere else.
#
# The whole rename is prepared and checked before anything is committed, and a
# failure at any point restores the tree to where the run started. A flavor is
# the foot of a branch -- everything built above it carries the names it
# writes -- so a half-applied one is worse than none at all.

set -euxo pipefail

cd "$(dirname "$0")/.."

package_name="${1-}"
if [ -z "$package_name" ]; then
  echo "Usage: $0 <flavor>, the part of the package name after 'igraph.'"
  echo "  $0 1.5"
  echo "  $0 1.5.dev"
  echo "  $0 dev"
  exit 1
fi
# The template prefixes the flavor itself, so a whole package name here would
# write `igraph.igraph.dev` through every file the patch renames.
case "$package_name" in
igraph | igraph.*)
  echo "$0: give the flavor without the 'igraph.' prefix, e.g. '$0 dev' for igraph.dev." >&2
  exit 1
  ;;
esac

# GNU sed, wherever it is called: on Linux that is `sed`, on macOS it is `gsed`
# and the system `sed` is BSD. Prefer `gsed`, then verify -- silently accepting
# BSD sed would write a subtly wrong patch that the commit below then records.
if command -v gsed >/dev/null 2>&1; then
  gnu_sed=gsed
else
  gnu_sed=sed
fi
sed_version="$("$gnu_sed" --version 2>/dev/null || true)"
case "$sed_version" in
*"GNU sed"*) ;;
*)
  echo "$0: '$gnu_sed' is not GNU sed." >&2
  echo "  Install GNU sed as 'gsed' -- on macOS, 'brew install gnu-sed'." >&2
  exit 1
  ;;
esac

# Nothing this run writes is distinguishable from a change that was already
# there, so the restore below can only promise to undo its own work.
if [ -n "$(git status --porcelain)" ]; then
  echo "$0: the working tree is not clean; commit or stash first." >&2
  exit 1
fi

start=$(git rev-parse HEAD)
committed=

# Undo everything, unless the two commits at the end were both reached.
# Resetting to the branch's own tip moves no ref: the commits are the last
# thing the run does, so this either drops working-tree changes or drops the
# first commit after the second one failed. `git clean` without -x leaves
# ignored build products alone, and the check above is what makes the
# untracked files it does remove this run's.
restore() {
  if [ -n "$committed" ]; then
    return 0
  fi
  echo "$0: nothing committed; restoring the tree to $start" >&2
  git reset -q --hard "$start"
  git clean -qfd
}
trap restore EXIT

# The patch file spells the flavor suffix 1.3, dot-separated in package names
# and underscore-separated in file names.
"$gnu_sed" -i \
  -e "s/igraph\.1\.3/igraph.$package_name/g" \
  -e "s/igraph_1_3/igraph_${package_name//./_}/g" \
  scripts/flavor.patch

# Updates to man/ and NAMESPACE are handled in the patch file for efficiency
patch -p1 < scripts/flavor.patch

# The `.dd` files name the types header the patch renames, and they are not in
# the patch. `src/deps.mk` includes them, so a name the tree no longer carries
# stops every in-place build before the first compile with "No rule to make
# target 'igraph_types.hpp', needed by 'cpp11.o'". Rewrite rather than patch,
# for the reason the generated files are regenerated.
"$gnu_sed" -i -E \
  "s/\\bigraph(_[A-Za-z0-9_]+)?_types\\.hpp\\b/igraph_${package_name//./_}_types.hpp/g" \
  src/*.dd

R -q -e 'cpp11::cpp_register()'

# Avoid storing .orig files
git clean -f -- "*.orig"

# cpp11 derives the .Call prefix from `Package:`, replacing dots with
# underscores -- but CRAN's cpp11 replaces only the first, which is enough for
# `igraph.dev` and not for a flavor carrying two: that comes out of it as
# `_igraph_2.0.dev_getsphere`, and without the renamed types header, which
# `cpp_register()` looks up under the same half-replaced name. The compiler is
# the next thing that would see it. The fork at krlmlr/cpp11 replaces every dot.
if grep -qE '^extern "C" SEXP [A-Za-z_][A-Za-z0-9_]*\.' src/cpp11.cpp; then
  echo "$0: cpp11::cpp_register() wrote entry points that are not C identifiers:" >&2
  grep -E '^extern "C" SEXP [A-Za-z_][A-Za-z0-9_]*\.' src/cpp11.cpp | head -n 3 >&2
  echo "  Install the fork -- R -q -e 'install.packages(\"cpp11\", repos = c(\"https://krlmlr.r-universe.dev\", getOption(\"repos\")))'" >&2
  exit 1
fi

# Two commits, and the flavor patch is its own so the rename it drives can be
# read against it.
git add scripts/flavor.patch
git commit -m "chore: Update flavor patch to $package_name"
git add -A
git commit -m "chore: Update version to $package_name"
committed=1
