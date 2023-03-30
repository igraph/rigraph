#include "cpp11.hpp"

#include <R.h>
#include <Rinternals.h>
#include <Rdefines.h>
#include <R_ext/Visibility.h>

#include "igraph_vector.hpp"

extern "C" int igraphhcass2(int n, const int *ia, const int *ib, int *iorder, int *iia, int *iib);

// FIXME: This belongs in a header or in the cpp11 package
const int* ptr(cpp11::integers v) {
  return INTEGER(v);
}

int* ptr(cpp11::writable::integers v) {
  return INTEGER(v);
}

[[cpp11::register]]
cpp11::integers igraph_hcass2(int n, cpp11::integers ia, cpp11::integers ib) {
  igVector a(n);
  igVector b(n);

  cpp11::writable::integers result(n);

  igraphhcass2(n, ptr(ia), ptr(ib), ptr(result), a.begin(), b.begin());

  return result;
}
