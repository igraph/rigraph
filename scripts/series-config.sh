# shellcheck shell=bash
# shellcheck disable=SC2034  # read by the scripts that source series-lib.sh and vendor-lib.sh
# What this repository tells the series tooling about the engine it vendors,
# and nothing else.
#
# Every scripts/series-*.sh that reads the engine, scripts/vendor-one.sh and
# scripts/each-plan.sh read its names from here, through scripts/series-lib.sh
# or scripts/vendor-lib.sh, and from nowhere else; scripts/vendor.sh, the
# manual bulk vendoring, keeps its own copy. A repository that vendors another
# engine commit by commit changes this file and keeps the scripts
# (handbook/operations/vendoring/series-loop/README.md). Paths are relative to
# the repository root, each one a directory, a file, or a shell glob over
# either (`R/aaa-*.R`), read the same way whether a script compares it or
# hands it to git as a pathspec.

# The upstream repository, as a vendor subject names it: `vendor: Update
# vendored sources to <owner>/<repo>@<sha>`. The three spellings of the marker
# follow from it and are kept in step by hand, because bash has no one syntax
# that serves `case`, `grep -E` and `sed -r` alike. A repository whose history
# names more than one owner for the same upstream writes a pattern that accepts
# each.
series_upstream_repo=duckdb/duckdb
series_vendor_glob='*duckdb/duckdb@[0-9a-f]*'
series_marker_ere='duckdb/duckdb@[0-9a-f]+'
series_sha_sed='s|^.*duckdb/duckdb@([0-9a-f]+).*$|\1|p'

# The vendored tree, and the pathspec that narrows a walk for vendor commits.
# The two are one directory here because the version stamp a vendor commit
# writes lives inside the vendored tree. A repository whose stamp sits beside
# the tree names the directory holding both, or a vendor commit that changes
# the stamp alone is invisible to the walk.
series_vendor_dir=src/duckdb
series_scan_dir=src/duckdb

# The vendored strand a rewinding replay takes whole: the engine's tree, the
# patch stack applied to it, and the files generated from nothing but that tree
# (scripts/series-forward-build.sh). The Makevars are generated as well, but
# from `src/Makevars.in`, which is `main`'s, so they travel as a diff.
series_strand=(src/duckdb patch R/version.R src/include/sources.mk)
series_makevars=(src/Makevars src/Makevars.win)

# What vendoring regenerates, which differs between any two vendor runs of the
# same upstream commit and is never carried as a fix (scripts/series-advance.sh):
# files, and directories.
series_regenerated=(R/version.R src/include/sources.mk src/Makevars src/Makevars.win src/Makevars.in)
series_regenerated_dirs=(man/figures)

# The tooling `main` owns, ported onto every series by stage 4 and never carried
# sideways (scripts/series-port.sh).
series_tooling=(.github scripts .claude)

# The glue: what stage 2 mines and a forward replays (scripts/series-glue.sh).
series_glue=(src R NAMESPACE)

# The glue gate (scripts/vendor-lib.sh) reads the compiler and the flags off the
# compile line `R CMD SHLIB -n` prints for each probe, and checks every `src/`
# file of the probe's extension with them: one probe per language the glue is
# written in. The line comes from the Makevars, which include what `./configure`
# writes; the gate runs `./configure` where the file named here is missing, and
# on every call where none is named. `R CMD SHLIB` omits the include paths of a
# `LinkingTo` package, which `R CMD INSTALL` passes as CLINK_CPPFLAGS; a
# repository that links to one prints them from the function, once per gate:
# `Rscript -e 'cat("-I", system.file("include", package = "cpp11"), sep = "")'`.
# This repository vendors cpp11 under `src/` and needs none.
series_glue_probes=(cpp11.cpp)
series_configured_file=src/Makevars.rstrtmgr
series_glue_extra_flags() { :; }

# The engine a tree vendors, as the tree itself records it: the abbreviated
# upstream SHA. Read from the tree rather than from a subject because the
# commits that matter where this is read, a seed and a graft, vendor nothing
# and name no SHA.
series_engine_file=src/duckdb/src/function/table/version/pragma_version.cpp
series_engine_of() { # <tree-ish> -> the abbreviated upstream SHA, empty when none
  git show "$1:$series_engine_file" 2>/dev/null |
    sed -rn 's/^#define DUCKDB_SOURCE_ID "([0-9a-f]+)"$/\1/p'
}

# The version a tree stamps for the engine it vendors, as the package reads it.
series_stamp_file=R/version.R
series_stamped_version() { # <tree-ish> -> the version, empty when none
  { git show "$1:$series_stamp_file" 2>/dev/null || true; } |
    sed -nE 's/^duckdb_version <- "(.*)"$/\1/p'
}

# The release a development stamp precedes, `X.Y.Z` for `X.Y.Z-devN`, and
# nothing for a stamp that is a release already. What series-check.sh reads to
# ask whether upstream has tagged a commit the buffer vendored before the tag.
# Optional: an engine whose stamp names no release it precedes (a `git
# describe` form follows one) leaves it undefined, and series-check.sh asks the
# newest vendor commits against the tags instead.
series_release_of_stamp() { # <version> -> the release it precedes, or empty
  sed -nr 's/^([0-9]+\.[0-9]+\.[0-9]+)-dev[0-9]+$/\1/p' <<<"$1"
}

# Upstream's release tags and release branches, as globs over the bare names,
# and the tag a release's version is spelled as.
series_tag_glob='v*'
series_branch_glob='v*'
series_tag_of_release() { # <X.Y.Z> -> the tag
  echo "v$1"
}

# The package as `main` publishes it, which every flavor renames
# (scripts/flavor.sh), and the repository `main` lives in.
series_package=duckdb
series_canonical_repo=duckdb/duckdb-r

# Does the engine version $1 predate the version $2? The reading
# `engine_before()` in tests/testthat/helper-skip.R makes, so an engine gate
# expires in the scripts where it expires in the suite: a release never
# predates anything, nor does a string that is not a version, and a development
# snapshot `X.Y.Z-devN` precedes the release `X.Y.Z`. The ordering is this
# engine's. Another engine's `git describe` form, `X.Y.Z-N-g<sha>`, follows its
# release instead, and a repository vendoring one writes that ordering here.
series_version_before() { # <engine> <version>
  local re='^([0-9]+)\.([0-9]+)\.([0-9]+)(-dev([0-9]+))?$' i
  local -a engine version
  [[ $1 =~ $re ]] || return 1
  [ -n "${BASH_REMATCH[4]}" ] || return 1
  engine=("${BASH_REMATCH[1]}" "${BASH_REMATCH[2]}" "${BASH_REMATCH[3]}" "${BASH_REMATCH[5]}")
  [[ $2 =~ $re ]] || return 1
  version=("${BASH_REMATCH[1]}" "${BASH_REMATCH[2]}" "${BASH_REMATCH[3]}" "${BASH_REMATCH[5]:-999999999999}")
  for i in 0 1 2 3; do
    ((10#${engine[i]} < 10#${version[i]})) && return 0
    ((10#${engine[i]} > 10#${version[i]})) && return 1
  done
  return 1
}

# The seed: the commit scripts/flavor.sh's commits are topped with, which every
# series stands on above its `main` (.claude/skills/series-forward/SKILL.md).
# The subject is the anchor every seed-relative walk reads.
series_seed_subject='chore: Add fifth version component'

# The estimator scripts/each-plan.sh weighs commits with: a command whose `map`
# and `batch` forms print the unity objects a commit invalidates
# (scripts/each-cost.py). A repository without an include graph worth reading
# names a command that answers a constant weight.
series_cost_estimator=(python3 "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/each-cost.py")
