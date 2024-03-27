// Require R_ and Rf_ prefixes for R API
#define R_NO_REMAP

#include <R.h>
#include <Rdefines.h>

SEXP promise_as_lazy(SEXP promise, SEXP env, int follow_symbols) {
  // recurse until we find the real promise, not a promise of a promise
  // never go past the global environment
  while(TYPEOF(promise) == PROMSXP && env != R_GlobalEnv) {

    env = PRENV(promise);
    promise = PREXPR(promise);

    // If the promise is threaded through multiple functions, we'll
    // get some symbols along the way. If the symbol is bound to a promise
    // keep going on up
    if (follow_symbols && TYPEOF(promise) == SYMSXP) {
      SEXP obj = Rf_findVar(promise, env);
      if (TYPEOF(obj) == PROMSXP) {
        promise = obj;
      }
    }
  }

  // Make named list for output
  SEXP lazy = PROTECT(Rf_allocVector(VECSXP, 2));
  SET_VECTOR_ELT(lazy, 0, promise);
  SET_VECTOR_ELT(lazy, 1, env);

  SEXP names = PROTECT(Rf_allocVector(STRSXP, 2));
  SET_STRING_ELT(names, 0, Rf_mkChar("expr"));
  SET_STRING_ELT(names, 1, Rf_mkChar("env"));

  Rf_setAttrib(lazy, Rf_install("names"), names);
  Rf_setAttrib(lazy, Rf_install("class"), PROTECT(Rf_mkString("lazy")));

  UNPROTECT(3);

  return lazy;
}

SEXP make_lazy(SEXP name, SEXP env, SEXP follow_symbols_) {
  SEXP promise = PROTECT(Rf_findVar(name, env));
  int follow_symbols = Rf_asLogical(follow_symbols_);
  SEXP ret = promise_as_lazy(promise, env, follow_symbols);
  UNPROTECT(1);
  return ret;
}

SEXP make_lazy_dots(SEXP env, SEXP follow_symbols_) {
  SEXP dots = PROTECT(Rf_findVar(Rf_install("..."), env));
  int follow_symbols = Rf_asLogical(follow_symbols_);

  // Figure out how many elements in dots
  int n = 0;
  for(SEXP nxt = dots; nxt != R_NilValue; nxt = CDR(nxt)) {
    n++;
  }

  // Allocate list to store results
  SEXP lazy_dots = PROTECT(Rf_allocVector(VECSXP, n));
  SEXP names = PROTECT(Rf_allocVector(STRSXP, n));

  // Iterate through all elements of dots, converting promises into lazy exprs
  int i = 0;
  SEXP nxt = dots;
  while(nxt != R_NilValue) {
    SEXP promise = CAR(nxt);

    SEXP lazy = promise_as_lazy(promise, env, follow_symbols);
    SET_VECTOR_ELT(lazy_dots, i, lazy);
    if (TAG(nxt) != R_NilValue)
      SET_STRING_ELT(names, i, PRINTNAME(TAG(nxt)));

    nxt = CDR(nxt);
    i++;
  }
  Rf_setAttrib(lazy_dots, Rf_install("names"), names);
  Rf_setAttrib(lazy_dots, Rf_install("class"), PROTECT(Rf_mkString("lazy_dots")));

  UNPROTECT(4);

  return lazy_dots;
}
#include <R.h>
#include <Rdefines.h>

/* For now, replace with pure R alternative ------------------------------------

// This is a bit naughty, but there's no other way to create a promise
SEXP Rf_mkPROMISE(SEXP, SEXP);
SEXP Rf_installTrChar(SEXP);

SEXP lazy_to_promise(SEXP x) {
  // arg is a list of length 2 - LANGSXP/SYMSXP, followed by ENVSXP
  return Rf_mkPROMISE(VECTOR_ELT(x, 0), VECTOR_ELT(x, 1));
}

SEXP eval_call_(SEXP fun, SEXP dots, SEXP env) {
  if (TYPEOF(fun) != SYMSXP && TYPEOF(fun) != LANGSXP) {
    error("fun must be a call or a symbol");
  }
  if (TYPEOF(dots) != VECSXP) {
    error("dots must be a list");
  }
  if (!inherits(dots, "lazy_dots")) {
    error("dots must be of class lazy_dots");
  }
  if (TYPEOF(env) != ENVSXP) {
    error("env must be an environment");
  }

  int n = length(dots);
  if (n == 0) {
    return LCONS(fun, R_NilValue);
  }

  SEXP names = GET_NAMES(dots);

  SEXP args = R_NilValue;
  for (int i = n - 1; i >= 0; --i) {
    SEXP dot = VECTOR_ELT(dots, i);
    SEXP prom = lazy_to_promise(dot);
    args = PROTECT(CONS(prom, args));
    if (names != R_NilValue) {
      SEXP name = STRING_ELT(names, i);
      if (strlen(CHAR(name)) > 0)
        SET_TAG(args, Rf_installTrChar(name));
    }
  }
  UNPROTECT(n);

  SEXP call = LCONS(fun, args);

  return eval(call, env);
}

*/
#include <R.h>
#include <Rdefines.h>

/* Fails on Linux --------------------------------------------------------------

SEXP Rf_mkPROMISE(SEXP, SEXP);

SEXP promise_(SEXP expr, SEXP env) {
  if (TYPEOF(expr) != SYMSXP && TYPEOF(expr) != LANGSXP) {
    error("expr must be a call or a symbol");
  }
  if (TYPEOF(env) != ENVSXP) {
    error("env must be an environment");
  }

  return Rf_mkPROMISE(expr, env);
}

*/

SEXP promise_expr_(SEXP prom) {
  if (TYPEOF(prom) != PROMSXP) {
    Rf_error("prom must be a promise");
  }

  return PREXPR(prom);
}

SEXP promise_env_(SEXP prom) {
  if (TYPEOF(prom) != PROMSXP) {
    Rf_error("prom must be a promise");
  }

  return PRENV(prom);
}
