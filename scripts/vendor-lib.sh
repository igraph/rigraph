# shellcheck shell=bash
# The regeneration both vendoring scripts share, and the glue gate: whether the
# glue compiles against the headers the tree vendors. regenerate() is
# scripts/vendor-one.sh's walk and scripts/vendor.sh's single commit; the gate
# is shared by scripts/vendor-one.sh, scripts/series-forward-build.sh and
# scripts/series-advance.sh. Run from the repository root of the tree to check,
# and for regenerate() with `upstream_dir` and `vendor_dir` set.
#
# Ported from duckdb/duckdb-r (.series-source), whose copy holds the gate alone:
# DuckDB's regeneration is one Python script, igraph's is the keep-list, CMake,
# the patch stack, Stimulus and cpp11.
# shellcheck source=series-config.sh
. "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/series-config.sh"

# The command one probe file is compiled with, read off `R CMD SHLIB -n`'s
# compile line for it with the `-c <probe> -o <object>` removed: the compiler
# and its flags, which every glue file of the probe's language is then checked
# with. `./configure` runs first where `series_configured_file` says it has not,
# because the Makevars include what only it writes, and without that `make -n`
# stops before it prints a compile line. The extra flags go in as
# CLINK_CPPFLAGS, the way `R CMD INSTALL` passes a `LinkingTo` include path,
# rather than appended afterwards: a Makevars that keeps compiler-generated
# dependency lists remakes a stale one before it prints anything, with these
# flags or without them. Empty when no compile line was printed, which is the
# check not being able to run.
glue_compile_line() { # <probe> [extra cppflags] -> command, empty when none
  local probe
  if [ -x ./configure ] && { [ -z "$series_configured_file" ] || [ ! -f "$series_configured_file" ]; }; then
    ./configure >/dev/null 2>&1 || true
  fi
  probe=$(printf '%s' "$1" | sed 's/[.]/\\./g')
  (cd src && env ${2:+CLINK_CPPFLAGS="$2"} R CMD SHLIB -n "$1" 2>/dev/null) |
    grep -m 1 -E -- "-c $probe" |
    sed -E "s/^ *//; s/ -c $probe -o [^ ]+\.o *$//"
}

# 0 the glue compiles, 1 some file does not, 2 the check could not run. The
# three are distinct because the caller acts differently on each: only 1 says
# anything about the commit at HEAD. The files that failed go to <failures>,
# one per line, written only by a run that got as far as compiling. One pass
# per probe in `series_glue_probes`, over the `src/` files of its extension,
# with what `series_glue_extra_flags` prints on the compile line.
#
# `eval`, because R quotes its include path (`-I"/usr/share/R/include"`); plain
# expansion word-splits without removing the quotes, so the compiler never
# finds R.h and every glue file looks broken.
glue_compiles() { # [failures]
  local out=${1:-} own='' probe line extra st=0
  [ -n "$out" ] || { out=$(mktemp); own=$out; }
  extra=$(series_glue_extra_flags)
  : > "$out"
  for probe in "${series_glue_probes[@]}"; do
    line=$(glue_compile_line "$probe" "$extra")
    [ -n "$line" ] || { rm -f "$own"; return 2; }
    # shellcheck disable=SC2016  # the sh child expands $CMD and $1, not this shell
    (cd src && shopt -s nullglob && files=(*."${probe##*.}") && [ ${#files[@]} -gt 0 ] &&
      printf '%s\n' "${files[@]}" |
      CMD="$line" xargs -P "$(nproc 2>/dev/null || echo 4)" -I{} \
        sh -c 'eval "$CMD -fsyntax-only \"\$1\"" 2>/dev/null || echo "$1"' sh {}) | sort >> "$out" || true
  done
  grep -q . "$out" && st=1
  rm -f "$own"
  return "$st"
}

# Regenerate everything vendoring owns from the commit checked out in the clone:
# the kept part of the upstream tree, the version header CMake writes, the patch
# stack, the R/C interface Stimulus generates, and the cpp11 registration.
# Returns 4 for a broken patch and 7 for a generator that failed, leaving the
# tree as far as it got.
build_dir=${TMPDIR:-/tmp}/vendor-cmake-$$
# shellcheck disable=SC2154  # upstream_dir and vendor_dir are the caller's
regenerate() { # <upstream commit>
  local commit=$1 keep=() p f

  rm -rf "$vendor_dir"
  mkdir -p "$vendor_dir"
  for p in "${series_keep[@]}"; do
    if git -C "$upstream_dir" cat-file -e "HEAD:$p" 2>/dev/null; then
      keep+=("$p")
    fi
  done
  git -C "$upstream_dir" archive HEAD -- "${keep[@]}" | tar -x -C "$vendor_dir"

  rm -rf "$build_dir"
  cmake -S "$upstream_dir" -B "$build_dir" >/dev/null || return 7
  cp "$build_dir/include/igraph_version.h" "$series_stamp_file"
  rm -rf "$build_dir"

  # Apply patches in patch/*.patch: applied, retired, or a stop.
  # `--reverse` needs `--forward` beside it: on its own it prompts
  # ("Unreversed patch detected!  Ignore -R? [n]") and hangs a run whose
  # stdin is a terminal.
  # scripts/vendor.sh has the same three-way split and the same exit 4.
  for f in patch/*.patch; do
    [ -e "$f" ] || continue
    if patch -s -i "$f" -p1 --forward --dry-run >/dev/null; then
      patch -i "$f" -p1 --forward --no-backup-if-mismatch
    elif patch -s -i "$f" -p1 --reverse --forward --dry-run >/dev/null; then
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
      echo "then 'git checkout -- . && git clean -fd src R', put it back, and rerun this script."
      echo "Delete it only after confirming its change is genuinely upstream --"
      echo "the effect it had, however upstream reached it, not this diff."
      echo "A deletion has to ride in the vendor commit for ${commit}, and this"
      echo "script refuses to start on a dirty tree, so land it like this:"
      echo "  git checkout -- . && git rm $f && git commit -m 'tmp: retire patch'"
      echo "  $0 --commits 1 <upstream>"
      echo "  { git log -1 --format=%B; printf '\\nR-side fix:\\n\\n%s\\n' '<what was adapted>'; } >../vendor.msg"
      echo "  git reset --soft HEAD~2 && git commit -q -F ../vendor.msg"
      return 4
    fi
  done

  # DOCKER= runs flex and bison from the PATH rather than from a container.
  make -f Makefile-cigraph DOCKER= || return 7
  Rscript -e 'cpp11::cpp_register()' || return 7
  refresh_dependencies
}

# The committed `src/*.dd` files list each glue file's local dependencies
# (src/deps.mk). Regeneration rewrites `src/rinterface.c` and `src/cpp11.cpp`,
# so the next make rebuilds their lists; doing it here puts a list that moved
# into the vendor commit, rather than leaving the tree dirty for whoever builds
# next. A failure is left for the glue gate to report.
refresh_dependencies() {
  [ -f "$series_configured_file" ] || ./configure >/dev/null 2>&1 || return 0
  (cd src && CLINK_CPPFLAGS="$(cd .. && series_glue_extra_flags)" R CMD SHLIB -n init.cpp >/dev/null 2>&1) || true
}
