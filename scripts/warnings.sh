#!/bin/bash
# The compiler-warning gate: compile part of src/ with the gate's warning flags
# and judge what the compiler says about the files this repository owns.
# Handbook: handbook/build/warnings/README.md
#
# Usage:
#   scripts/warnings.sh [glue]    # compile the glue, fail on a glue warning
#   scripts/warnings.sh vendored  # compile everything else, report and exit 0
#
# A warning belongs to the file it points at, not to the translation unit that
# raised it: a glue file is not answerable for what an igraph header says.
# So every warning is attributed to a scope by its path,
# only the glue's fail the gate, and the others are counted.
#
# The flags reach this one compile through a makefile of its own,
# never src/Makevars (CRAN rejects -Wno-* there)
# and never ~/.R/Makevars (every later build in the job would read it,
# R CMD check among them, and turn these warnings into its own).
# The user Makevars is included, so ccache's wrappers still apply.
#
# Linux and macOS only: it needs the src/Makevars that ./configure writes.

set -euo pipefail

cd "$(dirname "$0")/.."
root="$(pwd)"

scope="${1:-glue}"
case "${scope}" in
  glue | vendored) ;;
  *)
    echo "Usage: scripts/warnings.sh [glue|vendored]" >&2
    exit 2
    ;;
esac

# The reasons for each flag are the handbook page's.
WARNINGS="-Wall -Wextra -pedantic -Wno-unused-parameter -Wno-cast-function-type"

tmp="$(mktemp -d)"
trap 'rm -rf "${tmp}"' EXIT

user_makevars="${R_MAKEVARS_USER:-${HOME}/.R/Makevars}"
{
  [ -f "${user_makevars}" ] && echo "include ${user_makevars}"
  # What R CMD INSTALL puts on the command line for the LinkingTo packages.
  Rscript -e 'l <- tools:::.get_requires_from_package_db(read.dcf("DESCRIPTION")[1, ], "LinkingTo")
    cat("CLINK_CPPFLAGS =", paste0("-I\"", vapply(l, function(p) system.file("include", package = p), ""), "\""), "\n")'
  for v in CFLAGS CXXFLAGS CXX11FLAGS CXX14FLAGS CXX17FLAGS CXX20FLAGS FFLAGS; do
    echo "${v} += ${WARNINGS}"
  done
  echo 'print-%: ; @echo "objects: $($*)"'
} > "${tmp}/warnings.mk"

[ -f src/Makevars ] || ./configure

r_make() {
  (cd src && R CMD make -f Makevars -f "$(R RHOME)/etc/Makeconf" -f "${tmp}/warnings.mk" "$@")
}

# The object lists as src/Makevars has them, one per line.
# Make may say other things on the way (src/deps.mk refreshes the .dd files),
# and everything here is later passed to `rm`, so only *.o words are kept.
objects_of() {
  r_make -s "${@/#/print-}" | sed -n 's/^objects: //p' | tr ' ' '\n' | grep -E '^[A-Za-z0-9_./-]+\.o$' | sort -u
}

objects_of GLUE_C_SOURCES GLUE_CPP_SOURCES > "${tmp}/glue.txt"
if [ "${scope}" = glue ]; then
  objects="$(cat "${tmp}/glue.txt")"
else
  objects="$(objects_of OBJECTS | grep -vxF -f "${tmp}/glue.txt")"
fi
if [ -z "${objects}" ]; then
  echo "No ${scope} objects in src/Makevars; nothing was judged."
  exit 1
fi

# Removed first, so that every object is compiled and so speaks;
# ccache replays a cached compile's warnings, so a warm cache hides nothing.
# shellcheck disable=SC2086
(cd src && rm -f ${objects})
# shellcheck disable=SC2086
r_make -j"$(nproc)" ${objects} > "${tmp}/build.log" 2>&1 || {
  cat "${tmp}/build.log"
  echo "The compile failed; see above."
  exit 1
}

# One line per distinct warning, paths relative to src/ where they are ours.
# R CMD check itself exempts ISO C's function pointer conversions
# (tools:::.check_packages), and the igraph API stores R closures behind
# igraph_function_pointer_t, so the glue cannot avoid them; they are dropped.
grep -E '^[^ ].*:[0-9]+:[0-9]+: warning:' "${tmp}/build.log" |
  sed -e "s|^${root}/src/||" -e "s|^${root}/||" -e 's|^src/||' |
  grep -vE 'warning: *ISO C forbids.*function pointer' |
  sort -u > "${tmp}/warnings.txt" || true

# vendored: src/vendor/, including the lexers whose #line points back there;
# external: anything outside the checkout (R's headers, cpp11's, the system's);
# glue: the rest of src/.
awk -F: '
  { s = ($1 ~ /(^|\/)vendor\//) ? "vendored" : ($1 ~ /^\//) ? "external" : "glue"; print s "\t" $0 }
' "${tmp}/warnings.txt" > "${tmp}/scoped.txt"

fortran="$(grep -c '^Warning:' "${tmp}/build.log" || true)"

echo "Compiled $(echo "${objects}" | wc -w) objects with ${WARNINGS}."
for s in glue vendored external; do
  echo "  $(grep -c "^${s}	" "${tmp}/scoped.txt" || true) warnings in ${s} files"
done
[ "${scope}" = vendored ] && echo "  ${fortran} Fortran warnings (vendored ARPACK)"

if [ "${scope}" = vendored ]; then
  cut -f2- "${tmp}/scoped.txt"
  exit 0
fi

if grep -q '^glue	' "${tmp}/scoped.txt"; then
  echo
  echo "The glue must compile without warnings (handbook/build/warnings/README.md):"
  grep '^glue	' "${tmp}/scoped.txt" | cut -f2-
  echo
  echo "Context from the compiler:"
  cat "${tmp}/build.log"
  exit 1
fi
echo "The glue compiles without warnings."
