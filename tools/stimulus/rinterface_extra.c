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

#include <R.h>
#include <Rinternals.h>
#include <Rdefines.h>

#include "rinterface.h"

#include <stdlib.h>

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

int igraphhcass2(int *n, int *ia, int *ib, 
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
  i__1 = *n;
  for (i__ = 1; i__ <= i__1; ++i__) {
    iia[i__] = ia[i__];
    iib[i__] = ib[i__];
  }
  i__1 = *n - 2;
  for (i__ = 1; i__ <= i__1; ++i__) {
    /*        In the following, smallest (+ve or -ve) seq. no. wanted */
    /* Computing MIN */
    i__2 = ia[i__], i__3 = ib[i__];
    k = i__2 < i__3 ? i__2 : i__3;
    i__2 = *n - 1;
    for (j = i__ + 1; j <= i__2; ++j) {
      if (ia[j] == k) {
	iia[j] = -i__;
      }
      if (ib[j] == k) {
	iib[j] = -i__;
      }
    }
  }
  i__1 = *n - 1;
  for (i__ = 1; i__ <= i__1; ++i__) {
    iia[i__] = -iia[i__];
    iib[i__] = -iib[i__];
  }
  i__1 = *n - 1;
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

  iorder[1] = iia[*n - 1];
  iorder[2] = iib[*n - 1];
  loc = 2;
  for (i__ = *n - 2; i__ >= 1; --i__) {
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

  i__1 = *n;
  for (i__ = 1; i__ <= i__1; ++i__) {
    iorder[i__] = -iorder[i__];
  }

  return 0;
} /* hcass2_ */

SEXP R_igraph_psumtree_draw(SEXP plength, SEXP howmany, SEXP prob) {
  SEXP result;
  int length=INTEGER(plength)[0];
  int i, n=INTEGER(howmany)[0];
  igraph_psumtree_t tree;
  igraph_real_t sum;

  PROTECT(result=NEW_INTEGER(n));  

  igraph_psumtree_init(&tree, length);
  if (isNull(prob)) {
    for (i=0; i<length; i++) {
      igraph_psumtree_update(&tree, i, 1.0);
    }
  } else {
    if (GET_LENGTH(prob) != length) {
      igraph_error("Cannot sample, invalid prob vector length",
		   __FILE__, __LINE__, IGRAPH_EINVAL);
    }
    for (i=0; i<length; i++) {
      igraph_psumtree_update(&tree, i, REAL(prob)[i]);
    }
  }

  sum=igraph_psumtree_sum(&tree);

  RNG_BEGIN();

  for (i=0; i<n; i++) {
    igraph_real_t r=RNG_UNIF(0, sum);
    long int idx;
    igraph_psumtree_search(&tree, &idx, r);
    INTEGER(result)[i] = idx + 1;
  }
  
  RNG_END();

  igraph_psumtree_destroy(&tree);
  UNPROTECT(1);
  return result;
}

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
  snprintf(s, 64, "%p", object);
  return ScalarString(mkChar(s));
}

SEXP R_igraph_make_weak_ref(SEXP key, SEXP value, SEXP finalizer) {
  return R_MakeWeakRef(key, value, finalizer, isNull(finalizer) ? 0 : 1);
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

SEXP R_igraph_identical_graphs(SEXP g1, SEXP g2) {
  int i;
  for (i = 0; i < 9 ; i++) {
    if (!R_compute_identical(VECTOR_ELT(g1, i), VECTOR_ELT(g2, i), 0)) {
      return ScalarLogical(0);
    }
  }
  return ScalarLogical(1);
}

SEXP R_igraph_graph_version(SEXP graph) {
  if (GET_LENGTH(graph) == 10 && isEnvironment(VECTOR_ELT(graph, 9))) {
    SEXP ver = findVar(install(R_IGRAPH_VERSION_VAR), VECTOR_ELT(graph, 9));
    if (ver != R_UnboundValue) {
      return ver;
    } else {
      return mkString("0.7.999");
    }
  } else {
    return mkString("0.4.0");
  }
}

SEXP R_igraph_add_version_to_env(SEXP graph) {
  uuid_t my_id;
  char my_id_chr[40];

  PROTECT(graph = duplicate(graph));

  uuid_generate(my_id);
  uuid_unparse_lower(my_id, my_id_chr);
  SEXP l1 = PROTECT(install("myid"));
  SEXP l2 = PROTECT(mkString(my_id_chr));
  defineVar(l1, l2, VECTOR_ELT(graph, 9));
  UNPROTECT(2);
  l1 = PROTECT(install(R_IGRAPH_VERSION_VAR));
  l2 = PROTECT(mkString(R_IGRAPH_TYPE_VERSION));
  defineVar(l1, l2, VECTOR_ELT(graph, 9));
  UNPROTECT(2);

  UNPROTECT(1);
  return graph;
}

SEXP R_igraph_add_env(SEXP graph) {
  SEXP result = graph;
  int i;
  uuid_t my_id;
  char my_id_chr[40];
  int px = 0;

  if (GET_LENGTH(graph) != 10) {
    PROTECT(result = NEW_LIST(10)); px++;
    for (i = 0; i < 9; i++) {
      SET_VECTOR_ELT(result, i, duplicate(VECTOR_ELT(graph, i)));
    }
    SET_ATTRIB(result, duplicate(ATTRIB(graph)));
    SET_CLASS(result, duplicate(GET_CLASS(graph)));
  }

  SET_VECTOR_ELT(result, 9, allocSExp(ENVSXP));

  uuid_generate(my_id);
  uuid_unparse_lower(my_id, my_id_chr);

  SEXP l1 = PROTECT(install("myid")); px++;
  SEXP l2 = PROTECT(mkString(my_id_chr)); px++;
  defineVar(l1, l2, VECTOR_ELT(result, 9));

  l1 = PROTECT(install(R_IGRAPH_VERSION_VAR)); px++;
  l2 = PROTECT(mkString(R_IGRAPH_TYPE_VERSION)); px++;
  defineVar(l1, l2, VECTOR_ELT(result, 9));

  UNPROTECT(px);

  return result;
}

SEXP R_igraph_get_graph_id(SEXP graph) {
  return findVar(install("myid"), VECTOR_ELT(graph, 9));
}
