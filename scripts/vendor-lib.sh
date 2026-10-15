# shellcheck shell=bash
# The glue gate: whether the glue compiles against the headers the tree vendors.
# Shared by scripts/vendor-one.sh, scripts/series-forward-build.sh and
# scripts/series-advance.sh, and run from the repository root of the tree to
# check.
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
  # rigraph: a ./configure that failed leaves R's default flags, whose compile line fails every file.
  [ -z "$series_configured_file" ] || [ -f "$series_configured_file" ] || return 0
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
