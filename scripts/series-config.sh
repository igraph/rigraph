# shellcheck shell=bash
# shellcheck disable=SC2034  # read by the scripts that source series-lib.sh and vendor-lib.sh
# What this repository tells the series tooling about the engine it vendors,
# and nothing else.
#
# Every scripts/series-*.sh that reads the engine, scripts/vendor-one.sh and
# scripts/each-plan.sh read its names from here, through scripts/series-lib.sh
# or scripts/vendor-lib.sh, and from nowhere else; scripts/vendor.sh, the
# manual vendoring, reads them too. Paths are relative to the repository root,
# each one a directory, a file, or a shell glob over either (`R/aaa-*.R`), read
# the same way whether a script compares it or hands it to git as a pathspec.
# Vendoring here regenerates families of files that grow with upstream, so
# globs name them.
#
# The tooling is ported from duckdb/duckdb-r (.series-source records from where),
# whose copy of this file names DuckDB. This one is most of the rigraph layer
# over the scripts, so a resync touches the scripts and leaves the facts below
# alone. The names duckdb-r's copy has and this one lacks belong to scripts that
# are not ported, `series_glue` (series-glue.sh) and `series_engine_of`
# (series-alpha.sh), or are optional, `series_release_of_stamp` (below).

# The upstream repository, as a vendor subject names it:
#   vendor: Update vendored sources to <owner>/igraph@<sha>
#   vendor: Update vendored sources (tag <tag>) to <owner>/igraph@<sha>
# and that subject is machine-readable state: it is how every script finds where
# a branch stands in upstream history. The three spellings of the marker are
# kept in step by hand, because bash has no one syntax that serves `case`,
# `grep -E` and `sed -r` alike.
# The owner is the repository the SHA lives in. The replay of igraph 0.10.17 to 1.0.1
# was rebuilt commit by commit in krlmlr/igraph, so its commits name krlmlr/igraph;
# everything vendored from igraph/igraph names igraph/igraph. One history carries
# both, so every pattern here accepts any owner and the SHA alone decides.
series_upstream_repo=igraph/igraph
series_vendor_glob='*/igraph@[0-9a-f]*'
series_marker_ere='[A-Za-z0-9_.-]+/igraph@[0-9a-f]+'
series_sha_sed='s|^.*[A-Za-z0-9_.-]+/igraph@([0-9a-f]+).*$|\1|p'

# The upstream line, in two stretches joined at one seam.
# Up to series_replay_tip, the series walks the replay of igraph 0.10.17 to 1.0.1,
# whose tree at its tip equals 1.0.1 in src/, include/, vendor/ and tests/;
# its commits exist only in krlmlr/igraph.
# A branch whose newest vendored SHA is the replay tip vendors series_seam next,
# tag 1.0.1, as the one vendor commit that moves the line onto igraph/igraph;
# from there it walks igraph/igraph's first-parent history from the clone's HEAD.
# scripts/vendor-one.sh decides which stretch it is on from the ancestry of the
# newest vendored SHA, so nothing here changes when the seam has been crossed.
series_replay_repo=krlmlr/igraph
series_replay_branch=replay-1.0.1
series_replay_tip=3c54c752e63b96c0f0e81564a8f9fda3b8890919
series_seam=7b4ae766cbdee6b2017aa5b76752457db2a2972f

# The vendored tree, and the pathspec that narrows a walk for vendor commits.
# The two are apart here: the version stamp a vendor commit writes,
# src/vendor/igraph_version.h, sits beside the tree, and a vendor commit for a
# tag changes nothing else, so the walk names the directory holding both.
series_vendor_dir=src/vendor/cigraph
series_scan_dir=src/vendor

# What vendoring keeps of an upstream tree: what the build, Stimulus and the licence need,
# and the contributor credits, including the all-contributors table and the
# configuration it is generated from, which patch/ corrects.
# Everything else upstream carries (documentation, CI, changelogs, the replay's
# own tooling) never reaches the package (series_generate_tree(), below).
series_keep=(src include vendor interfaces AUTHORS COPYING ACKNOWLEDGEMENTS.md CONTRIBUTORS.txt
  CONTRIBUTORS.md .all-contributorsrc)

# The vendored strand a rewinding replay takes whole: the engine's tree, the
# patch stack applied to it, and the files generated from nothing but that tree
# (scripts/series-forward-build.sh).
# The R/C interface, the cpp11 registration and the glue's source lists are
# generated as well, but from tools/stimulus/ and the glue, which are `main`'s,
# so they travel as a diff; a landing reviews them with the strand
# (scripts/series-land.sh). duckdb-r's are its Makevars, hence the name.
series_strand=(src/vendor/cigraph src/vendor/igraph_version.h src/vendor/igraph_threading.h
  src/vendor/io patch src/sources-igraph.mk src/sources-glpk.mk src/sources-mini-gmp.mk)
series_makevars=(src/rinterface.c 'R/aaa-*.R' src/cpp11.cpp R/cpp11.R
  src/sources-glue-c.mk src/sources-glue-cpp.mk)

# How vendoring regenerates the tree from an upstream checkout, in two phases
# around the patch stack (scripts/vendor-one.sh, scripts/vendor.sh): the tree
# first, then the patches applied to it, then what is derived from the patched
# tree, which Stimulus and the parsers read. The second phase is told whether
# it writes a strand commit, the vendor paths alone, or a whole buffer commit.
# Whatever a `strand` run writes outside the vendor paths is restored, never
# committed. A failing phase stops the run with exit 7.
#
# The tree is the kept part of the upstream tree and the version header igraph's
# CMake writes from `git describe --tags`, which needs the checkout alone.
series_generate_tree() { # <upstream checkout>
  local keep=() p build=${TMPDIR:-/tmp}/vendor-cmake-$$
  rm -rf "$series_vendor_dir"
  mkdir -p "$series_vendor_dir"
  for p in "${series_keep[@]}"; do
    if git -C "$1" cat-file -e "HEAD:$p" 2>/dev/null; then
      keep+=("$p")
    fi
  done
  git -C "$1" archive HEAD -- "${keep[@]}" | tar -x -C "$series_vendor_dir"
  rm -rf "$build"
  cmake -S "$1" -B "$build" >/dev/null || return
  cp "$build/include/igraph_version.h" "$series_stamp_file"
  rm -rf "$build"
}

# A strand commit derives what is generated from the tree alone: the parsers
# flex and bison write (tools/fix-lexers.sh included) and the threading header.
# A whole buffer commit derives everything Makefile-cigraph writes, Stimulus's
# R/C interface and the source lists among it, then the cpp11 registration and
# the dependency lists. DOCKER= runs flex and bison from the PATH rather than
# from a container. The inputs are forced (`-W`), because `git archive` dates
# the extracted tree to the upstream commit and a patch dates only what it
# touches, so make would read what is generated from them as up to date.
series_generate_derived() { # <strand|full>
  local force=(-W "$series_vendor_dir/include/igraph_threading.h.in")
  if [ "$1" = strand ]; then
    make -f Makefile-cigraph DOCKER= "${force[@]}" patches src/vendor/igraph_threading.h
    return
  fi
  make -f Makefile-cigraph DOCKER= "${force[@]}" -W "$series_vendor_dir/interfaces/functions.yaml" &&
    Rscript -e 'cpp11::cpp_register()' &&
    rigraph_refresh_dependencies
}

# What a vendor-strand commit carries (scripts/series-vendor.sh): the vendored
# tree, the patch stack applied to it, and what is generated from the tree
# alone. Not the rest of src/vendor/, which also holds main's own files (the
# copies of vendor/, igraph_export.h, config.h, igraph_config.h); never the
# counter, never the glue.
series_vendor_paths=(src/vendor/cigraph src/vendor/igraph_version.h src/vendor/igraph_threading.h
  src/vendor/io patch)

# What the buffer regenerates after a strand commit is picked onto it: what reads
# tools/stimulus/ and the glue, which are the buffer's. The R/C interface
# Stimulus generates, forced as above; the source lists rconfigure.py writes;
# the cpp11 registration; and the dependency lists. Every one of them is in
# `series_regenerated`. A failure undoes the pick (scripts/series-vendor.sh).
series_regenerate() {
  make -f Makefile-cigraph DOCKER= -W "$series_vendor_dir/interfaces/functions.yaml" \
    src/rinterface.c r_wrappers src/sources.mk &&
    Rscript -e 'cpp11::cpp_register()' &&
    rigraph_refresh_dependencies
}

# The committed `src/*.dd` files list each glue file's local dependencies
# (src/deps.mk). Regeneration rewrites `src/rinterface.c` and `src/cpp11.cpp`,
# so the next make rebuilds their lists; doing it here puts a list that moved
# into the commit, rather than leaving the tree dirty for whoever builds next.
# A failure is left for the glue gate to report. rigraph's own, for the two
# hooks above.
rigraph_refresh_dependencies() {
  [ -f "$series_configured_file" ] || ./configure >/dev/null 2>&1 || return 0
  (cd src && CLINK_CPPFLAGS="$(cd .. && series_glue_extra_flags)" R CMD SHLIB -n init.cpp >/dev/null 2>&1) || true
}

# What vendoring regenerates, which differs between any two vendor runs of the
# same upstream commit and is never carried as a fix (scripts/series-advance.sh):
# files, and directories. A fix to the interface lives in tools/stimulus/ and
# does travel. src/vendor/ is the vendored tree, the headers CMake and make
# write beside it, the parsers, and make's copies of vendor/, so a fix there is
# made where it is generated from.
series_regenerated=(src/rinterface.c 'R/aaa-*.R' src/cpp11.cpp R/cpp11.R 'src/sources-*.mk')
series_regenerated_dirs=(src/vendor)

# The tooling `main` owns, ported onto every series by stage 4 and never carried
# sideways (scripts/series-port.sh).
series_tooling=(.github scripts .claude)

# The glue gate (scripts/vendor-lib.sh) reads the compiler and the flags off the
# compile line `R CMD SHLIB -n` prints for each probe, and checks every `src/`
# file of the probe's extension with them: the glue is C and C++ here. The
# line comes from the `src/Makevars` that `./configure` writes from
# `src/Makevars.in`. `R CMD SHLIB` omits the include path of a `LinkingTo`
# package (cpp11 here), which `R CMD INSTALL` passes as CLINK_CPPFLAGS, so the
# function prints it from DESCRIPTION, once per gate, and
# rigraph_refresh_dependencies() passes the same when it rewrites the
# dependency lists.
series_glue_probes=(init.cpp rinterface_extra.c)
series_configured_file=src/Makevars
series_glue_extra_flags() {
  Rscript -e 'p <- read.dcf("DESCRIPTION", "LinkingTo")[[1]]
p <- trimws(sub("[(].*", "", strsplit(p, ",")[[1]]))
cat(paste0("-I\"", system.file("include", package = p), "\""), sep = " ")'
}

# The engine a tree vendors: the upstream SHA its newest vendor commit names,
# empty when none. duckdb-r reads it off the tree, whose version stamp is a
# commit id; igraph's stamp is `git describe`, which names no commit at a tag,
# so the subjects are read instead, bounded like series_vendored_sha()
# (scripts/series-lib.sh). A seed vendors nothing itself and inherits its base's
# engine, which the scan finds. A graft holds a tree its history does not
# vendor, so the scan would answer its base's engine; rigraph has no grafts,
# because --graft-from serves the opening of a release-branch series, which is
# not ported.
series_engine_of() { # <commit> -> the upstream SHA, empty when none
  local subjects
  subjects=$(git log -n "${BASE_SCAN_DEPTH:-20}" --format=%s "$1" -- "$series_scan_dir" 2>/dev/null || true)
  sed -En "$series_sha_sed" <<<"$subjects" | head -n 1
}

# The version a tree stamps for the engine it vendors, as the package reads it:
# what igraph's CMake writes from `git describe --tags` in the upstream clone.
# It is also where the tree records the engine itself, the abbreviated upstream
# SHA, so the file that moves on every upstream commit is the same for both, and
# a vendor run counts any other moved file as a real change (scripts/vendor-one.sh).
series_stamp_file=src/vendor/igraph_version.h
series_engine_file=$series_stamp_file
series_stamped_version() { # <tree-ish> -> the version, empty when none
  { git show "$1:$series_stamp_file" 2>/dev/null || true; } |
    sed -En 's/^#define IGRAPH_VERSION "(.*)"$/\1/p'
}

# `series_release_of_stamp` is left undefined: `X.Y.Z-N-g<sha>` names the
# release it follows, never the next one, so series-check.sh asks the newest
# vendor commits against the tags instead.

# Upstream's release tags and release branches, as globs over the bare names,
# and the tag a release's version is spelled as. igraph tags a release `X.Y.Z`
# and cuts no release branches by a pattern, so every branch is read: an empty
# answer then means the reading failed, never that there was nothing to report.
series_tag_glob='[0-9]*'
series_branch_glob='*'
series_tag_of_release() { # <X.Y.Z> -> the tag
  echo "$1"
}

# The package as `main` publishes it, which every flavor renames
# (scripts/flavor.sh), and the repository `main` lives in.
series_package=igraph
series_canonical_repo=igraph/rigraph

# Does the engine version $1 predate the version $2? The reading
# `engine_before()` in tests/testthat/helper-skip.R makes, so an engine gate
# expires in the scripts where it expires in the suite. igraph's CMake writes
# `git describe --tags`: a release is `X.Y.Z`, and `X.Y.Z-N-g<sha>` is N commits
# past it, so it follows `X.Y.Z` and precedes the next release. A string that
# is not a version predates nothing.
series_version_before() { # <engine> <version>
  local re='^([0-9]+)\.([0-9]+)\.([0-9]+)(-([0-9]+)-g[0-9a-f]+)?$' i
  local -a lhs rhs
  [[ $1 =~ $re ]] || return 1
  lhs=("${BASH_REMATCH[1]}" "${BASH_REMATCH[2]}" "${BASH_REMATCH[3]}" "${BASH_REMATCH[5]:-0}")
  [[ $2 =~ $re ]] || return 1
  rhs=("${BASH_REMATCH[1]}" "${BASH_REMATCH[2]}" "${BASH_REMATCH[3]}" "${BASH_REMATCH[5]:-0}")
  for i in 0 1 2 3; do
    ((10#${lhs[i]} < 10#${rhs[i]})) && return 0
    ((10#${lhs[i]} > 10#${rhs[i]})) && return 1
  done
  return 1
}

# The seed: the commit scripts/flavor.sh's commits are topped with, which every
# series stands on above its `main` (.claude/skills/series-open/SKILL.md).
# The subject is the anchor every seed-relative walk reads.
series_seed_subject='chore: Add fifth version component'

# The estimator scripts/each-plan.sh weighs commits with: a command whose `map`
# and `batch` forms print the objects a commit invalidates. rigraph has no unity
# build and no include graph worth reading, so scripts/each-cost.py answers the
# same weight for every commit.
series_cost_estimator=(python3 "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/each-cost.py")
