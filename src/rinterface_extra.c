/* -*- mode: C -*-  */
/*
   IGraph library R interface.
   Copyright (C) 2013  Gabor Csardi <csardi.gabor@gmail.com>
   334 Harvard street, Cambridge, MA 02139 USA

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
   02110-1301 USA

*/

#include "igraph.h"
#include "graph/attributes.h"
#include "graph/neighbors.h"

#include "config.h"

// Require R_ and Rf_ prefixes for R API
#define R_NO_REMAP

#include <R.h>
#include <Rinternals.h>
#include <Rdefines.h>
#include <R_ext/Visibility.h>
#include <R_ext/Altrep.h>

#include "rinterface.h"
#include "rrandom.h"

#include <stdio.h>

#if defined(__SANITIZE_ADDRESS__)
#  define IGRAPH_SANITIZER_AVAILABLE 1
#elif defined(__has_feature)
#  if __has_feature(address_sanitizer)
#    define IGRAPH_SANITIZER_AVAILABLE 1
#  endif
#endif

#ifdef IGRAPH_SANITIZER_AVAILABLE
#include <sanitizer/asan_interface.h>
#endif

#define IGRAPH_I_DESTROY IGRAPH_I_ATTRIBUTE_DESTROY

SEXP R_igraph_vector_to_SEXP(const igraph_vector_t *v);
SEXP R_igraph_vector_int_to_SEXP(const igraph_vector_int_t *v);
SEXP R_igraph_vector_int_to_SEXPp1(const igraph_vector_int_t *v);
SEXP R_igraph_vector_bool_to_SEXP(const igraph_vector_bool_t *v);
SEXP R_igraph_vector_long_to_SEXP(const igraph_vector_long_t *v);
SEXP R_igraph_vector_complex_to_SEXP(const igraph_vector_complex_t* v);
SEXP R_igraph_0orvector_to_SEXP(const igraph_vector_t *v);
SEXP R_igraph_0orvector_bool_to_SEXP(const igraph_vector_bool_t *v);
SEXP R_igraph_0orvector_long_to_SEXP(const igraph_vector_long_t *v);
SEXP R_igraph_0orvector_complex_to_SEXP(const igraph_vector_complex_t *v);
SEXP R_igraph_matrix_to_SEXP(const igraph_matrix_t *m);
SEXP R_igraph_matrix_complex_to_SEXP(const igraph_matrix_complex_t *m);
SEXP R_igraph_0ormatrix_complex_to_SEXP(const igraph_matrix_complex_t *m);
SEXP R_igraph_strvector_to_SEXP(const igraph_strvector_t *m);
SEXP R_igraph_to_SEXP(const igraph_t *graph);
SEXP R_igraph_vectorlist_to_SEXP(const igraph_vector_ptr_t *ptr);
SEXP R_igraph_vectorlist_int_to_SEXP(const igraph_vector_ptr_t *ptr);
void R_igraph_vectorlist_int_destroy(igraph_vector_ptr_t *ptr);
SEXP R_igraph_0orvectorlist_to_SEXP(const igraph_vector_ptr_t *ptr);
void R_igraph_vectorlist_destroy(igraph_vector_ptr_t *ptr);
SEXP R_igraph_matrixlist_to_SEXP(const igraph_vector_ptr_t *ptr);
void R_igraph_matrixlist_destroy(igraph_vector_ptr_t *ptr);
SEXP R_igraph_graphlist_to_SEXP(const igraph_vector_ptr_t *ptr);
void R_igraph_graphlist_destroy(igraph_vector_ptr_t *ptr);
SEXP R_igraph_hrg_to_SEXP(const igraph_hrg_t *hrg);
SEXP R_igraph_plfit_result_to_SEXP(const igraph_plfit_result_t *plfit);
SEXP R_igraph_sparsemat_to_SEXP(const igraph_sparsemat_t *sp);
SEXP R_igraph_0orsparsemat_to_SEXP(const igraph_sparsemat_t *sp);
SEXP R_igraph_maxflow_stats_to_SEXP(const igraph_maxflow_stats_t *st);
SEXP R_igraph_sirlist_to_SEXP(const igraph_vector_ptr_t *sl);
void R_igraph_sirlist_destroy(igraph_vector_ptr_t *sl);

int R_igraph_SEXP_to_strvector(SEXP rval, igraph_strvector_t *sv);
int R_igraph_SEXP_to_strvector_copy(SEXP rval, igraph_strvector_t *sv);
int R_SEXP_to_vector(SEXP sv, igraph_vector_t *v);
int R_SEXP_to_vector_copy(SEXP sv, igraph_vector_t *v);
int R_SEXP_to_matrix(SEXP pakl, igraph_matrix_t *akl);
int R_SEXP_to_matrix_complex(SEXP pakl, igraph_matrix_complex_t *akl);
int R_SEXP_to_igraph_matrix_copy(SEXP pakl, igraph_matrix_t *akl);
int R_SEXP_to_igraph(SEXP graph, igraph_t *res);
int R_SEXP_to_igraph_copy(SEXP graph, igraph_t *res);
int R_SEXP_to_igraph_vs(SEXP rit, igraph_t *graph, igraph_vs_t *it);
int R_SEXP_to_igraph_es(SEXP rit, igraph_t *graph, igraph_es_t *it);
int R_SEXP_to_igraph_adjlist(SEXP vectorlist, igraph_adjlist_t *ptr);
int R_igraph_SEXP_to_0orvectorlist(SEXP vectorlist,
                                   igraph_vector_ptr_t *ptr);
int R_igraph_SEXP_to_vectorlist(SEXP vectorlist, igraph_vector_ptr_t *ptr);
int R_igraph_SEXP_to_vectorlist_int(SEXP vectorlist,
                                    igraph_vector_ptr_t *ptr);
int R_igraph_SEXP_to_matrixlist(SEXP matrixlist, igraph_vector_ptr_t *ptr);
int R_SEXP_to_vector_bool(SEXP sv, igraph_vector_bool_t *v);
int R_SEXP_to_vector_bool_copy(SEXP sv, igraph_vector_bool_t *v);
int R_SEXP_to_vector_int_copy(SEXP sv, igraph_vector_int_t *v);
int R_SEXP_to_vector_long_copy(SEXP sv, igraph_vector_long_t *v);
int R_SEXP_to_hrg(SEXP shrg, igraph_hrg_t *hrg);
int R_SEXP_to_hrg_copy(SEXP shrg, igraph_hrg_t *hrg);
int R_SEXP_to_sparsemat(SEXP pakl, igraph_sparsemat_t *akl);

int R_SEXP_to_igraph_layout_drl_options(SEXP in, igraph_layout_drl_options_t *opt);
int R_SEXP_to_attr_comb(SEXP input, igraph_attribute_combination_t *comb);
SEXP R_igraph_bliss_info_to_SEXP(const igraph_bliss_info_t *info);
int R_SEXP_to_igraph_eigen_which(SEXP in, igraph_eigen_which_t *out);
int R_SEXP_to_igraph_arpack_options(SEXP in, igraph_arpack_options_t *opt);
SEXP R_igraph_vector_long_to_SEXPp1(const igraph_vector_long_t *v);
SEXP R_igraph_vectorlist_to_SEXP_p1(const igraph_vector_ptr_t *ptr);
SEXP R_igraph_0orvector_to_SEXPp1(const igraph_vector_t *v);
SEXP R_igraph_0ormatrix_to_SEXP(const igraph_matrix_t *m);
SEXP R_igraph_vector_to_SEXPp1(const igraph_vector_t *v);
SEXP R_igraph_arpack_options_to_SEXP(const igraph_arpack_options_t *opt);

enum igraph_t_idx {
  igraph_t_idx_n = 0,
  igraph_t_idx_directed = 1,
  igraph_t_idx_from = 2,
  igraph_t_idx_to = 3,
  igraph_t_idx_oi = 4,
  igraph_t_idx_ii = 5,
  igraph_t_idx_os = 6,
  igraph_t_idx_is = 7,
  igraph_t_idx_attr = 8,
  igraph_t_idx_env = 9,
  igraph_t_idx_max = 10,
};

// format versions
enum igraph_versions {
  ver_0_1_1,   // 0.1.1
  ver_0_4,     // 0.4
  ver_0_7_999, // 0.7.999
  ver_0_8,     // 0.8
  ver_1_5_0,   // 1.5.0
  ver_current = ver_1_5_0
};

#define R_IGRAPH_VERSION_VAR ".__igraph_version__."



SEXP R_igraph_i_lang7(SEXP s, SEXP t, SEXP u, SEXP v, SEXP w, SEXP x, SEXP y)
{
    PROTECT(s);
    PROTECT(t);
    PROTECT(u);
    s = Rf_lcons(s, Rf_lcons(t, Rf_lcons(u, Rf_list4(v, w, x, y))));
    UNPROTECT(3);
    return s;
}

/* get the list element named str, or return NULL */
/* from the R Manual */

SEXP R_igraph_getListElement(SEXP list, const char *str)
{
  SEXP elmt = R_NilValue, names = Rf_getAttrib(list, R_NamesSymbol);
  int i;

  for (i = 0; i < Rf_length(list); i++)
    if(strcmp(CHAR(STRING_ELT(names, i)), str) == 0) {
      elmt = VECTOR_ELT(list, i);
      break;
    }
  return elmt;
}

SEXP R_igraph_c2(SEXP x1, SEXP x2) {
  SEXP cc = PROTECT(Rf_install("c"));
  SEXP lc = PROTECT(Rf_lang3(cc, x1, x2));
  SEXP ret = Rf_eval(lc, R_GlobalEnv);
  UNPROTECT(2);
  return ret;
}

/* evaluate an expression in a tryCatch() block to ensure that errors do not
 * longjmp() back to the top level. Adapted from include/Rcpp/api/meat/Rcpp_eval.h
 * in the Rcpp project */

typedef enum {
  SAFEEVAL_OK = 0,
  SAFEEVAL_ERROR = 1,
  SAFEEVAL_INTERRUPTION = 2
} R_igraph_safe_eval_result_t;

R_igraph_safe_eval_result_t R_igraph_safe_eval_classify_result(SEXP result) {
  if (Rf_inherits(result, "condition")) {
    if (Rf_inherits(result, "error")) {
      return SAFEEVAL_ERROR;
    } else if (Rf_inherits(result, "interrupt")) {
      return SAFEEVAL_INTERRUPTION;
    }
  }

  return SAFEEVAL_OK;
}

SEXP R_igraph_safe_eval_in_env(SEXP expr_call, SEXP rho, R_igraph_safe_eval_result_t* result) {
  /* find `identity` function used to capture errors */
  SEXP identity = PROTECT(Rf_install("identity"));
  SEXP identity_func = PROTECT(Rf_findFun(identity, R_BaseNamespace));
  if (identity_func == R_UnboundValue) {
    Rf_error("Failed to find 'base::identity()'");
  }

  /* define the call -- enclose with `tryCatch` so we can record errors */
  SEXP try_catch = PROTECT(Rf_install("tryCatch"));
  SEXP try_catch_call = PROTECT(Rf_lang4(try_catch, expr_call, identity_func, identity_func));

  SET_TAG(CDDR(try_catch_call), Rf_install("error"));
  SET_TAG(CDDR(CDR(try_catch_call)), Rf_install("interrupt"));

  /* execute the call */
  SEXP retval = PROTECT(Rf_eval(try_catch_call, rho));

  /* did we get an error or an interrupt? */
  if (result) {
    *result = R_igraph_safe_eval_classify_result(retval);
  }

  UNPROTECT(5);

  return retval;
}

SEXP R_igraph_handle_safe_eval_result_in_env(SEXP result, SEXP rho) {
  switch (R_igraph_safe_eval_classify_result(result)) {
    case SAFEEVAL_OK:
      return result;

    case SAFEEVAL_ERROR:
      /* extract the error message, call IGRAPH_FINALLY_FREE() and then throw
       * the error. We cannot raise the error directly because that would
       * longjmp() and could potentially overwrite stack-allocated data structures
       * that are also in the "finally" stack */
      IGRAPH_FINALLY_FREE();

      SEXP condition_message = PROTECT(Rf_install("conditionMessage"));
      SEXP condition_message_call = PROTECT(Rf_lang2(condition_message, result));
      SEXP evaluated_condition_message = PROTECT(Rf_eval(condition_message_call, rho));
      Rf_error(CHAR(STRING_ELT(evaluated_condition_message, 0)));
      UNPROTECT(3);
      return R_NilValue;

    case SAFEEVAL_INTERRUPTION:
      IGRAPH_FINALLY_FREE();
      Rf_error("Interrupted by user");
      return R_NilValue;

    default:
      Rf_error(
        "Invalid object type returned from R_igraph_safe_eval(). This is a "
        "bug; please report it to the developers."
      );
      return R_NilValue;
  }
}

SEXP R_igraph_safe_eval(SEXP expr_call, R_igraph_safe_eval_result_t* result) {
  return R_igraph_safe_eval_in_env(expr_call, R_GlobalEnv, result);
}

SEXP R_igraph_handle_safe_eval_result(SEXP result) {
  return R_igraph_handle_safe_eval_result_in_env(result, R_GlobalEnv);
}

/******************************************************
 * Attributes                                         *
 *****************************************************/

SEXP R_igraph_get_attr_mode(SEXP graph, SEXP pwhich) {
  int which=INTEGER(pwhich)[0]-1;
  SEXP obj=VECTOR_ELT(VECTOR_ELT(graph, igraph_t_idx_attr), which);
  int i, len=GET_LENGTH(obj);
  SEXP result;

  PROTECT(result=NEW_CHARACTER(len));
  for (i=0; i<len; i++) {
    SEXP obji=VECTOR_ELT(obj, i);
    if (IS_NUMERIC(obji) || IS_INTEGER(obji)) {
      SET_STRING_ELT(result, i, Rf_mkChar("n"));
    } else if (IS_CHARACTER(obji)) {
      SET_STRING_ELT(result, i, Rf_mkChar("c"));
    } else if (IS_LOGICAL(obji)) {
      SET_STRING_ELT(result, i, Rf_mkChar("l"));
    } else {
      SET_STRING_ELT(result, i, Rf_mkChar("x"));
    }
  }

  UNPROTECT(1);
  return result;
}

int R_SEXP_to_attr_comb(SEXP input, igraph_attribute_combination_t *comb) {
  long int i, n=GET_LENGTH(input);
  SEXP names = PROTECT(GET_NAMES(input));

  igraph_attribute_combination_init(comb);

  for (i=0; i<n; i++) {
    const char *name = 0;
    igraph_attribute_combination_type_t type;
    igraph_function_pointer_t func;

    /* Name */
    if (!Rf_isNull(names)) {
      name = CHAR(STRING_ELT(names, i));
    }
    if (Rf_isNull(names) || strlen(name) == 0) {
      name = 0;
    }

    /* Type and function, if any */
    if (Rf_isFunction(VECTOR_ELT(input, i))) {
      type=IGRAPH_ATTRIBUTE_COMBINE_FUNCTION;
      func=(igraph_function_pointer_t) (void*) VECTOR_ELT(input, i);
    } else {
      type=REAL(AS_NUMERIC(VECTOR_ELT(input, i)))[0];
      func=0;
    }
    igraph_attribute_combination_add(comb, name, type, func);
  }

  UNPROTECT(1);
  return 0;
}

static SEXP R_igraph_attribute_protected=0;
static long int R_igraph_attribute_protected_size=0;

void R_igraph_attribute_protected_destroy(void *dummy) {
  R_ReleaseObject(R_igraph_attribute_protected);
  R_igraph_attribute_protected=0;
  R_igraph_attribute_protected_size=0;
}

int R_igraph_attribute_init(igraph_t *graph, igraph_vector_ptr_t *attr) {
  SEXP result, names, gal;
  long int i;
  long int attrno;
  int px = 0;

  if (R_igraph_attribute_protected) {
    long int ll=GET_LENGTH(R_igraph_attribute_protected);
    if (ll == R_igraph_attribute_protected_size) {
      SEXP newl = NEW_LIST(2*ll);
      long int i;
      PROTECT(newl); px++;
      for (i=0; i<ll; i++) {
        SET_VECTOR_ELT(newl, i,
                       VECTOR_ELT(R_igraph_attribute_protected, i));
      }
      R_ReleaseObject(R_igraph_attribute_protected);
      R_PreserveObject(newl);
      R_igraph_attribute_protected=newl;
      UNPROTECT(1); px--;
    }
    SET_VECTOR_ELT(R_igraph_attribute_protected,
                   R_igraph_attribute_protected_size, NEW_LIST(4));
    result=VECTOR_ELT(R_igraph_attribute_protected,
                      R_igraph_attribute_protected_size);
    SET_VECTOR_ELT(result, 0, NEW_NUMERIC(4));
    REAL(VECTOR_ELT(result, 0))[3] = R_igraph_attribute_protected_size;
    R_igraph_attribute_protected_size += 1;
  } else {
    R_PreserveObject(result=NEW_LIST(4));
    SET_VECTOR_ELT(result, 0, NEW_NUMERIC(3));
  }
  REAL(VECTOR_ELT(result, 0))[0]=0; /* R objects */
  REAL(VECTOR_ELT(result, 0))[1]=1; /* igraph_t objects */
  REAL(VECTOR_ELT(result, 0))[2]=1; /* whether the graph is safe */
  for (i=1; i<3; i++) {
    SET_VECTOR_ELT(result, i+1, NEW_LIST(0)); /* gal, val, eal */
  }
  graph->attr=result;

  /* Add graph attributes */
  attrno= attr==NULL ? 0 : igraph_vector_ptr_size(attr);
  SET_VECTOR_ELT(result, 1, NEW_LIST(attrno));
  gal=VECTOR_ELT(result, 1);
  PROTECT(names=NEW_CHARACTER(attrno)); px++;
  for (i=0; i<attrno; i++) {
    igraph_attribute_record_t *rec=VECTOR(*attr)[i];
    igraph_vector_t *vec;
    igraph_vector_bool_t *log;
    igraph_strvector_t *strvec;
    SET_STRING_ELT(names, i, Rf_mkChar(rec->name));
    SET_VECTOR_ELT(gal, i, R_NilValue);
    switch (rec->type) {
    case IGRAPH_ATTRIBUTE_NUMERIC:
      vec=(igraph_vector_t*) rec->value;
      if (igraph_vector_size(vec) > 0) {
        SET_VECTOR_ELT(gal, i, NEW_NUMERIC(1));
        REAL(VECTOR_ELT(gal, i))[0]=VECTOR(*vec)[0];
      }
      break;
    case IGRAPH_ATTRIBUTE_BOOLEAN:
      log=(igraph_vector_bool_t*) rec->value;
      if (igraph_vector_bool_size(log) > 0) {
        SET_VECTOR_ELT(gal, i, NEW_LOGICAL(1));
        LOGICAL(VECTOR_ELT(gal, i))[0]=VECTOR(*log)[0];
      }
      break;
    case IGRAPH_ATTRIBUTE_STRING:
      strvec=(igraph_strvector_t*) rec->value;
      if (igraph_strvector_size(strvec) > 0) {
        SET_VECTOR_ELT(gal, i, NEW_CHARACTER(1));
        SET_STRING_ELT(VECTOR_ELT(gal,i), 0, Rf_mkChar(STR(*strvec, 0)));
      }
      break;
    case IGRAPH_ATTRIBUTE_R_OBJECT:
      UNPROTECT(px);
      IGRAPH_ERROR("R_objects not implemented yet", IGRAPH_UNIMPLEMENTED);
      break;
    case IGRAPH_ATTRIBUTE_DEFAULT:
    case IGRAPH_ATTRIBUTE_PY_OBJECT:
    default:
      UNPROTECT(px);
      IGRAPH_ERROR("Unknown attribute type, this should not happen",
                   IGRAPH_EINTERNAL);
      break;
    }
  }
  SET_NAMES(gal, names);

  UNPROTECT(px);
  return 0;
}

void R_igraph_attribute_destroy(igraph_t *graph) {
  SEXP attr=graph->attr;
  REAL(VECTOR_ELT(attr, 0))[1] -= 1; /* refcount for igraph_t */
  if (!R_igraph_attribute_protected &&
      REAL(VECTOR_ELT(attr, 0))[1]==0 &&
      REAL(VECTOR_ELT(attr, 0))[2]==1) {
    R_ReleaseObject(attr);
  }
  graph->attr=0;
}

/* If not copying all three attribute kinds are requested, then
   we don't refcount, but really copy the requested ones, because
   1) we can only refcount all three at the same time, and
   2) the not-copied attributes will be set up by subsequent calls
      to permute_vertices and/or permute/edges anyway. */

int R_igraph_attribute_copy(igraph_t *to, const igraph_t *from,
                            igraph_bool_t ga, igraph_bool_t va, igraph_bool_t ea) {
  SEXP fromattr=from->attr;
  if (ga && va && ea) {
    to->attr=from->attr;
    REAL(VECTOR_ELT(fromattr, 0))[1] += 1; /* refcount only */
    if (!R_igraph_attribute_protected &&
        REAL(VECTOR_ELT(fromattr, 0))[1] == 1) {
      R_PreserveObject(to->attr);
    }
  } else {
    R_igraph_attribute_init(to,0); /* Sets up many things */
    SEXP toattr=to->attr;
    if (ga) {
      SET_VECTOR_ELT(toattr, 1, Rf_duplicate(VECTOR_ELT(fromattr, 1)));
    }
    if (va) {
      SET_VECTOR_ELT(toattr, 2, Rf_duplicate(VECTOR_ELT(fromattr, 2)));
    }
    if (ea) {
      SET_VECTOR_ELT(toattr, 3, Rf_duplicate(VECTOR_ELT(fromattr, 3)));
    }
  }
  return 0;
}

SEXP R_igraph_attribute_add_vertices_append1(igraph_vector_ptr_t *nattr,
                                             int j, int nv) {

  SEXP app = R_NilValue;
  igraph_attribute_record_t *tmprec=VECTOR(*nattr)[j-1];
  long int len = 0;

  switch (tmprec->type) {
  case IGRAPH_ATTRIBUTE_NUMERIC:
    len = igraph_vector_size(tmprec->value);
    break;
  case IGRAPH_ATTRIBUTE_BOOLEAN:
    len = igraph_vector_bool_size(tmprec->value);
    break;
  case IGRAPH_ATTRIBUTE_STRING:
    len = igraph_strvector_size(tmprec->value);
    break;
  case IGRAPH_ATTRIBUTE_R_OBJECT:
    igraph_error("R objects not implemented yet", __FILE__, __LINE__,
                 IGRAPH_UNIMPLEMENTED);
    return R_NilValue;
    break;
  default:
    igraph_error("Unknown attribute type, internal error", __FILE__, __LINE__,
                 IGRAPH_EINVAL);
    return R_NilValue;
    break;
  }

  if (len != nv) {
    igraph_error("Invalid attribute length", __FILE__, __LINE__,
                 IGRAPH_EINVAL);
    return R_NilValue;
  }

  switch (tmprec->type) {
  case IGRAPH_ATTRIBUTE_NUMERIC:
    PROTECT(app=NEW_NUMERIC(nv));
    igraph_vector_copy_to(tmprec->value, REAL(app));
    break;
  case IGRAPH_ATTRIBUTE_BOOLEAN:
    PROTECT(app=R_igraph_vector_bool_to_SEXP(tmprec->value));
    break;
  default: /* IGRAPH_ATTRIBUTE_STRING */
    PROTECT(app=R_igraph_strvector_to_SEXP(tmprec->value));
    break;
  }

  UNPROTECT(1);
  return app;
}

void R_igraph_attribute_add_vertices_append(SEXP val, long int nv,
                                            igraph_vector_ptr_t *nattr) {
  SEXP names;
  long int valno, i, nattrno;
  SEXP rep = R_NilValue;
  int px = 0;

  valno=GET_LENGTH(val);
  names=PROTECT(GET_NAMES(val)); px++;
  if (nattr==NULL) {
    nattrno=0;
  } else {
    nattrno=igraph_vector_ptr_size(nattr);
  }

  for (i=0; i<valno; i++) {
    SEXP oldva=VECTOR_ELT(val, i), newva;
    const char *sexpname=CHAR(STRING_ELT(names,i));
    igraph_bool_t l=0;
    long int j;
    for (j=0; !l && j<nattrno; j++) {
      igraph_attribute_record_t *tmp=VECTOR(*nattr)[j];
      l=!strcmp(sexpname, tmp->name);
    }
    if (l) {
      /* This attribute is present in nattr */
      SEXP app = PROTECT(R_igraph_attribute_add_vertices_append1(nattr, j, nv));
      SEXP newva = PROTECT(R_igraph_c2(oldva, app));
      SET_VECTOR_ELT(val, i, newva);
      UNPROTECT(2);
    } else {
      /* No such attribute, append NA's */
      if (Rf_isNull(rep)) {
        SEXP l1 = PROTECT(Rf_install("rep")); px++;
        SEXP l2 = PROTECT(Rf_ScalarLogical(NA_LOGICAL)); px++;
        SEXP l3 = PROTECT(Rf_ScalarInteger((int) nv)); px++;
        SEXP l4 = PROTECT(Rf_lang3(l1, l2, l3)); px++;
        PROTECT(rep=Rf_eval(l4, R_GlobalEnv)); px++;
      }
      PROTECT(newva=R_igraph_c2(oldva, rep));
      SET_VECTOR_ELT(val, i, newva);
      UNPROTECT(1);
    }
  }

  UNPROTECT(px);
}

SEXP R_igraph_attribute_add_vertices_dup(SEXP attr) {
  SEXP newattr=Rf_duplicate(attr);
  int px = 0;

  if (R_igraph_attribute_protected) {
    PROTECT(newattr); px++;
  } else {
    R_PreserveObject(newattr);
  }

  REAL(VECTOR_ELT(attr, 0))[1] -= 1;
  if (!R_igraph_attribute_protected &&
      REAL(VECTOR_ELT(attr, 0))[1] == 0) {
    R_ReleaseObject(attr);
  }
  REAL(VECTOR_ELT(newattr, 0))[0] = 0;
  REAL(VECTOR_ELT(newattr, 0))[1] = 1;
  if (R_igraph_attribute_protected) {
    long int pos, alen=LENGTH(VECTOR_ELT(attr, 0));
    if (alen == 4) {
      pos=REAL(VECTOR_ELT(attr, 0))[3];
      SET_VECTOR_ELT(R_igraph_attribute_protected, pos, newattr);
    } else {
      SEXP tmp=PROTECT(NEW_NUMERIC(4)); px++;
      REAL(tmp)[0] = REAL(VECTOR_ELT(attr, 0))[0];
      REAL(tmp)[1] = REAL(VECTOR_ELT(attr, 0))[1];
      REAL(tmp)[2] = REAL(VECTOR_ELT(attr, 0))[2];
      pos = REAL(tmp)[3] = R_igraph_attribute_protected_size;
      R_igraph_attribute_protected_size += 1;
      SET_VECTOR_ELT(newattr, 0, tmp);
    }
    SET_VECTOR_ELT(R_igraph_attribute_protected, pos, newattr);
  }

  UNPROTECT(px);
  return newattr;
}

int R_igraph_attribute_add_vertices(igraph_t *graph, long int nv,
                                    igraph_vector_ptr_t *nattr) {
  SEXP attr=graph->attr;
  SEXP val, rep=0, names, newnames;
  igraph_vector_t news;
  long int valno, i, origlen, nattrno, newattrs;
  int px = 0;

  if (REAL(VECTOR_ELT(attr, 0))[0]+REAL(VECTOR_ELT(attr, 0))[1] > 1) {
    SEXP newattr = PROTECT(R_igraph_attribute_add_vertices_dup(attr)); px++;
    attr=graph->attr=newattr;
  }

  val=VECTOR_ELT(attr, 2);
  valno=GET_LENGTH(val);
  names=PROTECT(GET_NAMES(val)); px++;
  if (nattr==NULL) {
    nattrno=0;
  } else {
    nattrno=igraph_vector_ptr_size(nattr);
  }
  origlen=igraph_vcount(graph)-nv;

  /* First add the new attributes, if any */
  newattrs=0;
  if (igraph_vector_init(&news, 0)) Rf_error("Out of memory");
  IGRAPH_FINALLY(igraph_vector_destroy, &news);
  for (i=0; i<nattrno; i++) {
    igraph_attribute_record_t *nattr_entry=VECTOR(*nattr)[i];
    const char *nname=nattr_entry->name;
    long int j;
    igraph_bool_t l=0;
    for (j=0; !l && j<valno; j++) {
      l=!strcmp(nname, CHAR(STRING_ELT(names, j)));
    }
    if (!l) {
      newattrs++;
      if (igraph_vector_push_back(&news, i)) Rf_error("Out of memory");
    }
  }
  if (newattrs != 0) {
    SEXP app, newval;
    PROTECT(app=NEW_LIST(newattrs));
    PROTECT(newnames=NEW_CHARACTER(newattrs));
    SEXP l1 = PROTECT(Rf_install("rep"));
    SEXP l2 = PROTECT(Rf_ScalarLogical(NA_LOGICAL));
    SEXP l3 = PROTECT(Rf_ScalarInteger((int) origlen));
    SEXP l4 = PROTECT(Rf_lang3(l1, l2, l3));
    PROTECT(rep = Rf_eval(l4, R_GlobalEnv));
    for (i=0; i<newattrs; i++) {
      igraph_attribute_record_t *tmp=
        VECTOR(*nattr)[(long int)VECTOR(news)[i]];
      SET_VECTOR_ELT(app, i, rep);
      SET_STRING_ELT(newnames, i, Rf_mkChar(tmp->name));
    }
    PROTECT(newval=R_igraph_c2(val, app));
    PROTECT(newnames=R_igraph_c2(names, newnames));
    SET_NAMES(newval, newnames);
    SET_VECTOR_ELT(attr, 2, newval);
    val=VECTOR_ELT(attr, 2);
    UNPROTECT(9);
  }
  igraph_vector_destroy(&news);
  IGRAPH_FINALLY_CLEAN(1);      /* news */

  /* Now append the new values */
  R_igraph_attribute_add_vertices_append(val, nv, nattr);

  UNPROTECT(px);

  return 0;
}

/* void R_igraph_attribute_delete_vertices(igraph_t *graph,  */
/*                                      const igraph_vector_t *eidx, */
/*                                      const igraph_vector_t *vidx) { */
/*   SEXP attr=graph->attr; */
/*   SEXP eal, val; */
/*   long int valno, ealno, i; */
/*   if (REAL(VECTOR_ELT(attr, 0))[0]+REAL(VECTOR_ELT(attr, 0))[1] > 1) { */
/*     SEXP newattr; */
/*     PROTECT(newattr=Rf_duplicate(attr)); */
/*     REAL(VECTOR_ELT(attr, 0))[1] -= 1; */
/*     if (REAL(VECTOR_ELT(attr, 0))[1] == 0) { */
/*        R_ReleaseObject(attr); */
/*     } */
/*     REAL(VECTOR_ELT(newattr, 0))[0] = 0; */
/*     REAL(VECTOR_ELT(newattr, 0))[1] = 1; */
/*     attr=graph->attr=newattr; */
/*   } */

/*   /\* Vertices *\/ */
/*   val=VECTOR_ELT(attr, 2); */
/*   valno=GET_LENGTH(val); */
/*   for (i=0; i<valno; i++) { */
/*     SEXP oldva=VECTOR_ELT(val, i), newva, ss; */
/*     long int origlen=GET_LENGTH(oldva); */
/*     long int newlen=0, j; */
/*     for (j=0; j<igraph_vector_size(vidx); j++) { */
/*       if (VECTOR(*vidx)[j] > 0) { */
/*      newlen++; */
/*       } */
/*     } */
/*     PROTECT(ss=NEW_NUMERIC(newlen)); */
/*     for (j=0; j<origlen; j++) { */
/*       if (VECTOR(*vidx)[j]>0) { */
/*      REAL(ss)[(long int)VECTOR(*vidx)[j]-1]=j+1; */
/*       } */
/*     } */
/*     PROTECT(newva=EVAL(lang3(Rf_install("["), oldva, ss))); */
/*     SET_VECTOR_ELT(val, i, newva); */
/*     UNPROTECT(2); */
/*   }     */

/*   /\* Edges *\/ */
/*   eal=VECTOR_ELT(attr, 3); */
/*   ealno=GET_LENGTH(eal); */
/*   for (i=0; i<ealno; i++) { */
/*     SEXP oldea=VECTOR_ELT(eal, i), newea, ss; */
/*     long int origlen=GET_LENGTH(oldea); */
/*     long int newlen=0, j; */
/*     /\* calculate new length *\/ */
/*     for (j=0; j<origlen; j++) { */
/*       if (VECTOR(*eidx)[j] > 0) { */
/*      newlen++; */
/*       } */
/*     }     */
/*     PROTECT(ss=NEW_NUMERIC(newlen)); */
/*     for (j=0; j<origlen; j++) { */
/*       if (VECTOR(*eidx)[j]>0) { */
/*      REAL(ss)[(long int)VECTOR(*eidx)[j]-1]=j+1; */
/*       } */
/*     } */
/*     PROTECT(newea=EVAL(lang3(Rf_install("["), oldea, ss))); */
/*     SET_VECTOR_ELT(eal, i, newea); */
/*     UNPROTECT(2); */
/*   } */
/* } */

int R_igraph_attribute_permute_vertices_same(const igraph_t *graph,
                                             igraph_t *newgraph,
                                             const igraph_vector_t *idx) {
  SEXP attr=newgraph->attr;
  SEXP val;
  long int i, valno;
  long int idxlen=igraph_vector_size(idx);
  SEXP ss;
  int px = 0;

  /* We copy if we need to */
  if (REAL(VECTOR_ELT(attr, 0))[0]+REAL(VECTOR_ELT(attr, 0))[1] > 1) {
    SEXP newattr = Rf_duplicate(attr);
    if (R_igraph_attribute_protected) {
      PROTECT(newattr); px++;
    } else {
      R_PreserveObject(newattr);
    }
    REAL(VECTOR_ELT(attr, 0))[1] -= 1;
    if (!R_igraph_attribute_protected &&
        REAL(VECTOR_ELT(attr, 0))[1] == 0) {
      R_ReleaseObject(attr);
    }
    REAL(VECTOR_ELT(newattr, 0))[0] = 0;
    REAL(VECTOR_ELT(newattr, 0))[1] = 1;
    if (R_igraph_attribute_protected) {
      long int pos, alen=LENGTH(VECTOR_ELT(attr, 0));
      if (alen == 4) {
        pos=REAL(VECTOR_ELT(attr, 0))[3];
        SET_VECTOR_ELT(R_igraph_attribute_protected, pos, newattr);
      } else {
        SEXP tmp=PROTECT(NEW_NUMERIC(4)); px++;
        REAL(tmp)[0] = REAL(VECTOR_ELT(attr, 0))[0];
        REAL(tmp)[1] = REAL(VECTOR_ELT(attr, 0))[1];
        REAL(tmp)[2] = REAL(VECTOR_ELT(attr, 0))[2];
        pos = REAL(tmp)[3] = R_igraph_attribute_protected_size;
        R_igraph_attribute_protected_size += 1;
        SET_VECTOR_ELT(newattr, 0, tmp);
      }
      SET_VECTOR_ELT(R_igraph_attribute_protected, pos, newattr);
    }
    attr=newgraph->attr=newattr;
  }

  val=VECTOR_ELT(attr,2);
  valno=GET_LENGTH(val);

  /* If we have no vertex attributes, then we don't need to do anything */
  if (valno==0) { UNPROTECT(px); return 0; }

  /* Convert idx to an R object, we will use this for indexing */
  PROTECT(ss=NEW_INTEGER(idxlen)); px++;
  for (i=0; i<idxlen; i++) {
    INTEGER(ss)[i] = (int) VECTOR(*idx)[i]+1;
  }

  for (i=0; i<valno; i++) {
    SEXP oldva=VECTOR_ELT(val, i);

    /* We do NOT do any copying, the attributes were already copied,
       we're doing this in place. */
    SEXP l1 = PROTECT(Rf_install("["));
    SEXP l2 = PROTECT(Rf_lang3(l1, oldva, ss));
    SEXP newva = PROTECT(Rf_eval(l2, R_GlobalEnv));
    SET_VECTOR_ELT(val, i, newva);
    UNPROTECT(3);
  }

  UNPROTECT(px);
  return 0;
}

int R_igraph_attribute_permute_vertices_diff(const igraph_t *graph,
                                             igraph_t *newgraph,
                                             const igraph_vector_t *idx) {
  SEXP attr=graph->attr;
  SEXP toattr=newgraph->attr;
  SEXP val, toval;
  SEXP names;
  long int i, valno;
  long int idxlen=igraph_vector_size(idx);
  SEXP ss;
  int px = 0;

  val=VECTOR_ELT(attr,2);
  valno=GET_LENGTH(val);

  /* If we have no vertex attributes, then we don't need to do anything */
  if (valno==0) { return 0; }

  /* Convert idx to an R object, we will use this for indexing */
  PROTECT(ss=NEW_INTEGER(idxlen)); px++;
  for (i=0; i<idxlen; i++) {
    INTEGER(ss)[i] = (int) VECTOR(*idx)[i]+1;
  }

  /* Resize the vertex attribute list in 'newgraph' */
  PROTECT(toval=NEW_LIST(valno)); px++;
  PROTECT(names=GET_NAMES(val)); px++;
  SET_NAMES(toval, names);

  for (i=0; i<valno; i++) {
    SEXP oldva=VECTOR_ELT(val, i);
    SEXP l1 = PROTECT(Rf_install("["));
    SEXP l2 = PROTECT(Rf_lang3(l1, oldva, ss));
    SEXP newva = PROTECT(Rf_eval(l2, R_GlobalEnv));
    SET_VECTOR_ELT(toval, i, newva);
    UNPROTECT(3);
  }

  SET_VECTOR_ELT(toattr, 2, toval);

  UNPROTECT(px);
  return 0;
}

int R_igraph_attribute_permute_vertices(const igraph_t *graph,
                                        igraph_t *newgraph,
                                        const igraph_vector_t *idx) {
  if (graph == newgraph) {
    return R_igraph_attribute_permute_vertices_same(graph, newgraph, idx);
  } else {
    return R_igraph_attribute_permute_vertices_diff(graph, newgraph, idx);
  }
}

SEXP R_igraph_attribute_add_edges_dup(SEXP attr) {
  SEXP newattr=Rf_duplicate(attr);
  int px = 0;

  if (R_igraph_attribute_protected) {
    PROTECT(newattr); px++;
  } else {
    R_PreserveObject(newattr);
  }

  REAL(VECTOR_ELT(attr, 0))[1] -= 1;
  if (!R_igraph_attribute_protected &&
      REAL(VECTOR_ELT(attr, 0))[1] == 0) {
    R_ReleaseObject(attr);
  }
  REAL(VECTOR_ELT(newattr, 0))[0] = 0;
  REAL(VECTOR_ELT(newattr, 0))[1] = 1;
  if (R_igraph_attribute_protected) {
    long int pos, alen=LENGTH(VECTOR_ELT(attr, 0));
    if (alen == 4) {
      pos=REAL(VECTOR_ELT(attr, 0))[3];
      SET_VECTOR_ELT(R_igraph_attribute_protected, pos, newattr);
    } else {
      SEXP tmp=PROTECT(NEW_NUMERIC(4)); px++;
      REAL(tmp)[0] = REAL(VECTOR_ELT(attr, 0))[0];
      REAL(tmp)[1] = REAL(VECTOR_ELT(attr, 0))[1];
      REAL(tmp)[2] = REAL(VECTOR_ELT(attr, 0))[2];
      pos = REAL(tmp)[3] = R_igraph_attribute_protected_size;
      R_igraph_attribute_protected_size += 1;
      SET_VECTOR_ELT(newattr, 0, tmp);
    }
    SET_VECTOR_ELT(R_igraph_attribute_protected, pos, newattr);
  }

  UNPROTECT(px);
  return newattr;
}

SEXP R_igraph_attribute_add_edges_append1(igraph_vector_ptr_t *nattr, int j,
                                          int ne) {

  SEXP app = R_NilValue;
  igraph_attribute_record_t *tmprec=VECTOR(*nattr)[j-1];
  long int len = 0;

  switch(tmprec->type) {
  case IGRAPH_ATTRIBUTE_NUMERIC:
    len = igraph_vector_size(tmprec->value);
    break;
  case IGRAPH_ATTRIBUTE_BOOLEAN:
    len = igraph_vector_bool_size(tmprec->value);
    break;
  case IGRAPH_ATTRIBUTE_STRING:
    len = igraph_strvector_size(tmprec->value);
    break;
  case IGRAPH_ATTRIBUTE_R_OBJECT:
    igraph_error("R objects not implemented yet", __FILE__, __LINE__,
                 IGRAPH_UNIMPLEMENTED);
    return R_NilValue;
    break;
  default:
    igraph_error("Unknown attribute type, internal error", __FILE__, __LINE__,
                 IGRAPH_EINVAL);
    return R_NilValue;
    break;
  }

  if (len != ne) {
    igraph_error("Invalid attribute length", __FILE__, __LINE__,
                 IGRAPH_EINVAL);
    return R_NilValue;
  }

  switch (tmprec->type) {
  case IGRAPH_ATTRIBUTE_NUMERIC:
    PROTECT(app=NEW_NUMERIC(ne));
    igraph_vector_copy_to(tmprec->value, REAL(app));
    break;
  case IGRAPH_ATTRIBUTE_BOOLEAN:
    PROTECT(app=R_igraph_vector_bool_to_SEXP(tmprec->value));
    break;
  default: /* IGRAPH_ATTRIBUTE_STRING */
    PROTECT(app=R_igraph_strvector_to_SEXP(tmprec->value));
    break;
  }

  UNPROTECT(1);
  return app;
}

void R_igraph_attribute_add_edges_append(SEXP eal,
                                         const igraph_vector_t *edges,
                                         igraph_vector_ptr_t *nattr) {
  SEXP names;
  long int ealno, i;
  long int ne=igraph_vector_size(edges)/2, nattrno;
  SEXP rep = R_NilValue;
  int px = 0;

  ealno=GET_LENGTH(eal);
  names=PROTECT(GET_NAMES(eal)); px++;
  if (nattr==NULL) {
    nattrno=0;
  } else {
    nattrno=igraph_vector_ptr_size(nattr);
  }

  for (i=0; i<ealno; i++) {
    SEXP oldea=VECTOR_ELT(eal, i);
    const char *sexpname=CHAR(STRING_ELT(names, i));
    igraph_bool_t l=0;
    long int j;
    for (j=0; !l && j<nattrno; j++) {
      igraph_attribute_record_t *tmp=VECTOR(*nattr)[j];
      l=!strcmp(sexpname, tmp->name);
    }
    if (l) {
      /* This attribute is present in nattr */
      SEXP app = PROTECT(R_igraph_attribute_add_edges_append1(nattr, j, ne));
      SEXP newea = PROTECT(R_igraph_c2(oldea, app));
      SET_VECTOR_ELT(eal, i, newea);
      UNPROTECT(2);
    } else {
      /* No such attribute, append NA's */
      if (Rf_isNull(rep)) {
        SEXP l1 = PROTECT(Rf_install("rep")); px++;
        SEXP l2 = PROTECT(Rf_ScalarLogical(NA_LOGICAL)); px++;
        SEXP l3 = PROTECT(Rf_ScalarInteger((int) ne)); px++;
        SEXP l4 = PROTECT(Rf_lang3(l1, l2, l3)); px++;
        PROTECT(rep = Rf_eval(l4, R_GlobalEnv)); px++;
      }
      SEXP newea = PROTECT(R_igraph_c2(oldea, rep));
      SET_VECTOR_ELT(eal, i, newea);
      UNPROTECT(1);
    }
  }

  UNPROTECT(px);
}

int R_igraph_attribute_add_edges(igraph_t *graph,
                                 const igraph_vector_t *edges,
                                 igraph_vector_ptr_t *nattr) {
  SEXP attr=graph->attr;
  SEXP eal, names, newnames;
  igraph_vector_t news;
  long int ealno, i, origlen, nattrno, newattrs;
  long int ne=igraph_vector_size(edges)/2;
  int px = 0;

  if (igraph_vector_init(&news, 0)) Rf_error("Out of memory");
  IGRAPH_FINALLY(igraph_vector_destroy, &news);

  if (REAL(VECTOR_ELT(attr, 0))[0] + REAL(VECTOR_ELT(attr, 0))[1] > 1) {
    SEXP newattr = PROTECT(R_igraph_attribute_add_edges_dup(attr)); px++;
    attr=graph->attr=newattr;
  }

  eal=VECTOR_ELT(attr, 3);
  ealno=GET_LENGTH(eal);
  names=PROTECT(GET_NAMES(eal)); px++;
  if (nattr==NULL) {
    nattrno=0;
  } else {
    nattrno=igraph_vector_ptr_size(nattr);
  }
  origlen=igraph_ecount(graph)-ne;

  /* First add the new attributes, if any */
  newattrs=0;
  for (i=0; i<nattrno; i++) {
    igraph_attribute_record_t *nattr_entry=VECTOR(*nattr)[i];
    const char *nname=nattr_entry->name;
    long int j;
    igraph_bool_t l=0;
    for (j=0; !l && j<ealno; j++) {
      l=!strcmp(nname, CHAR(STRING_ELT(names, j)));
    }
    if (!l) {
      newattrs++;
      if (igraph_vector_push_back(&news, i)) Rf_error("Out of memory");
    }
  }
  if (newattrs != 0) {
    SEXP app, neweal;
    PROTECT(app=NEW_LIST(newattrs));
    PROTECT(newnames=NEW_CHARACTER(newattrs));
    SEXP l1 = PROTECT(Rf_install("rep"));
    SEXP l2 = PROTECT(Rf_ScalarLogical(NA_LOGICAL));
    SEXP l3 = PROTECT(Rf_ScalarInteger((int) origlen));
    SEXP l4 = PROTECT(Rf_lang3(l1, l2, l3));
    SEXP rep = PROTECT(Rf_eval(l4, R_GlobalEnv));
    for (i=0; i<newattrs; i++) {
      igraph_attribute_record_t *tmp=
        VECTOR(*nattr)[ (long int) VECTOR(news)[i]];
      SET_VECTOR_ELT(app, i, rep);
      SET_STRING_ELT(newnames, i, Rf_mkChar(tmp->name));
    }
    PROTECT(neweal=R_igraph_c2(eal, app));
    PROTECT(newnames=R_igraph_c2(names, newnames));
    SET_NAMES(neweal, newnames);
    SET_VECTOR_ELT(attr, 3, neweal);
    eal=VECTOR_ELT(attr, 3);
    UNPROTECT(9);
  }
  igraph_vector_destroy(&news);
  IGRAPH_FINALLY_CLEAN(1);

  /* Now append the new values */
  R_igraph_attribute_add_edges_append(eal, edges, nattr);

  UNPROTECT(px);

  return 0;
}

/* void R_igraph_attribute_delete_edges(igraph_t *graph,  */
/*                                   const igraph_vector_t *idx) { */
/*   SEXP attr=graph->attr; */
/*   SEXP eal; */
/*   long int ealno, i; */
/*   if (REAL(VECTOR_ELT(attr, 0))[0]+REAL(VECTOR_ELT(attr, 0))[1] > 1) { */
/*     SEXP newattr; */
/*     PROTECT(newattr=Rf_duplicate(attr)); */
/*     REAL(VECTOR_ELT(attr, 0))[1] -= 1; */
/*     if (REAL(VECTOR_ELT(attr, 0))[1] == 0) { */
/*       R_ReleaseObject(attr); */
/*     } */
/*     REAL(VECTOR_ELT(newattr, 0))[0] = 0; */
/*     REAL(VECTOR_ELT(newattr, 0))[1] = 1; */
/*     attr=graph->attr=newattr; */
/*   } */

/*   eal=VECTOR_ELT(attr, 3); */
/*   ealno=GET_LENGTH(eal); */
/*   for (i=0; i<ealno; i++) { */
/*     SEXP oldea=VECTOR_ELT(eal, i), newea, ss; */
/*     long int origlen=GET_LENGTH(oldea); */
/*     long int newlen=0, j; */
/*     /\* create subscript vector *\/ */
/*     for (j=0; j<origlen; j++) { */
/*       if (VECTOR(*idx)[j] > 0) { */
/*      newlen++; */
/*       } */
/*     } */
/*     PROTECT(ss=NEW_NUMERIC(newlen)); */
/*     for (j=0; j<origlen; j++) { */
/*       if (VECTOR(*idx)[j] > 0) { */
/*      REAL(ss)[(long int)VECTOR(*idx)[j]-1] = j+1; */
/*       } */
/*     } */
/*     PROTECT(newea=EVAL(lang3(Rf_install("["), oldea, ss))); */
/*     SET_VECTOR_ELT(eal, i, newea); */
/*     UNPROTECT(2); */
/*   } */
/* } */

int R_igraph_attribute_permute_edges_same(const igraph_t *graph,
                                          igraph_t *newgraph,
                                          const igraph_vector_t *idx) {

  SEXP attr=newgraph->attr;
  SEXP eal;
  long int i, ealno;
  long int idxlen=igraph_vector_size(idx);
  SEXP ss;
  int px = 0;

  /* We copy if we need to */
  if (REAL(VECTOR_ELT(attr, 0))[0]+REAL(VECTOR_ELT(attr, 0))[1] > 1) {
    SEXP newattr=Rf_duplicate(attr);
    if (R_igraph_attribute_protected) {
      PROTECT(newattr); px++;
    } else {
      R_PreserveObject(newattr);
    }
    REAL(VECTOR_ELT(attr, 0))[1] -= 1;
    if (!R_igraph_attribute_protected &&
        REAL(VECTOR_ELT(attr, 0))[1] == 0) {
      R_ReleaseObject(attr);
    }
    REAL(VECTOR_ELT(newattr, 0))[0] = 0;
    REAL(VECTOR_ELT(newattr, 0))[1] = 1;
    if (R_igraph_attribute_protected) {
      long int pos, alen=LENGTH(VECTOR_ELT(attr, 0));
      if (alen == 4) {
        pos=REAL(VECTOR_ELT(attr, 0))[3];
        SET_VECTOR_ELT(R_igraph_attribute_protected, pos, newattr);
      } else {
        SEXP tmp=PROTECT(NEW_NUMERIC(4)); px++;
        REAL(tmp)[0] = REAL(VECTOR_ELT(attr, 0))[0];
        REAL(tmp)[1] = REAL(VECTOR_ELT(attr, 0))[1];
        REAL(tmp)[2] = REAL(VECTOR_ELT(attr, 0))[2];
        pos = REAL(tmp)[3] = R_igraph_attribute_protected_size;
        R_igraph_attribute_protected_size += 1;
        SET_VECTOR_ELT(newattr, 0, tmp);
      }
      SET_VECTOR_ELT(R_igraph_attribute_protected, pos, newattr);
    }
    attr=newgraph->attr=newattr;
  }

  eal=VECTOR_ELT(attr,3);
  ealno=GET_LENGTH(eal);

  /* If we have no edge attributes, then we don't need to do anything */
  if (ealno==0) { UNPROTECT(px); return 0; }

  /* Convert idx to an R object, we will use this for indexing */
  PROTECT(ss=NEW_INTEGER(idxlen)); px++;
  for (i=0; i<idxlen; i++) {
    INTEGER(ss)[i] = (int) VECTOR(*idx)[i]+1;
  }

  for (i=0; i<ealno; i++) {
    SEXP oldea=VECTOR_ELT(eal, i);

    /* We do NOT do any copying, the attributes were already copied,
       we're doing this in place. */
    SEXP l1 = PROTECT(Rf_install("["));
    SEXP l2 = PROTECT(Rf_lang3(l1, oldea, ss));
    SEXP newea = PROTECT(Rf_eval(l2, R_GlobalEnv));
    SET_VECTOR_ELT(eal, i, newea);
    UNPROTECT(3);
  }

  UNPROTECT(px);
  return 0;
}

int R_igraph_attribute_permute_edges_diff(const igraph_t *graph,
                                          igraph_t *newgraph,
                                          const igraph_vector_t *idx) {

  SEXP attr=graph->attr;
  SEXP toattr=newgraph->attr;
  SEXP eal, toeal;
  SEXP names;
  long int i, ealno;
  long int idxlen=igraph_vector_size(idx);
  SEXP ss;

  eal=VECTOR_ELT(attr,3);
  ealno=GET_LENGTH(eal);

  /* If we have no vertex attributes, then we don't need to do anything */
  if (ealno==0) { return 0; }

  /* Convert idx to an R object, we will use this for indexing */
  PROTECT(ss=NEW_INTEGER(idxlen));
  for (i=0; i<idxlen; i++) {
    INTEGER(ss)[i] = (int) VECTOR(*idx)[i]+1;
  }

  /* Resize the vertex attribute list in 'newgraph' */
  PROTECT(toeal=NEW_LIST(ealno));
  PROTECT(names=GET_NAMES(eal));
  SET_NAMES(toeal, names);
  UNPROTECT(1);

  for (i=0; i<ealno; i++) {
    SEXP oldea=VECTOR_ELT(eal, i);
    SEXP l1 = PROTECT(Rf_install("["));
    SEXP l2 = PROTECT(Rf_lang3(l1, oldea, ss));
    SEXP newea = PROTECT(Rf_eval(l2, R_GlobalEnv));
    SET_VECTOR_ELT(toeal, i, newea);
    UNPROTECT(3);
  }

  SET_VECTOR_ELT(toattr, 3, toeal);

  UNPROTECT(2);
  return 0;
}

int R_igraph_attribute_permute_edges(const igraph_t *graph,
                                     igraph_t *newgraph,
                                     const igraph_vector_t *idx) {
  if (graph==newgraph) {
    return R_igraph_attribute_permute_edges_same(graph, newgraph, idx);
  } else {
    return R_igraph_attribute_permute_edges_diff(graph, newgraph, idx);
  }
}

int R_igraph_attribute_get_info(const igraph_t *graph,
                                igraph_strvector_t *gnames,
                                igraph_vector_t *gtypes,
                                igraph_strvector_t *vnames,
                                igraph_vector_t *vtypes,
                                igraph_strvector_t *enames,
                                igraph_vector_t *etypes) {
  igraph_strvector_t *names[3] = { gnames, vnames, enames };
  igraph_vector_t *types[3] = { gtypes, vtypes, etypes };
  long int i, j;

  SEXP attr=graph->attr;

  for (i=0; i<3; i++) {
    igraph_strvector_t *n=names[i];
    igraph_vector_t *t=types[i];
    SEXP al=VECTOR_ELT(attr, i+1);

    if (n) {                    /* return names */
      SEXP names = PROTECT(GET_NAMES(al));
      R_igraph_SEXP_to_strvector_copy(names, n);
      UNPROTECT(1);
    }

    if (t) {                    /* return types */
      igraph_vector_resize(t, GET_LENGTH(al));
      for (j=0; j<GET_LENGTH(al); j++) {
        SEXP a=VECTOR_ELT(al, j);
        if (TYPEOF(a)==REALSXP || TYPEOF(a)==INTSXP) {
          VECTOR(*t)[j]=IGRAPH_ATTRIBUTE_NUMERIC;
        } else if (IS_LOGICAL(a)) {
          VECTOR(*t)[j]=IGRAPH_ATTRIBUTE_BOOLEAN;
        } else if (IS_CHARACTER(a)) {
          VECTOR(*t)[j]=IGRAPH_ATTRIBUTE_STRING;
        } else {
          VECTOR(*t)[j]=IGRAPH_ATTRIBUTE_R_OBJECT;
        }
      }
    }
  }

  return 0;
}

igraph_bool_t R_igraph_attribute_has_attr(const igraph_t *graph,
                                          igraph_attribute_elemtype_t type,
                                          const char *name) {
  long int attrnum;
  SEXP res;

  switch (type) {
  case IGRAPH_ATTRIBUTE_GRAPH:
    attrnum=1;
    break;
  case IGRAPH_ATTRIBUTE_VERTEX:
    attrnum=2;
    break;
  case IGRAPH_ATTRIBUTE_EDGE:
    attrnum=3;
    break;
  default:
    IGRAPH_ERROR("Unkwown attribute element type", IGRAPH_EINVAL);
    break;
  }

  res=R_igraph_getListElement(VECTOR_ELT(graph->attr, attrnum), name);
  return res != R_NilValue;
}

int R_igraph_attribute_gettype(const igraph_t *graph,
                               igraph_attribute_type_t *type,
                               igraph_attribute_elemtype_t elemtype,
                               const char *name) {
  long int attrnum;
  SEXP res;

  switch (elemtype) {
  case IGRAPH_ATTRIBUTE_GRAPH:
    attrnum=1;
    break;
  case IGRAPH_ATTRIBUTE_VERTEX:
    attrnum=2;
    break;
  case IGRAPH_ATTRIBUTE_EDGE:
    attrnum=3;
    break;
  default:
    IGRAPH_ERROR("Unkwown attribute element type", IGRAPH_EINVAL);
    break;
  }

  res=R_igraph_getListElement(VECTOR_ELT(graph->attr, attrnum), name);
  if (IS_NUMERIC(res) || IS_INTEGER(res)) {
    *type=IGRAPH_ATTRIBUTE_NUMERIC;
  } else if (IS_LOGICAL(res)) {
    *type=IGRAPH_ATTRIBUTE_BOOLEAN;
  } else if (IS_CHARACTER(res)) {
    *type=IGRAPH_ATTRIBUTE_STRING;
  } else {
    *type=IGRAPH_ATTRIBUTE_R_OBJECT;
  }
  return 0;
}

int R_igraph_attribute_get_numeric_graph_attr(const igraph_t *graph,
                                              const char *name,
                                              igraph_vector_t *value) {
  SEXP gal=VECTOR_ELT(graph->attr, 1);
  SEXP ga=R_igraph_getListElement(gal, name);

  if (ga == R_NilValue) {
    IGRAPH_ERROR("No such attribute", IGRAPH_EINVAL);
  }
  if (!IS_NUMERIC(ga) && !IS_INTEGER(ga)) {
    IGRAPH_ERROR("Attribute not numeric", IGRAPH_EINVAL);
  }

  IGRAPH_CHECK(igraph_vector_resize(value, 1));
  if (IS_NUMERIC(ga)) {
    VECTOR(*value)[0]=REAL(ga)[0];
  } else { /* INTEGER */
    VECTOR(*value)[0]=INTEGER(ga)[0];
  }

  return 0;
}

int R_igraph_attribute_get_bool_graph_attr(const igraph_t *graph,
                                           const char *name,
                                           igraph_vector_bool_t *value) {
  SEXP gal=VECTOR_ELT(graph->attr, 1);
  SEXP ga=R_igraph_getListElement(gal, name);

  if (ga == R_NilValue) {
    IGRAPH_ERROR("No such attribute", IGRAPH_EINVAL);
  }
  if (!IS_LOGICAL(ga)) {
    IGRAPH_ERROR("Attribute not logical", IGRAPH_EINVAL);
  }

  IGRAPH_CHECK(igraph_vector_bool_resize(value, 1));
  VECTOR(*value)[0]=LOGICAL(ga)[0];

  return 0;
}

int R_igraph_attribute_get_string_graph_attr(const igraph_t *graph,
                                             const char *name,
                                             igraph_strvector_t *value) {
  /* TODO: serialization */
  SEXP gal=VECTOR_ELT(graph->attr, 1);
  SEXP ga=R_igraph_getListElement(gal, name);

  if (ga == R_NilValue) {
    IGRAPH_ERROR("No such attribute", IGRAPH_EINVAL);
  }
  if (!IS_CHARACTER(ga)) {
    IGRAPH_ERROR("Attribute is not character", IGRAPH_EINVAL);
  }

  IGRAPH_CHECK(igraph_strvector_resize(value, 1));
  IGRAPH_CHECK(igraph_strvector_set(value, 0, CHAR(STRING_ELT(ga, 0))));

  return 0;
}

int R_igraph_attribute_get_numeric_vertex_attr(const igraph_t *graph,
                                               const char *name,
                                               igraph_vs_t vs,
                                               igraph_vector_t *value) {
  /* TODO: serialization */
  SEXP val=VECTOR_ELT(graph->attr, 2);
  SEXP va=R_igraph_getListElement(val, name);
  igraph_vector_t newvalue;

  if (va == R_NilValue) {
    IGRAPH_ERROR("No such attribute", IGRAPH_EINVAL);
  }
  if (!IS_NUMERIC(va) && !IS_INTEGER(va)) {
    IGRAPH_ERROR("Attribute not numeric", IGRAPH_EINVAL);
  }

  if (igraph_vs_is_all(&vs)) {
    R_SEXP_to_vector_copy(AS_NUMERIC(va), &newvalue);
    igraph_vector_destroy(value);
    *value=newvalue;
  } else {
    igraph_vit_t it;
    long int i=0;
    IGRAPH_CHECK(igraph_vit_create(graph, vs, &it));
    IGRAPH_FINALLY(igraph_vit_destroy, &it);
    IGRAPH_CHECK(igraph_vector_resize(value, IGRAPH_VIT_SIZE(it)));
    if (IS_NUMERIC(va)) {
      while (!IGRAPH_VIT_END(it)) {
        long int v=IGRAPH_VIT_GET(it);
        VECTOR(*value)[i]=REAL(va)[v];
        IGRAPH_VIT_NEXT(it);
        i++;
      }
    } else if (IS_INTEGER(va)) {
      while (!IGRAPH_VIT_END(it)) {
        long int v=IGRAPH_VIT_GET(it);
        VECTOR(*value)[i]=INTEGER(va)[v];
        IGRAPH_VIT_NEXT(it);
        i++;
      }
    }
    igraph_vit_destroy(&it);
    IGRAPH_FINALLY_CLEAN(1);
  }

  return 0;
}

int R_igraph_attribute_get_bool_vertex_attr(const igraph_t *graph,
                                            const char *name,
                                            igraph_vs_t vs,
                                            igraph_vector_bool_t *value) {
  /* TODO: serialization */
  SEXP val=VECTOR_ELT(graph->attr, 2);
  SEXP va=R_igraph_getListElement(val, name);
  igraph_vector_bool_t newvalue;

  if (va == R_NilValue) {
    IGRAPH_ERROR("No such attribute", IGRAPH_EINVAL);
  }
  if (!IS_LOGICAL(va)) {
    IGRAPH_ERROR("Attribute not logical", IGRAPH_EINVAL);
  }

  if (igraph_vs_is_all(&vs)) {
    R_SEXP_to_vector_bool_copy(va, &newvalue);
    igraph_vector_bool_destroy(value);
    *value=newvalue;
  } else {
    igraph_vit_t it;
    long int i=0;
    IGRAPH_CHECK(igraph_vit_create(graph, vs, &it));
    IGRAPH_FINALLY(igraph_vit_destroy, &it);
    IGRAPH_CHECK(igraph_vector_bool_resize(value, IGRAPH_VIT_SIZE(it)));
    while (!IGRAPH_VIT_END(it)) {
      long int v=IGRAPH_VIT_GET(it);
      VECTOR(*value)[i]=LOGICAL(va)[v];
      IGRAPH_VIT_NEXT(it);
      i++;
    }
    igraph_vit_destroy(&it);
    IGRAPH_FINALLY_CLEAN(1);
  }

  return 0;
}

int R_igraph_attribute_get_string_vertex_attr(const igraph_t *graph,
                                              const char *name,
                                              igraph_vs_t vs,
                                              igraph_strvector_t *value) {
  /* TODO: serialization */
  SEXP val, va;

  val=VECTOR_ELT(graph->attr, 2);
  va=R_igraph_getListElement(val, name);
  if (va == R_NilValue) {
    IGRAPH_ERROR("No such attribute", IGRAPH_EINVAL);
  }
  if (!IS_CHARACTER(va)) {
    IGRAPH_ERROR("Attribute is not character", IGRAPH_EINVAL);
  }

  if (igraph_vs_is_all(&vs)) {
    R_igraph_SEXP_to_strvector_copy(va, value);
  } else {
    igraph_vit_t it;
    long int i=0;
    IGRAPH_CHECK(igraph_vit_create(graph, vs, &it));
    IGRAPH_FINALLY(igraph_vit_destroy, &it);
    IGRAPH_CHECK(igraph_strvector_resize(value, IGRAPH_VIT_SIZE(it)));
    while (!IGRAPH_VIT_END(it)) {
      long int v=IGRAPH_VIT_GET(it);
      const char *str=CHAR(STRING_ELT(va, v));
      IGRAPH_CHECK(igraph_strvector_set(value, i, str));
      IGRAPH_VIT_NEXT(it);
      i++;
    }
    igraph_vit_destroy(&it);
    IGRAPH_FINALLY_CLEAN(1);
  }

  return 0;
}

int R_igraph_attribute_get_numeric_edge_attr(const igraph_t *graph,
                                             const char *name,
                                             igraph_es_t es,
                                             igraph_vector_t *value) {
  /* TODO: serialization */
  SEXP eal=VECTOR_ELT(graph->attr, 3);
  SEXP ea=R_igraph_getListElement(eal, name);
  igraph_vector_t newvalue;

  if (ea == R_NilValue) {
    IGRAPH_ERROR("No such attribute", IGRAPH_EINVAL);
  }
  if (!IS_NUMERIC(ea) && !IS_INTEGER(ea)) {
    IGRAPH_ERROR("Attribute is not numeric", IGRAPH_EINVAL);
  }

  if (igraph_es_is_all(&es)) {
    R_SEXP_to_vector_copy(AS_NUMERIC(ea), &newvalue);
    igraph_vector_destroy(value);
    *value=newvalue;
  } else {
    igraph_eit_t it;
    long int i=0;
    IGRAPH_CHECK(igraph_eit_create(graph, es, &it));
    IGRAPH_FINALLY(igraph_eit_destroy, &it);
    IGRAPH_CHECK(igraph_vector_resize(value, IGRAPH_EIT_SIZE(it)));
    if (IS_NUMERIC(ea)) {
      while (!IGRAPH_EIT_END(it)) {
        long int e=IGRAPH_EIT_GET(it);
        VECTOR(*value)[i]=REAL(ea)[e];
        IGRAPH_EIT_NEXT(it);
        i++;
      }
    } else { /* INTEGER */
      while (!IGRAPH_EIT_END(it)) {
        long int e=IGRAPH_EIT_GET(it);
        VECTOR(*value)[i]=INTEGER(ea)[e];
        IGRAPH_EIT_NEXT(it);
        i++;
      }
    }
    igraph_eit_destroy(&it);
    IGRAPH_FINALLY_CLEAN(1);
  }

  return 0;
}

int R_igraph_attribute_get_bool_edge_attr(const igraph_t *graph,
                                          const char *name,
                                          igraph_es_t es,
                                          igraph_vector_bool_t *value) {
  /* TODO: serialization */
  SEXP eal=VECTOR_ELT(graph->attr, 3);
  SEXP ea=R_igraph_getListElement(eal, name);
  igraph_vector_bool_t newvalue;

  if (ea == R_NilValue) {
    IGRAPH_ERROR("No such attribute", IGRAPH_EINVAL);
  }
  if (!IS_LOGICAL(ea)) {
    IGRAPH_ERROR("Attribute not logical", IGRAPH_EINVAL);
  }

  if (igraph_es_is_all(&es)) {
    R_SEXP_to_vector_bool_copy(ea, &newvalue);
    igraph_vector_bool_destroy(value);
    *value=newvalue;
  } else {
    igraph_eit_t it;
    long int i=0;
    IGRAPH_CHECK(igraph_eit_create(graph, es, &it));
    IGRAPH_FINALLY(igraph_eit_destroy, &it);
    IGRAPH_CHECK(igraph_vector_bool_resize(value, IGRAPH_EIT_SIZE(it)));
    while (!IGRAPH_EIT_END(it)) {
      long int e=IGRAPH_EIT_GET(it);
      VECTOR(*value)[i]=LOGICAL(ea)[e];
      IGRAPH_EIT_NEXT(it);
      i++;
    }
    igraph_eit_destroy(&it);
    IGRAPH_FINALLY_CLEAN(1);
  }

  return 0;
}

int R_igraph_attribute_get_string_edge_attr(const igraph_t *graph,
                                            const char *name,
                                            igraph_es_t es,
                                            igraph_strvector_t *value) {
  /* TODO: serialization */
  SEXP eal=VECTOR_ELT(graph->attr, 3);
  SEXP ea=R_igraph_getListElement(eal, name);

  if (ea == R_NilValue) {
    IGRAPH_ERROR("No such attribute", IGRAPH_EINVAL);
  }
  if (!IS_CHARACTER(ea)) {
    IGRAPH_ERROR("Attribute is not character", IGRAPH_EINVAL);
  }

  if (igraph_es_is_all(&es)) {
    R_igraph_SEXP_to_strvector_copy(ea, value);
  } else {
    igraph_eit_t it;
    long int i=0;
    IGRAPH_CHECK(igraph_eit_create(graph, es, &it));
    IGRAPH_FINALLY(igraph_eit_destroy, &it);
    IGRAPH_CHECK(igraph_strvector_resize(value, IGRAPH_EIT_SIZE(it)));
    while (!IGRAPH_EIT_END(it)) {
      long int e=IGRAPH_EIT_GET(it);
      const char *str=CHAR(STRING_ELT(ea, e));
      IGRAPH_CHECK(igraph_strvector_set(value, i, str));
      IGRAPH_EIT_NEXT(it);
      i++;
    }
    igraph_eit_destroy(&it);
    IGRAPH_FINALLY_CLEAN(1);
  }

  return 0;
}

SEXP R_igraph_ac_sum_numeric(SEXP attr,
                             const igraph_vector_ptr_t *merges) {
  SEXP res;
  SEXP attr2;
  long int i, len=igraph_vector_ptr_size(merges);

  PROTECT(attr2=AS_NUMERIC(attr));
  PROTECT(res=NEW_NUMERIC(len));

  for (i=0; i<len; i++) {
    igraph_vector_t *v=VECTOR(*merges)[i];
    long int j, n=igraph_vector_size(v);
    igraph_real_t s=0.0;
    for (j=0; j<n; j++) {
      long int src=(long int) VECTOR(*v)[j];
      s += REAL(attr2)[src];
    }
    REAL(res)[i] = s;
  }

  UNPROTECT(2);
  return res;
}

SEXP R_igraph_ac_prod_numeric(SEXP attr,
                              const igraph_vector_ptr_t *merges) {
  SEXP res;
  SEXP attr2;
  long int i, len=igraph_vector_ptr_size(merges);

  PROTECT(attr2=AS_NUMERIC(attr));
  PROTECT(res=NEW_NUMERIC(len));

  for (i=0; i<len; i++) {
    igraph_vector_t *v=VECTOR(*merges)[i];
    long int j, n=igraph_vector_size(v);
    igraph_real_t s=1.0;
    for (j=0; j<n; j++) {
      long int src=(long int) VECTOR(*v)[j];
      s *= REAL(attr2)[src];
    }
    REAL(res)[i] = s;
  }

  UNPROTECT(2);
  return res;
}

SEXP R_igraph_ac_min_numeric(SEXP attr,
                             const igraph_vector_ptr_t *merges) {
  SEXP res;
  SEXP attr2;
  long int i, len=igraph_vector_ptr_size(merges);

  PROTECT(attr2=AS_NUMERIC(attr));
  PROTECT(res=NEW_NUMERIC(len));

  for (i=0; i<len; i++) {
    igraph_vector_t *v=VECTOR(*merges)[i];
    long int j, n=igraph_vector_size(v);
    igraph_real_t m= n > 0 ? REAL(attr2)[(long) VECTOR(*v)[0] ] : NA_REAL;
    for (j=1; j<n; j++) {
      long int src=(long int) VECTOR(*v)[j];
      igraph_real_t val= REAL(attr2)[src];
      if (val < m) {
        m=val;
      }
    }
    REAL(res)[i] = m;
  }

  UNPROTECT(2);
  return res;
}

SEXP R_igraph_ac_max_numeric(SEXP attr,
                             const igraph_vector_ptr_t *merges) {
  SEXP res;
  SEXP attr2;
  long int i, len=igraph_vector_ptr_size(merges);

  PROTECT(attr2=AS_NUMERIC(attr));
  PROTECT(res=NEW_NUMERIC(len));

  for (i=0; i<len; i++) {
    igraph_vector_t *v=VECTOR(*merges)[i];
    long int j, n=igraph_vector_size(v);
    igraph_real_t m= n > 0 ? REAL(attr2)[(long) VECTOR(*v)[0] ] : NA_REAL;
    for (j=1; j<n; j++) {
      long int src=(long int) VECTOR(*v)[j];
      igraph_real_t val= REAL(attr2)[src];
      if (val > m) {
        m=val;
      }
    }
    REAL(res)[i] = m;
  }

  UNPROTECT(2);
  return res;
}

SEXP R_igraph_ac_random_numeric(SEXP attr,
                                const igraph_vector_ptr_t *merges) {
  SEXP res;
  SEXP attr2;
  long int i, len=igraph_vector_ptr_size(merges);

  PROTECT(attr2=AS_NUMERIC(attr));
  PROTECT(res=NEW_NUMERIC(len));

  RNG_BEGIN();

  for (i=0; i<len; i++) {
    igraph_vector_t *v=VECTOR(*merges)[i];
    long int n=igraph_vector_size(v);
    if (n==0) {
      REAL(res)[i]=NA_REAL;
    } else if (n==1) {
      REAL(res)[i]=REAL(attr2)[(long) VECTOR(*v)[0] ];
    } else {
      long int r=RNG_INTEGER(0,n-1);
      REAL(res)[i]=REAL(attr2)[(long) VECTOR(*v)[r] ];
    }
  }

  RNG_END();

  UNPROTECT(2);
  return res;
}

SEXP R_igraph_ac_first_numeric(SEXP attr,
                               const igraph_vector_ptr_t *merges) {
  SEXP res;
  SEXP attr2;
  long int i, len=igraph_vector_ptr_size(merges);

  PROTECT(attr2=AS_NUMERIC(attr));
  PROTECT(res=NEW_NUMERIC(len));

  for (i=0; i<len; i++) {
    igraph_vector_t *v=VECTOR(*merges)[i];
    long int n=igraph_vector_size(v);
    if (n==0) {
      REAL(res)[i]=NA_REAL;
    } else {
      REAL(res)[i]=REAL(attr2)[(long) VECTOR(*v)[0] ];
    }
  }

  UNPROTECT(2);
  return res;
}

SEXP R_igraph_ac_last_numeric(SEXP attr,
                              const igraph_vector_ptr_t *merges) {
  SEXP res;
  SEXP attr2;
  long int i, len=igraph_vector_ptr_size(merges);

  PROTECT(attr2=AS_NUMERIC(attr));
  PROTECT(res=NEW_NUMERIC(len));

  for (i=0; i<len; i++) {
    igraph_vector_t *v=VECTOR(*merges)[i];
    long int n=igraph_vector_size(v);
    if (n==0) {
      REAL(res)[i]=NA_REAL;
    } else {
      REAL(res)[i]=REAL(attr2)[(long) VECTOR(*v)[n-1] ];
    }
  }

  UNPROTECT(2);
  return res;
}

SEXP R_igraph_ac_mean_numeric(SEXP attr,
                              const igraph_vector_ptr_t *merges) {
  SEXP res;
  SEXP attr2;
  long int i, len=igraph_vector_ptr_size(merges);

  PROTECT(attr2=AS_NUMERIC(attr));
  PROTECT(res=NEW_NUMERIC(len));

  for (i=0; i<len; i++) {
    igraph_vector_t *v=VECTOR(*merges)[i];
    long int j, n=igraph_vector_size(v);
    igraph_real_t s= n>0 ? 0.0 : NA_REAL;
    for (j=0; j<n; j++) {
      long int src=(long int) VECTOR(*v)[j];
      s += REAL(attr2)[src];
    }
    if (n>0) { s=s/n; }
    REAL(res)[i] = s;
  }

  UNPROTECT(2);
  return res;
}

SEXP R_igraph_ac_median_numeric(SEXP attr,
                                const igraph_vector_ptr_t *merges) {
  SEXP res;
  SEXP attr2;
  long int i, len=igraph_vector_ptr_size(merges);

  PROTECT(attr2=AS_NUMERIC(attr));
  PROTECT(res=NEW_NUMERIC(len));

  for (i=0; i<len; i++) {
    igraph_vector_t *v=VECTOR(*merges)[i];
    long int j, n=igraph_vector_size(v);
    SEXP tmp, call, tmp2;
    if (n==0) {
      REAL(res)[i] = NA_REAL;
    } else if (n==1) {
      REAL(res)[i] = REAL(attr2)[ (long) VECTOR(*v)[0] ];
    } else {
      PROTECT(tmp=NEW_NUMERIC(n));
      for (j=0; j<n; j++) {
        long int src=(long int) VECTOR(*v)[j];
        REAL(tmp)[j] = REAL(attr2)[src];
      }
      PROTECT(call=Rf_lang2(Rf_install("median"), tmp));
      PROTECT(tmp2=Rf_eval(call, R_GlobalEnv));
      REAL(res)[i] = REAL(tmp2)[0];
      UNPROTECT(3);
    }
  }

  UNPROTECT(2);
  return res;
}

SEXP R_igraph_ac_all_other(SEXP attr,
                           const igraph_vector_ptr_t *merges,
                           const char *function_name,
                           SEXP arg) {
  SEXP res, res2;
  long int i, len=igraph_vector_ptr_size(merges);

  PROTECT(res=NEW_LIST(len));

  for (i=0; i<len; i++) {
    igraph_vector_t *v=VECTOR(*merges)[i];
    long int j, n=igraph_vector_size(v);
    SEXP tmp;
    PROTECT(tmp=NEW_NUMERIC(n));
    for (j=0; j<n; j++) {
      long int src=(long int) VECTOR(*v)[j];
      REAL(tmp)[j] = src+1;
    }
    SEXP l1 = PROTECT(Rf_install(function_name));
    SEXP l2 = PROTECT(Rf_install("["));
    SEXP l3 = PROTECT(Rf_lang3(l2, attr, tmp));
    SEXP l4 = PROTECT(Rf_eval(l3, R_GlobalEnv));
    SEXP l5 = PROTECT(arg ? Rf_lang3(l1, l4, arg) : Rf_lang2(l1, l4));
    SEXP l6 = PROTECT(R_igraph_safe_eval(l5, NULL));
    SET_VECTOR_ELT(res, i, R_igraph_handle_safe_eval_result(l6));
    UNPROTECT(6);
    UNPROTECT(1);
  }

  if (IS_VECTOR(attr)) {
    /* try to simplify it */
    igraph_bool_t good=1;
    for (i=0; i<len; i++) {
      if (GET_LENGTH(VECTOR_ELT(res, i)) != 1) {
        good=0;
        break;
      }
    }
    if (good) {
      SEXP l1 = PROTECT(Rf_install("unlist"));
      SEXP l2 = PROTECT(Rf_ScalarLogical(0));
      SEXP l3 = PROTECT(Rf_lang3(l1, res, l2));
      res2 = Rf_eval(l3, R_GlobalEnv);
      UNPROTECT(3);
      UNPROTECT(1);
      return res2;
    }
  }

  UNPROTECT(1);
  return res;
}

SEXP R_igraph_ac_func(SEXP attr,
                      const igraph_vector_ptr_t *merges,
                      SEXP func) {
  SEXP res, res2;
  long int i, len=igraph_vector_ptr_size(merges);

  PROTECT(res=NEW_LIST(len));

  for (i=0; i<len; i++) {
    igraph_vector_t *v=VECTOR(*merges)[i];
    long int j, n=igraph_vector_size(v);
    SEXP tmp;
    PROTECT(tmp=NEW_NUMERIC(n));
    for (j=0; j<n; j++) {
      long int src=(long int) VECTOR(*v)[j];
      REAL(tmp)[j] = src+1;
    }
    SEXP l1 = PROTECT(Rf_install("["));
    SEXP l2 = PROTECT(Rf_lang3(l1, attr, tmp));
    SEXP l3 = PROTECT(Rf_eval(l2, R_GlobalEnv));
    SEXP l4 = PROTECT(Rf_lang2(func, l3));
    SEXP l5 = PROTECT(R_igraph_safe_eval(l4, NULL));
    SET_VECTOR_ELT(res, i, R_igraph_handle_safe_eval_result(l5));
    UNPROTECT(5);
    UNPROTECT(1);
  }

  if (IS_VECTOR(attr)) {
    /* try to simplify it */
    igraph_bool_t good=1;
    for (i=0; i<len; i++) {
      if (GET_LENGTH(VECTOR_ELT(res, i)) != 1) {
        good=0;
        break;
      }
    }
    if (good) {
      SEXP l1 = PROTECT(Rf_install("unlist"));
      SEXP l2 = PROTECT(Rf_ScalarLogical(0));
      SEXP l3 = PROTECT(Rf_lang3(l1, res, l2));
      res2 = Rf_eval(l3, R_GlobalEnv);
      UNPROTECT(3);
      UNPROTECT(1);
      return res2;
    }
  }

  UNPROTECT(1);
  return res;
}

int R_igraph_attribute_combine_vertices(const igraph_t *graph,
                         igraph_t *newgraph,
                         const igraph_vector_ptr_t *merges,
                         const igraph_attribute_combination_t *comb) {

  SEXP attr=graph->attr;
  SEXP toattr=newgraph->attr;
  SEXP val=VECTOR_ELT(attr, 2);
  long int i, j, valno=GET_LENGTH(val);
  SEXP names, newnames;
  SEXP res;
  int keepno=0;
  int *TODO;
  igraph_function_pointer_t *funcs;
  int px = 0;

  /* Create the TODO list first */
  PROTECT(names=GET_NAMES(val)); px++;
  TODO=igraph_Calloc(valno, int);
  if (!TODO) {
    UNPROTECT(px);
    IGRAPH_ERROR("Cannot combine edge attributes",
                 IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_free, TODO);
  funcs=igraph_Calloc(valno, igraph_function_pointer_t);
  if (!funcs) {
    UNPROTECT(px);
    IGRAPH_ERROR("Cannot combine edge attributes",
                 IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_free, funcs);
  for (i=0; i<valno; i++) {
    const char *name=CHAR(STRING_ELT(names, i));
    igraph_attribute_combination_type_t todo;
    igraph_function_pointer_t voidfunc;
    igraph_attribute_combination_query(comb, name, &todo, &voidfunc);
    TODO[i]=todo;
    funcs[i]=voidfunc;
    if (todo != IGRAPH_ATTRIBUTE_COMBINE_IGNORE) {
      keepno++;
    }
  }

  /* Not safe to UNPROTECT attributes */
  REAL(VECTOR_ELT(attr, 0))[2]=0;
  REAL(VECTOR_ELT(toattr, 0))[2]=0;

  PROTECT(res=NEW_LIST(keepno)); px++;
  PROTECT(newnames=NEW_CHARACTER(keepno)); px++;
  for (i=0, j=0; i<valno; i++) {
    SEXP va=VECTOR_ELT(val, i);
    const char *name=CHAR(STRING_ELT(names, i));
    igraph_attribute_combination_type_t todo=
      (igraph_attribute_combination_type_t) TODO[i];
    igraph_attribute_type_t type;
    igraph_function_pointer_t voidfunc=funcs[i];
    SEXP func;

    /* What kind of attribute */
    R_igraph_attribute_gettype(graph, &type,
                               IGRAPH_ATTRIBUTE_VERTEX, name);

    switch (todo) {
    case IGRAPH_ATTRIBUTE_COMBINE_DEFAULT:
      /* Never happens from R */
    case IGRAPH_ATTRIBUTE_COMBINE_IGNORE:
      break;
    case IGRAPH_ATTRIBUTE_COMBINE_FUNCTION:
      func = (SEXP) (void*) voidfunc;
      SET_VECTOR_ELT(res, j, R_igraph_ac_func(va, merges, func));
      break;
    case IGRAPH_ATTRIBUTE_COMBINE_SUM:
      if (type==IGRAPH_ATTRIBUTE_NUMERIC) {
        SET_VECTOR_ELT(res, j, R_igraph_ac_sum_numeric(va, merges));
      } else {
        SET_VECTOR_ELT(res, j, R_igraph_ac_all_other(va, merges, "sum", NULL));
      }
      break;
    case IGRAPH_ATTRIBUTE_COMBINE_PROD:
      if (type==IGRAPH_ATTRIBUTE_NUMERIC) {
        SET_VECTOR_ELT(res, j, R_igraph_ac_prod_numeric(va, merges));
      } else {
        SET_VECTOR_ELT(res, j, R_igraph_ac_all_other(va, merges, "prod", NULL));
      }
      break;
    case IGRAPH_ATTRIBUTE_COMBINE_MIN:
      if (type==IGRAPH_ATTRIBUTE_NUMERIC) {
        SET_VECTOR_ELT(res, j, R_igraph_ac_min_numeric(va, merges));
      } else {
        SET_VECTOR_ELT(res, j, R_igraph_ac_all_other(va, merges, "min", NULL));
      }
      break;
    case IGRAPH_ATTRIBUTE_COMBINE_MAX:
      if (type==IGRAPH_ATTRIBUTE_NUMERIC) {
        SET_VECTOR_ELT(res, j, R_igraph_ac_max_numeric(va, merges));
      } else {
        SET_VECTOR_ELT(res, j, R_igraph_ac_all_other(va, merges, "max", NULL));
      }
      break;
    case IGRAPH_ATTRIBUTE_COMBINE_RANDOM:
      if (type==IGRAPH_ATTRIBUTE_NUMERIC) {
        SET_VECTOR_ELT(res, j, R_igraph_ac_random_numeric(va, merges));
      } else {
        SEXP tx = PROTECT(Rf_ScalarInteger(1));
        SET_VECTOR_ELT(res, j, R_igraph_ac_all_other(va, merges, "sample",
                                                     tx));
        UNPROTECT(1);
      }
      break;
    case IGRAPH_ATTRIBUTE_COMBINE_FIRST:
      if (type==IGRAPH_ATTRIBUTE_NUMERIC) {
        SET_VECTOR_ELT(res, j, R_igraph_ac_first_numeric(va, merges));
      } else {
        SEXP tx = PROTECT(Rf_ScalarInteger(1));
        SET_VECTOR_ELT(res, j, R_igraph_ac_all_other(va, merges, "head",
                                                     tx));
        UNPROTECT(1);
      }
      break;
    case IGRAPH_ATTRIBUTE_COMBINE_LAST:
      if (type==IGRAPH_ATTRIBUTE_NUMERIC) {
        SET_VECTOR_ELT(res, j, R_igraph_ac_last_numeric(va, merges));
      } else {
        SEXP tx = PROTECT(Rf_ScalarInteger(1));
        SET_VECTOR_ELT(res, j, R_igraph_ac_all_other(va, merges, "tail",
                                                     tx));
        UNPROTECT(1);
      }
      break;
    case IGRAPH_ATTRIBUTE_COMBINE_MEAN:
      if (type==IGRAPH_ATTRIBUTE_NUMERIC) {
        SET_VECTOR_ELT(res, j, R_igraph_ac_mean_numeric(va, merges));
      } else {
        SET_VECTOR_ELT(res, j, R_igraph_ac_all_other(va, merges, "mean", NULL));
      }
      break;
    case IGRAPH_ATTRIBUTE_COMBINE_MEDIAN:
      if (type==IGRAPH_ATTRIBUTE_NUMERIC) {
        SET_VECTOR_ELT(res, j, R_igraph_ac_median_numeric(va, merges));
      } else {
        SET_VECTOR_ELT(res, j, R_igraph_ac_all_other(va, merges, "median", NULL));
      }
      break;
    case IGRAPH_ATTRIBUTE_COMBINE_CONCAT:
      SET_VECTOR_ELT(res, j, R_igraph_ac_all_other(va, merges, "c", NULL));
      break;
    default:
      UNPROTECT(px);
      IGRAPH_ERROR("Unknown attribute combination",
                   IGRAPH_UNIMPLEMENTED);
      break;
    }

    if (todo != IGRAPH_ATTRIBUTE_COMBINE_IGNORE) {
      SET_STRING_ELT(newnames, j, STRING_ELT(names, i));
      j++;
    }
  }

  /* It is now safe to UNPROTECT attributes */
  REAL(VECTOR_ELT(attr, 0))[2]=1;
  REAL(VECTOR_ELT(toattr, 0))[2]=1;

  igraph_free(funcs);
  igraph_free(TODO);
  IGRAPH_FINALLY_CLEAN(2);

  SET_NAMES(res, newnames);
  SET_VECTOR_ELT(toattr, 2, res);
  UNPROTECT(px);

  return 0;
}

int R_igraph_attribute_combine_edges(const igraph_t *graph,
                         igraph_t *newgraph,
                         const igraph_vector_ptr_t *merges,
                         const igraph_attribute_combination_t *comb) {

  SEXP attr=graph->attr;
  SEXP toattr=newgraph->attr;
  SEXP eal=VECTOR_ELT(attr, 3);
  long int i, j, ealno=GET_LENGTH(eal);
  SEXP names, newnames;
  SEXP res;
  int keepno=0;
  int *TODO;
  igraph_function_pointer_t *funcs;
  int px = 0;

  /* Create the TODO list first */
  PROTECT(names=GET_NAMES(eal)); px++;
  TODO=igraph_Calloc(ealno, int);
  if (!TODO) {
    UNPROTECT(px);
    IGRAPH_ERROR("Cannot combine edge attributes",
                 IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_free, TODO);
  funcs=igraph_Calloc(ealno, igraph_function_pointer_t);
  if (!funcs) {
    UNPROTECT(px);
    IGRAPH_ERROR("Cannot combine edge attributes",
                 IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_free, funcs);
  for (i=0; i<ealno; i++) {
    const char *name=CHAR(STRING_ELT(names, i));
    igraph_attribute_combination_type_t todo;
    igraph_function_pointer_t voidfunc;
    igraph_attribute_combination_query(comb, name, &todo, &voidfunc);
    TODO[i]=todo;
    funcs[i]=voidfunc;
    if (todo != IGRAPH_ATTRIBUTE_COMBINE_IGNORE) {
      keepno++;
    }
  }

  /* Not safe to UNPROTECT attributes */
  REAL(VECTOR_ELT(attr, 0))[2]=0;
  REAL(VECTOR_ELT(toattr, 0))[2]=0;

  PROTECT(res=NEW_LIST(keepno)); px++;
  PROTECT(newnames=NEW_CHARACTER(keepno)); px++;
  for (i=0, j=0; i<ealno; i++) {
    SEXP ea=VECTOR_ELT(eal, i);
    const char *name=CHAR(STRING_ELT(names, i));
    igraph_attribute_combination_type_t todo=
      (igraph_attribute_combination_type_t) TODO[i];
    igraph_attribute_type_t type;
    igraph_function_pointer_t voidfunc=funcs[i];
    SEXP func;

    /* What kind of attribute */
    R_igraph_attribute_gettype(graph, &type, IGRAPH_ATTRIBUTE_EDGE, name);

    switch (todo) {
    case IGRAPH_ATTRIBUTE_COMBINE_DEFAULT:
      /* Never happens from R */
    case IGRAPH_ATTRIBUTE_COMBINE_IGNORE:
      break;
    case IGRAPH_ATTRIBUTE_COMBINE_FUNCTION:
      func = (SEXP) (void*) voidfunc;
      SET_VECTOR_ELT(res, j, R_igraph_ac_func(ea, merges, func));
      break;
    case IGRAPH_ATTRIBUTE_COMBINE_SUM:
      if (type==IGRAPH_ATTRIBUTE_NUMERIC) {
        SET_VECTOR_ELT(res, j, R_igraph_ac_sum_numeric(ea, merges));
      } else {
        SET_VECTOR_ELT(res, j, R_igraph_ac_all_other(ea, merges, "sum", NULL));
      }
      break;
    case IGRAPH_ATTRIBUTE_COMBINE_PROD:
      if (type==IGRAPH_ATTRIBUTE_NUMERIC) {
        SET_VECTOR_ELT(res, j, R_igraph_ac_prod_numeric(ea, merges));
      } else {
        SET_VECTOR_ELT(res, j, R_igraph_ac_all_other(ea, merges, "prod", NULL));
      }
      break;
    case IGRAPH_ATTRIBUTE_COMBINE_MIN:
      if (type==IGRAPH_ATTRIBUTE_NUMERIC) {
        SET_VECTOR_ELT(res, j, R_igraph_ac_min_numeric(ea, merges));
      } else {
        SET_VECTOR_ELT(res, j, R_igraph_ac_all_other(ea, merges, "min", NULL));
      }
      break;
    case IGRAPH_ATTRIBUTE_COMBINE_MAX:
      if (type==IGRAPH_ATTRIBUTE_NUMERIC) {
        SET_VECTOR_ELT(res, j, R_igraph_ac_max_numeric(ea, merges));
      } else {
        SET_VECTOR_ELT(res, j, R_igraph_ac_all_other(ea, merges, "max", NULL));
      }
      break;
    case IGRAPH_ATTRIBUTE_COMBINE_RANDOM:
      if (type==IGRAPH_ATTRIBUTE_NUMERIC) {
        SET_VECTOR_ELT(res, j, R_igraph_ac_random_numeric(ea, merges));
      } else {
        SEXP tx = PROTECT(Rf_ScalarInteger(1));
        SET_VECTOR_ELT(res, j, R_igraph_ac_all_other(ea, merges, "sample",
                                                     tx));
        UNPROTECT(1);
      }
      break;
    case IGRAPH_ATTRIBUTE_COMBINE_FIRST:
      if (type==IGRAPH_ATTRIBUTE_NUMERIC) {
        SET_VECTOR_ELT(res, j, R_igraph_ac_first_numeric(ea, merges));
      } else {
        SEXP tx = PROTECT(Rf_ScalarInteger(1));
        SET_VECTOR_ELT(res, j, R_igraph_ac_all_other(ea, merges, "head",
                                                     tx));
        UNPROTECT(1);
      }
      break;
    case IGRAPH_ATTRIBUTE_COMBINE_LAST:
      if (type==IGRAPH_ATTRIBUTE_NUMERIC) {
        SET_VECTOR_ELT(res, j, R_igraph_ac_last_numeric(ea, merges));
      } else {
        SEXP tx = PROTECT(Rf_ScalarInteger(1));
        SET_VECTOR_ELT(res, j, R_igraph_ac_all_other(ea, merges, "tail",
                                                     tx));
        UNPROTECT(1);
      }
      break;
    case IGRAPH_ATTRIBUTE_COMBINE_MEAN:
      if (type==IGRAPH_ATTRIBUTE_NUMERIC) {
        SET_VECTOR_ELT(res, j, R_igraph_ac_mean_numeric(ea, merges));
      } else {
        SET_VECTOR_ELT(res, j, R_igraph_ac_all_other(ea, merges, "mean", NULL));
      }
      break;
    case IGRAPH_ATTRIBUTE_COMBINE_MEDIAN:
      if (type==IGRAPH_ATTRIBUTE_NUMERIC) {
        SET_VECTOR_ELT(res, j, R_igraph_ac_median_numeric(ea, merges));
      } else {
        SET_VECTOR_ELT(res, j, R_igraph_ac_all_other(ea, merges, "median", NULL));
      }
      break;
    case IGRAPH_ATTRIBUTE_COMBINE_CONCAT:
      SET_VECTOR_ELT(res, j, R_igraph_ac_all_other(ea, merges, "c", NULL));
      break;
    default:
      UNPROTECT(px);
      IGRAPH_ERROR("Unknown attribute combination",
                   IGRAPH_UNIMPLEMENTED);
      break;
    }

    if (todo != IGRAPH_ATTRIBUTE_COMBINE_IGNORE) {
      SET_STRING_ELT(newnames, j, STRING_ELT(names, i));
      j++;
    }
  }

  /* It is now safe to UNPROTECT attributes */
  REAL(VECTOR_ELT(attr, 0))[2]=1;
  REAL(VECTOR_ELT(toattr, 0))[2]=1;

  igraph_free(funcs);
  igraph_free(TODO);
  IGRAPH_FINALLY_CLEAN(2);

  SET_NAMES(res, newnames);
  SET_VECTOR_ELT(toattr, 3, res);
  UNPROTECT(px);

  return 0;
}

igraph_attribute_table_t R_igraph_attribute_table={
  &R_igraph_attribute_init, &R_igraph_attribute_destroy,
  &R_igraph_attribute_copy, &R_igraph_attribute_add_vertices,
  &R_igraph_attribute_permute_vertices,
  &R_igraph_attribute_combine_vertices,
  &R_igraph_attribute_add_edges,
  &R_igraph_attribute_permute_edges,
  &R_igraph_attribute_combine_edges,
  &R_igraph_attribute_get_info,
  &R_igraph_attribute_has_attr, &R_igraph_attribute_gettype,
  &R_igraph_attribute_get_numeric_graph_attr,
  &R_igraph_attribute_get_string_graph_attr,
  &R_igraph_attribute_get_bool_graph_attr,
  &R_igraph_attribute_get_numeric_vertex_attr,
  &R_igraph_attribute_get_string_vertex_attr,
  &R_igraph_attribute_get_bool_vertex_attr,
  &R_igraph_attribute_get_numeric_edge_attr,
  &R_igraph_attribute_get_string_edge_attr,
  &R_igraph_attribute_get_bool_edge_attr
};

igraph_attribute_table_t *R_igraph_attribute_oldtable;

/******************************************************
 * things to do before and after                      *
 * calling an interface function                      *
 *****************************************************/

/* borrowed from IGraph/M, thanks to @szhorvat */

static char R_igraph_error_reason[4096];
static int R_igraph_errors_count = 0;

static char R_igraph_warning_reason[4096];
static int R_igraph_warnings_count = 0;

static bool R_igraph_in_r_check = false;

void R_igraph_set_in_r_check(bool set) {
  R_igraph_in_r_check = set;
}

void R_igraph_error(void) {
  R_igraph_errors_count = 0;
  Rf_error("%s", R_igraph_error_reason);
}

void R_igraph_warning(void) {
  if (R_igraph_warnings_count > 0) {
    int count = R_igraph_warnings_count;
    R_igraph_warnings_count = 0;

    Rf_warning("%s", R_igraph_warning_reason);
  }
}

void R_igraph_interrupt(void) {
  R_igraph_errors_count = 0;
  // FIXME: Call into R to run
  // stop(structure(list(message = R_igraph_error_reason), class = c("interrupt", "condition")))
  Rf_error("%s", R_igraph_error_reason);
}

static inline bool is_punctuated(const char *str) {
  const size_t len = strlen(str);
  if (len == 0) {
    return true;
  } else if (str[len-1] == '.' || str[len-1] == '!' || str[len-1] == '?' || str[len-1] == '\n') {
    return true;
  } else {
    return false;
  }
}

static inline const char* maybe_add_punctuation(const char* msg, const char* punctuation) {
  return is_punctuated(msg) ? "" : punctuation;
}

void R_igraph_fatal_handler(const char *reason, const char *file, int line) {
#ifdef IGRAPH_SANITIZER_AVAILABLE
    __sanitizer_print_stack_trace();
#endif
  IGRAPH_FINALLY_FREE();
  Rf_error(
    "At %s:%i : %s%s This is an unexpected igraph error; please report this "
    "as a bug, along with the steps to reproduce it.\n"
    "Please restart your R session to avoid crashes or other surprising behavior.",
    file, line, reason, maybe_add_punctuation(reason, ".")
  );
}

void R_igraph_error_handler(const char *reason, const char *file,
                         int line, int igraph_errno) {

  /* We are not supposed to touch 'reason' after we have called
   * IGRAPH_FINALLY_FREE() because 'reason' might be allocated on the heap and
   * IGRAPH_FINALLY_FREE() can then clean it up. */

  if (R_igraph_errors_count == 0 || !R_igraph_in_r_check) {
    snprintf(R_igraph_error_reason, sizeof(R_igraph_error_reason),
      "At %s:%i : %s%s %s", file, line, reason,
      maybe_add_punctuation(reason, ","),
      igraph_strerror(igraph_errno));
    R_igraph_error_reason[sizeof(R_igraph_error_reason) - 1] = 0;

    // FIXME: This is a hack, we should replace all memory allocations in the
    // interface with RAII objects, and all longjmps with exceptions.
    if (!R_igraph_in_r_check) {
      IGRAPH_FINALLY_FREE();
      R_igraph_error();
    }
  }
  R_igraph_errors_count++;

  IGRAPH_FINALLY_FREE();
}

void R_igraph_warning_handler(const char *reason, const char *file,
                              int line, int igraph_errno) {
  if (R_igraph_warnings_count == 0) {
    snprintf(R_igraph_warning_reason, sizeof(R_igraph_warning_reason),
      "At %s:%i : %s%s", file, line, reason, maybe_add_punctuation(reason, "."));
    R_igraph_warning_reason[sizeof(R_igraph_warning_reason) - 1] = 0;
  }
  R_igraph_warnings_count++;
}

extern int R_interrupts_pending;

void checkInterruptFn(void *dummy) {
  IGRAPH_UNUSED(dummy);
  R_CheckUserInterrupt();
}

int R_igraph_interrupt_handler(void *data) {
  /* We need to call R_CheckUserInterrupt() regularly to enable interruptions.
   * However, if an interruption is pending, R_CheckUserInterrupt() will
   * longjmp back to the top level so we cannot clean up ourselves by calling
   * IGRAPH_FINALLY_FREE(). Therefore, we call R_CheckUserInterrupt()
   * encapsulated in checkInterruptFn(), called through R_ToplevelExec(). If
   * an interruption is pending, the function will properly return here instead
   * of doing a longjmp all the way to the top. If an interruption was indeed
   * pending, we then call IGRAPH_FINALLY_FREE(), knowing that the upcoming
   * invocation of R_CheckUserInterrupt() will longjmp. However, we need to
   * make sure that R_interrupts_pending = 1, in order to make sure that the
   * interrupt will longjmp. This means that the conditions used here must be
   * kept in sync with the source code of R_CheckUserInterrupt()
   */
  if (R_ToplevelExec(checkInterruptFn, NULL) == FALSE) {
    IGRAPH_FINALLY_FREE();
    return IGRAPH_INTERRUPTED;
  }
  return IGRAPH_SUCCESS;
}

int R_igraph_progress_handler(const char *message, igraph_real_t percent,
                              void * data) {
  SEXP ec;
  int ecint;
  SEXP l1 = PROTECT(Rf_install("getNamespace"));
  SEXP l2 = PROTECT(Rf_ScalarString(PROTECT(Rf_mkChar("igraph"))));
  SEXP l3 = PROTECT(Rf_lang2(l1, l2));
  SEXP rho = PROTECT(Rf_eval(l3, R_BaseEnv));

  SEXP l4 = PROTECT(Rf_install(".igraph.progress"));
  SEXP l5 = PROTECT(Rf_ScalarReal(percent));
  SEXP l6 = PROTECT(Rf_ScalarString(PROTECT(Rf_mkChar(message))));
  SEXP l7 = PROTECT(Rf_lang3(l4, l5, l6));
  PROTECT(ec=Rf_eval(l7, rho));

  ecint=INTEGER(ec)[0];
  UNPROTECT(11);
  return ecint;
}

int R_igraph_status_handler(const char *message, void *data) {
  SEXP l1 = PROTECT(Rf_install("getNamespace"));
  SEXP l2 = PROTECT(Rf_ScalarString(PROTECT(Rf_mkChar("igraph"))));
  SEXP l3 = PROTECT(Rf_lang2(l1, l2));
  SEXP rho = PROTECT(Rf_eval(l3, R_BaseEnv));

  SEXP l4 = PROTECT(Rf_install(".igraph.status"));
  SEXP l5 = PROTECT(Rf_ScalarString(PROTECT(Rf_mkChar(message))));
  SEXP l6 = PROTECT(Rf_lang2(l4, l5));
  PROTECT(Rf_eval(l6, rho));

  UNPROTECT(10);
  return 0;
}

static R_xlen_t R_igraph_altrep_length(SEXP vec) {
  SEXP xp=Rf_findVar(Rf_install("igraph"), R_altrep_data1(vec));
  igraph_t *g=(igraph_t*)(R_ExternalPtrAddr(xp));
  return igraph_ecount(g);
}

static void *R_igraph_altrep_from(SEXP vec, Rboolean writeable) {
  SEXP data=R_altrep_data2(vec);
  if (data == R_NilValue) {
    R_igraph_status_handler("Materializing 'from' vector.\n", NULL);
    SEXP xp=Rf_findVar(Rf_install("igraph"), R_altrep_data1(vec));
    igraph_t *g=(igraph_t*)(R_ExternalPtrAddr(xp));

    long int no_of_edges=igraph_ecount(g);
    data=NEW_NUMERIC(no_of_edges);
    memcpy(REAL(data), g->from.stor_begin, sizeof(igraph_real_t)*(size_t) no_of_edges);
    R_set_altrep_data2(vec, data);
  }

  return REAL(data);
}

static void *R_igraph_altrep_to(SEXP vec, Rboolean writeable) {
  SEXP data=R_altrep_data2(vec);
  if (data == R_NilValue) {
    R_igraph_status_handler("Materializing 'to' vector.\n", NULL);

    SEXP xp=Rf_findVar(Rf_install("igraph"), R_altrep_data1(vec));
    igraph_t *g=(igraph_t*)(R_ExternalPtrAddr(xp));

    long int no_of_edges=igraph_ecount(g);
    data=NEW_NUMERIC(no_of_edges);
    memcpy(REAL(data), g->to.stor_begin, sizeof(igraph_real_t)*(size_t) no_of_edges);
    R_set_altrep_data2(vec, data);
  }

  return REAL(data);
}

static R_altrep_class_t R_igraph_altrep_from_class;
static R_altrep_class_t R_igraph_altrep_to_class;

void R_igraph_init_vector_class(DllInfo *dll) {
  R_igraph_altrep_from_class=R_make_altreal_class("igraph_from", "base", dll);
  R_igraph_altrep_to_class=R_make_altreal_class("igraph_to", "base", dll);

  R_set_altrep_Length_method(R_igraph_altrep_from_class, R_igraph_altrep_length);
  R_set_altvec_Dataptr_method(R_igraph_altrep_from_class, R_igraph_altrep_from);

  R_set_altrep_Length_method(R_igraph_altrep_to_class, R_igraph_altrep_length);
  R_set_altvec_Dataptr_method(R_igraph_altrep_to_class, R_igraph_altrep_to);
}

void R_igraph_init_handlers(DllInfo *dll) {
  igraph_rng_R_install();

  igraph_set_fatal_handler(R_igraph_fatal_handler);
  igraph_set_error_handler(R_igraph_error_handler);
  igraph_set_warning_handler(R_igraph_warning_handler);
  igraph_set_interruption_handler(R_igraph_interrupt_handler);
  igraph_set_attribute_table(&R_igraph_attribute_table);
}

SEXP R_igraph_set_verbose(SEXP verbose) {
  if (LOGICAL(verbose)[0]) {
    igraph_set_status_handler(R_igraph_status_handler);
    igraph_set_progress_handler(R_igraph_progress_handler);
  } else {
    igraph_set_status_handler(0);
    igraph_set_progress_handler(0);
  }
  return R_NilValue;
}

SEXP R_igraph_finalizer(void) {
  IGRAPH_FINALLY_FREE();
  SEXP l1 = PROTECT(Rf_install("getNamespace"));
  SEXP l2 = PROTECT(Rf_ScalarString(PROTECT(Rf_mkChar("igraph"))));
  SEXP l3 = PROTECT(Rf_lang2(l1, l2));
  SEXP rho = PROTECT(Rf_eval(l3, R_BaseEnv));

  SEXP l4 = PROTECT(Rf_install(".igraph.progress"));
  SEXP l5 = PROTECT(Rf_ScalarReal(0.0));
  SEXP l6 = PROTECT(Rf_ScalarString(PROTECT(Rf_mkChar(""))));
  SEXP l7 = PROTECT(Rf_ScalarLogical(1));
  SEXP l8 = PROTECT(Rf_lang4(l4, l5, l6, l7));
  Rf_eval(l8, rho);
  UNPROTECT(11);
  return R_NilValue;
}

SEXP R_igraph_check_finally_stack(void) {
  if (!IGRAPH_FINALLY_STACK_EMPTY) {
    Rf_error("igraph callbacks cannot call igraph functions");
  }
  return R_NilValue;
}

/******************************************************
 * functions to convert igraph objects to SEXP
 *****************************************************/

SEXP R_igraph_vector_to_SEXP(const igraph_vector_t *v) {
  SEXP result;

  PROTECT(result=NEW_NUMERIC(igraph_vector_size(v)));
  igraph_vector_copy_to(v, REAL(result));
  UNPROTECT(1);
  return result;
}

SEXP R_igraph_vector_int_to_SEXP(const igraph_vector_int_t *v) {
  SEXP result;

  PROTECT(result=NEW_INTEGER(igraph_vector_int_size(v)));
  igraph_vector_int_copy_to(v, INTEGER(result));
  UNPROTECT(1);
  return result;
}

SEXP R_igraph_vector_to_SEXPp1(const igraph_vector_t *v) {
  SEXP result;
  long int i, n=igraph_vector_size(v);

  PROTECT(result=NEW_NUMERIC(n));
  for (i=0; i<n; i++) {
    REAL(result)[i]=VECTOR(*v)[i]+1;
  }
  UNPROTECT(1);
  return result;
}

SEXP R_igraph_vector_int_to_SEXPp1(const igraph_vector_int_t *v) {
  SEXP result;
  long int i, n=igraph_vector_int_size(v);

  PROTECT(result=NEW_INTEGER(n));
  for (i=0; i<n; i++) {
    INTEGER(result)[i]=VECTOR(*v)[i]+1;
  }
  UNPROTECT(1);
  return result;
}

SEXP R_igraph_0orvector_to_SEXP(const igraph_vector_t *v) {
  SEXP result;
  if (v) {
    PROTECT(result=R_igraph_vector_to_SEXP(v));
  } else {
    PROTECT(result=R_NilValue);
  }
  UNPROTECT(1);
  return result;
}

/* The same, plus destroy */
SEXP R_igraph_0orvector_to_SEXP_d(igraph_vector_t *v) {
  SEXP result;
  if (v) {
    PROTECT(result=R_igraph_vector_to_SEXP(v));
    igraph_vector_destroy(v);
  } else {
    PROTECT(result=R_NilValue);
  }
  UNPROTECT(1);
  return result;
}

SEXP R_igraph_0orvector_to_SEXPp1(const igraph_vector_t *v) {
  SEXP result;
  if (v) {
    PROTECT(result=R_igraph_vector_to_SEXPp1(v));
  } else {
    PROTECT(result=R_NilValue);
  }
  UNPROTECT(1);
  return result;
}

SEXP R_igraph_vector_bool_to_SEXP(const igraph_vector_bool_t *v) {
  SEXP result;
  long int n=igraph_vector_bool_size(v);

  PROTECT(result=NEW_LOGICAL(n));
  if (sizeof(igraph_bool_t)==sizeof(LOGICAL(result)[0])) {
    igraph_vector_bool_copy_to(v, LOGICAL(result));
  } else {
    long int i;
    for (i=0; i<n; i++) {
      LOGICAL(result)[i] = VECTOR(*v)[i];
    }
  }

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_vector_long_to_SEXP(const igraph_vector_long_t *v) {
  SEXP result;
  long int i, n=igraph_vector_long_size(v);
  double *rr;

  PROTECT(result=NEW_NUMERIC(n));
  rr=REAL(result);
  for (i=0; i<n; i++) {
    rr[i] = VECTOR(*v)[i];
  }

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_vector_long_to_SEXPp1(const igraph_vector_long_t *v) {
  SEXP result;
  long int i, n=igraph_vector_long_size(v);
  double *rr;

  PROTECT(result=NEW_NUMERIC(n));
  rr=REAL(result);
  for (i=0; i<n; i++) {
    rr[i] = VECTOR(*v)[i]+1;
  }

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_0orvector_bool_to_SEXP(const igraph_vector_bool_t *v) {
  SEXP result;
  if (v) {
    PROTECT(result=R_igraph_vector_bool_to_SEXP(v));
  } else {
    PROTECT(result=R_NilValue);
  }
  UNPROTECT(1);
  return result;
}

SEXP R_igraph_0orvector_long_to_SEXP(const igraph_vector_long_t *v) {
  SEXP result;
  if (v) {
    PROTECT(result=R_igraph_vector_long_to_SEXP(v));
  } else {
    PROTECT(result=R_NilValue);
  }
  UNPROTECT(1);
  return result;
}

SEXP R_igraph_vector_complex_to_SEXP(const igraph_vector_complex_t* v) {
  long int n=igraph_vector_complex_size(v);
  SEXP result;
  PROTECT(result=NEW_COMPLEX(n));
  igraph_vector_complex_copy_to(v, (igraph_complex_t*) COMPLEX(result));
  UNPROTECT(1);
  return result;
}

SEXP R_igraph_0orvector_complex_to_SEXP(const igraph_vector_complex_t *v) {
  SEXP result;
  if (v) {
    PROTECT(result=R_igraph_vector_complex_to_SEXP(v));
  } else {
    PROTECT(result=R_NilValue);
  }
  UNPROTECT(1);
  return result;
}

SEXP R_igraph_matrix_to_SEXP(const igraph_matrix_t *m) {

  SEXP result, dim;

  PROTECT(result=NEW_NUMERIC(igraph_matrix_size(m)));
  igraph_matrix_copy_to(m, REAL(result));
  PROTECT(dim=NEW_INTEGER(2));
  INTEGER(dim)[0]=(int) igraph_matrix_nrow(m);
  INTEGER(dim)[1]=(int) igraph_matrix_ncol(m);
  SET_DIM(result, dim);

  UNPROTECT(2);
  return result;
}

SEXP R_igraph_0ormatrix_to_SEXP(const igraph_matrix_t *m) {
  SEXP result;
  if (m) {
    PROTECT(result=R_igraph_matrix_to_SEXP(m));
  } else {
    PROTECT(result=R_NilValue);
  }
  UNPROTECT(1);
  return result;
}

SEXP R_igraph_matrix_complex_to_SEXP(const igraph_matrix_complex_t *m) {
  SEXP result, dim;
  PROTECT(result=NEW_COMPLEX(igraph_matrix_complex_size(m)));
  igraph_matrix_complex_copy_to(m, (igraph_complex_t*) COMPLEX(result));
  PROTECT(dim=NEW_INTEGER(2));
  INTEGER(dim)[0]=(int) igraph_matrix_complex_nrow(m);
  INTEGER(dim)[1]=(int) igraph_matrix_complex_ncol(m);
  SET_DIM(result, dim);
  UNPROTECT(2);
  return result;
}

SEXP R_igraph_0ormatrix_complex_to_SEXP(const igraph_matrix_complex_t *m) {
  SEXP result;
  if (m) {
    PROTECT(result=R_igraph_matrix_complex_to_SEXP(m));
  } else {
    PROTECT(result=R_NilValue);
  }
  UNPROTECT(1);
  return result;
}

SEXP R_igraph_array3_to_SEXP(const igraph_array3_t *a) {
  SEXP result, dim;

  PROTECT(result=NEW_NUMERIC(igraph_array3_size(a)));
  igraph_vector_copy_to(&a->data, REAL(result));
  PROTECT(dim=NEW_INTEGER(3));
  INTEGER(dim)[0]=(int) igraph_array3_n(a, 1);
  INTEGER(dim)[1]=(int) igraph_array3_n(a, 2);
  INTEGER(dim)[2]=(int) igraph_array3_n(a, 3);
  SET_DIM(result, dim);

  UNPROTECT(2);
  return result;
}

SEXP R_igraph_0orarray3_to_SEXP(const igraph_array3_t *a) {
  SEXP result;
  if (a) {
    PROTECT(result=R_igraph_array3_to_SEXP(a));
  } else {
    PROTECT(result=R_NilValue);
  }
  UNPROTECT(1);
  return result;
}

SEXP R_igraph_strvector_to_SEXP(const igraph_strvector_t *m) {
  SEXP result;
  long int i;
  char *str;
  long int len;

  len=igraph_strvector_size(m);
  PROTECT(result=NEW_CHARACTER(len));
  for (i=0; i<len; i++) {
    igraph_strvector_get(m, i, &str);
    SET_STRING_ELT(result, i, Rf_mkChar(str));
  }

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_graph_env(SEXP graph) {
  return VECTOR_ELT(graph, igraph_t_idx_env);
}

static void free_graph(SEXP xp) {
  R_igraph_status_handler("Free graph external pointer.\n", NULL);
  igraph_t *graph = (igraph_t*)(R_ExternalPtrAddr(xp));
  igraph_vector_destroy(&graph->from);
  igraph_vector_destroy(&graph->to);
  igraph_vector_destroy(&graph->oi);
  igraph_vector_destroy(&graph->ii);
  igraph_vector_destroy(&graph->os);
  igraph_vector_destroy(&graph->is);
  IGRAPH_FREE(graph);
}

void R_igraph_set_pointer(SEXP result, const igraph_t* graph) {
  int px = 0;

  igraph_t *pgraph = IGRAPH_CALLOC(1, igraph_t);
  *pgraph = *graph;

  R_igraph_status_handler("Make graph external pointer.\n", NULL);

  SEXP l1 = PROTECT(Rf_install("igraph")); px++;
  SEXP l2 = PROTECT(R_MakeExternalPtr(pgraph, R_NilValue, R_NilValue)); px++;
  Rf_defineVar(l1, l2, R_igraph_graph_env(result));
  R_RegisterCFinalizerEx(l2, free_graph, TRUE);

  UNPROTECT(px);
}

static int restore_pointer(SEXP graph, igraph_t *g) {
  igraph_integer_t no_of_nodes = REAL(VECTOR_ELT(graph, igraph_t_idx_n))[0];
  igraph_bool_t directed = LOGICAL(VECTOR_ELT(graph, igraph_t_idx_directed))[0];

  R_igraph_status_handler("Restore graph external pointer.\n", NULL);

  igraph_vector_t from;
  R_SEXP_to_vector(VECTOR_ELT(graph, igraph_t_idx_from), &from);

  igraph_vector_t to;
  R_SEXP_to_vector(VECTOR_ELT(graph, igraph_t_idx_to), &to);

  igraph_vector_t edges;
  igraph_integer_t no_of_edges=igraph_vector_size(&from);
  IGRAPH_VECTOR_INIT_FINALLY(&edges, no_of_edges*2);

  for (igraph_integer_t i = 0; i < no_of_edges; ++i) {
    VECTOR(edges)[2*i] = VECTOR(from)[i];
    VECTOR(edges)[2*i+1] = VECTOR(to)[i];
  }

  IGRAPH_CHECK(igraph_empty(g, no_of_nodes, directed));
  IGRAPH_FINALLY(igraph_destroy, g);
  IGRAPH_CHECK(igraph_add_edges(g, &edges, NULL));

  igraph_vector_destroy(&edges);
  IGRAPH_FINALLY_CLEAN(2); /* +1 for g */

  return IGRAPH_SUCCESS;
}

void R_igraph_restore_pointer(SEXP graph) {
  igraph_t g;
  IGRAPH_R_CHECK(restore_pointer(graph, &g));
  R_igraph_set_pointer(graph, &g);
}

igraph_t *R_igraph_get_pointer(SEXP graph) {
  if (GET_LENGTH(graph) != igraph_t_idx_max || !Rf_isEnvironment(R_igraph_graph_env(graph))) {
    if (GET_LENGTH(graph) == 11) {
      Rf_error("This graph was created by igraph < 0.2.\n  Upgrading this format is not supported, sorry.");
    }
    Rf_error("This graph was created by a now unsupported old igraph version.\n  Call upgrade_version() before using igraph functions on that object.");
  }

  SEXP xp=Rf_findVar(Rf_install("igraph"), R_igraph_graph_env(graph));
  if (xp == R_UnboundValue || xp == R_NilValue) {
    R_igraph_restore_pointer(graph);
    xp=Rf_findVar(Rf_install("igraph"), R_igraph_graph_env(graph));
  }

  igraph_t *pgraph=(igraph_t*)(R_ExternalPtrAddr(xp));

  if (!pgraph) {
    R_igraph_restore_pointer(graph);
    xp=Rf_findVar(Rf_install("igraph"), R_igraph_graph_env(graph));
    pgraph=(igraph_t*)(R_ExternalPtrAddr(xp));
  }

  return pgraph;
}

void R_igraph_set_n(SEXP rgraph, const igraph_t *graph) {
  SET_VECTOR_ELT(rgraph, igraph_t_idx_n, NEW_NUMERIC(1));
  REAL(VECTOR_ELT(rgraph, igraph_t_idx_n))[0]=igraph_vcount(graph);
}

igraph_integer_t R_igraph_get_n(SEXP graph) {
  igraph_t *pgraph=R_igraph_get_pointer(graph);
  return pgraph->n;
}

void R_igraph_set_directed(SEXP rgraph, const igraph_t *graph) {
  SET_VECTOR_ELT(rgraph, igraph_t_idx_directed, NEW_LOGICAL(1));
  LOGICAL(VECTOR_ELT(rgraph, igraph_t_idx_directed))[0]=graph->directed;
}

igraph_bool_t R_igraph_get_directed(SEXP graph) {
  igraph_t *pgraph=R_igraph_get_pointer(graph);
  return pgraph->directed;
}

void R_igraph_set_from(SEXP rgraph, const igraph_t *graph) {
  SET_VECTOR_ELT(rgraph, igraph_t_idx_from, R_new_altrep(R_igraph_altrep_from_class, R_igraph_graph_env(rgraph), R_NilValue));
}

void R_igraph_get_from(SEXP graph, igraph_vector_t* from) {
  igraph_t *pgraph=R_igraph_get_pointer(graph);
  *from = pgraph->from;
}

void R_igraph_set_to(SEXP rgraph, const igraph_t *graph) {
  SET_VECTOR_ELT(rgraph, igraph_t_idx_to, R_new_altrep(R_igraph_altrep_to_class, R_igraph_graph_env(rgraph), R_NilValue));
}

void R_igraph_get_to(SEXP graph, igraph_vector_t* to) {
  igraph_t *pgraph=R_igraph_get_pointer(graph);
  *to = pgraph->to;
}

void R_igraph_get_oi(SEXP graph, igraph_vector_t* oi) {
  igraph_t *pgraph=R_igraph_get_pointer(graph);
  *oi = pgraph->oi;
}

void R_igraph_get_ii(SEXP graph, igraph_vector_t* ii) {
  igraph_t *pgraph=R_igraph_get_pointer(graph);
  *ii = pgraph->ii;
}

void R_igraph_get_os(SEXP graph, igraph_vector_t* os) {
  igraph_t *pgraph=R_igraph_get_pointer(graph);
  *os = pgraph->os;
}

void R_igraph_get_is(SEXP graph, igraph_vector_t* is) {
  igraph_t *pgraph=R_igraph_get_pointer(graph);
  *is = pgraph->is;
}

SEXP R_igraph_to_SEXP(const igraph_t *graph) {

  SEXP result;
  long int no_of_nodes=igraph_vcount(graph);
  long int no_of_edges=igraph_ecount(graph);

  PROTECT(result=NEW_LIST(igraph_t_idx_max));
  R_igraph_set_n(result, graph);
  R_igraph_set_directed(result, graph);

  SET_CLASS(result, Rf_ScalarString(Rf_mkChar("igraph")));

  /* Attributes */
  SET_VECTOR_ELT(result, igraph_t_idx_attr, graph->attr);
  REAL(VECTOR_ELT(graph->attr, 0))[0] += 1;

  /* Environment for vertex/edge seqs */
  SET_VECTOR_ELT(result, igraph_t_idx_env, R_NilValue);
  R_igraph_add_env(result);
  R_igraph_set_pointer(result, graph);
  /* Set from and to requires environment */
  R_igraph_set_from(result, graph);
  R_igraph_set_to(result, graph);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_vectorlist_to_SEXP(const igraph_vector_ptr_t *ptr) {
  SEXP result;
  long int i, n=igraph_vector_ptr_size(ptr);

  PROTECT(result=NEW_LIST(n));
  for (i=0; i<n; i++) {
    igraph_vector_t *v=VECTOR(*ptr)[i];
    SET_VECTOR_ELT(result, i, R_igraph_vector_to_SEXP(v));
  }

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_vectorlist_int_to_SEXP(const igraph_vector_ptr_t *ptr) {
  SEXP result;
  long int i, n=igraph_vector_ptr_size(ptr);

  PROTECT(result=NEW_LIST(n));
  for (i=0; i<n; i++) {
    igraph_vector_int_t *v=VECTOR(*ptr)[i];
    SET_VECTOR_ELT(result, i, R_igraph_vector_int_to_SEXP(v));
  }

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_0orvectorlist_to_SEXP(const igraph_vector_ptr_t *ptr) {
  SEXP result;
  if (ptr) {
    PROTECT(result=R_igraph_vectorlist_to_SEXP(ptr));
  } else {
    PROTECT(result=R_NilValue);
  }

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_vectorlist_to_SEXP_p1(const igraph_vector_ptr_t *ptr) {
  SEXP result;
  long int i, n=igraph_vector_ptr_size(ptr);

  PROTECT(result=NEW_LIST(n));
  for (i=0; i<n; i++) {
    igraph_vector_t *v=VECTOR(*ptr)[i];
    long int j, vn=igraph_vector_size(v);
    SEXP vs;
    PROTECT(vs=NEW_NUMERIC(vn));
    for (j=0; j<vn; j++) {
      REAL(vs)[j] = VECTOR(*v)[j] + 1;
    }
    SET_VECTOR_ELT(result, i, vs);
    UNPROTECT(1);
  }

  UNPROTECT(1);
  return result;
}

void R_igraph_vectorlist_destroy(igraph_vector_ptr_t *ptr) {
  long int i, n=igraph_vector_ptr_size(ptr);

  for (i=0; i<n; i++) {
    igraph_vector_t *v=VECTOR(*ptr)[i];
    igraph_vector_destroy(v);
    igraph_free(v);
  }
  igraph_vector_ptr_destroy(ptr);
}

void R_igraph_vectorlist2_destroy(igraph_vector_ptr_t *ptr) {
  long int i, n=igraph_vector_ptr_size(ptr);

  for (i=0; i<n; i++) {
    igraph_vector_t *v=VECTOR(*ptr)[i];
    igraph_vector_destroy(v);
  }
  igraph_free(VECTOR(*ptr)[0]);
  igraph_vector_ptr_destroy(ptr);
}

void R_igraph_vectorlist_int_destroy(igraph_vector_ptr_t *ptr) {
  int i, n=igraph_vector_ptr_size(ptr);

  for (i=0; i<n; i++) {
    igraph_vector_int_t *v=VECTOR(*ptr)[i];
    igraph_vector_int_destroy(v);
    igraph_free(v);
   }
  igraph_vector_ptr_destroy(ptr);
}

void R_igraph_vectorlist_int_destroy2(igraph_vector_ptr_t *ptr) {
  int i, n=igraph_vector_ptr_size(ptr);

  for (i=0; i<n; i++) {
    igraph_vector_int_t *v=VECTOR(*ptr)[i];
    igraph_vector_int_destroy(v);
   }
  igraph_free(VECTOR(*ptr)[0]);
  igraph_vector_ptr_destroy(ptr);
}

SEXP R_igraph_matrixlist_to_SEXP(const igraph_vector_ptr_t *ptr) {
  SEXP result;
  long int i, n=igraph_vector_ptr_size(ptr);

  PROTECT(result=NEW_LIST(n));
  for (i=0; i<n; i++) {
    igraph_matrix_t *v=VECTOR(*ptr)[i];
    SET_VECTOR_ELT(result, i, R_igraph_matrix_to_SEXP(v));
  }

  UNPROTECT(1);
  return result;
}

void R_igraph_matrixlist_destroy(igraph_vector_ptr_t *ptr) {
  long int i, n=igraph_vector_ptr_size(ptr);

  for (i=0; i<n; i++) {
    igraph_matrix_t *v=VECTOR(*ptr)[i];
    igraph_matrix_destroy(v);
    igraph_free(v);
  }
  igraph_vector_ptr_destroy(ptr);
}

SEXP R_igraph_graphlist_to_SEXP(const igraph_vector_ptr_t *ptr) {
  SEXP result;
  long int i, n=igraph_vector_ptr_size(ptr);

  PROTECT(result=NEW_LIST(n));
  for (i=0; i<n; i++) {
    igraph_t *g=VECTOR(*ptr)[i];
    SET_VECTOR_ELT(result, i, R_igraph_to_SEXP(g));
  }
  UNPROTECT(1);
  return result;
}

void R_igraph_graphlist_destroy(igraph_vector_ptr_t *ptr) {
  long int i, n=igraph_vector_ptr_size(ptr);

  for (i=0; i<n; i++) {
    igraph_t *g=VECTOR(*ptr)[i];
    IGRAPH_I_DESTROY(g);
  }
  igraph_free(VECTOR(*ptr)[0]);
  igraph_vector_ptr_destroy(ptr);
}

SEXP R_igraph_hrg_to_SEXP(const igraph_hrg_t *hrg) {
  SEXP result, names;

  PROTECT(result=NEW_LIST(5));
  SET_VECTOR_ELT(result, 0, R_igraph_vector_to_SEXP(&hrg->left));
  SET_VECTOR_ELT(result, 1, R_igraph_vector_to_SEXP(&hrg->right));
  SET_VECTOR_ELT(result, 2, R_igraph_vector_to_SEXP(&hrg->prob));
  SET_VECTOR_ELT(result, 3, R_igraph_vector_to_SEXP(&hrg->edges));
  SET_VECTOR_ELT(result, 4, R_igraph_vector_to_SEXP(&hrg->vertices));

  PROTECT(names=NEW_CHARACTER(5));
  SET_STRING_ELT(names, 0, Rf_mkChar("left"));
  SET_STRING_ELT(names, 1, Rf_mkChar("right"));
  SET_STRING_ELT(names, 2, Rf_mkChar("prob"));
  SET_STRING_ELT(names, 3, Rf_mkChar("edges"));
  SET_STRING_ELT(names, 4, Rf_mkChar("vertices"));
  SET_NAMES(result, names);

  UNPROTECT(2);
  return result;
}

int R_SEXP_to_hrg(SEXP shrg, igraph_hrg_t *hrg) {
  R_SEXP_to_vector(VECTOR_ELT(shrg, 0), &hrg->left);
  R_SEXP_to_vector(VECTOR_ELT(shrg, 1), &hrg->right);
  R_SEXP_to_vector(VECTOR_ELT(shrg, 2), &hrg->prob);
  R_SEXP_to_vector(VECTOR_ELT(shrg, 3), &hrg->edges);
  R_SEXP_to_vector(VECTOR_ELT(shrg, 4), &hrg->vertices);
  return 0;
}

int R_SEXP_to_hrg_copy(SEXP shrg, igraph_hrg_t *hrg) {
  R_SEXP_to_vector_copy(VECTOR_ELT(shrg, 0), &hrg->left);
  R_SEXP_to_vector_copy(VECTOR_ELT(shrg, 1), &hrg->right);
  R_SEXP_to_vector_copy(VECTOR_ELT(shrg, 2), &hrg->prob);
  R_SEXP_to_vector_copy(VECTOR_ELT(shrg, 3), &hrg->edges);
  R_SEXP_to_vector_copy(VECTOR_ELT(shrg, 4), &hrg->vertices);
  return 0;
}

SEXP R_igraph_plfit_result_to_SEXP(const igraph_plfit_result_t *plfit) {
  SEXP result, names;

  PROTECT(result=NEW_LIST(6));
  SET_VECTOR_ELT(result, 0, Rf_ScalarLogical(plfit->continuous));
  SET_VECTOR_ELT(result, 1, Rf_ScalarReal(plfit->alpha));
  SET_VECTOR_ELT(result, 2, Rf_ScalarReal(plfit->xmin));
  SET_VECTOR_ELT(result, 3, Rf_ScalarReal(plfit->L));
  SET_VECTOR_ELT(result, 4, Rf_ScalarReal(plfit->D));
  SET_VECTOR_ELT(result, 5, Rf_ScalarReal(plfit->p));

  PROTECT(names=NEW_CHARACTER(6));
  SET_STRING_ELT(names, 0, Rf_mkChar("continuous"));
  SET_STRING_ELT(names, 1, Rf_mkChar("alpha"));
  SET_STRING_ELT(names, 2, Rf_mkChar("xmin"));
  SET_STRING_ELT(names, 3, Rf_mkChar("logLik"));
  SET_STRING_ELT(names, 4, Rf_mkChar("KS.stat"));
  SET_STRING_ELT(names, 5, Rf_mkChar("KS.p"));
  SET_NAMES(result, names);

  UNPROTECT(2);
  return result;
}

SEXP R_igraph_maxflow_stats_to_SEXP(const igraph_maxflow_stats_t *st) {
  SEXP result, names;

  PROTECT(result=NEW_LIST(5));
  SET_VECTOR_ELT(result, 0, Rf_ScalarInteger(st->nopush));
  SET_VECTOR_ELT(result, 1, Rf_ScalarInteger(st->norelabel));
  SET_VECTOR_ELT(result, 2, Rf_ScalarInteger(st->nogap));
  SET_VECTOR_ELT(result, 3, Rf_ScalarInteger(st->nogapnodes));
  SET_VECTOR_ELT(result, 4, Rf_ScalarInteger(st->nobfs));

  PROTECT(names=NEW_CHARACTER(5));
  SET_STRING_ELT(names, 0, Rf_mkChar("nopush"));
  SET_STRING_ELT(names, 1, Rf_mkChar("norelabel"));
  SET_STRING_ELT(names, 2, Rf_mkChar("nogap"));
  SET_STRING_ELT(names, 3, Rf_mkChar("nogapnodes"));
  SET_STRING_ELT(names, 4, Rf_mkChar("nobfs"));
  SET_NAMES(result, names);

  UNPROTECT(2);
  return result;
}

SEXP R_igraph_sirlist_to_SEXP(const igraph_vector_ptr_t *sl) {
  SEXP result, names;
  int i, n=igraph_vector_ptr_size(sl);
  PROTECT(result=NEW_LIST(n));

  PROTECT(names=NEW_CHARACTER(4));
  SET_STRING_ELT(names, 0, Rf_mkChar("times"));
  SET_STRING_ELT(names, 1, Rf_mkChar("NS"));
  SET_STRING_ELT(names, 2, Rf_mkChar("NI"));
  SET_STRING_ELT(names, 3, Rf_mkChar("NR"));

  for (i=0; i<n; i++) {
    SEXP tmp;
    const igraph_sir_t *sir=VECTOR(*sl)[i];
    PROTECT(tmp=NEW_LIST(4));
    SET_VECTOR_ELT(tmp, 0, R_igraph_vector_to_SEXP(&sir->times));
    SET_VECTOR_ELT(tmp, 1, R_igraph_vector_int_to_SEXP(&sir->no_s));
    SET_VECTOR_ELT(tmp, 2, R_igraph_vector_int_to_SEXP(&sir->no_i));
    SET_VECTOR_ELT(tmp, 3, R_igraph_vector_int_to_SEXP(&sir->no_r));
    SET_VECTOR_ELT(result, i, tmp);
    SET_NAMES(tmp, names);
    UNPROTECT(1);
  }

  UNPROTECT(2);
  return result;
}

void R_igraph_sirlist_destroy(igraph_vector_ptr_t *sl) {
  int i, n=igraph_vector_ptr_size(sl);
  for (i=0; i<n; i++) {
    igraph_sir_t *sir=VECTOR(*sl)[i];
    igraph_vector_destroy(&sir->times);
    igraph_vector_int_destroy(&sir->no_s);
    igraph_vector_int_destroy(&sir->no_i);
    igraph_vector_int_destroy(&sir->no_r);
    igraph_free(sir);
  }
  igraph_vector_ptr_destroy(sl);
}

int R_SEXP_to_sparsemat(SEXP pakl, igraph_sparsemat_t *akl) {
  SEXP Dim=GET_SLOT(pakl, Rf_install("Dim"));
  SEXP i=GET_SLOT(pakl, Rf_install("i"));
  SEXP p=GET_SLOT(pakl, Rf_install("p"));
  SEXP x=GET_SLOT(pakl, Rf_install("x"));

  igraph_sparsemat_view(akl, /*nzmax=*/ GET_LENGTH(x),
                          /*m=*/ INTEGER(Dim)[0], /*n=*/ INTEGER(Dim)[1],
                          /*p=*/ INTEGER(p), /*i=*/ INTEGER(i),
                          /*x=*/ REAL(x), /*nz=*/ -1);

  return 0;
}

SEXP R_igraph_sparsemat_to_SEXP_triplet(const igraph_sparsemat_t *sp) {
  SEXP res, names;
  int nz=igraph_sparsemat_nonzero_storage(sp);

  PROTECT(res=NEW_LIST(5));
  SET_VECTOR_ELT(res, 0, Rf_ScalarString(Rf_mkChar("triplet")));
  SET_VECTOR_ELT(res, 1, NEW_INTEGER(2));
  INTEGER(VECTOR_ELT(res, 1))[0] = (int) igraph_sparsemat_nrow(sp);
  INTEGER(VECTOR_ELT(res, 1))[1] = (int) igraph_sparsemat_ncol(sp);
  SET_VECTOR_ELT(res, 2, NEW_INTEGER(nz));
  SET_VECTOR_ELT(res, 3, NEW_INTEGER(nz));
  SET_VECTOR_ELT(res, 4, NEW_NUMERIC(nz));
  if (nz > 0) {
    igraph_vector_int_t i, j;
    igraph_vector_t x;
    igraph_vector_int_view(&i, INTEGER(VECTOR_ELT(res, 2)), nz);
    igraph_vector_int_view(&j, INTEGER(VECTOR_ELT(res, 3)), nz);
    igraph_vector_view(&x, REAL(VECTOR_ELT(res, 4)), nz);
    igraph_sparsemat_getelements(sp, &j, &i, &x);
  }

  PROTECT(names=NEW_CHARACTER(5));
  SET_STRING_ELT(names, 0, Rf_mkChar("type"));
  SET_STRING_ELT(names, 1, Rf_mkChar("dim"));
  SET_STRING_ELT(names, 2, Rf_mkChar("p"));
  SET_STRING_ELT(names, 3, Rf_mkChar("i"));
  SET_STRING_ELT(names, 4, Rf_mkChar("x"));
  SET_NAMES(res, names);
  SET_CLASS(res, Rf_ScalarString(Rf_mkChar("igraph.tmp.sparse")));

  UNPROTECT(2);
  return res;
}

SEXP R_igraph_sparsemat_to_SEXP_cc(const igraph_sparsemat_t *sp) {
  SEXP res, names;
  int nz=igraph_sparsemat_nonzero_storage(sp);
  int m=(int) igraph_sparsemat_nrow(sp);
  int n=(int) igraph_sparsemat_ncol(sp);

  PROTECT(res=NEW_LIST(5));
  SET_VECTOR_ELT(res, 0, Rf_ScalarString(Rf_mkChar("cc")));
  SET_VECTOR_ELT(res, 1, NEW_INTEGER(2));
  INTEGER(VECTOR_ELT(res, 1))[0] = m;
  INTEGER(VECTOR_ELT(res, 1))[1] = n;
  SET_VECTOR_ELT(res, 2, NEW_INTEGER(n+1));
  SET_VECTOR_ELT(res, 3, NEW_INTEGER(nz));
  SET_VECTOR_ELT(res, 4, NEW_NUMERIC(nz));
  if (nz > 0) {
    igraph_vector_int_t i, p;
    igraph_vector_t x;
    igraph_vector_int_view(&p, INTEGER(VECTOR_ELT(res, 2)), n+1);
    igraph_vector_int_view(&i, INTEGER(VECTOR_ELT(res, 3)), nz);
    igraph_vector_view(&x, REAL(VECTOR_ELT(res, 4)), nz);
    igraph_sparsemat_getelements_sorted(sp, &i, &p, &x);
  }

  PROTECT(names=NEW_CHARACTER(5));
  SET_STRING_ELT(names, 0, Rf_mkChar("type"));
  SET_STRING_ELT(names, 1, Rf_mkChar("dim"));
  SET_STRING_ELT(names, 2, Rf_mkChar("p"));
  SET_STRING_ELT(names, 3, Rf_mkChar("i"));
  SET_STRING_ELT(names, 4, Rf_mkChar("x"));
  SET_NAMES(res, names);
  SET_CLASS(res, Rf_ScalarString(Rf_mkChar("igraph.tmp.sparse")));

  UNPROTECT(2);
  return res;
}

SEXP R_igraph_sparsemat_to_SEXP(const igraph_sparsemat_t *sp) {
  if (igraph_sparsemat_is_triplet(sp)) {
    return R_igraph_sparsemat_to_SEXP_triplet(sp);
  } else {
    return R_igraph_sparsemat_to_SEXP_cc(sp);
  }
}

SEXP R_igraph_0orsparsemat_to_SEXP(const igraph_sparsemat_t *sp) {
  if (!sp) {
    return R_NilValue;
  } else {
    return R_igraph_sparsemat_to_SEXP(sp);
  }
}

int R_SEXP_to_igraph_adjlist(SEXP vectorlist, igraph_adjlist_t *ptr) {
  int length=GET_LENGTH(vectorlist);
  int i;

  ptr->length=length;
  ptr->adjs = (igraph_vector_int_t*) R_alloc((size_t) length,
                                             sizeof(igraph_vector_int_t));
  for (i=0; i<length; i++) {
    SEXP vec=VECTOR_ELT(vectorlist, i);
    igraph_vector_int_view(&ptr->adjs[i], INTEGER(vec), GET_LENGTH(vec));
  }
  return 0;
}

int R_igraph_SEXP_to_0orvectorlist(SEXP vectorlist,
                                   igraph_vector_ptr_t *ptr) {
  if (!Rf_isNull(vectorlist)) {
    return R_igraph_SEXP_to_vectorlist(vectorlist, ptr);
  }
  return 0;
}

int R_igraph_SEXP_to_vectorlist(SEXP vectorlist, igraph_vector_ptr_t *ptr) {
  int length=GET_LENGTH(vectorlist);
  int i;
  igraph_vector_t *vecs;
  igraph_vector_t **vecsptr;

  vecs = (igraph_vector_t *) R_alloc((size_t) length, sizeof(igraph_vector_t));
  vecsptr = (igraph_vector_t **) R_alloc((size_t) length,
                                         sizeof(igraph_vector_t*));
  igraph_vector_ptr_view(ptr, (void**) vecsptr, length);
  for (i=0; i<length; i++) {
    igraph_vector_t *v=&vecs[i];
    vecsptr[i] = v;
    SEXP el=VECTOR_ELT(vectorlist, i);
    igraph_vector_view(v, REAL(el), GET_LENGTH(el));
  }
  return 0;
}

int R_igraph_SEXP_to_vectorlist_int(SEXP vectorlist,
                                    igraph_vector_ptr_t *ptr) {
  int length=GET_LENGTH(vectorlist);
  int i;
  igraph_vector_int_t *vecs;
  igraph_vector_int_t **vecsptr;

  vecs = (igraph_vector_int_t *) R_alloc((size_t) length,
                                         sizeof(igraph_vector_int_t));
  vecsptr = (igraph_vector_int_t **) R_alloc((size_t) length,
                                             sizeof(igraph_vector_int_t*));
  igraph_vector_ptr_view(ptr, (void**) vecsptr, length);
  for (i=0; i<length; i++) {
    igraph_vector_int_t *v=&vecs[i];
    vecsptr[i] = v;
    SEXP el=VECTOR_ELT(vectorlist, i);
    igraph_vector_int_view(v, INTEGER(el), GET_LENGTH(el));
  }
  return 0;
}

int R_igraph_SEXP_to_matrixlist(SEXP matrixlist, igraph_vector_ptr_t *ptr) {
  int length=GET_LENGTH(matrixlist);
  int i;
  igraph_matrix_t *vecs;
  igraph_matrix_t **vecsptr;

  vecs = (igraph_matrix_t *) R_alloc((size_t) length, sizeof(igraph_matrix_t));
  vecsptr = (igraph_matrix_t **) R_alloc((size_t) length,
                                         sizeof(igraph_matrix_t*));
  igraph_vector_ptr_view(ptr, (void**) vecsptr, length);
  for (i=0; i<length; i++) {
    igraph_matrix_t *v=&vecs[i];
    vecsptr[i] = v;
    SEXP el=VECTOR_ELT(matrixlist, i);
    SEXP dim=GET_DIM(el);
    igraph_matrix_view(v, REAL(el), INTEGER(dim)[0], INTEGER(dim)[1]);
  }
  return 0;
}

int R_igraph_SEXP_to_strvector(SEXP rval, igraph_strvector_t *sv) {
  long int i;
  sv->len=GET_LENGTH(rval);
  sv->data=(char**) R_alloc((size_t) (sv->len), sizeof(char*));
  for (i=0; i<sv->len; i++) {
    sv->data[i]=(char*) CHAR(STRING_ELT(rval, i));
  }

  return 0;
}

int R_igraph_SEXP_to_strvector_copy(SEXP rval, igraph_strvector_t *sv) {
  long int i;
  igraph_strvector_init(sv, GET_LENGTH(rval));
  for (i=0; i<sv->len; i++) {
    igraph_strvector_set(sv, i, CHAR(STRING_ELT(rval, i)));
  }

  return 0;
}

int R_SEXP_to_vector(SEXP sv, igraph_vector_t *v) {
  v->stor_begin=REAL(sv);
  v->stor_end=v->stor_begin+GET_LENGTH(sv);
  v->end=v->stor_end;
  return 0;
}

int R_SEXP_to_vector_copy(SEXP sv, igraph_vector_t *v) {
  return igraph_vector_init_copy(v, REAL(sv), GET_LENGTH(sv));
}

int R_SEXP_to_vector_bool(SEXP sv, igraph_vector_bool_t *v) {
  v->stor_begin=LOGICAL(sv);
  v->stor_end=v->stor_begin+GET_LENGTH(sv);
  v->end=v->stor_end;
  return 0;
}

int R_SEXP_to_vector_bool_copy(SEXP sv, igraph_vector_bool_t *v) {
  long int i, n=GET_LENGTH(sv);
  int *svv=LOGICAL(sv);
  igraph_vector_bool_init(v, n);
  for (i=0; i<n; i++) {
    VECTOR(*v)[i] = svv[i];
  }
  return 0;
}

int R_SEXP_to_vector_int_copy(SEXP sv, igraph_vector_int_t *v) {
  long int i, n=GET_LENGTH(sv);
  int *svv=INTEGER(sv);
  igraph_vector_int_init(v, n);
  for (i = 0; i<n; i++) {
    VECTOR(*v)[i] = svv[i];
  }
  return 0;
}

int R_SEXP_to_vector_long_copy(SEXP sv, igraph_vector_long_t *v) {
  long int i, n=GET_LENGTH(sv);
  double *svv=REAL(sv);
  igraph_vector_long_init(v, n);
  for (i=0; i<n; i++) {
    VECTOR(*v)[i] = (long int) svv[i];
  }
  return 0;
}

int R_SEXP_to_matrix(SEXP pakl, igraph_matrix_t *akl) {
  R_SEXP_to_vector(pakl, &akl->data);
  akl->nrow=INTEGER(GET_DIM(pakl))[0];
  akl->ncol=INTEGER(GET_DIM(pakl))[1];

  return 0;
}

int R_SEXP_to_igraph_matrix_copy(SEXP pakl, igraph_matrix_t *akl) {
  igraph_vector_init_copy(&akl->data, REAL(pakl), GET_LENGTH(pakl));
  akl->nrow=INTEGER(GET_DIM(pakl))[0];
  akl->ncol=INTEGER(GET_DIM(pakl))[1];

  return 0;
}

int R_SEXP_to_vector_complex(SEXP pv, igraph_vector_complex_t *v) {
  v->stor_begin=(igraph_complex_t*) COMPLEX(pv);
  v->stor_end=v->stor_begin+GET_LENGTH(pv);
  v->end=v->stor_end;
  return 0;
}

int R_SEXP_to_vector_complex_copy(SEXP pv, igraph_vector_complex_t *v) {
  igraph_vector_complex_init_copy(v, (igraph_complex_t*) COMPLEX(pv),
                                  GET_LENGTH(pv));
  return 0;
}

int R_SEXP_to_matrix_complex(SEXP pakl, igraph_matrix_complex_t *akl) {
  R_SEXP_to_vector_complex(pakl, &akl->data);
  akl->nrow=INTEGER(GET_DIM(pakl))[0];
  akl->ncol=INTEGER(GET_DIM(pakl))[1];
  return 0;
}

int R_SEXP_to_matrix_complex_copy(SEXP pakl, igraph_matrix_complex_t *akl) {
  igraph_vector_complex_init_copy(&akl->data,
                                  (igraph_complex_t*) COMPLEX(pakl),
                                  GET_LENGTH(pakl));
  akl->nrow=INTEGER(GET_DIM(pakl))[0];
  akl->ncol=INTEGER(GET_DIM(pakl))[1];
  return 0;
}

int R_igraph_SEXP_to_array3(SEXP rval, igraph_array3_t *a) {
  R_SEXP_to_vector(rval, &a->data);
  a->n1=INTEGER(GET_DIM(rval))[0];
  a->n2=INTEGER(GET_DIM(rval))[1];
  a->n3=INTEGER(GET_DIM(rval))[2];
  a->n1n2=(a->n1) * (a->n2);

  return 0;
}

int R_igraph_SEXP_to_array3_copy(SEXP rval, igraph_array3_t *a) {
  igraph_vector_init_copy(&a->data, REAL(rval), GET_LENGTH(rval));
  a->n1=INTEGER(GET_DIM(rval))[0];
  a->n2=INTEGER(GET_DIM(rval))[1];
  a->n3=INTEGER(GET_DIM(rval))[2];
  a->n1n2=(a->n1) * (a->n2);

  return 0;
}

int R_SEXP_to_igraph(SEXP graph, igraph_t *res) {

  res->n=R_igraph_get_n(graph);
  res->directed=R_igraph_get_directed(graph);
  R_igraph_get_from(graph, &res->from);
  R_igraph_get_to(graph, &res->to);
  R_igraph_get_oi(graph, &res->oi);
  R_igraph_get_ii(graph, &res->ii);
  R_igraph_get_os(graph, &res->os);
  R_igraph_get_is(graph, &res->is);

  /* attributes */
  REAL(VECTOR_ELT(VECTOR_ELT(graph, igraph_t_idx_attr), 0))[0] = 1; /* R objects refcount */
  REAL(VECTOR_ELT(VECTOR_ELT(graph, igraph_t_idx_attr), 0))[1] = 0; /* igraph_t objects */
  res->attr=VECTOR_ELT(graph, igraph_t_idx_attr);

  return 0;
}

int R_SEXP_to_igraph_copy(SEXP graph, igraph_t *res) {

  res->n=R_igraph_get_n(graph);
  res->directed=R_igraph_get_directed(graph);

  igraph_vector_t from;
  R_igraph_get_from(graph, &from);
  igraph_vector_copy(&res->from, &from);
  igraph_vector_t to;
  R_igraph_get_to(graph, &to);
  igraph_vector_copy(&res->to, &to);
  igraph_vector_t oi;
  R_igraph_get_oi(graph, &oi);
  igraph_vector_copy(&res->oi, &oi);
  igraph_vector_t ii;
  R_igraph_get_ii(graph, &ii);
  igraph_vector_copy(&res->ii, &ii);
  igraph_vector_t os;
  R_igraph_get_os(graph, &os);
  igraph_vector_copy(&res->os, &os);
  igraph_vector_t is;
  R_igraph_get_is(graph, &is);
  igraph_vector_copy(&res->is, &is);

  /* attributes */
  REAL(VECTOR_ELT(VECTOR_ELT(graph, igraph_t_idx_attr), 0))[0] = 1; /* R objects */
  REAL(VECTOR_ELT(VECTOR_ELT(graph, igraph_t_idx_attr), 0))[1] = 1; /* igraph_t objects */
  R_PreserveObject(res->attr=VECTOR_ELT(graph, igraph_t_idx_attr));

  return 0;
}

/*
 * We have only vector type
 */

int R_SEXP_to_igraph_vs(SEXP rit, igraph_t *graph, igraph_vs_t *it) {

  igraph_vector_t *tmpv=(igraph_vector_t*)R_alloc(1,sizeof(igraph_vector_t));
  igraph_vs_vector(it, igraph_vector_view(tmpv, REAL(rit),
                                          GET_LENGTH(rit)));
  return 0;
}

/*
 * We have only vector type
 */

int R_SEXP_to_igraph_es(SEXP rit, igraph_t *graph, igraph_es_t *it) {

  igraph_vector_t *tmpv=(igraph_vector_t*)R_alloc(1,sizeof(igraph_vector_t));
  igraph_es_vector(it, igraph_vector_view(tmpv, REAL(rit),
                                          GET_LENGTH(rit)));
  return 0;
}

int R_SEXP_to_igraph_layout_drl_options(SEXP in, igraph_layout_drl_options_t *opt) {
  opt->edge_cut = REAL(AS_NUMERIC(R_igraph_getListElement(in, "edge.cut")))[0];
  opt->init_iterations   = (igraph_integer_t) REAL(AS_NUMERIC(R_igraph_getListElement(in, "init.iterations")))[0];
  opt->init_temperature  = REAL(AS_NUMERIC(R_igraph_getListElement(in, "init.temperature")))[0];
  opt->init_attraction   = REAL(AS_NUMERIC(R_igraph_getListElement(in, "init.attraction")))[0];
  opt->init_damping_mult = REAL(AS_NUMERIC(R_igraph_getListElement(in, "init.damping.mult")))[0];
  opt->liquid_iterations   = (igraph_integer_t) REAL(AS_NUMERIC(R_igraph_getListElement(in, "liquid.iterations")))[0];
  opt->liquid_temperature  = REAL(AS_NUMERIC(R_igraph_getListElement(in, "liquid.temperature")))[0];
  opt->liquid_attraction   = REAL(AS_NUMERIC(R_igraph_getListElement(in, "liquid.attraction")))[0];
  opt->liquid_damping_mult = REAL(AS_NUMERIC(R_igraph_getListElement(in, "liquid.damping.mult")))[0];
  opt->expansion_iterations   = (igraph_integer_t) REAL(AS_NUMERIC(R_igraph_getListElement(in, "expansion.iterations")))[0];
  opt->expansion_temperature  = REAL(AS_NUMERIC(R_igraph_getListElement(in, "expansion.temperature")))[0];
  opt->expansion_attraction   = REAL(AS_NUMERIC(R_igraph_getListElement(in, "expansion.attraction")))[0];
  opt->expansion_damping_mult = REAL(AS_NUMERIC(R_igraph_getListElement(in, "expansion.damping.mult")))[0];
  opt->cooldown_iterations   = (igraph_integer_t) REAL(AS_NUMERIC(R_igraph_getListElement(in, "cooldown.iterations")))[0];
  opt->cooldown_temperature  = REAL(AS_NUMERIC(R_igraph_getListElement(in, "cooldown.temperature")))[0];
  opt->cooldown_attraction   = REAL(AS_NUMERIC(R_igraph_getListElement(in, "cooldown.attraction")))[0];
  opt->cooldown_damping_mult = REAL(AS_NUMERIC(R_igraph_getListElement(in, "cooldown.damping.mult")))[0];
  opt->crunch_iterations   = (igraph_integer_t) REAL(AS_NUMERIC(R_igraph_getListElement(in, "crunch.iterations")))[0];
  opt->crunch_temperature  = REAL(AS_NUMERIC(R_igraph_getListElement(in, "crunch.temperature")))[0];
  opt->crunch_attraction   = REAL(AS_NUMERIC(R_igraph_getListElement(in, "crunch.attraction")))[0];
  opt->crunch_damping_mult = REAL(AS_NUMERIC(R_igraph_getListElement(in, "crunch.damping.mult")))[0];
  opt->simmer_iterations   = (igraph_integer_t) REAL(AS_NUMERIC(R_igraph_getListElement(in, "simmer.iterations")))[0];
  opt->simmer_temperature  = REAL(AS_NUMERIC(R_igraph_getListElement(in, "simmer.temperature")))[0];
  opt->simmer_attraction   = REAL(AS_NUMERIC(R_igraph_getListElement(in, "simmer.attraction")))[0];
  opt->simmer_damping_mult = REAL(AS_NUMERIC(R_igraph_getListElement(in, "simmer.damping.mult")))[0];

  return 0;
}

int R_SEXP_to_igraph_arpack_options(SEXP in, igraph_arpack_options_t *opt) {
  const char *tmpstr;
  igraph_arpack_options_init(opt);
  opt -> bmat[0] = CHAR(STRING_ELT(AS_CHARACTER
                                   (R_igraph_getListElement(in, "bmat")), 0))[0];
  opt -> n = INTEGER(AS_INTEGER(R_igraph_getListElement(in, "n")))[0];
  tmpstr=CHAR(STRING_ELT(AS_CHARACTER(R_igraph_getListElement(in, "which")), 0));
  opt -> which[0]=tmpstr[0]; opt -> which[1]=tmpstr[1];
  opt -> nev = INTEGER(AS_INTEGER(R_igraph_getListElement(in, "nev")))[0];
  opt -> tol = REAL(AS_NUMERIC(R_igraph_getListElement(in, "tol")))[0];
  opt -> ncv = INTEGER(AS_INTEGER(R_igraph_getListElement(in, "ncv")))[0];
  opt -> ldv = INTEGER(AS_INTEGER(R_igraph_getListElement(in, "ldv")))[0];
  opt -> ishift = INTEGER(AS_INTEGER(R_igraph_getListElement(in, "ishift")))[0];
  opt -> mxiter = INTEGER(AS_INTEGER(R_igraph_getListElement(in, "maxiter")))[0];
  opt -> nb = INTEGER(AS_INTEGER(R_igraph_getListElement(in, "nb")))[0];
  opt -> mode = INTEGER(AS_INTEGER(R_igraph_getListElement(in, "mode")))[0];
  opt -> start = INTEGER(AS_INTEGER(R_igraph_getListElement(in, "start")))[0];
  opt -> lworkl = 0;
  opt -> sigma = REAL(AS_NUMERIC(R_igraph_getListElement(in, "sigma")))[0];
  opt -> sigmai = REAL(AS_NUMERIC(R_igraph_getListElement(in, "sigmai")))[0];
  opt -> info = opt -> start;

  opt->iparam[0]=opt->ishift;
  opt->iparam[2]=opt->mxiter;
  opt->iparam[3]=opt->nb;
  opt->iparam[6]=opt->mode;

  return 0;
}

SEXP R_igraph_arpack_options_to_SEXP(const igraph_arpack_options_t *opt) {
  SEXP result, names;
  char bmat[2], which[3];

  bmat[0]=opt->bmat[0]; bmat[1]='\0';
  which[0]=opt->which[0]; which[1]=opt->which[1]; which[2]='\0';

  PROTECT(result = NEW_LIST(20));
  SET_VECTOR_ELT(result, 0, Rf_ScalarString(Rf_mkChar(bmat)));
  SET_VECTOR_ELT(result, 1, NEW_INTEGER(1)); INTEGER(VECTOR_ELT(result, 1))[0]=opt->n;
  SET_VECTOR_ELT(result, 2, Rf_ScalarString(Rf_mkChar(which)));
  SET_VECTOR_ELT(result, 3, NEW_INTEGER(1)); INTEGER(VECTOR_ELT(result, 3))[0]=opt->nev;
  SET_VECTOR_ELT(result, 4, NEW_NUMERIC(1)); REAL(VECTOR_ELT(result, 4))[0]=opt->tol;
  SET_VECTOR_ELT(result, 5, NEW_INTEGER(1)); INTEGER(VECTOR_ELT(result, 5))[0]=opt->ncv;
  SET_VECTOR_ELT(result, 6, NEW_INTEGER(1)); INTEGER(VECTOR_ELT(result, 6))[0]=opt->ldv;
  SET_VECTOR_ELT(result, 7, NEW_INTEGER(1)); INTEGER(VECTOR_ELT(result, 7))[0]=opt->ishift;
  SET_VECTOR_ELT(result, 8, NEW_INTEGER(1)); INTEGER(VECTOR_ELT(result, 8))[0]=opt->mxiter;
  SET_VECTOR_ELT(result, 9, NEW_INTEGER(1)); INTEGER(VECTOR_ELT(result, 9))[0]=opt->nb;
  SET_VECTOR_ELT(result, 10, NEW_INTEGER(1)); INTEGER(VECTOR_ELT(result, 10))[0]=opt->mode;
  SET_VECTOR_ELT(result, 11, NEW_INTEGER(1)); INTEGER(VECTOR_ELT(result, 11))[0]=opt->start;
  SET_VECTOR_ELT(result, 12, NEW_NUMERIC(1)); REAL(VECTOR_ELT(result, 12))[0]=opt->sigma;
  SET_VECTOR_ELT(result, 13, NEW_NUMERIC(1)); REAL(VECTOR_ELT(result, 13))[0]=opt->sigmai;

  SET_VECTOR_ELT(result, 14, NEW_INTEGER(1)); INTEGER(VECTOR_ELT(result, 14))[0]=opt->info;
  SET_VECTOR_ELT(result, 15, NEW_INTEGER(1)); INTEGER(VECTOR_ELT(result, 15))[0]=opt->iparam[2];/* mxiter */
  SET_VECTOR_ELT(result, 16, NEW_INTEGER(1)); INTEGER(VECTOR_ELT(result, 16))[0]=opt->iparam[4];/* nconv */
  SET_VECTOR_ELT(result, 17, NEW_INTEGER(1)); INTEGER(VECTOR_ELT(result, 17))[0]=opt->iparam[8];/* numop */
  SET_VECTOR_ELT(result, 18, NEW_INTEGER(1)); INTEGER(VECTOR_ELT(result, 18))[0]=opt->iparam[9];/* numopb */
  SET_VECTOR_ELT(result, 19, NEW_INTEGER(1)); INTEGER(VECTOR_ELT(result, 19))[0]=opt->iparam[10];/* numreo */

  PROTECT(names=NEW_CHARACTER(20));
  SET_STRING_ELT(names, 0, Rf_mkChar("bmat"));
  SET_STRING_ELT(names, 1, Rf_mkChar("n"));
  SET_STRING_ELT(names, 2, Rf_mkChar("which"));
  SET_STRING_ELT(names, 3, Rf_mkChar("nev"));
  SET_STRING_ELT(names, 4, Rf_mkChar("tol"));
  SET_STRING_ELT(names, 5, Rf_mkChar("ncv"));
  SET_STRING_ELT(names, 6, Rf_mkChar("ldv"));
  SET_STRING_ELT(names, 7, Rf_mkChar("ishift"));
  SET_STRING_ELT(names, 8, Rf_mkChar("maxiter"));
  SET_STRING_ELT(names, 9, Rf_mkChar("nb"));
  SET_STRING_ELT(names, 10, Rf_mkChar("mode"));
  SET_STRING_ELT(names, 11, Rf_mkChar("start"));
  SET_STRING_ELT(names, 12, Rf_mkChar("sigma"));
  SET_STRING_ELT(names, 13, Rf_mkChar("sigmai"));
  SET_STRING_ELT(names, 14, Rf_mkChar("info"));
  SET_STRING_ELT(names, 15, Rf_mkChar("iter"));
  SET_STRING_ELT(names, 16, Rf_mkChar("nconv"));
  SET_STRING_ELT(names, 17, Rf_mkChar("numop"));
  SET_STRING_ELT(names, 18, Rf_mkChar("numopb"));
  SET_STRING_ELT(names, 19, Rf_mkChar("numreo"));
  SET_NAMES(result, names);

  UNPROTECT(2);
  return result;
}

int R_SEXP_to_igraph_eigen_which(SEXP in, igraph_eigen_which_t *out) {
        SEXP pos=PROTECT(AS_CHARACTER(R_igraph_getListElement(in, "pos")));
        SEXP balance=PROTECT(AS_CHARACTER(R_igraph_getListElement
                                                                                                                                                (in, "balance")));

        if (!strcasecmp(CHAR(STRING_ELT(pos, 0)), "lm")) {
                out->pos=IGRAPH_EIGEN_LM;
        } else if (!strcasecmp(CHAR(STRING_ELT(pos, 0)), "sm")) {
                out->pos=IGRAPH_EIGEN_SM;
        } else if (!strcasecmp(CHAR(STRING_ELT(pos, 0)), "la")) {
                out->pos=IGRAPH_EIGEN_LA;
        } else if (!strcasecmp(CHAR(STRING_ELT(pos, 0)), "sa")) {
                out->pos=IGRAPH_EIGEN_SA;
        } else if (!strcasecmp(CHAR(STRING_ELT(pos, 0)), "be")) {
                out->pos=IGRAPH_EIGEN_BE;
        } else if (!strcasecmp(CHAR(STRING_ELT(pos, 0)), "lr")) {
                out->pos=IGRAPH_EIGEN_LR;
        } else if (!strcasecmp(CHAR(STRING_ELT(pos, 0)), "sr")) {
                out->pos=IGRAPH_EIGEN_SR;
        } else if (!strcasecmp(CHAR(STRING_ELT(pos, 0)), "li")) {
                out->pos=IGRAPH_EIGEN_LI;
        } else if (!strcasecmp(CHAR(STRING_ELT(pos, 0)), "si")) {
                out->pos=IGRAPH_EIGEN_SI;
        } else if (!strcasecmp(CHAR(STRING_ELT(pos, 0)), "all")) {
                out->pos=IGRAPH_EIGEN_ALL;
        } else if (!strcasecmp(CHAR(STRING_ELT(pos, 0)), "interval")) {
                out->pos=IGRAPH_EIGEN_INTERVAL;
        } else if (!strcasecmp(CHAR(STRING_ELT(pos, 0)), "select")) {
                out->pos=IGRAPH_EIGEN_SELECT;
        } else {
                UNPROTECT(2);
                IGRAPH_ERROR("Unknown eigenvalue position specification",
                                                                 IGRAPH_EINVAL);
        }

        out->howmany=INTEGER(AS_INTEGER(R_igraph_getListElement
                                                                                                                                        (in, "howmany")))[0];
        out->il=INTEGER(AS_INTEGER(R_igraph_getListElement(in, "il")))[0];
        out->iu=INTEGER(AS_INTEGER(R_igraph_getListElement(in, "iu")))[0];
        out->vl=REAL(AS_NUMERIC(R_igraph_getListElement(in, "vl")))[0];
        out->vu=REAL(AS_NUMERIC(R_igraph_getListElement(in, "vu")))[0];
        out->vestimate=INTEGER(AS_INTEGER(R_igraph_getListElement
                                                                                                                                                (in, "vestimate")))[0];

        if (!strcasecmp(CHAR(STRING_ELT(balance, 0)), "none")) {
                out->balance=IGRAPH_LAPACK_DGEEVX_BALANCE_NONE;
        } else if (!strcasecmp(CHAR(STRING_ELT(balance, 0)), "perm")) {
                out->balance=IGRAPH_LAPACK_DGEEVX_BALANCE_PERM;
        } else if (!strcasecmp(CHAR(STRING_ELT(balance, 0)), "scale")) {
                out->balance=IGRAPH_LAPACK_DGEEVX_BALANCE_SCALE;
        } else if (!strcasecmp(CHAR(STRING_ELT(balance, 0)), "both")) {
                out->balance=IGRAPH_LAPACK_DGEEVX_BALANCE_BOTH;
        }       else {
                UNPROTECT(2);
                IGRAPH_ERROR("Unknown balance specification", IGRAPH_EINVAL);
        }

        UNPROTECT(2);
        return 0;
}

SEXP R_igraph_bliss_info_to_SEXP(const igraph_bliss_info_t *info) {
  SEXP result, names;

  PROTECT(result=NEW_LIST(6));
  SET_VECTOR_ELT(result, 0, NEW_NUMERIC(1)); REAL(VECTOR_ELT(result, 0))[0]=info->nof_nodes;
  SET_VECTOR_ELT(result, 1, NEW_NUMERIC(1)); REAL(VECTOR_ELT(result, 1))[0]=info->nof_leaf_nodes;
  SET_VECTOR_ELT(result, 2, NEW_NUMERIC(1)); REAL(VECTOR_ELT(result, 2))[0]=info->nof_bad_nodes;
  SET_VECTOR_ELT(result, 3, NEW_NUMERIC(1)); REAL(VECTOR_ELT(result, 3))[0]=info->nof_canupdates;
  SET_VECTOR_ELT(result, 4, NEW_NUMERIC(1)); REAL(VECTOR_ELT(result, 4))[0]=info->max_level;
  if (info->group_size) {
    SET_VECTOR_ELT(result, 5, NEW_CHARACTER(1));
    SET_STRING_ELT(VECTOR_ELT(result, 5), 0, Rf_mkChar(info->group_size));
  } else {
    SET_VECTOR_ELT(result, 5, R_NilValue);
  }

  PROTECT(names=NEW_CHARACTER(6));
  SET_STRING_ELT(names, 0, Rf_mkChar("nof_nodes"));
  SET_STRING_ELT(names, 1, Rf_mkChar("nof_leaf_nodes"));
  SET_STRING_ELT(names, 2, Rf_mkChar("nof_bad_nodes"));
  SET_STRING_ELT(names, 3, Rf_mkChar("nof_canupdates"));
  SET_STRING_ELT(names, 4, Rf_mkChar("max_level"));
  SET_STRING_ELT(names, 5, Rf_mkChar("group_size"));
  SET_NAMES(result, names);

  UNPROTECT(2);
  return result;
}

/*******************************************************************/

SEXP R_igraph_copy_from(SEXP graph)
{
  igraph_vector_t from;
  R_igraph_get_from(graph, &from);
  return R_igraph_vector_to_SEXP(&from);
}

SEXP R_igraph_copy_to(SEXP graph)
{
  igraph_vector_t to;
  R_igraph_get_to(graph, &to);
  return R_igraph_vector_to_SEXP(&to);
}

SEXP R_igraph_copy_env(SEXP graph)
{
  return Rf_duplicate(R_igraph_graph_env(graph));
}

SEXP R_igraph_mybracket(SEXP graph, SEXP pidx) {
  int idx=INTEGER(pidx)[0]-1;
  return Rf_duplicate(VECTOR_ELT(graph, idx));
}

SEXP R_igraph_mybracket2(SEXP graph, SEXP pidx1, SEXP pidx2) {
  int idx1=INTEGER(pidx1)[0]-1;
  int idx2=INTEGER(pidx2)[0]-1;
  return Rf_duplicate(VECTOR_ELT(VECTOR_ELT(graph, idx1), idx2));
}

SEXP R_igraph_mybracket2_names(SEXP graph, SEXP pidx1, SEXP pidx2) {
  SEXP result;
  int idx1=INTEGER(pidx1)[0]-1;
  int idx2=INTEGER(pidx2)[0]-1;
  result=Rf_duplicate(GET_NAMES(VECTOR_ELT(VECTOR_ELT(graph, idx1), idx2)));
  return result;
}

SEXP R_igraph_mybracket2_copy(SEXP graph, SEXP pidx1, SEXP pidx2) {
  int idx1=INTEGER(pidx1)[0]-1;
  int idx2=INTEGER(pidx2)[0]-1;
  return Rf_duplicate(VECTOR_ELT(VECTOR_ELT(graph, idx1), idx2));
}

SEXP R_igraph_mybracket2_set(SEXP graph, SEXP pidx1, SEXP pidx2,
                             SEXP value) {
  SEXP newgraph;
  int idx1=INTEGER(pidx1)[0]-1;
  int idx2=INTEGER(pidx2)[0]-1;
  PROTECT(newgraph=Rf_duplicate(graph));
  SET_VECTOR_ELT(VECTOR_ELT(newgraph, idx1), idx2, value);
  UNPROTECT(1);
  return newgraph;
}

SEXP R_igraph_mybracket3_set(SEXP graph, SEXP pidx1, SEXP pidx2,
                             SEXP pname, SEXP value) {
  SEXP newgraph;
  int idx1=INTEGER(pidx1)[0]-1;
  int idx2=INTEGER(pidx2)[0]-1;
  const char *name=CHAR(STRING_ELT(pname, 0));
  SEXP attrs, names;
  int i, n;

  PROTECT(newgraph=Rf_duplicate(graph));
  attrs=VECTOR_ELT(VECTOR_ELT(newgraph, idx1), idx2);
  names=PROTECT(Rf_getAttrib(attrs, R_NamesSymbol));
  n=Rf_length(attrs);

  for (i=0; i<n; i++) {
    if (strcmp(CHAR(STRING_ELT(names, i)), name) == 0) { break; }
  }
  if (i==n) {
    /* New attribute, append it */
    SEXP newattrs, newnames;
    PROTECT(newattrs=NEW_LIST(n+1));
    PROTECT(newnames=NEW_CHARACTER(n+1));
    for (i=0; i<n; i++) {
      SET_VECTOR_ELT(newattrs, i, VECTOR_ELT(attrs, i));
      SET_STRING_ELT(newnames, i, STRING_ELT(names, i));
    }
    SET_VECTOR_ELT(newattrs, i, value);
    SET_STRING_ELT(newnames, i, Rf_mkChar(name));
    SET_NAMES(newattrs, newnames);
    SET_VECTOR_ELT(VECTOR_ELT(newgraph, idx1), idx2, newattrs);
    UNPROTECT(2);
  } else {
    /* Existing attribute, just set it */
    SET_VECTOR_ELT(attrs, i, value);
    SET_VECTOR_ELT(VECTOR_ELT(newgraph, idx1), idx2, attrs);
  }

  UNPROTECT(2);
  return newgraph;
}

SEXP R_igraph_add_edges(SEXP graph, SEXP edges) {

  igraph_vector_t v;                    /* do NOT destroy! */
  igraph_t g;
  SEXP result;

  R_SEXP_to_vector(edges, &v);
  R_SEXP_to_igraph_copy(graph, &g);
  IGRAPH_FINALLY(igraph_destroy, &g);
  IGRAPH_R_CHECK(igraph_add_edges(&g, &v, 0));
  PROTECT(result=R_igraph_to_SEXP(&g));
  IGRAPH_I_DESTROY(&g);
  IGRAPH_FINALLY_CLEAN(1);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_add_vertices(SEXP graph, SEXP pnv) {

  igraph_integer_t nv;
  igraph_t g;
  SEXP result;

  nv=(igraph_integer_t) REAL(pnv)[0];
  R_SEXP_to_igraph_copy(graph, &g);
  IGRAPH_R_CHECK(igraph_add_vertices(&g, nv, 0));
  PROTECT(result=R_igraph_to_SEXP(&g));
  IGRAPH_I_DESTROY(&g);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_ecount(SEXP graph) {

  igraph_t g;
  SEXP result;

  R_SEXP_to_igraph(graph, &g);
  PROTECT(result=NEW_NUMERIC(1));
  REAL(result)[0]=igraph_ecount(&g);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_neighbors(SEXP graph, SEXP pvid, SEXP pmode) {

  igraph_t g;
  igraph_vector_t neis;
  SEXP result;
  igraph_real_t vid;
  igraph_neimode_t mode;

  igraph_vector_init(&neis, 0);
  vid=REAL(pvid)[0];
  mode = (igraph_neimode_t) Rf_asInteger(pmode);
  R_SEXP_to_igraph(graph, &g);
  IGRAPH_R_CHECK(igraph_neighbors(&g, &neis, (igraph_integer_t) vid, mode));

  PROTECT(result=NEW_NUMERIC(igraph_vector_size(&neis)));
  igraph_vector_copy_to(&neis, REAL(result));
  igraph_vector_destroy(&neis);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_incident(SEXP graph, SEXP pvid, SEXP pmode) {

  igraph_t g;
  igraph_vector_t neis;
  SEXP result;
  igraph_real_t vid;
  igraph_neimode_t mode;

  igraph_vector_init(&neis, 0);
  vid=REAL(pvid)[0];
  mode = (igraph_neimode_t) Rf_asInteger(pmode);
  R_SEXP_to_igraph(graph, &g);
  IGRAPH_R_CHECK(igraph_incident(&g, &neis, (igraph_integer_t) vid, mode));

  PROTECT(result=NEW_NUMERIC(igraph_vector_size(&neis)));
  igraph_vector_copy_to(&neis, REAL(result));
  igraph_vector_destroy(&neis);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_delete_edges(SEXP graph, SEXP edges) {

  igraph_es_t es;
  igraph_t g;
  SEXP result;

  R_SEXP_to_igraph_copy(graph, &g);
  R_SEXP_to_igraph_es(edges, &g, &es);
  IGRAPH_R_CHECK(igraph_delete_edges(&g, es));
  PROTECT(result=R_igraph_to_SEXP(&g));
  IGRAPH_I_DESTROY(&g);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_delete_vertices(SEXP graph, SEXP vertices) {

  igraph_vs_t vs;
  igraph_t g;
  SEXP result;

  R_SEXP_to_igraph_copy(graph, &g);
  R_SEXP_to_igraph_vs(vertices, &g, &vs);
  IGRAPH_R_CHECK(igraph_delete_vertices(&g, vs));
  PROTECT(result=R_igraph_to_SEXP(&g));
  IGRAPH_I_DESTROY(&g);
  igraph_vs_destroy(&vs);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_is_directed(SEXP graph) {

  igraph_t g;
  SEXP result;

  R_SEXP_to_igraph(graph, &g);
  PROTECT(result=NEW_LOGICAL(1));
  LOGICAL(result)[0]=igraph_is_directed(&g);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_create(SEXP edges, SEXP pn, SEXP pdirected) {

  igraph_t g;
  igraph_vector_t v;
  igraph_integer_t n=(igraph_integer_t) REAL(pn)[0];
  igraph_bool_t directed=LOGICAL(pdirected)[0];
  SEXP result;

  R_SEXP_to_vector(edges, &v);
  IGRAPH_R_CHECK(igraph_create(&g, &v, n, directed));
  PROTECT(result=R_igraph_to_SEXP(&g));
  IGRAPH_I_DESTROY(&g);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_degree(SEXP graph, SEXP vids, SEXP pmode, SEXP ploops) {

  igraph_t g;
  igraph_vs_t vs;
  igraph_vector_t res;
  igraph_neimode_t mode = (igraph_neimode_t) Rf_asInteger(pmode);
  igraph_bool_t loops=LOGICAL(ploops)[0];
  SEXP result;

  R_SEXP_to_igraph(graph, &g);
  R_SEXP_to_igraph_vs(vids, &g, &vs);
  igraph_vector_init(&res, 0);
  IGRAPH_R_CHECK(igraph_degree(&g, &res, vs, mode, loops));

  PROTECT(result=NEW_NUMERIC(igraph_vector_size(&res)));
  igraph_vector_copy_to(&res, REAL(result));
  igraph_vector_destroy(&res);
  igraph_vs_destroy(&vs);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_diameter(SEXP graph, SEXP pdirected, SEXP punconnected,
                       SEXP pweights) {

  igraph_t g;
  igraph_bool_t directed=LOGICAL(pdirected)[0];
  igraph_bool_t unconnected=LOGICAL(punconnected)[0];
  igraph_vector_t weights;
  igraph_real_t res;
  SEXP result;

  R_SEXP_to_igraph(graph, &g);
  if (!Rf_isNull(pweights)) {
    R_SEXP_to_vector(pweights, &weights);
  }
  IGRAPH_R_CHECK(igraph_diameter_dijkstra(&g, Rf_isNull(pweights) ? 0 : &weights, &res, 0, 0, 0, directed, unconnected));

  PROTECT(result=NEW_NUMERIC(1));
  REAL(result)[0]=res;

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_get_diameter(SEXP graph, SEXP pdirected, SEXP punconnected,
                           SEXP pweights) {

  igraph_t g;
  igraph_bool_t directed=LOGICAL(pdirected)[0];
  igraph_bool_t unconnected=LOGICAL(punconnected)[0];
  igraph_vector_t weights;
  igraph_vector_t res;
  igraph_real_t dialen;
  SEXP result;

  R_SEXP_to_igraph(graph, &g);
  if (!Rf_isNull(pweights)) {
    R_SEXP_to_vector(pweights, &weights);
  }
  igraph_vector_init(&res, 0);
  IGRAPH_R_CHECK(igraph_diameter_dijkstra(&g, Rf_isNull(pweights) ? 0 : &weights, &dialen, 0, 0, &res, directed, unconnected));

  PROTECT(result=NEW_NUMERIC(igraph_vector_size(&res)));
  igraph_vector_copy_to(&res, REAL(result));
  igraph_vector_destroy(&res);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_farthest_points(SEXP graph, SEXP pdirected, SEXP punconnected,
                              SEXP pweights) {

  igraph_t g;
  igraph_bool_t directed=LOGICAL(pdirected)[0];
  igraph_bool_t unconnected=LOGICAL(punconnected)[0];
  igraph_vector_t weights;
  igraph_real_t len;
  igraph_integer_t from, to;
  SEXP result;

  R_SEXP_to_igraph(graph, &g);
  if (!Rf_isNull(pweights)) {
    R_SEXP_to_vector(pweights, &weights);
  }
  IGRAPH_R_CHECK(igraph_diameter_dijkstra(&g, Rf_isNull(pweights) ? 0 : &weights, &len, &from, &to, 0, directed, unconnected));

  PROTECT(result=NEW_NUMERIC(3));
  if (from < 0) {
    REAL(result)[0]=REAL(result)[1]=REAL(result)[2]=NA_REAL;
  } else {
    REAL(result)[0]=from;
    REAL(result)[1]=to;
    REAL(result)[2]=len;
  }

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_subcomponent(SEXP graph, SEXP pvertex, SEXP pmode) {

  igraph_t g;
  igraph_real_t vertex=REAL(pvertex)[0];
  igraph_neimode_t mode = (igraph_neimode_t) Rf_asInteger(pmode);
  igraph_vector_t res;
  SEXP result;

  R_SEXP_to_igraph(graph, &g);
  igraph_vector_init(&res, 0);
  IGRAPH_R_CHECK(igraph_subcomponent(&g, &res, vertex, mode));

  PROTECT(result=NEW_NUMERIC(igraph_vector_size(&res)));
  igraph_vector_copy_to(&res, REAL(result));
  igraph_vector_destroy(&res);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_betweenness(SEXP graph, SEXP pvids, SEXP pdirected,
                          SEXP weights) {

  igraph_t g;
  igraph_vs_t vs;
  igraph_bool_t directed=LOGICAL(pdirected)[0];
  igraph_vector_t res;
  igraph_vector_t v_weights, *pweights=0;
  SEXP result;

  R_SEXP_to_igraph(graph, &g);
  R_SEXP_to_igraph_vs(pvids, &g, &vs);
  igraph_vector_init(&res, 0);
  if (!Rf_isNull(weights)) {
    pweights=&v_weights; R_SEXP_to_vector(weights, &v_weights);
  }
  IGRAPH_R_CHECK(igraph_betweenness(&g, &res, vs, directed, pweights));

  PROTECT(result=NEW_NUMERIC(igraph_vector_size(&res)));
  igraph_vector_copy_to(&res, REAL(result));
  igraph_vector_destroy(&res);
  igraph_vs_destroy(&vs);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_running_mean(SEXP pdata, SEXP pbinwidth) {

  igraph_vector_t data;
  igraph_integer_t binwidth=(igraph_integer_t) REAL(pbinwidth)[0];
  igraph_vector_t res;
  SEXP result;

  R_SEXP_to_vector(pdata, &data);

  igraph_vector_init(&res, 0);
  IGRAPH_R_CHECK(igraph_running_mean(&data, &res, binwidth));

  PROTECT(result=NEW_NUMERIC(igraph_vector_size(&res)));
  igraph_vector_copy_to(&res, REAL(result));
  igraph_vector_destroy(&res);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_cocitation(SEXP graph, SEXP pvids) {

  igraph_t g;
  igraph_vs_t vs;
  igraph_matrix_t m;
  SEXP result;

  R_SEXP_to_igraph(graph, &g);
  R_SEXP_to_igraph_vs(pvids, &g, &vs);
  igraph_matrix_init(&m, 0, 0);
  IGRAPH_R_CHECK(igraph_cocitation(&g, &m, vs));

  PROTECT(result=R_igraph_matrix_to_SEXP(&m));
  igraph_matrix_destroy(&m);
  igraph_vs_destroy(&vs);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_bibcoupling(SEXP graph, SEXP pvids) {

  igraph_t g;
  igraph_vs_t vs;
  igraph_matrix_t m;
  SEXP result;

  R_SEXP_to_igraph(graph, &g);
  R_SEXP_to_igraph_vs(pvids, &g, &vs);
  igraph_matrix_init(&m, 0, 0);
  IGRAPH_R_CHECK(igraph_bibcoupling(&g, &m, vs));

  PROTECT(result=R_igraph_matrix_to_SEXP(&m));
  igraph_matrix_destroy(&m);
  igraph_vs_destroy(&vs);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_growing_random_game(SEXP pn, SEXP pm, SEXP pdirected,
                                  SEXP pcitation) {

  igraph_t g;
  igraph_integer_t n=(igraph_integer_t) REAL(pn)[0];
  igraph_integer_t m=(igraph_integer_t) REAL(pm)[0];
  igraph_bool_t citation=LOGICAL(pcitation)[0];
  igraph_bool_t directed=LOGICAL(pdirected)[0];
  SEXP result;

  IGRAPH_R_CHECK(igraph_growing_random_game(&g, n, m, directed, citation));
  PROTECT(result=R_igraph_to_SEXP(&g));
  IGRAPH_I_DESTROY(&g);

  UNPROTECT(1);
  return result;
}

/* igraph_shortest_paths_johnson() does not have a 'mode' argument in C/igraph 0.9 and 0.10.
 * This function fills in this functionality. It should be removed when C/igraph is updated,
 * to version 0.11 where igraph_distances_johnson() does support 'mode'. */
static int distances_johnson(const igraph_t *graph,
                             igraph_matrix_t *res,
                             igraph_vs_t from, igraph_vs_t to,
                             const igraph_vector_t *weights,
                             igraph_neimode_t mode,
                             igraph_bool_t negw /* should be set to true if there are negative weights */) {
  if (! igraph_is_directed(graph)) {
    mode = IGRAPH_ALL;
  }
  if (mode == IGRAPH_ALL && negw) {
    /* Reject undirected grahs with negative weights, just like igraph_shortest_paths_johnson() would. */
    IGRAPH_ERROR("Undirected graph with negative weight.", IGRAPH_ENEGLOOP);
  }
  if (! negw) {
    /* Fall back to Dijstra when there are no negative weights, just like igraph_shortest_paths_johnson() would. */
    return igraph_shortest_paths_dijkstra(graph, res, from, to, weights, mode);
  }
  /* We simulate mode=IN by swapping to/from and transposing the result matrix. */
  if (mode == IGRAPH_IN) {
    IGRAPH_CHECK(igraph_shortest_paths_johnson(graph, res, to, from, weights));
    IGRAPH_CHECK(igraph_matrix_transpose(res));
  } else {
    IGRAPH_CHECK(igraph_shortest_paths_johnson(graph, res, from, to, weights));
  }
  return IGRAPH_SUCCESS;
}

SEXP R_igraph_shortest_paths(SEXP graph, SEXP pvids, SEXP pto,
                             SEXP pmode, SEXP weights,
                             SEXP palgo) {

  igraph_t g;
  igraph_vs_t vs, to;
  igraph_integer_t mode=(igraph_integer_t) REAL(pmode)[0];
  long int algo=(long int) REAL(palgo)[0];
  igraph_matrix_t res;
  igraph_vector_t w, *pw=&w;
  igraph_bool_t negw=0;
  SEXP result;

  R_SEXP_to_igraph(graph, &g);
  R_SEXP_to_igraph_vs(pvids, &g, &vs);
  R_SEXP_to_igraph_vs(pto, &g, &to);
  if (Rf_isNull(weights)) {
    pw=0;
  } else {
    R_SEXP_to_vector(weights, &w);
    negw = igraph_vector_size(&w) > 0 && igraph_vector_min(&w) < 0;
  }
  igraph_matrix_init(&res, 0, 0);
  switch (algo) {
  case 0:                       /* automatic */
    if (negw && mode != IGRAPH_ALL && GET_LENGTH(pvids)>100) {
      distances_johnson(&g, &res, vs, to, pw, (igraph_neimode_t) mode, negw);
    } else if (negw) {
      IGRAPH_R_CHECK(igraph_shortest_paths_bellman_ford(&g, &res, vs, to, pw, (igraph_neimode_t) mode));
    } else {
      /* This one chooses 'unweighted' if there are no weights */
      IGRAPH_R_CHECK(igraph_shortest_paths_dijkstra(&g, &res, vs, to, pw, (igraph_neimode_t) mode));
    }
    break;
  case 1:                       /* unweighted */
    IGRAPH_R_CHECK(igraph_shortest_paths(&g, &res, vs, to, (igraph_neimode_t) mode));
    break;
  case 2:                       /* dijkstra */
    IGRAPH_R_CHECK(igraph_shortest_paths_dijkstra(&g, &res, vs, to, pw, (igraph_neimode_t) mode));
    break;
  case 3:                       /* bellman-ford */
    IGRAPH_R_CHECK(igraph_shortest_paths_bellman_ford(&g, &res, vs, to, pw, (igraph_neimode_t) mode));
    break;
  case 4:                       /* johnson */
    distances_johnson(&g, &res, vs, to, pw, mode, negw);
    break;
  }
  PROTECT(result=R_igraph_matrix_to_SEXP(&res));
  igraph_matrix_destroy(&res);
  igraph_vs_destroy(&vs);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_lattice(SEXP pdimvector, SEXP pnei, SEXP pdirected,
                      SEXP pmutual, SEXP pcircular) {

  igraph_t g;
  igraph_vector_t dimvector;
  igraph_integer_t nei=(igraph_integer_t) REAL(pnei)[0];
  igraph_bool_t directed=LOGICAL(pdirected)[0];
  igraph_bool_t mutual=LOGICAL(pmutual)[0];
  igraph_bool_t circular=LOGICAL(pcircular)[0];
  SEXP result;

  R_SEXP_to_vector(pdimvector, &dimvector);

  IGRAPH_R_CHECK(igraph_lattice(&g, &dimvector, nei, directed, mutual, circular));
  PROTECT(result=R_igraph_to_SEXP(&g));
  IGRAPH_I_DESTROY(&g);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_barabasi_game(SEXP pn, SEXP ppower, SEXP pm, SEXP poutseq,
                            SEXP poutpref, SEXP pA, SEXP pdirected,
                            SEXP palgo, SEXP pstart) {

  igraph_t g;
  igraph_integer_t n=(igraph_integer_t) REAL(pn)[0];
  igraph_real_t power=REAL(ppower)[0];
  igraph_integer_t m=Rf_isNull(pm) ? 0 : (igraph_integer_t) REAL(pm)[0];
  igraph_vector_t outseq, *myoutseq=0;
  igraph_bool_t outpref=LOGICAL(poutpref)[0];
  igraph_real_t A=REAL(pA)[0];
  igraph_bool_t directed=LOGICAL(pdirected)[0];
  igraph_barabasi_algorithm_t algo = (igraph_barabasi_algorithm_t) Rf_asInteger(palgo);
  igraph_t start, *ppstart=0;
  SEXP result;

  if (!Rf_isNull(poutseq)) {
    R_SEXP_to_vector(poutseq, &outseq);
    myoutseq=&outseq;
  }

  if (!Rf_isNull(pstart)) {
    R_SEXP_to_igraph(pstart, &start);
    ppstart=&start;
  }

  IGRAPH_R_CHECK(igraph_barabasi_game(&g, n, power, m, myoutseq, outpref, A, directed, algo, ppstart));
  PROTECT(result=R_igraph_to_SEXP(&g));
  IGRAPH_I_DESTROY(&g);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_recent_degree_game(SEXP pn, SEXP ppower, SEXP pwindow,
                                 SEXP pm, SEXP poutseq, SEXP poutpref,
                                 SEXP pzero_appeal,
                                 SEXP pdirected) {
  igraph_t g;
  igraph_integer_t n=(igraph_integer_t) REAL(pn)[0];
  igraph_real_t power=REAL(ppower)[0];
  igraph_integer_t window=(igraph_integer_t) REAL(pwindow)[0];
  igraph_integer_t m=(igraph_integer_t) REAL(pm)[0];
  igraph_vector_t outseq;
  igraph_bool_t outpref=LOGICAL(poutpref)[0];
  igraph_bool_t directed=LOGICAL(pdirected)[0];
  igraph_real_t zero_appeal=REAL(pzero_appeal)[0];
  SEXP result;

  R_SEXP_to_vector(poutseq, &outseq);

  IGRAPH_R_CHECK(igraph_recent_degree_game(&g, n, power, window, m, &outseq, outpref, zero_appeal, directed));
  PROTECT(result=R_igraph_to_SEXP(&g));
  IGRAPH_I_DESTROY(&g);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_layout_fruchterman_reingold(SEXP graph, SEXP coords,
                                          SEXP niter, SEXP start_temp,
                                          SEXP weights,
                                          SEXP minx, SEXP maxx,
                                          SEXP miny, SEXP maxy, SEXP grid) {
  /* Declarations */
  igraph_t c_graph;
  igraph_matrix_t c_coords;
  igraph_integer_t c_niter;
  igraph_real_t c_start_temp;
  igraph_vector_t c_weights;
  igraph_vector_t c_minx;
  igraph_vector_t c_maxx;
  igraph_vector_t c_miny;
  igraph_vector_t c_maxy;
  igraph_layout_grid_t c_grid=INTEGER(grid)[0];

  SEXP result;
  /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (!Rf_isNull(coords)) {
    if (0 != R_SEXP_to_igraph_matrix_copy(coords, &c_coords)) {
      igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
    }
  } else {
    igraph_matrix_init(&c_coords, 0, 0);
  }
  IGRAPH_FINALLY(igraph_matrix_destroy, &c_coords);
  c_niter=INTEGER(niter)[0];
  c_start_temp=REAL(start_temp)[0];
  if (!Rf_isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
  if (!Rf_isNull(minx)) { R_SEXP_to_vector(minx, &c_minx); }
  if (!Rf_isNull(maxx)) { R_SEXP_to_vector(maxx, &c_maxx); }
  if (!Rf_isNull(miny)) { R_SEXP_to_vector(miny, &c_miny); }
  if (!Rf_isNull(maxy)) { R_SEXP_to_vector(maxy, &c_maxy); }
  /* Call igraph */
  IGRAPH_R_CHECK(igraph_layout_fruchterman_reingold(&c_graph, &c_coords, !Rf_isNull(coords), c_niter, c_start_temp, c_grid, (Rf_isNull(weights) ? 0 : &c_weights), (Rf_isNull(minx) ? 0 : &c_minx), (Rf_isNull(maxx) ? 0 : &c_maxx), (Rf_isNull(miny) ? 0 : &c_miny), (Rf_isNull(maxy) ? 0 : &c_maxy)));

  /* Convert output */
  PROTECT(coords=R_igraph_matrix_to_SEXP(&c_coords));
  igraph_matrix_destroy(&c_coords);
  IGRAPH_FINALLY_CLEAN(1);
  result=coords;

  UNPROTECT(1);
  return(result);
}

SEXP R_igraph_layout_fruchterman_reingold_3d(SEXP graph, SEXP coords,
                                             SEXP niter, SEXP start_temp,
                                             SEXP weights,
                                             SEXP minx, SEXP maxx,
                                             SEXP miny, SEXP maxy,
                                             SEXP minz, SEXP maxz) {
  /* Declarations */
  igraph_t c_graph;
  igraph_matrix_t c_coords;
  igraph_integer_t c_niter;
  igraph_real_t c_start_temp;
  igraph_vector_t c_weights;
  igraph_vector_t c_minx;
  igraph_vector_t c_maxx;
  igraph_vector_t c_miny;
  igraph_vector_t c_maxy;
  igraph_vector_t c_minz;
  igraph_vector_t c_maxz;

  SEXP result;
  /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (!Rf_isNull(coords)) {
    if (0 != R_SEXP_to_igraph_matrix_copy(coords, &c_coords)) {
      igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
    }
  } else {
    igraph_matrix_init(&c_coords, 0, 0);
  }
  IGRAPH_FINALLY(igraph_matrix_destroy, &c_coords);
  c_niter=INTEGER(niter)[0];
  c_start_temp=REAL(start_temp)[0];
  if (!Rf_isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
  if (!Rf_isNull(minx)) { R_SEXP_to_vector(minx, &c_minx); }
  if (!Rf_isNull(maxx)) { R_SEXP_to_vector(maxx, &c_maxx); }
  if (!Rf_isNull(miny)) { R_SEXP_to_vector(miny, &c_miny); }
  if (!Rf_isNull(maxy)) { R_SEXP_to_vector(maxy, &c_maxy); }
  if (!Rf_isNull(minz)) { R_SEXP_to_vector(minz, &c_minz); }
  if (!Rf_isNull(maxz)) { R_SEXP_to_vector(maxz, &c_maxz); }
  /* Call igraph */
  IGRAPH_R_CHECK(igraph_layout_fruchterman_reingold_3d(&c_graph, &c_coords, !Rf_isNull(coords), c_niter, c_start_temp, (Rf_isNull(weights) ? 0 : &c_weights), (Rf_isNull(minx) ? 0 : &c_minx), (Rf_isNull(maxx) ? 0 : &c_maxx), (Rf_isNull(miny) ? 0 : &c_miny), (Rf_isNull(maxy) ? 0 : &c_maxy), (Rf_isNull(minz) ? 0 : &c_minz), (Rf_isNull(maxz) ? 0 : &c_maxz)));

  /* Convert output */
  PROTECT(coords=R_igraph_matrix_to_SEXP(&c_coords));
  igraph_matrix_destroy(&c_coords);
  IGRAPH_FINALLY_CLEAN(1);
  result=coords;

  UNPROTECT(1);
  return(result);
}

SEXP R_igraph_layout_kamada_kawai(SEXP graph, SEXP coords, SEXP maxiter,
                                  SEXP epsilon, SEXP kkconst, SEXP weights,
                                  SEXP minx, SEXP maxx,
                                  SEXP miny, SEXP maxy) {

  /* Declarations */
  igraph_t c_graph;
  igraph_matrix_t c_coords;
  igraph_integer_t c_maxiter;
  igraph_real_t c_epsilon;
  igraph_real_t c_kkconst;
  igraph_vector_t c_weights;
  igraph_vector_t c_minx;
  igraph_vector_t c_maxx;
  igraph_vector_t c_miny;
  igraph_vector_t c_maxy;

  SEXP result;
  /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (!Rf_isNull(coords)) {
    if (0 != R_SEXP_to_igraph_matrix_copy(coords, &c_coords)) {
      igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
    }
  } else {
    igraph_matrix_init(&c_coords, 0, 0);
  }
  IGRAPH_FINALLY(igraph_matrix_destroy, &c_coords);
  c_maxiter=INTEGER(maxiter)[0];
  c_epsilon=REAL(epsilon)[0];
  c_kkconst=REAL(kkconst)[0];
  if (!Rf_isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
  if (!Rf_isNull(minx)) { R_SEXP_to_vector(minx, &c_minx); }
  if (!Rf_isNull(maxx)) { R_SEXP_to_vector(maxx, &c_maxx); }
  if (!Rf_isNull(miny)) { R_SEXP_to_vector(miny, &c_miny); }
  if (!Rf_isNull(maxy)) { R_SEXP_to_vector(maxy, &c_maxy); }
  /* Call igraph */
  IGRAPH_R_CHECK(igraph_layout_kamada_kawai(&c_graph, &c_coords, !Rf_isNull(coords), c_maxiter, c_epsilon, c_kkconst, (Rf_isNull(weights) ? 0 : &c_weights), (Rf_isNull(minx) ? 0 : &c_minx), (Rf_isNull(maxx) ? 0 : &c_maxx), (Rf_isNull(miny) ? 0 : &c_miny), (Rf_isNull(maxy) ? 0 : &c_maxy)));

                                        /* Convert output */
  PROTECT(coords=R_igraph_matrix_to_SEXP(&c_coords));
  igraph_matrix_destroy(&c_coords);
  IGRAPH_FINALLY_CLEAN(1);
  result=coords;

  UNPROTECT(1);
  return(result);
}

SEXP R_igraph_layout_kamada_kawai_3d(SEXP graph, SEXP coords, SEXP maxiter,
                                     SEXP epsilon, SEXP kkconst,
                                     SEXP weights,
                                     SEXP minx, SEXP maxx,
                                     SEXP miny, SEXP maxy,
                                     SEXP minz, SEXP maxz) {

  /* Declarations */
  igraph_t c_graph;
  igraph_matrix_t c_coords;
  igraph_integer_t c_maxiter;
  igraph_real_t c_epsilon;
  igraph_real_t c_kkconst;
  igraph_vector_t c_weights;
  igraph_vector_t c_minx;
  igraph_vector_t c_maxx;
  igraph_vector_t c_miny;
  igraph_vector_t c_maxy;
  igraph_vector_t c_minz;
  igraph_vector_t c_maxz;

  SEXP result;
  /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (!Rf_isNull(coords)) {
    if (0 != R_SEXP_to_igraph_matrix_copy(coords, &c_coords)) {
      igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
    }
  } else {
    igraph_matrix_init(&c_coords, 0, 0);
  }
  IGRAPH_FINALLY(igraph_matrix_destroy, &c_coords);
  c_maxiter=INTEGER(maxiter)[0];
  c_epsilon=REAL(epsilon)[0];
  c_kkconst=REAL(kkconst)[0];
  if (!Rf_isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
  if (!Rf_isNull(minx)) { R_SEXP_to_vector(minx, &c_minx); }
  if (!Rf_isNull(maxx)) { R_SEXP_to_vector(maxx, &c_maxx); }
  if (!Rf_isNull(miny)) { R_SEXP_to_vector(miny, &c_miny); }
  if (!Rf_isNull(maxy)) { R_SEXP_to_vector(maxy, &c_maxy); }
  if (!Rf_isNull(minz)) { R_SEXP_to_vector(minz, &c_minz); }
  if (!Rf_isNull(maxz)) { R_SEXP_to_vector(maxz, &c_maxz); }
  /* Call igraph */
  IGRAPH_R_CHECK(igraph_layout_kamada_kawai_3d(&c_graph, &c_coords, !Rf_isNull(coords), c_maxiter, c_epsilon, c_kkconst, (Rf_isNull(weights) ? 0 : &c_weights), (Rf_isNull(minx) ? 0 : &c_minx), (Rf_isNull(maxx) ? 0 : &c_maxx), (Rf_isNull(miny) ? 0 : &c_miny), (Rf_isNull(maxy) ? 0 : &c_maxy), (Rf_isNull(minz) ? 0 : &c_minz), (Rf_isNull(maxz) ? 0 : &c_maxz)));

                                        /* Convert output */
  PROTECT(coords=R_igraph_matrix_to_SEXP(&c_coords));
  igraph_matrix_destroy(&c_coords);
  IGRAPH_FINALLY_CLEAN(1);
  result=coords;

  UNPROTECT(1);
  return(result);
}

SEXP R_igraph_layout_graphopt(SEXP graph, SEXP pniter, SEXP pcharge,
                              SEXP pmass, SEXP pspring_length,
                              SEXP pspring_constant, SEXP pmax_sa_movement,
                              SEXP start) {
  igraph_t g;
  igraph_integer_t niter=(igraph_integer_t) REAL(pniter)[0];
  igraph_real_t charge=REAL(pcharge)[0];
  igraph_real_t mass=REAL(pmass)[0];
  igraph_real_t spring_length=REAL(pspring_length)[0];
  igraph_real_t spring_constant=REAL(pspring_constant)[0];
  igraph_real_t max_sa_movement=REAL(pmax_sa_movement)[0];
  igraph_matrix_t res;
  SEXP result;

  R_SEXP_to_igraph(graph, &g);
  if (Rf_isNull(start)) {
    igraph_matrix_init(&res, 0, 0);
  } else {
    R_SEXP_to_igraph_matrix_copy(start, &res);
  }
  IGRAPH_R_CHECK(igraph_layout_graphopt(&g, &res, niter, charge, mass, spring_length, spring_constant, max_sa_movement, !Rf_isNull(start)));
  PROTECT(result=R_igraph_matrix_to_SEXP(&res));
  igraph_matrix_destroy(&res);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_layout_lgl(SEXP graph, SEXP pmaxiter, SEXP pmaxdelta,
                         SEXP parea, SEXP pcoolexp, SEXP prepulserad,
                         SEXP pcellsize, SEXP proot) {

  igraph_t g;
  igraph_matrix_t res;
  igraph_integer_t maxiter=(igraph_integer_t) REAL(pmaxiter)[0];
  igraph_real_t maxdelta=REAL(pmaxdelta)[0];
  igraph_real_t area=REAL(parea)[0];
  igraph_real_t coolexp=REAL(pcoolexp)[0];
  igraph_real_t repulserad=REAL(prepulserad)[0];
  igraph_real_t cellsize=REAL(pcellsize)[0];
  igraph_integer_t root=(igraph_integer_t) REAL(proot)[0];
  SEXP result;

  R_SEXP_to_igraph(graph, &g);
  igraph_matrix_init(&res, 0, 0);
  IGRAPH_R_CHECK(igraph_layout_lgl(&g, &res, maxiter, maxdelta, area, coolexp, repulserad, cellsize, root));
  PROTECT(result=R_igraph_matrix_to_SEXP(&res));
  igraph_matrix_destroy(&res);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_minimum_spanning_tree_unweighted(SEXP graph) {

  igraph_t g;
  igraph_t mst;
  SEXP result;

  R_SEXP_to_igraph(graph, &g);
  IGRAPH_R_CHECK(igraph_minimum_spanning_tree_unweighted(&g, &mst));
  PROTECT(result=R_igraph_to_SEXP(&mst));
  IGRAPH_I_DESTROY(&mst);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_minimum_spanning_tree_prim(SEXP graph, SEXP pweights) {

  igraph_t g;
  igraph_t mst;
  igraph_vector_t weights;
  SEXP result;

  R_SEXP_to_vector(pweights, &weights);

  R_SEXP_to_igraph(graph, &g);
  IGRAPH_R_CHECK(igraph_minimum_spanning_tree_prim(&g, &mst, &weights));
  PROTECT(result=R_igraph_to_SEXP(&mst));
  IGRAPH_I_DESTROY(&mst);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_get_shortest_paths(SEXP graph, SEXP pfrom, SEXP pto,
                                 SEXP pmode, SEXP pno, SEXP weights,
                                 SEXP output, SEXP ppred, SEXP pinbound,
                                 SEXP palgo) {

  igraph_t g;
  igraph_integer_t from=(igraph_integer_t) REAL(pfrom)[0];
  igraph_vs_t to;
  igraph_integer_t mode=(igraph_integer_t) REAL(pmode)[0];
  igraph_vector_t *vects, *evects;
  long int i;
  igraph_vector_ptr_t ptrvec, ptrevec;
  igraph_vector_t w, *pw=&w;
  igraph_bool_t negw=0;
  SEXP result, result1, result2, names;
  igraph_bool_t verts=REAL(output)[0]==0 || REAL(output)[0]==2;
  igraph_bool_t edges=REAL(output)[0]==1 || REAL(output)[0]==2;
  igraph_bool_t pred=LOGICAL(ppred)[0];
  igraph_bool_t inbound=LOGICAL(pinbound)[0];
  long int algo=(long int) REAL(palgo)[0];
  igraph_vector_long_t predvec, inboundvec;

  long int no=(long int) REAL(pno)[0];

  R_SEXP_to_igraph(graph, &g);
  R_SEXP_to_igraph_vs(pto, &g, &to);

  if (verts) {
    igraph_vector_ptr_init(&ptrvec, no);
    vects=(igraph_vector_t*) R_alloc((size_t) GET_LENGTH(pto),
                                     sizeof(igraph_vector_t));
    for (i=0; i<no; i++) {
      igraph_vector_init(&vects[i], 0);
      VECTOR(ptrvec)[i]=&vects[i];
    }
  }
  if (edges) {
    igraph_vector_ptr_init(&ptrevec, no);
    evects=(igraph_vector_t*) R_alloc((size_t) GET_LENGTH(pto),
                                      sizeof(igraph_vector_t));
    for (i=0; i<no; i++) {
      igraph_vector_init(&evects[i], 0);
      VECTOR(ptrevec)[i]=&evects[i];
    }
  }

  if (Rf_isNull(weights)) {
    pw=0;
  } else {
    R_SEXP_to_vector(weights, &w);
    negw = igraph_vector_size(&w) > 0 && igraph_vector_min(&w) < 0;
  }

  if (pred) { igraph_vector_long_init(&predvec, no); }
  if (inbound) { igraph_vector_long_init(&inboundvec, no); }

  switch (algo) {
  case 0:                       /* automatic */
    if (negw) {
      IGRAPH_R_CHECK(igraph_get_shortest_paths_bellman_ford(&g, verts ? &ptrvec : 0, edges ? &ptrevec : 0, from, to, pw, (igraph_neimode_t) mode, pred ? &predvec : 0, inbound ? &inboundvec : 0));
    } else {
      /* This one chooses 'unweighted' if there are no weights */
      IGRAPH_R_CHECK(igraph_get_shortest_paths_dijkstra(&g, verts ? &ptrvec : 0, edges ? &ptrevec : 0, from, to, pw, (igraph_neimode_t) mode, pred ? &predvec : 0, inbound ? &inboundvec : 0));
    }
    break;
  case 1:                       /* unweighted */
    IGRAPH_R_CHECK(igraph_get_shortest_paths(&g, verts ? &ptrvec : 0, edges ? &ptrevec : 0, from, to, (igraph_neimode_t) mode, pred ? &predvec : 0, inbound ? &inboundvec : 0));
    break;
  case 2:                       /* dijkstra */
    IGRAPH_R_CHECK(igraph_get_shortest_paths_dijkstra(&g, verts ? &ptrvec : 0, edges ? &ptrevec : 0, from, to, pw, (igraph_neimode_t) mode, pred ? &predvec : 0, inbound ? &inboundvec : 0));
    break;
  case 3:                       /* bellman-ford */
    IGRAPH_R_CHECK(igraph_get_shortest_paths_bellman_ford(&g, verts ? &ptrvec : 0, edges ? &ptrevec : 0, from, to, pw, (igraph_neimode_t) mode, pred ? &predvec : 0, inbound ? &inboundvec : 0));
    break;
  }

  PROTECT(result=NEW_LIST(4));
  if (verts) {
    SET_VECTOR_ELT(result, 0, NEW_LIST(no));
    result1=VECTOR_ELT(result, 0);
    for (i=0; i<no; i++) {
      SET_VECTOR_ELT(result1, i, NEW_NUMERIC(igraph_vector_size(&vects[i])));
      igraph_vector_copy_to(&vects[i], REAL(VECTOR_ELT(result1, i)));
      igraph_vector_destroy(&vects[i]);
    }
    igraph_vector_ptr_destroy(&ptrvec);
  } else {
    SET_VECTOR_ELT(result, 0, R_NilValue);
  }
  if (edges) {
    SET_VECTOR_ELT(result, 1, NEW_LIST(no));
    result2=VECTOR_ELT(result, 1);
    for (i=0; i<no; i++) {
      SET_VECTOR_ELT(result2, i, NEW_NUMERIC(igraph_vector_size(&evects[i])));
      igraph_vector_copy_to(&evects[i], REAL(VECTOR_ELT(result2, i)));
      igraph_vector_destroy(&evects[i]);
    }
    igraph_vector_ptr_destroy(&ptrevec);
  } else {
    SET_VECTOR_ELT(result, 1, R_NilValue);
  }
  if (pred) {
    SET_VECTOR_ELT(result, 2, R_igraph_vector_long_to_SEXP(&predvec));
    igraph_vector_long_destroy(&predvec);
  } else {
    SET_VECTOR_ELT(result, 2, R_NilValue);
  }
  if (inbound) {
    SET_VECTOR_ELT(result, 3, R_igraph_vector_long_to_SEXP(&inboundvec));
    igraph_vector_long_destroy(&inboundvec);
  } else {
    SET_VECTOR_ELT(result, 3, R_NilValue);
  }

  PROTECT(names=NEW_CHARACTER(4));
  SET_STRING_ELT(names, 0, Rf_mkChar("vpath"));
  SET_STRING_ELT(names, 1, Rf_mkChar("epath"));
  SET_STRING_ELT(names, 2, Rf_mkChar("predecessors"));
  SET_STRING_ELT(names, 3, Rf_mkChar("inbound_edges"));
  SET_NAMES(result, names);

  UNPROTECT(2);
  return result;
}

SEXP R_igraph_are_connected(SEXP graph, SEXP pv1, SEXP pv2) {

  igraph_t g;
  igraph_integer_t v1=(igraph_integer_t) REAL(pv1)[0];
  igraph_integer_t v2=(igraph_integer_t) REAL(pv2)[0];
  igraph_bool_t res;
  SEXP result;

  R_SEXP_to_igraph(graph, &g);
  PROTECT(result=NEW_LOGICAL(1));
  IGRAPH_R_CHECK(igraph_are_connected(&g, v1, v2, &res));
  LOGICAL(result)[0]=res;

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_graph_adjacency(SEXP adjmatrix, SEXP pmode) {

  igraph_t g;
  igraph_matrix_t adjm;
  igraph_integer_t mode=(igraph_integer_t) REAL(pmode)[0];
  SEXP result;

  R_SEXP_to_matrix(adjmatrix, &adjm);
  IGRAPH_R_CHECK(igraph_adjacency(&g, &adjm, (igraph_adjacency_t) mode));
  PROTECT(result=R_igraph_to_SEXP(&g));
  IGRAPH_I_DESTROY(&g);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_weighted_adjacency(SEXP adjmatrix, SEXP pmode,
                                 SEXP pattr, SEXP ploops) {

  igraph_t g;
  igraph_matrix_t adjm;
  igraph_integer_t mode=(igraph_integer_t) REAL(pmode)[0];
  igraph_bool_t loops=LOGICAL(ploops)[0];
  SEXP result;
  const char *attr=CHAR(STRING_ELT(pattr, 0));

  R_SEXP_to_matrix(adjmatrix, &adjm);
  IGRAPH_R_CHECK(igraph_weighted_adjacency(&g, &adjm, (igraph_adjacency_t) mode, attr, loops));
  PROTECT(result=R_igraph_to_SEXP(&g));
  IGRAPH_I_DESTROY(&g);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_star(SEXP pn, SEXP pmode, SEXP pcenter) {

  igraph_t g;
  igraph_integer_t n=(igraph_integer_t) REAL(pn)[0];
  igraph_integer_t mode=(igraph_integer_t) REAL(pmode)[0];
  igraph_integer_t center=(igraph_integer_t) REAL(pcenter)[0];
  SEXP result;

  IGRAPH_R_CHECK(igraph_star(&g, n, (igraph_star_mode_t) mode, center));
  PROTECT(result=R_igraph_to_SEXP(&g));
  IGRAPH_I_DESTROY(&g);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_ring(SEXP pn, SEXP pdirected, SEXP pmutual, SEXP pcircular) {

  igraph_t g;
  igraph_integer_t n=(igraph_integer_t) REAL(pn)[0];
  igraph_bool_t directed=LOGICAL(pdirected)[0];
  igraph_bool_t mutual=LOGICAL(pmutual)[0];
  igraph_bool_t circular=LOGICAL(pcircular)[0];
  SEXP result;

  IGRAPH_R_CHECK(igraph_ring(&g, n, directed, mutual, circular));
  PROTECT(result=R_igraph_to_SEXP(&g));
  IGRAPH_I_DESTROY(&g);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_tree(SEXP pn, SEXP pchildren, SEXP pmode) {

  igraph_t g;
  igraph_integer_t n=(igraph_integer_t) REAL(pn)[0];
  igraph_integer_t children=(igraph_integer_t) REAL(pchildren)[0];
  igraph_integer_t mode=(igraph_integer_t) REAL(pmode)[0];
  SEXP result;

  IGRAPH_R_CHECK(igraph_tree(&g, n, children, (igraph_tree_mode_t) mode));
  PROTECT(result=R_igraph_to_SEXP(&g));
  IGRAPH_I_DESTROY(&g);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_layout_random(SEXP graph) {

  igraph_t g;
  igraph_matrix_t res;
  SEXP result=R_NilValue;

  R_SEXP_to_igraph(graph, &g);
  igraph_matrix_init(&res, 0, 0);
  IGRAPH_R_CHECK(igraph_layout_random(&g, &res));
  PROTECT(result=R_igraph_matrix_to_SEXP(&res));
  igraph_matrix_destroy(&res);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_layout_circle(SEXP graph, SEXP porder) {

  igraph_t g;
  igraph_matrix_t res;
  igraph_vs_t order;
  SEXP result=R_NilValue;

  R_SEXP_to_igraph(graph, &g);
  igraph_matrix_init(&res, 0, 0);
  R_SEXP_to_igraph_vs(porder, &g, &order);
  IGRAPH_R_CHECK(igraph_layout_circle(&g, &res, order));
  igraph_vs_destroy(&order);
  PROTECT(result=R_igraph_matrix_to_SEXP(&res));
  igraph_matrix_destroy(&res);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_erdos_renyi_game(SEXP pn, SEXP ptype,
                               SEXP pporm, SEXP pdirected, SEXP ploops) {

  igraph_t g;
  igraph_integer_t n=(igraph_integer_t) REAL(pn)[0];
  igraph_integer_t type=(igraph_integer_t) REAL(ptype)[0];
  igraph_real_t porm=REAL(pporm)[0];
  igraph_bool_t directed=LOGICAL(pdirected)[0];
  igraph_bool_t loops=LOGICAL(ploops)[0];
  SEXP result;

  igraph_erdos_renyi_game(&g, (igraph_erdos_renyi_t) type, n, porm, directed,
                          loops);
  PROTECT(result=R_igraph_to_SEXP(&g));
  IGRAPH_I_DESTROY(&g);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_full(SEXP pn, SEXP pdirected, SEXP ploops) {

  igraph_t g;
  igraph_integer_t n=(igraph_integer_t) REAL(pn)[0];
  igraph_bool_t directed=LOGICAL(pdirected)[0];
  igraph_bool_t loops=LOGICAL(ploops)[0];
  SEXP result;

  IGRAPH_R_CHECK(igraph_full(&g, n, directed, loops));
  PROTECT(result=R_igraph_to_SEXP(&g));
  IGRAPH_I_DESTROY(&g);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_random_sample(SEXP plow, SEXP phigh, SEXP plength) {

  igraph_vector_t res;
  igraph_integer_t low=(igraph_integer_t) REAL(plow)[0];
  igraph_integer_t high=(igraph_integer_t) REAL(phigh)[0];
  igraph_integer_t length=(igraph_integer_t) REAL(plength)[0];
  SEXP result;

  igraph_vector_init(&res, 0);
  IGRAPH_R_CHECK(igraph_random_sample(&res, low, high, length));
  PROTECT(result=NEW_NUMERIC(igraph_vector_size(&res)));
  igraph_vector_copy_to(&res, REAL(result));
  igraph_vector_destroy(&res);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_get_edgelist(SEXP graph, SEXP pbycol) {

  igraph_t g;
  igraph_vector_t res;
  igraph_bool_t bycol=LOGICAL(pbycol)[0];
  SEXP result;

  R_SEXP_to_igraph(graph, &g);
  igraph_vector_init(&res, 0);
  IGRAPH_R_CHECK(igraph_get_edgelist(&g, &res, bycol));
  PROTECT(result=NEW_NUMERIC(igraph_vector_size(&res)));
  igraph_vector_copy_to(&res, REAL(result));
  igraph_vector_destroy(&res);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_get_adjacency(SEXP graph, SEXP ptype, SEXP peids) {

  igraph_t g;
  igraph_matrix_t res;
  igraph_integer_t type=(igraph_integer_t) REAL(ptype)[0];
  igraph_bool_t eids=LOGICAL(peids)[0];
  SEXP result;

  R_SEXP_to_igraph(graph, &g);
  igraph_matrix_init(&res, 0, 0);
  IGRAPH_R_CHECK(igraph_get_adjacency(&g, &res, (igraph_get_adjacency_t) type, eids));
  PROTECT(result=R_igraph_matrix_to_SEXP(&res));
  igraph_matrix_destroy(&res);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_degree_sequence_game(SEXP pout_seq, SEXP pin_seq,
                                   SEXP pmethod) {
  igraph_t g;
  igraph_vector_t outseq;
  igraph_vector_t inseq;
  igraph_integer_t method=(igraph_integer_t) REAL(pmethod)[0];
  SEXP result;

  R_SEXP_to_vector(pout_seq, &outseq);
  if (!Rf_isNull(pin_seq)) { R_SEXP_to_vector(pin_seq, &inseq); }
  IGRAPH_R_CHECK(igraph_degree_sequence_game(&g, &outseq, Rf_isNull(pin_seq) ? 0 : &inseq, (igraph_degseq_t) method));
  PROTECT(result=R_igraph_to_SEXP(&g));
  IGRAPH_I_DESTROY(&g);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_transitivity_undirected(SEXP graph, SEXP pisolates) {

  igraph_t g;
  igraph_real_t res;
  SEXP result;
  igraph_transitivity_mode_t isolates=REAL(pisolates)[0];

  R_SEXP_to_igraph(graph, &g);
  IGRAPH_R_CHECK(igraph_transitivity_undirected(&g, &res, isolates));
  PROTECT(result=NEW_NUMERIC(1));
  REAL(result)[0]=res;

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_transitivity_avglocal_undirected(SEXP graph, SEXP pisolates) {

  igraph_t g;
  igraph_real_t res;
  SEXP result;
  igraph_transitivity_mode_t isolates=REAL(pisolates)[0];

  R_SEXP_to_igraph(graph, &g);
  IGRAPH_R_CHECK(igraph_transitivity_avglocal_undirected(&g, &res, isolates));
  PROTECT(result=NEW_NUMERIC(1));
  REAL(result)[0]=res;

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_transitivity_local_undirected(SEXP graph, SEXP pvids,
                                            SEXP pisolates) {

  igraph_t g;
  igraph_vs_t vs;
  igraph_vector_t res;
  SEXP result;
  igraph_transitivity_mode_t isolates=REAL(pisolates)[0];

  R_SEXP_to_igraph(graph, &g);
  R_SEXP_to_igraph_vs(pvids, &g, &vs);
  igraph_vector_init(&res, 0);
  IGRAPH_R_CHECK(igraph_transitivity_local_undirected(&g, &res, vs, isolates));

  PROTECT(result=NEW_NUMERIC(igraph_vector_size(&res)));
  igraph_vector_copy_to(&res, REAL(result));
  igraph_vector_destroy(&res);
  igraph_vs_destroy(&vs);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_transitivity_barrat(SEXP graph, SEXP pvids,
                                  SEXP pweights, SEXP pisolates) {

  igraph_t g;
  igraph_vs_t vs;
  igraph_vector_t weights;
  igraph_vector_t res;
  SEXP result;
  igraph_transitivity_mode_t isolates=REAL(pisolates)[0];

  R_SEXP_to_igraph(graph, &g);
  R_SEXP_to_igraph_vs(pvids, &g, &vs);
  R_SEXP_to_vector(pweights, &weights);
  igraph_vector_init(&res, 0);
  IGRAPH_R_CHECK(igraph_transitivity_barrat(&g, &res, vs, &weights, isolates));

  PROTECT(result=NEW_NUMERIC(igraph_vector_size(&res)));
  igraph_vector_copy_to(&res, REAL(result));
  igraph_vector_destroy(&res);
  igraph_vs_destroy(&vs);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_transitivity_local_undirected_all(SEXP graph, SEXP pisolates) {

  igraph_t g;
  igraph_vector_t res;
  SEXP result;
  igraph_transitivity_mode_t isolates=REAL(pisolates)[0];

  R_SEXP_to_igraph(graph, &g);
  igraph_vector_init(&res, 0);
  IGRAPH_R_CHECK(igraph_transitivity_local_undirected(&g, &res, igraph_vss_all(), isolates));

  PROTECT(result=NEW_NUMERIC(igraph_vector_size(&res)));
  igraph_vector_copy_to(&res, REAL(result));
  igraph_vector_destroy(&res);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_read_graph_edgelist(SEXP pvfile, SEXP pn, SEXP pdirected) {
  igraph_t g;
  igraph_integer_t n=(igraph_integer_t) REAL(pn)[0];
  igraph_bool_t directed=LOGICAL(pdirected)[0];
  FILE *file;
  SEXP result;

#if HAVE_FMEMOPEN == 1
  file=fmemopen(RAW(pvfile), GET_LENGTH(pvfile), "r");
#else
  file=fopen(CHAR(STRING_ELT(pvfile, 0)), "r");
#endif
  if (file==0) { igraph_error("Cannot read edgelist", __FILE__, __LINE__,
                              IGRAPH_EFILE); }
  IGRAPH_R_CHECK(igraph_read_graph_edgelist(&g, file, n, directed));
  fclose(file);
  PROTECT(result=R_igraph_to_SEXP(&g));
  IGRAPH_I_DESTROY(&g);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_read_graph_gml(SEXP pvfile) {

  igraph_t g;
  FILE *file;
  SEXP result;

#if HAVE_FMEMOPEN == 1
  file=fmemopen(RAW(pvfile), GET_LENGTH(pvfile), "r");
#else
  file=fopen(CHAR(STRING_ELT(pvfile, 0)), "r");
#endif
  if (file==0) { igraph_error("Cannot read GML file", __FILE__, __LINE__,
                              IGRAPH_EFILE); }
  IGRAPH_R_CHECK(igraph_read_graph_gml(&g, file));
  fclose(file);
  PROTECT(result=R_igraph_to_SEXP(&g));
  IGRAPH_I_DESTROY(&g);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_read_graph_dl(SEXP pvfile, SEXP pdirected) {

  igraph_t g;
  FILE *file;
  SEXP result;
  igraph_bool_t directed=LOGICAL(pdirected)[0];

#if HAVE_FMEMOPEN == 1
  file=fmemopen(RAW(pvfile), GET_LENGTH(pvfile), "r");
#else
  file=fopen(CHAR(STRING_ELT(pvfile, 0)), "r");
#endif
  if (file==0) { igraph_error("Cannot read DL file", __FILE__, __LINE__,
                              IGRAPH_EFILE); }
  IGRAPH_R_CHECK(igraph_read_graph_dl(&g, file, directed));
  fclose(file);
  PROTECT(result=R_igraph_to_SEXP(&g));
  IGRAPH_I_DESTROY(&g);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_read_graph_graphdb(SEXP pvfile, SEXP pdirected) {
  igraph_t g;
  igraph_bool_t directed=LOGICAL(pdirected)[0];
  FILE *file;
  SEXP result;

#if HAVE_FMEMOPEN == 1
  file=fmemopen(RAW(pvfile), GET_LENGTH(pvfile), "rb");
#else
  file=fopen(CHAR(STRING_ELT(pvfile, 0)), "rb");
#endif
  if (file==0) { igraph_error("Cannot read graphdb file", __FILE__, __LINE__,
                              IGRAPH_EFILE); }
  IGRAPH_R_CHECK(igraph_read_graph_graphdb(&g, file, directed));
  fclose(file);
  PROTECT(result=R_igraph_to_SEXP(&g));
  IGRAPH_I_DESTROY(&g);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_write_graph_edgelist(SEXP graph, SEXP file) {
  igraph_t g;
  FILE *stream;
#if HAVE_OPEN_MEMSTREAM == 1
  char *bp;
  size_t size;
#endif
  SEXP result;

  R_SEXP_to_igraph(graph, &g);
#if HAVE_OPEN_MEMSTREAM == 1
  stream=open_memstream(&bp, &size);
#else
  stream=fopen(CHAR(STRING_ELT(file, 0)), "w");
#endif
  if (stream==0) { igraph_error("Cannot write edgelist", __FILE__, __LINE__,
                                IGRAPH_EFILE); }
  IGRAPH_R_CHECK(igraph_write_graph_edgelist(&g, stream));
  fclose(stream);
#if HAVE_OPEN_MEMSTREAM == 1
  PROTECT(result=Rf_allocVector(RAWSXP, size));
  memcpy(RAW(result), bp, sizeof(char)*size);
  free(bp);
#else
  PROTECT(result=NEW_NUMERIC(0));
#endif

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_write_graph_gml(SEXP graph, SEXP file, SEXP pid, SEXP pcreator) {
  igraph_t g;
  FILE *stream;
#if HAVE_OPEN_MEMSTREAM == 1
  char *bp;
  size_t size;
#endif
  igraph_vector_t id, *ppid=0;
  const char *creator=0;
  SEXP result;

  if (!Rf_isNull(pid)) { R_SEXP_to_vector(pid, &id); ppid=&id; }
  if (!Rf_isNull(pcreator)) { creator=CHAR(STRING_ELT(pcreator, 0)); }
  R_SEXP_to_igraph(graph, &g);
#if HAVE_OPEN_MEMSTREAM == 1
  stream=open_memstream(&bp, &size);
#else
  stream=fopen(CHAR(STRING_ELT(file, 0)), "w");
#endif
  if (stream==0) { igraph_error("Cannot write edgelist", __FILE__, __LINE__,
                                IGRAPH_EFILE); }
  IGRAPH_R_CHECK(igraph_write_graph_gml(&g, stream, ppid, creator));
  fclose(stream);
#if HAVE_OPEN_MEMSTREAM == 1
  PROTECT(result=Rf_allocVector(RAWSXP, size));
  memcpy(RAW(result), bp, sizeof(char)*size);
  free(bp);
#else
  PROTECT(result=NEW_NUMERIC(0));
#endif

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_write_graph_dot(SEXP graph, SEXP file) {
  igraph_t g;
  FILE *stream;
#if HAVE_OPEN_MEMSTREAM == 1
  char *bp;
  size_t size;
#endif
  SEXP result;

  R_SEXP_to_igraph(graph, &g);
#if HAVE_OPEN_MEMSTREAM == 1
  stream=open_memstream(&bp, &size);
#else
  stream=fopen(CHAR(STRING_ELT(file, 0)), "w");
#endif
  if (stream==0) { igraph_error("Cannot write edgelist", __FILE__, __LINE__,
                                IGRAPH_EFILE); }
  IGRAPH_R_CHECK(igraph_write_graph_dot(&g, stream));
  fclose(stream);
#if HAVE_OPEN_MEMSTREAM == 1
  PROTECT(result=Rf_allocVector(RAWSXP, size));
  memcpy(RAW(result), bp, sizeof(char)*size);
  free(bp);
#else
  PROTECT(result=NEW_NUMERIC(0));
#endif

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_write_graph_leda(SEXP graph, SEXP file, SEXP va, SEXP ea) {
  igraph_t g;
  FILE *stream;
#if HAVE_OPEN_MEMSTREAM == 1
  char *bp;
  size_t size;
#endif
  SEXP result;

  R_SEXP_to_igraph(graph, &g);
#if HAVE_OPEN_MEMSTREAM == 1
  stream=open_memstream(&bp, &size);
#else
  stream=fopen(CHAR(STRING_ELT(file, 0)), "w");
#endif
  if (stream==0) { igraph_error("Cannot write edgelist", __FILE__, __LINE__,
                                IGRAPH_EFILE); }
  IGRAPH_R_CHECK(igraph_write_graph_leda(&g, stream, Rf_isNull(va) ? 0 : CHAR(STRING_ELT(va, 0)), Rf_isNull(ea) ? 0 : CHAR(STRING_ELT(ea, 0))));
  fclose(stream);
#if HAVE_OPEN_MEMSTREAM == 1
  PROTECT(result=Rf_allocVector(RAWSXP, size));
  memcpy(RAW(result), bp, sizeof(char)*size);
  free(bp);
#else
  PROTECT(result=NEW_NUMERIC(0));
#endif

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_write_graph_pajek(SEXP graph, SEXP file) {

  igraph_t g;
  FILE *stream;
#if HAVE_OPEN_MEMSTREAM == 1
  char *bp;
  size_t size;
#endif
  SEXP result;

  R_SEXP_to_igraph(graph, &g);
#if HAVE_OPEN_MEMSTREAM == 1
  stream=open_memstream(&bp, &size);
#else
  stream=fopen(CHAR(STRING_ELT(file, 0)), "wb");
#endif
  if (stream==0) { igraph_error("Cannot write oajek file", __FILE__, __LINE__,
                                IGRAPH_EFILE); }
  IGRAPH_R_CHECK(igraph_write_graph_pajek(&g, stream));
  fclose(stream);
#if HAVE_OPEN_MEMSTREAM == 1
  PROTECT(result=Rf_allocVector(RAWSXP, size));
  memcpy(RAW(result), bp, sizeof(char)*size);
  free(bp);
#else
  PROTECT(result=NEW_NUMERIC(0));
#endif

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_read_graph_ncol(SEXP pvfile, SEXP ppredef,
                              SEXP pnames, SEXP pweights,
                              SEXP pdirected) {
  igraph_t g;
  igraph_bool_t names=LOGICAL(pnames)[0];
  igraph_add_weights_t weights=REAL(pweights)[0];
  igraph_bool_t directed=LOGICAL(pdirected)[0];
  FILE *file;
  igraph_strvector_t predef, *predefptr=0;
  SEXP result;

#if HAVE_FMEMOPEN == 1
  file=fmemopen(RAW(pvfile), GET_LENGTH(pvfile), "r");
#else
  file=fopen(CHAR(STRING_ELT(pvfile, 0)), "r");
#endif
  if (file==0) { igraph_error("Cannot read edgelist", __FILE__, __LINE__,
                              IGRAPH_EFILE); }
  if (GET_LENGTH(ppredef)>0) {
    R_igraph_SEXP_to_strvector(ppredef, &predef);
    predefptr=&predef;
  }
  IGRAPH_R_CHECK(igraph_read_graph_ncol(&g, file, predefptr, names, weights, directed));
  fclose(file);
  PROTECT(result=R_igraph_to_SEXP(&g));
  IGRAPH_I_DESTROY(&g);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_write_graph_ncol(SEXP graph, SEXP file, SEXP pnames,
                               SEXP pweights) {
  igraph_t g;
  FILE *stream;
#if HAVE_OPEN_MEMSTREAM == 1
  char *bp;
  size_t size;
#endif
  const char *names, *weights;
  SEXP result;

  if (Rf_isNull(pnames)) {
    names=0;
  } else {
    names=CHAR(STRING_ELT(pnames, 0));
  }
  if (Rf_isNull(pweights)) {
    weights=0;
  } else {
    weights=CHAR(STRING_ELT(pweights, 0));
  }

  R_SEXP_to_igraph(graph, &g);
#if HAVE_OPEN_MEMSTREAM == 1
  stream=open_memstream(&bp, &size);
#else
  stream=fopen(CHAR(STRING_ELT(file,0)), "w");
#endif
  if (stream==0) { igraph_error("Cannot write .ncol file", __FILE__, __LINE__,
                                IGRAPH_EFILE); }
  IGRAPH_R_CHECK(igraph_write_graph_ncol(&g, stream, names, weights));
  fclose(stream);
#if HAVE_OPEN_MEMSTREAM == 1
  PROTECT(result=Rf_allocVector(RAWSXP, size));
  memcpy(RAW(result), bp, sizeof(char)*size);
  free(bp);
#else
  PROTECT(result=NEW_NUMERIC(0));
#endif

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_read_graph_lgl(SEXP pvfile, SEXP pnames, SEXP pweights, SEXP pdirected) {
  igraph_t g;
  igraph_bool_t names=LOGICAL(pnames)[0];
  igraph_add_weights_t weights=REAL(pweights)[0];
  igraph_bool_t directed=LOGICAL(pdirected)[0];
  FILE *file;
  SEXP result;

#if HAVE_FMEMOPEN == 1
  file=fmemopen(RAW(pvfile), GET_LENGTH(pvfile), "r");
#else
  file=fopen(CHAR(STRING_ELT(pvfile, 0)), "r");
#endif
  if (file==0) { igraph_error("Cannot read edgelist", __FILE__, __LINE__,
                              IGRAPH_EFILE); }
  IGRAPH_R_CHECK(igraph_read_graph_lgl(&g, file, names, weights, directed));
  fclose(file);
  PROTECT(result=R_igraph_to_SEXP(&g));
  IGRAPH_I_DESTROY(&g);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_write_graph_lgl(SEXP graph, SEXP file, SEXP pnames,
                              SEXP pweights, SEXP pisolates) {
  igraph_t g;
  FILE *stream;
#if HAVE_OPEN_MEMSTREAM == 1
  char *bp;
  size_t size;
#endif
  const char *names, *weights;
  igraph_bool_t isolates=LOGICAL(pisolates)[0];
  SEXP result;

  if (Rf_isNull(pnames)) {
    names=0;
  } else {
    names=CHAR(STRING_ELT(pnames, 0));
  }
  if (Rf_isNull(pweights)) {
    weights=0;
  } else {
    weights=CHAR(STRING_ELT(pweights, 0));
  }

  R_SEXP_to_igraph(graph, &g);
#if HAVE_OPEN_MEMSTREAM == 1
  stream=open_memstream(&bp, &size);
#else
  stream=fopen(CHAR(STRING_ELT(file, 0)), "w");
#endif
  IGRAPH_R_CHECK(igraph_write_graph_lgl(&g, stream, names, weights, isolates));
  fclose(stream);
#if HAVE_OPEN_MEMSTREAM == 1
  PROTECT(result=Rf_allocVector(RAWSXP, size));
  memcpy(RAW(result), bp, sizeof(char)*size);
  free(bp);
#else
  PROTECT(result=NEW_NUMERIC(0));
#endif

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_read_graph_pajek(SEXP pvfile) {
  igraph_t g;
  FILE *file;
  SEXP result;

#if HAVE_FMEMOPEN == 1
  file=fmemopen(RAW(pvfile), GET_LENGTH(pvfile), "r");
#else
  file=fopen(CHAR(STRING_ELT(pvfile, 0)), "r");
#endif
  if (file==0) { igraph_error("Cannot read Pajek file", __FILE__, __LINE__,
                              IGRAPH_EFILE); }
  IGRAPH_R_CHECK(igraph_read_graph_pajek(&g, file));
  fclose(file);
  PROTECT(result=R_igraph_to_SEXP(&g));
  IGRAPH_I_DESTROY(&g);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_decompose(SEXP graph, SEXP pmode, SEXP pmaxcompno,
                        SEXP pminelements) {

  igraph_t g;
  igraph_connectedness_t mode = (igraph_connectedness_t) Rf_asInteger(pmode);
  igraph_integer_t maxcompno=(igraph_integer_t) REAL(pmaxcompno)[0];
  igraph_integer_t minelements=(igraph_integer_t) REAL(pminelements)[0];
  igraph_vector_ptr_t comps;
  SEXP result;
  long int i;

  R_PreserveObject(R_igraph_attribute_protected=NEW_LIST(100));
  R_igraph_attribute_protected_size=0;
  IGRAPH_FINALLY(R_igraph_attribute_protected_destroy, 0);

  R_SEXP_to_igraph(graph, &g);
  igraph_vector_ptr_init(&comps, 0);
  IGRAPH_FINALLY(igraph_vector_ptr_destroy, &comps);
  IGRAPH_R_CHECK(igraph_decompose(&g, &comps, mode, maxcompno, minelements));
  PROTECT(result=NEW_LIST(igraph_vector_ptr_size(&comps)));
  for (i=0; i<igraph_vector_ptr_size(&comps); i++) {
    SET_VECTOR_ELT(result, i, R_igraph_to_SEXP(VECTOR(comps)[i]));
    IGRAPH_I_DESTROY((igraph_t*)VECTOR(comps)[i]);
    igraph_free(VECTOR(comps)[i]);
  }
  igraph_vector_ptr_destroy(&comps);

  UNPROTECT(1);
  IGRAPH_FINALLY_CLEAN(2);
  R_igraph_attribute_protected_destroy(0);

  return result;
}

SEXP R_igraph_atlas(SEXP pno) {

  int no=(int) REAL(pno)[0];
  igraph_t g;
  SEXP result;

  IGRAPH_R_CHECK(igraph_atlas(&g, no));
  PROTECT(result=R_igraph_to_SEXP(&g));
  IGRAPH_I_DESTROY(&g);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_layout_random_3d(SEXP graph) {

  igraph_t g;
  igraph_matrix_t res;
  SEXP result;

  R_SEXP_to_igraph(graph, &g);
  igraph_matrix_init(&res, 0, 0);
  IGRAPH_R_CHECK(igraph_layout_random_3d(&g, &res));
  PROTECT(result=R_igraph_matrix_to_SEXP(&res));
  igraph_matrix_destroy(&res);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_layout_sphere(SEXP graph) {

  igraph_t g;
  igraph_matrix_t res;
  SEXP result;

  R_SEXP_to_igraph(graph, &g);
  igraph_matrix_init(&res, 0, 0);
  IGRAPH_R_CHECK(igraph_layout_sphere(&g, &res));
  PROTECT(result=R_igraph_matrix_to_SEXP(&res));
  igraph_matrix_destroy(&res);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_callaway_traits_game(SEXP pnodes, SEXP ptypes,
                                  SEXP pepers, SEXP ptype_dist,
                                  SEXP pmatrix, SEXP pdirected) {

  igraph_t g;
  igraph_integer_t nodes=(igraph_integer_t) REAL(pnodes)[0];
  igraph_integer_t types=(igraph_integer_t) REAL(ptypes)[0];
  igraph_integer_t epers=(igraph_integer_t) REAL(pepers)[0];
  igraph_vector_t type_dist;
  igraph_matrix_t matrix;
  igraph_bool_t directed=LOGICAL(pdirected)[0];
  SEXP result;

  R_SEXP_to_vector(ptype_dist, &type_dist);
  R_SEXP_to_matrix(pmatrix, &matrix);
  IGRAPH_R_CHECK(igraph_callaway_traits_game(&g, nodes, types, epers, &type_dist, &matrix, directed, /* node_type_vec = */ 0));
  PROTECT(result=R_igraph_to_SEXP(&g));
  IGRAPH_I_DESTROY(&g);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_establishment_game(SEXP pnodes, SEXP ptypes, SEXP pk,
                                 SEXP ptype_dist, SEXP pmatrix,
                                 SEXP pdirected) {
  igraph_t g;
  igraph_integer_t nodes=(igraph_integer_t) REAL(pnodes)[0];
  igraph_integer_t types=(igraph_integer_t) REAL(ptypes)[0];
  igraph_integer_t k=(igraph_integer_t) REAL(pk)[0];
  igraph_vector_t type_dist;
  igraph_matrix_t matrix;
  igraph_bool_t directed=LOGICAL(pdirected)[0];
  SEXP result;

  R_SEXP_to_vector(ptype_dist, &type_dist);
  R_SEXP_to_matrix(pmatrix, &matrix);
  IGRAPH_R_CHECK(igraph_establishment_game(&g, nodes, types, k, &type_dist, &matrix, directed, /* node_type_vec = */ 0));
  PROTECT(result=R_igraph_to_SEXP(&g));
  IGRAPH_I_DESTROY(&g);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_motifs_randesu(SEXP graph, SEXP psize, SEXP pcutprob) {
  igraph_t g;
  igraph_integer_t size=INTEGER(psize)[0];
  igraph_vector_t cutprob;
  igraph_vector_t res;
  SEXP result;

  R_SEXP_to_vector(pcutprob, &cutprob);
  R_SEXP_to_igraph(graph, &g);
  igraph_vector_init(&res, 0);
  IGRAPH_R_CHECK(igraph_motifs_randesu(&g, &res, size, &cutprob));
  PROTECT(result=NEW_NUMERIC(igraph_vector_size(&res)));
  igraph_vector_copy_to(&res, REAL(result));
  igraph_vector_destroy(&res);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_motifs_randesu_no(SEXP graph, SEXP psize, SEXP pcutprob) {
  igraph_t g;
  igraph_integer_t size=INTEGER(psize)[0];
  igraph_vector_t cutprob;
  igraph_integer_t res;
  SEXP result;

  R_SEXP_to_vector(pcutprob, &cutprob);
  R_SEXP_to_igraph(graph, &g);
  IGRAPH_R_CHECK(igraph_motifs_randesu_no(&g, &res, size, &cutprob));
  PROTECT(result=NEW_INTEGER(1));
  INTEGER(result)[0]=res;

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_motifs_randesu_estimate(SEXP graph, SEXP psize, SEXP pcutprob,
                                      SEXP psamplesize, SEXP psample) {
  igraph_t g;
  igraph_integer_t size=INTEGER(psize)[0];
  igraph_vector_t cutprob;
  igraph_integer_t samplesize=INTEGER(psamplesize)[0];
  igraph_vector_t sample;
  igraph_vector_t *sampleptr=0;
  igraph_integer_t res;
  SEXP result;

  R_SEXP_to_vector(pcutprob, &cutprob);
  if (GET_LENGTH(psample) != 0) {
    R_SEXP_to_vector(psample, &sample);
    sampleptr=&sample;
  }
  R_SEXP_to_igraph(graph, &g);
  IGRAPH_R_CHECK(igraph_motifs_randesu_estimate(&g, &res, size, &cutprob, samplesize, sampleptr));
  PROTECT(result=NEW_NUMERIC(1));
  REAL(result)[0]=res;

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_layout_merge_dla(SEXP graphs, SEXP layouts) {

  igraph_vector_ptr_t graphvec;
  igraph_vector_ptr_t ptrvec;
  igraph_t *gras;
  igraph_matrix_t *mats;
  igraph_matrix_t res;
  long int i;
  SEXP result;

  igraph_vector_ptr_init(&graphvec, GET_LENGTH(graphs));
  igraph_vector_ptr_init(&ptrvec, GET_LENGTH(layouts));
  gras=(igraph_t*)R_alloc((size_t) GET_LENGTH(graphs), sizeof(igraph_t));
  mats=(igraph_matrix_t*)R_alloc((size_t) GET_LENGTH(layouts),
                                 sizeof(igraph_matrix_t));
  for (i=0; i<GET_LENGTH(graphs); i++) {
    R_SEXP_to_igraph(VECTOR_ELT(graphs, i), &gras[i]);
    VECTOR(graphvec)[i]=&gras[i];
  }
  for (i=0; i<GET_LENGTH(layouts); i++) {
    R_SEXP_to_matrix(VECTOR_ELT(layouts, i), &mats[i]);
    VECTOR(ptrvec)[i]=&mats[i];
  }
  igraph_matrix_init(&res, 0, 0);
  IGRAPH_R_CHECK(igraph_layout_merge_dla(&graphvec, &ptrvec, &res));
  igraph_vector_ptr_destroy(&graphvec);
  igraph_vector_ptr_destroy(&ptrvec);
  PROTECT(result=R_igraph_matrix_to_SEXP(&res));
  igraph_matrix_destroy(&res);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_disjoint_union(SEXP pgraphs) {

  igraph_vector_ptr_t ptrvec;
  igraph_t *graphs;
  igraph_t res;
  long int i;
  SEXP result;

  igraph_vector_ptr_init(&ptrvec, GET_LENGTH(pgraphs));
  graphs=(igraph_t *)R_alloc((size_t) GET_LENGTH(pgraphs),
                             sizeof(igraph_t));
  for (i=0; i<GET_LENGTH(pgraphs); i++) {
    R_SEXP_to_igraph(VECTOR_ELT(pgraphs, i), &graphs[i]);
    VECTOR(ptrvec)[i]=&graphs[i];
  }
  IGRAPH_R_CHECK(igraph_disjoint_union_many(&res, &ptrvec));
  igraph_vector_ptr_destroy(&ptrvec);
  PROTECT(result=R_igraph_to_SEXP(&res));
  IGRAPH_I_DESTROY(&res);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_union(SEXP pgraphs, SEXP pedgemaps) {

  igraph_vector_ptr_t ptrvec;
  igraph_t *graphs;
  igraph_t res;
  long int i;
  igraph_bool_t edgemaps=LOGICAL(pedgemaps)[0];
  igraph_vector_ptr_t v_edgemaps, *my_edgemaps=edgemaps ? &v_edgemaps : 0;
  SEXP result, names;

  igraph_vector_ptr_init(&ptrvec, GET_LENGTH(pgraphs));
  graphs=(igraph_t *)R_alloc((size_t) GET_LENGTH(pgraphs),
                             sizeof(igraph_t));
  for (i=0; i<GET_LENGTH(pgraphs); i++) {
    R_SEXP_to_igraph(VECTOR_ELT(pgraphs, i), &graphs[i]);
    VECTOR(ptrvec)[i]=&graphs[i];
  }
  if (edgemaps) {
    igraph_vector_ptr_init(&v_edgemaps, 0);
  }
  IGRAPH_R_CHECK(igraph_union_many(&res, &ptrvec, my_edgemaps));
  igraph_vector_ptr_destroy(&ptrvec);
  PROTECT(result=NEW_LIST(2));
  SET_VECTOR_ELT(result, 0, R_igraph_to_SEXP(&res));
  SET_VECTOR_ELT(result, 1, R_igraph_0orvectorlist_to_SEXP(my_edgemaps));
  PROTECT(names=NEW_CHARACTER(2));
  SET_STRING_ELT(names, 0, Rf_mkChar("graph"));
  SET_STRING_ELT(names, 1, Rf_mkChar("edgemaps"));
  SET_NAMES(result, names);
  IGRAPH_I_DESTROY(&res);
  if (edgemaps) {
    for (i=0; i<igraph_vector_ptr_size(my_edgemaps); i++) {
      igraph_vector_destroy(VECTOR(*my_edgemaps)[i]);
      igraph_free(VECTOR(*my_edgemaps)[i]);
    }
    igraph_vector_ptr_destroy(my_edgemaps);
  }

  UNPROTECT(2);
  return result;
}

SEXP R_igraph_intersection(SEXP pgraphs, SEXP pedgemaps) {

  igraph_vector_ptr_t ptrvec;
  igraph_t *graphs;
  igraph_t res;
  long int i;
  igraph_bool_t edgemaps=LOGICAL(pedgemaps)[0];
  igraph_vector_ptr_t v_edgemaps, *my_edgemaps=edgemaps ? &v_edgemaps : 0;
  SEXP result, names;

  igraph_vector_ptr_init(&ptrvec, GET_LENGTH(pgraphs));
  graphs=(igraph_t *)R_alloc((size_t) GET_LENGTH(pgraphs),
                             sizeof(igraph_t));
  for (i=0; i<GET_LENGTH(pgraphs); i++) {
    R_SEXP_to_igraph(VECTOR_ELT(pgraphs, i), &graphs[i]);
    VECTOR(ptrvec)[i]=&graphs[i];
  }
  if (edgemaps) {
    igraph_vector_ptr_init(&v_edgemaps, 0);
  }
  IGRAPH_R_CHECK(igraph_intersection_many(&res, &ptrvec, my_edgemaps));
  igraph_vector_ptr_destroy(&ptrvec);
  PROTECT(result=NEW_LIST(2));
  SET_VECTOR_ELT(result, 0, R_igraph_to_SEXP(&res));
  SET_VECTOR_ELT(result, 1, R_igraph_0orvectorlist_to_SEXP(my_edgemaps));
  PROTECT(names=NEW_CHARACTER(2));
  SET_STRING_ELT(names, 0, Rf_mkChar("graph"));
  SET_STRING_ELT(names, 1, Rf_mkChar("edgemaps"));
  SET_NAMES(result, names);
  IGRAPH_I_DESTROY(&res);
  if (edgemaps) {
    for (i=0; i<igraph_vector_ptr_size(my_edgemaps); i++) {
      igraph_vector_destroy(VECTOR(*my_edgemaps)[i]);
      igraph_free(VECTOR(*my_edgemaps)[i]);
    }
    igraph_vector_ptr_destroy(my_edgemaps);
  }

  UNPROTECT(2);
  return result;
}

SEXP R_igraph_difference(SEXP pleft, SEXP pright) {

  igraph_t left, right;
  igraph_t res;
  SEXP result;

  R_SEXP_to_igraph(pleft, &left);
  R_SEXP_to_igraph(pright, &right);
  IGRAPH_R_CHECK(igraph_difference(&res, &left, &right));
  PROTECT(result=R_igraph_to_SEXP(&res));
  IGRAPH_I_DESTROY(&res);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_complementer(SEXP pgraph, SEXP ploops) {

  igraph_t g;
  igraph_t res;
  igraph_bool_t loops=LOGICAL(ploops)[0];
  SEXP result;

  R_SEXP_to_igraph(pgraph, &g);
  IGRAPH_R_CHECK(igraph_complementer(&res, &g, loops));
  PROTECT(result=R_igraph_to_SEXP(&res));
  IGRAPH_I_DESTROY(&res);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_compose(SEXP pleft, SEXP pright, SEXP pedgemaps) {

  igraph_t left, right;
  igraph_t res;
  SEXP result, names;
  igraph_bool_t edgemaps=LOGICAL(pedgemaps)[0];
  igraph_vector_t v_edgemap1, *my_edgemap1=edgemaps ? &v_edgemap1 : 0;
  igraph_vector_t v_edgemap2, *my_edgemap2=edgemaps ? &v_edgemap2 : 0;

  R_SEXP_to_igraph(pleft, &left);
  R_SEXP_to_igraph(pright, &right);
  if (edgemaps) {
    igraph_vector_init(my_edgemap1, 0);
    IGRAPH_FINALLY(igraph_vector_destroy, my_edgemap1);
    igraph_vector_init(my_edgemap2, 0);
    IGRAPH_FINALLY(igraph_vector_destroy, my_edgemap2);
  }
  IGRAPH_R_CHECK(igraph_compose(&res, &left, &right, my_edgemap1, my_edgemap2));
  PROTECT(result=NEW_LIST(3));
  SET_VECTOR_ELT(result, 0, R_igraph_to_SEXP(&res));
  IGRAPH_I_DESTROY(&res);
  SET_VECTOR_ELT(result, 2, R_igraph_0orvector_to_SEXP(my_edgemap2));
  if (edgemaps) {
    igraph_vector_destroy(my_edgemap2);
    IGRAPH_FINALLY_CLEAN(1);
  }
  IGRAPH_I_DESTROY(&res);
  SET_VECTOR_ELT(result, 1, R_igraph_0orvector_to_SEXP(my_edgemap1));
  if (edgemaps) {
    igraph_vector_destroy(my_edgemap1);
    IGRAPH_FINALLY_CLEAN(1);
  }
  PROTECT(names=NEW_CHARACTER(3));
  SET_STRING_ELT(names, 0, Rf_mkChar("graph"));
  SET_STRING_ELT(names, 1, Rf_mkChar("edge_map1"));
  SET_STRING_ELT(names, 2, Rf_mkChar("edge_map2"));
  SET_NAMES(result, names);

  UNPROTECT(2);
  return result;
}

SEXP R_igraph_barabasi_aging_game(SEXP pn, SEXP ppa_exp, SEXP paging_exp,
                                  SEXP paging_bin, SEXP pm, SEXP pout_seq,
                                  SEXP pout_pref, SEXP pzero_deg_appeal,
                                  SEXP pzero_age_appeal, SEXP pdeg_coef,
                                  SEXP page_coef,
                                  SEXP pdirected) {
  igraph_t g;
  igraph_integer_t n=(igraph_integer_t) REAL(pn)[0];
  igraph_real_t pa_exp=REAL(ppa_exp)[0];
  igraph_real_t aging_exp=REAL(paging_exp)[0];
  igraph_integer_t aging_bin=(igraph_integer_t) REAL(paging_bin)[0];
  igraph_integer_t m=(igraph_integer_t) REAL(pm)[0];
  igraph_vector_t out_seq;
  igraph_bool_t out_pref=LOGICAL(pout_pref)[0];
  igraph_bool_t directed=LOGICAL(pdirected)[0];
  igraph_real_t zero_deg_appeal=REAL(pzero_deg_appeal)[0];
  igraph_real_t zero_age_appeal=REAL(pzero_age_appeal)[0];
  igraph_real_t deg_coef=REAL(pdeg_coef)[0];
  igraph_real_t age_coef=REAL(page_coef)[0];
  SEXP result;

  R_SEXP_to_vector(pout_seq, &out_seq);

  IGRAPH_R_CHECK(igraph_barabasi_aging_game(&g, n, m, &out_seq, out_pref, pa_exp, aging_exp, aging_bin, zero_deg_appeal, zero_age_appeal, deg_coef, age_coef, directed));
  PROTECT(result=R_igraph_to_SEXP(&g));
  IGRAPH_I_DESTROY(&g);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_recent_degree_aging_game(SEXP pn, SEXP ppa_exp, SEXP paging_exp,
                                       SEXP paging_bin, SEXP pm, SEXP pout_seq,
                                       SEXP pout_pref, SEXP pzero_appeal,
                                       SEXP pdirected,
                                       SEXP ptime_window) {
  igraph_t g;
  igraph_integer_t n=(igraph_integer_t) REAL(pn)[0];
  igraph_real_t pa_exp=REAL(ppa_exp)[0];
  igraph_real_t aging_exp=REAL(paging_exp)[0];
  igraph_integer_t aging_bin=(igraph_integer_t) REAL(paging_bin)[0];
  igraph_integer_t m=(igraph_integer_t) REAL(pm)[0];
  igraph_vector_t out_seq;
  igraph_bool_t out_pref=LOGICAL(pout_pref)[0];
  igraph_bool_t directed=LOGICAL(pdirected)[0];
  igraph_integer_t time_window=(igraph_integer_t) REAL(ptime_window)[0];
  igraph_real_t zero_appeal=REAL(pzero_appeal)[0];
  SEXP result;

  R_SEXP_to_vector(pout_seq, &out_seq);

  IGRAPH_R_CHECK(igraph_recent_degree_aging_game(&g, n, m, &out_seq, out_pref, pa_exp, aging_exp, aging_bin, time_window, zero_appeal, directed));
  PROTECT(result=R_igraph_to_SEXP(&g));
  IGRAPH_I_DESTROY(&g);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_get_edge(SEXP graph, SEXP peid) {

  igraph_t g;
  igraph_integer_t eid=(igraph_integer_t) REAL(peid)[0];
  igraph_integer_t from, to;
  SEXP result;

  R_SEXP_to_igraph(graph, &g);
  IGRAPH_R_CHECK(igraph_edge(&g, eid, &from, &to));
  PROTECT(result=NEW_NUMERIC(2));
  REAL(result)[0]=from;
  REAL(result)[1]=to;

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_edges(SEXP graph, SEXP eids) {
  igraph_t g;
  igraph_es_t es;
  igraph_vector_t res;
  SEXP result;

  R_SEXP_to_igraph(graph, &g);
  R_SEXP_to_igraph_es(eids, &g, &es);
  igraph_vector_init(&res, 0);
  IGRAPH_R_CHECK(igraph_edges(&g, es, &res));

  PROTECT(result=NEW_NUMERIC(igraph_vector_size(&res)));
  igraph_vector_copy_to(&res, REAL(result));
  igraph_vector_destroy(&res);
  igraph_es_destroy(&es);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_constraint(SEXP graph, SEXP vids, SEXP pweights) {

  igraph_t g;
  igraph_vs_t vs;
  igraph_vector_t weights, *wptr=0;
  igraph_vector_t res;
  SEXP result;

  R_SEXP_to_igraph(graph, &g);
  R_SEXP_to_igraph_vs(vids, &g, &vs);
  if (GET_LENGTH(pweights) != 0) {
    R_SEXP_to_vector(pweights, &weights);
    wptr=&weights;
  }
  igraph_vector_init(&res, 0);
  IGRAPH_R_CHECK(igraph_constraint(&g, &res, vs, wptr));

  PROTECT(result=NEW_NUMERIC(igraph_vector_size(&res)));
  igraph_vector_copy_to(&res, REAL(result));
  igraph_vector_destroy(&res);
  igraph_vs_destroy(&vs);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_es_path(SEXP graph, SEXP pp, SEXP pdir) {

  igraph_t g;
  igraph_vector_t p;
  igraph_bool_t dir=LOGICAL(pdir)[0];
  igraph_es_t es;
  igraph_vector_t res;
  SEXP result;

  R_SEXP_to_igraph(graph, &g);
  R_SEXP_to_vector(pp, &p);
  igraph_es_path(&es, &p, dir);
  igraph_vector_init(&res, 0);
  igraph_es_as_vector(&g, es, &res);
  PROTECT(result=NEW_NUMERIC(igraph_vector_size(&res)));
  igraph_vector_copy_to(&res, REAL(result));
  igraph_vector_destroy(&res);
  igraph_es_destroy(&es);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_es_pairs(SEXP graph, SEXP pp, SEXP pdir) {

  igraph_t g;
  igraph_vector_t p;
  igraph_bool_t dir=LOGICAL(pdir)[0];
  igraph_es_t es;
  igraph_vector_t res;
  SEXP result;

  R_SEXP_to_igraph(graph, &g);
  R_SEXP_to_vector(pp, &p);
  igraph_es_pairs(&es, &p, dir);
  igraph_vector_init(&res, 0);
  igraph_es_as_vector(&g, es, &res);
  PROTECT(result=NEW_NUMERIC(igraph_vector_size(&res)));
  igraph_vector_copy_to(&res, REAL(result));
  igraph_vector_destroy(&res);
  igraph_es_destroy(&es);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_reciprocity(SEXP graph, SEXP pignore_loops, SEXP pmode) {

  igraph_t g;
  igraph_bool_t ignore_loops=LOGICAL(pignore_loops)[0];
  igraph_real_t res;
  igraph_reciprocity_t mode=REAL(pmode)[0];
  SEXP result;

  R_SEXP_to_igraph(graph, &g);
  IGRAPH_R_CHECK(igraph_reciprocity(&g, &res, ignore_loops, mode));
  PROTECT(result=NEW_NUMERIC(1));
  REAL(result)[0]=res;

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_layout_reingold_tilford(SEXP graph, SEXP proot,
                                      SEXP pmode, SEXP prootlevel, SEXP pcirc) {

  igraph_t g;
  igraph_vector_t root;
  igraph_matrix_t res;
  igraph_bool_t circ=LOGICAL(pcirc)[0];
  int mode=(int) REAL(pmode)[0];
  igraph_vector_t rootlevel;
  SEXP result;

  R_SEXP_to_igraph(graph, &g);
  R_SEXP_to_vector(proot, &root);
  R_SEXP_to_vector(prootlevel, &rootlevel);
  igraph_matrix_init(&res, 0, 0);
  if (!circ) {
    IGRAPH_R_CHECK(igraph_layout_reingold_tilford(&g, &res, (igraph_neimode_t) mode, LENGTH(proot)==0 ? 0 : &root, &rootlevel));
  } else {
    IGRAPH_R_CHECK(igraph_layout_reingold_tilford_circular(&g, &res, (igraph_neimode_t) mode, LENGTH(proot)==0 ? 0 : &root, &rootlevel));
  }
  PROTECT(result=R_igraph_matrix_to_SEXP(&res));
  igraph_matrix_destroy(&res);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_rewire(SEXP graph, SEXP pn, SEXP pmode) {

  igraph_t g;
  igraph_integer_t n=(igraph_integer_t) REAL(pn)[0];
  igraph_rewiring_t mode=REAL(pmode)[0];
  SEXP result;

  R_SEXP_to_igraph_copy(graph, &g);
  IGRAPH_R_CHECK(igraph_rewire(&g, n, mode));
  PROTECT(result=R_igraph_to_SEXP(&g));
  IGRAPH_I_DESTROY(&g);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_read_graph_graphml(SEXP pvfile, SEXP pindex) {
  igraph_t g;
  int index=(int) REAL(pindex)[0];
  FILE *file;
  SEXP result;

#if HAVE_FMEMOPEN == 1
  file=fmemopen(RAW(pvfile), GET_LENGTH(pvfile), "r");
#else
  file=fopen(CHAR(STRING_ELT(pvfile, 0)), "r");
#endif
  if (file==0) { igraph_error("Cannot open GraphML file", __FILE__, __LINE__,
                              IGRAPH_EFILE); }
  IGRAPH_R_CHECK(igraph_read_graph_graphml(&g, file, index));
  fclose(file);
  PROTECT(result=R_igraph_to_SEXP(&g));
  IGRAPH_I_DESTROY(&g);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_write_graph_graphml(SEXP graph, SEXP file, SEXP pprefixattr) {

  igraph_t g;
  FILE *stream;
  igraph_bool_t prefixattr=LOGICAL(pprefixattr)[0];
#if HAVE_OPEN_MEMSTREAM == 1
  char *bp;
  size_t size;
#endif
  SEXP result;

  R_SEXP_to_igraph(graph, &g);
#if HAVE_OPEN_MEMSTREAM == 1
  stream=open_memstream(&bp, &size);
#else
  stream=fopen(CHAR(STRING_ELT(file, 0)), "w");
#endif
  if (stream==0) { igraph_error("Cannot write GraphML file", __FILE__,
                                __LINE__, IGRAPH_EFILE); }
  IGRAPH_R_CHECK(igraph_write_graph_graphml(&g, stream, prefixattr));
  fclose(stream);
#if HAVE_OPEN_MEMSTREAM == 1
  PROTECT(result=Rf_allocVector(RAWSXP, size));
  memcpy(RAW(result), bp, sizeof(char)*size);
  free(bp);
#else
  PROTECT(result=NEW_NUMERIC(0));
#endif

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_vs_nei(SEXP graph, SEXP px, SEXP pv, SEXP pmode) {

  igraph_t g;
  igraph_vs_t v;
  igraph_integer_t mode=(igraph_integer_t) REAL(pmode)[0];
  SEXP result;

  igraph_vit_t vv;
  igraph_vector_t neis;
  long int i;

  R_SEXP_to_igraph(graph, &g);
  R_SEXP_to_igraph_vs(pv, &g, &v);

  igraph_vector_init(&neis, 0);
  igraph_vit_create(&g, v, &vv);
  PROTECT(result=NEW_LOGICAL(igraph_vcount(&g)));
  memset(LOGICAL(result), 0, sizeof(LOGICAL(result)[0]) *
         (size_t) igraph_vcount(&g));

  while (!IGRAPH_VIT_END(vv)) {
    IGRAPH_R_CHECK(igraph_neighbors(&g, &neis, IGRAPH_VIT_GET(vv), (igraph_neimode_t) mode));
    for (i=0; i<igraph_vector_size(&neis); i++) {
      long int nei=(long int) VECTOR(neis)[i];
      LOGICAL(result)[nei]=1;
    }
    IGRAPH_VIT_NEXT(vv);
  }

  igraph_vit_destroy(&vv);
  igraph_vector_destroy(&neis);
  igraph_vs_destroy(&v);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_vs_adj(SEXP graph, SEXP px, SEXP pe, SEXP pmode) {

  igraph_t g;
  igraph_es_t e;
  int mode=(int) REAL(pmode)[0];
  SEXP result;

  igraph_integer_t from, to;
  igraph_eit_t ee;

  R_SEXP_to_igraph(graph, &g);
  R_SEXP_to_igraph_es(pe, &g, &e);

  igraph_eit_create(&g, e, &ee);
  PROTECT(result=NEW_LOGICAL(igraph_vcount(&g)));
  memset(LOGICAL(result), 0, sizeof(LOGICAL(result)[0]) *
         (size_t) igraph_vcount(&g));

  while (!IGRAPH_EIT_END(ee)) {
    IGRAPH_R_CHECK(igraph_edge(&g, IGRAPH_EIT_GET(ee), &from, &to));
    if (mode & 1) {
      LOGICAL(result)[ (long int)from]=1;
    }
    if (mode & 2) {
      LOGICAL(result)[ (long int)to]=1;
    }
    IGRAPH_EIT_NEXT(ee);
  }

  igraph_eit_destroy(&ee);
  igraph_es_destroy(&e);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_es_adj(SEXP graph, SEXP x, SEXP pv, SEXP pmode) {

  igraph_t g;
  igraph_vs_t v;
  igraph_integer_t mode=(igraph_integer_t) REAL(pmode)[0];
  SEXP result;

  igraph_vector_t adje;
  igraph_vit_t vv;
  long int i;

  R_SEXP_to_igraph(graph, &g);
  R_SEXP_to_igraph_vs(pv, &g, &v);

  igraph_vit_create(&g, v, &vv);
  igraph_vector_init(&adje, 0);
  PROTECT(result=NEW_LOGICAL(igraph_ecount(&g)));
  memset(LOGICAL(result), 0, sizeof(LOGICAL(result)[0]) *
         (size_t) igraph_ecount(&g));

  while (!IGRAPH_VIT_END(vv)) {
    IGRAPH_R_CHECK(igraph_incident(&g, &adje, IGRAPH_VIT_GET(vv), (igraph_neimode_t) mode));
    for (i=0; i<igraph_vector_size(&adje); i++) {
      long int edge=(long int) VECTOR(adje)[i];
      LOGICAL(result)[edge]=1;
    }
    IGRAPH_VIT_NEXT(vv);
  }

  igraph_vector_destroy(&adje);
  igraph_vit_destroy(&vv);
  igraph_vs_destroy(&v);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_grg_game(SEXP pn, SEXP pradius, SEXP ptorus,
                       SEXP pcoords) {

  igraph_t g;
  igraph_integer_t n=(igraph_integer_t) REAL(pn)[0];
  igraph_real_t radius=REAL(pradius)[0];
  igraph_bool_t torus=LOGICAL(ptorus)[0];
  igraph_bool_t coords=LOGICAL(pcoords)[0];
  igraph_vector_t x, y, *px=0, *py=0;
  SEXP result;

  if (coords) {
    igraph_vector_init(&x, 0);  px=&x;
    igraph_vector_init(&y, 0);  py=&y;
  }
  IGRAPH_R_CHECK(igraph_grg_game(&g, n, radius, torus, px, py));
  PROTECT(result=NEW_LIST(3));
  SET_VECTOR_ELT(result, 0, R_igraph_to_SEXP(&g));
  IGRAPH_I_DESTROY(&g);
  SET_VECTOR_ELT(result, 1, R_igraph_0orvector_to_SEXP(px));
  if (coords) { igraph_vector_destroy(px); }
  SET_VECTOR_ELT(result, 2, R_igraph_0orvector_to_SEXP(py));
  if (coords) { igraph_vector_destroy(py); }

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_density(SEXP graph, SEXP ploops) {

  igraph_t g;
  igraph_bool_t loops=LOGICAL(ploops)[0];
  igraph_real_t res;
  SEXP result;

  R_SEXP_to_igraph(graph, &g);
  IGRAPH_R_CHECK(igraph_density(&g, &res, loops));

  PROTECT(result=NEW_NUMERIC(1));
  REAL(result)[0]=res;

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_read_graph_dimacs(SEXP pvfile, SEXP pdirected) {

  igraph_t g;
  igraph_bool_t directed=LOGICAL(pdirected)[0];
  FILE *file;
  igraph_vector_t label;
  igraph_strvector_t problem;
  igraph_integer_t source, target;
  igraph_vector_t cap;
  SEXP result=R_NilValue;
  int px = 0;

#if HAVE_FMEMOPEN == 1
  file=fmemopen(RAW(pvfile), GET_LENGTH(pvfile), "r");
#else
  file=fopen(CHAR(STRING_ELT(pvfile, 0)), "r");
#endif
  if (file==0) { igraph_error("Cannot read edgelist", __FILE__, __LINE__,
                              IGRAPH_EFILE);
  }
  igraph_vector_init(&label, 0);
  igraph_strvector_init(&problem, 0);
  igraph_vector_init(&cap, 0);
  IGRAPH_R_CHECK(igraph_read_graph_dimacs(&g, file, &problem, &label, &source, &target, &cap, directed));
  fclose(file);
  if (!strcmp(STR(problem, 0), "max")) {
    PROTECT(result=NEW_LIST(5)); px++;
    SET_VECTOR_ELT(result, 0, R_igraph_strvector_to_SEXP(&problem));
    igraph_strvector_destroy(&problem);
    SET_VECTOR_ELT(result, 1, R_igraph_to_SEXP(&g));
    IGRAPH_I_DESTROY(&g);
    SET_VECTOR_ELT(result, 2, NEW_NUMERIC(1));
    REAL(VECTOR_ELT(result, 2))[0]=source;
    SET_VECTOR_ELT(result, 3, NEW_NUMERIC(1));
    REAL(VECTOR_ELT(result, 3))[0]=target;
    SET_VECTOR_ELT(result, 4, NEW_NUMERIC(igraph_vector_size(&cap)));
    igraph_vector_copy_to(&cap, REAL(VECTOR_ELT(result,4)));
    igraph_vector_destroy(&cap);
  } else if (!strcmp(STR(problem, 0), "edge")) {
    PROTECT(result=NEW_LIST(3)); px++;
    SET_VECTOR_ELT(result, 0, R_igraph_strvector_to_SEXP(&problem));
    igraph_strvector_destroy(&problem);
    SET_VECTOR_ELT(result, 1, R_igraph_to_SEXP(&g));
    IGRAPH_I_DESTROY(&g);
    SET_VECTOR_ELT(result, 2, R_igraph_vector_to_SEXP(&label));
    igraph_vector_destroy(&label);
  } else {
    /* This shouldn't happen */
    igraph_error("Invalid DIMACS file (problem) type", __FILE__, __LINE__,
                 IGRAPH_PARSEERROR);
  }

  UNPROTECT(px);
  return result;
}

SEXP R_igraph_write_graph_dimacs(SEXP graph, SEXP file,
                                 SEXP psource, SEXP ptarget,
                                 SEXP pcap) {

  igraph_t g;
  FILE *stream;
#if HAVE_OPEN_MEMSTREAM == 1
  char *bp;
  size_t size;
#endif
  igraph_integer_t source=(igraph_integer_t) REAL(psource)[0];
  igraph_integer_t target=(igraph_integer_t) REAL(ptarget)[0];
  igraph_vector_t cap;
  SEXP result;

  R_SEXP_to_igraph(graph, &g);
  R_SEXP_to_vector(pcap, &cap);
#if HAVE_OPEN_MEMSTREAM == 1
  stream=open_memstream(&bp, &size);
#else
  stream=fopen(CHAR(STRING_ELT(file, 0)), "w");
#endif
  if (stream==0) { igraph_error("Cannot write edgelist", __FILE__, __LINE__,
                                IGRAPH_EFILE);
  }
  IGRAPH_R_CHECK(igraph_write_graph_dimacs(&g, stream, source, target, &cap));
  fclose(stream);
#if HAVE_OPEN_MEMSTREAM == 1
  PROTECT(result=Rf_allocVector(RAWSXP, size));
  memcpy(RAW(result), bp, sizeof(char)*size);
  free(bp);
#else
  PROTECT(result=NEW_NUMERIC(0));
#endif

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_mincut(SEXP graph, SEXP pcapacity) {

  igraph_t g;
  igraph_vector_t capacity, *ppcapacity=0;
  igraph_real_t value;
  igraph_vector_t partition;
  igraph_vector_t partition2;
  igraph_vector_t cut;
  SEXP result, names;

  igraph_vector_init(&cut, 0);
  igraph_vector_init(&partition, 0);
  igraph_vector_init(&partition2, 0);

  R_SEXP_to_igraph(graph, &g);
  if (!Rf_isNull(pcapacity)) {
    R_SEXP_to_vector(pcapacity, &capacity);
    ppcapacity=&capacity;
  }

  IGRAPH_R_CHECK(igraph_mincut(&g, &value, &partition, &partition2, &cut, ppcapacity));

  PROTECT(result=NEW_LIST(4));
  PROTECT(names=NEW_CHARACTER(4));
  SET_VECTOR_ELT(result, 0, NEW_NUMERIC(1));
  REAL(VECTOR_ELT(result, 0))[0]=value;
  SET_VECTOR_ELT(result, 1, R_igraph_vector_to_SEXP(&cut));
  igraph_vector_destroy(&cut);
  SET_VECTOR_ELT(result, 2, R_igraph_vector_to_SEXP(&partition));
  igraph_vector_destroy(&partition);
  SET_VECTOR_ELT(result, 3, R_igraph_vector_to_SEXP(&partition2));
  igraph_vector_destroy(&partition2);
  SET_STRING_ELT(names, 0, Rf_mkChar("value"));
  SET_STRING_ELT(names, 1, Rf_mkChar("cut"));
  SET_STRING_ELT(names, 2, Rf_mkChar("partition1"));
  SET_STRING_ELT(names, 3, Rf_mkChar("partition2"));
  SET_NAMES(result, names);

  UNPROTECT(2);
  return result;
}

SEXP R_igraph_mincut_value(SEXP graph, SEXP pcapacity) {

  igraph_t g;
  igraph_vector_t capacity, *ppcapacity=0;
  igraph_real_t res;
  SEXP result;

  R_SEXP_to_igraph(graph, &g);
  if (!Rf_isNull(pcapacity)) {
    R_SEXP_to_vector(pcapacity, &capacity);
    ppcapacity=&capacity;
  }
  IGRAPH_R_CHECK(igraph_mincut_value(&g, &res, ppcapacity));

  PROTECT(result=NEW_NUMERIC(1));
  REAL(result)[0]=res;

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_st_vertex_connectivity(SEXP graph, SEXP psource,
                                     SEXP ptarget) {

  igraph_t g;
  igraph_integer_t source=(igraph_integer_t) REAL(psource)[0],
    target=(igraph_integer_t) REAL(ptarget)[0];
  igraph_integer_t res;
  SEXP result;

  R_SEXP_to_igraph(graph, &g);
  IGRAPH_R_CHECK(igraph_st_vertex_connectivity(&g, &res, source, target, IGRAPH_VCONN_NEI_ERROR));

  PROTECT(result=NEW_NUMERIC(1));
  REAL(result)[0]=res;

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_vertex_connectivity(SEXP graph, SEXP pchecks) {

  igraph_t g;
  igraph_integer_t res;
  igraph_bool_t checks=LOGICAL(pchecks)[0];
  SEXP result;

  R_SEXP_to_igraph(graph, &g);
  IGRAPH_R_CHECK(igraph_vertex_connectivity(&g, &res, checks));

  PROTECT(result=NEW_NUMERIC(1));
  REAL(result)[0]=res;

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_st_edge_connectivity(SEXP graph, SEXP psource, SEXP ptarget) {

  igraph_t g;
  igraph_integer_t source=(igraph_integer_t) REAL(psource)[0],
    target=(igraph_integer_t) REAL(ptarget)[0];
  igraph_integer_t value;
  SEXP result;

  R_SEXP_to_igraph(graph, &g);
  IGRAPH_R_CHECK(igraph_st_edge_connectivity(&g, &value, source, target));

  PROTECT(result=NEW_NUMERIC(1));
  REAL(result)[0]=value;

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_edge_connectivity(SEXP graph, SEXP pchecks) {

  igraph_t g;
  igraph_integer_t res;
  igraph_bool_t checks=LOGICAL(pchecks)[0];
  SEXP result;

  R_SEXP_to_igraph(graph, &g);
  IGRAPH_R_CHECK(igraph_edge_connectivity(&g, &res, checks));

  PROTECT(result=NEW_NUMERIC(1));
  REAL(result)[0]=res;

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_st_mincut_value(SEXP graph, SEXP psource, SEXP ptarget,
                              SEXP pcapacity) {
  igraph_t g;
  igraph_integer_t source=(igraph_integer_t) REAL(psource)[0];
  igraph_integer_t target=(igraph_integer_t) REAL(ptarget)[0];
  igraph_vector_t capacity, *ppcapacity=0;
  igraph_real_t res;
  SEXP result;

  R_SEXP_to_igraph(graph, &g);
  if (!Rf_isNull(pcapacity)) {
    R_SEXP_to_vector(pcapacity, &capacity);
    ppcapacity=&capacity;
  }
  IGRAPH_R_CHECK(igraph_st_mincut_value(&g, &res, source, target, ppcapacity));
  PROTECT(result=NEW_NUMERIC(1));
  REAL(result)[0]=res;

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_edge_disjoint_paths(SEXP graph, SEXP psource, SEXP ptarget) {

  igraph_t g;
  igraph_integer_t source=(igraph_integer_t) REAL(psource)[0];
  igraph_integer_t target=(igraph_integer_t) REAL(ptarget)[0];
  igraph_integer_t res;
  SEXP result;

  R_SEXP_to_igraph(graph, &g);
  IGRAPH_R_CHECK(igraph_edge_disjoint_paths(&g, &res, source, target));
  PROTECT(result=NEW_NUMERIC(1));
  REAL(result)[0]=res;

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_vertex_disjoint_paths(SEXP graph, SEXP psource, SEXP ptarget) {

  igraph_t g;
  igraph_integer_t source=(igraph_integer_t) REAL(psource)[0];
  igraph_integer_t target=(igraph_integer_t) REAL(ptarget)[0];
  igraph_integer_t res;
  SEXP result;

  R_SEXP_to_igraph(graph, &g);
  IGRAPH_R_CHECK(igraph_vertex_disjoint_paths(&g, &res, source, target));
  PROTECT(result=NEW_NUMERIC(1));
  REAL(result)[0]=res;

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_adhesion(SEXP graph, SEXP pchecks) {

  igraph_t g;
  igraph_integer_t res;
  igraph_bool_t checks=LOGICAL(pchecks)[0];
  SEXP result;

  R_SEXP_to_igraph(graph, &g);
  IGRAPH_R_CHECK(igraph_adhesion(&g, &res, checks));
  PROTECT(result=NEW_NUMERIC(1));
  REAL(result)[0]=res;

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_cohesion(SEXP graph, SEXP pchecks) {

  igraph_t g;
  igraph_integer_t res;
  igraph_bool_t checks=LOGICAL(pchecks)[0];
  SEXP result;

  R_SEXP_to_igraph(graph, &g);
  IGRAPH_R_CHECK(igraph_cohesion(&g, &res, checks));
  PROTECT(result=NEW_NUMERIC(1));
  REAL(result)[0]=res;

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_spinglass_community(SEXP graph, SEXP weights,
                                  SEXP pspins, SEXP pparupdate,
                                  SEXP pstarttemp, SEXP pstoptemp,
                                  SEXP pcoolfact, SEXP pupdate_rule,
                                  SEXP pgamma, SEXP pimplementation,
                                  SEXP plambda) {
  igraph_t g;
  igraph_vector_t v_weights, *pweights=0;
  igraph_integer_t spins=(igraph_integer_t) REAL(pspins)[0];
  igraph_bool_t parupdate=LOGICAL(pparupdate)[0];
  igraph_real_t starttemp=REAL(pstarttemp)[0];
  igraph_real_t stoptemp=REAL(pstoptemp)[0];
  igraph_real_t coolfact=REAL(pcoolfact)[0];
  igraph_spincomm_update_t update_rule=REAL(pupdate_rule)[0];
  igraph_real_t gamma=REAL(pgamma)[0];
  igraph_real_t implementation=REAL(pimplementation)[0];
  igraph_real_t lambda=REAL(plambda)[0];
  igraph_real_t modularity;
  igraph_real_t temperature;
  igraph_vector_t membership;
  igraph_vector_t csize;
  SEXP result, names;

  R_SEXP_to_igraph(graph, &g);
  if (!Rf_isNull(weights)) {
    pweights=&v_weights; R_SEXP_to_vector(weights, &v_weights);
  }
  igraph_vector_init(&membership, 0);
  igraph_vector_init(&csize, 0);
  IGRAPH_R_CHECK(igraph_community_spinglass(&g, pweights, &modularity, &temperature, &membership, &csize, spins, parupdate, starttemp, stoptemp, coolfact, update_rule, gamma, implementation, lambda));

  PROTECT(result=NEW_LIST(4));
  PROTECT(names=NEW_CHARACTER(4));
  SET_VECTOR_ELT(result, 0, NEW_NUMERIC(igraph_vector_size(&membership)));
  SET_VECTOR_ELT(result, 1, NEW_NUMERIC(igraph_vector_size(&csize)));
  SET_VECTOR_ELT(result, 2, NEW_NUMERIC(1));
  SET_VECTOR_ELT(result, 3, NEW_NUMERIC(1));
  SET_STRING_ELT(names, 0, Rf_mkChar("membership"));
  SET_STRING_ELT(names, 1, Rf_mkChar("csize"));
  SET_STRING_ELT(names, 2, Rf_mkChar("modularity"));
  SET_STRING_ELT(names, 3, Rf_mkChar("temperature"));
  SET_NAMES(result, names);
  igraph_vector_copy_to(&membership, REAL(VECTOR_ELT(result, 0)));
  igraph_vector_copy_to(&csize, REAL(VECTOR_ELT(result, 1)));
  REAL(VECTOR_ELT(result, 2))[0]=modularity;
  REAL(VECTOR_ELT(result, 3))[0]=temperature;

  igraph_vector_destroy(&membership);
  igraph_vector_destroy(&csize);

  UNPROTECT(2);
  return result;
}

SEXP R_igraph_spinglass_my_community(SEXP graph, SEXP weights,
                                     SEXP pvertex, SEXP pspins,
                                     SEXP pupdate_rule, SEXP pgamma) {
  igraph_t g;
  igraph_vector_t v_weights, *pweights=0;
  igraph_integer_t vertex=(igraph_integer_t) REAL(pvertex)[0];
  igraph_integer_t spins=(igraph_integer_t) REAL(pspins)[0];
  igraph_spincomm_update_t update_rule=REAL(pupdate_rule)[0];
  igraph_real_t gamma=REAL(pgamma)[0];
  igraph_vector_t community;
  igraph_real_t cohesion;
  igraph_real_t adhesion;
  igraph_integer_t inner_links;
  igraph_integer_t outer_links;

  SEXP result, names;

  R_SEXP_to_igraph(graph, &g);
  if (!Rf_isNull(weights)) {
    pweights=&v_weights; R_SEXP_to_vector(weights, &v_weights);
  }
  igraph_vector_init(&community, 0);
  IGRAPH_R_CHECK(igraph_community_spinglass_single(&g, pweights, vertex, &community, &cohesion, &adhesion, &inner_links, &outer_links, spins, update_rule, gamma));

  PROTECT(result=NEW_LIST(5));
  PROTECT(names=NEW_CHARACTER(5));
  SET_VECTOR_ELT(result, 0, NEW_NUMERIC(igraph_vector_size(&community)));
  SET_VECTOR_ELT(result, 1, NEW_NUMERIC(1));
  SET_VECTOR_ELT(result, 2, NEW_NUMERIC(1));
  SET_VECTOR_ELT(result, 3, NEW_NUMERIC(1));
  SET_VECTOR_ELT(result, 4, NEW_NUMERIC(1));
  SET_STRING_ELT(names, 0, Rf_mkChar("community"));
  SET_STRING_ELT(names, 1, Rf_mkChar("cohesion"));
  SET_STRING_ELT(names, 2, Rf_mkChar("adhesion"));
  SET_STRING_ELT(names, 3, Rf_mkChar("inner.links"));
  SET_STRING_ELT(names, 4, Rf_mkChar("outer.links"));
  SET_NAMES(result, names);
  igraph_vector_copy_to(&community, REAL(VECTOR_ELT(result, 0)));
  REAL(VECTOR_ELT(result, 1))[0] = cohesion;
  REAL(VECTOR_ELT(result, 2))[0] = adhesion;
  REAL(VECTOR_ELT(result, 3))[0] = inner_links;
  REAL(VECTOR_ELT(result, 4))[0] = outer_links;

  igraph_vector_destroy(&community);

  UNPROTECT(2);
  return result;
}

SEXP R_igraph_no_clusters(SEXP graph, SEXP pmode) {

  igraph_t g;
  igraph_integer_t mode=(igraph_integer_t) REAL(pmode)[0];
  igraph_integer_t res;
  SEXP result;

  R_SEXP_to_igraph(graph, &g);
  IGRAPH_R_CHECK(igraph_clusters(&g, 0, 0, &res, (igraph_connectedness_t) mode));
  PROTECT(result=NEW_NUMERIC(1));
  REAL(result)[0]=res;

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_neighborhood_size(SEXP graph, SEXP pvids, SEXP porder,
                                SEXP pmode, SEXP pmindist) {
  igraph_t g;
  igraph_vs_t vids;
  igraph_integer_t order=(igraph_integer_t) REAL(porder)[0];
  igraph_integer_t mode=(igraph_integer_t) REAL(pmode)[0];
  igraph_vector_t res;
  igraph_integer_t mindist=INTEGER(pmindist)[0];
  SEXP result;

  R_SEXP_to_igraph(graph, &g);
  R_SEXP_to_igraph_vs(pvids, &g, &vids);
  igraph_vector_init(&res, 0);
  IGRAPH_R_CHECK(igraph_neighborhood_size(&g, &res, vids, order, (igraph_neimode_t) mode, mindist));
  PROTECT(result=NEW_NUMERIC(igraph_vector_size(&res)));
  igraph_vector_copy_to(&res, REAL(result));
  igraph_vector_destroy(&res);
  igraph_vs_destroy(&vids);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_neighborhood(SEXP graph, SEXP pvids, SEXP porder,
                           SEXP pmode, SEXP pmindist) {
  igraph_t g;
  igraph_vs_t vids;
  igraph_integer_t order=(igraph_integer_t) REAL(porder)[0];
  igraph_integer_t mode=(igraph_integer_t) REAL(pmode)[0];
  igraph_vector_ptr_t res;
  long int i;
  igraph_integer_t mindist=INTEGER(pmindist)[0];
  SEXP result;

  R_SEXP_to_igraph(graph, &g);
  R_SEXP_to_igraph_vs(pvids, &g, &vids);
  igraph_vector_ptr_init(&res, 0);
  IGRAPH_R_CHECK(igraph_neighborhood(&g, &res, vids, order, (igraph_neimode_t) mode, mindist));
  PROTECT(result=NEW_LIST(igraph_vector_ptr_size(&res)));
  for (i=0; i<igraph_vector_ptr_size(&res); i++) {
    igraph_vector_t *v=VECTOR(res)[i];
    SET_VECTOR_ELT(result, i, NEW_NUMERIC(igraph_vector_size(v)));
    igraph_vector_copy_to(v, REAL(VECTOR_ELT(result, i)));
    igraph_vector_destroy(v);
    igraph_free(v);
  }
  igraph_vector_ptr_destroy(&res);
  igraph_vs_destroy(&vids);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_neighborhood_graphs(SEXP graph, SEXP pvids, SEXP porder,
                                  SEXP pmode, SEXP pmindist) {
  igraph_t g;
  igraph_vs_t vids;
  igraph_integer_t order=(igraph_integer_t) REAL(porder)[0];
  igraph_integer_t mode=(igraph_integer_t) REAL(pmode)[0];
  igraph_vector_ptr_t res;
  long int i;
  igraph_integer_t mindist=INTEGER(pmindist)[0];
  SEXP result;

  R_PreserveObject(R_igraph_attribute_protected=NEW_LIST(100));
  R_igraph_attribute_protected_size=0;
  IGRAPH_FINALLY(R_igraph_attribute_protected_destroy, 0);

  R_SEXP_to_igraph(graph, &g);
  R_SEXP_to_igraph_vs(pvids, &g, &vids);
  igraph_vector_ptr_init(&res, 0);
  IGRAPH_R_CHECK(igraph_neighborhood_graphs(&g, &res, vids, order, (igraph_neimode_t) mode, mindist));
  PROTECT(result=NEW_LIST(igraph_vector_ptr_size(&res)));
  for (i=0; i<igraph_vector_ptr_size(&res); i++) {
    igraph_t *g=VECTOR(res)[i];
    SET_VECTOR_ELT(result, i, R_igraph_to_SEXP(g));
    IGRAPH_I_DESTROY(g);
    igraph_free(g);
  }
  igraph_vector_ptr_destroy(&res);
  igraph_vs_destroy(&vids);

  UNPROTECT(1);
  IGRAPH_FINALLY_CLEAN(1);
  R_igraph_attribute_protected_destroy(0);

  return result;
}

SEXP R_igraph_connect_neighborhood(SEXP graph, SEXP porder, SEXP pmode) {

  igraph_t g;
  igraph_integer_t order=(igraph_integer_t) REAL(porder)[0];
  igraph_integer_t mode=(igraph_integer_t) REAL(pmode)[0];
  SEXP result;

  R_SEXP_to_igraph_copy(graph, &g);
  IGRAPH_R_CHECK(igraph_connect_neighborhood(&g, order, (igraph_neimode_t) mode));
  PROTECT(result=R_igraph_to_SEXP(&g));
  IGRAPH_I_DESTROY(&g);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_watts_strogatz_game(SEXP pdim, SEXP psize, SEXP pnei, SEXP pp,
                                  SEXP ploops, SEXP pmultiple) {

  igraph_t g;
  igraph_integer_t dim=(igraph_integer_t) REAL(pdim)[0];
  igraph_integer_t size=(igraph_integer_t) REAL(psize)[0];
  igraph_integer_t nei=(igraph_integer_t) REAL(pnei)[0];
  igraph_real_t p=REAL(pp)[0];
  igraph_bool_t loops=LOGICAL(ploops)[0];
  igraph_bool_t multiple=LOGICAL(pmultiple)[0];
  SEXP result;

  IGRAPH_R_CHECK(igraph_watts_strogatz_game(&g, dim, size, nei, p, loops, multiple));
  PROTECT(result=R_igraph_to_SEXP(&g));
  IGRAPH_I_DESTROY(&g);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_coreness(SEXP graph, SEXP pmode) {

  igraph_t g;
  igraph_integer_t mode=(igraph_integer_t) REAL(pmode)[0];
  igraph_vector_t res;
  SEXP result;

  R_SEXP_to_igraph(graph, &g);
  igraph_vector_init(&res, 0);
  IGRAPH_R_CHECK(igraph_coreness(&g, &res, (igraph_neimode_t) mode));

  PROTECT(result=NEW_NUMERIC(igraph_vector_size(&res)));
  igraph_vector_copy_to(&res, REAL(result));
  igraph_vector_destroy(&res);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_maximal_cliques(SEXP graph, SEXP psubset,
                              SEXP pminsize, SEXP pmaxsize) {

  igraph_t g;
  igraph_vector_ptr_t ptrvec;
  long int i;
  igraph_integer_t minsize=(igraph_integer_t) REAL(pminsize)[0];
  igraph_integer_t maxsize=(igraph_integer_t) REAL(pmaxsize)[0];
  igraph_vector_int_t subset;
  SEXP result;

  R_SEXP_to_igraph(graph, &g);
  if (!Rf_isNull(psubset)) {
     R_SEXP_to_vector_int_copy(psubset, &subset);
  } else {
    IGRAPH_R_CHECK(igraph_vector_int_init(&subset, 0));
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &subset);
  igraph_vector_ptr_init(&ptrvec,0);
  igraph_maximal_cliques_subset(&g, Rf_isNull(psubset) ? 0 : &subset,
                                &ptrvec, /*no=*/ 0, /*file=*/ 0,
                                minsize, maxsize);
  PROTECT(result=NEW_LIST(igraph_vector_ptr_size(&ptrvec)));
  for (i=0; i<igraph_vector_ptr_size(&ptrvec); i++) {
    igraph_vector_t *vec=VECTOR(ptrvec)[i];
    SET_VECTOR_ELT(result, i, NEW_NUMERIC(igraph_vector_size(vec)));
    igraph_vector_copy_to(vec, REAL(VECTOR_ELT(result, i)));
    igraph_vector_destroy(vec);
    igraph_free(vec);
  }
  igraph_vector_int_destroy(&subset);
  IGRAPH_FINALLY_CLEAN(1);
  igraph_vector_ptr_destroy(&ptrvec);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_maximal_cliques_file(SEXP graph, SEXP psubset, SEXP file,
                                   SEXP pminsize, SEXP pmaxsize) {
  igraph_t g;
  igraph_integer_t minsize=(igraph_integer_t) REAL(pminsize)[0];
  igraph_integer_t maxsize=(igraph_integer_t) REAL(pmaxsize)[0];
  igraph_vector_int_t subset;
  SEXP result;
  FILE *stream;
#if HAVE_OPEN_MEMSTREAM == 1
  char *bp;
  size_t size;
#endif

  R_SEXP_to_igraph(graph, &g);
  if (!Rf_isNull(psubset)) {
     R_SEXP_to_vector_int_copy(psubset, &subset);
  } else {
    IGRAPH_R_CHECK(igraph_vector_int_init(&subset, 0));
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &subset);
#if HAVE_OPEN_MEMSTREAM == 1
  stream=open_memstream(&bp, &size);
#else
  stream=fopen(CHAR(STRING_ELT(file, 0)), "w");
#endif
  if (stream==0) { igraph_error("Cannot write cliques", __FILE__,
                                __LINE__, IGRAPH_EFILE); }
  igraph_maximal_cliques_subset(&g, Rf_isNull(psubset) ? 0 : &subset,
                                /*ptr=*/ 0, /*no=*/ 0, /*file=*/ stream,
                                minsize, maxsize);
  fclose(stream);
  igraph_vector_int_destroy(&subset);
  IGRAPH_FINALLY_CLEAN(1);
#if HAVE_OPEN_MEMSTREAM == 1
  PROTECT(result=Rf_allocVector(RAWSXP, size));
  memcpy(RAW(result), bp, sizeof(char)*size);
  free(bp);
#else
  PROTECT(result=NEW_NUMERIC(0));
#endif

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_maximal_cliques_count(SEXP graph, SEXP psubset,
                                    SEXP min_size, SEXP max_size) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_integer_t c_no;
  igraph_integer_t c_min_size;
  igraph_integer_t c_max_size;
  igraph_vector_int_t subset;
  SEXP no;

  SEXP result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (!Rf_isNull(psubset)) {
     R_SEXP_to_vector_int_copy(psubset, &subset);
  } else {
    IGRAPH_R_CHECK(igraph_vector_int_init(&subset, 0));
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &subset);
  c_min_size=INTEGER(min_size)[0];
  c_max_size=INTEGER(max_size)[0];
                                        /* Call igraph */
  igraph_maximal_cliques_subset(&c_graph, Rf_isNull(psubset) ? 0 : &subset,
                                /*ptr=*/ 0, &c_no, /*file=*/ 0,
                                c_min_size, c_max_size);

  igraph_vector_int_destroy(&subset);
  IGRAPH_FINALLY_CLEAN(1);
                                        /* Convert output */
  PROTECT(no=NEW_INTEGER(1));
  INTEGER(no)[0]=c_no;
  result=no;

  UNPROTECT(1);
  return(result);
}

SEXP R_igraph_independent_vertex_sets(SEXP graph,
                                      SEXP pminsize, SEXP pmaxsize) {
  igraph_t g;
  igraph_vector_ptr_t ptrvec;
  igraph_integer_t minsize=(igraph_integer_t) REAL(pminsize)[0];
  igraph_integer_t maxsize=(igraph_integer_t) REAL(pmaxsize)[0];
  long int i;
  SEXP result;

  R_SEXP_to_igraph(graph, &g);
  igraph_vector_ptr_init(&ptrvec, 0);
  IGRAPH_R_CHECK(igraph_independent_vertex_sets(&g, &ptrvec, minsize, maxsize));
  PROTECT(result=NEW_LIST(igraph_vector_ptr_size(&ptrvec)));
  for (i=0; i<igraph_vector_ptr_size(&ptrvec); i++) {
    igraph_vector_t *vec=VECTOR(ptrvec)[i];
    SET_VECTOR_ELT(result, i, NEW_NUMERIC(igraph_vector_size(vec)));
    igraph_vector_copy_to(vec, REAL(VECTOR_ELT(result, i)));
    igraph_vector_destroy(vec);
    igraph_free(vec);
  }
  igraph_vector_ptr_destroy(&ptrvec);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_largest_independent_vertex_sets(SEXP graph) {
  igraph_t g;
  igraph_vector_ptr_t ptrvec;
  long int i;
  SEXP result;

  R_SEXP_to_igraph(graph, &g);
  igraph_vector_ptr_init(&ptrvec,0);
  IGRAPH_R_CHECK(igraph_largest_independent_vertex_sets(&g, &ptrvec));
  PROTECT(result=NEW_LIST(igraph_vector_ptr_size(&ptrvec)));
  for (i=0; i<igraph_vector_ptr_size(&ptrvec); i++) {
    igraph_vector_t *vec=VECTOR(ptrvec)[i];
    SET_VECTOR_ELT(result, i, NEW_NUMERIC(igraph_vector_size(vec)));
    igraph_vector_copy_to(vec, REAL(VECTOR_ELT(result, i)));
    igraph_vector_destroy(vec);
    igraph_free(vec);
  }
  igraph_vector_ptr_destroy(&ptrvec);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_maximal_independent_vertex_sets(SEXP graph) {
  igraph_t g;
  igraph_vector_ptr_t ptrvec;
  long int i;
  SEXP result;

  R_SEXP_to_igraph(graph, &g);
  igraph_vector_ptr_init(&ptrvec,0);
  IGRAPH_R_CHECK(igraph_maximal_independent_vertex_sets(&g, &ptrvec));
  PROTECT(result=NEW_LIST(igraph_vector_ptr_size(&ptrvec)));
  for (i=0; i<igraph_vector_ptr_size(&ptrvec); i++) {
    igraph_vector_t *vec=VECTOR(ptrvec)[i];
    SET_VECTOR_ELT(result, i, NEW_NUMERIC(igraph_vector_size(vec)));
    igraph_vector_copy_to(vec, REAL(VECTOR_ELT(result, i)));
    igraph_vector_destroy(vec);
    igraph_free(vec);
  }
  igraph_vector_ptr_destroy(&ptrvec);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_independence_number(SEXP graph) {
  igraph_t g;
  igraph_integer_t res;
  SEXP result;

  R_SEXP_to_igraph(graph, &g);
  IGRAPH_R_CHECK(igraph_independence_number(&g, &res));
  PROTECT(result=NEW_NUMERIC(1));
  REAL(result)[0]=res;

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_lastcit_game(SEXP pnodes, SEXP pedges, SEXP pagebins,
                           SEXP ppreference, SEXP pdirected) {

  igraph_t g;
  igraph_integer_t nodes=(igraph_integer_t) REAL(pnodes)[0];
  igraph_integer_t edges=(igraph_integer_t) REAL(pedges)[0];
  igraph_integer_t agebins=(igraph_integer_t) REAL(pagebins)[0];
  igraph_vector_t preference;
  igraph_bool_t directed=LOGICAL(pdirected)[0];
  SEXP result;

  R_SEXP_to_vector(ppreference, &preference);
  IGRAPH_R_CHECK(igraph_lastcit_game(&g, nodes, edges, agebins, &preference, directed));
  PROTECT(result=R_igraph_to_SEXP(&g));
  IGRAPH_I_DESTROY(&g);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_cited_type_game(SEXP pnodes, SEXP pedges, SEXP ptypes,
                              SEXP ppref, SEXP pdirected) {
  igraph_t g;
  igraph_integer_t nodes=(igraph_integer_t) REAL(pnodes)[0];
  igraph_integer_t edges=(igraph_integer_t) REAL(pedges)[0];
  igraph_vector_t types, pref;
  igraph_bool_t directed=LOGICAL(pdirected)[0];
  SEXP result;

  R_SEXP_to_vector(ptypes, &types);
  R_SEXP_to_vector(ppref, &pref);
  IGRAPH_R_CHECK(igraph_cited_type_game(&g, nodes, &types, &pref, edges, directed));
  PROTECT(result=R_igraph_to_SEXP(&g));
  IGRAPH_I_DESTROY(&g);

  UNPROTECT(1);
  return result;
}


SEXP R_igraph_citing_cited_type_game(SEXP pnodes, SEXP ptypes, SEXP ppref,
                                     SEXP pedges, SEXP pdirected) {
  igraph_t g;
  igraph_integer_t nodes=(igraph_integer_t) REAL(pnodes)[0];
  igraph_integer_t edges=(igraph_integer_t) REAL(pedges)[0];
  igraph_vector_t types;
  igraph_matrix_t pref;
  igraph_bool_t directed=LOGICAL(pdirected)[0];
  SEXP result;

  R_SEXP_to_vector(ptypes, &types);
  R_SEXP_to_matrix(ppref, &pref);
  IGRAPH_R_CHECK(igraph_citing_cited_type_game(&g, nodes, &types, &pref, edges, directed));
  PROTECT(result=R_igraph_to_SEXP(&g));
  IGRAPH_I_DESTROY(&g);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_walktrap_community(SEXP graph, SEXP pweights,
                                 SEXP psteps, SEXP pmerges,
                                 SEXP pmodularity, SEXP pmembership) {
  igraph_t g;
  igraph_vector_t weights, *ppweights=0;
  igraph_integer_t steps=(igraph_integer_t) REAL(psteps)[0];
  igraph_matrix_t merges;
  igraph_vector_t modularity;
  igraph_vector_t membership;
  SEXP result, names;

  R_SEXP_to_igraph(graph, &g);
  if (!Rf_isNull(pweights)) {
    ppweights=&weights;
    R_SEXP_to_vector(pweights, ppweights);
  }

  igraph_matrix_init(&merges, 0, 0);
  igraph_vector_init(&modularity, 0);
  igraph_vector_init(&membership, 0);

  IGRAPH_R_CHECK(igraph_community_walktrap(&g, ppweights, steps, &merges, &modularity, &membership));

  PROTECT(result=NEW_LIST(3));
  if (LOGICAL(pmerges)[0]) {
    SET_VECTOR_ELT(result, 0, R_igraph_0ormatrix_to_SEXP(&merges));
  } else {
    SET_VECTOR_ELT(result, 0, R_NilValue);
  }
  igraph_matrix_destroy(&merges);
  if (LOGICAL(pmodularity)[0]) {
    SET_VECTOR_ELT(result, 1, R_igraph_0orvector_to_SEXP(&modularity));
  } else {
    SET_VECTOR_ELT(result, 1, R_NilValue);
  }
  igraph_vector_destroy(&modularity);
  if (LOGICAL(pmembership)[0]) {
    SET_VECTOR_ELT(result, 2, R_igraph_0orvector_to_SEXP(&membership));
  } else {
    SET_VECTOR_ELT(result, 2, R_NilValue);
  }
  igraph_vector_destroy(&membership);
  PROTECT(names=NEW_CHARACTER(3));
  SET_STRING_ELT(names, 0, Rf_mkChar("merges"));
  SET_STRING_ELT(names, 1, Rf_mkChar("modularity"));
  SET_STRING_ELT(names, 2, Rf_mkChar("membership"));
  SET_NAMES(result, names);

  UNPROTECT(2);
  return result;
}

SEXP R_igraph_topological_sorting(SEXP graph, SEXP pneimode) {
  igraph_t g;
  igraph_vector_t res;
  igraph_integer_t mode=(igraph_integer_t) REAL(pneimode)[0];
  SEXP result;

  R_SEXP_to_igraph(graph, &g);
  igraph_vector_init(&res, 0);
  IGRAPH_R_CHECK(igraph_topological_sorting(&g, &res, (igraph_neimode_t) mode));

  PROTECT(result=R_igraph_vector_to_SEXP(&res));
  igraph_vector_destroy(&res);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_community_edge_betweenness(SEXP graph, SEXP pweights,
                                         SEXP pdirected,
                                         SEXP peb, SEXP pmerges, SEXP pbridges,
                                         SEXP pmodularity, SEXP pmembership) {
  igraph_t g;
  igraph_vector_t weights, *ppweights=0;
  igraph_vector_t res;
  igraph_vector_t eb, *ppeb=0;
  igraph_matrix_t merges, *ppmerges=0;
  igraph_vector_t bridges, *ppbridges=0;
  igraph_vector_t modularity, *ppmodularity=0;
  igraph_vector_t membership, *ppmembership=0;
  igraph_bool_t directed=LOGICAL(pdirected)[0];
  SEXP result, names;

  R_SEXP_to_igraph(graph, &g);
  if (!Rf_isNull(pweights)) {
    ppweights=&weights;
    R_SEXP_to_vector(pweights, ppweights);
  }
  igraph_vector_init(&res, 0);
  if (LOGICAL(peb)[0]) {
    ppeb=&eb;
    igraph_vector_init(&eb, 0);
  }
  if (LOGICAL(pmerges)[0]) {
    ppmerges=&merges;
    igraph_matrix_init(&merges, 0, 0);
  }
  if (LOGICAL(pbridges)[0]) {
    ppbridges=&bridges;
    igraph_vector_init(&bridges, 0);
  }
  if (LOGICAL(pmodularity)[0]) {
    ppmodularity=&modularity;
    igraph_vector_init(&modularity, 0);
  }
  if (LOGICAL(pmembership)[0]) {
    ppmembership=&membership;
    igraph_vector_init(&membership, 0);
  }
  IGRAPH_R_CHECK(igraph_community_edge_betweenness(&g, &res, ppeb, ppmerges, ppbridges, ppmodularity, ppmembership, directed, ppweights));

  PROTECT(result=NEW_LIST(6));
  SET_VECTOR_ELT(result, 0, R_igraph_vector_to_SEXP(&res));
  igraph_vector_destroy(&res);
  SET_VECTOR_ELT(result, 1, R_igraph_0orvector_to_SEXP(ppeb));
  if (ppeb) { igraph_vector_destroy(ppeb); }
  SET_VECTOR_ELT(result, 2, R_igraph_0ormatrix_to_SEXP(ppmerges));
  if (ppmerges) { igraph_matrix_destroy(ppmerges); }
  SET_VECTOR_ELT(result, 3, R_igraph_0orvector_to_SEXP(ppbridges));
  if (ppbridges) { igraph_vector_destroy(ppbridges); }
  SET_VECTOR_ELT(result, 4, R_igraph_0orvector_to_SEXP(ppmodularity));
  if (ppmodularity) { igraph_vector_destroy(ppmodularity); }
  SET_VECTOR_ELT(result, 5, R_igraph_0orvector_to_SEXP(ppmembership));
  if (ppmembership) { igraph_vector_destroy(ppmembership); }
  PROTECT(names=NEW_CHARACTER(6));
  SET_STRING_ELT(names, 0, Rf_mkChar("removed.edges"));
  SET_STRING_ELT(names, 1, Rf_mkChar("edge.betweenness"));
  SET_STRING_ELT(names, 2, Rf_mkChar("merges"));
  SET_STRING_ELT(names, 3, Rf_mkChar("bridges"));
  SET_STRING_ELT(names, 4, Rf_mkChar("modularity"));
  SET_STRING_ELT(names, 5, Rf_mkChar("membership"));
  SET_NAMES(result, names);

  UNPROTECT(2);
  return result;
}

SEXP R_igraph_community_fastgreedy(SEXP graph, SEXP pmerges, SEXP pmodularity,
                                   SEXP pmembership, SEXP pweights) {

  igraph_t g;
  igraph_matrix_t merges, *ppmerges=0;
  igraph_vector_t modularity, *ppmodularity=0;
  igraph_vector_t membership, *ppmembership=0;
  igraph_vector_t weights, *ppweights=0;
  SEXP result, names;

  if (!Rf_isNull(pweights)) {
    ppweights=&weights;
    R_SEXP_to_vector(pweights, ppweights);
  }
  R_SEXP_to_igraph(graph, &g);
  if (LOGICAL(pmerges)[0]) {
    ppmerges=&merges;
    igraph_matrix_init(&merges, 0, 0);
  }
  if (LOGICAL(pmodularity)[0]) {
    ppmodularity=&modularity;
    igraph_vector_init(&modularity, 0);
  }
  if (LOGICAL(pmembership)[0]) {
    ppmembership=&membership;
    igraph_vector_init(&membership, 0);
  }
  IGRAPH_R_CHECK(igraph_community_fastgreedy(&g, ppweights, ppmerges, ppmodularity, ppmembership));
  PROTECT(result=NEW_LIST(3));
  SET_VECTOR_ELT(result, 0, R_igraph_0ormatrix_to_SEXP(ppmerges));
  if (ppmerges) { igraph_matrix_destroy(ppmerges); }
  SET_VECTOR_ELT(result, 1, R_igraph_0orvector_to_SEXP(ppmodularity));
  if (ppmodularity) { igraph_vector_destroy(ppmodularity); }
  SET_VECTOR_ELT(result, 2, R_igraph_0orvector_to_SEXP(ppmembership));
  if (ppmembership) { igraph_vector_destroy(ppmembership); }
  PROTECT(names=NEW_CHARACTER(3));
  SET_STRING_ELT(names, 0, Rf_mkChar("merges"));
  SET_STRING_ELT(names, 1, Rf_mkChar("modularity"));
  SET_STRING_ELT(names, 2, Rf_mkChar("membership"));
  SET_NAMES(result, names);

  UNPROTECT(2);
  return result;
}

SEXP R_igraph_community_to_membership(SEXP graph, SEXP pmerges,
                                      SEXP psteps, SEXP pmembership,
                                      SEXP pcsize) {
  igraph_t g;
  igraph_integer_t nodes;
  igraph_matrix_t merges;
  igraph_integer_t steps=(igraph_integer_t) REAL(psteps)[0];
  igraph_vector_t membership, *ppmembership=0;
  igraph_vector_t csize, *ppcsize=0;
  SEXP result, names;

  R_SEXP_to_igraph(graph, &g);
  nodes=igraph_vcount(&g);
  R_SEXP_to_matrix(pmerges, &merges);
  if (LOGICAL(pmembership)[0]) {
    ppmembership=&membership;
    igraph_vector_init(ppmembership, 0);
  }
  if (LOGICAL(pcsize)[0]) {
    ppcsize=&csize;
    igraph_vector_init(ppcsize, 0);
  }
  IGRAPH_R_CHECK(igraph_community_to_membership(&merges, nodes, steps, ppmembership, ppcsize));
  PROTECT(result=NEW_LIST(2));
  SET_VECTOR_ELT(result, 0, R_igraph_0orvector_to_SEXP(ppmembership));
  if (ppmembership) { igraph_vector_destroy(ppmembership); }
  SET_VECTOR_ELT(result, 1, R_igraph_0orvector_to_SEXP(ppcsize));
  if (ppcsize) { igraph_vector_destroy(ppcsize); }
  PROTECT(names=NEW_CHARACTER(2));
  SET_STRING_ELT(names, 0, Rf_mkChar("membership"));
  SET_STRING_ELT(names, 1, Rf_mkChar("csize"));
  SET_NAMES(result, names);

  UNPROTECT(2);
  return result;
}

SEXP R_igraph_community_to_membership2(SEXP pmerges, SEXP pvcount,
                                       SEXP psteps) {

  igraph_matrix_t merges;
  igraph_integer_t vcount=(igraph_integer_t) REAL(pvcount)[0];
  igraph_integer_t steps=(igraph_integer_t) REAL(psteps)[0];
  igraph_vector_t membership;
  SEXP result;

  R_SEXP_to_matrix(pmerges, &merges);
  igraph_vector_init(&membership, 0);
  IGRAPH_FINALLY(igraph_vector_destroy, &membership);

  IGRAPH_R_CHECK(igraph_community_to_membership(&merges, vcount, steps, &membership, 0));
  PROTECT(result=R_igraph_vector_to_SEXP(&membership));

  igraph_vector_destroy(&membership);
  IGRAPH_FINALLY_CLEAN(1);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_girth(SEXP graph, SEXP pcircle) {

  igraph_t g;
  igraph_vector_t circle, *ppcircle=0;
  igraph_integer_t girth;
  SEXP result, names;

  R_SEXP_to_igraph(graph, &g);
  if (LOGICAL(pcircle)[0]) { igraph_vector_init(&circle, 0); ppcircle=&circle; }

  IGRAPH_R_CHECK(igraph_girth(&g, &girth, ppcircle));

  PROTECT(result=NEW_LIST(2));
  SET_VECTOR_ELT(result, 0, NEW_NUMERIC(1));
  REAL(VECTOR_ELT(result, 0))[0]=girth;
  SET_VECTOR_ELT(result, 1, R_igraph_0orvector_to_SEXPp1(ppcircle));
  if (ppcircle) { igraph_vector_destroy(ppcircle); }
  PROTECT(names=NEW_CHARACTER(2));
  SET_STRING_ELT(names, 0, Rf_mkChar("girth"));
  SET_STRING_ELT(names, 1, Rf_mkChar("circle"));
  SET_NAMES(result, names);

  UNPROTECT(2);
  return result;
}

SEXP R_igraph_linegraph(SEXP graph) {

  igraph_t g, lg;
  SEXP result;

  R_SEXP_to_igraph(graph, &g);
  IGRAPH_R_CHECK(igraph_linegraph(&g, &lg));
  PROTECT(result=R_igraph_to_SEXP(&lg));
  IGRAPH_I_DESTROY(&lg);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_de_bruijn(SEXP pm, SEXP pn) {

  igraph_t g;
  igraph_integer_t m=(igraph_integer_t) REAL(pm)[0];
  igraph_integer_t n=(igraph_integer_t) REAL(pn)[0];
  SEXP result;

  IGRAPH_R_CHECK(igraph_de_bruijn(&g, m, n));
  PROTECT(result=R_igraph_to_SEXP(&g));
  IGRAPH_I_DESTROY(&g);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_kautz(SEXP pm, SEXP pn) {

  igraph_t g;
  igraph_integer_t m=(igraph_integer_t) REAL(pm)[0];
  igraph_integer_t n=(igraph_integer_t) REAL(pn)[0];
  SEXP result;

  IGRAPH_R_CHECK(igraph_kautz(&g, m, n));
  PROTECT(result=R_igraph_to_SEXP(&g));
  IGRAPH_I_DESTROY(&g);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_famous(SEXP name) {

  igraph_t g;
  SEXP result;

  IGRAPH_R_CHECK(igraph_famous(&g, CHAR(STRING_ELT(name, 0))));
  PROTECT(result=R_igraph_to_SEXP(&g));
  IGRAPH_I_DESTROY(&g);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_get_adjlist(SEXP graph, SEXP pmode, SEXP ploops, SEXP pmultiple) {

  igraph_t g;
  igraph_integer_t mode=(igraph_integer_t) REAL(pmode)[0];
  SEXP result;
  int i;
  long int no_of_nodes;
  igraph_vector_t neis;
  igraph_integer_t loops=(igraph_integer_t) REAL(ploops)[0];
  igraph_integer_t multiple=(igraph_integer_t) REAL(pmultiple)[0];

  R_SEXP_to_igraph(graph, &g);
  no_of_nodes=igraph_vcount(&g);
  igraph_vector_init(&neis, 0);
  PROTECT(result=NEW_LIST(no_of_nodes));
  for (i=0; i<no_of_nodes; i++) {
    igraph_i_neighbors(&g, &neis, i, (igraph_neimode_t) mode, (igraph_loops_t) loops, (igraph_multiple_t) multiple);
    SET_VECTOR_ELT(result, i, R_igraph_vector_to_SEXP(&neis));
  }
  igraph_vector_destroy(&neis);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_get_adjedgelist(SEXP graph, SEXP pmode, SEXP ploops) {

  igraph_t g;
  igraph_integer_t mode=(igraph_integer_t) REAL(pmode)[0];
  SEXP result;
  long int i;
  long int no_of_nodes;
  igraph_vector_t neis;
  igraph_integer_t loops=(igraph_integer_t) REAL(ploops)[0];

  R_SEXP_to_igraph(graph, &g);
  no_of_nodes=igraph_vcount(&g);
  igraph_vector_init(&neis, 0);
  PROTECT(result=NEW_LIST(no_of_nodes));
  for (i=0; i<no_of_nodes; i++) {
    igraph_i_incident(&g, &neis, (igraph_integer_t) i, (igraph_neimode_t) mode, (igraph_loops_t) loops);
    SET_VECTOR_ELT(result, i, R_igraph_vector_to_SEXP(&neis));
  }
  igraph_vector_destroy(&neis);

  UNPROTECT(1);
  return result;
}

typedef struct R_igraph_i_arpack_data_t {
  SEXP fun;
  SEXP extra;
  SEXP rho;
} R_igraph_i_arpack_data_t;

int R_igraph_i_arpack_callback(igraph_real_t *to, const igraph_real_t *from,
                               int n, void *extra) {
  SEXP s_from, s_to;
  SEXP R_fcall;
  R_igraph_i_arpack_data_t *data=extra;

  PROTECT(s_from=NEW_NUMERIC(n));
  memcpy(REAL(s_from), from, sizeof(igraph_real_t) * (size_t) n);

  PROTECT(R_fcall = Rf_lang3(data->fun, s_from, data->extra));
  PROTECT(s_to = Rf_eval(R_fcall, data->rho));
  memcpy(to, REAL(s_to), sizeof(igraph_real_t) * (size_t) n);

  UNPROTECT(3);
  return 0;
}

SEXP R_igraph_arpack(SEXP function, SEXP extra, SEXP options, SEXP rho,
                     SEXP sym) {

  igraph_vector_t values;
  igraph_matrix_t vectors, values2;
  R_igraph_i_arpack_data_t data;
  igraph_arpack_options_t c_options;
  SEXP result, names;

  if (0 != igraph_matrix_init(&vectors, 0, 0)) {
    igraph_error("Cannot run ARPACK", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_matrix_destroy, &vectors);
  if (LOGICAL(sym)[0]) {
    if (0 != igraph_vector_init(&values, 0)) {
      igraph_error("Cannot run ARPACK", __FILE__, __LINE__, IGRAPH_ENOMEM);
    }
    IGRAPH_FINALLY(igraph_vector_destroy, &values);
  } else {
    if (0 != igraph_matrix_init(&values2, 0, 0)) {
      igraph_error("Cannot run ARPACK", __FILE__, __LINE__, IGRAPH_ENOMEM);
    }
    IGRAPH_FINALLY(igraph_matrix_destroy, &values2);
  }

  data.fun=function;
  data.extra=extra;
  data.rho=rho;

  R_SEXP_to_igraph_arpack_options(options, &c_options);
  if (LOGICAL(sym)[0]) {
    if (0 != igraph_arpack_rssolve(R_igraph_i_arpack_callback, &data,
                                   &c_options, 0, &values, &vectors)) {
      igraph_error("ARPACK failed", __FILE__, __LINE__, IGRAPH_FAILURE);
    }
  } else {
    if (0 != igraph_arpack_rnsolve(R_igraph_i_arpack_callback, &data,
                                   &c_options, 0, &values2, &vectors)) {
      igraph_error("ARPACK failed", __FILE__, __LINE__, IGRAPH_FAILURE);
    }
  }

  PROTECT(result=NEW_LIST(3));
  if (LOGICAL(sym)[0]) {
    SET_VECTOR_ELT(result, 0, R_igraph_vector_to_SEXP(&values));
    igraph_vector_destroy(&values); IGRAPH_FINALLY_CLEAN(1);
  } else {
    SET_VECTOR_ELT(result, 0, R_igraph_matrix_to_SEXP(&values2));
    igraph_matrix_destroy(&values2); IGRAPH_FINALLY_CLEAN(1);
  }
  SET_VECTOR_ELT(result, 1, R_igraph_matrix_to_SEXP(&vectors));
  igraph_matrix_destroy(&vectors); IGRAPH_FINALLY_CLEAN(1);
  SET_VECTOR_ELT(result, 2, R_igraph_arpack_options_to_SEXP(&c_options));
  PROTECT(names=NEW_CHARACTER(3));
  SET_STRING_ELT(names, 0, Rf_mkChar("values"));
  SET_STRING_ELT(names, 1, Rf_mkChar("vectors"));
  SET_STRING_ELT(names, 2, Rf_mkChar("options"));
  SET_NAMES(result, names);

  UNPROTECT(2);
  return result;
}

SEXP R_igraph_is_chordal(SEXP graph, SEXP alpha, SEXP alpham1,
                         SEXP pfillin, SEXP pnewgraph) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_t c_alpha;
  igraph_vector_t c_alpham1;
  igraph_bool_t c_chordal;
  igraph_vector_t c_fillin;
  igraph_t c_newgraph;
  SEXP chordal;
  SEXP fillin;
  SEXP newgraph;
  SEXP result, names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (!Rf_isNull(alpha)) { R_SEXP_to_vector(alpha, &c_alpha); }
  if (!Rf_isNull(alpham1)) { R_SEXP_to_vector(alpham1, &c_alpham1); }
  if (LOGICAL(pfillin)[0]) {
    if (0 != igraph_vector_init(&c_fillin, 0)) {
      igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
    }
    IGRAPH_FINALLY(igraph_vector_destroy, &c_fillin);
  }
  IGRAPH_R_CHECK(igraph_is_chordal(&c_graph, (Rf_isNull(alpha) ? 0 : &c_alpha), (Rf_isNull(alpham1) ? 0 : &c_alpham1), &c_chordal, (LOGICAL(pfillin)[0] ? &c_fillin : 0), (LOGICAL(pnewgraph)[0] ? &c_newgraph : 0)));

                                        /* Convert output */
  PROTECT(result=NEW_LIST(3));
  PROTECT(names=NEW_CHARACTER(3));
  PROTECT(chordal=NEW_LOGICAL(1));
  LOGICAL(chordal)[0]=c_chordal;
  if (LOGICAL(pfillin)[0]) {
    PROTECT(fillin=R_igraph_vector_to_SEXP(&c_fillin));
    igraph_vector_destroy(&c_fillin);
    IGRAPH_FINALLY_CLEAN(1);
  } else {
    PROTECT(fillin=R_NilValue);
  }
  if (LOGICAL(pnewgraph)[0]) {
    IGRAPH_FINALLY(igraph_destroy, &c_newgraph);
    PROTECT(newgraph=R_igraph_to_SEXP(&c_newgraph));
    IGRAPH_I_DESTROY(&c_newgraph);
    IGRAPH_FINALLY_CLEAN(1);
  } else {
    PROTECT(newgraph=R_NilValue);
  }
  SET_VECTOR_ELT(result, 0, chordal);
  SET_VECTOR_ELT(result, 1, fillin);
  SET_VECTOR_ELT(result, 2, newgraph);
  SET_STRING_ELT(names, 0, Rf_mkChar("chordal"));
  SET_STRING_ELT(names, 1, Rf_mkChar("fillin"));
  SET_STRING_ELT(names, 2, Rf_mkChar("newgraph"));
  SET_NAMES(result, names);
  UNPROTECT(4);

  UNPROTECT(1);
  return(result);
}

typedef struct {
  SEXP graph, fun, extra, rho;
} R_igraph_i_bfs_data_t;

igraph_bool_t R_igraph_bfshandler(const igraph_t *graph,
                                  igraph_integer_t vid,
                                  igraph_integer_t pred,
                                  igraph_integer_t succ,
                                  igraph_integer_t rank,
                                  igraph_integer_t dist,
                                  void *extra) {

  R_igraph_i_bfs_data_t *data=extra;
  SEXP args, R_fcall, result, names;
  igraph_bool_t cres;

  PROTECT(args=NEW_NUMERIC(5));
  PROTECT(names=NEW_CHARACTER(5));

  SET_STRING_ELT(names, 0, Rf_mkChar("vid"));
  SET_STRING_ELT(names, 1, Rf_mkChar("pred"));
  SET_STRING_ELT(names, 2, Rf_mkChar("succ"));
  SET_STRING_ELT(names, 3, Rf_mkChar("rank"));
  SET_STRING_ELT(names, 4, Rf_mkChar("dist"));
  REAL(args)[0]=vid + 1;
  REAL(args)[1]=pred + 1;
  REAL(args)[2]=succ + 1;
  REAL(args)[3]=rank + 1;
  REAL(args)[4]=dist;
  SET_NAMES(args, names);

  PROTECT(R_fcall = Rf_lang4(data->fun, data->graph, args, data->extra));
  PROTECT(result = R_igraph_safe_eval_in_env(R_fcall, data->rho, NULL));
  cres = Rf_asLogical(R_igraph_handle_safe_eval_result_in_env(result, data->rho));

  UNPROTECT(4);
  return cres;
}

SEXP R_igraph_bfs(SEXP graph, SEXP proot, SEXP proots, SEXP pneimode,
                  SEXP punreachable, SEXP prestricted,
                  SEXP porder, SEXP prank, SEXP pfather,
                  SEXP ppred, SEXP psucc, SEXP pdist,
                  SEXP pcallback, SEXP pextra, SEXP prho) {

  igraph_t g;
  SEXP result, names;

  igraph_integer_t root=(igraph_integer_t) REAL(proot)[0];
  igraph_vector_t roots;
  igraph_bool_t unreachable=LOGICAL(punreachable)[0];
  igraph_vector_t restricted;
  igraph_integer_t neimode=(igraph_integer_t) REAL(pneimode)[0];
  igraph_vector_t order, rank, father, pred, succ, dist;
  igraph_vector_t *p_order=0, *p_rank=0, *p_father=0, *p_pred=0,
    *p_succ=0, *p_dist=0;
  igraph_bfshandler_t *callback=0;
  R_igraph_i_bfs_data_t cb_data, *p_cb_data=0;

  R_SEXP_to_igraph(graph, &g);
  if (!Rf_isNull(proots)) {
    R_SEXP_to_vector(proots, &roots);
  }
  if (!Rf_isNull(prestricted)) {
    R_SEXP_to_vector(prestricted, &restricted);
  }

  if (LOGICAL(porder)[0]) {
    igraph_vector_init(&order, 0); IGRAPH_FINALLY(igraph_vector_destroy, &order);
    p_order=&order;
  }
  if (LOGICAL(prank)[0]) {
    igraph_vector_init(&rank, 0); IGRAPH_FINALLY(igraph_vector_destroy, &rank);
    p_rank=&rank;
  }
  if (LOGICAL(pfather)[0]) {
    igraph_vector_init(&father, 0); IGRAPH_FINALLY(igraph_vector_destroy, &father);
    p_father=&father;
  }
  if (LOGICAL(ppred)[0]) {
    igraph_vector_init(&pred, 0); IGRAPH_FINALLY(igraph_vector_destroy, &pred);
    p_pred=&pred;
  }
  if (LOGICAL(psucc)[0]) {
    igraph_vector_init(&succ, 0); IGRAPH_FINALLY(igraph_vector_destroy, &succ);
    p_succ=&succ;
  }
  if (LOGICAL(pdist)[0]) {
    igraph_vector_init(&dist, 0); IGRAPH_FINALLY(igraph_vector_destroy, &dist);
    p_dist=&dist;
  }

  if (!Rf_isNull(pcallback)) {
    cb_data.graph=graph;
    cb_data.fun=pcallback;
    cb_data.extra=pextra;
    cb_data.rho=prho;
    callback=R_igraph_bfshandler;
    p_cb_data = &cb_data;
  }

  IGRAPH_R_CHECK(igraph_bfs(&g, root, Rf_isNull(proots) ? 0 : &roots, (igraph_neimode_t) neimode, unreachable, Rf_isNull(prestricted) ? 0 : &restricted, p_order, p_rank, p_father, p_pred, p_succ, p_dist, (igraph_bfshandler_t*) callback, p_cb_data));

  PROTECT(result=NEW_LIST(8));
  PROTECT(names=NEW_CHARACTER(8));

  SET_STRING_ELT(names, 0, Rf_mkChar("root"));
  SET_VECTOR_ELT(result, 0, NEW_NUMERIC(1));
  REAL(VECTOR_ELT(result, 0))[0] = root+1;

  SET_STRING_ELT(names, 1, Rf_mkChar("mode"));
  SET_VECTOR_ELT(result, 1, NEW_CHARACTER(1));
  if (neimode==1) {
    SET_STRING_ELT(VECTOR_ELT(result, 1), 0, Rf_mkChar("out"));
  } else if (neimode==2) {
    SET_STRING_ELT(VECTOR_ELT(result, 1), 0, Rf_mkChar("in"));
  } else {
    SET_STRING_ELT(VECTOR_ELT(result, 1), 0, Rf_mkChar("all"));
  }

  SET_STRING_ELT(names, 2, Rf_mkChar("order"));
  SET_VECTOR_ELT(result, 2, R_igraph_0orvector_to_SEXP_d(p_order));
  SET_STRING_ELT(names, 3, Rf_mkChar("rank"));
  SET_VECTOR_ELT(result, 3, R_igraph_0orvector_to_SEXP_d(p_rank));
  SET_STRING_ELT(names, 4, Rf_mkChar("father"));
  SET_VECTOR_ELT(result, 4, R_igraph_0orvector_to_SEXP_d(p_father));
  SET_STRING_ELT(names, 5, Rf_mkChar("pred"));
  SET_VECTOR_ELT(result, 5, R_igraph_0orvector_to_SEXP_d(p_pred));
  SET_STRING_ELT(names, 6, Rf_mkChar("succ"));
  SET_VECTOR_ELT(result, 6, R_igraph_0orvector_to_SEXP_d(p_succ));
  SET_STRING_ELT(names, 7, Rf_mkChar("dist"));
  SET_VECTOR_ELT(result, 7, R_igraph_0orvector_to_SEXP_d(p_dist));

  SET_NAMES(result, names);

  UNPROTECT(2);

  if (p_dist) { igraph_vector_destroy(p_dist); IGRAPH_FINALLY_CLEAN(1); p_dist = 0; }
  if (p_succ) { igraph_vector_destroy(p_succ); IGRAPH_FINALLY_CLEAN(1); p_succ = 0; }
  if (p_pred) { igraph_vector_destroy(p_pred); IGRAPH_FINALLY_CLEAN(1); p_pred = 0; }
  if (p_father) { igraph_vector_destroy(p_father); IGRAPH_FINALLY_CLEAN(1); p_father = 0; }
  if (p_rank) { igraph_vector_destroy(p_rank); IGRAPH_FINALLY_CLEAN(1); p_rank = 0; }
  if (p_order) { igraph_vector_destroy(p_order); IGRAPH_FINALLY_CLEAN(1); p_order = 0; }

  return result;
}

typedef struct {
  SEXP graph, fun_in, fun_out, extra, rho;
} R_igraph_i_dfs_data_t;

igraph_bool_t R_igraph_dfshandler(const igraph_t *graph,
                                  igraph_integer_t vid,
                                  igraph_integer_t dist,
                                  void *extra,
                                  int which) {

  R_igraph_i_dfs_data_t *data=extra;
  SEXP args, R_fcall, result, names;
  igraph_bool_t cres;

  PROTECT(args=NEW_NUMERIC(2));
  PROTECT(names=NEW_CHARACTER(2));

  SET_STRING_ELT(names, 0, Rf_mkChar("vid"));
  SET_STRING_ELT(names, 1, Rf_mkChar("dist"));
  REAL(args)[0]=vid + 1;
  REAL(args)[1]=dist;
  SET_NAMES(args, names);

  PROTECT(R_fcall = Rf_lang4(which==0 ? data->fun_in : data->fun_out,
                          data->graph, args, data->extra));
  PROTECT(result = R_igraph_safe_eval_in_env(R_fcall, data->rho, NULL));
  cres = Rf_asLogical(R_igraph_handle_safe_eval_result_in_env(result, data->rho));

  UNPROTECT(4);
  return cres;
}

igraph_bool_t R_igraph_dfshandler_in(const igraph_t *graph,
                                     igraph_integer_t vid,
                                     igraph_integer_t dist,
                                     void *extra) {

  return R_igraph_dfshandler(graph, vid, dist, extra, 0);
}


igraph_bool_t R_igraph_dfshandler_out(const igraph_t *graph,
                                      igraph_integer_t vid,
                                      igraph_integer_t dist,
                                      void *extra) {

  return R_igraph_dfshandler(graph, vid, dist, extra, 1);
}

SEXP R_igraph_dfs(SEXP graph, SEXP proot, SEXP pneimode, SEXP punreachable,
                  SEXP porder, SEXP porder_out, SEXP pfather, SEXP pdist,
                  SEXP pin_callback, SEXP pout_callback,
                  SEXP pextra, SEXP prho) {

  igraph_t g;
  SEXP result, names;

  igraph_integer_t root=(igraph_integer_t) REAL(proot)[0];
  igraph_integer_t neimode=(igraph_integer_t) REAL(pneimode)[0];
  igraph_bool_t unreachable=LOGICAL(punreachable)[0];
  igraph_vector_t order, order_out, father, dist;
  igraph_vector_t *p_order=0, *p_order_out=0, *p_father=0, *p_dist=0;
  igraph_dfshandler_t *in_callback=0, *out_callback=0;
  R_igraph_i_dfs_data_t cb_data, *p_cb_data=0;

  R_SEXP_to_igraph(graph, &g);

  if (LOGICAL(porder)[0]) {
    igraph_vector_init(&order, 0); p_order=&order;
  }
  if (LOGICAL(porder_out)[0]) {
    igraph_vector_init(&order_out, 0); p_order_out=&order_out;
  }
  if (LOGICAL(pfather)[0]) {
    igraph_vector_init(&father, 0); p_father=&father;
  }
  if (LOGICAL(pdist)[0]) {
    igraph_vector_init(&dist, 0); p_dist=&dist;
  }

  if (!Rf_isNull(pin_callback) || !Rf_isNull(pout_callback)) {
    cb_data.graph=graph;
    cb_data.fun_in=pin_callback;
    cb_data.fun_out=pout_callback;
    cb_data.extra=pextra;
    cb_data.rho=prho;
    p_cb_data = &cb_data;
  }
  if (!Rf_isNull(pin_callback)) {
    in_callback=R_igraph_dfshandler_in;
  }
  if (!Rf_isNull(pout_callback)) {
    out_callback=R_igraph_dfshandler_out;
  }

  IGRAPH_R_CHECK(igraph_dfs(&g, root, (igraph_neimode_t) neimode, unreachable, p_order, p_order_out, p_father, p_dist, (igraph_dfshandler_t*) in_callback, (igraph_dfshandler_t*) out_callback, p_cb_data));

  PROTECT(result=NEW_LIST(6));
  PROTECT(names=NEW_CHARACTER(6));

  SET_STRING_ELT(names, 0, Rf_mkChar("root"));
  SET_VECTOR_ELT(result, 0, NEW_NUMERIC(1));
  REAL(VECTOR_ELT(result, 0))[0] = root+1;

  SET_STRING_ELT(names, 1, Rf_mkChar("mode"));
  SET_VECTOR_ELT(result, 1, NEW_CHARACTER(1));
  if (neimode==1) {
    SET_STRING_ELT(VECTOR_ELT(result, 1), 0, Rf_mkChar("out"));
  } else if (neimode==2) {
    SET_STRING_ELT(VECTOR_ELT(result, 1), 0, Rf_mkChar("in"));
  } else {
    SET_STRING_ELT(VECTOR_ELT(result, 1), 0, Rf_mkChar("all"));
  }

  SET_STRING_ELT(names, 2, Rf_mkChar("order"));
  SET_VECTOR_ELT(result, 2, R_igraph_0orvector_to_SEXP_d(p_order));
  SET_STRING_ELT(names, 3, Rf_mkChar("order.out"));
  SET_VECTOR_ELT(result, 3, R_igraph_0orvector_to_SEXP_d(p_order_out));
  SET_STRING_ELT(names, 4, Rf_mkChar("father"));
  SET_VECTOR_ELT(result, 4, R_igraph_0orvector_to_SEXP_d(p_father));
  SET_STRING_ELT(names, 5, Rf_mkChar("dist"));
  SET_VECTOR_ELT(result, 5, R_igraph_0orvector_to_SEXP_d(p_dist));

  SET_NAMES(result, names);

  UNPROTECT(2);
  return result;
}


SEXP R_igraph_cohesive_blocks(SEXP graph) {
  igraph_vector_ptr_t c_blocks;
  igraph_vector_t c_cohesion;
  igraph_vector_t c_parent;
  igraph_t c_blockTree;
  igraph_t c_graph;
  SEXP blocks;
  SEXP cohesion;
  SEXP parent;
  SEXP blockTree;
  SEXP result;
  SEXP names;

  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_ptr_init(&c_blocks, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(R_igraph_vectorlist_destroy, &c_blocks);
  if (0 != igraph_vector_init(&c_cohesion, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_cohesion);
  if (0 != igraph_vector_init(&c_parent, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_parent);

  IGRAPH_R_CHECK(igraph_cohesive_blocks(&c_graph, &c_blocks, &c_cohesion, &c_parent, &c_blockTree));

  PROTECT(result=NEW_LIST(4));
  PROTECT(names=NEW_CHARACTER(4));
  PROTECT(blocks=R_igraph_vectorlist_to_SEXP_p1(&c_blocks));
  R_igraph_vectorlist_destroy(&c_blocks);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(cohesion=R_igraph_vector_to_SEXP(&c_cohesion));
  igraph_vector_destroy(&c_cohesion);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(parent=R_igraph_vector_to_SEXPp1(&c_parent));
  igraph_vector_destroy(&c_parent);
  IGRAPH_FINALLY_CLEAN(1);
  IGRAPH_FINALLY(igraph_destroy, &c_blockTree);
  PROTECT(blockTree=R_igraph_to_SEXP(&c_blockTree));
  IGRAPH_I_DESTROY(&c_blockTree);
  IGRAPH_FINALLY_CLEAN(1);
  SET_VECTOR_ELT(result, 0, blocks);
  SET_VECTOR_ELT(result, 1, cohesion);
  SET_VECTOR_ELT(result, 2, parent);
  SET_VECTOR_ELT(result, 3, blockTree);
  SET_STRING_ELT(names, 0, Rf_mkChar("blocks"));
  SET_STRING_ELT(names, 1, Rf_mkChar("cohesion"));
  SET_STRING_ELT(names, 2, Rf_mkChar("parent"));
  SET_STRING_ELT(names, 3, Rf_mkChar("blockTree"));
  SET_NAMES(result, names);

  UNPROTECT(6);
  return result;
}

typedef struct {
  igraph_arpack_function_t *fun;
} R_igraph_i_function_container_t;

SEXP R_igraph_i_levc_arp(SEXP extP, SEXP extE, SEXP pv) {
  R_igraph_i_function_container_t *cont = R_ExternalPtrAddr(extP);
  igraph_arpack_function_t *fun= cont->fun;
  void *extra=R_ExternalPtrAddr(extE);
  SEXP res;

  PROTECT(res=NEW_NUMERIC(GET_LENGTH(pv)));
  fun(REAL(res), REAL(pv), GET_LENGTH(pv), extra);

  UNPROTECT(1);
  return res;
}

typedef struct R_igraph_i_levc_data_t {
  SEXP fun;
  SEXP extra;
  SEXP rho;
  SEXP rho2;
} R_igraph_i_levc_data_t;

int R_igraph_i_levc_callback(const igraph_vector_t *membership,
                     long int comm,
                     igraph_real_t eigenvalue,
                     const igraph_vector_t *eigenvector,
                     igraph_arpack_function_t *arpack_multiplier,
                     void *arpack_extra,
                     void *extra) {

  SEXP s_memb, s_comm, s_evalue, s_evector, s_multip;
  SEXP R_fcall, R_multip_call;
  SEXP res, l1, l2, l3;
  int result;
  R_igraph_i_levc_data_t *data=extra;
  R_igraph_i_function_container_t cont = { arpack_multiplier };

  PROTECT(s_memb=R_igraph_vector_to_SEXP(membership));
  PROTECT(s_comm=NEW_NUMERIC(1)); REAL(s_comm)[0]=comm;
  PROTECT(s_evalue=NEW_NUMERIC(1)); REAL(s_evalue)[0]=eigenvalue;
  PROTECT(s_evector=R_igraph_vector_to_SEXP(eigenvector));
  PROTECT(l1 = Rf_install("igraph.i.levc.arp"));
  PROTECT(l2 = R_MakeExternalPtr((void*) &cont, R_NilValue, R_NilValue));
  PROTECT(l3 = R_MakeExternalPtr(arpack_extra, R_NilValue, R_NilValue));
  PROTECT(R_multip_call = Rf_lang3(l1, l2, l3));
  PROTECT(s_multip = Rf_eval(R_multip_call, data->rho2));

  PROTECT(R_fcall = R_igraph_i_lang7(data->fun, s_memb, s_comm,
                                     s_evalue, s_evector, s_multip,
                                     data->extra));
  PROTECT(res = Rf_eval(R_fcall, data->rho));

  result=(int) REAL(AS_NUMERIC(res))[0];

  UNPROTECT(11);
  return result;
}

SEXP R_igraph_community_leading_eigenvector(SEXP graph, SEXP steps,
                                            SEXP weights,
                                            SEXP options, SEXP pstart,
                                            SEXP callback,
                                            SEXP callback_extra,
                                            SEXP callback_env,
                                            SEXP callback_env2) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_matrix_t c_merges;
  igraph_vector_t c_membership;
  igraph_integer_t c_steps;
  igraph_vector_t v_weights, *pweights=0;
  igraph_bool_t c_start=!Rf_isNull(pstart);
  igraph_arpack_options_t c_options;
  igraph_real_t c_modularity;
  igraph_vector_t c_eigenvalues;
  igraph_vector_ptr_t c_eigenvectors;
  igraph_vector_t c_history;
  SEXP merges;
  SEXP membership;
  SEXP modularity;
  SEXP eigenvalues;
  SEXP eigenvectors;
  SEXP history;
  SEXP result, names;

  R_igraph_i_levc_data_t callback_data = { callback, callback_extra,
                                           callback_env, callback_env2 };

                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (!Rf_isNull(weights)) {
    pweights=&v_weights; R_SEXP_to_vector(weights, &v_weights);
  }
  if (0 != igraph_matrix_init(&c_merges, 0, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_matrix_destroy, &c_merges);
  if (c_start) {
    R_SEXP_to_vector_copy(pstart, &c_membership);
  } else {
    if (0 != igraph_vector_init(&c_membership, 0)) {
      igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
    }
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_membership);
  c_steps=INTEGER(steps)[0];
  R_SEXP_to_igraph_arpack_options(options, &c_options);
  if (0 != igraph_vector_init(&c_eigenvalues, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  if (0 != igraph_vector_ptr_init(&c_eigenvectors, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  if (0 != igraph_vector_init(&c_history, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_community_leading_eigenvector(&c_graph, pweights, &c_merges, &c_membership, c_steps, &c_options, &c_modularity, c_start, &c_eigenvalues, &c_eigenvectors, &c_history, Rf_isNull(callback) ? 0 : R_igraph_i_levc_callback, &callback_data));

                                        /* Convert output */
  PROTECT(result=NEW_LIST(7));
  PROTECT(names=NEW_CHARACTER(7));
  PROTECT(merges=R_igraph_matrix_to_SEXP(&c_merges));
  igraph_matrix_destroy(&c_merges);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(membership=R_igraph_vector_to_SEXP(&c_membership));
  igraph_vector_destroy(&c_membership);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(options=R_igraph_arpack_options_to_SEXP(&c_options));
  PROTECT(modularity=NEW_NUMERIC(1));
  REAL(modularity)[0]=c_modularity;
  PROTECT(eigenvalues=R_igraph_vector_to_SEXP(&c_eigenvalues));
  igraph_vector_destroy(&c_eigenvalues);
  PROTECT(eigenvectors=R_igraph_vectorlist_to_SEXP(&c_eigenvectors));
  R_igraph_vectorlist_destroy(&c_eigenvectors);
  PROTECT(history=R_igraph_vector_to_SEXP(&c_history));
  igraph_vector_destroy(&c_history);
  SET_VECTOR_ELT(result, 0, merges);
  SET_VECTOR_ELT(result, 1, membership);
  SET_VECTOR_ELT(result, 2, options);
  SET_VECTOR_ELT(result, 3, modularity);
  SET_VECTOR_ELT(result, 4, eigenvalues);
  SET_VECTOR_ELT(result, 5, eigenvectors);
  SET_VECTOR_ELT(result, 6, history);
  SET_STRING_ELT(names, 0, Rf_mkChar("merges"));
  SET_STRING_ELT(names, 1, Rf_mkChar("membership"));
  SET_STRING_ELT(names, 2, Rf_mkChar("options"));
  SET_STRING_ELT(names, 3, Rf_mkChar("modularity"));
  SET_STRING_ELT(names, 4, Rf_mkChar("eigenvalues"));
  SET_STRING_ELT(names, 5, Rf_mkChar("eigenvectors"));
  SET_STRING_ELT(names, 6, Rf_mkChar("history"));
  SET_NAMES(result, names);

  UNPROTECT(8);

  UNPROTECT(1);
  return(result);
}

SEXP R_igraph_get_eids(SEXP graph, SEXP pvp, SEXP pdirected,
                       SEXP perror, SEXP pmulti) {
  igraph_t g;
  igraph_vector_t vp;
  igraph_vector_t res;
  igraph_bool_t directed=LOGICAL(pdirected)[0];
  igraph_bool_t err=LOGICAL(perror)[0];
  igraph_bool_t multi=LOGICAL(pmulti)[0];
  SEXP result;

  R_SEXP_to_igraph(graph, &g);
  R_SEXP_to_vector(pvp, &vp);
  igraph_vector_init(&res, 0);

  if (multi) {
    igraph_get_eids_multi(&g, &res, /*pairs=*/ &vp, /*path=*/ 0, directed,
                          err);
  } else {
    IGRAPH_R_CHECK(igraph_get_eids(&g, &res, /*pairs=*/ &vp, /*path=*/ 0, directed, err));
  }

  PROTECT(result=R_igraph_vector_to_SEXP(&res));
  igraph_vector_destroy(&res);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_scg_semiprojectors(SEXP groups, SEXP matrix_type, SEXP p,
                                 SEXP norm, SEXP psparse) {
                                        /* Declarations */
  igraph_vector_t c_groups;
  igraph_integer_t c_matrix_type;
  igraph_matrix_t c_L;
  igraph_matrix_t c_R;
  igraph_sparsemat_t c_Lsparse;
  igraph_sparsemat_t c_Rsparse;
  igraph_vector_t c_p;
  igraph_integer_t c_norm;
  SEXP L;
  SEXP R;
  SEXP Lsparse;
  SEXP Rsparse;
  igraph_bool_t sparse=LOGICAL(psparse)[0];
  SEXP result, names;
                                        /* Convert input */
  R_SEXP_to_vector(groups, &c_groups);
  c_matrix_type=(igraph_integer_t) REAL(matrix_type)[0];
  if (!sparse) {
    if (0 != igraph_matrix_init(&c_L, 0, 0)) {
      igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
    }
    IGRAPH_FINALLY(igraph_matrix_destroy, &c_L);
    if (0 != igraph_matrix_init(&c_R, 0, 0)) {
      igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
    }
    IGRAPH_FINALLY(igraph_matrix_destroy, &c_R);
  } else {
    /* Nothing to do, because igraph_scg_semiprojectors
       expect uninitialized sparse matrices */
  }
  if (!Rf_isNull(p)) { R_SEXP_to_vector(p, &c_p); }
  c_norm=(igraph_integer_t) REAL(norm)[0];
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_scg_semiprojectors(&c_groups, (igraph_scg_matrix_t) c_matrix_type, (sparse ? 0 : &c_L), (sparse ? 0 : &c_R), (sparse ? &c_Lsparse : 0), (sparse ? &c_Rsparse : 0), (Rf_isNull(p) ? 0 : &c_p), (igraph_scg_norm_t) c_norm));

                                        /* Convert output */
  PROTECT(result=NEW_LIST(2));
  PROTECT(names=NEW_CHARACTER(2));
  if (!sparse) {
    PROTECT(L=R_igraph_0ormatrix_to_SEXP(&c_L));
    igraph_matrix_destroy(&c_L);
    IGRAPH_FINALLY_CLEAN(1);
    PROTECT(R=R_igraph_0ormatrix_to_SEXP(&c_R));
    igraph_matrix_destroy(&c_R);
    IGRAPH_FINALLY_CLEAN(1);
    SET_VECTOR_ELT(result, 0, L);
    SET_VECTOR_ELT(result, 1, R);
  } else {
    PROTECT(Lsparse=R_igraph_0orsparsemat_to_SEXP(&c_Lsparse));
    igraph_sparsemat_destroy(&c_Lsparse);
    PROTECT(Rsparse=R_igraph_0orsparsemat_to_SEXP(&c_Rsparse));
    igraph_sparsemat_destroy(&c_Rsparse);
    SET_VECTOR_ELT(result, 0, Lsparse);
    SET_VECTOR_ELT(result, 1, Rsparse);
  }
  SET_STRING_ELT(names, 0, Rf_mkChar("L"));
  SET_STRING_ELT(names, 1, Rf_mkChar("R"));
  SET_NAMES(result, names);
  UNPROTECT(3);

  UNPROTECT(1);
  return(result);
}

SEXP R_igraph_laplacian(SEXP graph, SEXP normalized, SEXP weights,
                        SEXP psparse) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_matrix_t c_res;
  igraph_sparsemat_t c_sparseres;
  igraph_bool_t c_normalized;
  igraph_vector_t c_weights;
  igraph_bool_t c_sparse=LOGICAL(psparse)[0];
  SEXP result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (!c_sparse) {
    if (0 != igraph_matrix_init(&c_res, 0, 0)) {
      igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
    }
    IGRAPH_FINALLY(igraph_matrix_destroy, &c_res);
  }
  if (c_sparse) {
    if (0 != igraph_sparsemat_init(&c_sparseres, 0, 0, 0)) {
      igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
    }
    IGRAPH_FINALLY(igraph_sparsemat_destroy, &c_sparseres);
  }
  c_normalized=LOGICAL(normalized)[0];
  if (!Rf_isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_laplacian(&c_graph, (c_sparse ? 0 : &c_res), (c_sparse ? &c_sparseres : 0), c_normalized, (Rf_isNull(weights) ? 0 : &c_weights)));

                                        /* Convert output */
  if (!c_sparse) {
    PROTECT(result=R_igraph_matrix_to_SEXP(&c_res));
    igraph_matrix_destroy(&c_res);
    IGRAPH_FINALLY_CLEAN(1);
  } else {
    PROTECT(result=R_igraph_sparsemat_to_SEXP(&c_sparseres));
    igraph_sparsemat_destroy(&c_sparseres);
    IGRAPH_FINALLY_CLEAN(1);
  }

  UNPROTECT(1);
  return(result);
}

SEXP R_igraph_scg_adjacency(SEXP graph, SEXP matrix, SEXP sparsmat, SEXP ev,
                            SEXP intervals_vector,
                            SEXP algorithm, SEXP evec,
                            SEXP groups, SEXP use_arpack, SEXP maxiter,
                            SEXP sparse, SEXP output, SEXP semproj,
                            SEXP epairs) {

                                        /* Declarations */
  igraph_t c_graph;
  igraph_matrix_t c_matrix;
  igraph_sparsemat_t c_sparsmat;
  igraph_vector_t c_ev;
  igraph_vector_t c_intervals_vector;
  igraph_integer_t c_algorithm=(igraph_integer_t) REAL(algorithm)[0];
  igraph_vector_t c_eval;
  igraph_matrix_t c_evec;
  igraph_vector_t c_groups;
  igraph_bool_t c_use_arpack=LOGICAL(use_arpack)[0];
  igraph_integer_t c_maxiter=INTEGER(maxiter)[0];
  igraph_bool_t c_sparse=LOGICAL(sparse)[0];
  igraph_real_t c_output=REAL(output)[0];
  igraph_bool_t c_semproj=LOGICAL(semproj)[0];
  igraph_bool_t c_epairs=LOGICAL(epairs)[0];
  igraph_t c_scg_graph;
  igraph_matrix_t c_scg_matrix;
  igraph_sparsemat_t c_scg_sparsemat;
  igraph_matrix_t c_L;
  igraph_matrix_t c_R;
  igraph_sparsemat_t c_Lsparse;
  igraph_sparsemat_t c_Rsparse;
  SEXP scg_graph;
  SEXP scg_matrix;
  SEXP scg_sparsemat;
  SEXP L;
  SEXP R;
  SEXP Lsparse;
  SEXP Rsparse;
  SEXP result, names;
  SEXP eval;
                                        /* What to return */
  igraph_bool_t do_scg_graph=
    (!Rf_isNull(graph) && c_output==1 /*default*/) || c_output==3 /*graph*/;
  igraph_bool_t do_scg_matrix=!c_sparse &&
    ((Rf_isNull(graph) && c_output==1 /*default*/) || c_output==2 /*matrix*/);
  igraph_bool_t do_scg_sparsemat=c_sparse &&
    ((Rf_isNull(graph) && c_output==1 /*default*/) || c_output==2 /*matrix*/);
  igraph_bool_t do_L=c_semproj && !c_sparse;
  igraph_bool_t do_R=c_semproj && !c_sparse;
  igraph_bool_t do_Lsparse=c_semproj && c_sparse;
  igraph_bool_t do_Rsparse=c_semproj && c_sparse;
  igraph_bool_t do_eval=c_epairs;
  igraph_bool_t do_evec=c_epairs;

                                          /* Convert input */
  if (!Rf_isNull(graph)) { R_SEXP_to_igraph(graph, &c_graph); }
  if (!Rf_isNull(matrix)) { R_SEXP_to_matrix(matrix, &c_matrix); }
  if (!Rf_isNull(sparsmat)) { R_SEXP_to_sparsemat(sparsmat, &c_sparsmat); }

  R_SEXP_to_vector(ev, &c_ev);
  R_SEXP_to_vector(intervals_vector, &c_intervals_vector);

  if (do_eval) { igraph_vector_init(&c_eval, 0); }
  if (!Rf_isNull(evec)) {
    R_SEXP_to_igraph_matrix_copy(evec, &c_evec);
  } else if (do_evec) {
    igraph_matrix_init(&c_evec, 0, 0);
  }
  if (!Rf_isNull(groups)) {
    R_SEXP_to_vector_copy(groups, &c_groups);
  } else {
    igraph_vector_init(&c_groups, 0);
  }

  if (do_scg_matrix) { igraph_matrix_init(&c_scg_matrix, 0, 0); }
  if (do_L) { igraph_matrix_init(&c_L, 0, 0); }
  if (do_R) { igraph_matrix_init(&c_R, 0, 0); }

  if (do_scg_sparsemat) { igraph_sparsemat_init(&c_scg_sparsemat, 0, 0, 0); }

                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_scg_adjacency((Rf_isNull(graph) ? 0 : &c_graph), (Rf_isNull(matrix) ? 0 : &c_matrix), (Rf_isNull(sparsmat) ? 0 : &c_sparsmat), &c_ev, /*intervals=*/ 0, &c_intervals_vector, (igraph_scg_algorithm_t) c_algorithm, (do_eval ? &c_eval : 0), (!Rf_isNull(evec) || do_evec ? &c_evec : 0), &c_groups, c_use_arpack, c_maxiter, (do_scg_graph ? &c_scg_graph : 0), (do_scg_matrix ? &c_scg_matrix : 0), (do_scg_sparsemat ? &c_scg_sparsemat : 0), (do_L ? &c_L : 0), (do_R ? &c_R : 0), (do_Lsparse ? &c_Lsparse : 0), (do_Rsparse ? &c_Rsparse : 0)));

  if (!Rf_isNull(sparsmat)) { igraph_free(c_sparsmat.cs); }

                                        /* Convert output */
  PROTECT(result=NEW_LIST(6));
  PROTECT(names=NEW_CHARACTER(6));

  if (do_eval) {
    eval=R_igraph_vector_to_SEXP(&c_eval);
    igraph_vector_destroy(&c_eval);
  } else {
    eval=R_NilValue;
  }
  PROTECT(eval);

  if (do_evec) {
    evec=R_igraph_matrix_to_SEXP(&c_evec);
    igraph_matrix_destroy(&c_evec);
  } else {
    evec=R_NilValue;
  }
  PROTECT(evec);

  PROTECT(groups=R_igraph_vector_to_SEXPp1(&c_groups));
  igraph_vector_destroy(&c_groups);

  if (do_scg_graph) {
    PROTECT(scg_graph=R_igraph_to_SEXP(&c_scg_graph));
    IGRAPH_I_DESTROY(&c_scg_graph);
    UNPROTECT(1);
  } else {
    scg_graph=R_NilValue;
  }
  PROTECT(scg_graph);

  if (do_scg_matrix) {
    scg_matrix=R_igraph_matrix_to_SEXP(&c_scg_matrix);
    igraph_matrix_destroy(&c_scg_matrix);
  } else {
    scg_matrix=R_NilValue;
  }
  PROTECT(scg_matrix);

  if (do_scg_sparsemat) {
    scg_sparsemat=R_igraph_sparsemat_to_SEXP(&c_scg_sparsemat);
    igraph_sparsemat_destroy(&c_scg_sparsemat);
  } else {
    scg_sparsemat=R_NilValue;
  }
  PROTECT(scg_sparsemat);

  if (do_L) {
    L=R_igraph_matrix_to_SEXP(&c_L);
    igraph_matrix_destroy(&c_L);
  } else {
    L=R_NilValue;
  }
  PROTECT(L);

  if (do_R) {
    R=R_igraph_matrix_to_SEXP(&c_R);
    igraph_matrix_destroy(&c_R);
  } else {
    R=R_NilValue;
  }
  PROTECT(R);

  if (do_Lsparse) {
    Lsparse=R_igraph_sparsemat_to_SEXP(&c_Lsparse);
    igraph_sparsemat_destroy(&c_Lsparse);
  } else {
    Lsparse=R_NilValue;
  }
  PROTECT(Lsparse);

  if (do_Rsparse) {
    Rsparse=R_igraph_sparsemat_to_SEXP(&c_Rsparse);
    igraph_sparsemat_destroy(&c_Rsparse);
  } else {
    Rsparse=R_NilValue;
  }
  PROTECT(Rsparse);

  if (do_scg_graph) { SET_VECTOR_ELT(result, 0, scg_graph); }
  if (do_scg_matrix) { SET_VECTOR_ELT(result, 0, scg_matrix); }
  if (do_scg_sparsemat) { SET_VECTOR_ELT(result, 0, scg_sparsemat); }
  SET_VECTOR_ELT(result, 1, groups);
  if (do_L) { SET_VECTOR_ELT(result, 2, L); }
  if (do_Lsparse) { SET_VECTOR_ELT(result, 2, Lsparse); }
  if (do_R) { SET_VECTOR_ELT(result, 3, R); }
  if (do_Rsparse) { SET_VECTOR_ELT(result, 3, Rsparse); }
  SET_VECTOR_ELT(result, 4, eval);
  SET_VECTOR_ELT(result, 5, evec);
  SET_STRING_ELT(names, 0, Rf_mkChar("Xt"));
  SET_STRING_ELT(names, 1, Rf_mkChar("groups"));
  SET_STRING_ELT(names, 2, Rf_mkChar("L"));
  SET_STRING_ELT(names, 3, Rf_mkChar("R"));
  SET_STRING_ELT(names, 4, Rf_mkChar("values"));
  SET_STRING_ELT(names, 5, Rf_mkChar("vectors"));
  SET_NAMES(result, names);

  UNPROTECT(12);
  return(result);
}

SEXP R_igraph_scg_stochastic(SEXP graph, SEXP matrix, SEXP sparsmat, SEXP ev,
                             SEXP intervals_vector, SEXP algorithm, SEXP norm,
                             SEXP evec, SEXP groups, SEXP p, SEXP use_arpack,
                             SEXP maxiter, SEXP sparse, SEXP output,
                             SEXP semproj, SEXP epairs, SEXP stat_prob) {

                                        /* Declarations */
  igraph_t c_graph;
  igraph_matrix_t c_matrix;
  igraph_sparsemat_t c_sparsmat;
  igraph_vector_t c_ev;
  igraph_vector_t c_intervals_vector;
  igraph_integer_t c_algorithm=(igraph_integer_t) REAL(algorithm)[0];
  igraph_integer_t c_norm=(igraph_integer_t) REAL(norm)[0];
  igraph_vector_complex_t c_eval;
  igraph_matrix_complex_t c_evec;
  igraph_vector_t c_groups;
  igraph_vector_t c_p;
  igraph_bool_t c_use_arpack=LOGICAL(use_arpack)[0];
  igraph_integer_t c_maxiter=INTEGER(maxiter)[0];
  igraph_bool_t c_sparse=LOGICAL(sparse)[0];
  igraph_real_t c_output=REAL(output)[0];
  igraph_bool_t c_semproj=LOGICAL(semproj)[0];
  igraph_bool_t c_epairs=LOGICAL(epairs)[0];
  igraph_bool_t c_stat_prob=LOGICAL(stat_prob)[0];
  igraph_t c_scg_graph;
  igraph_matrix_t c_scg_matrix;
  igraph_sparsemat_t c_scg_sparsemat;
  igraph_matrix_t c_L;
  igraph_matrix_t c_R;
  igraph_sparsemat_t c_Lsparse;
  igraph_sparsemat_t c_Rsparse;
  SEXP scg_graph;
  SEXP scg_matrix;
  SEXP scg_sparsemat;
  SEXP L;
  SEXP R;
  SEXP Lsparse;
  SEXP Rsparse;
  SEXP result, names;
  SEXP eval;
                                        /* What to return */
  igraph_bool_t do_scg_graph=
    (!Rf_isNull(graph) && c_output==1 /*default*/) || c_output==3 /*graph*/;
  igraph_bool_t do_scg_matrix=!c_sparse &&
    ((Rf_isNull(graph) && c_output==1 /*default*/) || c_output==2 /*matrix*/);
  igraph_bool_t do_scg_sparsemat=c_sparse &&
    ((Rf_isNull(graph) && c_output==1 /*default*/) || c_output==2 /*matrix*/);
  igraph_bool_t do_L=c_semproj && !c_sparse;
  igraph_bool_t do_R=c_semproj && !c_sparse;
  igraph_bool_t do_Lsparse=c_semproj && c_sparse;
  igraph_bool_t do_Rsparse=c_semproj && c_sparse;
  igraph_bool_t do_eval=c_epairs;
  igraph_bool_t do_evec=c_epairs;
  igraph_bool_t do_p=c_stat_prob;

                                        /* Convert input */
  if (!Rf_isNull(graph)) { R_SEXP_to_igraph(graph, &c_graph); }
  if (!Rf_isNull(matrix)) { R_SEXP_to_matrix(matrix, &c_matrix); }
  if (!Rf_isNull(sparsmat)) { R_SEXP_to_sparsemat(sparsmat, &c_sparsmat); }

  R_SEXP_to_vector(ev, &c_ev);
  R_SEXP_to_vector(intervals_vector, &c_intervals_vector);
  if (do_eval) { igraph_vector_complex_init(&c_eval, 0); }
  if (!Rf_isNull(evec)) {
    R_SEXP_to_matrix_complex_copy(evec, &c_evec);
  } else if (do_evec) {
    igraph_matrix_complex_init(&c_evec, 0, 0);
  }
  if (!Rf_isNull(groups)) {
    R_SEXP_to_vector_copy(groups, &c_groups);
  } else {
    igraph_vector_init(&c_groups, 0);
  }

  if (!Rf_isNull(p)) {
    R_SEXP_to_vector_copy(p, &c_p);
  } else if (do_p) {
    igraph_vector_init(&c_p, 0);
  }

  if (do_scg_matrix) { igraph_matrix_init(&c_scg_matrix, 0, 0); }
  if (do_L) { igraph_matrix_init(&c_L, 0, 0); }
  if (do_R) { igraph_matrix_init(&c_R, 0, 0); }

                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_scg_stochastic((Rf_isNull(graph) ? 0 : &c_graph), (Rf_isNull(matrix) ? 0 : &c_matrix), (Rf_isNull(sparsmat) ? 0 : &c_sparsmat), &c_ev, /*intervals=*/ 0, &c_intervals_vector, (igraph_scg_algorithm_t) c_algorithm, (igraph_scg_norm_t) c_norm, (do_eval ? &c_eval : 0), (!Rf_isNull(evec) || do_evec ? &c_evec : 0), &c_groups, (!Rf_isNull(p) || do_p ? &c_p : 0), c_use_arpack, c_maxiter, (do_scg_graph ? &c_scg_graph : 0), (do_scg_matrix ? &c_scg_matrix : 0), (do_scg_sparsemat ? &c_scg_sparsemat : 0), (do_L ? &c_L : 0), (do_R ? &c_R : 0), (do_Lsparse ? &c_Lsparse : 0), (do_Rsparse ? &c_Rsparse : 0)));

  if (!Rf_isNull(sparsmat)) { igraph_free(c_sparsmat.cs); }

                                        /* Convert output */
  PROTECT(result=NEW_LIST(7));
  PROTECT(names=NEW_CHARACTER(7));

  if (do_eval) {
    PROTECT(eval=R_igraph_vector_complex_to_SEXP(&c_eval));
    igraph_vector_complex_destroy(&c_eval);
  } else {
    PROTECT(eval=R_NilValue);
  }

  if (do_evec) {
    PROTECT(evec=R_igraph_matrix_complex_to_SEXP(&c_evec));
    igraph_matrix_complex_destroy(&c_evec);
  } else {
    PROTECT(evec=R_NilValue);
  }

  if (do_p) {
    PROTECT(p=R_igraph_vector_to_SEXP(&c_p));
    igraph_vector_destroy(&c_p);
  } else {
    PROTECT(p=R_NilValue);
  }

  PROTECT(groups=R_igraph_vector_to_SEXPp1(&c_groups));
  igraph_vector_destroy(&c_groups);

  if (do_scg_graph) {
    PROTECT(scg_graph=R_igraph_to_SEXP(&c_scg_graph));
    IGRAPH_I_DESTROY(&c_scg_graph);
  } else {
    PROTECT(scg_graph=R_NilValue);
  }
  if (do_scg_matrix) {
    PROTECT(scg_matrix=R_igraph_matrix_to_SEXP(&c_scg_matrix));
    igraph_matrix_destroy(&c_scg_matrix);
  } else {
    PROTECT(scg_matrix=R_NilValue);
  }
  if (do_scg_sparsemat) {
    PROTECT(scg_sparsemat=R_igraph_sparsemat_to_SEXP(&c_scg_sparsemat));
    igraph_sparsemat_destroy(&c_scg_sparsemat);
  } else {
    PROTECT(scg_sparsemat=R_NilValue);
  }
  if (do_L) {
    PROTECT(L=R_igraph_matrix_to_SEXP(&c_L));
    igraph_matrix_destroy(&c_L);
  } else {
    PROTECT(L=R_NilValue);
  }
  if (do_R) {
    PROTECT(R=R_igraph_matrix_to_SEXP(&c_R));
    igraph_matrix_destroy(&c_R);
  } else {
    PROTECT(R=R_NilValue);
  }
  if (do_Lsparse) {
    PROTECT(Lsparse=R_igraph_sparsemat_to_SEXP(&c_Lsparse));
    igraph_sparsemat_destroy(&c_Lsparse);
  } else {
    PROTECT(Lsparse=R_NilValue);
  }
  if (do_Rsparse) {
    PROTECT(Rsparse=R_igraph_sparsemat_to_SEXP(&c_Rsparse));
    igraph_sparsemat_destroy(&c_Rsparse);
  } else {
    PROTECT(Rsparse=R_NilValue);
  }

  if (do_scg_graph) { SET_VECTOR_ELT(result, 0, scg_graph); }
  if (do_scg_matrix) { SET_VECTOR_ELT(result, 0, scg_matrix); }
  if (do_scg_sparsemat) { SET_VECTOR_ELT(result, 0, scg_sparsemat); }
  SET_VECTOR_ELT(result, 1, groups);
  if (do_L) { SET_VECTOR_ELT(result, 2, L); }
  if (do_Lsparse) { SET_VECTOR_ELT(result, 2, Lsparse); }
  if (do_R) { SET_VECTOR_ELT(result, 3, R); }
  if (do_Rsparse) { SET_VECTOR_ELT(result, 3, Rsparse); }
  SET_VECTOR_ELT(result, 4, eval);
  SET_VECTOR_ELT(result, 5, evec);
  if (do_p) { SET_VECTOR_ELT(result, 6, p); }
  SET_STRING_ELT(names, 0, Rf_mkChar("Xt"));
  SET_STRING_ELT(names, 1, Rf_mkChar("groups"));
  SET_STRING_ELT(names, 2, Rf_mkChar("L"));
  SET_STRING_ELT(names, 3, Rf_mkChar("R"));
  SET_STRING_ELT(names, 4, Rf_mkChar("values"));
  SET_STRING_ELT(names, 5, Rf_mkChar("vectors"));
  SET_STRING_ELT(names, 6, Rf_mkChar("p"));
  SET_NAMES(result, names);
  UNPROTECT(12);

  UNPROTECT(1);
  return(result);
}

SEXP R_igraph_scg_laplacian(SEXP graph, SEXP matrix, SEXP sparsmat, SEXP ev,
                            SEXP intervals_vector, SEXP algorithm, SEXP norm,
                            SEXP direction, SEXP evec, SEXP groups,
                            SEXP use_arpack, SEXP maxiter, SEXP sparse,
                            SEXP output, SEXP semproj, SEXP epairs) {

                                        /* Declarations */
  igraph_t c_graph;
  igraph_matrix_t c_matrix;
  igraph_sparsemat_t c_sparsmat;
  igraph_vector_t c_ev;
  igraph_vector_t c_intervals_vector;
  igraph_integer_t c_algorithm=(igraph_integer_t) REAL(algorithm)[0];
  igraph_integer_t c_norm=(igraph_integer_t) REAL(norm)[0];
  igraph_integer_t c_direction=(igraph_integer_t) REAL(direction)[0];
  igraph_vector_complex_t c_eval;
  igraph_matrix_complex_t c_evec;
  igraph_vector_t c_groups;
  igraph_bool_t c_use_arpack=LOGICAL(use_arpack)[0];
  igraph_integer_t c_maxiter=INTEGER(maxiter)[0];
  igraph_bool_t c_sparse=LOGICAL(sparse)[0];
  igraph_real_t c_output=REAL(output)[0];
  igraph_bool_t c_semproj=LOGICAL(semproj)[0];
  igraph_bool_t c_epairs=LOGICAL(epairs)[0];
  igraph_t c_scg_graph;
  igraph_matrix_t c_scg_matrix;
  igraph_sparsemat_t c_scg_sparsemat;
  igraph_matrix_t c_L;
  igraph_matrix_t c_R;
  igraph_sparsemat_t c_Lsparse;
  igraph_sparsemat_t c_Rsparse;
  SEXP eval;
  SEXP scg_graph;
  SEXP scg_matrix;
  SEXP scg_sparsemat;
  SEXP L;
  SEXP R;
  SEXP Lsparse;
  SEXP Rsparse;
  SEXP result, names;
                                        /* What to return */
  igraph_bool_t do_scg_graph=
    (!Rf_isNull(graph) && c_output==1 /*default*/) || c_output==3 /*graph*/;
  igraph_bool_t do_scg_matrix=!c_sparse &&
    ((Rf_isNull(graph) && c_output==1 /*default*/) || c_output==2 /*matrix*/);
  igraph_bool_t do_scg_sparsemat=c_sparse &&
    ((Rf_isNull(graph) && c_output==1 /*default*/) || c_output==2 /*matrix*/);
  igraph_bool_t do_L=c_semproj && !c_sparse;
  igraph_bool_t do_R=c_semproj && !c_sparse;
  igraph_bool_t do_Lsparse=c_semproj && c_sparse;
  igraph_bool_t do_Rsparse=c_semproj && c_sparse;
  igraph_bool_t do_eval=c_epairs;
  igraph_bool_t do_evec=c_epairs;

                                        /* Convert input */
  if (!Rf_isNull(graph)) { R_SEXP_to_igraph(graph, &c_graph); }
  if (!Rf_isNull(matrix)) { R_SEXP_to_matrix(matrix, &c_matrix); }
  if (!Rf_isNull(sparsmat)) { R_SEXP_to_sparsemat(sparsmat, &c_sparsmat); }

  R_SEXP_to_vector(ev, &c_ev);
  R_SEXP_to_vector(intervals_vector, &c_intervals_vector);

  if (do_eval) { igraph_vector_complex_init(&c_eval, 0); }
  if (!Rf_isNull(evec)) {
    R_SEXP_to_matrix_complex_copy(evec, &c_evec);
  } else if (do_evec) {
    igraph_matrix_complex_init(&c_evec, 0, 0);
  }
  if (!Rf_isNull(groups)) {
    R_SEXP_to_vector_copy(groups, &c_groups);
  } else {
    igraph_vector_init(&c_groups, 0);
  }

  if (do_scg_matrix) { igraph_matrix_init(&c_scg_matrix, 0, 0); }
  if (do_L) { igraph_matrix_init(&c_L, 0, 0); }
  if (do_R) { igraph_matrix_init(&c_R, 0, 0); }

                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_scg_laplacian((Rf_isNull(graph) ? 0 : &c_graph), (Rf_isNull(matrix) ? 0 : &c_matrix), (Rf_isNull(sparsmat) ? 0 : &c_sparsmat), &c_ev, /*intervals=*/ 0, &c_intervals_vector, (igraph_scg_algorithm_t) c_algorithm, (igraph_scg_norm_t) c_norm, (igraph_scg_direction_t) c_direction, (do_eval ? &c_eval : 0), (!Rf_isNull(evec) || do_evec ? &c_evec : 0), &c_groups, c_use_arpack, c_maxiter, (do_scg_graph ? &c_scg_graph : 0), (do_scg_matrix ? &c_scg_matrix : 0), (do_scg_sparsemat ? &c_scg_sparsemat : 0), (do_L ? &c_L : 0), (do_R ? &c_R : 0), (do_Lsparse ? &c_Lsparse : 0), (do_Rsparse ? &c_Rsparse : 0)));

  if (!Rf_isNull(sparsmat)) { igraph_free(c_sparsmat.cs); }

                                        /* Convert output */
  PROTECT(result=NEW_LIST(6));
  PROTECT(names=NEW_CHARACTER(6));

  if (do_eval) {
    PROTECT(eval=R_igraph_vector_complex_to_SEXP(&c_eval));
    igraph_vector_complex_destroy(&c_eval);
  } else {
    PROTECT(eval=R_NilValue);
  }

  if (do_evec) {
    PROTECT(evec=R_igraph_matrix_complex_to_SEXP(&c_evec));
    igraph_matrix_complex_destroy(&c_evec);
  } else {
    PROTECT(evec=R_NilValue);
  }

  PROTECT(groups=R_igraph_vector_to_SEXPp1(&c_groups));
  igraph_vector_destroy(&c_groups);

  if (do_scg_graph) {
    PROTECT(scg_graph=R_igraph_to_SEXP(&c_scg_graph));
    IGRAPH_I_DESTROY(&c_scg_graph);
  } else {
    PROTECT(scg_graph=R_NilValue);
  }
  if (do_scg_matrix) {
    PROTECT(scg_matrix=R_igraph_matrix_to_SEXP(&c_scg_matrix));
    igraph_matrix_destroy(&c_scg_matrix);
  } else {
    PROTECT(scg_matrix=R_NilValue);
  }
  if (do_scg_sparsemat) {
    PROTECT(scg_sparsemat=R_igraph_sparsemat_to_SEXP(&c_scg_sparsemat));
    igraph_sparsemat_destroy(&c_scg_sparsemat);
  } else {
    PROTECT(scg_sparsemat=R_NilValue);
  }
  if (do_L) {
    PROTECT(L=R_igraph_matrix_to_SEXP(&c_L));
    igraph_matrix_destroy(&c_L);
  } else {
    PROTECT(L=R_NilValue);
  }
  if (do_R) {
    PROTECT(R=R_igraph_matrix_to_SEXP(&c_R));
    igraph_matrix_destroy(&c_R);
  } else {
    PROTECT(R=R_NilValue);
  }
  if (do_Lsparse) {
    PROTECT(Lsparse=R_igraph_sparsemat_to_SEXP(&c_Lsparse));
    igraph_sparsemat_destroy(&c_Lsparse);
  } else {
    PROTECT(Lsparse=R_NilValue);
  }
  if (do_Rsparse) {
    PROTECT(Rsparse=R_igraph_sparsemat_to_SEXP(&c_Rsparse));
    igraph_sparsemat_destroy(&c_Rsparse);
  } else {
    PROTECT(Rsparse=R_NilValue);
  }

  if (do_scg_graph) { SET_VECTOR_ELT(result, 0, scg_graph); }
  if (do_scg_matrix) { SET_VECTOR_ELT(result, 0, scg_matrix); }
  if (do_scg_sparsemat) { SET_VECTOR_ELT(result, 0, scg_sparsemat); }
  SET_VECTOR_ELT(result, 1, groups);
  if (do_L) { SET_VECTOR_ELT(result, 2, L); }
  if (do_Lsparse) { SET_VECTOR_ELT(result, 2, Lsparse); }
  if (do_R) { SET_VECTOR_ELT(result, 3, R); }
  if (do_Rsparse) { SET_VECTOR_ELT(result, 3, Rsparse); }
  SET_VECTOR_ELT(result, 4, eval);
  SET_VECTOR_ELT(result, 5, evec);
  SET_STRING_ELT(names, 0, Rf_mkChar("Xt"));
  SET_STRING_ELT(names, 1, Rf_mkChar("groups"));
  SET_STRING_ELT(names, 2, Rf_mkChar("L"));
  SET_STRING_ELT(names, 3, Rf_mkChar("R"));
  SET_STRING_ELT(names, 4, Rf_mkChar("values"));
  SET_STRING_ELT(names, 5, Rf_mkChar("vectors"));
  SET_NAMES(result, names);
  UNPROTECT(11);

  UNPROTECT(1);
  return(result);
}

SEXP R_igraph_subisomorphic_lad(SEXP pattern, SEXP target, SEXP domains,
                                SEXP induced, SEXP time_limit,
                                SEXP pqmap, SEXP pqall_maps) {
                                        /* Declarations */
  igraph_t c_pattern;
  igraph_t c_target;
  igraph_vector_ptr_t c_domains;
  igraph_bool_t c_iso;
  igraph_vector_t c_map;
  igraph_vector_ptr_t c_maps;
  igraph_bool_t c_induced;
  int c_time_limit;
  igraph_bool_t c_qmap;
  igraph_bool_t c_qall_maps;
  SEXP iso;
  SEXP map;
  SEXP maps;

  SEXP result, names;
                                        /* Convert input */
  R_SEXP_to_igraph(pattern, &c_pattern);
  R_SEXP_to_igraph(target, &c_target);

  R_igraph_SEXP_to_0orvectorlist(domains, &c_domains);

  c_qmap=LOGICAL(pqmap)[0];
  c_qall_maps=LOGICAL(pqall_maps)[0];
  if (c_qmap) {
    if (0 != igraph_vector_init(&c_map, 0)) {
      igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
    }
    IGRAPH_FINALLY(igraph_vector_destroy, &c_map);
    map=R_GlobalEnv; /* hack to have a non-NULL value */
  } else {
    map=R_NilValue;
  }

  if (c_qall_maps) {
    if (0 != igraph_vector_ptr_init(&c_maps, 0)) {
      igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
    }
    IGRAPH_FINALLY(R_igraph_vectorlist_destroy, &c_maps);
    maps=R_GlobalEnv; /* hack to have a non-NULL value */
  } else {
    maps=R_NilValue;
  }

  c_induced=LOGICAL(induced)[0];
  c_time_limit=INTEGER(time_limit)[0];
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_subisomorphic_lad(&c_pattern, &c_target, (Rf_isNull(domains) ? 0 : &c_domains), &c_iso, (Rf_isNull(map) ? 0 : &c_map), (Rf_isNull(maps) ? 0 : &c_maps), c_induced, c_time_limit));

                                        /* Convert output */
  PROTECT(result=NEW_LIST(3));
  PROTECT(names=NEW_CHARACTER(3));
  PROTECT(iso=NEW_LOGICAL(1));
  LOGICAL(iso)[0]=c_iso;
  if (!Rf_isNull(map)) {
    PROTECT(map=R_igraph_0orvector_to_SEXP(&c_map));
    igraph_vector_destroy(&c_map);
    IGRAPH_FINALLY_CLEAN(1);
  } else {
    PROTECT(map=R_NilValue);
  }
  if (!Rf_isNull(maps)) {
    PROTECT(maps=R_igraph_0orvectorlist_to_SEXP(&c_maps));
    R_igraph_vectorlist_destroy(&c_maps);
    IGRAPH_FINALLY_CLEAN(1);
  } else {
    PROTECT(maps=R_NilValue);
  }
  SET_VECTOR_ELT(result, 0, iso);
  SET_VECTOR_ELT(result, 1, map);
  SET_VECTOR_ELT(result, 2, maps);
  SET_STRING_ELT(names, 0, Rf_mkChar("iso"));
  SET_STRING_ELT(names, 1, Rf_mkChar("map"));
  SET_STRING_ELT(names, 2, Rf_mkChar("maps"));
  SET_NAMES(result, names);
  UNPROTECT(4);

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
  / igraph_graphlets                           /
  /-------------------------------------------*/
SEXP R_igraph_graphlets(SEXP graph, SEXP weights, SEXP niter) {
  /* Declarations */
  igraph_t c_graph;
  igraph_vector_t c_weights;
  igraph_vector_ptr_t c_cliques;
  igraph_vector_t c_Mu;
  int c_niter;
  SEXP cliques;
  SEXP Mu;
  SEXP result, names;

  R_PreserveObject(R_igraph_attribute_protected=NEW_LIST(100));
  R_igraph_attribute_protected_size=0;
  IGRAPH_FINALLY(R_igraph_attribute_protected_destroy, 0);

  /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (!Rf_isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
  if (0 != igraph_vector_ptr_init(&c_cliques, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(R_igraph_vectorlist_destroy, &c_cliques);
  if (0 != igraph_vector_init(&c_Mu, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_Mu);
  c_niter=INTEGER(niter)[0];
  /* Call igraph */
  IGRAPH_R_CHECK(igraph_graphlets(&c_graph, (Rf_isNull(weights) ? 0 : &c_weights), &c_cliques, &c_Mu, c_niter));

  /* Convert output */
  PROTECT(result=NEW_LIST(2));
  PROTECT(names=NEW_CHARACTER(2));
  PROTECT(cliques=R_igraph_vectorlist_to_SEXP_p1(&c_cliques));
  R_igraph_vectorlist_destroy(&c_cliques);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(Mu=R_igraph_vector_to_SEXP(&c_Mu));
  igraph_vector_destroy(&c_Mu);
  IGRAPH_FINALLY_CLEAN(1);
  SET_VECTOR_ELT(result, 0, cliques);
  SET_VECTOR_ELT(result, 1, Mu);
  SET_STRING_ELT(names, 0, Rf_mkChar("cliques"));
  SET_STRING_ELT(names, 1, Rf_mkChar("Mu"));
  SET_NAMES(result, names);

  UNPROTECT(4);
  IGRAPH_FINALLY_CLEAN(1);
  R_igraph_attribute_protected_destroy(0);

  return(result);
}

/*-------------------------------------------/
/ igraph_graphlets_candidate_basis           /
/-------------------------------------------*/
SEXP R_igraph_graphlets_candidate_basis(SEXP graph, SEXP weights) {
  /* Declarations */
  igraph_t c_graph;
  igraph_vector_t c_weights;
  igraph_vector_ptr_t c_cliques;
  igraph_vector_t c_thresholds;
  SEXP cliques;
  SEXP thresholds;

  SEXP result, names;

  R_PreserveObject(R_igraph_attribute_protected=NEW_LIST(100));
  R_igraph_attribute_protected_size=0;
  IGRAPH_FINALLY(R_igraph_attribute_protected_destroy, 0);

  /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (!Rf_isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
  if (0 != igraph_vector_ptr_init(&c_cliques, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(R_igraph_vectorlist_destroy, &c_cliques);
  if (0 != igraph_vector_init(&c_thresholds, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_thresholds);
  /* Call igraph */
  IGRAPH_R_CHECK(igraph_graphlets_candidate_basis(&c_graph, (Rf_isNull(weights) ? 0 : &c_weights), &c_cliques, &c_thresholds));

  /* Convert output */
  PROTECT(result=NEW_LIST(2));
  PROTECT(names=NEW_CHARACTER(2));
  PROTECT(cliques=R_igraph_vectorlist_to_SEXP_p1(&c_cliques));
  R_igraph_vectorlist_destroy(&c_cliques);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(thresholds=R_igraph_vector_to_SEXP(&c_thresholds));
  igraph_vector_destroy(&c_thresholds);
  IGRAPH_FINALLY_CLEAN(1);
  SET_VECTOR_ELT(result, 0, cliques);
  SET_VECTOR_ELT(result, 1, thresholds);
  SET_STRING_ELT(names, 0, Rf_mkChar("cliques"));
  SET_STRING_ELT(names, 1, Rf_mkChar("thresholds"));
  SET_NAMES(result, names);

  UNPROTECT(4);
  IGRAPH_FINALLY_CLEAN(1);
  R_igraph_attribute_protected_destroy(0);

  return(result);
}

int igraph_i_graphlets_project(const igraph_t *graph,
                               const igraph_vector_t *weights,
                               const igraph_vector_ptr_t *cliques,
                               igraph_vector_t *Mu, igraph_bool_t startMu,
                               int niter, int vid1);

/*-------------------------------------------/
/ igraph_graphlets_project                   /
/-------------------------------------------*/

SEXP R_igraph_graphlets_project(SEXP graph, SEXP weights, SEXP cliques,
                                SEXP Mu, SEXP niter) {
  /* Declarations */
  igraph_t c_graph;
  igraph_vector_t c_weights;
  igraph_vector_ptr_t c_cliques;
  igraph_vector_t c_Mu;
  int c_niter;

  SEXP result;

  /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (!Rf_isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
  if (!Rf_isNull(cliques)) { R_igraph_SEXP_to_vectorlist(cliques, &c_cliques); }
  if (0 != R_SEXP_to_vector_copy(Mu, &c_Mu)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_Mu);
  c_niter=INTEGER(niter)[0];

  /* TODO: Change igraph_i_graphlets_project to igraph_graphlets_project, because
   * we should not depend on non-public functions from igraph.
   */
  /* Call igraph */
  igraph_i_graphlets_project(&c_graph, (Rf_isNull(weights) ? 0 : &c_weights),
                             &c_cliques, &c_Mu, /*startMu=*/ 1, c_niter,
                             /*vid1=*/ 1);

  /* Convert output */
  PROTECT(Mu=R_igraph_vector_to_SEXP(&c_Mu));
  igraph_vector_destroy(&c_Mu);
  IGRAPH_FINALLY_CLEAN(1);
  result=Mu;

  UNPROTECT(1);
  return(result);
}


SEXP R_igraph_adjacency_spectral_embedding(SEXP graph, SEXP no,
                                           SEXP pweights, SEXP pwhich,
                                           SEXP scaled, SEXP cvec,
                                           SEXP options) {

                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_t weights;
  igraph_eigen_which_position_t c_which;
  igraph_integer_t c_no;
  igraph_bool_t c_scaled;
  igraph_matrix_t c_X;
  igraph_matrix_t c_Y;
  igraph_vector_t c_D;
  igraph_vector_t c_cvec;
  igraph_arpack_options_t c_options;
  SEXP X;
  SEXP Y;
  SEXP D;
  igraph_bool_t directed;

  SEXP result, names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  directed=igraph_is_directed(&c_graph);
  if (!Rf_isNull(pweights)) {
    R_SEXP_to_vector(pweights, &weights);
  }
  c_which=INTEGER(pwhich)[0];
  c_no=INTEGER(no)[0];
  c_scaled=LOGICAL(scaled)[0];
  if (0 != igraph_matrix_init(&c_X, 0, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_matrix_destroy, &c_X);
  if (directed) {
    if (0 != igraph_matrix_init(&c_Y, 0, 0)) {
      igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
    }
    IGRAPH_FINALLY(igraph_matrix_destroy, &c_Y);
  }
  if (0 != igraph_vector_init(&c_D, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_D);
  R_SEXP_to_vector(cvec, &c_cvec);
  R_SEXP_to_igraph_arpack_options(options, &c_options);

/* Call igraph */
  IGRAPH_R_CHECK(igraph_adjacency_spectral_embedding(&c_graph, c_no, Rf_isNull(pweights) ? 0 : &weights, c_which, c_scaled, &c_X, directed ? &c_Y : 0, &c_D, &c_cvec, &c_options));

  /* Convert output */
  PROTECT(result=NEW_LIST(4));
  PROTECT(names=NEW_CHARACTER(4));
  PROTECT(X=R_igraph_matrix_to_SEXP(&c_X));
  igraph_matrix_destroy(&c_X);
  IGRAPH_FINALLY_CLEAN(1);
  if (directed) {
    PROTECT(Y=R_igraph_matrix_to_SEXP(&c_Y));
    igraph_matrix_destroy(&c_Y);
    IGRAPH_FINALLY_CLEAN(1);
  } else {
    PROTECT(Y=R_NilValue);
  }
  PROTECT(D=R_igraph_vector_to_SEXP(&c_D));
  igraph_vector_destroy(&c_D);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(options=R_igraph_arpack_options_to_SEXP(&c_options));
  SET_VECTOR_ELT(result, 0, X);
  SET_VECTOR_ELT(result, 1, Y);
  SET_VECTOR_ELT(result, 2, D);
  SET_VECTOR_ELT(result, 3, options);
  SET_STRING_ELT(names, 0, Rf_mkChar("X"));
  SET_STRING_ELT(names, 1, Rf_mkChar("Y"));
  SET_STRING_ELT(names, 2, Rf_mkChar("D"));
  SET_STRING_ELT(names, 3, Rf_mkChar("options"));
  SET_NAMES(result, names);
  UNPROTECT(5);

  UNPROTECT(1);
  return(result);
}

SEXP R_igraph_laplacian_spectral_embedding(SEXP graph, SEXP no,
                                          SEXP weights, SEXP which,
                                          SEXP type,
                                          SEXP scaled, SEXP options) {
  /* Declarations */
  igraph_t c_graph;
  igraph_integer_t c_no;
  igraph_vector_t c_weights;
  igraph_eigen_which_position_t c_which;
  igraph_laplacian_spectral_embedding_type_t c_type;
  igraph_bool_t c_scaled;
  igraph_matrix_t c_X;
  igraph_matrix_t c_Y;
  igraph_vector_t c_D;
  igraph_arpack_options_t c_options;
  SEXP X;
  SEXP Y;
  SEXP D;
  igraph_bool_t directed;

  SEXP result, names;
  /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  directed=igraph_is_directed(&c_graph);
  c_no=INTEGER(no)[0];
  if (!Rf_isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
  c_which=INTEGER(which)[0];
  c_type=(igraph_laplacian_spectral_embedding_type_t) INTEGER(type)[0];
  c_scaled=LOGICAL(scaled)[0];
  if (0 != igraph_matrix_init(&c_X, 0, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_matrix_destroy, &c_X);
  if (directed) {
    if (0 != igraph_matrix_init(&c_Y, 0, 0)) {
      igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
    }
    IGRAPH_FINALLY(igraph_matrix_destroy, &c_Y);
  }
  if (0 != igraph_vector_init(&c_D, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_D);
  R_SEXP_to_igraph_arpack_options(options, &c_options);
  /* Call igraph */
  IGRAPH_R_CHECK(igraph_laplacian_spectral_embedding(&c_graph, c_no, (Rf_isNull(weights) ? 0 : &c_weights), c_which, c_type, c_scaled, &c_X, directed ? &c_Y : 0, &c_D, &c_options));

  /* Convert output */
  PROTECT(result=NEW_LIST(4));
  PROTECT(names=NEW_CHARACTER(4));
  PROTECT(X=R_igraph_matrix_to_SEXP(&c_X));
  igraph_matrix_destroy(&c_X);
  IGRAPH_FINALLY_CLEAN(1);
  if (directed) {
    PROTECT(Y=R_igraph_matrix_to_SEXP(&c_Y));
    igraph_matrix_destroy(&c_Y);
    IGRAPH_FINALLY_CLEAN(1);
  } else {
    PROTECT(Y=R_NilValue);
  }
  PROTECT(D=R_igraph_0orvector_to_SEXP(&c_D));
  igraph_vector_destroy(&c_D);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(options=R_igraph_arpack_options_to_SEXP(&c_options));
  SET_VECTOR_ELT(result, 0, X);
  SET_VECTOR_ELT(result, 1, Y);
  SET_VECTOR_ELT(result, 2, D);
  SET_VECTOR_ELT(result, 3, options);
  SET_STRING_ELT(names, 0, Rf_mkChar("X"));
  SET_STRING_ELT(names, 1, Rf_mkChar("Y"));
  SET_STRING_ELT(names, 2, Rf_mkChar("D"));
  SET_STRING_ELT(names, 3, Rf_mkChar("options"));
  SET_NAMES(result, names);
  UNPROTECT(5);

  UNPROTECT(1);
  return(result);
}

SEXP R_igraph_simple_interconnected_islands_game(SEXP islands_n, SEXP islands_size, SEXP islands_pin, SEXP n_inter) {

  igraph_t g;
  igraph_integer_t a=INTEGER(islands_n)[0];
  igraph_integer_t b=INTEGER(islands_size)[0];
  igraph_real_t c=REAL(islands_pin)[0];
  igraph_integer_t d=INTEGER(n_inter)[0];
  SEXP result;

  IGRAPH_R_CHECK(igraph_simple_interconnected_islands_game(&g, a, b, c, d));
  PROTECT(result=R_igraph_to_SEXP(&g));
  IGRAPH_I_DESTROY(&g);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_version(void) {
  const char *version;
  SEXP result;
  igraph_version(&version, /*major=*/ 0, /*minor=*/ 0, /*patch=*/ 0);
  PROTECT(result=NEW_CHARACTER(1));
  SET_STRING_ELT(result, 0, Rf_mkChar(version));
  UNPROTECT(1);
  return result;
}

SEXP R_igraph_bipartite_projection(SEXP graph, SEXP types, SEXP probe1,
                                   SEXP pwhich) {
  /* Declarations */
  igraph_t c_graph;
  igraph_vector_bool_t c_types;
  igraph_t c_proj1;
  igraph_t c_proj2;
  igraph_vector_t c_multiplicity1;
  igraph_vector_t c_multiplicity2;
  igraph_integer_t c_probe1;
  igraph_integer_t which=INTEGER(pwhich)[0];
  igraph_bool_t do_1=(which == 0 || which == 1);
  igraph_bool_t do_2=(which == 0 || which == 2);
  SEXP proj1;
  SEXP proj2;
  SEXP multiplicity1;
  SEXP multiplicity2;

  SEXP result, names;
  /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (!Rf_isNull(types)) { R_SEXP_to_vector_bool(types, &c_types); }
  if (0 != igraph_vector_init(&c_multiplicity1, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_multiplicity1);
  multiplicity1 = R_GlobalEnv; /* hack to have a non-NULL value */
  if (0 != igraph_vector_init(&c_multiplicity2, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_multiplicity2);
  multiplicity2=R_GlobalEnv; /* hack to have a non-NULL value */
  c_probe1=INTEGER(probe1)[0];
  /* Call igraph */
  IGRAPH_R_CHECK(igraph_bipartite_projection(&c_graph, (Rf_isNull(types) ? 0 : &c_types), do_1 ? &c_proj1 : 0, do_2 ? &c_proj2 : 0, (Rf_isNull(multiplicity1) ? 0 : &c_multiplicity1), (Rf_isNull(multiplicity2) ? 0 : &c_multiplicity2), c_probe1));

  /* Convert output */
  PROTECT(result=NEW_LIST(4));
  PROTECT(names=NEW_CHARACTER(4));
  if (do_1) {
    IGRAPH_FINALLY(igraph_destroy, &c_proj1);
    PROTECT(proj1=R_igraph_to_SEXP(&c_proj1));
    IGRAPH_I_DESTROY(&c_proj1);
    IGRAPH_FINALLY_CLEAN(1);
  } else {
    PROTECT(proj1=R_NilValue);
  }
  if (do_2) {
    IGRAPH_FINALLY(igraph_destroy, &c_proj2);
    PROTECT(proj2=R_igraph_to_SEXP(&c_proj2));
    IGRAPH_I_DESTROY(&c_proj2);
    IGRAPH_FINALLY_CLEAN(1);
  } else {
    PROTECT(proj2=R_NilValue);
  }
  PROTECT(multiplicity1=R_igraph_0orvector_to_SEXP(&c_multiplicity1));
  igraph_vector_destroy(&c_multiplicity1);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(multiplicity2=R_igraph_0orvector_to_SEXP(&c_multiplicity2));
  igraph_vector_destroy(&c_multiplicity2);
  IGRAPH_FINALLY_CLEAN(1);
  SET_VECTOR_ELT(result, 0, proj1);
  SET_VECTOR_ELT(result, 1, proj2);
  SET_VECTOR_ELT(result, 2, multiplicity1);
  SET_VECTOR_ELT(result, 3, multiplicity2);
  SET_STRING_ELT(names, 0, Rf_mkChar("proj1"));
  SET_STRING_ELT(names, 1, Rf_mkChar("proj2"));
  SET_STRING_ELT(names, 2, Rf_mkChar("multiplicity1"));
  SET_STRING_ELT(names, 3, Rf_mkChar("multiplicity2"));
  SET_NAMES(result, names);
  UNPROTECT(5);

  UNPROTECT(1);
  return(result);
}

SEXP R_igraph_solve_lsap(SEXP px, SEXP pnc) {

  igraph_matrix_t x;
  igraph_integer_t nc = INTEGER(pnc)[0];
  igraph_vector_int_t p;
  SEXP result;

  R_SEXP_to_matrix(px, &x);

  igraph_vector_int_init(&p, nc);
  IGRAPH_FINALLY(igraph_vector_int_destroy, &p);

  igraph_solve_lsap(&x, nc, &p);

  PROTECT(result = R_igraph_vector_int_to_SEXP(&p));
  igraph_vector_int_destroy(&p);
  IGRAPH_FINALLY_CLEAN(1);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_adjacent_vertices(SEXP pgraph, SEXP pv, SEXP pmode) {

  igraph_t graph;
  igraph_vs_t vs;
  igraph_vit_t vit;
  igraph_integer_t mode = (igraph_integer_t) REAL(pmode)[0];
  SEXP result;
  size_t i, n;
  igraph_lazy_adjlist_t adjlist;

  R_SEXP_to_igraph(pgraph, &graph);
  R_SEXP_to_igraph_vs(pv, &graph, &vs);
  IGRAPH_FINALLY(igraph_vs_destroy, &vs);

  igraph_vit_create(&graph, vs, &vit);
  IGRAPH_FINALLY(igraph_vit_destroy, &vit);
  n = IGRAPH_VIT_SIZE(vit);

  igraph_lazy_adjlist_init(
    &graph, &adjlist, mode,
    /* loops = */ IGRAPH_LOOPS_TWICE,
    /* multiple = */ IGRAPH_MULTIPLE
  );
  IGRAPH_FINALLY(igraph_lazy_adjlist_destroy, &adjlist);

  PROTECT(result = NEW_LIST(n));
  for (IGRAPH_VIT_RESET(vit), i=0;
       !IGRAPH_VIT_END(vit);
       IGRAPH_VIT_NEXT(vit), i++) {
    long int vid = IGRAPH_VIT_GET(vit);
    igraph_vector_int_t *neis = igraph_lazy_adjlist_get(&adjlist, vid);
    SET_VECTOR_ELT(result, i, R_igraph_vector_int_to_SEXP(neis));
  }

  igraph_lazy_adjlist_destroy(&adjlist);
  igraph_vit_destroy(&vit);
  igraph_vs_destroy(&vs);
  IGRAPH_FINALLY_CLEAN(3);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_incident_edges(SEXP pgraph, SEXP pe, SEXP pmode) {

  igraph_t graph;
  igraph_vs_t vs;
  igraph_vit_t vit;
  igraph_integer_t mode = (igraph_integer_t) REAL(pmode)[0];
  SEXP result;
  size_t i, n;
  igraph_lazy_inclist_t adjlist;

  R_SEXP_to_igraph(pgraph, &graph);
  R_SEXP_to_igraph_vs(pe, &graph, &vs);
  IGRAPH_FINALLY(igraph_vs_destroy, &vs);

  igraph_vit_create(&graph, vs, &vit);
  IGRAPH_FINALLY(igraph_vit_destroy, &vit);
  n = IGRAPH_VIT_SIZE(vit);

  igraph_lazy_inclist_init(&graph, &adjlist, mode, IGRAPH_LOOPS_TWICE);
  IGRAPH_FINALLY(igraph_lazy_inclist_destroy, &adjlist);

  PROTECT(result = NEW_LIST(n));
  for (IGRAPH_VIT_RESET(vit), i=0;
       !IGRAPH_VIT_END(vit);
       IGRAPH_VIT_NEXT(vit), i++) {
    long int eid = IGRAPH_VIT_GET(vit);
    igraph_vector_int_t *neis = igraph_lazy_inclist_get(&adjlist, eid);
    SET_VECTOR_ELT(result, i, R_igraph_vector_int_to_SEXP(neis));
  }

  igraph_lazy_inclist_destroy(&adjlist);
  igraph_vit_destroy(&vit);
  igraph_vs_destroy(&vs);
  IGRAPH_FINALLY_CLEAN(3);

  UNPROTECT(1);
  return result;
}

/* +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++C */
/*                                                               C */
/*  Given a HIERARCHIC CLUSTERING, described as a sequence of    C */
/*  agglomerations, prepare the seq. of aggloms. and "horiz."    C */
/*  order of objects for plotting the dendrogram using S routine C */
/*  'plclust'.                                                   C */
/*                                                               C */
/*  Parameters:                                                  C */
/*                                                               C */
/*  IA, IB:       vectors of dimension N defining the agglomer-  C */
/*                 ations.                                       C */
/*  IIA, IIB:     used to store IA and IB values differently     C */
/*                (in form needed for S command 'plclust'        C */
/*  IORDER:       "horiz." order of objects for dendrogram       C */
/*                                                               C */
/*  F. Murtagh, ESA/ESO/STECF, Garching, June 1991               C */
/*                                                               C */
/*  HISTORY                                                      C */
/*                                                               C */
/*  Adapted from routine HCASS, which additionally determines    C */
/*   cluster assignments at all levels, at extra comput. expense C */
/*                                                               C */
/* ---------------------------------------------------------------C */

int igraphhcass2(int n, const int *ia, const int *ib,
		 int *iorder, int *iia,
		 int *iib) {

  /* System generated locals */
  int i__1, i__2, i__3;

  /* Local variables */
  static int i__, j, k, k1, k2, loc;

  /* Args */
  /* Var */

  /* Following bit is to get seq. of merges into format acceptable to
     plclust I coded clusters as lowest seq. no. of constituents; S's
     'hclust' codes singletons as -ve numbers, and non-singletons with
     their seq. nos. */

  /* Parameter adjustments */
  --iib;
  --iia;
  --iorder;
  --ib;
  --ia;

  /* Function Body */
  i__1 = n;
  for (i__ = 1; i__ <= i__1; ++i__) {
    iia[i__] = ia[i__];
    iib[i__] = ib[i__];
  }
  i__1 = n - 2;
  for (i__ = 1; i__ <= i__1; ++i__) {
    /*        In the following, smallest (+ve or -ve) seq. no. wanted */
    /* Computing MIN */
    i__2 = ia[i__], i__3 = ib[i__];
    k = i__2 < i__3 ? i__2 : i__3;
    i__2 = n - 1;
    for (j = i__ + 1; j <= i__2; ++j) {
      if (ia[j] == k) {
	iia[j] = -i__;
      }
      if (ib[j] == k) {
	iib[j] = -i__;
      }
    }
  }
  i__1 = n - 1;
  for (i__ = 1; i__ <= i__1; ++i__) {
    iia[i__] = -iia[i__];
    iib[i__] = -iib[i__];
  }
  i__1 = n - 1;
  for (i__ = 1; i__ <= i__1; ++i__) {
    if (iia[i__] > 0 && iib[i__] < 0) {
      k = iia[i__];
      iia[i__] = iib[i__];
      iib[i__] = k;
    }
    if (iia[i__] > 0 && iib[i__] > 0) {
      /* Computing MIN */
      i__2 = iia[i__], i__3 = iib[i__];
      k1 = i__2 < i__3 ? i__2 : i__3;
      /* Computing MAX */
      i__2 = iia[i__], i__3 = iib[i__];
      k2 = i__2 > i__3 ? i__2 : i__3;
      iia[i__] = k1;
      iib[i__] = k2;
    }
  }

  /*     NEW PART FOR 'ORDER' */

  iorder[1] = iia[n - 1];
  iorder[2] = iib[n - 1];
  loc = 2;
  for (i__ = n - 2; i__ >= 1; --i__) {
    i__1 = loc;
    for (j = 1; j <= i__1; ++j) {
      if (iorder[j] == i__) {
	/*      REPLACE IORDER(J) WITH IIA(I) AND IIB(I) */
	iorder[j] = iia[i__];
	if (j == loc) {
	  ++loc;
	  iorder[loc] = iib[i__];
	} else {
	  ++loc;
	  i__2 = j + 2;
	  for (k = loc; k >= i__2; --k) {
	    iorder[k] = iorder[k - 1];
	  }
	  iorder[j + 1] = iib[i__];
	}
	goto L171;
      }
    }
    /*     SHOULD NEVER REACH HERE */
  L171:
    ;
  }

  i__1 = n;
  for (i__ = 1; i__ <= i__1; ++i__) {
    iorder[i__] = -iorder[i__];
  }

  return 0;
} /* hcass2_ */

SEXP R_igraph_get_all_simple_paths_pp(SEXP vector) {
  SEXP result;
  int i, no=0, n=GET_LENGTH(vector);
  int *vec=INTEGER(vector), *p=vec, *pp=vec;
  for (i=0; i<n; i++) {
    if (vec[i] == 0) { no++; }
  }

  PROTECT(result=NEW_LIST(no));
  for (i=0; i<no; i++) {
    SEXP svec;
    while (*p != 0) { p++; }
    SET_VECTOR_ELT(result, i, svec=NEW_INTEGER(p-pp));
    memcpy(INTEGER(svec), pp, (p-pp) * sizeof(int));
    pp = ++p;
  }

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_address(SEXP object) {
  char s[64];
  snprintf(s, 64, "%p", (void*) object);
  return Rf_ScalarString(Rf_mkChar(s));
}

SEXP R_igraph_make_weak_ref(SEXP key, SEXP value, SEXP finalizer) {
  return R_MakeWeakRef(key, value, finalizer, Rf_isNull(finalizer) ? 0 : 1);
}

SEXP R_igraph_weak_ref_key(SEXP ref) {
  return R_WeakRefKey(ref);
}

SEXP R_igraph_weak_ref_value(SEXP ref) {
  return R_WeakRefValue(ref);
}

SEXP R_igraph_weak_ref_run_finalizer(SEXP ref) {
  R_RunWeakRefFinalizer(ref);
  return R_NilValue;
}

SEXP R_igraph_identical_graphs(SEXP g1, SEXP g2, SEXP attrs) {
  int i;
  int n = LOGICAL(attrs)[0] ? igraph_t_idx_attr + 1 : igraph_t_idx_attr;
  for (i = 0; i < n; i++) {
    if (!R_compute_identical(VECTOR_ELT(g1, i), VECTOR_ELT(g2, i), 0)) {
      return Rf_ScalarLogical(0);
    }
  }
  return Rf_ScalarLogical(1);
}

SEXP R_igraph_graph_version(SEXP graph) {
  if (GET_LENGTH(graph) == 11) {
    return Rf_ScalarInteger(ver_0_1_1);
  }

  if (GET_LENGTH(graph) != igraph_t_idx_max || !Rf_isEnvironment(R_igraph_graph_env(graph))) {
    return Rf_ScalarInteger(ver_0_4);
  }

  SEXP ver = Rf_findVar(Rf_install(R_IGRAPH_VERSION_VAR), R_igraph_graph_env(graph));
  if (ver == R_UnboundValue) {
    return Rf_ScalarInteger(ver_0_7_999);
  }

  if (TYPEOF(ver) == STRSXP) {
    return Rf_ScalarInteger(ver_0_8);
  }

  return ver;
}

SEXP R_igraph_add_myid_to_env(SEXP graph) {
  uuid_t my_id;
  char my_id_chr[40];

  uuid_generate(my_id);
  uuid_unparse_lower(my_id, my_id_chr);
  SEXP l1 = PROTECT(Rf_install("myid"));
  SEXP l2 = PROTECT(Rf_mkString(my_id_chr));
  Rf_defineVar(l1, l2, R_igraph_graph_env(graph));
  UNPROTECT(2);

  return graph;
}

SEXP R_igraph_add_version_to_env(SEXP graph) {
  SEXP l1 = PROTECT(Rf_install(R_IGRAPH_VERSION_VAR));
  SEXP l2 = PROTECT(Rf_ScalarInteger(ver_current));
  Rf_defineVar(l1, l2, R_igraph_graph_env(graph));
  UNPROTECT(2);

  return graph;
}

SEXP R_igraph_add_env(SEXP graph) {
  SEXP result = graph;
  int i;
  uuid_t my_id;
  char my_id_chr[40];
  int px = 0;

  if (GET_LENGTH(graph) <= igraph_t_idx_env) {
    PROTECT(result = NEW_LIST(igraph_t_idx_max)); px++;
    for (i = 0; i < igraph_t_idx_env; i++) {
      SET_VECTOR_ELT(result, i, Rf_duplicate(VECTOR_ELT(graph, i)));
    }
    SET_ATTRIB(result, Rf_duplicate(ATTRIB(graph)));
    SET_CLASS(result, Rf_duplicate(GET_CLASS(graph)));
  }

  SET_VECTOR_ELT(result, igraph_t_idx_env, Rf_allocSExp(ENVSXP));

  uuid_generate(my_id);
  uuid_unparse_lower(my_id, my_id_chr);

  SEXP l1 = PROTECT(Rf_install("myid")); px++;
  SEXP l2 = PROTECT(Rf_mkString(my_id_chr)); px++;
  Rf_defineVar(l1, l2, R_igraph_graph_env(result));

  l1 = PROTECT(Rf_install(R_IGRAPH_VERSION_VAR)); px++;
  l2 = PROTECT(Rf_ScalarInteger(ver_current)); px++;
  Rf_defineVar(l1, l2, R_igraph_graph_env(result));

  l1 = PROTECT(Rf_install("igraph")); px++;
  Rf_defineVar(l1, R_NilValue, R_igraph_graph_env(result));

  UNPROTECT(px);

  return result;
}

SEXP R_igraph_get_graph_id(SEXP graph) {
  return Rf_findVar(Rf_install("myid"), R_igraph_graph_env(graph));
}
