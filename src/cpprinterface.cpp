#include "cpp11.hpp"

#include <R.h>
#include <Rinternals.h>
#include <Rdefines.h>
#include <R_ext/Visibility.h>

#include "igraph_vector.hpp"

extern "C" int igraphhcass2(int n, int *ia, int *ib, int *iorder, int *iia, int *iib);

[[cpp11::register]]
cpp11::integers igraph_hcass2(int n, cpp11::integers ia, cpp11::integers ib) {
  igVector a(n);
  igVector b(n);

  cpp11::writable::integers result(n);

  igraphhcass2(n, INTEGER(ia), INTEGER(ib), INTEGER(result), a.begin(), b.begin());

  UNPROTECT(1);
  return result;
}
