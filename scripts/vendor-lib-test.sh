#!/bin/bash
# Check the glue gate, glue_compiles() in scripts/vendor-lib.sh, offline,
# against a package built here: the compile lines are the ones the real
# `R CMD SHLIB -n` prints, and the compiler is the real one, because what is
# under test is what that compiler accepts. One clean file per probe in
# `series_glue_probes` (scripts/series-config.sh) stands for the glue.
#
# What is checked:
#   1. Clean glue passes: exit 0, and no failures listed.
#   2. A C file calling a function nothing declares fails, which is how a
#      macro upstream removed reads in a glue function body, and is listed
#      alone, the clean files beside it still passing.
#   3. A C file with a declaration of no type fails, which is how such a macro
#      reads at file scope.
#   4. A C++ file calling a function nothing declares fails as well.
#   5. A tree the compile line cannot be read for exits 2.
#
# Usage:
#   scripts/vendor-lib-test.sh
#
# Environment variables:
#   KEEP - if non-empty, do not delete the scratch directory

set -euo pipefail

HERE=$(cd "$(dirname "$0")" && pwd)
# shellcheck source=vendor-lib.sh
. "$HERE/vendor-lib.sh"

SCRATCH=$(mktemp -d)
[ -n "${KEEP:-}" ] || trap 'rm -rf "$SCRATCH"' EXIT
[ -z "${KEEP:-}" ] || echo "scratch: $SCRATCH"

pass=0
fail=0
ok() { pass=$((pass + 1)); echo "  ok   $1"; }
no() { fail=$((fail + 1)); echo "  FAIL $1"; }
is() { if [ "$2" = "$3" ]; then ok "$1"; else no "$1"; echo "       got:  $2"; echo "       want: $3"; fi; }

command -v R >/dev/null || { echo "R is needed for R CMD SHLIB -n" >&2; exit 1; }

# The package: what the gate reads and nothing else. The configured file is
# written here, so the gate runs no ./configure, and DESCRIPTION names the
# LinkingTo package series_glue_extra_flags() reads.
cd "$SCRATCH"
mkdir src
printf 'Package: gluetest\nLinkingTo: cpp11\n' > DESCRIPTION
: > "$series_configured_file"
for probe in "${series_glue_probes[@]}"; do
  printf '#include <R.h>\n#include <Rinternals.h>\nSEXP %s_clean(void) { return R_NilValue; }\n' \
    "${probe%%.*}" > "src/$probe"
done

# gate: the exit status, then the failures one per line, on one line.
gate() {
  local st=0
  glue_compiles "$SCRATCH/failures" || st=$?
  echo "$st: $(tr '\n' ' ' < "$SCRATCH/failures")"
}

echo "1. clean glue"
is "passes" "$(gate)" "0: "

echo "2. a call to an undeclared function in C"
printf '#include <Rinternals.h>\nSEXP removed(void) { IGRAPH_I_REMOVED(0); return R_NilValue; }\n' > src/undeclared.c
is "fails, and only that file is listed" "$(gate)" "1: undeclared.c "
rm src/undeclared.c

echo "3. a declaration of no type in C"
printf '#include <Rinternals.h>\nIGRAPH_I_REMOVED(x);\n' > src/untyped.c
is "fails" "$(gate)" "1: untyped.c "
rm src/untyped.c

echo "4. a call to an undeclared function in C++"
printf '#include <Rinternals.h>\nextern "C" SEXP removed() { igraph_removed(0); return R_NilValue; }\n' > src/undeclared.cpp
is "fails" "$(gate)" "1: undeclared.cpp "
rm src/undeclared.cpp

echo "5. a tree the compile line cannot be read for"
rm "$series_configured_file"
st=0
glue_compiles "$SCRATCH/failures" || st=$?
is "exits 2" "$st" 2

echo
echo "$pass passed, $fail failed"
[ "$fail" -eq 0 ]
