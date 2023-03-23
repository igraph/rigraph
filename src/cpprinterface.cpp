#include "cpp11.hpp"

#include <R.h>
#include <Rinternals.h>
#include <Rdefines.h>
#include <R_ext/Visibility.h>

#include "igraph_vector.hpp"

extern "C" int igraphhcass2(int *n, int *ia, int *ib, int *iorder, int *iia, int *iib);

[[cpp11::register]]
SEXP igraph_hcass2(SEXP n, SEXP ia, SEXP ib) {
  SEXP result;
  int c_n = INTEGER(n)[0];

  igVector a(c_n);
  igVector b(c_n);

  PROTECT(result = NEW_INTEGER(c_n));

  igraphhcass2(INTEGER(n), INTEGER(ia), INTEGER(ib), INTEGER(result), a.begin(), b.begin());

  UNPROTECT(1);
  return result;
}
