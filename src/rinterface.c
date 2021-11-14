/* -*- mode: C -*-  */
/*
   IGraph library R interface.
   Copyright (C) 2005-2012  Gabor Csardi <csardi.gabor@gmail.com>
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
#include "igraph_error.h"

#include "config.h"

#include <R.h>
#include <Rinternals.h>
#include <Rdefines.h>
#include "rinterface.h"

#include "init.c"		/* registration table */

#include <stdio.h>

int igraph_free(void *p);

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
int R_SEXP_to_vector_int(SEXP sv, igraph_vector_int_t *v);
int R_SEXP_to_vector_long_copy(SEXP sv, igraph_vector_long_t *v);
int R_SEXP_to_hrg(SEXP shrg, igraph_hrg_t *hrg);
int R_SEXP_to_hrg_copy(SEXP shrg, igraph_hrg_t *hrg);
int R_SEXP_to_sparsemat(SEXP pakl, igraph_sparsemat_t *akl);
int R_SEXP_to_pagerank_power_options(SEXP popt,
				     igraph_pagerank_power_options_t *opt);

SEXP R_igraph_i_lang7(SEXP s, SEXP t, SEXP u, SEXP v, SEXP w, SEXP x, SEXP y)
{
    PROTECT(s);
    PROTECT(t);
    PROTECT(u);
    s = LCONS(s, LCONS(t, LCONS(u, list4(v, w, x, y))));
    UNPROTECT(3);
    return s;
}

/* get the list element named str, or return NULL */
/* from the R Manual */

SEXP R_igraph_getListElement(SEXP list, const char *str)
{
  SEXP elmt = R_NilValue, names = getAttrib(list, R_NamesSymbol);
  int i;

  for (i = 0; i < length(list); i++)
    if(strcmp(CHAR(STRING_ELT(names, i)), str) == 0) {
      elmt = VECTOR_ELT(list, i);
      break;
    }
  return elmt;
}

SEXP R_igraph_c2(SEXP x1, SEXP x2) {
  SEXP cc = PROTECT(install("c"));
  SEXP lc = PROTECT(lang3(cc, x1, x2));
  SEXP ret = EVAL(lc);
  UNPROTECT(2);
  return ret;
}

/******************************************************
 * Attributes                                         *
 *****************************************************/

SEXP R_igraph_get_attr_mode(SEXP graph, SEXP pwhich) {
  int which=INTEGER(pwhich)[0]-1;
  SEXP obj=VECTOR_ELT(VECTOR_ELT(graph, 8), which);
  int i, len=GET_LENGTH(obj);
  SEXP result;

  PROTECT(result=NEW_CHARACTER(len));
  for (i=0; i<len; i++) {
    SEXP obji=VECTOR_ELT(obj, i);
    if (IS_NUMERIC(obji) || IS_INTEGER(obji)) {
      SET_STRING_ELT(result, i, mkChar("n"));
    } else if (IS_CHARACTER(obji)) {
      SET_STRING_ELT(result, i, mkChar("c"));
    } else if (IS_LOGICAL(obji)) {
      SET_STRING_ELT(result, i, mkChar("l"));
    } else {
      SET_STRING_ELT(result, i, mkChar("x"));
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
    const char *n;
    igraph_attribute_combination_type_t type;
    void *func;

    /* Name */
    if (!isNull(names)) {
      n=CHAR(STRING_ELT(names, i));
    }
    if (isNull(names) || strlen(n)==0) {
      n=0;
    }

    /* Type and function, if any */
    if (isFunction(VECTOR_ELT(input, i))) {
      type=IGRAPH_ATTRIBUTE_COMBINE_FUNCTION;
      func=VECTOR_ELT(input, i);
    } else {
      type=REAL(AS_NUMERIC(VECTOR_ELT(input, i)))[0];
      func=0;
    }
    igraph_attribute_combination_add(comb, n, type, func);
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
    SET_STRING_ELT(names, i, mkChar(rec->name));
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
	SET_STRING_ELT(VECTOR_ELT(gal,i), 0, mkChar(STR(*strvec, 0)));
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
      SET_VECTOR_ELT(toattr, 1, duplicate(VECTOR_ELT(fromattr, 1)));
    }
    if (va) {
      SET_VECTOR_ELT(toattr, 2, duplicate(VECTOR_ELT(fromattr, 2)));
    }
    if (ea) {
      SET_VECTOR_ELT(toattr, 3, duplicate(VECTOR_ELT(fromattr, 3)));
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
      if (isNull(rep)) {
	SEXP l1 = PROTECT(install("rep")); px++;
	SEXP l2 = PROTECT(ScalarLogical(NA_LOGICAL)); px++;
	SEXP l3 = PROTECT(ScalarInteger((int) nv)); px++;
	SEXP l4 = PROTECT(lang3(l1, l2, l3)); px++;
	PROTECT(rep=EVAL(l4)); px++;
      }
      PROTECT(newva=R_igraph_c2(oldva, rep));
      SET_VECTOR_ELT(val, i, newva);
      UNPROTECT(1);
    }
  }

  UNPROTECT(px);
}

SEXP R_igraph_attribute_add_vertices_dup(SEXP attr) {
  SEXP newattr=duplicate(attr);
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
  if (igraph_vector_init(&news, 0)) error("Out of memory");
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
      if (igraph_vector_push_back(&news, i)) error("Out of memory");
    }
  }
  if (newattrs != 0) {
    SEXP app, newval;
    PROTECT(app=NEW_LIST(newattrs));
    PROTECT(newnames=NEW_CHARACTER(newattrs));
    SEXP l1 = PROTECT(install("rep"));
    SEXP l2 = PROTECT(ScalarLogical(NA_LOGICAL));
    SEXP l3 = PROTECT(ScalarInteger((int) origlen));
    SEXP l4 = PROTECT(lang3(l1, l2, l3));
    PROTECT(rep = EVAL(l4));
    for (i=0; i<newattrs; i++) {
      igraph_attribute_record_t *tmp=
	VECTOR(*nattr)[(long int)VECTOR(news)[i]];
      SET_VECTOR_ELT(app, i, rep);
      SET_STRING_ELT(newnames, i, CREATE_STRING_VECTOR(tmp->name));
    }
    PROTECT(newval=R_igraph_c2(val, app));
    PROTECT(newnames=R_igraph_c2(names, newnames));
    SET_NAMES(newval, newnames);
    SET_VECTOR_ELT(attr, 2, newval);
    val=VECTOR_ELT(attr, 2);
    UNPROTECT(9);
  }
  igraph_vector_destroy(&news);
  IGRAPH_FINALLY_CLEAN(1);	/* news */

  /* Now append the new values */
  R_igraph_attribute_add_vertices_append(val, nv, nattr);

  UNPROTECT(px);

  return 0;
}

/* void R_igraph_attribute_delete_vertices(igraph_t *graph,  */
/* 					const igraph_vector_t *eidx, */
/* 					const igraph_vector_t *vidx) { */
/*   SEXP attr=graph->attr; */
/*   SEXP eal, val; */
/*   long int valno, ealno, i; */
/*   if (REAL(VECTOR_ELT(attr, 0))[0]+REAL(VECTOR_ELT(attr, 0))[1] > 1) { */
/*     SEXP newattr; */
/*     PROTECT(newattr=duplicate(attr)); */
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
/* 	newlen++; */
/*       } */
/*     } */
/*     PROTECT(ss=NEW_NUMERIC(newlen)); */
/*     for (j=0; j<origlen; j++) { */
/*       if (VECTOR(*vidx)[j]>0) { */
/* 	REAL(ss)[(long int)VECTOR(*vidx)[j]-1]=j+1; */
/*       } */
/*     } */
/*     PROTECT(newva=EVAL(lang3(install("["), oldva, ss))); */
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
/* 	newlen++; */
/*       } */
/*     }     */
/*     PROTECT(ss=NEW_NUMERIC(newlen)); */
/*     for (j=0; j<origlen; j++) { */
/*       if (VECTOR(*eidx)[j]>0) { */
/* 	REAL(ss)[(long int)VECTOR(*eidx)[j]-1]=j+1; */
/*       } */
/*     } */
/*     PROTECT(newea=EVAL(lang3(install("["), oldea, ss))); */
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
    SEXP newattr = duplicate(attr);
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
    SEXP l1 = PROTECT(install("["));
    SEXP l2 = PROTECT(lang3(l1, oldva, ss));
    SEXP newva = PROTECT(EVAL(l2));
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
    SEXP l1 = PROTECT(install("["));
    SEXP l2 = PROTECT(lang3(l1, oldva, ss));
    SEXP newva = PROTECT(EVAL(l2));
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
  SEXP newattr=duplicate(attr);
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
      if (isNull(rep)) {
	SEXP l1 = PROTECT(install("rep")); px++;
	SEXP l2 = PROTECT(ScalarLogical(NA_LOGICAL)); px++;
	SEXP l3 = PROTECT(ScalarInteger((int) ne)); px++;
	SEXP l4 = PROTECT(lang3(l1, l2, l3)); px++;
	PROTECT(rep = EVAL(l4)); px++;
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

  if (igraph_vector_init(&news, 0)) error("Out of memory");
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
      if (igraph_vector_push_back(&news, i)) error("Out of memory");
    }
  }
  if (newattrs != 0) {
    SEXP app, neweal;
    PROTECT(app=NEW_LIST(newattrs));
    PROTECT(newnames=NEW_CHARACTER(newattrs));
    SEXP l1 = PROTECT(install("rep"));
    SEXP l2 = PROTECT(ScalarLogical(NA_LOGICAL));
    SEXP l3 = PROTECT(ScalarInteger((int) origlen));
    SEXP l4 = PROTECT(lang3(l1, l2, l3));
    SEXP rep = PROTECT(EVAL(l4));
    for (i=0; i<newattrs; i++) {
      igraph_attribute_record_t *tmp=
	VECTOR(*nattr)[ (long int) VECTOR(news)[i]];
      SET_VECTOR_ELT(app, i, rep);
      SET_STRING_ELT(newnames, i, CREATE_STRING_VECTOR(tmp->name));
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
/* 				     const igraph_vector_t *idx) { */
/*   SEXP attr=graph->attr; */
/*   SEXP eal; */
/*   long int ealno, i; */
/*   if (REAL(VECTOR_ELT(attr, 0))[0]+REAL(VECTOR_ELT(attr, 0))[1] > 1) { */
/*     SEXP newattr; */
/*     PROTECT(newattr=duplicate(attr)); */
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
/* 	newlen++; */
/*       } */
/*     } */
/*     PROTECT(ss=NEW_NUMERIC(newlen)); */
/*     for (j=0; j<origlen; j++) { */
/*       if (VECTOR(*idx)[j] > 0) { */
/* 	REAL(ss)[(long int)VECTOR(*idx)[j]-1] = j+1; */
/*       } */
/*     } */
/*     PROTECT(newea=EVAL(lang3(install("["), oldea, ss))); */
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
    SEXP newattr=duplicate(attr);
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
    SEXP l1 = PROTECT(install("["));
    SEXP l2 = PROTECT(lang3(l1, oldea, ss));
    SEXP newea = PROTECT(EVAL(l2));
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
    SEXP l1 = PROTECT(install("["));
    SEXP l2 = PROTECT(lang3(l1, oldea, ss));
    SEXP newea = PROTECT(EVAL(l2));
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

    if (n) {			/* return names */
      SEXP names = PROTECT(GET_NAMES(al));
      R_igraph_SEXP_to_strvector_copy(names, n);
      UNPROTECT(1);
    }

    if (t) {			/* return types */
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
      PROTECT(call=lang2(install("median"), tmp));
      PROTECT(tmp2=EVAL(call));
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
    if (! arg) {
      SEXP l1 = PROTECT(install(function_name));
      SEXP l2 = PROTECT(install("["));
      SEXP l3 = PROTECT(lang3(l2, attr, tmp));
      SEXP l4 = PROTECT(EVAL(l3));
      SEXP l5 = PROTECT(lang2(l1, l4));
      SEXP l6 = PROTECT(EVAL(l5));
      SET_VECTOR_ELT(res, i, l6);
      UNPROTECT(6);
    } else {
      SEXP l1 = PROTECT(install(function_name));
      SEXP l2 = PROTECT(install("["));
      SEXP l3 = PROTECT(lang3(l2, attr, tmp));
      SEXP l4 = PROTECT(EVAL(l3));
      SEXP l5 = PROTECT(lang3(l1, l4, arg));
      SEXP l6 = PROTECT(EVAL(l5));
      SET_VECTOR_ELT(res, i, l6);
      UNPROTECT(6);
    }
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
      SEXP l1 = PROTECT(install("unlist"));
      SEXP l2 = PROTECT(ScalarLogical(0));
      SEXP l3 = PROTECT(lang3(l1, res, l2));
      res2 = EVAL(l3);
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
    SEXP l1 = PROTECT(install("["));
    SEXP l2 = PROTECT(lang3(l1, attr, tmp));
    SEXP l3 = PROTECT(EVAL(l2));
    SEXP l4 = PROTECT(lang2(func, l3));
    SEXP l5 = PROTECT(EVAL(l4));
    SET_VECTOR_ELT(res, i, l5);
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
      SEXP l1 = PROTECT(install("unlist"));
      SEXP l2 = PROTECT(ScalarLogical(0));
      SEXP l3 = PROTECT(lang3(l1, res, l2));
      res2 = EVAL(l3);
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
    void *voidfunc=funcs[i];
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
      func=(SEXP)voidfunc;
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
	SEXP tx = PROTECT(ScalarInteger(1));
	SET_VECTOR_ELT(res, j, R_igraph_ac_all_other(va, merges, "sample",
						     tx));
	UNPROTECT(1);
      }
      break;
    case IGRAPH_ATTRIBUTE_COMBINE_FIRST:
      if (type==IGRAPH_ATTRIBUTE_NUMERIC) {
	SET_VECTOR_ELT(res, j, R_igraph_ac_first_numeric(va, merges));
      } else {
	SEXP tx = PROTECT(ScalarInteger(1));
	SET_VECTOR_ELT(res, j, R_igraph_ac_all_other(va, merges, "head",
						     tx));
	UNPROTECT(1);
      }
      break;
    case IGRAPH_ATTRIBUTE_COMBINE_LAST:
      if (type==IGRAPH_ATTRIBUTE_NUMERIC) {
	SET_VECTOR_ELT(res, j, R_igraph_ac_last_numeric(va, merges));
      } else {
	SEXP tx = PROTECT(ScalarInteger(1));
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
    void *voidfunc=funcs[i];
    SEXP func;

    /* What kind of attribute */
    R_igraph_attribute_gettype(graph, &type, IGRAPH_ATTRIBUTE_EDGE, name);

    switch (todo) {
    case IGRAPH_ATTRIBUTE_COMBINE_DEFAULT:
      /* Never happens from R */
    case IGRAPH_ATTRIBUTE_COMBINE_IGNORE:
      break;
    case IGRAPH_ATTRIBUTE_COMBINE_FUNCTION:
      func=(SEXP)voidfunc;
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
	SEXP tx = PROTECT(ScalarInteger(1));
	SET_VECTOR_ELT(res, j, R_igraph_ac_all_other(ea, merges, "sample",
						     tx));
	UNPROTECT(1);
      }
      break;
    case IGRAPH_ATTRIBUTE_COMBINE_FIRST:
      if (type==IGRAPH_ATTRIBUTE_NUMERIC) {
	SET_VECTOR_ELT(res, j, R_igraph_ac_first_numeric(ea, merges));
      } else {
	SEXP tx = PROTECT(ScalarInteger(1));
	SET_VECTOR_ELT(res, j, R_igraph_ac_all_other(ea, merges, "head",
						     tx));
	UNPROTECT(1);
      }
      break;
    case IGRAPH_ATTRIBUTE_COMBINE_LAST:
      if (type==IGRAPH_ATTRIBUTE_NUMERIC) {
	SET_VECTOR_ELT(res, j, R_igraph_ac_last_numeric(ea, merges));
      } else {
	SEXP tx = PROTECT(ScalarInteger(1));
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

igraph_error_handler_t *R_igraph_oldhandler;

void R_igraph_myhandler (const char *reason, const char *file,
			 int line, int igraph_errno) {
  IGRAPH_FINALLY_FREE();
  error("At %s:%i : %s, %s", file, line, reason,
	igraph_strerror(igraph_errno));
}

void R_igraph_warning_handler(const char *reason, const char *file,
			      int line, int igraph_errno) {
  warning("At %s:%i :%s", file, line, reason);
}

extern int R_interrupts_pending;

int R_igraph_interrupt_handler(void *data) {
#if  ( defined(HAVE_AQUA) || defined(Win32) )
  R_CheckUserInterrupt();
#else
  if (R_interrupts_pending) {
    IGRAPH_FINALLY_FREE();
    R_CheckUserInterrupt();
  }
#endif
  return 0;
}

int R_igraph_progress_handler(const char *message, igraph_real_t percent,
			      void * data) {
  SEXP ec;
  int ecint;
  SEXP l1 = PROTECT(install("getNamespace"));
  SEXP l2 = PROTECT(ScalarString(mkChar("igraph")));
  SEXP l3 = PROTECT(lang2(l1, l2));
  SEXP rho = PROTECT(EVAL(l3));

  SEXP l4 = PROTECT(install(".igraph.progress"));
  SEXP l5 = PROTECT(ScalarReal(percent));
  SEXP l6 = PROTECT(ScalarString(mkChar(message)));
  SEXP l7 = PROTECT(lang3(l4, l5, l6));
  PROTECT(ec=eval(l7, rho));
  ecint=INTEGER(ec)[0];
  UNPROTECT(9);
  return ecint;
}

int R_igraph_status_handler(const char *message, void *data) {
  int ecint;
  SEXP l4 = PROTECT(install(".igraph.status"));
  SEXP l5 = PROTECT(ScalarString(mkChar(message)));
  SEXP l6 = PROTECT(lang2(l4, l5));
  SEXP ec = PROTECT(EVAL(l6));

  ecint=INTEGER(ec)[0];
  UNPROTECT(4);
  return 0;
}

void R_init_igraph(DllInfo *dll) {
  R_registerRoutines(dll, CEntries, CallEntries, NULL, NULL);
  R_useDynamicSymbols(dll, FALSE);
  R_forceSymbols(dll, TRUE);

  igraph_set_error_handler(R_igraph_myhandler);
  igraph_set_warning_handler(R_igraph_warning_handler);
  igraph_set_interruption_handler(R_igraph_interrupt_handler);
  igraph_i_set_attribute_table(&R_igraph_attribute_table);
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

SEXP R_igraph_finalizer() {
  SEXP l1 = PROTECT(install("getNamespace"));
  SEXP l2 = PROTECT(ScalarString(mkChar("igraph")));
  SEXP l3 = PROTECT(lang2(l1, l2));
  SEXP rho = PROTECT(EVAL(l3));
  SEXP l4 = PROTECT(install(".igraph.progress"));
  SEXP l5 = PROTECT(ScalarReal(0.0));
  SEXP l6 = PROTECT(ScalarString(mkChar("")));
  SEXP l7 = PROTECT(ScalarLogical(1));
  SEXP l8 = PROTECT(lang4(l4, l5, l6, l7));
  eval(l8, rho);
  IGRAPH_FINALLY_FREE();
  UNPROTECT(9);
  return R_NilValue;
}

SEXP R_igraph_check_finally_stack() {
  if (!IGRAPH_FINALLY_STACK_EMPTY) {
    error("igraph callbacks cannot call igraph functions");
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
    SET_STRING_ELT(result, i, CREATE_STRING_VECTOR(str));
  }

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_to_SEXP(const igraph_t *graph) {

  SEXP result;
  long int no_of_nodes=igraph_vcount(graph);
  long int no_of_edges=igraph_ecount(graph);

  PROTECT(result=NEW_LIST(10));
  SET_VECTOR_ELT(result, 0, NEW_NUMERIC(1));
  SET_VECTOR_ELT(result, 1, NEW_LOGICAL(1));
  SET_VECTOR_ELT(result, 2, NEW_NUMERIC(no_of_edges));
  SET_VECTOR_ELT(result, 3, NEW_NUMERIC(no_of_edges));
  SET_VECTOR_ELT(result, 4, NEW_NUMERIC(no_of_edges));
  SET_VECTOR_ELT(result, 5, NEW_NUMERIC(no_of_edges));
  SET_VECTOR_ELT(result, 6, NEW_NUMERIC(no_of_nodes+1));
  SET_VECTOR_ELT(result, 7, NEW_NUMERIC(no_of_nodes+1));

  REAL(VECTOR_ELT(result, 0))[0]=no_of_nodes;
  LOGICAL(VECTOR_ELT(result, 1))[0]=graph->directed;
  memcpy(REAL(VECTOR_ELT(result, 2)), graph->from.stor_begin,
	 sizeof(igraph_real_t)*(size_t) no_of_edges);
  memcpy(REAL(VECTOR_ELT(result, 3)), graph->to.stor_begin,
	 sizeof(igraph_real_t)*(size_t) no_of_edges);
  memcpy(REAL(VECTOR_ELT(result, 4)), graph->oi.stor_begin,
	 sizeof(igraph_real_t)*(size_t) no_of_edges);
  memcpy(REAL(VECTOR_ELT(result, 5)), graph->ii.stor_begin,
	 sizeof(igraph_real_t)*(size_t) no_of_edges);
  memcpy(REAL(VECTOR_ELT(result, 6)), graph->os.stor_begin,
	 sizeof(igraph_real_t)*(size_t) (no_of_nodes+1));
  memcpy(REAL(VECTOR_ELT(result, 7)), graph->is.stor_begin,
	 sizeof(igraph_real_t)*(size_t) (no_of_nodes+1));

  SET_CLASS(result, ScalarString(CREATE_STRING_VECTOR("igraph")));

  /* Attributes */
  SET_VECTOR_ELT(result, 8, graph->attr);
  REAL(VECTOR_ELT(graph->attr, 0))[0] += 1;

  /* Environment for vertex/edge seqs */
  SET_VECTOR_ELT(result, 9, R_NilValue);
  R_igraph_add_env(result);

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
    igraph_destroy(g);
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
  SET_STRING_ELT(names, 0, mkChar("left"));
  SET_STRING_ELT(names, 1, mkChar("right"));
  SET_STRING_ELT(names, 2, mkChar("prob"));
  SET_STRING_ELT(names, 3, mkChar("edges"));
  SET_STRING_ELT(names, 4, mkChar("vertices"));
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
  SET_VECTOR_ELT(result, 0, ScalarLogical(plfit->continuous));
  SET_VECTOR_ELT(result, 1, ScalarReal(plfit->alpha));
  SET_VECTOR_ELT(result, 2, ScalarReal(plfit->xmin));
  SET_VECTOR_ELT(result, 3, ScalarReal(plfit->L));
  SET_VECTOR_ELT(result, 4, ScalarReal(plfit->D));
  SET_VECTOR_ELT(result, 5, ScalarReal(plfit->p));

  PROTECT(names=NEW_CHARACTER(6));
  SET_STRING_ELT(names, 0, mkChar("continuous"));
  SET_STRING_ELT(names, 1, mkChar("alpha"));
  SET_STRING_ELT(names, 2, mkChar("xmin"));
  SET_STRING_ELT(names, 3, mkChar("logLik"));
  SET_STRING_ELT(names, 4, mkChar("KS.stat"));
  SET_STRING_ELT(names, 5, mkChar("KS.p"));
  SET_NAMES(result, names);

  UNPROTECT(2);
  return result;
}

SEXP R_igraph_maxflow_stats_to_SEXP(const igraph_maxflow_stats_t *st) {
  SEXP result, names;

  PROTECT(result=NEW_LIST(5));
  SET_VECTOR_ELT(result, 0, ScalarInteger(st->nopush));
  SET_VECTOR_ELT(result, 1, ScalarInteger(st->norelabel));
  SET_VECTOR_ELT(result, 2, ScalarInteger(st->nogap));
  SET_VECTOR_ELT(result, 3, ScalarInteger(st->nogapnodes));
  SET_VECTOR_ELT(result, 4, ScalarInteger(st->nobfs));

  PROTECT(names=NEW_CHARACTER(5));
  SET_STRING_ELT(names, 0, mkChar("nopush"));
  SET_STRING_ELT(names, 1, mkChar("norelabel"));
  SET_STRING_ELT(names, 2, mkChar("nogap"));
  SET_STRING_ELT(names, 3, mkChar("nogapnodes"));
  SET_STRING_ELT(names, 4, mkChar("nobfs"));
  SET_NAMES(result, names);

  UNPROTECT(2);
  return result;
}

SEXP R_igraph_sirlist_to_SEXP(const igraph_vector_ptr_t *sl) {
  SEXP result, names;
  int i, n=igraph_vector_ptr_size(sl);
  PROTECT(result=NEW_LIST(n));

  PROTECT(names=NEW_CHARACTER(4));
  SET_STRING_ELT(names, 0, mkChar("times"));
  SET_STRING_ELT(names, 1, mkChar("NS"));
  SET_STRING_ELT(names, 2, mkChar("NI"));
  SET_STRING_ELT(names, 3, mkChar("NR"));

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
  SEXP Dim=GET_SLOT(pakl, install("Dim"));
  SEXP i=GET_SLOT(pakl, install("i"));
  SEXP p=GET_SLOT(pakl, install("p"));
  SEXP x=GET_SLOT(pakl, install("x"));

  igraph_i_sparsemat_view(akl, /*nzmax=*/ GET_LENGTH(x),
			  /*m=*/ INTEGER(Dim)[0], /*n=*/ INTEGER(Dim)[1],
			  /*p=*/ INTEGER(p), /*i=*/ INTEGER(i),
			  /*x=*/ REAL(x), /*nz=*/ -1);

  return 0;
}

int R_SEXP_to_pagerank_power_options(SEXP popt,
				     igraph_pagerank_power_options_t *opt) {
  opt->niter=INTEGER(AS_INTEGER(R_igraph_getListElement(popt, "niter")))[0];
  opt->eps=REAL(R_igraph_getListElement(popt, "eps"))[0];
  return 0;
}

SEXP R_igraph_sparsemat_to_SEXP_triplet(const igraph_sparsemat_t *sp) {
  SEXP res, names;
  int nz=igraph_sparsemat_nonzero_storage(sp);

  PROTECT(res=NEW_LIST(5));
  SET_VECTOR_ELT(res, 0, ScalarString(CREATE_STRING_VECTOR("triplet")));
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
  SET_STRING_ELT(names, 0, mkChar("type"));
  SET_STRING_ELT(names, 1, mkChar("dim"));
  SET_STRING_ELT(names, 2, mkChar("p"));
  SET_STRING_ELT(names, 3, mkChar("i"));
  SET_STRING_ELT(names, 4, mkChar("x"));
  SET_NAMES(res, names);
  SET_CLASS(res, ScalarString(CREATE_STRING_VECTOR("igraph.tmp.sparse")));

  UNPROTECT(2);
  return res;
}

SEXP R_igraph_sparsemat_to_SEXP_cc(const igraph_sparsemat_t *sp) {
  SEXP res, names;
  int nz=igraph_sparsemat_nonzero_storage(sp);
  int m=(int) igraph_sparsemat_nrow(sp);
  int n=(int) igraph_sparsemat_ncol(sp);

  PROTECT(res=NEW_LIST(5));
  SET_VECTOR_ELT(res, 0, ScalarString(CREATE_STRING_VECTOR("cc")));
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
  SET_STRING_ELT(names, 0, mkChar("type"));
  SET_STRING_ELT(names, 1, mkChar("dim"));
  SET_STRING_ELT(names, 2, mkChar("p"));
  SET_STRING_ELT(names, 3, mkChar("i"));
  SET_STRING_ELT(names, 4, mkChar("x"));
  SET_NAMES(res, names);
  SET_CLASS(res, ScalarString(CREATE_STRING_VECTOR("igraph.tmp.sparse")));

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
  if (!isNull(vectorlist)) {
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

int R_SEXP_to_vector_int(SEXP sv, igraph_vector_int_t *v) {
  v->stor_begin=(int*) INTEGER(sv);
  v->stor_end=v->stor_begin+GET_LENGTH(sv);
  v->end=v->stor_end;
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

  res->n=(igraph_integer_t) REAL(VECTOR_ELT(graph, 0))[0];
  res->directed=LOGICAL(VECTOR_ELT(graph, 1))[0];
  R_SEXP_to_vector(VECTOR_ELT(graph, 2), &res->from);
  R_SEXP_to_vector(VECTOR_ELT(graph, 3), &res->to);
  R_SEXP_to_vector(VECTOR_ELT(graph, 4), &res->oi);
  R_SEXP_to_vector(VECTOR_ELT(graph, 5), &res->ii);
  R_SEXP_to_vector(VECTOR_ELT(graph, 6), &res->os);
  R_SEXP_to_vector(VECTOR_ELT(graph, 7), &res->is);

  /* attributes */
  REAL(VECTOR_ELT(VECTOR_ELT(graph, 8), 0))[0] = 1; /* R objects refcount */
  REAL(VECTOR_ELT(VECTOR_ELT(graph, 8), 0))[1] = 0; /* igraph_t objects */
  res->attr=VECTOR_ELT(graph, 8);

  return 0;
}

int R_SEXP_to_igraph_copy(SEXP graph, igraph_t *res) {

  res->n=(igraph_integer_t) REAL(VECTOR_ELT(graph, 0))[0];
  res->directed=LOGICAL(VECTOR_ELT(graph, 1))[0];
  igraph_vector_init_copy(&res->from, REAL(VECTOR_ELT(graph, 2)),
		   GET_LENGTH(VECTOR_ELT(graph, 2)));
  igraph_vector_init_copy(&res->to, REAL(VECTOR_ELT(graph, 3)),
		   GET_LENGTH(VECTOR_ELT(graph, 3)));
  igraph_vector_init_copy(&res->oi, REAL(VECTOR_ELT(graph, 4)),
		   GET_LENGTH(VECTOR_ELT(graph, 4)));
  igraph_vector_init_copy(&res->ii, REAL(VECTOR_ELT(graph, 5)),
		   GET_LENGTH(VECTOR_ELT(graph, 5)));
  igraph_vector_init_copy(&res->os, REAL(VECTOR_ELT(graph, 6)),
		   GET_LENGTH(VECTOR_ELT(graph, 6)));
  igraph_vector_init_copy(&res->is, REAL(VECTOR_ELT(graph, 7)),
		   GET_LENGTH(VECTOR_ELT(graph, 7)));

  /* attributes */
  REAL(VECTOR_ELT(VECTOR_ELT(graph, 8), 0))[0] = 1; /* R objects */
  REAL(VECTOR_ELT(VECTOR_ELT(graph, 8), 0))[1] = 1; /* igraph_t objects */
  R_PreserveObject(res->attr=VECTOR_ELT(graph, 8));

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
  SET_VECTOR_ELT(result, 0, ScalarString(CREATE_STRING_VECTOR(bmat)));
  SET_VECTOR_ELT(result, 1, NEW_INTEGER(1)); INTEGER(VECTOR_ELT(result, 1))[0]=opt->n;
  SET_VECTOR_ELT(result, 2, ScalarString(CREATE_STRING_VECTOR(which)));
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
  SET_STRING_ELT(names, 0, mkChar("bmat"));
  SET_STRING_ELT(names, 1, mkChar("n"));
  SET_STRING_ELT(names, 2, mkChar("which"));
  SET_STRING_ELT(names, 3, mkChar("nev"));
  SET_STRING_ELT(names, 4, mkChar("tol"));
  SET_STRING_ELT(names, 5, mkChar("ncv"));
  SET_STRING_ELT(names, 6, mkChar("ldv"));
  SET_STRING_ELT(names, 7, mkChar("ishift"));
  SET_STRING_ELT(names, 8, mkChar("maxiter"));
  SET_STRING_ELT(names, 9, mkChar("nb"));
  SET_STRING_ELT(names, 10, mkChar("mode"));
  SET_STRING_ELT(names, 11, mkChar("start"));
  SET_STRING_ELT(names, 12, mkChar("sigma"));
  SET_STRING_ELT(names, 13, mkChar("sigmai"));
  SET_STRING_ELT(names, 14, mkChar("info"));
  SET_STRING_ELT(names, 15, mkChar("iter"));
  SET_STRING_ELT(names, 16, mkChar("nconv"));
  SET_STRING_ELT(names, 17, mkChar("numop"));
  SET_STRING_ELT(names, 18, mkChar("numopb"));
  SET_STRING_ELT(names, 19, mkChar("numreo"));
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
	}	else {
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
    SET_STRING_ELT(VECTOR_ELT(result, 5), 0, mkChar(info->group_size));
  } else {
    SET_VECTOR_ELT(result, 5, R_NilValue);
  }

  PROTECT(names=NEW_CHARACTER(6));
  SET_STRING_ELT(names, 0, mkChar("nof_nodes"));
  SET_STRING_ELT(names, 1, mkChar("nof_leaf_nodes"));
  SET_STRING_ELT(names, 2, mkChar("nof_bad_nodes"));
  SET_STRING_ELT(names, 3, mkChar("nof_canupdates"));
  SET_STRING_ELT(names, 4, mkChar("max_level"));
  SET_STRING_ELT(names, 5, mkChar("group_size"));
  SET_NAMES(result, names);

  UNPROTECT(2);
  return result;
}

/*******************************************************************/

SEXP R_igraph_mybracket(SEXP graph, SEXP pidx) {
  int idx=INTEGER(pidx)[0]-1;
  return duplicate(VECTOR_ELT(graph, idx));
}

SEXP R_igraph_mybracket2(SEXP graph, SEXP pidx1, SEXP pidx2) {
  int idx1=INTEGER(pidx1)[0]-1;
  int idx2=INTEGER(pidx2)[0]-1;
  return duplicate(VECTOR_ELT(VECTOR_ELT(graph, idx1), idx2));
}

SEXP R_igraph_mybracket2_names(SEXP graph, SEXP pidx1, SEXP pidx2) {
  SEXP result;
  int idx1=INTEGER(pidx1)[0]-1;
  int idx2=INTEGER(pidx2)[0]-1;
  result=duplicate(GET_NAMES(VECTOR_ELT(VECTOR_ELT(graph, idx1), idx2)));
  return result;
}

SEXP R_igraph_mybracket2_copy(SEXP graph, SEXP pidx1, SEXP pidx2) {
  int idx1=INTEGER(pidx1)[0]-1;
  int idx2=INTEGER(pidx2)[0]-1;
  return duplicate(VECTOR_ELT(VECTOR_ELT(graph, idx1), idx2));
}

SEXP R_igraph_mybracket2_set(SEXP graph, SEXP pidx1, SEXP pidx2,
			     SEXP value) {
  SEXP newgraph;
  int idx1=INTEGER(pidx1)[0]-1;
  int idx2=INTEGER(pidx2)[0]-1;
  PROTECT(newgraph=duplicate(graph));
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

  PROTECT(newgraph=duplicate(graph));
  attrs=VECTOR_ELT(VECTOR_ELT(newgraph, idx1), idx2);
  names=PROTECT(getAttrib(attrs, R_NamesSymbol));
  n=length(attrs);

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
    SET_STRING_ELT(newnames, i, mkChar(name));
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

  igraph_vector_t v;			/* do NOT destroy! */
  igraph_t g;
  SEXP result;

  R_SEXP_to_vector(edges, &v);
  R_SEXP_to_igraph_copy(graph, &g);
  IGRAPH_FINALLY(igraph_destroy, &g);
  igraph_add_edges(&g, &v, 0);
  PROTECT(result=R_igraph_to_SEXP(&g));
  igraph_destroy(&g);
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
  igraph_add_vertices(&g, nv, 0);
  PROTECT(result=R_igraph_to_SEXP(&g));
  igraph_destroy(&g);

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
  igraph_integer_t mode;

  igraph_vector_init(&neis, 0);
  vid=REAL(pvid)[0];
  mode=(igraph_integer_t) REAL(pmode)[0];
  R_SEXP_to_igraph(graph, &g);
  igraph_neighbors(&g, &neis, (igraph_integer_t) vid, (igraph_neimode_t) mode);

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
  igraph_integer_t mode;

  igraph_vector_init(&neis, 0);
  vid=REAL(pvid)[0];
  mode=(igraph_integer_t) REAL(pmode)[0];
  R_SEXP_to_igraph(graph, &g);
  igraph_incident(&g, &neis, (igraph_integer_t) vid, (igraph_neimode_t) mode);

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
  igraph_delete_edges(&g, es);
  PROTECT(result=R_igraph_to_SEXP(&g));
  igraph_destroy(&g);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_delete_vertices(SEXP graph, SEXP vertices) {

  igraph_vs_t vs;
  igraph_t g;
  SEXP result;

  R_SEXP_to_igraph_copy(graph, &g);
  R_SEXP_to_igraph_vs(vertices, &g, &vs);
  igraph_delete_vertices(&g, vs);
  PROTECT(result=R_igraph_to_SEXP(&g));
  igraph_destroy(&g);
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
  igraph_create(&g, &v, n, directed);
  PROTECT(result=R_igraph_to_SEXP(&g));
  igraph_destroy(&g);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_degree(SEXP graph, SEXP vids, SEXP pmode, SEXP ploops) {

  igraph_t g;
  igraph_vs_t vs;
  igraph_vector_t res;
  igraph_integer_t mode=(igraph_integer_t) REAL(pmode)[0];
  igraph_bool_t loops=LOGICAL(ploops)[0];
  SEXP result;

  R_SEXP_to_igraph(graph, &g);
  R_SEXP_to_igraph_vs(vids, &g, &vs);
  igraph_vector_init(&res, 0);
  igraph_degree(&g, &res, vs, (igraph_neimode_t) mode, loops);

  PROTECT(result=NEW_NUMERIC(igraph_vector_size(&res)));
  igraph_vector_copy_to(&res, REAL(result));
  igraph_vector_destroy(&res);
  igraph_vs_destroy(&vs);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_is_connected(SEXP graph, SEXP pmode) {

  igraph_t g;
  igraph_integer_t mode=(igraph_integer_t) REAL(pmode)[0];
  igraph_bool_t res;
  SEXP result;

  R_SEXP_to_igraph(graph, &g);
  igraph_is_connected(&g, &res, (igraph_connectedness_t) mode);

  PROTECT(result=NEW_LOGICAL(1));
  LOGICAL(result)[0]=res;

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
  if (!isNull(pweights)) {
    R_SEXP_to_vector(pweights, &weights);
  }
  igraph_diameter_dijkstra(&g, isNull(pweights) ? 0 : &weights,
			   &res, 0, 0, 0, directed, unconnected);

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
  if (!isNull(pweights)) {
    R_SEXP_to_vector(pweights, &weights);
  }
  igraph_vector_init(&res, 0);
  igraph_diameter_dijkstra(&g, isNull(pweights) ? 0 : &weights,
			   &dialen, 0, 0, &res, directed, unconnected);

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
  if (!isNull(pweights)) {
    R_SEXP_to_vector(pweights, &weights);
  }
  igraph_diameter_dijkstra(&g, isNull(pweights) ? 0 : &weights,
			   &len, &from, &to, 0, directed, unconnected);

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
  igraph_integer_t mode=(igraph_integer_t) REAL(pmode)[0];
  igraph_vector_t res;
  SEXP result;

  R_SEXP_to_igraph(graph, &g);
  igraph_vector_init(&res, 0);
  igraph_subcomponent(&g, &res, vertex, (igraph_neimode_t) mode);

  PROTECT(result=NEW_NUMERIC(igraph_vector_size(&res)));
  igraph_vector_copy_to(&res, REAL(result));
  igraph_vector_destroy(&res);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_betweenness(SEXP graph, SEXP pvids, SEXP pdirected,
			  SEXP weights, SEXP pnobigint) {

  igraph_t g;
  igraph_vs_t vs;
  igraph_bool_t directed=LOGICAL(pdirected)[0];
  igraph_bool_t nobigint=LOGICAL(pnobigint)[0];
  igraph_vector_t res;
  igraph_vector_t v_weights, *pweights=0;
  SEXP result;

  R_SEXP_to_igraph(graph, &g);
  R_SEXP_to_igraph_vs(pvids, &g, &vs);
  igraph_vector_init(&res, 0);
  if (!isNull(weights)) {
    pweights=&v_weights; R_SEXP_to_vector(weights, &v_weights);
  }
  igraph_betweenness(&g, &res, vs, directed, pweights, nobigint);

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
  igraph_running_mean(&data, &res, binwidth);

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
  igraph_cocitation(&g, &m, vs);

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
  igraph_bibcoupling(&g, &m, vs);

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

  igraph_growing_random_game(&g, n, m, directed, citation);
  PROTECT(result=R_igraph_to_SEXP(&g));
  igraph_destroy(&g);

  UNPROTECT(1);
  return result;
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
  if (isNull(weights)) {
    pw=0;
  } else {
    R_SEXP_to_vector(weights, &w);
    negw = igraph_vector_min(&w) < 0;
  }
  igraph_matrix_init(&res, 0, 0);
  switch (algo) {
  case 0: 			/* automatic */
    if (negw && mode==IGRAPH_OUT && GET_LENGTH(pvids)>100) {
      igraph_shortest_paths_johnson(&g, &res, vs, to, pw);
    } else if (negw) {
      igraph_shortest_paths_bellman_ford(&g, &res, vs, to, pw,
					 (igraph_neimode_t) mode);
    } else {
      /* This one chooses 'unweighted' if there are no weights */
      igraph_shortest_paths_dijkstra(&g, &res, vs, to, pw,
				     (igraph_neimode_t) mode);
    }
    break;
  case 1:			/* unweighted */
    igraph_shortest_paths(&g, &res, vs, to, (igraph_neimode_t) mode);
    break;
  case 2:			/* dijkstra */
    igraph_shortest_paths_dijkstra(&g, &res, vs, to, pw,
				   (igraph_neimode_t) mode);
    break;
  case 3:			/* bellman-ford */
    igraph_shortest_paths_bellman_ford(&g, &res, vs, to, pw,
				       (igraph_neimode_t) mode);
    break;
  case 4:			/* johnson */
    igraph_shortest_paths_johnson(&g, &res, vs, to, pw);
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

  igraph_lattice(&g, &dimvector, nei, directed, mutual, circular);
  PROTECT(result=R_igraph_to_SEXP(&g));
  igraph_destroy(&g);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_barabasi_game(SEXP pn, SEXP ppower, SEXP pm, SEXP poutseq,
			    SEXP poutpref, SEXP pA, SEXP pdirected,
			    SEXP palgo, SEXP pstart) {

  igraph_t g;
  igraph_integer_t n=(igraph_integer_t) REAL(pn)[0];
  igraph_real_t power=REAL(ppower)[0];
  igraph_integer_t m=isNull(pm) ? 0 : (igraph_integer_t) REAL(pm)[0];
  igraph_vector_t outseq, *myoutseq=0;
  igraph_bool_t outpref=LOGICAL(poutpref)[0];
  igraph_real_t A=REAL(pA)[0];
  igraph_bool_t directed=LOGICAL(pdirected)[0];
  igraph_barabasi_algorithm_t algo=(igraph_barabasi_algorithm_t) REAL(palgo)[0];
  igraph_t start, *ppstart=0;
  SEXP result;

  if (!isNull(poutseq)) {
    R_SEXP_to_vector(poutseq, &outseq);
    myoutseq=&outseq;
  }

  if (!isNull(pstart)) {
    R_SEXP_to_igraph(pstart, &start);
    ppstart=&start;
  }

  igraph_barabasi_game(&g, n, power, m, myoutseq, outpref,
		       A, directed, algo, ppstart);
  PROTECT(result=R_igraph_to_SEXP(&g));
  igraph_destroy(&g);

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

  igraph_recent_degree_game(&g, n, power, window, m, &outseq, outpref,
			    zero_appeal, directed);
  PROTECT(result=R_igraph_to_SEXP(&g));
  igraph_destroy(&g);

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
  if (!isNull(coords)) {
    if (0 != R_SEXP_to_igraph_matrix_copy(coords, &c_coords)) {
      igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
    }
  } else {
    igraph_matrix_init(&c_coords, 0, 0);
  }
  IGRAPH_FINALLY(igraph_matrix_destroy, &c_coords);
  c_niter=INTEGER(niter)[0];
  c_start_temp=REAL(start_temp)[0];
  if (!isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
  if (!isNull(minx)) { R_SEXP_to_vector(minx, &c_minx); }
  if (!isNull(maxx)) { R_SEXP_to_vector(maxx, &c_maxx); }
  if (!isNull(miny)) { R_SEXP_to_vector(miny, &c_miny); }
  if (!isNull(maxy)) { R_SEXP_to_vector(maxy, &c_maxy); }
  /* Call igraph */
  igraph_layout_fruchterman_reingold(&c_graph, &c_coords,
				     !isNull(coords),
				     c_niter, c_start_temp, c_grid,
				     (isNull(weights) ? 0 : &c_weights),
				     (isNull(minx) ? 0 : &c_minx),
				     (isNull(maxx) ? 0 : &c_maxx),
				     (isNull(miny) ? 0 : &c_miny),
				     (isNull(maxy) ? 0 : &c_maxy));

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
  if (!isNull(coords)) {
    if (0 != R_SEXP_to_igraph_matrix_copy(coords, &c_coords)) {
      igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
    }
  } else {
    igraph_matrix_init(&c_coords, 0, 0);
  }
  IGRAPH_FINALLY(igraph_matrix_destroy, &c_coords);
  c_niter=INTEGER(niter)[0];
  c_start_temp=REAL(start_temp)[0];
  if (!isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
  if (!isNull(minx)) { R_SEXP_to_vector(minx, &c_minx); }
  if (!isNull(maxx)) { R_SEXP_to_vector(maxx, &c_maxx); }
  if (!isNull(miny)) { R_SEXP_to_vector(miny, &c_miny); }
  if (!isNull(maxy)) { R_SEXP_to_vector(maxy, &c_maxy); }
  if (!isNull(minz)) { R_SEXP_to_vector(minz, &c_minz); }
  if (!isNull(maxz)) { R_SEXP_to_vector(maxz, &c_maxz); }
  /* Call igraph */
  igraph_layout_fruchterman_reingold_3d(&c_graph, &c_coords, !isNull(coords),
					c_niter, c_start_temp,
					(isNull(weights) ? 0 : &c_weights),
					(isNull(minx) ? 0 : &c_minx),
					(isNull(maxx) ? 0 : &c_maxx),
					(isNull(miny) ? 0 : &c_miny),
					(isNull(maxy) ? 0 : &c_maxy),
					(isNull(minz) ? 0 : &c_minz),
					(isNull(maxz) ? 0 : &c_maxz));

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
  if (!isNull(coords)) {
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
  if (!isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
  if (!isNull(minx)) { R_SEXP_to_vector(minx, &c_minx); }
  if (!isNull(maxx)) { R_SEXP_to_vector(maxx, &c_maxx); }
  if (!isNull(miny)) { R_SEXP_to_vector(miny, &c_miny); }
  if (!isNull(maxy)) { R_SEXP_to_vector(maxy, &c_maxy); }
  /* Call igraph */
  igraph_layout_kamada_kawai(&c_graph, &c_coords, !isNull(coords),
			     c_maxiter, c_epsilon, c_kkconst,
			     (isNull(weights) ? 0 : &c_weights),
			     (isNull(minx) ? 0 : &c_minx),
			     (isNull(maxx) ? 0 : &c_maxx),
			     (isNull(miny) ? 0 : &c_miny),
			     (isNull(maxy) ? 0 : &c_maxy));

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
  if (!isNull(coords)) {
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
  if (!isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
  if (!isNull(minx)) { R_SEXP_to_vector(minx, &c_minx); }
  if (!isNull(maxx)) { R_SEXP_to_vector(maxx, &c_maxx); }
  if (!isNull(miny)) { R_SEXP_to_vector(miny, &c_miny); }
  if (!isNull(maxy)) { R_SEXP_to_vector(maxy, &c_maxy); }
  if (!isNull(minz)) { R_SEXP_to_vector(minz, &c_minz); }
  if (!isNull(maxz)) { R_SEXP_to_vector(maxz, &c_maxz); }
  /* Call igraph */
  igraph_layout_kamada_kawai_3d(&c_graph, &c_coords, !isNull(coords),
				c_maxiter, c_epsilon, c_kkconst,
				(isNull(weights) ? 0 : &c_weights),
				(isNull(minx) ? 0 : &c_minx),
				(isNull(maxx) ? 0 : &c_maxx),
				(isNull(miny) ? 0 : &c_miny),
				(isNull(maxy) ? 0 : &c_maxy),
				(isNull(minz) ? 0 : &c_minz),
				(isNull(maxz) ? 0 : &c_maxz));

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
  if (isNull(start)) {
    igraph_matrix_init(&res, 0, 0);
  } else {
    R_SEXP_to_igraph_matrix_copy(start, &res);
  }
  igraph_layout_graphopt(&g, &res, niter, charge, mass, spring_length,
			 spring_constant, max_sa_movement, !isNull(start));
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
  igraph_layout_lgl(&g, &res, maxiter, maxdelta, area, coolexp, repulserad,
		    cellsize, root);
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
  igraph_minimum_spanning_tree_unweighted(&g, &mst);
  PROTECT(result=R_igraph_to_SEXP(&mst));
  igraph_destroy(&mst);

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
  igraph_minimum_spanning_tree_prim(&g, &mst, &weights);
  PROTECT(result=R_igraph_to_SEXP(&mst));
  igraph_destroy(&mst);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_get_shortest_paths(SEXP graph, SEXP pfrom, SEXP pto,
				 SEXP pmode, SEXP pno, SEXP weights,
				 SEXP output, SEXP ppred, SEXP pinbound) {

  igraph_t g;
  igraph_integer_t from=(igraph_integer_t) REAL(pfrom)[0];
  igraph_vs_t to;
  igraph_integer_t mode=(igraph_integer_t) REAL(pmode)[0];
  igraph_vector_t *vects, *evects;
  long int i;
  igraph_vector_ptr_t ptrvec, ptrevec;
  igraph_vector_t w, *pw=&w;
  SEXP result, result1, result2, names;
  igraph_bool_t verts=REAL(output)[0]==0 || REAL(output)[0]==2;
  igraph_bool_t edges=REAL(output)[0]==1 || REAL(output)[0]==2;
  igraph_bool_t pred=LOGICAL(ppred)[0];
  igraph_bool_t inbound=LOGICAL(pinbound)[0];
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

  if (isNull(weights)) {
    pw=0;
  } else {
    R_SEXP_to_vector(weights, &w);
  }

  if (pred) { igraph_vector_long_init(&predvec, no); }
  if (inbound) { igraph_vector_long_init(&inboundvec, no); }

  igraph_get_shortest_paths_dijkstra(&g,
				     verts ? &ptrvec : 0,
				     edges ? &ptrevec : 0,
				     from, to, pw, (igraph_neimode_t) mode,
				     pred ? &predvec : 0,
				     inbound ? &inboundvec : 0);
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
  SET_STRING_ELT(names, 0, mkChar("vpath"));
  SET_STRING_ELT(names, 1, mkChar("epath"));
  SET_STRING_ELT(names, 2, mkChar("predecessors"));
  SET_STRING_ELT(names, 3, mkChar("inbound_edges"));
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
  igraph_are_connected(&g, v1, v2, &res);
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
  igraph_adjacency(&g, &adjm, (igraph_adjacency_t) mode);
  PROTECT(result=R_igraph_to_SEXP(&g));
  igraph_destroy(&g);

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
  igraph_weighted_adjacency(&g, &adjm, (igraph_adjacency_t) mode, attr, loops);
  PROTECT(result=R_igraph_to_SEXP(&g));
  igraph_destroy(&g);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_average_path_length(SEXP graph, SEXP pdirected,
				  SEXP punconnected) {

  igraph_t g;
  igraph_bool_t directed=LOGICAL(pdirected)[0];
  igraph_bool_t unconnected=LOGICAL(punconnected)[0];
  igraph_real_t res;
  SEXP result;

  R_SEXP_to_igraph(graph, &g);
  igraph_average_path_length(&g, &res, directed, unconnected);

  PROTECT(result=NEW_NUMERIC(1));
  REAL(result)[0]=res;

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_star(SEXP pn, SEXP pmode, SEXP pcenter) {

  igraph_t g;
  igraph_integer_t n=(igraph_integer_t) REAL(pn)[0];
  igraph_integer_t mode=(igraph_integer_t) REAL(pmode)[0];
  igraph_integer_t center=(igraph_integer_t) REAL(pcenter)[0];
  SEXP result;

  igraph_star(&g, n, (igraph_star_mode_t) mode, center);
  PROTECT(result=R_igraph_to_SEXP(&g));
  igraph_destroy(&g);

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

  igraph_ring(&g, n, directed, mutual, circular);
  PROTECT(result=R_igraph_to_SEXP(&g));
  igraph_destroy(&g);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_tree(SEXP pn, SEXP pchildren, SEXP pmode) {

  igraph_t g;
  igraph_integer_t n=(igraph_integer_t) REAL(pn)[0];
  igraph_integer_t children=(igraph_integer_t) REAL(pchildren)[0];
  igraph_integer_t mode=(igraph_integer_t) REAL(pmode)[0];
  SEXP result;

  igraph_tree(&g, n, children, (igraph_tree_mode_t) mode);
  PROTECT(result=R_igraph_to_SEXP(&g));
  igraph_destroy(&g);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_subgraph(SEXP graph, SEXP pvids) {

  igraph_t g;
  igraph_t sub;
  igraph_vs_t vs;
  SEXP result;

  R_SEXP_to_igraph(graph, &g);
  R_SEXP_to_igraph_vs(pvids, &g, &vs);
  igraph_subgraph(&g, &sub, vs);
  PROTECT(result=R_igraph_to_SEXP(&sub));
  igraph_destroy(&sub);
  igraph_vs_destroy(&vs);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_layout_random(SEXP graph) {

  igraph_t g;
  igraph_matrix_t res;
  SEXP result=R_NilValue;

  R_SEXP_to_igraph(graph, &g);
  igraph_matrix_init(&res, 0, 0);
  igraph_layout_random(&g, &res);
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
  igraph_layout_circle(&g, &res, order);
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
  igraph_destroy(&g);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_full(SEXP pn, SEXP pdirected, SEXP ploops) {

  igraph_t g;
  igraph_integer_t n=(igraph_integer_t) REAL(pn)[0];
  igraph_bool_t directed=LOGICAL(pdirected)[0];
  igraph_bool_t loops=LOGICAL(ploops)[0];
  SEXP result;

  igraph_full(&g, n, directed, loops);
  PROTECT(result=R_igraph_to_SEXP(&g));
  igraph_destroy(&g);

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
  igraph_random_sample(&res, low, high, length);
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
  igraph_get_edgelist(&g, &res, bycol);
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
  igraph_get_adjacency(&g, &res, (igraph_get_adjacency_t) type, eids);
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
  if (!isNull(pin_seq)) { R_SEXP_to_vector(pin_seq, &inseq); }
  igraph_degree_sequence_game(&g, &outseq,
			      isNull(pin_seq) ? 0 : &inseq,
			      (igraph_degseq_t) method);
  PROTECT(result=R_igraph_to_SEXP(&g));
  igraph_destroy(&g);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_transitivity_undirected(SEXP graph, SEXP pisolates) {

  igraph_t g;
  igraph_real_t res;
  SEXP result;
  igraph_transitivity_mode_t isolates=REAL(pisolates)[0];

  R_SEXP_to_igraph(graph, &g);
  igraph_transitivity_undirected(&g, &res, isolates);
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
  igraph_transitivity_avglocal_undirected(&g, &res, isolates);
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
  igraph_transitivity_local_undirected(&g, &res, vs, isolates);

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
  igraph_transitivity_barrat(&g, &res, vs, &weights, isolates);

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
  igraph_transitivity_local_undirected(&g, &res, igraph_vss_all(),
				       isolates);

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
  igraph_read_graph_edgelist(&g, file, n, directed);
  fclose(file);
  PROTECT(result=R_igraph_to_SEXP(&g));
  igraph_destroy(&g);

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
  igraph_read_graph_gml(&g, file);
  fclose(file);
  PROTECT(result=R_igraph_to_SEXP(&g));
  igraph_destroy(&g);

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
  igraph_read_graph_dl(&g, file, directed);
  fclose(file);
  PROTECT(result=R_igraph_to_SEXP(&g));
  igraph_destroy(&g);

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
  igraph_read_graph_graphdb(&g, file, directed);
  fclose(file);
  PROTECT(result=R_igraph_to_SEXP(&g));
  igraph_destroy(&g);

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
  igraph_write_graph_edgelist(&g, stream);
  fclose(stream);
#if HAVE_OPEN_MEMSTREAM == 1
  PROTECT(result=allocVector(RAWSXP, size));
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

  if (!isNull(pid)) { R_SEXP_to_vector(pid, &id); ppid=&id; }
  if (!isNull(pcreator)) { creator=CHAR(STRING_ELT(pcreator, 0)); }
  R_SEXP_to_igraph(graph, &g);
#if HAVE_OPEN_MEMSTREAM == 1
  stream=open_memstream(&bp, &size);
#else
  stream=fopen(CHAR(STRING_ELT(file, 0)), "w");
#endif
  if (stream==0) { igraph_error("Cannot write edgelist", __FILE__, __LINE__,
				IGRAPH_EFILE); }
  igraph_write_graph_gml(&g, stream, ppid, creator);
  fclose(stream);
#if HAVE_OPEN_MEMSTREAM == 1
  PROTECT(result=allocVector(RAWSXP, size));
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
  igraph_write_graph_dot(&g, stream);
  fclose(stream);
#if HAVE_OPEN_MEMSTREAM == 1
  PROTECT(result=allocVector(RAWSXP, size));
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
  igraph_write_graph_leda(&g, stream,
			  isNull(va) ? 0 : CHAR(STRING_ELT(va, 0)),
			  isNull(ea) ? 0 : CHAR(STRING_ELT(ea, 0)));
  fclose(stream);
#if HAVE_OPEN_MEMSTREAM == 1
  PROTECT(result=allocVector(RAWSXP, size));
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
  igraph_write_graph_pajek(&g, stream);
  fclose(stream);
#if HAVE_OPEN_MEMSTREAM == 1
  PROTECT(result=allocVector(RAWSXP, size));
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
  igraph_read_graph_ncol(&g, file, predefptr, names, weights, directed);
  fclose(file);
  PROTECT(result=R_igraph_to_SEXP(&g));
  igraph_destroy(&g);

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

  if (isNull(pnames)) {
    names=0;
  } else {
    names=CHAR(STRING_ELT(pnames, 0));
  }
  if (isNull(pweights)) {
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
  igraph_write_graph_ncol(&g, stream, names, weights);
  fclose(stream);
#if HAVE_OPEN_MEMSTREAM == 1
  PROTECT(result=allocVector(RAWSXP, size));
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
  igraph_read_graph_lgl(&g, file, names, weights, directed);
  fclose(file);
  PROTECT(result=R_igraph_to_SEXP(&g));
  igraph_destroy(&g);

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

  if (isNull(pnames)) {
    names=0;
  } else {
    names=CHAR(STRING_ELT(pnames, 0));
  }
  if (isNull(pweights)) {
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
  igraph_write_graph_lgl(&g, stream, names, weights, isolates);
  fclose(stream);
#if HAVE_OPEN_MEMSTREAM == 1
  PROTECT(result=allocVector(RAWSXP, size));
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
  igraph_read_graph_pajek(&g, file);
  fclose(file);
  PROTECT(result=R_igraph_to_SEXP(&g));
  igraph_destroy(&g);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_decompose(SEXP graph, SEXP pmode, SEXP pmaxcompno,
			SEXP pminelements) {

  igraph_t g;
  igraph_integer_t mode=(igraph_integer_t) REAL(pmode)[0];
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
  igraph_decompose(&g, &comps, (igraph_connectedness_t) mode, maxcompno,
		   minelements);
  PROTECT(result=NEW_LIST(igraph_vector_ptr_size(&comps)));
  for (i=0; i<igraph_vector_ptr_size(&comps); i++) {
    SET_VECTOR_ELT(result, i, R_igraph_to_SEXP(VECTOR(comps)[i]));
    igraph_destroy(VECTOR(comps)[i]);
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

  igraph_atlas(&g, no);
  PROTECT(result=R_igraph_to_SEXP(&g));
  igraph_destroy(&g);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_layout_random_3d(SEXP graph) {

  igraph_t g;
  igraph_matrix_t res;
  SEXP result;

  R_SEXP_to_igraph(graph, &g);
  igraph_matrix_init(&res, 0, 0);
  igraph_layout_random_3d(&g, &res);
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
  igraph_layout_sphere(&g, &res);
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
  igraph_callaway_traits_game(&g, nodes, types, epers, &type_dist,
			      &matrix, directed);
  PROTECT(result=R_igraph_to_SEXP(&g));
  igraph_destroy(&g);

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
  igraph_establishment_game(&g, nodes, types, k, &type_dist, &matrix,
			    directed);
  PROTECT(result=R_igraph_to_SEXP(&g));
  igraph_destroy(&g);

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
  igraph_motifs_randesu(&g, &res, size, &cutprob);
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
  igraph_motifs_randesu_no(&g, &res, size, &cutprob);
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
  igraph_motifs_randesu_estimate(&g, &res, size, &cutprob, samplesize,
				 sampleptr);
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
  igraph_layout_merge_dla(&graphvec, &ptrvec, &res);
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
  igraph_disjoint_union_many(&res, &ptrvec);
  igraph_vector_ptr_destroy(&ptrvec);
  PROTECT(result=R_igraph_to_SEXP(&res));
  igraph_destroy(&res);

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
  igraph_union_many(&res, &ptrvec, my_edgemaps);
  igraph_vector_ptr_destroy(&ptrvec);
  PROTECT(result=NEW_LIST(2));
  SET_VECTOR_ELT(result, 0, R_igraph_to_SEXP(&res));
  SET_VECTOR_ELT(result, 1, R_igraph_0orvectorlist_to_SEXP(my_edgemaps));
  PROTECT(names=NEW_CHARACTER(2));
  SET_STRING_ELT(names, 0, mkChar("graph"));
  SET_STRING_ELT(names, 1, mkChar("edgemaps"));
  SET_NAMES(result, names);
  igraph_destroy(&res);
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
  igraph_intersection_many(&res, &ptrvec, my_edgemaps);
  igraph_vector_ptr_destroy(&ptrvec);
  PROTECT(result=NEW_LIST(2));
  SET_VECTOR_ELT(result, 0, R_igraph_to_SEXP(&res));
  SET_VECTOR_ELT(result, 1, R_igraph_0orvectorlist_to_SEXP(my_edgemaps));
  PROTECT(names=NEW_CHARACTER(2));
  SET_STRING_ELT(names, 0, mkChar("graph"));
  SET_STRING_ELT(names, 1, mkChar("edgemaps"));
  SET_NAMES(result, names);
  igraph_destroy(&res);
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
  igraph_difference(&res, &left, &right);
  PROTECT(result=R_igraph_to_SEXP(&res));
  igraph_destroy(&res);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_complementer(SEXP pgraph, SEXP ploops) {

  igraph_t g;
  igraph_t res;
  igraph_bool_t loops=LOGICAL(ploops)[0];
  SEXP result;

  R_SEXP_to_igraph(pgraph, &g);
  igraph_complementer(&res, &g, loops);
  PROTECT(result=R_igraph_to_SEXP(&res));
  igraph_destroy(&res);

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
  igraph_compose(&res, &left, &right, my_edgemap1, my_edgemap2);
  PROTECT(result=NEW_LIST(3));
  SET_VECTOR_ELT(result, 0, R_igraph_to_SEXP(&res));
  igraph_destroy(&res);
  SET_VECTOR_ELT(result, 2, R_igraph_0orvector_to_SEXP(my_edgemap2));
  if (edgemaps) {
    igraph_vector_destroy(my_edgemap2);
    IGRAPH_FINALLY_CLEAN(1);
  }
  igraph_destroy(&res);
  SET_VECTOR_ELT(result, 1, R_igraph_0orvector_to_SEXP(my_edgemap1));
  if (edgemaps) {
    igraph_vector_destroy(my_edgemap1);
    IGRAPH_FINALLY_CLEAN(1);
  }
  PROTECT(names=NEW_CHARACTER(3));
  SET_STRING_ELT(names, 0, mkChar("graph"));
  SET_STRING_ELT(names, 1, mkChar("edge_map1"));
  SET_STRING_ELT(names, 2, mkChar("edge_map2"));
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

  igraph_barabasi_aging_game(&g, n, m, &out_seq, out_pref, pa_exp, aging_exp,
			     aging_bin, zero_deg_appeal, zero_age_appeal,
			     deg_coef, age_coef, directed);
  PROTECT(result=R_igraph_to_SEXP(&g));
  igraph_destroy(&g);

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

  igraph_recent_degree_aging_game(&g, n, m, &out_seq, out_pref, pa_exp,
				  aging_exp, aging_bin, time_window,
				  zero_appeal, directed);
  PROTECT(result=R_igraph_to_SEXP(&g));
  igraph_destroy(&g);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_get_edge(SEXP graph, SEXP peid) {

  igraph_t g;
  igraph_integer_t eid=(igraph_integer_t) REAL(peid)[0];
  igraph_integer_t from, to;
  SEXP result;

  R_SEXP_to_igraph(graph, &g);
  igraph_edge(&g, eid, &from, &to);
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
  igraph_edges(&g, es, &res);

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
  igraph_constraint(&g, &res, vs, wptr);

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
  igraph_reciprocity(&g, &res, ignore_loops, mode);
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
    igraph_layout_reingold_tilford(&g, &res, (igraph_neimode_t) mode,
				   LENGTH(proot)==0 ? 0 : &root,
				   &rootlevel);
  } else {
    igraph_layout_reingold_tilford_circular(&g, &res, (igraph_neimode_t) mode,
					    LENGTH(proot)==0 ? 0 : &root,
					    &rootlevel);
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
  igraph_rewire(&g, n, mode);
  PROTECT(result=R_igraph_to_SEXP(&g));
  igraph_destroy(&g);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_to_directed(SEXP graph, SEXP pmode) {

  igraph_t g;
  igraph_integer_t mode=(igraph_integer_t) REAL(pmode)[0];
  SEXP result;

  R_SEXP_to_igraph_copy(graph, &g);
  igraph_to_directed(&g, (igraph_to_directed_t) mode);
  PROTECT(result=R_igraph_to_SEXP(&g));
  igraph_destroy(&g);

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
  igraph_read_graph_graphml(&g, file, index);
  fclose(file);
  PROTECT(result=R_igraph_to_SEXP(&g));
  igraph_destroy(&g);

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
  igraph_write_graph_graphml(&g, stream, prefixattr);
  fclose(stream);
#if HAVE_OPEN_MEMSTREAM == 1
  PROTECT(result=allocVector(RAWSXP, size));
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
    igraph_neighbors(&g, &neis, IGRAPH_VIT_GET(vv), (igraph_neimode_t) mode);
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
    igraph_edge(&g, IGRAPH_EIT_GET(ee), &from, &to);
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
    igraph_incident(&g, &adje, IGRAPH_VIT_GET(vv), (igraph_neimode_t) mode);
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
  igraph_grg_game(&g, n, radius, torus, px, py);
  PROTECT(result=NEW_LIST(3));
  SET_VECTOR_ELT(result, 0, R_igraph_to_SEXP(&g));
  igraph_destroy(&g);
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
  igraph_density(&g, &res, loops);

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
  igraph_read_graph_dimacs(&g, file, &problem, &label,
			   &source, &target, &cap, directed);
  fclose(file);
  if (!strcmp(STR(problem, 0), "max")) {
    PROTECT(result=NEW_LIST(5)); px++;
    SET_VECTOR_ELT(result, 0, R_igraph_strvector_to_SEXP(&problem));
    igraph_strvector_destroy(&problem);
    SET_VECTOR_ELT(result, 1, R_igraph_to_SEXP(&g));
    igraph_destroy(&g);
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
    igraph_destroy(&g);
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
  igraph_write_graph_dimacs(&g, stream, source, target, &cap);
  fclose(stream);
#if HAVE_OPEN_MEMSTREAM == 1
  PROTECT(result=allocVector(RAWSXP, size));
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
  if (!isNull(pcapacity)) {
    R_SEXP_to_vector(pcapacity, &capacity);
    ppcapacity=&capacity;
  }

  igraph_mincut(&g, &value, &partition,
		&partition2, &cut, ppcapacity);

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
  SET_STRING_ELT(names, 0, CREATE_STRING_VECTOR("value"));
  SET_STRING_ELT(names, 1, CREATE_STRING_VECTOR("cut"));
  SET_STRING_ELT(names, 2, CREATE_STRING_VECTOR("partition1"));
  SET_STRING_ELT(names, 3, CREATE_STRING_VECTOR("partition2"));
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
  if (!isNull(pcapacity)) {
    R_SEXP_to_vector(pcapacity, &capacity);
    ppcapacity=&capacity;
  }
  igraph_mincut_value(&g, &res, ppcapacity);

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
  igraph_st_vertex_connectivity(&g, &res, source, target,
				IGRAPH_VCONN_NEI_ERROR);

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
  igraph_vertex_connectivity(&g, &res, checks);

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
  igraph_st_edge_connectivity(&g, &value, source, target);

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
  igraph_edge_connectivity(&g, &res, checks);

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
  if (!isNull(pcapacity)) {
    R_SEXP_to_vector(pcapacity, &capacity);
    ppcapacity=&capacity;
  }
  igraph_st_mincut_value(&g, &res, source, target, ppcapacity);
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
  igraph_edge_disjoint_paths(&g, &res, source, target);
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
  igraph_vertex_disjoint_paths(&g, &res, source, target);
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
  igraph_adhesion(&g, &res, checks);
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
  igraph_cohesion(&g, &res, checks);
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
  if (!isNull(weights)) {
    pweights=&v_weights; R_SEXP_to_vector(weights, &v_weights);
  }
  igraph_vector_init(&membership, 0);
  igraph_vector_init(&csize, 0);
  igraph_community_spinglass(&g, pweights,
			     &modularity, &temperature,
			     &membership, &csize,
			     spins, parupdate, starttemp, stoptemp,
			     coolfact, update_rule, gamma,
			     implementation, lambda);

  PROTECT(result=NEW_LIST(4));
  PROTECT(names=NEW_CHARACTER(4));
  SET_VECTOR_ELT(result, 0, NEW_NUMERIC(igraph_vector_size(&membership)));
  SET_VECTOR_ELT(result, 1, NEW_NUMERIC(igraph_vector_size(&csize)));
  SET_VECTOR_ELT(result, 2, NEW_NUMERIC(1));
  SET_VECTOR_ELT(result, 3, NEW_NUMERIC(1));
  SET_STRING_ELT(names, 0, CREATE_STRING_VECTOR("membership"));
  SET_STRING_ELT(names, 1, CREATE_STRING_VECTOR("csize"));
  SET_STRING_ELT(names, 2, CREATE_STRING_VECTOR("modularity"));
  SET_STRING_ELT(names, 3, CREATE_STRING_VECTOR("temperature"));
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
  if (!isNull(weights)) {
    pweights=&v_weights; R_SEXP_to_vector(weights, &v_weights);
  }
  igraph_vector_init(&community, 0);
  igraph_community_spinglass_single(&g, pweights, vertex, &community,
				    &cohesion, &adhesion, &inner_links,
				    &outer_links, spins, update_rule, gamma);

  PROTECT(result=NEW_LIST(5));
  PROTECT(names=NEW_CHARACTER(5));
  SET_VECTOR_ELT(result, 0, NEW_NUMERIC(igraph_vector_size(&community)));
  SET_VECTOR_ELT(result, 1, NEW_NUMERIC(1));
  SET_VECTOR_ELT(result, 2, NEW_NUMERIC(1));
  SET_VECTOR_ELT(result, 3, NEW_NUMERIC(1));
  SET_VECTOR_ELT(result, 4, NEW_NUMERIC(1));
  SET_STRING_ELT(names, 0, CREATE_STRING_VECTOR("community"));
  SET_STRING_ELT(names, 1, CREATE_STRING_VECTOR("cohesion"));
  SET_STRING_ELT(names, 2, CREATE_STRING_VECTOR("adhesion"));
  SET_STRING_ELT(names, 3, CREATE_STRING_VECTOR("inner.links"));
  SET_STRING_ELT(names, 4, CREATE_STRING_VECTOR("outer.links"));
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
  igraph_clusters(&g, 0, 0, &res, (igraph_connectedness_t) mode);
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
  igraph_neighborhood_size(&g, &res, vids, order, (igraph_neimode_t) mode,
			   mindist);
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
  igraph_neighborhood(&g, &res, vids, order, (igraph_neimode_t) mode,
		      mindist);
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
  igraph_neighborhood_graphs(&g, &res, vids, order, (igraph_neimode_t) mode,
			     mindist);
  PROTECT(result=NEW_LIST(igraph_vector_ptr_size(&res)));
  for (i=0; i<igraph_vector_ptr_size(&res); i++) {
    igraph_t *g=VECTOR(res)[i];
    SET_VECTOR_ELT(result, i, R_igraph_to_SEXP(g));
    igraph_destroy(g);
    igraph_free(g);
  }
  igraph_vector_ptr_destroy(&res);
  igraph_vs_destroy(&vids);

  UNPROTECT(1);
  IGRAPH_FINALLY_CLEAN(1);
  R_igraph_attribute_protected_destroy(0);

  return result;
}

SEXP R_igraph_preference_game(SEXP pnodes, SEXP ptypes, SEXP ptype_dist,
			      SEXP pfixed_sizes, SEXP pmatrix,
			      SEXP pdirected, SEXP ploops) {
  igraph_t g;
  igraph_integer_t nodes=(igraph_integer_t) REAL(pnodes)[0];
  igraph_integer_t types=(igraph_integer_t) REAL(ptypes)[0];
  igraph_vector_t type_dist;
  igraph_bool_t fixed_sizes=LOGICAL(pfixed_sizes)[0];
  igraph_matrix_t matrix;
  igraph_bool_t directed=LOGICAL(pdirected)[0];
  igraph_bool_t loops=LOGICAL(ploops)[0];
  igraph_vector_t vtypes;
  SEXP result;

  R_SEXP_to_vector(ptype_dist, &type_dist);
  R_SEXP_to_matrix(pmatrix, &matrix);
  if (0!=igraph_vector_init(&vtypes, 0)) {
    igraph_error("Cannot run preference game",
		 __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &vtypes);
  igraph_preference_game(&g, nodes, types, &type_dist, fixed_sizes,
			 &matrix, &vtypes,
			 directed, loops);
  IGRAPH_FINALLY(igraph_destroy, &g);
  PROTECT(result=NEW_LIST(2));
  SET_VECTOR_ELT(result, 0, R_igraph_to_SEXP(&g));
  SET_VECTOR_ELT(result, 1, R_igraph_vector_to_SEXP(&vtypes));
  igraph_destroy(&g);
  igraph_vector_destroy(&vtypes);
  IGRAPH_FINALLY_CLEAN(2);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_asymmetric_preference_game(SEXP pnodes, SEXP ptypes,
					 SEXP ptype_dist_matrix, SEXP pmatrix,
					 SEXP ploops) {

  igraph_t g;
  igraph_integer_t nodes=(igraph_integer_t) REAL(pnodes)[0];
  igraph_integer_t types=(igraph_integer_t) REAL(ptypes)[0];
  igraph_matrix_t type_dist_matrix;
  igraph_matrix_t matrix;
  igraph_bool_t loops=LOGICAL(ploops)[0];
  SEXP result;

  R_SEXP_to_matrix(ptype_dist_matrix, &type_dist_matrix);
  R_SEXP_to_matrix(pmatrix, &matrix);
  igraph_asymmetric_preference_game(&g, nodes, types, &type_dist_matrix,
				    &matrix, 0, 0, loops);
  PROTECT(result=R_igraph_to_SEXP(&g));
  igraph_destroy(&g);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_connect_neighborhood(SEXP graph, SEXP porder, SEXP pmode) {

  igraph_t g;
  igraph_integer_t order=(igraph_integer_t) REAL(porder)[0];
  igraph_integer_t mode=(igraph_integer_t) REAL(pmode)[0];
  SEXP result;

  R_SEXP_to_igraph_copy(graph, &g);
  igraph_connect_neighborhood(&g, order, (igraph_neimode_t) mode);
  PROTECT(result=R_igraph_to_SEXP(&g));
  igraph_destroy(&g);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_rewire_edges(SEXP graph, SEXP pprob, SEXP ploops,
			   SEXP pmultiple) {

  igraph_t g;
  igraph_real_t prob=REAL(pprob)[0];
  igraph_bool_t loops=LOGICAL(ploops)[0];
  igraph_bool_t multiple=LOGICAL(pmultiple)[0];
  SEXP result;

  R_SEXP_to_igraph_copy(graph, &g);
  igraph_rewire_edges(&g, prob, loops, multiple);
  PROTECT(result=R_igraph_to_SEXP(&g));
  igraph_destroy(&g);

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

  igraph_watts_strogatz_game(&g, dim, size, nei, p, loops, multiple);
  PROTECT(result=R_igraph_to_SEXP(&g));
  igraph_destroy(&g);

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
  igraph_coreness(&g, &res, (igraph_neimode_t) mode);

  PROTECT(result=NEW_NUMERIC(igraph_vector_size(&res)));
  igraph_vector_copy_to(&res, REAL(result));
  igraph_vector_destroy(&res);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_cliques(SEXP graph, SEXP pminsize, SEXP pmaxsize) {

  igraph_t g;
  igraph_vector_ptr_t ptrvec;
  igraph_integer_t minsize=(igraph_integer_t) REAL(pminsize)[0];
  igraph_integer_t maxsize=(igraph_integer_t) REAL(pmaxsize)[0];
  long int i;
  SEXP result;

  R_SEXP_to_igraph(graph, &g);
  igraph_vector_ptr_init(&ptrvec, 0);
  igraph_cliques(&g, &ptrvec, minsize, maxsize);
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

SEXP R_igraph_largest_cliques(SEXP graph) {

  igraph_t g;
  igraph_vector_ptr_t ptrvec;
  long int i;
  SEXP result;

  R_SEXP_to_igraph(graph, &g);
  igraph_vector_ptr_init(&ptrvec,0);
  igraph_largest_cliques(&g, &ptrvec);
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
  if (!isNull(psubset)) { R_SEXP_to_vector_int(psubset, &subset); }
  igraph_vector_ptr_init(&ptrvec,0);
  igraph_maximal_cliques_subset(&g, isNull(psubset) ? 0 : &subset,
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
  if (!isNull(psubset)) { R_SEXP_to_vector_int(psubset, &subset); }
#if HAVE_OPEN_MEMSTREAM == 1
  stream=open_memstream(&bp, &size);
#else
  stream=fopen(CHAR(STRING_ELT(file, 0)), "w");
#endif
  if (stream==0) { igraph_error("Cannot write cliques", __FILE__,
				__LINE__, IGRAPH_EFILE); }
  igraph_maximal_cliques_subset(&g, isNull(psubset) ? 0 : &subset,
				/*ptr=*/ 0, /*no=*/ 0, /*file=*/ stream,
				minsize, maxsize);
  fclose(stream);
#if HAVE_OPEN_MEMSTREAM == 1
  PROTECT(result=allocVector(RAWSXP, size));
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
  if (!isNull(psubset)) { R_SEXP_to_vector_int(psubset, &subset); }
  c_min_size=INTEGER(min_size)[0];
  c_max_size=INTEGER(max_size)[0];
                                        /* Call igraph */
  igraph_maximal_cliques_subset(&c_graph, isNull(psubset) ? 0 : &subset,
				/*ptr=*/ 0, &c_no, /*file=*/ 0,
				c_min_size, c_max_size);

                                        /* Convert output */
  PROTECT(no=NEW_INTEGER(1));
  INTEGER(no)[0]=c_no;
  result=no;

  UNPROTECT(1);
  return(result);
}

SEXP R_igraph_clique_number(SEXP graph) {

  igraph_t g;
  igraph_integer_t res;
  SEXP result;

  R_SEXP_to_igraph(graph, &g);
  igraph_clique_number(&g, &res);
  PROTECT(result=NEW_NUMERIC(1));
  REAL(result)[0]=res;

  UNPROTECT(1);
  return result;
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
  igraph_independent_vertex_sets(&g, &ptrvec, minsize, maxsize);
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
  igraph_largest_independent_vertex_sets(&g, &ptrvec);
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
  igraph_maximal_independent_vertex_sets(&g, &ptrvec);
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
  igraph_independence_number(&g, &res);
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
  igraph_lastcit_game(&g, nodes, edges, agebins, &preference, directed);
  PROTECT(result=R_igraph_to_SEXP(&g));
  igraph_destroy(&g);

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
  igraph_cited_type_game(&g, nodes, &types, &pref, edges, directed);
  PROTECT(result=R_igraph_to_SEXP(&g));
  igraph_destroy(&g);

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
  igraph_citing_cited_type_game(&g, nodes, &types, &pref, edges, directed);
  PROTECT(result=R_igraph_to_SEXP(&g));
  igraph_destroy(&g);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_walktrap_community(SEXP graph, SEXP pweights,
				 SEXP psteps, SEXP pmerges,
				 SEXP pmodularity, SEXP pmembership) {
  igraph_t g;
  igraph_vector_t weights, *ppweights=0;
  igraph_integer_t steps=(igraph_integer_t) REAL(psteps)[0];
  igraph_matrix_t merges, *ppmerges=0;
  igraph_vector_t modularity, *ppmodularity=0;
  igraph_vector_t membership, *ppmembership=0;
  SEXP result, names;

  R_SEXP_to_igraph(graph, &g);
  if (!isNull(pweights)) {
    ppweights=&weights;
    R_SEXP_to_vector(pweights, ppweights);
  }
  if (LOGICAL(pmerges)[0]) {
    ppmerges=&merges;
    igraph_matrix_init(ppmerges, 0, 0);
  }
  if (LOGICAL(pmodularity)[0]) {
    ppmodularity=&modularity;
    igraph_vector_init(ppmodularity, 0);
  }
  if (LOGICAL(pmembership)[0]) {
    ppmembership=&membership;
    igraph_vector_init(ppmembership, 0);
  }

  igraph_community_walktrap(&g, ppweights, steps, ppmerges, ppmodularity,
			    ppmembership);

  PROTECT(result=NEW_LIST(3));
  SET_VECTOR_ELT(result, 0, R_igraph_0ormatrix_to_SEXP(ppmerges));
  if (ppmerges) { igraph_matrix_destroy(ppmerges); }
  SET_VECTOR_ELT(result, 1, R_igraph_0orvector_to_SEXP(ppmodularity));
  if (ppmodularity) { igraph_vector_destroy(ppmodularity); }
  SET_VECTOR_ELT(result, 2, R_igraph_0orvector_to_SEXP(ppmembership));
  if (ppmembership) { igraph_vector_destroy(ppmembership); }
  PROTECT(names=NEW_CHARACTER(3));
  SET_STRING_ELT(names, 0, CREATE_STRING_VECTOR("merges"));
  SET_STRING_ELT(names, 1, CREATE_STRING_VECTOR("modularity"));
  SET_STRING_ELT(names, 2, CREATE_STRING_VECTOR("membership"));
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
  igraph_topological_sorting(&g, &res, (igraph_neimode_t) mode);

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
  if (!isNull(pweights)) {
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
  igraph_community_edge_betweenness(&g, &res, ppeb, ppmerges, ppbridges,
				    ppmodularity, ppmembership,
				    directed, ppweights);

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
  SET_STRING_ELT(names, 0, CREATE_STRING_VECTOR("removed.edges"));
  SET_STRING_ELT(names, 1, CREATE_STRING_VECTOR("edge.betweenness"));
  SET_STRING_ELT(names, 2, CREATE_STRING_VECTOR("merges"));
  SET_STRING_ELT(names, 3, CREATE_STRING_VECTOR("bridges"));
  SET_STRING_ELT(names, 4, CREATE_STRING_VECTOR("modularity"));
  SET_STRING_ELT(names, 5, CREATE_STRING_VECTOR("membership"));
  SET_NAMES(result, names);

  UNPROTECT(2);
  return result;
}

SEXP R_igraph_community_eb_get_merges(SEXP graph, SEXP pweights,
				      SEXP pedges) {

  igraph_t g;
  igraph_vector_t weights, *ppweights=0;
  igraph_vector_t edges;
  igraph_vector_t bridges;
  igraph_matrix_t res;
  SEXP result, names;

  R_SEXP_to_igraph(graph, &g);
  if (!isNull(pweights)) {
    ppweights=&weights;
    R_SEXP_to_vector(pweights, ppweights);
  }
  R_SEXP_to_vector(pedges, &edges);
  igraph_matrix_init(&res, 0, 0);
  igraph_vector_init(&bridges, 0);
  igraph_community_eb_get_merges(&g, &edges, &weights, &res, &bridges,
				 /*modularity=*/ 0, /*membership=*/ 0);
  PROTECT(result=NEW_LIST(2));
  SET_VECTOR_ELT(result, 0, R_igraph_matrix_to_SEXP(&res));
  igraph_matrix_destroy(&res);
  SET_VECTOR_ELT(result, 1, R_igraph_vector_to_SEXP(&bridges));
  igraph_vector_destroy(&bridges);
  PROTECT(names=NEW_CHARACTER(2));
  SET_STRING_ELT(names, 0, CREATE_STRING_VECTOR("merges"));
  SET_STRING_ELT(names, 1, CREATE_STRING_VECTOR("bridges"));
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

  if (!isNull(pweights)) {
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
  igraph_community_fastgreedy(&g, ppweights, ppmerges, ppmodularity,
			      ppmembership);
  PROTECT(result=NEW_LIST(3));
  SET_VECTOR_ELT(result, 0, R_igraph_0ormatrix_to_SEXP(ppmerges));
  if (ppmerges) { igraph_matrix_destroy(ppmerges); }
  SET_VECTOR_ELT(result, 1, R_igraph_0orvector_to_SEXP(ppmodularity));
  if (ppmodularity) { igraph_vector_destroy(ppmodularity); }
  SET_VECTOR_ELT(result, 2, R_igraph_0orvector_to_SEXP(ppmembership));
  if (ppmembership) { igraph_vector_destroy(ppmembership); }
  PROTECT(names=NEW_CHARACTER(3));
  SET_STRING_ELT(names, 0, CREATE_STRING_VECTOR("merges"));
  SET_STRING_ELT(names, 1, CREATE_STRING_VECTOR("modularity"));
  SET_STRING_ELT(names, 2, CREATE_STRING_VECTOR("membership"));
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
  igraph_community_to_membership(&merges, nodes, steps, ppmembership, ppcsize);
  PROTECT(result=NEW_LIST(2));
  SET_VECTOR_ELT(result, 0, R_igraph_0orvector_to_SEXP(ppmembership));
  if (ppmembership) { igraph_vector_destroy(ppmembership); }
  SET_VECTOR_ELT(result, 1, R_igraph_0orvector_to_SEXP(ppcsize));
  if (ppcsize) { igraph_vector_destroy(ppcsize); }
  PROTECT(names=NEW_CHARACTER(2));
  SET_STRING_ELT(names, 0, CREATE_STRING_VECTOR("membership"));
  SET_STRING_ELT(names, 1, CREATE_STRING_VECTOR("csize"));
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

  igraph_community_to_membership(&merges, vcount, steps, &membership, 0);
  PROTECT(result=R_igraph_vector_to_SEXP(&membership));
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

  igraph_girth(&g, &girth, ppcircle);

  PROTECT(result=NEW_LIST(2));
  SET_VECTOR_ELT(result, 0, NEW_NUMERIC(1));
  REAL(VECTOR_ELT(result, 0))[0]=girth;
  SET_VECTOR_ELT(result, 1, R_igraph_0orvector_to_SEXPp1(ppcircle));
  if (ppcircle) { igraph_vector_destroy(ppcircle); }
  PROTECT(names=NEW_CHARACTER(2));
  SET_STRING_ELT(names, 0, CREATE_STRING_VECTOR("girth"));
  SET_STRING_ELT(names, 1, CREATE_STRING_VECTOR("circle"));
  SET_NAMES(result, names);

  UNPROTECT(2);
  return result;
}

SEXP R_igraph_linegraph(SEXP graph) {

  igraph_t g, lg;
  SEXP result;

  R_SEXP_to_igraph(graph, &g);
  igraph_linegraph(&g, &lg);
  PROTECT(result=R_igraph_to_SEXP(&lg));
  igraph_destroy(&lg);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_de_bruijn(SEXP pm, SEXP pn) {

  igraph_t g;
  igraph_integer_t m=(igraph_integer_t) REAL(pm)[0];
  igraph_integer_t n=(igraph_integer_t) REAL(pn)[0];
  SEXP result;

  igraph_de_bruijn(&g, m, n);
  PROTECT(result=R_igraph_to_SEXP(&g));
  igraph_destroy(&g);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_kautz(SEXP pm, SEXP pn) {

  igraph_t g;
  igraph_integer_t m=(igraph_integer_t) REAL(pm)[0];
  igraph_integer_t n=(igraph_integer_t) REAL(pn)[0];
  SEXP result;

  igraph_kautz(&g, m, n);
  PROTECT(result=R_igraph_to_SEXP(&g));
  igraph_destroy(&g);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_is_loop(SEXP graph, SEXP edges) {

  igraph_es_t es;
  igraph_t g;
  igraph_vector_bool_t res;
  SEXP result;

  R_SEXP_to_igraph(graph, &g);
  R_SEXP_to_igraph_es(edges, &g, &es);
  igraph_vector_bool_init(&res, 0);
  igraph_is_loop(&g, &res, es);
  PROTECT(result=R_igraph_vector_bool_to_SEXP(&res));
  igraph_vector_bool_destroy(&res);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_is_multiple(SEXP graph, SEXP edges) {

  igraph_es_t es;
  igraph_t g;
  igraph_vector_bool_t res;
  SEXP result;

  R_SEXP_to_igraph(graph, &g);
  R_SEXP_to_igraph_es(edges, &g, &es);
  igraph_vector_bool_init(&res, 0);
  igraph_is_multiple(&g, &res, es);
  PROTECT(result=R_igraph_vector_bool_to_SEXP(&res));
  igraph_vector_bool_destroy(&res);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_count_multiple(SEXP graph, SEXP edges) {

  igraph_es_t es;
  igraph_t g;
  igraph_vector_t res;
  SEXP result;

  R_SEXP_to_igraph(graph, &g);
  R_SEXP_to_igraph_es(edges, &g, &es);
  igraph_vector_init(&res, 0);
  igraph_count_multiple(&g, &res, es);
  PROTECT(result=R_igraph_vector_to_SEXP(&res));
  igraph_vector_destroy(&res);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_famous(SEXP name) {

  igraph_t g;
  SEXP result;

  igraph_famous(&g, CHAR(STRING_ELT(name, 0)));
  PROTECT(result=R_igraph_to_SEXP(&g));
  igraph_destroy(&g);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_get_adjlist(SEXP graph, SEXP pmode) {

  igraph_t g;
  igraph_integer_t mode=(igraph_integer_t) REAL(pmode)[0];
  SEXP result;
  int i;
  long int no_of_nodes;
  igraph_vector_t neis;

  R_SEXP_to_igraph(graph, &g);
  no_of_nodes=igraph_vcount(&g);
  igraph_vector_init(&neis, 0);
  PROTECT(result=NEW_LIST(no_of_nodes));
  for (i=0; i<no_of_nodes; i++) {
    igraph_neighbors(&g, &neis, i, (igraph_neimode_t) mode);
    SET_VECTOR_ELT(result, i, R_igraph_vector_to_SEXP(&neis));
  }
  igraph_vector_destroy(&neis);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_get_adjedgelist(SEXP graph, SEXP pmode) {

  igraph_t g;
  igraph_integer_t mode=(igraph_integer_t) REAL(pmode)[0];
  SEXP result;
  long int i;
  long int no_of_nodes;
  igraph_vector_t neis;

  R_SEXP_to_igraph(graph, &g);
  no_of_nodes=igraph_vcount(&g);
  igraph_vector_init(&neis, 0);
  PROTECT(result=NEW_LIST(no_of_nodes));
  for (i=0; i<no_of_nodes; i++) {
    igraph_incident(&g, &neis, (igraph_integer_t) i, (igraph_neimode_t) mode);
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

  PROTECT(R_fcall = lang3(data->fun, s_from, data->extra));
  PROTECT(s_to = eval(R_fcall, data->rho));
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
  SET_STRING_ELT(names, 0, mkChar("values"));
  SET_STRING_ELT(names, 1, mkChar("vectors"));
  SET_STRING_ELT(names, 2, mkChar("options"));
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
  int c_result;
  SEXP result, names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (!isNull(alpha)) { R_SEXP_to_vector(alpha, &c_alpha); }
  if (!isNull(alpham1)) { R_SEXP_to_vector(alpham1, &c_alpham1); }
  if (LOGICAL(pfillin)[0]) {
    if (0 != igraph_vector_init(&c_fillin, 0)) {
      igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
    }
    IGRAPH_FINALLY(igraph_vector_destroy, &c_fillin);
  }
  c_result=igraph_is_chordal(&c_graph, (isNull(alpha) ? 0 : &c_alpha),
			     (isNull(alpham1) ? 0 : &c_alpham1), &c_chordal,
			     (LOGICAL(pfillin)[0] ? &c_fillin : 0),
			     (LOGICAL(pnewgraph)[0] ? &c_newgraph : 0));

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
    igraph_destroy(&c_newgraph);
    IGRAPH_FINALLY_CLEAN(1);
  } else {
    PROTECT(newgraph=R_NilValue);
  }
  SET_VECTOR_ELT(result, 0, chordal);
  SET_VECTOR_ELT(result, 1, fillin);
  SET_VECTOR_ELT(result, 2, newgraph);
  SET_STRING_ELT(names, 0, CREATE_STRING_VECTOR("chordal"));
  SET_STRING_ELT(names, 1, CREATE_STRING_VECTOR("fillin"));
  SET_STRING_ELT(names, 2, CREATE_STRING_VECTOR("newgraph"));
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

  SET_STRING_ELT(names, 0, mkChar("vid"));
  SET_STRING_ELT(names, 1, mkChar("pred"));
  SET_STRING_ELT(names, 2, mkChar("succ"));
  SET_STRING_ELT(names, 3, mkChar("rank"));
  SET_STRING_ELT(names, 4, mkChar("dist"));
  REAL(args)[0]=vid;
  REAL(args)[1]=pred;
  REAL(args)[2]=succ;
  REAL(args)[3]=rank;
  REAL(args)[4]=dist;
  SET_NAMES(args, names);

  PROTECT(R_fcall = lang4(data->fun, data->graph, args, data->extra));
  PROTECT(result = eval(R_fcall, data->rho));

  cres=LOGICAL(result)[0];

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
  if (!isNull(proots)) {
    R_SEXP_to_vector(proots, &roots);
  }
  if (!isNull(prestricted)) {
    R_SEXP_to_vector(prestricted, &restricted);
  }

  if (LOGICAL(porder)[0]) {
    igraph_vector_init(&order, 0); p_order=&order;
  }
  if (LOGICAL(prank)[0]) {
    igraph_vector_init(&rank, 0); p_rank=&rank;
  }
  if (LOGICAL(pfather)[0]) {
    igraph_vector_init(&father, 0); p_father=&father;
  }
  if (LOGICAL(ppred)[0]) {
    igraph_vector_init(&pred, 0); p_pred=&pred;
  }
  if (LOGICAL(psucc)[0]) {
    igraph_vector_init(&succ, 0); p_succ=&succ;
  }
  if (LOGICAL(pdist)[0]) {
    igraph_vector_init(&dist, 0); p_dist=&dist;
  }

  if (!isNull(pcallback)) {
    cb_data.graph=graph;
    cb_data.fun=pcallback;
    cb_data.extra=pextra;
    cb_data.rho=prho;
    callback=R_igraph_bfshandler;
    p_cb_data = &cb_data;
  }

  igraph_bfs(&g, root, isNull(proots) ? 0 : &roots, (igraph_neimode_t) neimode,
	     unreachable, isNull(prestricted) ? 0 : &restricted,
	     p_order, p_rank, p_father, p_pred, p_succ, p_dist,
	     (igraph_bfshandler_t*) callback, p_cb_data);

  PROTECT(result=NEW_LIST(8));
  PROTECT(names=NEW_CHARACTER(8));

  SET_STRING_ELT(names, 0, mkChar("root"));
  SET_VECTOR_ELT(result, 0, NEW_NUMERIC(1));
  REAL(VECTOR_ELT(result, 0))[0] = root+1;

  SET_STRING_ELT(names, 1, mkChar("neimode"));
  SET_VECTOR_ELT(result, 1, NEW_CHARACTER(1));
  if (neimode==1) {
    SET_STRING_ELT(VECTOR_ELT(result, 1), 0, mkChar("out"));
  } else if (neimode==2) {
    SET_STRING_ELT(VECTOR_ELT(result, 1), 0, mkChar("in"));
  } else {
    SET_STRING_ELT(VECTOR_ELT(result, 1), 0, mkChar("all"));
  }

  SET_STRING_ELT(names, 2, mkChar("order"));
  SET_VECTOR_ELT(result, 2, R_igraph_0orvector_to_SEXP_d(p_order));
  SET_STRING_ELT(names, 3, mkChar("rank"));
  SET_VECTOR_ELT(result, 3, R_igraph_0orvector_to_SEXP_d(p_rank));
  SET_STRING_ELT(names, 4, mkChar("father"));
  SET_VECTOR_ELT(result, 4, R_igraph_0orvector_to_SEXP_d(p_father));
  SET_STRING_ELT(names, 5, mkChar("pred"));
  SET_VECTOR_ELT(result, 5, R_igraph_0orvector_to_SEXP_d(p_pred));
  SET_STRING_ELT(names, 6, mkChar("succ"));
  SET_VECTOR_ELT(result, 6, R_igraph_0orvector_to_SEXP_d(p_succ));
  SET_STRING_ELT(names, 7, mkChar("dist"));
  SET_VECTOR_ELT(result, 7, R_igraph_0orvector_to_SEXP_d(p_dist));

  SET_NAMES(result, names);

  UNPROTECT(2);
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

  SET_STRING_ELT(names, 0, mkChar("vid"));
  SET_STRING_ELT(names, 1, mkChar("dist"));
  REAL(args)[0]=vid;
  REAL(args)[1]=dist;
  SET_NAMES(args, names);

  PROTECT(R_fcall = lang4(which==0 ? data->fun_in : data->fun_out,
			  data->graph, args, data->extra));
  PROTECT(result = eval(R_fcall, data->rho));

  cres=LOGICAL(result)[0];

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

  if (!isNull(pin_callback) || !isNull(pout_callback)) {
    cb_data.graph=graph;
    cb_data.fun_in=pin_callback;
    cb_data.fun_out=pout_callback;
    cb_data.extra=pextra;
    cb_data.rho=prho;
    p_cb_data = &cb_data;
  }
  if (!isNull(pin_callback)) {
    in_callback=R_igraph_dfshandler_in;
  }
  if (!isNull(pout_callback)) {
    out_callback=R_igraph_dfshandler_out;
  }

  igraph_dfs(&g, root, (igraph_neimode_t) neimode, unreachable,
	     p_order, p_order_out, p_father, p_dist,
	     (igraph_dfshandler_t*) in_callback,
	     (igraph_dfshandler_t*) out_callback, p_cb_data);

  PROTECT(result=NEW_LIST(6));
  PROTECT(names=NEW_CHARACTER(6));

  SET_STRING_ELT(names, 0, mkChar("root"));
  SET_VECTOR_ELT(result, 0, NEW_NUMERIC(1));
  REAL(VECTOR_ELT(result, 0))[0] = root;

  SET_STRING_ELT(names, 1, mkChar("neimode"));
  SET_VECTOR_ELT(result, 1, NEW_CHARACTER(1));
  if (neimode==1) {
    SET_STRING_ELT(VECTOR_ELT(result, 1), 0, mkChar("out"));
  } else if (neimode==2) {
    SET_STRING_ELT(VECTOR_ELT(result, 1), 0, mkChar("in"));
  } else {
    SET_STRING_ELT(VECTOR_ELT(result, 1), 0, mkChar("all"));
  }

  SET_STRING_ELT(names, 2, mkChar("order"));
  SET_VECTOR_ELT(result, 2, R_igraph_0orvector_to_SEXP_d(p_order));
  SET_STRING_ELT(names, 3, mkChar("order.out"));
  SET_VECTOR_ELT(result, 3, R_igraph_0orvector_to_SEXP_d(p_order_out));
  SET_STRING_ELT(names, 4, mkChar("father"));
  SET_VECTOR_ELT(result, 4, R_igraph_0orvector_to_SEXP_d(p_father));
  SET_STRING_ELT(names, 5, mkChar("dist"));
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
  int c_result;
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

  c_result=igraph_cohesive_blocks(&c_graph, &c_blocks, &c_cohesion, &c_parent, &c_blockTree);

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
  igraph_destroy(&c_blockTree);
  IGRAPH_FINALLY_CLEAN(1);
  SET_VECTOR_ELT(result, 0, blocks);
  SET_VECTOR_ELT(result, 1, cohesion);
  SET_VECTOR_ELT(result, 2, parent);
  SET_VECTOR_ELT(result, 3, blockTree);
  SET_STRING_ELT(names, 0, CREATE_STRING_VECTOR("blocks"));
  SET_STRING_ELT(names, 1, CREATE_STRING_VECTOR("cohesion"));
  SET_STRING_ELT(names, 2, CREATE_STRING_VECTOR("parent"));
  SET_STRING_ELT(names, 3, CREATE_STRING_VECTOR("blockTree"));
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
  PROTECT(l1 = install("igraph.i.levc.arp"));
  PROTECT(l2 = R_MakeExternalPtr((void*) &cont, R_NilValue, R_NilValue));
  PROTECT(l3 = R_MakeExternalPtr(arpack_extra, R_NilValue, R_NilValue));
  PROTECT(R_multip_call = lang3(l1, l2, l3));
  PROTECT(s_multip = eval(R_multip_call, data->rho2));

  PROTECT(R_fcall = R_igraph_i_lang7(data->fun, s_memb, s_comm,
				     s_evalue, s_evector, s_multip,
				     data->extra));
  PROTECT(res = eval(R_fcall, data->rho));

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
  igraph_bool_t c_start=!isNull(pstart);
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
  int c_result;
  SEXP result, names;

  R_igraph_i_levc_data_t callback_data = { callback, callback_extra,
					   callback_env, callback_env2 };

                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (!isNull(weights)) {
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
  c_result=igraph_community_leading_eigenvector(&c_graph, pweights,
						&c_merges,
						&c_membership, c_steps,
						&c_options, &c_modularity,
						c_start, &c_eigenvalues,
						&c_eigenvectors,
						&c_history,
						isNull(callback) ? 0 :
						R_igraph_i_levc_callback,
						&callback_data);

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
  SET_STRING_ELT(names, 0, CREATE_STRING_VECTOR("merges"));
  SET_STRING_ELT(names, 1, CREATE_STRING_VECTOR("membership"));
  SET_STRING_ELT(names, 2, CREATE_STRING_VECTOR("options"));
  SET_STRING_ELT(names, 3, CREATE_STRING_VECTOR("modularity"));
  SET_STRING_ELT(names, 4, CREATE_STRING_VECTOR("eigenvalues"));
  SET_STRING_ELT(names, 5, CREATE_STRING_VECTOR("eigenvectors"));
  SET_STRING_ELT(names, 6, CREATE_STRING_VECTOR("history"));
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
  igraph_bool_t error=LOGICAL(perror)[0];
  igraph_bool_t multi=LOGICAL(pmulti)[0];
  SEXP result;

  R_SEXP_to_igraph(graph, &g);
  R_SEXP_to_vector(pvp, &vp);
  igraph_vector_init(&res, 0);

  if (multi) {
    igraph_get_eids_multi(&g, &res, /*pairs=*/ &vp, /*path=*/ 0, directed,
			  error);
  } else {
    igraph_get_eids(&g, &res, /*pairs=*/ &vp, /*path=*/ 0, directed, error);
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
  int c_result;
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
  if (!isNull(p)) { R_SEXP_to_vector(p, &c_p); }
  c_norm=(igraph_integer_t) REAL(norm)[0];
                                        /* Call igraph */
  c_result=igraph_scg_semiprojectors(&c_groups, (igraph_scg_matrix_t)
				     c_matrix_type,
				     (sparse ? 0 : &c_L), (sparse ? 0 : &c_R),
				     (sparse ? &c_Lsparse : 0),
				     (sparse ? &c_Rsparse : 0),
				     (isNull(p) ? 0 : &c_p),
				     (igraph_scg_norm_t) c_norm);

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
  SET_STRING_ELT(names, 0, CREATE_STRING_VECTOR("L"));
  SET_STRING_ELT(names, 1, CREATE_STRING_VECTOR("R"));
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
  int c_result;
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
  if (!isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
                                        /* Call igraph */
  c_result=igraph_laplacian(&c_graph, (c_sparse ? 0 : &c_res),
			    (c_sparse ? &c_sparseres : 0),
			    c_normalized, (isNull(weights) ? 0 : &c_weights));

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
  int c_result;
  SEXP result, names;
  SEXP eval;
                                        /* What to return */
  igraph_bool_t do_scg_graph=
    (!isNull(graph) && c_output==1 /*default*/) || c_output==3 /*graph*/;
  igraph_bool_t do_scg_matrix=!c_sparse &&
    ((isNull(graph) && c_output==1 /*default*/) || c_output==2 /*matrix*/);
  igraph_bool_t do_scg_sparsemat=c_sparse &&
    ((isNull(graph) && c_output==1 /*default*/) || c_output==2 /*matrix*/);
  igraph_bool_t do_L=c_semproj && !c_sparse;
  igraph_bool_t do_R=c_semproj && !c_sparse;
  igraph_bool_t do_Lsparse=c_semproj && c_sparse;
  igraph_bool_t do_Rsparse=c_semproj && c_sparse;
  igraph_bool_t do_eval=c_epairs;
  igraph_bool_t do_evec=c_epairs;

                                          /* Convert input */
  if (!isNull(graph)) { R_SEXP_to_igraph(graph, &c_graph); }
  if (!isNull(matrix)) { R_SEXP_to_matrix(matrix, &c_matrix); }
  if (!isNull(sparsmat)) { R_SEXP_to_sparsemat(sparsmat, &c_sparsmat); }

  R_SEXP_to_vector(ev, &c_ev);
  R_SEXP_to_vector(intervals_vector, &c_intervals_vector);

  if (do_eval) { igraph_vector_init(&c_eval, 0); }
  if (!isNull(evec)) {
    R_SEXP_to_igraph_matrix_copy(evec, &c_evec);
  } else if (do_evec) {
    igraph_matrix_init(&c_evec, 0, 0);
  }
  if (!isNull(groups)) {
    R_SEXP_to_vector_copy(groups, &c_groups);
  } else {
    igraph_vector_init(&c_groups, 0);
  }

  if (do_scg_matrix) { igraph_matrix_init(&c_scg_matrix, 0, 0); }
  if (do_L) { igraph_matrix_init(&c_L, 0, 0); }
  if (do_R) { igraph_matrix_init(&c_R, 0, 0); }

  if (do_scg_sparsemat) { igraph_sparsemat_init(&c_scg_sparsemat, 0, 0, 0); }

                                        /* Call igraph */
  c_result=igraph_scg_adjacency((isNull(graph) ? 0 : &c_graph),
				(isNull(matrix) ? 0 : &c_matrix),
				(isNull(sparsmat) ? 0 : &c_sparsmat), &c_ev,
				/*intervals=*/ 0, &c_intervals_vector,
				(igraph_scg_algorithm_t) c_algorithm,
				(do_eval ? &c_eval : 0),
				(!isNull(evec) || do_evec ? &c_evec : 0),
				&c_groups, c_use_arpack, c_maxiter,
				(do_scg_graph ? &c_scg_graph : 0),
				(do_scg_matrix ? &c_scg_matrix : 0),
				(do_scg_sparsemat ? &c_scg_sparsemat : 0),
				(do_L ? &c_L : 0), (do_R ? &c_R : 0),
				(do_Lsparse ? &c_Lsparse : 0),
				(do_Rsparse ? &c_Rsparse : 0));

  if (!isNull(sparsmat)) { igraph_free(c_sparsmat.cs); }

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
    igraph_destroy(&c_scg_graph);
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
  SET_STRING_ELT(names, 0, CREATE_STRING_VECTOR("Xt"));
  SET_STRING_ELT(names, 1, CREATE_STRING_VECTOR("groups"));
  SET_STRING_ELT(names, 2, CREATE_STRING_VECTOR("L"));
  SET_STRING_ELT(names, 3, CREATE_STRING_VECTOR("R"));
  SET_STRING_ELT(names, 4, CREATE_STRING_VECTOR("values"));
  SET_STRING_ELT(names, 5, CREATE_STRING_VECTOR("vectors"));
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
  int c_result;
  SEXP result, names;
  SEXP eval;
                                        /* What to return */
  igraph_bool_t do_scg_graph=
    (!isNull(graph) && c_output==1 /*default*/) || c_output==3 /*graph*/;
  igraph_bool_t do_scg_matrix=!c_sparse &&
    ((isNull(graph) && c_output==1 /*default*/) || c_output==2 /*matrix*/);
  igraph_bool_t do_scg_sparsemat=c_sparse &&
    ((isNull(graph) && c_output==1 /*default*/) || c_output==2 /*matrix*/);
  igraph_bool_t do_L=c_semproj && !c_sparse;
  igraph_bool_t do_R=c_semproj && !c_sparse;
  igraph_bool_t do_Lsparse=c_semproj && c_sparse;
  igraph_bool_t do_Rsparse=c_semproj && c_sparse;
  igraph_bool_t do_eval=c_epairs;
  igraph_bool_t do_evec=c_epairs;
  igraph_bool_t do_p=c_stat_prob;

                                        /* Convert input */
  if (!isNull(graph)) { R_SEXP_to_igraph(graph, &c_graph); }
  if (!isNull(matrix)) { R_SEXP_to_matrix(matrix, &c_matrix); }
  if (!isNull(sparsmat)) { R_SEXP_to_sparsemat(sparsmat, &c_sparsmat); }

  R_SEXP_to_vector(ev, &c_ev);
  R_SEXP_to_vector(intervals_vector, &c_intervals_vector);
  if (do_eval) { igraph_vector_complex_init(&c_eval, 0); }
  if (!isNull(evec)) {
    R_SEXP_to_matrix_complex_copy(evec, &c_evec);
  } else if (do_evec) {
    igraph_matrix_complex_init(&c_evec, 0, 0);
  }
  if (!isNull(groups)) {
    R_SEXP_to_vector_copy(groups, &c_groups);
  } else {
    igraph_vector_init(&c_groups, 0);
  }

  if (!isNull(p)) {
    R_SEXP_to_vector_copy(p, &c_p);
  } else if (do_p) {
    igraph_vector_init(&c_p, 0);
  }

  if (do_scg_matrix) { igraph_matrix_init(&c_scg_matrix, 0, 0); }
  if (do_L) { igraph_matrix_init(&c_L, 0, 0); }
  if (do_R) { igraph_matrix_init(&c_R, 0, 0); }

                                        /* Call igraph */
  c_result=igraph_scg_stochastic((isNull(graph) ? 0 : &c_graph),
				 (isNull(matrix) ? 0 : &c_matrix),
				 (isNull(sparsmat) ? 0 : &c_sparsmat), &c_ev,
				 /*intervals=*/ 0, &c_intervals_vector,
				 (igraph_scg_algorithm_t) c_algorithm,
				 (igraph_scg_norm_t) c_norm,
				 (do_eval ? &c_eval : 0),
				 (!isNull(evec) || do_evec ? &c_evec : 0),
				 &c_groups, (!isNull(p) || do_p ? &c_p : 0),
				 c_use_arpack, c_maxiter,
				 (do_scg_graph ? &c_scg_graph : 0),
				 (do_scg_matrix ? &c_scg_matrix : 0),
				 (do_scg_sparsemat ? &c_scg_sparsemat : 0),
				 (do_L ? &c_L : 0), (do_R ? &c_R : 0),
				 (do_Lsparse ? &c_Lsparse : 0),
				 (do_Rsparse ? &c_Rsparse : 0));

  if (!isNull(sparsmat)) { igraph_free(c_sparsmat.cs); }

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
    igraph_destroy(&c_scg_graph);
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
  SET_STRING_ELT(names, 0, CREATE_STRING_VECTOR("Xt"));
  SET_STRING_ELT(names, 1, CREATE_STRING_VECTOR("groups"));
  SET_STRING_ELT(names, 2, CREATE_STRING_VECTOR("L"));
  SET_STRING_ELT(names, 3, CREATE_STRING_VECTOR("R"));
  SET_STRING_ELT(names, 4, CREATE_STRING_VECTOR("values"));
  SET_STRING_ELT(names, 5, CREATE_STRING_VECTOR("vectors"));
  SET_STRING_ELT(names, 6, CREATE_STRING_VECTOR("p"));
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
  int c_result;
  SEXP result, names;
                                        /* What to return */
  igraph_bool_t do_scg_graph=
    (!isNull(graph) && c_output==1 /*default*/) || c_output==3 /*graph*/;
  igraph_bool_t do_scg_matrix=!c_sparse &&
    ((isNull(graph) && c_output==1 /*default*/) || c_output==2 /*matrix*/);
  igraph_bool_t do_scg_sparsemat=c_sparse &&
    ((isNull(graph) && c_output==1 /*default*/) || c_output==2 /*matrix*/);
  igraph_bool_t do_L=c_semproj && !c_sparse;
  igraph_bool_t do_R=c_semproj && !c_sparse;
  igraph_bool_t do_Lsparse=c_semproj && c_sparse;
  igraph_bool_t do_Rsparse=c_semproj && c_sparse;
  igraph_bool_t do_eval=c_epairs;
  igraph_bool_t do_evec=c_epairs;

                                        /* Convert input */
  if (!isNull(graph)) { R_SEXP_to_igraph(graph, &c_graph); }
  if (!isNull(matrix)) { R_SEXP_to_matrix(matrix, &c_matrix); }
  if (!isNull(sparsmat)) { R_SEXP_to_sparsemat(sparsmat, &c_sparsmat); }

  R_SEXP_to_vector(ev, &c_ev);
  R_SEXP_to_vector(intervals_vector, &c_intervals_vector);

  if (do_eval) { igraph_vector_complex_init(&c_eval, 0); }
  if (!isNull(evec)) {
    R_SEXP_to_matrix_complex_copy(evec, &c_evec);
  } else if (do_evec) {
    igraph_matrix_complex_init(&c_evec, 0, 0);
  }
  if (!isNull(groups)) {
    R_SEXP_to_vector_copy(groups, &c_groups);
  } else {
    igraph_vector_init(&c_groups, 0);
  }

  if (do_scg_matrix) { igraph_matrix_init(&c_scg_matrix, 0, 0); }
  if (do_L) { igraph_matrix_init(&c_L, 0, 0); }
  if (do_R) { igraph_matrix_init(&c_R, 0, 0); }

                                        /* Call igraph */
  c_result=igraph_scg_laplacian((isNull(graph) ? 0 : &c_graph),
				(isNull(matrix) ? 0 : &c_matrix),
				(isNull(sparsmat) ? 0 : &c_sparsmat), &c_ev,
				/*intervals=*/ 0, &c_intervals_vector,
				(igraph_scg_algorithm_t) c_algorithm,
				(igraph_scg_norm_t) c_norm,
				(igraph_scg_direction_t) c_direction,
				(do_eval ? &c_eval : 0),
				(!isNull(evec) || do_evec ? &c_evec : 0),
				&c_groups, c_use_arpack, c_maxiter,
				(do_scg_graph ? &c_scg_graph : 0),
				(do_scg_matrix ? &c_scg_matrix : 0),
				(do_scg_sparsemat ? &c_scg_sparsemat : 0),
				(do_L ? &c_L : 0), (do_R ? &c_R : 0),
				(do_Lsparse ? &c_Lsparse : 0),
				(do_Rsparse ? &c_Rsparse : 0));

  if (!isNull(sparsmat)) { igraph_free(c_sparsmat.cs); }

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
    igraph_destroy(&c_scg_graph);
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
  SET_STRING_ELT(names, 0, CREATE_STRING_VECTOR("Xt"));
  SET_STRING_ELT(names, 1, CREATE_STRING_VECTOR("groups"));
  SET_STRING_ELT(names, 2, CREATE_STRING_VECTOR("L"));
  SET_STRING_ELT(names, 3, CREATE_STRING_VECTOR("R"));
  SET_STRING_ELT(names, 4, CREATE_STRING_VECTOR("values"));
  SET_STRING_ELT(names, 5, CREATE_STRING_VECTOR("vectors"));
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
  igraph_subisomorphic_lad(&c_pattern, &c_target,
			   (isNull(domains) ? 0 : &c_domains), &c_iso,
			   (isNull(map) ? 0 : &c_map),
			   (isNull(maps) ? 0 : &c_maps),
			   c_induced, c_time_limit);

                                        /* Convert output */
  PROTECT(result=NEW_LIST(3));
  PROTECT(names=NEW_CHARACTER(3));
  PROTECT(iso=NEW_LOGICAL(1));
  LOGICAL(iso)[0]=c_iso;
  if (!isNull(map)) {
    PROTECT(map=R_igraph_0orvector_to_SEXP(&c_map));
    igraph_vector_destroy(&c_map);
    IGRAPH_FINALLY_CLEAN(1);
  } else {
    PROTECT(map=R_NilValue);
  }
  if (!isNull(maps)) {
    PROTECT(maps=R_igraph_0orvectorlist_to_SEXP(&c_maps));
    R_igraph_vectorlist_destroy(&c_maps);
    IGRAPH_FINALLY_CLEAN(1);
  } else {
    PROTECT(maps=R_NilValue);
  }
  SET_VECTOR_ELT(result, 0, iso);
  SET_VECTOR_ELT(result, 1, map);
  SET_VECTOR_ELT(result, 2, maps);
  SET_STRING_ELT(names, 0, CREATE_STRING_VECTOR("iso"));
  SET_STRING_ELT(names, 1, CREATE_STRING_VECTOR("map"));
  SET_STRING_ELT(names, 2, CREATE_STRING_VECTOR("maps"));
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
  if (!isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
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
  igraph_graphlets(&c_graph, (isNull(weights) ? 0 : &c_weights), &c_cliques,
		   &c_Mu, c_niter);

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
  SET_STRING_ELT(names, 0, CREATE_STRING_VECTOR("cliques"));
  SET_STRING_ELT(names, 1, CREATE_STRING_VECTOR("Mu"));
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
  if (!isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
  if (0 != igraph_vector_ptr_init(&c_cliques, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(R_igraph_vectorlist_destroy, &c_cliques);
  if (0 != igraph_vector_init(&c_thresholds, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_thresholds);
  /* Call igraph */
  igraph_graphlets_candidate_basis(&c_graph, (isNull(weights) ? 0 : &c_weights),
				   &c_cliques, &c_thresholds);

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
  SET_STRING_ELT(names, 0, CREATE_STRING_VECTOR("cliques"));
  SET_STRING_ELT(names, 1, CREATE_STRING_VECTOR("thresholds"));
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
  if (!isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
  if (!isNull(cliques)) { R_igraph_SEXP_to_vectorlist(cliques, &c_cliques); }
  if (0 != R_SEXP_to_vector_copy(Mu, &c_Mu)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_Mu);
  c_niter=INTEGER(niter)[0];

  /* TODO: Change igraph_i_graphlets_project to igraph_graphlets_project, because
   * we should not depend on non-public functions from igraph.
   */
  /* Call igraph */
  igraph_i_graphlets_project(&c_graph, (isNull(weights) ? 0 : &c_weights),
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
  if (!isNull(pweights)) {
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
  igraph_adjacency_spectral_embedding(&c_graph, c_no,
				      isNull(pweights) ? 0 : &weights,
				      c_which, c_scaled, &c_X,
				      directed ? &c_Y : 0, &c_D,
				      &c_cvec, &c_options);

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
  SET_STRING_ELT(names, 0, CREATE_STRING_VECTOR("X"));
  SET_STRING_ELT(names, 1, CREATE_STRING_VECTOR("Y"));
  SET_STRING_ELT(names, 2, CREATE_STRING_VECTOR("D"));
  SET_STRING_ELT(names, 3, CREATE_STRING_VECTOR("options"));
  SET_NAMES(result, names);
  UNPROTECT(5);

  UNPROTECT(1);
  return(result);
}

SEXP R_igraph_laplacian_spectral_embedding(SEXP graph, SEXP no,
					   SEXP weights, SEXP which,
					   SEXP degmode, SEXP type,
					   SEXP scaled, SEXP options) {
  /* Declarations */
  igraph_t c_graph;
  igraph_integer_t c_no;
  igraph_vector_t c_weights;
  igraph_eigen_which_position_t c_which;
  igraph_neimode_t c_degmode;
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
  if (!isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
  c_which=INTEGER(which)[0];
  c_degmode=(igraph_neimode_t) REAL(degmode)[0];
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
  igraph_laplacian_spectral_embedding(&c_graph, c_no,
				      (isNull(weights) ? 0 : &c_weights),
				      c_which, c_degmode, c_type, c_scaled,
				      &c_X, directed ? &c_Y : 0,
				      &c_D, &c_options);

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
  SET_STRING_ELT(names, 0, CREATE_STRING_VECTOR("X"));
  SET_STRING_ELT(names, 1, CREATE_STRING_VECTOR("Y"));
  SET_STRING_ELT(names, 2, CREATE_STRING_VECTOR("D"));
  SET_STRING_ELT(names, 3, CREATE_STRING_VECTOR("options"));
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

  igraph_simple_interconnected_islands_game(&g, a, b, c, d);
  PROTECT(result=R_igraph_to_SEXP(&g));
  igraph_destroy(&g);

  UNPROTECT(1);
  return result;
}

SEXP R_igraph_version() {
  const char *version;
  SEXP result;
  igraph_version(&version, /*major=*/ 0, /*minor=*/ 0, /*patch=*/ 0);
  PROTECT(result=NEW_CHARACTER(1));
  SET_STRING_ELT(result, 0, mkChar(version));
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
  if (!isNull(types)) { R_SEXP_to_vector_bool(types, &c_types); }
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
  igraph_bipartite_projection(&c_graph, (isNull(types) ? 0 : &c_types),
			      do_1 ? &c_proj1 : 0, do_2 ? &c_proj2 : 0,
			      (isNull(multiplicity1) ? 0 : &c_multiplicity1),
			      (isNull(multiplicity2) ? 0 : &c_multiplicity2),
			      c_probe1);

  /* Convert output */
  PROTECT(result=NEW_LIST(4));
  PROTECT(names=NEW_CHARACTER(4));
  if (do_1) {
    IGRAPH_FINALLY(igraph_destroy, &c_proj1);
    PROTECT(proj1=R_igraph_to_SEXP(&c_proj1));
    igraph_destroy(&c_proj1);
    IGRAPH_FINALLY_CLEAN(1);
  } else {
    PROTECT(proj1=R_NilValue);
  }
  if (do_2) {
    IGRAPH_FINALLY(igraph_destroy, &c_proj2);
    PROTECT(proj2=R_igraph_to_SEXP(&c_proj2));
    igraph_destroy(&c_proj2);
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
  SET_STRING_ELT(names, 0, CREATE_STRING_VECTOR("proj1"));
  SET_STRING_ELT(names, 1, CREATE_STRING_VECTOR("proj2"));
  SET_STRING_ELT(names, 2, CREATE_STRING_VECTOR("multiplicity1"));
  SET_STRING_ELT(names, 3, CREATE_STRING_VECTOR("multiplicity2"));
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

  igraph_lazy_adjlist_init(&graph, &adjlist, mode, /* simplify= */ 0);
  IGRAPH_FINALLY(igraph_lazy_adjlist_destroy, &adjlist);

  PROTECT(result = NEW_LIST(n));
  for (IGRAPH_VIT_RESET(vit), i=0;
       !IGRAPH_VIT_END(vit);
       IGRAPH_VIT_NEXT(vit), i++) {
    long int vid = IGRAPH_VIT_GET(vit);
    igraph_vector_t *neis = igraph_lazy_adjlist_get(&adjlist, vid);
    SET_VECTOR_ELT(result, i, R_igraph_vector_to_SEXP(neis));
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

  igraph_lazy_inclist_init(&graph, &adjlist, mode);
  IGRAPH_FINALLY(igraph_lazy_inclist_destroy, &adjlist);

  PROTECT(result = NEW_LIST(n));
  for (IGRAPH_VIT_RESET(vit), i=0;
       !IGRAPH_VIT_END(vit);
       IGRAPH_VIT_NEXT(vit), i++) {
    long int eid = IGRAPH_VIT_GET(vit);
    igraph_vector_t *neis = igraph_lazy_inclist_get(&adjlist, eid);
    SET_VECTOR_ELT(result, i, R_igraph_vector_to_SEXP(neis));
  }

  igraph_lazy_inclist_destroy(&adjlist);
  igraph_vit_destroy(&vit);
  igraph_vs_destroy(&vs);
  IGRAPH_FINALLY_CLEAN(3);

  UNPROTECT(1);
  return result;
}

/***********************************************/
/* THE REST IS GENERATED BY stimulus           */
/***********************************************/

/*-------------------------------------------/
/ igraph_empty                               /
/-------------------------------------------*/
SEXP R_igraph_empty(SEXP n, SEXP directed) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_integer_t c_n;
  igraph_bool_t c_directed;
  SEXP graph;

  SEXP result;
                                        /* Convert input */
  c_n=INTEGER(n)[0];
  c_directed=LOGICAL(directed)[0];
                                        /* Call igraph */
  igraph_empty(&c_graph, c_n, c_directed);

                                        /* Convert output */
  IGRAPH_FINALLY(igraph_destroy, &c_graph);
  PROTECT(graph=R_igraph_to_SEXP(&c_graph));
  igraph_destroy(&c_graph);
  IGRAPH_FINALLY_CLEAN(1);
  result=graph;

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_vcount                              /
/-------------------------------------------*/
SEXP R_igraph_vcount(SEXP graph) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_integer_t c_result;
  SEXP result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
                                        /* Call igraph */
  c_result=  igraph_vcount(&c_graph);

                                        /* Convert output */

  PROTECT(result=NEW_INTEGER(1));
  INTEGER(result)[0]=c_result;

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_full_citation                       /
/-------------------------------------------*/
SEXP R_igraph_full_citation(SEXP n, SEXP directed) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_integer_t c_n;
  igraph_bool_t c_directed;
  SEXP graph;

  SEXP result;
                                        /* Convert input */
  c_n=INTEGER(n)[0];
  c_directed=LOGICAL(directed)[0];
                                        /* Call igraph */
  igraph_full_citation(&c_graph, c_n, c_directed);

                                        /* Convert output */
  IGRAPH_FINALLY(igraph_destroy, &c_graph);
  PROTECT(graph=R_igraph_to_SEXP(&c_graph));
  igraph_destroy(&c_graph);
  IGRAPH_FINALLY_CLEAN(1);
  result=graph;

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_extended_chordal_ring               /
/-------------------------------------------*/
SEXP R_igraph_extended_chordal_ring(SEXP nodes, SEXP W, SEXP directed) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_integer_t c_nodes;
  igraph_matrix_t c_W;
  igraph_bool_t c_directed;
  SEXP graph;

  SEXP result;
                                        /* Convert input */
  c_nodes=INTEGER(nodes)[0];
  R_SEXP_to_matrix(W, &c_W);
  c_directed=LOGICAL(directed)[0];
                                        /* Call igraph */
  igraph_extended_chordal_ring(&c_graph, c_nodes, &c_W, c_directed);

                                        /* Convert output */
  IGRAPH_FINALLY(igraph_destroy, &c_graph);
  PROTECT(graph=R_igraph_to_SEXP(&c_graph));
  igraph_destroy(&c_graph);
  IGRAPH_FINALLY_CLEAN(1);
  result=graph;

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_lcf_vector                          /
/-------------------------------------------*/
SEXP R_igraph_lcf_vector(SEXP n, SEXP shifts, SEXP repeats) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_integer_t c_n;
  igraph_vector_t c_shifts;
  igraph_integer_t c_repeats;
  SEXP graph;

  SEXP result;
                                        /* Convert input */
  c_n=INTEGER(n)[0];
  R_SEXP_to_vector(shifts, &c_shifts);
  c_repeats=INTEGER(repeats)[0];
                                        /* Call igraph */
  igraph_lcf_vector(&c_graph, c_n, &c_shifts, c_repeats);

                                        /* Convert output */
  IGRAPH_FINALLY(igraph_destroy, &c_graph);
  PROTECT(graph=R_igraph_to_SEXP(&c_graph));
  igraph_destroy(&c_graph);
  IGRAPH_FINALLY_CLEAN(1);
  result=graph;

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_adjlist                             /
/-------------------------------------------*/
SEXP R_igraph_adjlist(SEXP adjlist, SEXP mode, SEXP duplicate) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_adjlist_t c_adjlist;
  igraph_neimode_t c_mode;
  igraph_bool_t c_duplicate;
  SEXP graph;

  SEXP result;
                                        /* Convert input */
  if (0 != R_SEXP_to_igraph_adjlist(adjlist, &c_adjlist)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  c_mode=(igraph_neimode_t) REAL(mode)[0];
  c_duplicate=LOGICAL(duplicate)[0];
                                        /* Call igraph */
  igraph_adjlist(&c_graph, &c_adjlist, c_mode, c_duplicate);

                                        /* Convert output */
  IGRAPH_FINALLY(igraph_destroy, &c_graph);
  PROTECT(graph=R_igraph_to_SEXP(&c_graph));
  igraph_destroy(&c_graph);
  IGRAPH_FINALLY_CLEAN(1);
  result=graph;

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_full_bipartite                      /
/-------------------------------------------*/
SEXP R_igraph_full_bipartite(SEXP n1, SEXP n2, SEXP directed, SEXP mode) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_bool_t c_types;
  igraph_integer_t c_n1;
  igraph_integer_t c_n2;
  igraph_bool_t c_directed;
  igraph_neimode_t c_mode;
  SEXP graph;
  SEXP types;

  SEXP result, names;
                                        /* Convert input */
  if (0 != igraph_vector_bool_init(&c_types, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_bool_destroy, &c_types);
  types=R_GlobalEnv; /* hack to have a non-NULL value */
  c_n1=INTEGER(n1)[0];
  c_n2=INTEGER(n2)[0];
  c_directed=LOGICAL(directed)[0];
  c_mode=(igraph_neimode_t) REAL(mode)[0];
                                        /* Call igraph */
  igraph_full_bipartite(&c_graph, (isNull(types) ? 0 : &c_types), c_n1, c_n2, c_directed, c_mode);

                                        /* Convert output */
  PROTECT(result=NEW_LIST(2));
  PROTECT(names=NEW_CHARACTER(2));
  IGRAPH_FINALLY(igraph_destroy, &c_graph);
  PROTECT(graph=R_igraph_to_SEXP(&c_graph));
  igraph_destroy(&c_graph);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(types=R_igraph_0orvector_bool_to_SEXP(&c_types));
  igraph_vector_bool_destroy(&c_types);
  IGRAPH_FINALLY_CLEAN(1);
  SET_VECTOR_ELT(result, 0, graph);
  SET_VECTOR_ELT(result, 1, types);
  SET_STRING_ELT(names, 0, CREATE_STRING_VECTOR("graph"));
  SET_STRING_ELT(names, 1, CREATE_STRING_VECTOR("types"));
  SET_NAMES(result, names);
  UNPROTECT(3);

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_forest_fire_game                    /
/-------------------------------------------*/
SEXP R_igraph_forest_fire_game(SEXP nodes, SEXP fw_prob, SEXP bw_factor, SEXP ambs, SEXP directed) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_integer_t c_nodes;
  igraph_real_t c_fw_prob;
  igraph_real_t c_bw_factor;
  igraph_integer_t c_ambs;
  igraph_bool_t c_directed;
  SEXP graph;

  SEXP result;
                                        /* Convert input */
  c_nodes=INTEGER(nodes)[0];
  c_fw_prob=REAL(fw_prob)[0];
  c_bw_factor=REAL(bw_factor)[0];
  c_ambs=INTEGER(ambs)[0];
  c_directed=LOGICAL(directed)[0];
                                        /* Call igraph */
  igraph_forest_fire_game(&c_graph, c_nodes, c_fw_prob, c_bw_factor, c_ambs, c_directed);

                                        /* Convert output */
  IGRAPH_FINALLY(igraph_destroy, &c_graph);
  PROTECT(graph=R_igraph_to_SEXP(&c_graph));
  igraph_destroy(&c_graph);
  IGRAPH_FINALLY_CLEAN(1);
  result=graph;

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_static_fitness_game                 /
/-------------------------------------------*/
SEXP R_igraph_static_fitness_game(SEXP no_of_edges, SEXP fitness_out, SEXP fitness_in, SEXP loops, SEXP multiple) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_integer_t c_no_of_edges;
  igraph_vector_t c_fitness_out;
  igraph_vector_t c_fitness_in;
  igraph_bool_t c_loops;
  igraph_bool_t c_multiple;
  SEXP graph;

  SEXP result;
                                        /* Convert input */
  c_no_of_edges=INTEGER(no_of_edges)[0];
  R_SEXP_to_vector(fitness_out, &c_fitness_out);
  if (!isNull(fitness_in)) { R_SEXP_to_vector(fitness_in, &c_fitness_in); }
  c_loops=LOGICAL(loops)[0];
  c_multiple=LOGICAL(multiple)[0];
                                        /* Call igraph */
  igraph_static_fitness_game(&c_graph, c_no_of_edges, &c_fitness_out, (isNull(fitness_in) ? 0 : &c_fitness_in), c_loops, c_multiple);

                                        /* Convert output */
  IGRAPH_FINALLY(igraph_destroy, &c_graph);
  PROTECT(graph=R_igraph_to_SEXP(&c_graph));
  igraph_destroy(&c_graph);
  IGRAPH_FINALLY_CLEAN(1);
  result=graph;

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_static_power_law_game               /
/-------------------------------------------*/
SEXP R_igraph_static_power_law_game(SEXP no_of_nodes, SEXP no_of_edges, SEXP exponent_out, SEXP exponent_in, SEXP loops, SEXP multiple, SEXP finite_size_correction) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_integer_t c_no_of_nodes;
  igraph_integer_t c_no_of_edges;
  igraph_real_t c_exponent_out;
  igraph_real_t c_exponent_in;
  igraph_bool_t c_loops;
  igraph_bool_t c_multiple;
  igraph_bool_t c_finite_size_correction;
  SEXP graph;

  SEXP result;
                                        /* Convert input */
  c_no_of_nodes=INTEGER(no_of_nodes)[0];
  c_no_of_edges=INTEGER(no_of_edges)[0];
  c_exponent_out=REAL(exponent_out)[0];
  c_exponent_in=REAL(exponent_in)[0];
  c_loops=LOGICAL(loops)[0];
  c_multiple=LOGICAL(multiple)[0];
  c_finite_size_correction=LOGICAL(finite_size_correction)[0];
                                        /* Call igraph */
  igraph_static_power_law_game(&c_graph, c_no_of_nodes, c_no_of_edges, c_exponent_out, c_exponent_in, c_loops, c_multiple, c_finite_size_correction);

                                        /* Convert output */
  IGRAPH_FINALLY(igraph_destroy, &c_graph);
  PROTECT(graph=R_igraph_to_SEXP(&c_graph));
  igraph_destroy(&c_graph);
  IGRAPH_FINALLY_CLEAN(1);
  result=graph;

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_k_regular_game                      /
/-------------------------------------------*/
SEXP R_igraph_k_regular_game(SEXP no_of_nodes, SEXP k, SEXP directed, SEXP multiple) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_integer_t c_no_of_nodes;
  igraph_integer_t c_k;
  igraph_bool_t c_directed;
  igraph_bool_t c_multiple;
  SEXP graph;

  SEXP result;
                                        /* Convert input */
  c_no_of_nodes=INTEGER(no_of_nodes)[0];
  c_k=INTEGER(k)[0];
  c_directed=LOGICAL(directed)[0];
  c_multiple=LOGICAL(multiple)[0];
                                        /* Call igraph */
  igraph_k_regular_game(&c_graph, c_no_of_nodes, c_k, c_directed, c_multiple);

                                        /* Convert output */
  IGRAPH_FINALLY(igraph_destroy, &c_graph);
  PROTECT(graph=R_igraph_to_SEXP(&c_graph));
  igraph_destroy(&c_graph);
  IGRAPH_FINALLY_CLEAN(1);
  result=graph;

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_sbm_game                            /
/-------------------------------------------*/
SEXP R_igraph_sbm_game(SEXP n, SEXP pref_matrix, SEXP block_sizes, SEXP directed, SEXP loops) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_integer_t c_n;
  igraph_matrix_t c_pref_matrix;
  igraph_vector_int_t c_block_sizes;
  igraph_bool_t c_directed;
  igraph_bool_t c_loops;
  SEXP graph;

  SEXP result;
                                        /* Convert input */
  c_n=INTEGER(n)[0];
  R_SEXP_to_matrix(pref_matrix, &c_pref_matrix);
  R_SEXP_to_vector_int(block_sizes, &c_block_sizes);
  c_directed=LOGICAL(directed)[0];
  c_loops=LOGICAL(loops)[0];
                                        /* Call igraph */
  igraph_sbm_game(&c_graph, c_n, &c_pref_matrix, &c_block_sizes, c_directed, c_loops);

                                        /* Convert output */
  IGRAPH_FINALLY(igraph_destroy, &c_graph);
  PROTECT(graph=R_igraph_to_SEXP(&c_graph));
  igraph_destroy(&c_graph);
  IGRAPH_FINALLY_CLEAN(1);
  result=graph;

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_hsbm_game                           /
/-------------------------------------------*/
SEXP R_igraph_hsbm_game(SEXP n, SEXP m, SEXP rho, SEXP C, SEXP p) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_integer_t c_n;
  igraph_integer_t c_m;
  igraph_vector_t c_rho;
  igraph_matrix_t c_C;
  igraph_real_t c_p;
  SEXP graph;

  SEXP result;
                                        /* Convert input */
  c_n=INTEGER(n)[0];
  c_m=INTEGER(m)[0];
  R_SEXP_to_vector(rho, &c_rho);
  R_SEXP_to_matrix(C, &c_C);
  c_p=REAL(p)[0];
                                        /* Call igraph */
  igraph_hsbm_game(&c_graph, c_n, c_m, &c_rho, &c_C, c_p);

                                        /* Convert output */
  IGRAPH_FINALLY(igraph_destroy, &c_graph);
  PROTECT(graph=R_igraph_to_SEXP(&c_graph));
  igraph_destroy(&c_graph);
  IGRAPH_FINALLY_CLEAN(1);
  result=graph;

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_hsbm_list_game                      /
/-------------------------------------------*/
SEXP R_igraph_hsbm_list_game(SEXP n, SEXP mlist, SEXP rholist, SEXP Clist, SEXP p) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_integer_t c_n;
  igraph_vector_int_t c_mlist;
  igraph_vector_ptr_t c_rholist;
  igraph_vector_ptr_t c_Clist;
  igraph_real_t c_p;
  SEXP graph;

  SEXP result;
                                        /* Convert input */
  c_n=INTEGER(n)[0];
  R_SEXP_to_vector_int(mlist, &c_mlist);
  R_igraph_SEXP_to_vectorlist(rholist, &c_rholist);
  R_igraph_SEXP_to_matrixlist(Clist, &c_Clist);
  c_p=REAL(p)[0];
                                        /* Call igraph */
  igraph_hsbm_list_game(&c_graph, c_n, &c_mlist, &c_rholist, &c_Clist, c_p);

                                        /* Convert output */
  IGRAPH_FINALLY(igraph_destroy, &c_graph);
  PROTECT(graph=R_igraph_to_SEXP(&c_graph));
  igraph_destroy(&c_graph);
  IGRAPH_FINALLY_CLEAN(1);
  result=graph;

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_correlated_game                     /
/-------------------------------------------*/
SEXP R_igraph_correlated_game(SEXP old_graph, SEXP corr, SEXP p, SEXP permutation) {
                                        /* Declarations */
  igraph_t c_old_graph;
  igraph_t c_new_graph;
  igraph_real_t c_corr;
  igraph_real_t c_p;
  igraph_vector_t c_permutation;
  SEXP new_graph;

  SEXP result;
                                        /* Convert input */
  R_SEXP_to_igraph(old_graph, &c_old_graph);
  c_corr=REAL(corr)[0];
  c_p=REAL(p)[0];
  if (!isNull(permutation)) { R_SEXP_to_vector(permutation, &c_permutation); }
                                        /* Call igraph */
  igraph_correlated_game(&c_old_graph, &c_new_graph, c_corr, c_p, (isNull(permutation) ? 0 : &c_permutation));

                                        /* Convert output */
  IGRAPH_FINALLY(igraph_destroy, &c_new_graph);
  PROTECT(new_graph=R_igraph_to_SEXP(&c_new_graph));
  igraph_destroy(&c_new_graph);
  IGRAPH_FINALLY_CLEAN(1);
  result=new_graph;

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_correlated_pair_game                /
/-------------------------------------------*/
SEXP R_igraph_correlated_pair_game(SEXP n, SEXP corr, SEXP p, SEXP directed, SEXP permutation) {
                                        /* Declarations */
  igraph_t c_graph1;
  igraph_t c_graph2;
  int c_n;
  igraph_real_t c_corr;
  igraph_real_t c_p;
  igraph_bool_t c_directed;
  igraph_vector_t c_permutation;
  SEXP graph1;
  SEXP graph2;

  SEXP result, names;
                                        /* Convert input */
  c_n=INTEGER(n)[0];
  c_corr=REAL(corr)[0];
  c_p=REAL(p)[0];
  c_directed=LOGICAL(directed)[0];
  if (!isNull(permutation)) { R_SEXP_to_vector(permutation, &c_permutation); }
                                        /* Call igraph */
  igraph_correlated_pair_game(&c_graph1, &c_graph2, c_n, c_corr, c_p, c_directed, (isNull(permutation) ? 0 : &c_permutation));

                                        /* Convert output */
  PROTECT(result=NEW_LIST(2));
  PROTECT(names=NEW_CHARACTER(2));
  IGRAPH_FINALLY(igraph_destroy, &c_graph1);
  PROTECT(graph1=R_igraph_to_SEXP(&c_graph1));
  igraph_destroy(&c_graph1);
  IGRAPH_FINALLY_CLEAN(1);
  IGRAPH_FINALLY(igraph_destroy, &c_graph2);
  PROTECT(graph2=R_igraph_to_SEXP(&c_graph2));
  igraph_destroy(&c_graph2);
  IGRAPH_FINALLY_CLEAN(1);
  SET_VECTOR_ELT(result, 0, graph1);
  SET_VECTOR_ELT(result, 1, graph2);
  SET_STRING_ELT(names, 0, CREATE_STRING_VECTOR("graph1"));
  SET_STRING_ELT(names, 1, CREATE_STRING_VECTOR("graph2"));
  SET_NAMES(result, names);
  UNPROTECT(3);

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_dot_product_game                    /
/-------------------------------------------*/
SEXP R_igraph_dot_product_game(SEXP vecs, SEXP directed) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_matrix_t c_vecs;
  igraph_bool_t c_directed;
  SEXP graph;

  SEXP result;
                                        /* Convert input */
  R_SEXP_to_matrix(vecs, &c_vecs);
  c_directed=LOGICAL(directed)[0];
                                        /* Call igraph */
  igraph_dot_product_game(&c_graph, &c_vecs, c_directed);

                                        /* Convert output */
  IGRAPH_FINALLY(igraph_destroy, &c_graph);
  PROTECT(graph=R_igraph_to_SEXP(&c_graph));
  igraph_destroy(&c_graph);
  IGRAPH_FINALLY_CLEAN(1);
  result=graph;

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_sample_sphere_surface               /
/-------------------------------------------*/
SEXP R_igraph_sample_sphere_surface(SEXP dim, SEXP n, SEXP radius, SEXP positive) {
                                        /* Declarations */
  igraph_integer_t c_dim;
  igraph_integer_t c_n;
  igraph_real_t c_radius;
  igraph_bool_t c_positive;
  igraph_matrix_t c_res;
  SEXP res;

  SEXP result;
                                        /* Convert input */
  c_dim=INTEGER(dim)[0];
  c_n=INTEGER(n)[0];
  c_radius=REAL(radius)[0];
  c_positive=LOGICAL(positive)[0];
  if (0 != igraph_matrix_init(&c_res, 0, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_matrix_destroy, &c_res);
                                        /* Call igraph */
  igraph_sample_sphere_surface(c_dim, c_n, c_radius, c_positive, &c_res);

                                        /* Convert output */
  PROTECT(res=R_igraph_matrix_to_SEXP(&c_res));
  igraph_matrix_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  result=res;

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_sample_sphere_volume                /
/-------------------------------------------*/
SEXP R_igraph_sample_sphere_volume(SEXP dim, SEXP n, SEXP radius, SEXP positive) {
                                        /* Declarations */
  igraph_integer_t c_dim;
  igraph_integer_t c_n;
  igraph_real_t c_radius;
  igraph_bool_t c_positive;
  igraph_matrix_t c_res;
  SEXP res;

  SEXP result;
                                        /* Convert input */
  c_dim=INTEGER(dim)[0];
  c_n=INTEGER(n)[0];
  c_radius=REAL(radius)[0];
  c_positive=LOGICAL(positive)[0];
  if (0 != igraph_matrix_init(&c_res, 0, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_matrix_destroy, &c_res);
                                        /* Call igraph */
  igraph_sample_sphere_volume(c_dim, c_n, c_radius, c_positive, &c_res);

                                        /* Convert output */
  PROTECT(res=R_igraph_matrix_to_SEXP(&c_res));
  igraph_matrix_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  result=res;

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_sample_dirichlet                    /
/-------------------------------------------*/
SEXP R_igraph_sample_dirichlet(SEXP n, SEXP alpha) {
                                        /* Declarations */
  igraph_integer_t c_n;
  igraph_vector_t c_alpha;
  igraph_matrix_t c_res;
  SEXP res;

  SEXP result;
                                        /* Convert input */
  c_n=INTEGER(n)[0];
  R_SEXP_to_vector(alpha, &c_alpha);
  if (0 != igraph_matrix_init(&c_res, 0, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_matrix_destroy, &c_res);
                                        /* Call igraph */
  igraph_sample_dirichlet(c_n, &c_alpha, &c_res);

                                        /* Convert output */
  PROTECT(res=R_igraph_matrix_to_SEXP(&c_res));
  igraph_matrix_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  result=res;

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_closeness                           /
/-------------------------------------------*/
SEXP R_igraph_closeness(SEXP graph, SEXP vids, SEXP mode, SEXP weights, SEXP normalized) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_t c_res;
  igraph_vs_t c_vids;
  igraph_neimode_t c_mode;
  igraph_vector_t c_weights;
  igraph_bool_t c_normalized;
  SEXP res;

  SEXP result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_init(&c_res, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_res);
  R_SEXP_to_igraph_vs(vids, &c_graph, &c_vids);
  c_mode=(igraph_neimode_t) REAL(mode)[0];
  if (!isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
  c_normalized=LOGICAL(normalized)[0];
                                        /* Call igraph */
  igraph_closeness(&c_graph, &c_res, c_vids, c_mode, (isNull(weights) ? 0 : &c_weights), c_normalized);

                                        /* Convert output */
  PROTECT(res=R_igraph_vector_to_SEXP(&c_res));
  igraph_vector_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  igraph_vs_destroy(&c_vids);
  result=res;

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_closeness_estimate                  /
/-------------------------------------------*/
SEXP R_igraph_closeness_estimate(SEXP graph, SEXP vids, SEXP mode, SEXP cutoff, SEXP weights, SEXP normalized) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_t c_res;
  igraph_vs_t c_vids;
  igraph_neimode_t c_mode;
  igraph_real_t c_cutoff;
  igraph_vector_t c_weights;
  igraph_bool_t c_normalized;
  SEXP res;

  SEXP result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_init(&c_res, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_res);
  R_SEXP_to_igraph_vs(vids, &c_graph, &c_vids);
  c_mode=(igraph_neimode_t) REAL(mode)[0];
  c_cutoff=REAL(cutoff)[0];
  if (!isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
  c_normalized=LOGICAL(normalized)[0];
                                        /* Call igraph */
  igraph_closeness_estimate(&c_graph, &c_res, c_vids, c_mode, c_cutoff, (isNull(weights) ? 0 : &c_weights), c_normalized);

                                        /* Convert output */
  PROTECT(res=R_igraph_vector_to_SEXP(&c_res));
  igraph_vector_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  igraph_vs_destroy(&c_vids);
  result=res;

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_get_all_shortest_paths              /
/-------------------------------------------*/
SEXP R_igraph_get_all_shortest_paths(SEXP graph, SEXP from, SEXP to, SEXP mode) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_ptr_t c_res;
  igraph_vector_t c_nrgeo;
  igraph_integer_t c_from;
  igraph_vs_t c_to;
  igraph_neimode_t c_mode;
  SEXP res;
  SEXP nrgeo;

  SEXP result, names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_ptr_init(&c_res, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(R_igraph_vectorlist_destroy, &c_res);
  if (0 != igraph_vector_init(&c_nrgeo, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_nrgeo);
  c_from=(igraph_integer_t) REAL(from)[0];
  R_SEXP_to_igraph_vs(to, &c_graph, &c_to);
  c_mode=(igraph_neimode_t) REAL(mode)[0];
                                        /* Call igraph */
  igraph_get_all_shortest_paths(&c_graph, &c_res, &c_nrgeo, c_from, c_to, c_mode);

                                        /* Convert output */
  PROTECT(result=NEW_LIST(2));
  PROTECT(names=NEW_CHARACTER(2));
  PROTECT(res=R_igraph_vectorlist_to_SEXP_p1(&c_res));
  R_igraph_vectorlist_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(nrgeo=R_igraph_vector_to_SEXP(&c_nrgeo));
  igraph_vector_destroy(&c_nrgeo);
  IGRAPH_FINALLY_CLEAN(1);
  igraph_vs_destroy(&c_to);
  SET_VECTOR_ELT(result, 0, res);
  SET_VECTOR_ELT(result, 1, nrgeo);
  SET_STRING_ELT(names, 0, CREATE_STRING_VECTOR("res"));
  SET_STRING_ELT(names, 1, CREATE_STRING_VECTOR("nrgeo"));
  SET_NAMES(result, names);
  UNPROTECT(3);

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_get_all_shortest_paths_dijkstra     /
/-------------------------------------------*/
SEXP R_igraph_get_all_shortest_paths_dijkstra(SEXP graph, SEXP from, SEXP to, SEXP weights, SEXP mode) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_ptr_t c_res;
  igraph_vector_t c_nrgeo;
  igraph_integer_t c_from;
  igraph_vs_t c_to;
  igraph_vector_t c_weights;
  igraph_neimode_t c_mode;
  SEXP res;
  SEXP nrgeo;

  SEXP result, names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_ptr_init(&c_res, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(R_igraph_vectorlist_destroy, &c_res);
  if (0 != igraph_vector_init(&c_nrgeo, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_nrgeo);
  c_from=(igraph_integer_t) REAL(from)[0];
  R_SEXP_to_igraph_vs(to, &c_graph, &c_to);
  if (!isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
  c_mode=(igraph_neimode_t) REAL(mode)[0];
                                        /* Call igraph */
  igraph_get_all_shortest_paths_dijkstra(&c_graph, &c_res, &c_nrgeo, c_from, c_to, (isNull(weights) ? 0 : &c_weights), c_mode);

                                        /* Convert output */
  PROTECT(result=NEW_LIST(2));
  PROTECT(names=NEW_CHARACTER(2));
  PROTECT(res=R_igraph_vectorlist_to_SEXP_p1(&c_res));
  R_igraph_vectorlist_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(nrgeo=R_igraph_vector_to_SEXP(&c_nrgeo));
  igraph_vector_destroy(&c_nrgeo);
  IGRAPH_FINALLY_CLEAN(1);
  igraph_vs_destroy(&c_to);
  SET_VECTOR_ELT(result, 0, res);
  SET_VECTOR_ELT(result, 1, nrgeo);
  SET_STRING_ELT(names, 0, CREATE_STRING_VECTOR("res"));
  SET_STRING_ELT(names, 1, CREATE_STRING_VECTOR("nrgeo"));
  SET_NAMES(result, names);
  UNPROTECT(3);

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_get_all_simple_paths                /
/-------------------------------------------*/
SEXP R_igraph_get_all_simple_paths(SEXP graph, SEXP from, SEXP to, SEXP cutoff, SEXP mode) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_int_t c_res;
  igraph_integer_t c_from;
  igraph_vs_t c_to;
  igraph_integer_t c_cutoff;
  igraph_neimode_t c_mode;
  SEXP res;

  SEXP result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_int_init(&c_res, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_res);
  c_from=(igraph_integer_t) REAL(from)[0];
  R_SEXP_to_igraph_vs(to, &c_graph, &c_to);
  c_cutoff=INTEGER(cutoff)[0];
  c_mode=(igraph_neimode_t) REAL(mode)[0];
                                        /* Call igraph */
  igraph_get_all_simple_paths(&c_graph, &c_res, c_from, c_to, c_cutoff, c_mode);

                                        /* Convert output */
  PROTECT(res=R_igraph_vector_int_to_SEXPp1(&c_res));
  igraph_vector_int_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  igraph_vs_destroy(&c_to);
  result=res;

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_betweenness_estimate                /
/-------------------------------------------*/
SEXP R_igraph_betweenness_estimate(SEXP graph, SEXP vids, SEXP directed, SEXP cutoff, SEXP weights, SEXP nobigint) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_t c_res;
  igraph_vs_t c_vids;
  igraph_bool_t c_directed;
  igraph_real_t c_cutoff;
  igraph_vector_t c_weights;
  igraph_bool_t c_nobigint;
  SEXP res;

  SEXP result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_init(&c_res, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_res);
  R_SEXP_to_igraph_vs(vids, &c_graph, &c_vids);
  c_directed=LOGICAL(directed)[0];
  c_cutoff=REAL(cutoff)[0];
  if (!isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
  c_nobigint=LOGICAL(nobigint)[0];
                                        /* Call igraph */
  igraph_betweenness_estimate(&c_graph, &c_res, c_vids, c_directed, c_cutoff, (isNull(weights) ? 0 : &c_weights), c_nobigint);

                                        /* Convert output */
  PROTECT(res=R_igraph_vector_to_SEXP(&c_res));
  igraph_vector_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  igraph_vs_destroy(&c_vids);
  result=res;

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_edge_betweenness                    /
/-------------------------------------------*/
SEXP R_igraph_edge_betweenness(SEXP graph, SEXP directed, SEXP weights) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_t c_res;
  igraph_bool_t c_directed;
  igraph_vector_t c_weights;
  SEXP res;

  SEXP result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_init(&c_res, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_res);
  c_directed=LOGICAL(directed)[0];
  if (!isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
                                        /* Call igraph */
  igraph_edge_betweenness(&c_graph, &c_res, c_directed, (isNull(weights) ? 0 : &c_weights));

                                        /* Convert output */
  PROTECT(res=R_igraph_vector_to_SEXP(&c_res));
  igraph_vector_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  result=res;

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_edge_betweenness_estimate           /
/-------------------------------------------*/
SEXP R_igraph_edge_betweenness_estimate(SEXP graph, SEXP directed, SEXP cutoff, SEXP weights) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_t c_res;
  igraph_bool_t c_directed;
  igraph_real_t c_cutoff;
  igraph_vector_t c_weights;
  SEXP res;

  SEXP result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_init(&c_res, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_res);
  c_directed=LOGICAL(directed)[0];
  c_cutoff=REAL(cutoff)[0];
  if (!isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
                                        /* Call igraph */
  igraph_edge_betweenness_estimate(&c_graph, &c_res, c_directed, c_cutoff, (isNull(weights) ? 0 : &c_weights));

                                        /* Convert output */
  PROTECT(res=R_igraph_vector_to_SEXP(&c_res));
  igraph_vector_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  result=res;

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_pagerank_old                        /
/-------------------------------------------*/
SEXP R_igraph_pagerank_old(SEXP graph, SEXP vids, SEXP directed, SEXP niter, SEXP eps, SEXP damping, SEXP old) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_t c_res;
  igraph_vs_t c_vids;
  igraph_bool_t c_directed;
  igraph_integer_t c_niter;
  igraph_real_t c_eps;
  igraph_real_t c_damping;
  igraph_bool_t c_old;
  SEXP res;

  SEXP result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_init(&c_res, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_res);
  R_SEXP_to_igraph_vs(vids, &c_graph, &c_vids);
  c_directed=LOGICAL(directed)[0];
  c_niter=INTEGER(niter)[0];
  c_eps=REAL(eps)[0];
  c_damping=REAL(damping)[0];
  c_old=LOGICAL(old)[0];
                                        /* Call igraph */
  igraph_pagerank_old(&c_graph, &c_res, c_vids, c_directed, c_niter, c_eps, c_damping, c_old);

                                        /* Convert output */
  PROTECT(res=R_igraph_vector_to_SEXP(&c_res));
  igraph_vector_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  igraph_vs_destroy(&c_vids);
  result=res;

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_personalized_pagerank               /
/-------------------------------------------*/
SEXP R_igraph_personalized_pagerank(SEXP graph, SEXP algo, SEXP vids, SEXP directed, SEXP damping, SEXP personalized, SEXP weights, SEXP options) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_pagerank_algo_t c_algo;
  igraph_vector_t c_vector;
  igraph_real_t c_value;
  igraph_vs_t c_vids;
  igraph_bool_t c_directed;
  igraph_real_t c_damping;
  igraph_vector_t c_personalized;
  igraph_vector_t c_weights;
  igraph_pagerank_power_options_t c_options1;
  igraph_arpack_options_t c_options2;
  void* c_options;
  SEXP vector;
  SEXP value;

  SEXP result, names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  c_algo=(igraph_pagerank_algo_t) INTEGER(algo)[0];
  if (0 != igraph_vector_init(&c_vector, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_vector);
  R_SEXP_to_igraph_vs(vids, &c_graph, &c_vids);
  c_directed=LOGICAL(directed)[0];
  c_damping=REAL(damping)[0];
  if (!isNull(personalized)) { R_SEXP_to_vector(personalized, &c_personalized); }
  if (!isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
  if (c_algo == IGRAPH_PAGERANK_ALGO_POWER) {
  R_SEXP_to_pagerank_power_options(options, &c_options1);
  c_options = &c_options1;
  } else if (c_algo == IGRAPH_PAGERANK_ALGO_ARPACK) {
  R_SEXP_to_igraph_arpack_options(options, &c_options2);
  c_options = &c_options2;	
  } else {
  c_options = 0;
  }
                                        /* Call igraph */
  igraph_personalized_pagerank(&c_graph, c_algo, &c_vector, &c_value, c_vids, c_directed, c_damping, (isNull(personalized) ? 0 : &c_personalized), (isNull(weights) ? 0 : &c_weights), c_options);

                                        /* Convert output */
  PROTECT(result=NEW_LIST(3));
  PROTECT(names=NEW_CHARACTER(3));
  PROTECT(vector=R_igraph_vector_to_SEXP(&c_vector));
  igraph_vector_destroy(&c_vector);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(value=NEW_NUMERIC(1));
  REAL(value)[0]=c_value;
  igraph_vs_destroy(&c_vids);
  if (c_algo == IGRAPH_PAGERANK_ALGO_POWER) {
  PROTECT(options);
  } else if (c_algo == IGRAPH_PAGERANK_ALGO_ARPACK) {
  PROTECT(options = R_igraph_arpack_options_to_SEXP(&c_options2));
  } else {
  PROTECT(options);
  }
  SET_VECTOR_ELT(result, 0, vector);
  SET_VECTOR_ELT(result, 1, value);
  SET_VECTOR_ELT(result, 2, options);
  SET_STRING_ELT(names, 0, CREATE_STRING_VECTOR("vector"));
  SET_STRING_ELT(names, 1, CREATE_STRING_VECTOR("value"));
  SET_STRING_ELT(names, 2, CREATE_STRING_VECTOR("options"));
  SET_NAMES(result, names);
  UNPROTECT(4);

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_induced_subgraph                    /
/-------------------------------------------*/
SEXP R_igraph_induced_subgraph(SEXP graph, SEXP vids, SEXP impl) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_t c_res;
  igraph_vs_t c_vids;
  igraph_subgraph_implementation_t c_impl;
  SEXP res;

  SEXP result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  R_SEXP_to_igraph_vs(vids, &c_graph, &c_vids);
  c_impl=(igraph_subgraph_implementation_t) REAL(impl)[0];
                                        /* Call igraph */
  igraph_induced_subgraph(&c_graph, &c_res, c_vids, c_impl);

                                        /* Convert output */
  IGRAPH_FINALLY(igraph_destroy, &c_res);
  PROTECT(res=R_igraph_to_SEXP(&c_res));
  igraph_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  igraph_vs_destroy(&c_vids);
  result=res;

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_subgraph_edges                      /
/-------------------------------------------*/
SEXP R_igraph_subgraph_edges(SEXP graph, SEXP eids, SEXP delete_vertices) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_t c_res;
  igraph_es_t c_eids;
  igraph_bool_t c_delete_vertices;
  SEXP res;

  SEXP result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  R_SEXP_to_igraph_es(eids, &c_graph, &c_eids);
  c_delete_vertices=LOGICAL(delete_vertices)[0];
                                        /* Call igraph */
  igraph_subgraph_edges(&c_graph, &c_res, c_eids, c_delete_vertices);

                                        /* Convert output */
  IGRAPH_FINALLY(igraph_destroy, &c_res);
  PROTECT(res=R_igraph_to_SEXP(&c_res));
  igraph_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  igraph_es_destroy(&c_eids);
  result=res;

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_path_length_hist                    /
/-------------------------------------------*/
SEXP R_igraph_path_length_hist(SEXP graph, SEXP directed) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_t c_res;
  igraph_real_t c_unconnected;
  igraph_bool_t c_directed;
  SEXP res;
  SEXP unconnected;

  SEXP result, names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_init(&c_res, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_res);
  c_directed=LOGICAL(directed)[0];
                                        /* Call igraph */
  igraph_path_length_hist(&c_graph, &c_res, &c_unconnected, c_directed);

                                        /* Convert output */
  PROTECT(result=NEW_LIST(2));
  PROTECT(names=NEW_CHARACTER(2));
  PROTECT(res=R_igraph_vector_to_SEXP(&c_res));
  igraph_vector_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(unconnected=NEW_NUMERIC(1));
  REAL(unconnected)[0]=c_unconnected;
  SET_VECTOR_ELT(result, 0, res);
  SET_VECTOR_ELT(result, 1, unconnected);
  SET_STRING_ELT(names, 0, CREATE_STRING_VECTOR("res"));
  SET_STRING_ELT(names, 1, CREATE_STRING_VECTOR("unconnected"));
  SET_NAMES(result, names);
  UNPROTECT(3);

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_simplify                            /
/-------------------------------------------*/
SEXP R_igraph_simplify(SEXP graph, SEXP remove_multiple, SEXP remove_loops, SEXP edge_attr_comb) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_bool_t c_remove_multiple;
  igraph_bool_t c_remove_loops;
  igraph_attribute_combination_t c_edge_attr_comb;

  SEXP result;
                                        /* Convert input */
  R_SEXP_to_igraph_copy(graph, &c_graph);
  IGRAPH_FINALLY(igraph_destroy, &c_graph);
  c_remove_multiple=LOGICAL(remove_multiple)[0];
  c_remove_loops=LOGICAL(remove_loops)[0];
  R_SEXP_to_attr_comb(edge_attr_comb, &c_edge_attr_comb);
                                        /* Call igraph */
  igraph_simplify(&c_graph, c_remove_multiple, c_remove_loops, &c_edge_attr_comb);

                                        /* Convert output */
  PROTECT(graph=R_igraph_to_SEXP(&c_graph));
  igraph_destroy(&c_graph);
  IGRAPH_FINALLY_CLEAN(1);
  igraph_attribute_combination_destroy(&c_edge_attr_comb);
  result=graph;

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_is_dag                              /
/-------------------------------------------*/
SEXP R_igraph_is_dag(SEXP graph) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_bool_t c_res;
  SEXP res;

  SEXP result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
                                        /* Call igraph */
  igraph_is_dag(&c_graph, &c_res);

                                        /* Convert output */
  PROTECT(res=NEW_LOGICAL(1));
  LOGICAL(res)[0]=c_res;
  result=res;

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_is_simple                           /
/-------------------------------------------*/
SEXP R_igraph_is_simple(SEXP graph) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_bool_t c_res;
  SEXP res;

  SEXP result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
                                        /* Call igraph */
  igraph_is_simple(&c_graph, &c_res);

                                        /* Convert output */
  PROTECT(res=NEW_LOGICAL(1));
  LOGICAL(res)[0]=c_res;
  result=res;

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_has_multiple                        /
/-------------------------------------------*/
SEXP R_igraph_has_multiple(SEXP graph) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_bool_t c_res;
  SEXP res;

  SEXP result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
                                        /* Call igraph */
  igraph_has_multiple(&c_graph, &c_res);

                                        /* Convert output */
  PROTECT(res=NEW_LOGICAL(1));
  LOGICAL(res)[0]=c_res;
  result=res;

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_eigenvector_centrality              /
/-------------------------------------------*/
SEXP R_igraph_eigenvector_centrality(SEXP graph, SEXP directed, SEXP scale, SEXP weights, SEXP options) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_t c_vector;
  igraph_real_t c_value;
  igraph_bool_t c_directed;
  igraph_bool_t c_scale;
  igraph_vector_t c_weights;
  igraph_arpack_options_t c_options;
  SEXP vector;
  SEXP value;

  SEXP result, names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_init(&c_vector, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_vector);
  c_directed=LOGICAL(directed)[0];
  c_scale=LOGICAL(scale)[0];
  if (!isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
  R_SEXP_to_igraph_arpack_options(options, &c_options);
                                        /* Call igraph */
  igraph_eigenvector_centrality(&c_graph, &c_vector, &c_value, c_directed, c_scale, (isNull(weights) ? 0 : &c_weights), &c_options);

                                        /* Convert output */
  PROTECT(result=NEW_LIST(3));
  PROTECT(names=NEW_CHARACTER(3));
  PROTECT(vector=R_igraph_vector_to_SEXP(&c_vector));
  igraph_vector_destroy(&c_vector);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(value=NEW_NUMERIC(1));
  REAL(value)[0]=c_value;
  PROTECT(options=R_igraph_arpack_options_to_SEXP(&c_options));
  SET_VECTOR_ELT(result, 0, vector);
  SET_VECTOR_ELT(result, 1, value);
  SET_VECTOR_ELT(result, 2, options);
  SET_STRING_ELT(names, 0, CREATE_STRING_VECTOR("vector"));
  SET_STRING_ELT(names, 1, CREATE_STRING_VECTOR("value"));
  SET_STRING_ELT(names, 2, CREATE_STRING_VECTOR("options"));
  SET_NAMES(result, names);
  UNPROTECT(4);

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_hub_score                           /
/-------------------------------------------*/
SEXP R_igraph_hub_score(SEXP graph, SEXP scale, SEXP weights, SEXP options) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_t c_vector;
  igraph_real_t c_value;
  igraph_bool_t c_scale;
  igraph_vector_t c_weights;
  igraph_arpack_options_t c_options;
  SEXP vector;
  SEXP value;

  SEXP result, names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_init(&c_vector, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_vector);
  c_scale=LOGICAL(scale)[0];
  if (!isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
  R_SEXP_to_igraph_arpack_options(options, &c_options);
                                        /* Call igraph */
  igraph_hub_score(&c_graph, &c_vector, &c_value, c_scale, (isNull(weights) ? 0 : &c_weights), &c_options);

                                        /* Convert output */
  PROTECT(result=NEW_LIST(3));
  PROTECT(names=NEW_CHARACTER(3));
  PROTECT(vector=R_igraph_vector_to_SEXP(&c_vector));
  igraph_vector_destroy(&c_vector);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(value=NEW_NUMERIC(1));
  REAL(value)[0]=c_value;
  PROTECT(options=R_igraph_arpack_options_to_SEXP(&c_options));
  SET_VECTOR_ELT(result, 0, vector);
  SET_VECTOR_ELT(result, 1, value);
  SET_VECTOR_ELT(result, 2, options);
  SET_STRING_ELT(names, 0, CREATE_STRING_VECTOR("vector"));
  SET_STRING_ELT(names, 1, CREATE_STRING_VECTOR("value"));
  SET_STRING_ELT(names, 2, CREATE_STRING_VECTOR("options"));
  SET_NAMES(result, names);
  UNPROTECT(4);

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_authority_score                     /
/-------------------------------------------*/
SEXP R_igraph_authority_score(SEXP graph, SEXP scale, SEXP weights, SEXP options) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_t c_vector;
  igraph_real_t c_value;
  igraph_bool_t c_scale;
  igraph_vector_t c_weights;
  igraph_arpack_options_t c_options;
  SEXP vector;
  SEXP value;

  SEXP result, names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_init(&c_vector, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_vector);
  c_scale=LOGICAL(scale)[0];
  if (!isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
  R_SEXP_to_igraph_arpack_options(options, &c_options);
                                        /* Call igraph */
  igraph_authority_score(&c_graph, &c_vector, &c_value, c_scale, (isNull(weights) ? 0 : &c_weights), &c_options);

                                        /* Convert output */
  PROTECT(result=NEW_LIST(3));
  PROTECT(names=NEW_CHARACTER(3));
  PROTECT(vector=R_igraph_vector_to_SEXP(&c_vector));
  igraph_vector_destroy(&c_vector);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(value=NEW_NUMERIC(1));
  REAL(value)[0]=c_value;
  PROTECT(options=R_igraph_arpack_options_to_SEXP(&c_options));
  SET_VECTOR_ELT(result, 0, vector);
  SET_VECTOR_ELT(result, 1, value);
  SET_VECTOR_ELT(result, 2, options);
  SET_STRING_ELT(names, 0, CREATE_STRING_VECTOR("vector"));
  SET_STRING_ELT(names, 1, CREATE_STRING_VECTOR("value"));
  SET_STRING_ELT(names, 2, CREATE_STRING_VECTOR("options"));
  SET_NAMES(result, names);
  UNPROTECT(4);

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_arpack_unpack_complex               /
/-------------------------------------------*/
SEXP R_igraph_arpack_unpack_complex(SEXP vectors, SEXP values, SEXP nev) {
                                        /* Declarations */
  igraph_matrix_t c_vectors;
  igraph_matrix_t c_values;
  igraph_integer_t c_nev;

  SEXP result, names;
                                        /* Convert input */
  if (0 != R_SEXP_to_igraph_matrix_copy(vectors, &c_vectors)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_matrix_destroy, &c_vectors);
  if (0 != R_SEXP_to_igraph_matrix_copy(values, &c_values)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_matrix_destroy, &c_values);
  c_nev=INTEGER(nev)[0];
                                        /* Call igraph */
  igraph_arpack_unpack_complex(&c_vectors, &c_values, c_nev);

                                        /* Convert output */
  PROTECT(result=NEW_LIST(2));
  PROTECT(names=NEW_CHARACTER(2));
  PROTECT(vectors=R_igraph_matrix_to_SEXP(&c_vectors));
  igraph_matrix_destroy(&c_vectors);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(values=R_igraph_matrix_to_SEXP(&c_values));
  igraph_matrix_destroy(&c_values);
  IGRAPH_FINALLY_CLEAN(1);
  SET_VECTOR_ELT(result, 0, vectors);
  SET_VECTOR_ELT(result, 1, values);
  SET_STRING_ELT(names, 0, CREATE_STRING_VECTOR("vectors"));
  SET_STRING_ELT(names, 1, CREATE_STRING_VECTOR("values"));
  SET_NAMES(result, names);
  UNPROTECT(3);

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_unfold_tree                         /
/-------------------------------------------*/
SEXP R_igraph_unfold_tree(SEXP graph, SEXP mode, SEXP roots) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_t c_tree;
  igraph_neimode_t c_mode;
  igraph_vector_t c_roots;
  igraph_vector_t c_vertex_index;
  SEXP tree;
  SEXP vertex_index;

  SEXP result, names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  c_mode=(igraph_neimode_t) REAL(mode)[0];
  R_SEXP_to_vector(roots, &c_roots);
  if (0 != igraph_vector_init(&c_vertex_index, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_vertex_index);
  vertex_index=R_GlobalEnv; /* hack to have a non-NULL value */
                                        /* Call igraph */
  igraph_unfold_tree(&c_graph, &c_tree, c_mode, &c_roots, (isNull(vertex_index) ? 0 : &c_vertex_index));

                                        /* Convert output */
  PROTECT(result=NEW_LIST(2));
  PROTECT(names=NEW_CHARACTER(2));
  IGRAPH_FINALLY(igraph_destroy, &c_tree);
  PROTECT(tree=R_igraph_to_SEXP(&c_tree));
  igraph_destroy(&c_tree);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(vertex_index=R_igraph_0orvector_to_SEXPp1(&c_vertex_index));
  igraph_vector_destroy(&c_vertex_index);
  IGRAPH_FINALLY_CLEAN(1);
  SET_VECTOR_ELT(result, 0, tree);
  SET_VECTOR_ELT(result, 1, vertex_index);
  SET_STRING_ELT(names, 0, CREATE_STRING_VECTOR("tree"));
  SET_STRING_ELT(names, 1, CREATE_STRING_VECTOR("vertex_index"));
  SET_NAMES(result, names);
  UNPROTECT(3);

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_is_mutual                           /
/-------------------------------------------*/
SEXP R_igraph_is_mutual(SEXP graph, SEXP es) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_bool_t c_res;
  igraph_es_t c_es;
  SEXP res;

  SEXP result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_bool_init(&c_res, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_bool_destroy, &c_res);
  R_SEXP_to_igraph_es(es, &c_graph, &c_es);
                                        /* Call igraph */
  igraph_is_mutual(&c_graph, &c_res, c_es);

                                        /* Convert output */
  PROTECT(res=R_igraph_vector_bool_to_SEXP(&c_res));
  igraph_vector_bool_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  igraph_es_destroy(&c_es);
  result=res;

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_maximum_cardinality_search          /
/-------------------------------------------*/
SEXP R_igraph_maximum_cardinality_search(SEXP graph) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_t c_alpha;
  igraph_vector_t c_alpham1;
  SEXP alpha;
  SEXP alpham1;

  SEXP result, names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_init(&c_alpha, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_alpha);
  if (0 != igraph_vector_init(&c_alpham1, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_alpham1);
  alpham1=R_GlobalEnv; /* hack to have a non-NULL value */
                                        /* Call igraph */
  igraph_maximum_cardinality_search(&c_graph, &c_alpha, (isNull(alpham1) ? 0 : &c_alpham1));

                                        /* Convert output */
  PROTECT(result=NEW_LIST(2));
  PROTECT(names=NEW_CHARACTER(2));
  PROTECT(alpha=R_igraph_vector_to_SEXPp1(&c_alpha));
  igraph_vector_destroy(&c_alpha);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(alpham1=R_igraph_0orvector_to_SEXPp1(&c_alpham1));
  igraph_vector_destroy(&c_alpham1);
  IGRAPH_FINALLY_CLEAN(1);
  SET_VECTOR_ELT(result, 0, alpha);
  SET_VECTOR_ELT(result, 1, alpham1);
  SET_STRING_ELT(names, 0, CREATE_STRING_VECTOR("alpha"));
  SET_STRING_ELT(names, 1, CREATE_STRING_VECTOR("alpham1"));
  SET_NAMES(result, names);
  UNPROTECT(3);

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_avg_nearest_neighbor_degree         /
/-------------------------------------------*/
SEXP R_igraph_avg_nearest_neighbor_degree(SEXP graph, SEXP vids, SEXP mode, SEXP neighbor_degree_mode, SEXP weights) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vs_t c_vids;
  igraph_neimode_t c_mode;
  igraph_neimode_t c_neighbor_degree_mode;
  igraph_vector_t c_knn;
  igraph_vector_t c_knnk;
  igraph_vector_t c_weights;
  SEXP knn;
  SEXP knnk;

  SEXP result, names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  R_SEXP_to_igraph_vs(vids, &c_graph, &c_vids);
  c_mode=(igraph_neimode_t) REAL(mode)[0];
  c_neighbor_degree_mode=(igraph_neimode_t) REAL(neighbor_degree_mode)[0];
  if (0 != igraph_vector_init(&c_knn, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_knn);
  if (0 != igraph_vector_init(&c_knnk, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_knnk);
  knnk=R_GlobalEnv; /* hack to have a non-NULL value */
  if (!isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
                                        /* Call igraph */
  igraph_avg_nearest_neighbor_degree(&c_graph, c_vids, c_mode, c_neighbor_degree_mode, &c_knn, (isNull(knnk) ? 0 : &c_knnk), (isNull(weights) ? 0 : &c_weights));

                                        /* Convert output */
  PROTECT(result=NEW_LIST(2));
  PROTECT(names=NEW_CHARACTER(2));
  igraph_vs_destroy(&c_vids);
  PROTECT(knn=R_igraph_vector_to_SEXP(&c_knn));
  igraph_vector_destroy(&c_knn);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(knnk=R_igraph_0orvector_to_SEXP(&c_knnk));
  igraph_vector_destroy(&c_knnk);
  IGRAPH_FINALLY_CLEAN(1);
  SET_VECTOR_ELT(result, 0, knn);
  SET_VECTOR_ELT(result, 1, knnk);
  SET_STRING_ELT(names, 0, CREATE_STRING_VECTOR("knn"));
  SET_STRING_ELT(names, 1, CREATE_STRING_VECTOR("knnk"));
  SET_NAMES(result, names);
  UNPROTECT(3);

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_strength                            /
/-------------------------------------------*/
SEXP R_igraph_strength(SEXP graph, SEXP vids, SEXP mode, SEXP loops, SEXP weights) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_t c_res;
  igraph_vs_t c_vids;
  igraph_neimode_t c_mode;
  igraph_bool_t c_loops;
  igraph_vector_t c_weights;
  SEXP res;

  SEXP result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_init(&c_res, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_res);
  R_SEXP_to_igraph_vs(vids, &c_graph, &c_vids);
  c_mode=(igraph_neimode_t) REAL(mode)[0];
  c_loops=LOGICAL(loops)[0];
  if (!isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
                                        /* Call igraph */
  igraph_strength(&c_graph, &c_res, c_vids, c_mode, c_loops, (isNull(weights) ? 0 : &c_weights));

                                        /* Convert output */
  PROTECT(res=R_igraph_vector_to_SEXP(&c_res));
  igraph_vector_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  igraph_vs_destroy(&c_vids);
  result=res;

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_centralization                      /
/-------------------------------------------*/
SEXP R_igraph_centralization(SEXP scores, SEXP theoretical_max, SEXP normalized) {
                                        /* Declarations */
  igraph_vector_t c_scores;
  igraph_real_t c_theoretical_max;
  igraph_bool_t c_normalized;
  igraph_real_t c_result;
  SEXP result;
                                        /* Convert input */
  R_SEXP_to_vector(scores, &c_scores);
  c_theoretical_max=REAL(theoretical_max)[0];
  c_normalized=LOGICAL(normalized)[0];
                                        /* Call igraph */
  c_result=  igraph_centralization(&c_scores, c_theoretical_max, c_normalized);

                                        /* Convert output */

  PROTECT(result=NEW_NUMERIC(1));
  REAL(result)[0]=c_result;

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_centralization_degree               /
/-------------------------------------------*/
SEXP R_igraph_centralization_degree(SEXP graph, SEXP mode, SEXP loops, SEXP normalized) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_t c_res;
  igraph_neimode_t c_mode;
  igraph_bool_t c_loops;
  igraph_real_t c_centralization;
  igraph_real_t c_theoretical_max;
  igraph_bool_t c_normalized;
  SEXP res;
  SEXP centralization;
  SEXP theoretical_max;

  SEXP result, names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_init(&c_res, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_res);
  c_mode=(igraph_neimode_t) REAL(mode)[0];
  c_loops=LOGICAL(loops)[0];
  c_normalized=LOGICAL(normalized)[0];
                                        /* Call igraph */
  igraph_centralization_degree(&c_graph, &c_res, c_mode, c_loops, &c_centralization, &c_theoretical_max, c_normalized);

                                        /* Convert output */
  PROTECT(result=NEW_LIST(3));
  PROTECT(names=NEW_CHARACTER(3));
  PROTECT(res=R_igraph_vector_to_SEXP(&c_res));
  igraph_vector_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(centralization=NEW_NUMERIC(1));
  REAL(centralization)[0]=c_centralization;
  PROTECT(theoretical_max=NEW_NUMERIC(1));
  REAL(theoretical_max)[0]=c_theoretical_max;
  SET_VECTOR_ELT(result, 0, res);
  SET_VECTOR_ELT(result, 1, centralization);
  SET_VECTOR_ELT(result, 2, theoretical_max);
  SET_STRING_ELT(names, 0, CREATE_STRING_VECTOR("res"));
  SET_STRING_ELT(names, 1, CREATE_STRING_VECTOR("centralization"));
  SET_STRING_ELT(names, 2, CREATE_STRING_VECTOR("theoretical_max"));
  SET_NAMES(result, names);
  UNPROTECT(4);

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_centralization_degree_tmax          /
/-------------------------------------------*/
SEXP R_igraph_centralization_degree_tmax(SEXP graph, SEXP nodes, SEXP mode, SEXP loops) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_integer_t c_nodes;
  igraph_neimode_t c_mode;
  igraph_bool_t c_loops;
  igraph_real_t c_res;
  SEXP res;

  SEXP result;
                                        /* Convert input */
  if (!isNull(graph)) { R_SEXP_to_igraph(graph, &c_graph); }
  c_nodes=INTEGER(nodes)[0];
  c_mode=(igraph_neimode_t) REAL(mode)[0];
  c_loops=LOGICAL(loops)[0];
                                        /* Call igraph */
  igraph_centralization_degree_tmax((isNull(graph) ? 0 : &c_graph), c_nodes, c_mode, c_loops, &c_res);

                                        /* Convert output */
  PROTECT(res=NEW_NUMERIC(1));
  REAL(res)[0]=c_res;
  result=res;

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_centralization_betweenness          /
/-------------------------------------------*/
SEXP R_igraph_centralization_betweenness(SEXP graph, SEXP directed, SEXP nobigint, SEXP normalized) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_t c_res;
  igraph_bool_t c_directed;
  igraph_bool_t c_nobigint;
  igraph_real_t c_centralization;
  igraph_real_t c_theoretical_max;
  igraph_bool_t c_normalized;
  SEXP res;
  SEXP centralization;
  SEXP theoretical_max;

  SEXP result, names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_init(&c_res, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_res);
  c_directed=LOGICAL(directed)[0];
  c_nobigint=LOGICAL(nobigint)[0];
  c_normalized=LOGICAL(normalized)[0];
                                        /* Call igraph */
  igraph_centralization_betweenness(&c_graph, &c_res, c_directed, c_nobigint, &c_centralization, &c_theoretical_max, c_normalized);

                                        /* Convert output */
  PROTECT(result=NEW_LIST(3));
  PROTECT(names=NEW_CHARACTER(3));
  PROTECT(res=R_igraph_vector_to_SEXP(&c_res));
  igraph_vector_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(centralization=NEW_NUMERIC(1));
  REAL(centralization)[0]=c_centralization;
  PROTECT(theoretical_max=NEW_NUMERIC(1));
  REAL(theoretical_max)[0]=c_theoretical_max;
  SET_VECTOR_ELT(result, 0, res);
  SET_VECTOR_ELT(result, 1, centralization);
  SET_VECTOR_ELT(result, 2, theoretical_max);
  SET_STRING_ELT(names, 0, CREATE_STRING_VECTOR("res"));
  SET_STRING_ELT(names, 1, CREATE_STRING_VECTOR("centralization"));
  SET_STRING_ELT(names, 2, CREATE_STRING_VECTOR("theoretical_max"));
  SET_NAMES(result, names);
  UNPROTECT(4);

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_centralization_betweenness_tmax     /
/-------------------------------------------*/
SEXP R_igraph_centralization_betweenness_tmax(SEXP graph, SEXP nodes, SEXP directed) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_integer_t c_nodes;
  igraph_bool_t c_directed;
  igraph_real_t c_res;
  SEXP res;

  SEXP result;
                                        /* Convert input */
  if (!isNull(graph)) { R_SEXP_to_igraph(graph, &c_graph); }
  c_nodes=INTEGER(nodes)[0];
  c_directed=LOGICAL(directed)[0];
                                        /* Call igraph */
  igraph_centralization_betweenness_tmax((isNull(graph) ? 0 : &c_graph), c_nodes, c_directed, &c_res);

                                        /* Convert output */
  PROTECT(res=NEW_NUMERIC(1));
  REAL(res)[0]=c_res;
  result=res;

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_centralization_closeness            /
/-------------------------------------------*/
SEXP R_igraph_centralization_closeness(SEXP graph, SEXP mode, SEXP normalized) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_t c_res;
  igraph_neimode_t c_mode;
  igraph_real_t c_centralization;
  igraph_real_t c_theoretical_max;
  igraph_bool_t c_normalized;
  SEXP res;
  SEXP centralization;
  SEXP theoretical_max;

  SEXP result, names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_init(&c_res, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_res);
  c_mode=(igraph_neimode_t) REAL(mode)[0];
  c_normalized=LOGICAL(normalized)[0];
                                        /* Call igraph */
  igraph_centralization_closeness(&c_graph, &c_res, c_mode, &c_centralization, &c_theoretical_max, c_normalized);

                                        /* Convert output */
  PROTECT(result=NEW_LIST(3));
  PROTECT(names=NEW_CHARACTER(3));
  PROTECT(res=R_igraph_vector_to_SEXP(&c_res));
  igraph_vector_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(centralization=NEW_NUMERIC(1));
  REAL(centralization)[0]=c_centralization;
  PROTECT(theoretical_max=NEW_NUMERIC(1));
  REAL(theoretical_max)[0]=c_theoretical_max;
  SET_VECTOR_ELT(result, 0, res);
  SET_VECTOR_ELT(result, 1, centralization);
  SET_VECTOR_ELT(result, 2, theoretical_max);
  SET_STRING_ELT(names, 0, CREATE_STRING_VECTOR("res"));
  SET_STRING_ELT(names, 1, CREATE_STRING_VECTOR("centralization"));
  SET_STRING_ELT(names, 2, CREATE_STRING_VECTOR("theoretical_max"));
  SET_NAMES(result, names);
  UNPROTECT(4);

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_centralization_closeness_tmax       /
/-------------------------------------------*/
SEXP R_igraph_centralization_closeness_tmax(SEXP graph, SEXP nodes, SEXP mode) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_integer_t c_nodes;
  igraph_neimode_t c_mode;
  igraph_real_t c_res;
  SEXP res;

  SEXP result;
                                        /* Convert input */
  if (!isNull(graph)) { R_SEXP_to_igraph(graph, &c_graph); }
  c_nodes=INTEGER(nodes)[0];
  c_mode=(igraph_neimode_t) REAL(mode)[0];
                                        /* Call igraph */
  igraph_centralization_closeness_tmax((isNull(graph) ? 0 : &c_graph), c_nodes, c_mode, &c_res);

                                        /* Convert output */
  PROTECT(res=NEW_NUMERIC(1));
  REAL(res)[0]=c_res;
  result=res;

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_centralization_eigenvector_centrality /
/-------------------------------------------*/
SEXP R_igraph_centralization_eigenvector_centrality(SEXP graph, SEXP directed, SEXP scale, SEXP options, SEXP normalized) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_t c_vector;
  igraph_real_t c_value;
  igraph_bool_t c_directed;
  igraph_bool_t c_scale;
  igraph_arpack_options_t c_options;
  igraph_real_t c_centralization;
  igraph_real_t c_theoretical_max;
  igraph_bool_t c_normalized;
  SEXP vector;
  SEXP value;
  SEXP centralization;
  SEXP theoretical_max;

  SEXP result, names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_init(&c_vector, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_vector);
  c_directed=LOGICAL(directed)[0];
  c_scale=LOGICAL(scale)[0];
  R_SEXP_to_igraph_arpack_options(options, &c_options);
  c_normalized=LOGICAL(normalized)[0];
                                        /* Call igraph */
  igraph_centralization_eigenvector_centrality(&c_graph, &c_vector, &c_value, c_directed, c_scale, &c_options, &c_centralization, &c_theoretical_max, c_normalized);

                                        /* Convert output */
  PROTECT(result=NEW_LIST(5));
  PROTECT(names=NEW_CHARACTER(5));
  PROTECT(vector=R_igraph_vector_to_SEXP(&c_vector));
  igraph_vector_destroy(&c_vector);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(value=NEW_NUMERIC(1));
  REAL(value)[0]=c_value;
  PROTECT(options=R_igraph_arpack_options_to_SEXP(&c_options));
  PROTECT(centralization=NEW_NUMERIC(1));
  REAL(centralization)[0]=c_centralization;
  PROTECT(theoretical_max=NEW_NUMERIC(1));
  REAL(theoretical_max)[0]=c_theoretical_max;
  SET_VECTOR_ELT(result, 0, vector);
  SET_VECTOR_ELT(result, 1, value);
  SET_VECTOR_ELT(result, 2, options);
  SET_VECTOR_ELT(result, 3, centralization);
  SET_VECTOR_ELT(result, 4, theoretical_max);
  SET_STRING_ELT(names, 0, CREATE_STRING_VECTOR("vector"));
  SET_STRING_ELT(names, 1, CREATE_STRING_VECTOR("value"));
  SET_STRING_ELT(names, 2, CREATE_STRING_VECTOR("options"));
  SET_STRING_ELT(names, 3, CREATE_STRING_VECTOR("centralization"));
  SET_STRING_ELT(names, 4, CREATE_STRING_VECTOR("theoretical_max"));
  SET_NAMES(result, names);
  UNPROTECT(6);

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_centralization_eigenvector_centrality_tmax /
/-------------------------------------------*/
SEXP R_igraph_centralization_eigenvector_centrality_tmax(SEXP graph, SEXP nodes, SEXP directed, SEXP scale) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_integer_t c_nodes;
  igraph_bool_t c_directed;
  igraph_bool_t c_scale;
  igraph_real_t c_res;
  SEXP res;

  SEXP result;
                                        /* Convert input */
  if (!isNull(graph)) { R_SEXP_to_igraph(graph, &c_graph); }
  c_nodes=INTEGER(nodes)[0];
  c_directed=LOGICAL(directed)[0];
  c_scale=LOGICAL(scale)[0];
                                        /* Call igraph */
  igraph_centralization_eigenvector_centrality_tmax((isNull(graph) ? 0 : &c_graph), c_nodes, c_directed, c_scale, &c_res);

                                        /* Convert output */
  PROTECT(res=NEW_NUMERIC(1));
  REAL(res)[0]=c_res;
  result=res;

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_assortativity_nominal               /
/-------------------------------------------*/
SEXP R_igraph_assortativity_nominal(SEXP graph, SEXP types, SEXP directed) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_t c_types;
  igraph_real_t c_res;
  igraph_bool_t c_directed;
  SEXP res;

  SEXP result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  R_SEXP_to_vector(types, &c_types);
  c_directed=LOGICAL(directed)[0];
                                        /* Call igraph */
  igraph_assortativity_nominal(&c_graph, &c_types, &c_res, c_directed);

                                        /* Convert output */
  PROTECT(res=NEW_NUMERIC(1));
  REAL(res)[0]=c_res;
  result=res;

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_assortativity                       /
/-------------------------------------------*/
SEXP R_igraph_assortativity(SEXP graph, SEXP types1, SEXP types2, SEXP directed) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_t c_types1;
  igraph_vector_t c_types2;
  igraph_real_t c_res;
  igraph_bool_t c_directed;
  SEXP res;

  SEXP result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  R_SEXP_to_vector(types1, &c_types1);
  if (!isNull(types2)) { R_SEXP_to_vector(types2, &c_types2); }
  c_directed=LOGICAL(directed)[0];
                                        /* Call igraph */
  igraph_assortativity(&c_graph, &c_types1, (isNull(types2) ? 0 : &c_types2), &c_res, c_directed);

                                        /* Convert output */
  PROTECT(res=NEW_NUMERIC(1));
  REAL(res)[0]=c_res;
  result=res;

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_assortativity_degree                /
/-------------------------------------------*/
SEXP R_igraph_assortativity_degree(SEXP graph, SEXP directed) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_real_t c_res;
  igraph_bool_t c_directed;
  SEXP res;

  SEXP result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  c_directed=LOGICAL(directed)[0];
                                        /* Call igraph */
  igraph_assortativity_degree(&c_graph, &c_res, c_directed);

                                        /* Convert output */
  PROTECT(res=NEW_NUMERIC(1));
  REAL(res)[0]=c_res;
  result=res;

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_contract_vertices                   /
/-------------------------------------------*/
SEXP R_igraph_contract_vertices(SEXP graph, SEXP mapping, SEXP vertex_attr_comb) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_t c_mapping;
  igraph_attribute_combination_t c_vertex_attr_comb;

  SEXP result;
                                        /* Convert input */
  R_SEXP_to_igraph_copy(graph, &c_graph);
  IGRAPH_FINALLY(igraph_destroy, &c_graph);
  R_SEXP_to_vector(mapping, &c_mapping);
  R_SEXP_to_attr_comb(vertex_attr_comb, &c_vertex_attr_comb);
                                        /* Call igraph */
  igraph_contract_vertices(&c_graph, &c_mapping, &c_vertex_attr_comb);

                                        /* Convert output */
  PROTECT(graph=R_igraph_to_SEXP(&c_graph));
  igraph_destroy(&c_graph);
  IGRAPH_FINALLY_CLEAN(1);
  igraph_attribute_combination_destroy(&c_vertex_attr_comb);
  result=graph;

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_eccentricity                        /
/-------------------------------------------*/
SEXP R_igraph_eccentricity(SEXP graph, SEXP vids, SEXP mode) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_t c_res;
  igraph_vs_t c_vids;
  igraph_neimode_t c_mode;
  SEXP res;

  SEXP result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_init(&c_res, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_res);
  R_SEXP_to_igraph_vs(vids, &c_graph, &c_vids);
  c_mode=(igraph_neimode_t) REAL(mode)[0];
                                        /* Call igraph */
  igraph_eccentricity(&c_graph, &c_res, c_vids, c_mode);

                                        /* Convert output */
  PROTECT(res=R_igraph_vector_to_SEXP(&c_res));
  igraph_vector_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  igraph_vs_destroy(&c_vids);
  result=res;

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_radius                              /
/-------------------------------------------*/
SEXP R_igraph_radius(SEXP graph, SEXP mode) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_real_t c_radius;
  igraph_neimode_t c_mode;
  SEXP radius;

  SEXP result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  c_mode=(igraph_neimode_t) REAL(mode)[0];
                                        /* Call igraph */
  igraph_radius(&c_graph, &c_radius, c_mode);

                                        /* Convert output */
  PROTECT(radius=NEW_NUMERIC(1));
  REAL(radius)[0]=c_radius;
  result=radius;

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_diversity                           /
/-------------------------------------------*/
SEXP R_igraph_diversity(SEXP graph, SEXP weights, SEXP vids) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_t c_weights;
  igraph_vector_t c_res;
  igraph_vs_t c_vids;
  SEXP res;

  SEXP result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (!isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
  if (0 != igraph_vector_init(&c_res, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_res);
  R_SEXP_to_igraph_vs(vids, &c_graph, &c_vids);
                                        /* Call igraph */
  igraph_diversity(&c_graph, (isNull(weights) ? 0 : &c_weights), &c_res, c_vids);

                                        /* Convert output */
  PROTECT(res=R_igraph_vector_to_SEXP(&c_res));
  igraph_vector_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  igraph_vs_destroy(&c_vids);
  result=res;

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_random_walk                         /
/-------------------------------------------*/
SEXP R_igraph_random_walk(SEXP graph, SEXP start, SEXP mode, SEXP steps, SEXP stuck) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_t c_walk;
  igraph_integer_t c_start;
  igraph_neimode_t c_mode;
  igraph_integer_t c_steps;
  igraph_random_walk_stuck_t c_stuck;
  SEXP walk;

  SEXP result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_init(&c_walk, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_walk);
  c_start=(igraph_integer_t) REAL(start)[0];
  c_mode=(igraph_neimode_t) REAL(mode)[0];
  c_steps=INTEGER(steps)[0];
  c_stuck=(igraph_random_walk_stuck_t) INTEGER(stuck)[0];
                                        /* Call igraph */
  igraph_random_walk(&c_graph, &c_walk, c_start, c_mode, c_steps, c_stuck);

                                        /* Convert output */
  PROTECT(walk=R_igraph_vector_to_SEXPp1(&c_walk));
  igraph_vector_destroy(&c_walk);
  IGRAPH_FINALLY_CLEAN(1);
  result=walk;

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_is_degree_sequence                  /
/-------------------------------------------*/
SEXP R_igraph_is_degree_sequence(SEXP out_deg, SEXP in_deg) {
                                        /* Declarations */
  igraph_vector_t c_out_deg;
  igraph_vector_t c_in_deg;
  igraph_bool_t c_res;
  SEXP res;

  SEXP result;
                                        /* Convert input */
  R_SEXP_to_vector(out_deg, &c_out_deg);
  if (!isNull(in_deg)) { R_SEXP_to_vector(in_deg, &c_in_deg); }
                                        /* Call igraph */
  igraph_is_degree_sequence(&c_out_deg, (isNull(in_deg) ? 0 : &c_in_deg), &c_res);

                                        /* Convert output */
  PROTECT(res=NEW_LOGICAL(1));
  LOGICAL(res)[0]=c_res;
  result=res;

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_is_graphical_degree_sequence        /
/-------------------------------------------*/
SEXP R_igraph_is_graphical_degree_sequence(SEXP out_deg, SEXP in_deg) {
                                        /* Declarations */
  igraph_vector_t c_out_deg;
  igraph_vector_t c_in_deg;
  igraph_bool_t c_res;
  SEXP res;

  SEXP result;
                                        /* Convert input */
  R_SEXP_to_vector(out_deg, &c_out_deg);
  if (!isNull(in_deg)) { R_SEXP_to_vector(in_deg, &c_in_deg); }
                                        /* Call igraph */
  igraph_is_graphical_degree_sequence(&c_out_deg, (isNull(in_deg) ? 0 : &c_in_deg), &c_res);

                                        /* Convert output */
  PROTECT(res=NEW_LOGICAL(1));
  LOGICAL(res)[0]=c_res;
  result=res;

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_bipartite_projection_size           /
/-------------------------------------------*/
SEXP R_igraph_bipartite_projection_size(SEXP graph, SEXP types) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_bool_t c_types;
  igraph_integer_t c_vcount1;
  igraph_integer_t c_ecount1;
  igraph_integer_t c_vcount2;
  igraph_integer_t c_ecount2;
  SEXP vcount1;
  SEXP ecount1;
  SEXP vcount2;
  SEXP ecount2;

  SEXP result, names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (!isNull(types)) { R_SEXP_to_vector_bool(types, &c_types); }
                                        /* Call igraph */
  igraph_bipartite_projection_size(&c_graph, (isNull(types) ? 0 : &c_types), &c_vcount1, &c_ecount1, &c_vcount2, &c_ecount2);

                                        /* Convert output */
  PROTECT(result=NEW_LIST(4));
  PROTECT(names=NEW_CHARACTER(4));
  PROTECT(vcount1=NEW_INTEGER(1));
  INTEGER(vcount1)[0]=c_vcount1;
  PROTECT(ecount1=NEW_INTEGER(1));
  INTEGER(ecount1)[0]=c_ecount1;
  PROTECT(vcount2=NEW_INTEGER(1));
  INTEGER(vcount2)[0]=c_vcount2;
  PROTECT(ecount2=NEW_INTEGER(1));
  INTEGER(ecount2)[0]=c_ecount2;
  SET_VECTOR_ELT(result, 0, vcount1);
  SET_VECTOR_ELT(result, 1, ecount1);
  SET_VECTOR_ELT(result, 2, vcount2);
  SET_VECTOR_ELT(result, 3, ecount2);
  SET_STRING_ELT(names, 0, CREATE_STRING_VECTOR("vcount1"));
  SET_STRING_ELT(names, 1, CREATE_STRING_VECTOR("ecount1"));
  SET_STRING_ELT(names, 2, CREATE_STRING_VECTOR("vcount2"));
  SET_STRING_ELT(names, 3, CREATE_STRING_VECTOR("ecount2"));
  SET_NAMES(result, names);
  UNPROTECT(5);

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_create_bipartite                    /
/-------------------------------------------*/
SEXP R_igraph_create_bipartite(SEXP types, SEXP edges, SEXP directed) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_bool_t c_types;
  igraph_vector_t c_edges;
  igraph_bool_t c_directed;
  SEXP graph;

  SEXP result;
                                        /* Convert input */
  R_SEXP_to_vector_bool(types, &c_types);
  R_SEXP_to_vector(edges, &c_edges);
  c_directed=LOGICAL(directed)[0];
                                        /* Call igraph */
  igraph_create_bipartite(&c_graph, &c_types, &c_edges, c_directed);

                                        /* Convert output */
  IGRAPH_FINALLY(igraph_destroy, &c_graph);
  PROTECT(graph=R_igraph_to_SEXP(&c_graph));
  igraph_destroy(&c_graph);
  IGRAPH_FINALLY_CLEAN(1);
  result=graph;

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_incidence                           /
/-------------------------------------------*/
SEXP R_igraph_incidence(SEXP incidence, SEXP directed, SEXP mode, SEXP multiple) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_bool_t c_types;
  igraph_matrix_t c_incidence;
  igraph_bool_t c_directed;
  igraph_neimode_t c_mode;
  igraph_bool_t c_multiple;
  SEXP graph;
  SEXP types;

  SEXP result, names;
                                        /* Convert input */
  if (0 != igraph_vector_bool_init(&c_types, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_bool_destroy, &c_types);
  R_SEXP_to_matrix(incidence, &c_incidence);
  c_directed=LOGICAL(directed)[0];
  c_mode=(igraph_neimode_t) REAL(mode)[0];
  c_multiple=LOGICAL(multiple)[0];
                                        /* Call igraph */
  igraph_incidence(&c_graph, &c_types, &c_incidence, c_directed, c_mode, c_multiple);

                                        /* Convert output */
  PROTECT(result=NEW_LIST(2));
  PROTECT(names=NEW_CHARACTER(2));
  IGRAPH_FINALLY(igraph_destroy, &c_graph);
  PROTECT(graph=R_igraph_to_SEXP(&c_graph));
  igraph_destroy(&c_graph);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(types=R_igraph_vector_bool_to_SEXP(&c_types));
  igraph_vector_bool_destroy(&c_types);
  IGRAPH_FINALLY_CLEAN(1);
  SET_VECTOR_ELT(result, 0, graph);
  SET_VECTOR_ELT(result, 1, types);
  SET_STRING_ELT(names, 0, CREATE_STRING_VECTOR("graph"));
  SET_STRING_ELT(names, 1, CREATE_STRING_VECTOR("types"));
  SET_NAMES(result, names);
  UNPROTECT(3);

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_get_incidence                       /
/-------------------------------------------*/
SEXP R_igraph_get_incidence(SEXP graph, SEXP types) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_bool_t c_types;
  igraph_matrix_t c_res;
  igraph_vector_t c_row_ids;
  igraph_vector_t c_col_ids;
  SEXP res;
  SEXP row_ids;
  SEXP col_ids;

  SEXP result, names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (!isNull(types)) { R_SEXP_to_vector_bool(types, &c_types); }
  if (0 != igraph_matrix_init(&c_res, 0, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_matrix_destroy, &c_res);
  if (0 != igraph_vector_init(&c_row_ids, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_row_ids);
  row_ids=R_GlobalEnv; /* hack to have a non-NULL value */
  if (0 != igraph_vector_init(&c_col_ids, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_col_ids);
  col_ids=R_GlobalEnv; /* hack to have a non-NULL value */
                                        /* Call igraph */
  igraph_get_incidence(&c_graph, (isNull(types) ? 0 : &c_types), &c_res, (isNull(row_ids) ? 0 : &c_row_ids), (isNull(col_ids) ? 0 : &c_col_ids));

                                        /* Convert output */
  PROTECT(result=NEW_LIST(3));
  PROTECT(names=NEW_CHARACTER(3));
  PROTECT(res=R_igraph_matrix_to_SEXP(&c_res));
  igraph_matrix_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(row_ids=R_igraph_0orvector_to_SEXP(&c_row_ids));
  igraph_vector_destroy(&c_row_ids);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(col_ids=R_igraph_0orvector_to_SEXP(&c_col_ids));
  igraph_vector_destroy(&c_col_ids);
  IGRAPH_FINALLY_CLEAN(1);
  SET_VECTOR_ELT(result, 0, res);
  SET_VECTOR_ELT(result, 1, row_ids);
  SET_VECTOR_ELT(result, 2, col_ids);
  SET_STRING_ELT(names, 0, CREATE_STRING_VECTOR("res"));
  SET_STRING_ELT(names, 1, CREATE_STRING_VECTOR("row_ids"));
  SET_STRING_ELT(names, 2, CREATE_STRING_VECTOR("col_ids"));
  SET_NAMES(result, names);
  UNPROTECT(4);

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_is_bipartite                        /
/-------------------------------------------*/
SEXP R_igraph_is_bipartite(SEXP graph) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_bool_t c_res;
  igraph_vector_bool_t c_type;
  SEXP res;
  SEXP type;

  SEXP result, names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_bool_init(&c_type, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_bool_destroy, &c_type);
  type=R_GlobalEnv; /* hack to have a non-NULL value */
                                        /* Call igraph */
  igraph_is_bipartite(&c_graph, &c_res, (isNull(type) ? 0 : &c_type));

                                        /* Convert output */
  PROTECT(result=NEW_LIST(2));
  PROTECT(names=NEW_CHARACTER(2));
  PROTECT(res=NEW_LOGICAL(1));
  LOGICAL(res)[0]=c_res;
  PROTECT(type=R_igraph_0orvector_bool_to_SEXP(&c_type));
  igraph_vector_bool_destroy(&c_type);
  IGRAPH_FINALLY_CLEAN(1);
  SET_VECTOR_ELT(result, 0, res);
  SET_VECTOR_ELT(result, 1, type);
  SET_STRING_ELT(names, 0, CREATE_STRING_VECTOR("res"));
  SET_STRING_ELT(names, 1, CREATE_STRING_VECTOR("type"));
  SET_NAMES(result, names);
  UNPROTECT(3);

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_bipartite_game_gnp                  /
/-------------------------------------------*/
SEXP R_igraph_bipartite_game_gnp(SEXP n1, SEXP n2, SEXP p, SEXP directed, SEXP mode) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_bool_t c_types;
  igraph_integer_t c_n1;
  igraph_integer_t c_n2;
  igraph_real_t c_p;
  igraph_bool_t c_directed;
  igraph_neimode_t c_mode;
  SEXP graph;
  SEXP types;

  SEXP result, names;
                                        /* Convert input */
  if (0 != igraph_vector_bool_init(&c_types, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_bool_destroy, &c_types);
  types=R_GlobalEnv; /* hack to have a non-NULL value */
  c_n1=INTEGER(n1)[0];
  c_n2=INTEGER(n2)[0];
  c_p=REAL(p)[0];
  c_directed=LOGICAL(directed)[0];
  c_mode=(igraph_neimode_t) REAL(mode)[0];
                                        /* Call igraph */
  igraph_bipartite_game_gnp(&c_graph, (isNull(types) ? 0 : &c_types), c_n1, c_n2, c_p, c_directed, c_mode);

                                        /* Convert output */
  PROTECT(result=NEW_LIST(2));
  PROTECT(names=NEW_CHARACTER(2));
  IGRAPH_FINALLY(igraph_destroy, &c_graph);
  PROTECT(graph=R_igraph_to_SEXP(&c_graph));
  igraph_destroy(&c_graph);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(types=R_igraph_0orvector_bool_to_SEXP(&c_types));
  igraph_vector_bool_destroy(&c_types);
  IGRAPH_FINALLY_CLEAN(1);
  SET_VECTOR_ELT(result, 0, graph);
  SET_VECTOR_ELT(result, 1, types);
  SET_STRING_ELT(names, 0, CREATE_STRING_VECTOR("graph"));
  SET_STRING_ELT(names, 1, CREATE_STRING_VECTOR("types"));
  SET_NAMES(result, names);
  UNPROTECT(3);

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_bipartite_game_gnm                  /
/-------------------------------------------*/
SEXP R_igraph_bipartite_game_gnm(SEXP n1, SEXP n2, SEXP m, SEXP directed, SEXP mode) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_bool_t c_types;
  igraph_integer_t c_n1;
  igraph_integer_t c_n2;
  igraph_integer_t c_m;
  igraph_bool_t c_directed;
  igraph_neimode_t c_mode;
  SEXP graph;
  SEXP types;

  SEXP result, names;
                                        /* Convert input */
  if (0 != igraph_vector_bool_init(&c_types, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_bool_destroy, &c_types);
  types=R_GlobalEnv; /* hack to have a non-NULL value */
  c_n1=INTEGER(n1)[0];
  c_n2=INTEGER(n2)[0];
  c_m=INTEGER(m)[0];
  c_directed=LOGICAL(directed)[0];
  c_mode=(igraph_neimode_t) REAL(mode)[0];
                                        /* Call igraph */
  igraph_bipartite_game_gnm(&c_graph, (isNull(types) ? 0 : &c_types), c_n1, c_n2, c_m, c_directed, c_mode);

                                        /* Convert output */
  PROTECT(result=NEW_LIST(2));
  PROTECT(names=NEW_CHARACTER(2));
  IGRAPH_FINALLY(igraph_destroy, &c_graph);
  PROTECT(graph=R_igraph_to_SEXP(&c_graph));
  igraph_destroy(&c_graph);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(types=R_igraph_0orvector_bool_to_SEXP(&c_types));
  igraph_vector_bool_destroy(&c_types);
  IGRAPH_FINALLY_CLEAN(1);
  SET_VECTOR_ELT(result, 0, graph);
  SET_VECTOR_ELT(result, 1, types);
  SET_STRING_ELT(names, 0, CREATE_STRING_VECTOR("graph"));
  SET_STRING_ELT(names, 1, CREATE_STRING_VECTOR("types"));
  SET_NAMES(result, names);
  UNPROTECT(3);

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_clusters                            /
/-------------------------------------------*/
SEXP R_igraph_clusters(SEXP graph, SEXP mode) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_t c_membership;
  igraph_vector_t c_csize;
  igraph_integer_t c_no;
  igraph_connectedness_t c_mode;
  SEXP membership;
  SEXP csize;
  SEXP no;

  SEXP result, names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_init(&c_membership, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_membership);
  if (0 != igraph_vector_init(&c_csize, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_csize);
  c_mode=REAL(mode)[0];
                                        /* Call igraph */
  igraph_clusters(&c_graph, &c_membership, &c_csize, &c_no, c_mode);

                                        /* Convert output */
  PROTECT(result=NEW_LIST(3));
  PROTECT(names=NEW_CHARACTER(3));
  PROTECT(membership=R_igraph_vector_to_SEXP(&c_membership));
  igraph_vector_destroy(&c_membership);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(csize=R_igraph_vector_to_SEXP(&c_csize));
  igraph_vector_destroy(&c_csize);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(no=NEW_INTEGER(1));
  INTEGER(no)[0]=c_no;
  SET_VECTOR_ELT(result, 0, membership);
  SET_VECTOR_ELT(result, 1, csize);
  SET_VECTOR_ELT(result, 2, no);
  SET_STRING_ELT(names, 0, CREATE_STRING_VECTOR("membership"));
  SET_STRING_ELT(names, 1, CREATE_STRING_VECTOR("csize"));
  SET_STRING_ELT(names, 2, CREATE_STRING_VECTOR("no"));
  SET_NAMES(result, names);
  UNPROTECT(4);

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_articulation_points                 /
/-------------------------------------------*/
SEXP R_igraph_articulation_points(SEXP graph) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_t c_res;
  SEXP res;

  SEXP result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_init(&c_res, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_res);
                                        /* Call igraph */
  igraph_articulation_points(&c_graph, &c_res);

                                        /* Convert output */
  PROTECT(res=R_igraph_vector_to_SEXPp1(&c_res));
  igraph_vector_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  result=res;

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_biconnected_components              /
/-------------------------------------------*/
SEXP R_igraph_biconnected_components(SEXP graph) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_integer_t c_no;
  igraph_vector_ptr_t c_tree_edges;
  igraph_vector_ptr_t c_component_edges;
  igraph_vector_ptr_t c_components;
  igraph_vector_t c_articulation_points;
  SEXP no;
  SEXP tree_edges;
  SEXP component_edges;
  SEXP components;
  SEXP articulation_points;

  SEXP result, names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_ptr_init(&c_tree_edges, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(R_igraph_vectorlist_destroy, &c_tree_edges);
  if (0 != igraph_vector_ptr_init(&c_component_edges, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(R_igraph_vectorlist_destroy, &c_component_edges);
  if (0 != igraph_vector_ptr_init(&c_components, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(R_igraph_vectorlist_destroy, &c_components);
  if (0 != igraph_vector_init(&c_articulation_points, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_articulation_points);
                                        /* Call igraph */
  igraph_biconnected_components(&c_graph, &c_no, &c_tree_edges, &c_component_edges, &c_components, &c_articulation_points);

                                        /* Convert output */
  PROTECT(result=NEW_LIST(5));
  PROTECT(names=NEW_CHARACTER(5));
  PROTECT(no=NEW_INTEGER(1));
  INTEGER(no)[0]=c_no;
  PROTECT(tree_edges=R_igraph_vectorlist_to_SEXP_p1(&c_tree_edges));
  R_igraph_vectorlist_destroy(&c_tree_edges);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(component_edges=R_igraph_vectorlist_to_SEXP_p1(&c_component_edges));
  R_igraph_vectorlist_destroy(&c_component_edges);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(components=R_igraph_vectorlist_to_SEXP_p1(&c_components));
  R_igraph_vectorlist_destroy(&c_components);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(articulation_points=R_igraph_vector_to_SEXPp1(&c_articulation_points));
  igraph_vector_destroy(&c_articulation_points);
  IGRAPH_FINALLY_CLEAN(1);
  SET_VECTOR_ELT(result, 0, no);
  SET_VECTOR_ELT(result, 1, tree_edges);
  SET_VECTOR_ELT(result, 2, component_edges);
  SET_VECTOR_ELT(result, 3, components);
  SET_VECTOR_ELT(result, 4, articulation_points);
  SET_STRING_ELT(names, 0, CREATE_STRING_VECTOR("no"));
  SET_STRING_ELT(names, 1, CREATE_STRING_VECTOR("tree_edges"));
  SET_STRING_ELT(names, 2, CREATE_STRING_VECTOR("component_edges"));
  SET_STRING_ELT(names, 3, CREATE_STRING_VECTOR("components"));
  SET_STRING_ELT(names, 4, CREATE_STRING_VECTOR("articulation_points"));
  SET_NAMES(result, names);
  UNPROTECT(6);

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_layout_star                         /
/-------------------------------------------*/
SEXP R_igraph_layout_star(SEXP graph, SEXP center, SEXP order) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_matrix_t c_res;
  igraph_integer_t c_center;
  igraph_vector_t c_order;
  SEXP res;

  SEXP result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_matrix_init(&c_res, 0, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_matrix_destroy, &c_res);
  c_center=(igraph_integer_t) REAL(center)[0];
  if (!isNull(order)) { R_SEXP_to_vector(order, &c_order); }
                                        /* Call igraph */
  igraph_layout_star(&c_graph, &c_res, c_center, (isNull(order) ? 0 : &c_order));

                                        /* Convert output */
  PROTECT(res=R_igraph_matrix_to_SEXP(&c_res));
  igraph_matrix_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  result=res;

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_layout_grid                         /
/-------------------------------------------*/
SEXP R_igraph_layout_grid(SEXP graph, SEXP width) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_matrix_t c_res;
  igraph_integer_t c_width;
  SEXP res;

  SEXP result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_matrix_init(&c_res, 0, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_matrix_destroy, &c_res);
  c_width=INTEGER(width)[0];
                                        /* Call igraph */
  igraph_layout_grid(&c_graph, &c_res, c_width);

                                        /* Convert output */
  PROTECT(res=R_igraph_matrix_to_SEXP(&c_res));
  igraph_matrix_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  result=res;

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_layout_grid_3d                      /
/-------------------------------------------*/
SEXP R_igraph_layout_grid_3d(SEXP graph, SEXP width, SEXP height) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_matrix_t c_res;
  igraph_integer_t c_width;
  igraph_integer_t c_height;
  SEXP res;

  SEXP result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_matrix_init(&c_res, 0, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_matrix_destroy, &c_res);
  c_width=INTEGER(width)[0];
  c_height=INTEGER(height)[0];
                                        /* Call igraph */
  igraph_layout_grid_3d(&c_graph, &c_res, c_width, c_height);

                                        /* Convert output */
  PROTECT(res=R_igraph_matrix_to_SEXP(&c_res));
  igraph_matrix_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  result=res;

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_layout_drl                          /
/-------------------------------------------*/
SEXP R_igraph_layout_drl(SEXP graph, SEXP res, SEXP use_seed, SEXP options, SEXP weights, SEXP fixed) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_matrix_t c_res;
  igraph_bool_t c_use_seed;
  igraph_layout_drl_options_t c_options;
  igraph_vector_t c_weights;
  igraph_vector_bool_t c_fixed;

  SEXP result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != R_SEXP_to_igraph_matrix_copy(res, &c_res)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_matrix_destroy, &c_res);
  c_use_seed=LOGICAL(use_seed)[0];
  R_SEXP_to_igraph_layout_drl_options(options, &c_options);
  if (!isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
  if (!isNull(fixed)) { R_SEXP_to_vector_bool(fixed, &c_fixed); }
                                        /* Call igraph */
  igraph_layout_drl(&c_graph, &c_res, c_use_seed, &c_options, (isNull(weights) ? 0 : &c_weights), (isNull(fixed) ? 0 : &c_fixed));

                                        /* Convert output */
  PROTECT(res=R_igraph_matrix_to_SEXP(&c_res));
  igraph_matrix_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  result=res;

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_layout_drl_3d                       /
/-------------------------------------------*/
SEXP R_igraph_layout_drl_3d(SEXP graph, SEXP res, SEXP use_seed, SEXP options, SEXP weights, SEXP fixed) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_matrix_t c_res;
  igraph_bool_t c_use_seed;
  igraph_layout_drl_options_t c_options;
  igraph_vector_t c_weights;
  igraph_vector_bool_t c_fixed;

  SEXP result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != R_SEXP_to_igraph_matrix_copy(res, &c_res)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_matrix_destroy, &c_res);
  c_use_seed=LOGICAL(use_seed)[0];
  R_SEXP_to_igraph_layout_drl_options(options, &c_options);
  if (!isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
  if (!isNull(fixed)) { R_SEXP_to_vector_bool(fixed, &c_fixed); }
                                        /* Call igraph */
  igraph_layout_drl_3d(&c_graph, &c_res, c_use_seed, &c_options, (isNull(weights) ? 0 : &c_weights), (isNull(fixed) ? 0 : &c_fixed));

                                        /* Convert output */
  PROTECT(res=R_igraph_matrix_to_SEXP(&c_res));
  igraph_matrix_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  result=res;

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_layout_sugiyama                     /
/-------------------------------------------*/
SEXP R_igraph_layout_sugiyama(SEXP graph, SEXP layers, SEXP hgap, SEXP vgap, SEXP maxiter, SEXP weights) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_matrix_t c_res;
  igraph_t c_extd_graph;
  igraph_vector_t c_extd_to_orig_eids;
  igraph_vector_t c_layers;
  igraph_real_t c_hgap;
  igraph_real_t c_vgap;
  igraph_integer_t c_maxiter;
  igraph_vector_t c_weights;
  SEXP res;
  SEXP extd_graph;
  SEXP extd_to_orig_eids;

  SEXP result, names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_matrix_init(&c_res, 0, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_matrix_destroy, &c_res);
  extd_graph=R_GlobalEnv; /* hack to have a non-NULL value */
  if (0 != igraph_vector_init(&c_extd_to_orig_eids, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_extd_to_orig_eids);
  extd_to_orig_eids=R_GlobalEnv; /* hack to have a non-NULL value */
  if (!isNull(layers)) { R_SEXP_to_vector(layers, &c_layers); }
  c_hgap=REAL(hgap)[0];
  c_vgap=REAL(vgap)[0];
  c_maxiter=INTEGER(maxiter)[0];
  if (!isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
                                        /* Call igraph */
  igraph_layout_sugiyama(&c_graph, &c_res, (isNull(extd_graph) ? 0 : &c_extd_graph), (isNull(extd_to_orig_eids) ? 0 : &c_extd_to_orig_eids), (isNull(layers) ? 0 : &c_layers), c_hgap, c_vgap, c_maxiter, (isNull(weights) ? 0 : &c_weights));

                                        /* Convert output */
  PROTECT(result=NEW_LIST(3));
  PROTECT(names=NEW_CHARACTER(3));
  PROTECT(res=R_igraph_matrix_to_SEXP(&c_res));
  igraph_matrix_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  IGRAPH_FINALLY(igraph_destroy, &c_extd_graph);
  PROTECT(extd_graph=R_igraph_to_SEXP(&c_extd_graph));
  igraph_destroy(&c_extd_graph);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(extd_to_orig_eids=R_igraph_0orvector_to_SEXPp1(&c_extd_to_orig_eids));
  igraph_vector_destroy(&c_extd_to_orig_eids);
  IGRAPH_FINALLY_CLEAN(1);
  SET_VECTOR_ELT(result, 0, res);
  SET_VECTOR_ELT(result, 1, extd_graph);
  SET_VECTOR_ELT(result, 2, extd_to_orig_eids);
  SET_STRING_ELT(names, 0, CREATE_STRING_VECTOR("res"));
  SET_STRING_ELT(names, 1, CREATE_STRING_VECTOR("extd_graph"));
  SET_STRING_ELT(names, 2, CREATE_STRING_VECTOR("extd_to_orig_eids"));
  SET_NAMES(result, names);
  UNPROTECT(4);

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_layout_mds                          /
/-------------------------------------------*/
SEXP R_igraph_layout_mds(SEXP graph, SEXP dist, SEXP dim) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_matrix_t c_res;
  igraph_matrix_t c_dist;
  igraph_integer_t c_dim;

  SEXP res;

  SEXP result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_matrix_init(&c_res, 0, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_matrix_destroy, &c_res);
  if (!isNull(dist)) { R_SEXP_to_matrix(dist, &c_dist); }
  c_dim=INTEGER(dim)[0];
                                        /* Call igraph */
  igraph_layout_mds(&c_graph, &c_res, (isNull(dist) ? 0 : &c_dist), c_dim, 0);

                                        /* Convert output */
  PROTECT(res=R_igraph_matrix_to_SEXP(&c_res));
  igraph_matrix_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  result=res;

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_layout_bipartite                    /
/-------------------------------------------*/
SEXP R_igraph_layout_bipartite(SEXP graph, SEXP types, SEXP hgap, SEXP vgap, SEXP maxiter) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_bool_t c_types;
  igraph_matrix_t c_res;
  igraph_real_t c_hgap;
  igraph_real_t c_vgap;
  igraph_integer_t c_maxiter;
  SEXP res;

  SEXP result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (!isNull(types)) { R_SEXP_to_vector_bool(types, &c_types); }
  if (0 != igraph_matrix_init(&c_res, 0, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_matrix_destroy, &c_res);
  c_hgap=REAL(hgap)[0];
  c_vgap=REAL(vgap)[0];
  c_maxiter=INTEGER(maxiter)[0];
                                        /* Call igraph */
  igraph_layout_bipartite(&c_graph, (isNull(types) ? 0 : &c_types), &c_res, c_hgap, c_vgap, c_maxiter);

                                        /* Convert output */
  PROTECT(res=R_igraph_matrix_to_SEXP(&c_res));
  igraph_matrix_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  result=res;

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_layout_gem                          /
/-------------------------------------------*/
SEXP R_igraph_layout_gem(SEXP graph, SEXP res, SEXP use_seed, SEXP maxiter, SEXP temp_max, SEXP temp_min, SEXP temp_init) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_matrix_t c_res;
  igraph_bool_t c_use_seed;
  igraph_integer_t c_maxiter;
  igraph_real_t c_temp_max;
  igraph_real_t c_temp_min;
  igraph_real_t c_temp_init;

  SEXP result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != R_SEXP_to_igraph_matrix_copy(res, &c_res)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_matrix_destroy, &c_res);
  c_use_seed=LOGICAL(use_seed)[0];
  c_maxiter=INTEGER(maxiter)[0];
  c_temp_max=REAL(temp_max)[0];
  c_temp_min=REAL(temp_min)[0];
  c_temp_init=REAL(temp_init)[0];
                                        /* Call igraph */
  igraph_layout_gem(&c_graph, &c_res, c_use_seed, c_maxiter, c_temp_max, c_temp_min, c_temp_init);

                                        /* Convert output */
  PROTECT(res=R_igraph_matrix_to_SEXP(&c_res));
  igraph_matrix_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  result=res;

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_layout_davidson_harel               /
/-------------------------------------------*/
SEXP R_igraph_layout_davidson_harel(SEXP graph, SEXP res, SEXP use_seed, SEXP maxiter, SEXP fineiter, SEXP cool_fact, SEXP weight_node_dist, SEXP weight_border, SEXP weight_edge_lengths, SEXP weight_edge_crossings, SEXP weight_node_edge_dist) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_matrix_t c_res;
  igraph_bool_t c_use_seed;
  igraph_integer_t c_maxiter;
  igraph_integer_t c_fineiter;
  igraph_real_t c_cool_fact;
  igraph_real_t c_weight_node_dist;
  igraph_real_t c_weight_border;
  igraph_real_t c_weight_edge_lengths;
  igraph_real_t c_weight_edge_crossings;
  igraph_real_t c_weight_node_edge_dist;

  SEXP result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != R_SEXP_to_igraph_matrix_copy(res, &c_res)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_matrix_destroy, &c_res);
  c_use_seed=LOGICAL(use_seed)[0];
  c_maxiter=INTEGER(maxiter)[0];
  c_fineiter=INTEGER(fineiter)[0];
  c_cool_fact=REAL(cool_fact)[0];
  c_weight_node_dist=REAL(weight_node_dist)[0];
  c_weight_border=REAL(weight_border)[0];
  c_weight_edge_lengths=REAL(weight_edge_lengths)[0];
  c_weight_edge_crossings=REAL(weight_edge_crossings)[0];
  c_weight_node_edge_dist=REAL(weight_node_edge_dist)[0];
                                        /* Call igraph */
  igraph_layout_davidson_harel(&c_graph, &c_res, c_use_seed, c_maxiter, c_fineiter, c_cool_fact, c_weight_node_dist, c_weight_border, c_weight_edge_lengths, c_weight_edge_crossings, c_weight_node_edge_dist);

                                        /* Convert output */
  PROTECT(res=R_igraph_matrix_to_SEXP(&c_res));
  igraph_matrix_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  result=res;

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_similarity_jaccard                  /
/-------------------------------------------*/
SEXP R_igraph_similarity_jaccard(SEXP graph, SEXP vids, SEXP mode, SEXP loops) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_matrix_t c_res;
  igraph_vs_t c_vids;
  igraph_neimode_t c_mode;
  igraph_bool_t c_loops;
  SEXP res;

  SEXP result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_matrix_init(&c_res, 0, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_matrix_destroy, &c_res);
  R_SEXP_to_igraph_vs(vids, &c_graph, &c_vids);
  c_mode=(igraph_neimode_t) REAL(mode)[0];
  c_loops=LOGICAL(loops)[0];
                                        /* Call igraph */
  igraph_similarity_jaccard(&c_graph, &c_res, c_vids, c_mode, c_loops);

                                        /* Convert output */
  PROTECT(res=R_igraph_matrix_to_SEXP(&c_res));
  igraph_matrix_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  igraph_vs_destroy(&c_vids);
  result=res;

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_similarity_dice                     /
/-------------------------------------------*/
SEXP R_igraph_similarity_dice(SEXP graph, SEXP vids, SEXP mode, SEXP loops) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_matrix_t c_res;
  igraph_vs_t c_vids;
  igraph_neimode_t c_mode;
  igraph_bool_t c_loops;
  SEXP res;

  SEXP result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_matrix_init(&c_res, 0, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_matrix_destroy, &c_res);
  R_SEXP_to_igraph_vs(vids, &c_graph, &c_vids);
  c_mode=(igraph_neimode_t) REAL(mode)[0];
  c_loops=LOGICAL(loops)[0];
                                        /* Call igraph */
  igraph_similarity_dice(&c_graph, &c_res, c_vids, c_mode, c_loops);

                                        /* Convert output */
  PROTECT(res=R_igraph_matrix_to_SEXP(&c_res));
  igraph_matrix_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  igraph_vs_destroy(&c_vids);
  result=res;

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_similarity_inverse_log_weighted     /
/-------------------------------------------*/
SEXP R_igraph_similarity_inverse_log_weighted(SEXP graph, SEXP vids, SEXP mode) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_matrix_t c_res;
  igraph_vs_t c_vids;
  igraph_neimode_t c_mode;
  SEXP res;

  SEXP result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_matrix_init(&c_res, 0, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_matrix_destroy, &c_res);
  R_SEXP_to_igraph_vs(vids, &c_graph, &c_vids);
  c_mode=(igraph_neimode_t) REAL(mode)[0];
                                        /* Call igraph */
  igraph_similarity_inverse_log_weighted(&c_graph, &c_res, c_vids, c_mode);

                                        /* Convert output */
  PROTECT(res=R_igraph_matrix_to_SEXP(&c_res));
  igraph_matrix_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  igraph_vs_destroy(&c_vids);
  result=res;

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_compare_communities                 /
/-------------------------------------------*/
SEXP R_igraph_compare_communities(SEXP comm1, SEXP comm2, SEXP method) {
                                        /* Declarations */
  igraph_vector_t c_comm1;
  igraph_vector_t c_comm2;
  igraph_real_t c_res;
  igraph_community_comparison_t c_method;
  SEXP res;

  SEXP result;
                                        /* Convert input */
  R_SEXP_to_vector(comm1, &c_comm1);
  R_SEXP_to_vector(comm2, &c_comm2);
  c_method=(igraph_community_comparison_t) REAL(method)[0];
                                        /* Call igraph */
  igraph_compare_communities(&c_comm1, &c_comm2, &c_res, c_method);

                                        /* Convert output */
  PROTECT(res=NEW_NUMERIC(1));
  REAL(res)[0]=c_res;
  result=res;

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_modularity                          /
/-------------------------------------------*/
SEXP R_igraph_modularity(SEXP graph, SEXP membership, SEXP weights) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_t c_membership;
  igraph_real_t c_modularity;
  igraph_vector_t c_weights;
  SEXP modularity;

  SEXP result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  R_SEXP_to_vector(membership, &c_membership);
  if (!isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
                                        /* Call igraph */
  igraph_modularity(&c_graph, &c_membership, &c_modularity, (isNull(weights) ? 0 : &c_weights));

                                        /* Convert output */
  PROTECT(modularity=NEW_NUMERIC(1));
  REAL(modularity)[0]=c_modularity;
  result=modularity;

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_modularity_matrix                   /
/-------------------------------------------*/
SEXP R_igraph_modularity_matrix(SEXP graph, SEXP weights) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_matrix_t c_modmat;
  igraph_vector_t c_weights;
  SEXP modmat;

  SEXP result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_matrix_init(&c_modmat, 0, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_matrix_destroy, &c_modmat);
  if (!isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
                                        /* Call igraph */
  igraph_modularity_matrix(&c_graph, &c_modmat, (isNull(weights) ? 0 : &c_weights));

                                        /* Convert output */
  PROTECT(modmat=R_igraph_matrix_to_SEXP(&c_modmat));
  igraph_matrix_destroy(&c_modmat);
  IGRAPH_FINALLY_CLEAN(1);
  result=modmat;

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_community_fluid_communities         /
/-------------------------------------------*/
SEXP R_igraph_community_fluid_communities(SEXP graph, SEXP no_of_communities) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_integer_t c_no_of_communities;
  igraph_vector_t c_membership;
  igraph_real_t c_modularity;
  SEXP membership;
  SEXP modularity;

  SEXP result, names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  c_no_of_communities=INTEGER(no_of_communities)[0];
  if (0 != igraph_vector_init(&c_membership, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_membership);
                                        /* Call igraph */
  igraph_community_fluid_communities(&c_graph, c_no_of_communities, &c_membership, &c_modularity);

                                        /* Convert output */
  PROTECT(result=NEW_LIST(2));
  PROTECT(names=NEW_CHARACTER(2));
  PROTECT(membership=R_igraph_vector_to_SEXP(&c_membership));
  igraph_vector_destroy(&c_membership);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(modularity=NEW_NUMERIC(1));
  REAL(modularity)[0]=c_modularity;
  SET_VECTOR_ELT(result, 0, membership);
  SET_VECTOR_ELT(result, 1, modularity);
  SET_STRING_ELT(names, 0, CREATE_STRING_VECTOR("membership"));
  SET_STRING_ELT(names, 1, CREATE_STRING_VECTOR("modularity"));
  SET_NAMES(result, names);
  UNPROTECT(3);

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_community_label_propagation         /
/-------------------------------------------*/
SEXP R_igraph_community_label_propagation(SEXP graph, SEXP weights, SEXP initial, SEXP fixed) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_t c_membership;
  igraph_vector_t c_weights;
  igraph_vector_t c_initial;
  igraph_vector_bool_t c_fixed;
  igraph_real_t c_modularity;
  SEXP membership;
  SEXP modularity;

  SEXP result, names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_init(&c_membership, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_membership);
  if (!isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
  if (!isNull(initial)) { R_SEXP_to_vector(initial, &c_initial); }
  if (!isNull(fixed)) { R_SEXP_to_vector_bool(fixed, &c_fixed); }
                                        /* Call igraph */
  igraph_community_label_propagation(&c_graph, &c_membership, (isNull(weights) ? 0 : &c_weights), (isNull(initial) ? 0 : &c_initial), (isNull(fixed) ? 0 : &c_fixed), &c_modularity);

                                        /* Convert output */
  PROTECT(result=NEW_LIST(2));
  PROTECT(names=NEW_CHARACTER(2));
  PROTECT(membership=R_igraph_vector_to_SEXP(&c_membership));
  igraph_vector_destroy(&c_membership);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(modularity=NEW_NUMERIC(1));
  REAL(modularity)[0]=c_modularity;
  SET_VECTOR_ELT(result, 0, membership);
  SET_VECTOR_ELT(result, 1, modularity);
  SET_STRING_ELT(names, 0, CREATE_STRING_VECTOR("membership"));
  SET_STRING_ELT(names, 1, CREATE_STRING_VECTOR("modularity"));
  SET_NAMES(result, names);
  UNPROTECT(3);

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_community_multilevel                /
/-------------------------------------------*/
SEXP R_igraph_community_multilevel(SEXP graph, SEXP weights) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_t c_weights;
  igraph_vector_t c_membership;
  igraph_matrix_t c_memberships;
  igraph_vector_t c_modularity;
  SEXP membership;
  SEXP memberships;
  SEXP modularity;

  SEXP result, names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (!isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
  if (0 != igraph_vector_init(&c_membership, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_membership);
  if (0 != igraph_matrix_init(&c_memberships, 0, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_matrix_destroy, &c_memberships);
  memberships=R_GlobalEnv; /* hack to have a non-NULL value */
  if (0 != igraph_vector_init(&c_modularity, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_modularity);
  modularity=R_GlobalEnv; /* hack to have a non-NULL value */
                                        /* Call igraph */
  igraph_community_multilevel(&c_graph, (isNull(weights) ? 0 : &c_weights), &c_membership, (isNull(memberships) ? 0 : &c_memberships), (isNull(modularity) ? 0 : &c_modularity));

                                        /* Convert output */
  PROTECT(result=NEW_LIST(3));
  PROTECT(names=NEW_CHARACTER(3));
  PROTECT(membership=R_igraph_vector_to_SEXP(&c_membership));
  igraph_vector_destroy(&c_membership);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(memberships=R_igraph_0ormatrix_to_SEXP(&c_memberships));
  igraph_matrix_destroy(&c_memberships);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(modularity=R_igraph_0orvector_to_SEXP(&c_modularity));
  igraph_vector_destroy(&c_modularity);
  IGRAPH_FINALLY_CLEAN(1);
  SET_VECTOR_ELT(result, 0, membership);
  SET_VECTOR_ELT(result, 1, memberships);
  SET_VECTOR_ELT(result, 2, modularity);
  SET_STRING_ELT(names, 0, CREATE_STRING_VECTOR("membership"));
  SET_STRING_ELT(names, 1, CREATE_STRING_VECTOR("memberships"));
  SET_STRING_ELT(names, 2, CREATE_STRING_VECTOR("modularity"));
  SET_NAMES(result, names);
  UNPROTECT(4);

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_community_optimal_modularity        /
/-------------------------------------------*/
SEXP R_igraph_community_optimal_modularity(SEXP graph, SEXP weights) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_real_t c_modularity;
  igraph_vector_t c_membership;
  igraph_vector_t c_weights;
  SEXP modularity;
  SEXP membership;

  SEXP result, names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_init(&c_membership, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_membership);
  membership=R_GlobalEnv; /* hack to have a non-NULL value */
  if (!isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
                                        /* Call igraph */
  igraph_community_optimal_modularity(&c_graph, &c_modularity, (isNull(membership) ? 0 : &c_membership), (isNull(weights) ? 0 : &c_weights));

                                        /* Convert output */
  PROTECT(result=NEW_LIST(2));
  PROTECT(names=NEW_CHARACTER(2));
  PROTECT(modularity=NEW_NUMERIC(1));
  REAL(modularity)[0]=c_modularity;
  PROTECT(membership=R_igraph_0orvector_to_SEXP(&c_membership));
  igraph_vector_destroy(&c_membership);
  IGRAPH_FINALLY_CLEAN(1);
  SET_VECTOR_ELT(result, 0, modularity);
  SET_VECTOR_ELT(result, 1, membership);
  SET_STRING_ELT(names, 0, CREATE_STRING_VECTOR("modularity"));
  SET_STRING_ELT(names, 1, CREATE_STRING_VECTOR("membership"));
  SET_NAMES(result, names);
  UNPROTECT(3);

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_community_leiden                    /
/-------------------------------------------*/
SEXP R_igraph_community_leiden(SEXP graph, SEXP weights, SEXP vertex_weights, SEXP resolution_parameter, SEXP beta, SEXP start, SEXP membership) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_t c_weights;
  igraph_vector_t c_vertex_weights;
  igraph_real_t c_resolution_parameter;
  igraph_real_t c_beta;
  igraph_bool_t c_start;
  igraph_vector_t c_membership;
  igraph_integer_t c_nb_clusters;
  igraph_real_t c_quality;
  SEXP nb_clusters;
  SEXP quality;

  SEXP result, names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (!isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
  if (!isNull(vertex_weights)) { R_SEXP_to_vector(vertex_weights, &c_vertex_weights); }
  c_resolution_parameter=REAL(resolution_parameter)[0];
  c_beta=REAL(beta)[0];
  c_start=LOGICAL(start)[0];
  if (!isNull(membership)) {
  if (0 != R_SEXP_to_vector_copy(membership, &c_membership)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  } else {
  if (0 != igraph_vector_init(&c_membership, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_membership);
  membership=NEW_NUMERIC(0);
                                        /* Call igraph */
  igraph_community_leiden(&c_graph, (isNull(weights) ? 0 : &c_weights), (isNull(vertex_weights) ? 0 : &c_vertex_weights), c_resolution_parameter, c_beta, c_start, (isNull(membership) ? 0 : &c_membership), &c_nb_clusters, &c_quality);

                                        /* Convert output */
  PROTECT(result=NEW_LIST(3));
  PROTECT(names=NEW_CHARACTER(3));
  PROTECT(membership=R_igraph_0orvector_to_SEXP(&c_membership));
  igraph_vector_destroy(&c_membership);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(nb_clusters=NEW_INTEGER(1));
  INTEGER(nb_clusters)[0]=c_nb_clusters;
  PROTECT(quality=NEW_NUMERIC(1));
  REAL(quality)[0]=c_quality;
  SET_VECTOR_ELT(result, 0, membership);
  SET_VECTOR_ELT(result, 1, nb_clusters);
  SET_VECTOR_ELT(result, 2, quality);
  SET_STRING_ELT(names, 0, CREATE_STRING_VECTOR("membership"));
  SET_STRING_ELT(names, 1, CREATE_STRING_VECTOR("nb_clusters"));
  SET_STRING_ELT(names, 2, CREATE_STRING_VECTOR("quality"));
  SET_NAMES(result, names);
  UNPROTECT(4);

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_split_join_distance                 /
/-------------------------------------------*/
SEXP R_igraph_split_join_distance(SEXP comm1, SEXP comm2) {
                                        /* Declarations */
  igraph_vector_t c_comm1;
  igraph_vector_t c_comm2;
  igraph_integer_t c_distance12;
  igraph_integer_t c_distance21;
  SEXP distance12;
  SEXP distance21;

  SEXP result, names;
                                        /* Convert input */
  R_SEXP_to_vector(comm1, &c_comm1);
  R_SEXP_to_vector(comm2, &c_comm2);
                                        /* Call igraph */
  igraph_split_join_distance(&c_comm1, &c_comm2, &c_distance12, &c_distance21);

                                        /* Convert output */
  PROTECT(result=NEW_LIST(2));
  PROTECT(names=NEW_CHARACTER(2));
  PROTECT(distance12=NEW_INTEGER(1));
  INTEGER(distance12)[0]=c_distance12;
  PROTECT(distance21=NEW_INTEGER(1));
  INTEGER(distance21)[0]=c_distance21;
  SET_VECTOR_ELT(result, 0, distance12);
  SET_VECTOR_ELT(result, 1, distance21);
  SET_STRING_ELT(names, 0, CREATE_STRING_VECTOR("distance12"));
  SET_STRING_ELT(names, 1, CREATE_STRING_VECTOR("distance21"));
  SET_NAMES(result, names);
  UNPROTECT(3);

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_hrg_fit                             /
/-------------------------------------------*/
SEXP R_igraph_hrg_fit(SEXP graph, SEXP hrg, SEXP start, SEXP steps) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_hrg_t c_hrg;
  igraph_bool_t c_start;
  int c_steps;

  SEXP result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != R_SEXP_to_hrg_copy(hrg, &c_hrg)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_hrg_destroy, &c_hrg);
  c_start=LOGICAL(start)[0];
  c_steps=INTEGER(steps)[0];
                                        /* Call igraph */
  igraph_hrg_fit(&c_graph, &c_hrg, c_start, c_steps);

                                        /* Convert output */
  PROTECT(hrg=R_igraph_hrg_to_SEXP(&c_hrg));
  igraph_hrg_destroy(&c_hrg);
  IGRAPH_FINALLY_CLEAN(1);
  result=hrg;

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_hrg_game                            /
/-------------------------------------------*/
SEXP R_igraph_hrg_game(SEXP hrg) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_hrg_t c_hrg;
  SEXP graph;

  SEXP result;
                                        /* Convert input */
  R_SEXP_to_hrg(hrg, &c_hrg);
                                        /* Call igraph */
  igraph_hrg_game(&c_graph, &c_hrg);

                                        /* Convert output */
  IGRAPH_FINALLY(igraph_destroy, &c_graph);
  PROTECT(graph=R_igraph_to_SEXP(&c_graph));
  igraph_destroy(&c_graph);
  IGRAPH_FINALLY_CLEAN(1);
  result=graph;

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_hrg_dendrogram                      /
/-------------------------------------------*/
SEXP R_igraph_hrg_dendrogram(SEXP hrg) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_hrg_t c_hrg;
  SEXP graph;

  SEXP result;
                                        /* Convert input */
  R_SEXP_to_hrg(hrg, &c_hrg);
                                        /* Call igraph */
  igraph_hrg_dendrogram(&c_graph, &c_hrg);

                                        /* Convert output */
  IGRAPH_FINALLY(igraph_destroy, &c_graph);
  PROTECT(graph=R_igraph_to_SEXP(&c_graph));
  igraph_destroy(&c_graph);
  IGRAPH_FINALLY_CLEAN(1);
  result=graph;

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_hrg_consensus                       /
/-------------------------------------------*/
SEXP R_igraph_hrg_consensus(SEXP graph, SEXP hrg, SEXP start, SEXP num_samples) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_t c_parents;
  igraph_vector_t c_weights;
  igraph_hrg_t c_hrg;
  igraph_bool_t c_start;
  int c_num_samples;
  SEXP parents;
  SEXP weights;

  SEXP result, names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_init(&c_parents, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_parents);
  if (0 != igraph_vector_init(&c_weights, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_weights);
  if (0 != R_SEXP_to_hrg_copy(hrg, &c_hrg)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_hrg_destroy, &c_hrg);
  c_start=LOGICAL(start)[0];
  c_num_samples=INTEGER(num_samples)[0];
                                        /* Call igraph */
  igraph_hrg_consensus(&c_graph, &c_parents, &c_weights, &c_hrg, c_start, c_num_samples);

                                        /* Convert output */
  PROTECT(result=NEW_LIST(3));
  PROTECT(names=NEW_CHARACTER(3));
  PROTECT(parents=R_igraph_vector_to_SEXP(&c_parents));
  igraph_vector_destroy(&c_parents);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(weights=R_igraph_vector_to_SEXP(&c_weights));
  igraph_vector_destroy(&c_weights);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(hrg=R_igraph_hrg_to_SEXP(&c_hrg));
  igraph_hrg_destroy(&c_hrg);
  IGRAPH_FINALLY_CLEAN(1);
  SET_VECTOR_ELT(result, 0, parents);
  SET_VECTOR_ELT(result, 1, weights);
  SET_VECTOR_ELT(result, 2, hrg);
  SET_STRING_ELT(names, 0, CREATE_STRING_VECTOR("parents"));
  SET_STRING_ELT(names, 1, CREATE_STRING_VECTOR("weights"));
  SET_STRING_ELT(names, 2, CREATE_STRING_VECTOR("hrg"));
  SET_NAMES(result, names);
  UNPROTECT(4);

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_hrg_predict                         /
/-------------------------------------------*/
SEXP R_igraph_hrg_predict(SEXP graph, SEXP hrg, SEXP start, SEXP num_samples, SEXP num_bins) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_t c_edges;
  igraph_vector_t c_prob;
  igraph_hrg_t c_hrg;
  igraph_bool_t c_start;
  int c_num_samples;
  int c_num_bins;
  SEXP edges;
  SEXP prob;

  SEXP result, names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_init(&c_edges, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_edges);
  if (0 != igraph_vector_init(&c_prob, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_prob);
  if (0 != R_SEXP_to_hrg_copy(hrg, &c_hrg)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_hrg_destroy, &c_hrg);
  c_start=LOGICAL(start)[0];
  c_num_samples=INTEGER(num_samples)[0];
  c_num_bins=INTEGER(num_bins)[0];
                                        /* Call igraph */
  igraph_hrg_predict(&c_graph, &c_edges, &c_prob, &c_hrg, c_start, c_num_samples, c_num_bins);

                                        /* Convert output */
  PROTECT(result=NEW_LIST(3));
  PROTECT(names=NEW_CHARACTER(3));
  PROTECT(edges=R_igraph_vector_to_SEXPp1(&c_edges));
  igraph_vector_destroy(&c_edges);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(prob=R_igraph_vector_to_SEXP(&c_prob));
  igraph_vector_destroy(&c_prob);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(hrg=R_igraph_hrg_to_SEXP(&c_hrg));
  igraph_hrg_destroy(&c_hrg);
  IGRAPH_FINALLY_CLEAN(1);
  SET_VECTOR_ELT(result, 0, edges);
  SET_VECTOR_ELT(result, 1, prob);
  SET_VECTOR_ELT(result, 2, hrg);
  SET_STRING_ELT(names, 0, CREATE_STRING_VECTOR("edges"));
  SET_STRING_ELT(names, 1, CREATE_STRING_VECTOR("prob"));
  SET_STRING_ELT(names, 2, CREATE_STRING_VECTOR("hrg"));
  SET_NAMES(result, names);
  UNPROTECT(4);

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_hrg_create                          /
/-------------------------------------------*/
SEXP R_igraph_hrg_create(SEXP graph, SEXP prob) {
                                        /* Declarations */
  igraph_hrg_t c_hrg;
  igraph_t c_graph;
  igraph_vector_t c_prob;
  SEXP hrg;

  SEXP result;
                                        /* Convert input */
  if (0 != igraph_hrg_init(&c_hrg, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_hrg_destroy, &c_hrg);
  R_SEXP_to_igraph(graph, &c_graph);
  R_SEXP_to_vector(prob, &c_prob);
                                        /* Call igraph */
  igraph_hrg_create(&c_hrg, &c_graph, &c_prob);

                                        /* Convert output */
  PROTECT(hrg=R_igraph_hrg_to_SEXP(&c_hrg));
  igraph_hrg_destroy(&c_hrg);
  IGRAPH_FINALLY_CLEAN(1);
  result=hrg;

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_community_infomap                   /
/-------------------------------------------*/
SEXP R_igraph_community_infomap(SEXP graph, SEXP e_weights, SEXP v_weights, SEXP nb_trials) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_t c_e_weights;
  igraph_vector_t c_v_weights;
  int c_nb_trials;
  igraph_vector_t c_membership;
  igraph_real_t c_codelength;
  SEXP membership;
  SEXP codelength;

  SEXP result, names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (!isNull(e_weights)) { R_SEXP_to_vector(e_weights, &c_e_weights); }
  if (!isNull(v_weights)) { R_SEXP_to_vector(v_weights, &c_v_weights); }
  c_nb_trials=INTEGER(nb_trials)[0];
  if (0 != igraph_vector_init(&c_membership, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_membership);
                                        /* Call igraph */
  igraph_community_infomap(&c_graph, (isNull(e_weights) ? 0 : &c_e_weights), (isNull(v_weights) ? 0 : &c_v_weights), c_nb_trials, &c_membership, &c_codelength);

                                        /* Convert output */
  PROTECT(result=NEW_LIST(2));
  PROTECT(names=NEW_CHARACTER(2));
  PROTECT(membership=R_igraph_vector_to_SEXP(&c_membership));
  igraph_vector_destroy(&c_membership);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(codelength=NEW_NUMERIC(1));
  REAL(codelength)[0]=c_codelength;
  SET_VECTOR_ELT(result, 0, membership);
  SET_VECTOR_ELT(result, 1, codelength);
  SET_STRING_ELT(names, 0, CREATE_STRING_VECTOR("membership"));
  SET_STRING_ELT(names, 1, CREATE_STRING_VECTOR("codelength"));
  SET_NAMES(result, names);
  UNPROTECT(3);

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_to_undirected                       /
/-------------------------------------------*/
SEXP R_igraph_to_undirected(SEXP graph, SEXP mode, SEXP edge_attr_comb) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_to_undirected_t c_mode;
  igraph_attribute_combination_t c_edge_attr_comb;

  SEXP result;
                                        /* Convert input */
  R_SEXP_to_igraph_copy(graph, &c_graph);
  IGRAPH_FINALLY(igraph_destroy, &c_graph);
  c_mode=(igraph_to_undirected_t) REAL(mode)[0];
  R_SEXP_to_attr_comb(edge_attr_comb, &c_edge_attr_comb);
                                        /* Call igraph */
  igraph_to_undirected(&c_graph, c_mode, &c_edge_attr_comb);

                                        /* Convert output */
  PROTECT(graph=R_igraph_to_SEXP(&c_graph));
  igraph_destroy(&c_graph);
  IGRAPH_FINALLY_CLEAN(1);
  igraph_attribute_combination_destroy(&c_edge_attr_comb);
  result=graph;

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_get_stochastic                      /
/-------------------------------------------*/
SEXP R_igraph_get_stochastic(SEXP graph, SEXP column_wise) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_matrix_t c_res;
  igraph_bool_t c_column_wise;
  SEXP res;

  SEXP result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_matrix_init(&c_res, 0, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_matrix_destroy, &c_res);
  c_column_wise=LOGICAL(column_wise)[0];
                                        /* Call igraph */
  igraph_get_stochastic(&c_graph, &c_res, c_column_wise);

                                        /* Convert output */
  PROTECT(res=R_igraph_matrix_to_SEXP(&c_res));
  igraph_matrix_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  result=res;

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_get_stochastic_sparsemat            /
/-------------------------------------------*/
SEXP R_igraph_get_stochastic_sparsemat(SEXP graph, SEXP column_wise) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_sparsemat_t c_sparsemat;
  igraph_bool_t c_column_wise;
  SEXP sparsemat;

  SEXP result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  /* Don't need to init. */
  c_column_wise=LOGICAL(column_wise)[0];
                                        /* Call igraph */
  igraph_get_stochastic_sparsemat(&c_graph, &c_sparsemat, c_column_wise);

                                        /* Convert output */
  PROTECT(sparsemat=R_igraph_sparsemat_to_SEXP(&c_sparsemat));
  igraph_sparsemat_destroy(&c_sparsemat);
  result=sparsemat;

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_dyad_census                         /
/-------------------------------------------*/
SEXP R_igraph_dyad_census(SEXP graph) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_integer_t c_mut;
  igraph_integer_t c_asym;
  igraph_integer_t c_null;
  SEXP mut;
  SEXP asym;
  SEXP null;

  SEXP result, names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
                                        /* Call igraph */
  igraph_dyad_census(&c_graph, &c_mut, &c_asym, &c_null);

                                        /* Convert output */
  PROTECT(result=NEW_LIST(3));
  PROTECT(names=NEW_CHARACTER(3));
  PROTECT(mut=NEW_INTEGER(1));
  INTEGER(mut)[0]=c_mut;
  PROTECT(asym=NEW_INTEGER(1));
  INTEGER(asym)[0]=c_asym;
  PROTECT(null=NEW_INTEGER(1));
  INTEGER(null)[0]=c_null;
  SET_VECTOR_ELT(result, 0, mut);
  SET_VECTOR_ELT(result, 1, asym);
  SET_VECTOR_ELT(result, 2, null);
  SET_STRING_ELT(names, 0, CREATE_STRING_VECTOR("mut"));
  SET_STRING_ELT(names, 1, CREATE_STRING_VECTOR("asym"));
  SET_STRING_ELT(names, 2, CREATE_STRING_VECTOR("null"));
  SET_NAMES(result, names);
  UNPROTECT(4);

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_triad_census                        /
/-------------------------------------------*/
SEXP R_igraph_triad_census(SEXP graph) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_t c_res;
  SEXP res;

  SEXP result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_init(&c_res, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_res);
                                        /* Call igraph */
  igraph_triad_census(&c_graph, &c_res);

                                        /* Convert output */
  PROTECT(res=R_igraph_vector_to_SEXP(&c_res));
  igraph_vector_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  result=res;

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_adjacent_triangles                  /
/-------------------------------------------*/
SEXP R_igraph_adjacent_triangles(SEXP graph, SEXP vids) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_t c_res;
  igraph_vs_t c_vids;
  SEXP res;

  SEXP result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_init(&c_res, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_res);
  R_SEXP_to_igraph_vs(vids, &c_graph, &c_vids);
                                        /* Call igraph */
  igraph_adjacent_triangles(&c_graph, &c_res, c_vids);

                                        /* Convert output */
  PROTECT(res=R_igraph_vector_to_SEXP(&c_res));
  igraph_vector_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  igraph_vs_destroy(&c_vids);
  result=res;

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_local_scan_0                        /
/-------------------------------------------*/
SEXP R_igraph_local_scan_0(SEXP graph, SEXP weights, SEXP mode) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_t c_res;
  igraph_vector_t c_weights;
  igraph_neimode_t c_mode;
  SEXP res;

  SEXP result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_init(&c_res, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_res);
  if (!isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
  c_mode=(igraph_neimode_t) REAL(mode)[0];
                                        /* Call igraph */
  igraph_local_scan_0(&c_graph, &c_res, (isNull(weights) ? 0 : &c_weights), c_mode);

                                        /* Convert output */
  PROTECT(res=R_igraph_vector_to_SEXP(&c_res));
  igraph_vector_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  result=res;

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_local_scan_0_them                   /
/-------------------------------------------*/
SEXP R_igraph_local_scan_0_them(SEXP us, SEXP them, SEXP weights_them, SEXP mode) {
                                        /* Declarations */
  igraph_t c_us;
  igraph_t c_them;
  igraph_vector_t c_res;
  igraph_vector_t c_weights_them;
  igraph_neimode_t c_mode;
  SEXP res;

  SEXP result;
                                        /* Convert input */
  R_SEXP_to_igraph(us, &c_us);
  R_SEXP_to_igraph(them, &c_them);
  if (0 != igraph_vector_init(&c_res, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_res);
  if (!isNull(weights_them)) { R_SEXP_to_vector(weights_them, &c_weights_them); }
  c_mode=(igraph_neimode_t) REAL(mode)[0];
                                        /* Call igraph */
  igraph_local_scan_0_them(&c_us, &c_them, &c_res, (isNull(weights_them) ? 0 : &c_weights_them), c_mode);

                                        /* Convert output */
  PROTECT(res=R_igraph_vector_to_SEXP(&c_res));
  igraph_vector_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  result=res;

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_local_scan_1_ecount                 /
/-------------------------------------------*/
SEXP R_igraph_local_scan_1_ecount(SEXP graph, SEXP weights, SEXP mode) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_t c_res;
  igraph_vector_t c_weights;
  igraph_neimode_t c_mode;
  SEXP res;

  SEXP result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_init(&c_res, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_res);
  if (!isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
  c_mode=(igraph_neimode_t) REAL(mode)[0];
                                        /* Call igraph */
  igraph_local_scan_1_ecount(&c_graph, &c_res, (isNull(weights) ? 0 : &c_weights), c_mode);

                                        /* Convert output */
  PROTECT(res=R_igraph_vector_to_SEXP(&c_res));
  igraph_vector_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  result=res;

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_local_scan_1_ecount_them            /
/-------------------------------------------*/
SEXP R_igraph_local_scan_1_ecount_them(SEXP us, SEXP them, SEXP weights_them, SEXP mode) {
                                        /* Declarations */
  igraph_t c_us;
  igraph_t c_them;
  igraph_vector_t c_res;
  igraph_vector_t c_weights_them;
  igraph_neimode_t c_mode;
  SEXP res;

  SEXP result;
                                        /* Convert input */
  R_SEXP_to_igraph(us, &c_us);
  R_SEXP_to_igraph(them, &c_them);
  if (0 != igraph_vector_init(&c_res, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_res);
  if (!isNull(weights_them)) { R_SEXP_to_vector(weights_them, &c_weights_them); }
  c_mode=(igraph_neimode_t) REAL(mode)[0];
                                        /* Call igraph */
  igraph_local_scan_1_ecount_them(&c_us, &c_them, &c_res, (isNull(weights_them) ? 0 : &c_weights_them), c_mode);

                                        /* Convert output */
  PROTECT(res=R_igraph_vector_to_SEXP(&c_res));
  igraph_vector_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  result=res;

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_local_scan_k_ecount                 /
/-------------------------------------------*/
SEXP R_igraph_local_scan_k_ecount(SEXP graph, SEXP k, SEXP weights, SEXP mode) {
                                        /* Declarations */
  igraph_t c_graph;
  int c_k;
  igraph_vector_t c_res;
  igraph_vector_t c_weights;
  igraph_neimode_t c_mode;
  SEXP res;

  SEXP result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  c_k=INTEGER(k)[0];
  if (0 != igraph_vector_init(&c_res, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_res);
  if (!isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
  c_mode=(igraph_neimode_t) REAL(mode)[0];
                                        /* Call igraph */
  igraph_local_scan_k_ecount(&c_graph, c_k, &c_res, (isNull(weights) ? 0 : &c_weights), c_mode);

                                        /* Convert output */
  PROTECT(res=R_igraph_vector_to_SEXP(&c_res));
  igraph_vector_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  result=res;

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_local_scan_k_ecount_them            /
/-------------------------------------------*/
SEXP R_igraph_local_scan_k_ecount_them(SEXP us, SEXP them, SEXP k, SEXP weights_them, SEXP mode) {
                                        /* Declarations */
  igraph_t c_us;
  igraph_t c_them;
  int c_k;
  igraph_vector_t c_res;
  igraph_vector_t c_weights_them;
  igraph_neimode_t c_mode;
  SEXP res;

  SEXP result;
                                        /* Convert input */
  R_SEXP_to_igraph(us, &c_us);
  R_SEXP_to_igraph(them, &c_them);
  c_k=INTEGER(k)[0];
  if (0 != igraph_vector_init(&c_res, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_res);
  if (!isNull(weights_them)) { R_SEXP_to_vector(weights_them, &c_weights_them); }
  c_mode=(igraph_neimode_t) REAL(mode)[0];
                                        /* Call igraph */
  igraph_local_scan_k_ecount_them(&c_us, &c_them, c_k, &c_res, (isNull(weights_them) ? 0 : &c_weights_them), c_mode);

                                        /* Convert output */
  PROTECT(res=R_igraph_vector_to_SEXP(&c_res));
  igraph_vector_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  result=res;

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_local_scan_neighborhood_ecount      /
/-------------------------------------------*/
SEXP R_igraph_local_scan_neighborhood_ecount(SEXP graph, SEXP weights, SEXP neighborhoods) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_t c_res;
  igraph_vector_t c_weights;
  igraph_vector_ptr_t c_neighborhoods;
  SEXP res;

  SEXP result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_init(&c_res, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_res);
  if (!isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
  if (!isNull(neighborhoods)) { R_igraph_SEXP_to_vectorlist_int(neighborhoods, &c_neighborhoods); }
                                        /* Call igraph */
  igraph_local_scan_neighborhood_ecount(&c_graph, &c_res, (isNull(weights) ? 0 : &c_weights), &c_neighborhoods);

                                        /* Convert output */
  PROTECT(res=R_igraph_vector_to_SEXP(&c_res));
  igraph_vector_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  result=res;

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_list_triangles                      /
/-------------------------------------------*/
SEXP R_igraph_list_triangles(SEXP graph) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_int_t c_res;
  SEXP res;

  SEXP result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_int_init(&c_res, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_res);
                                        /* Call igraph */
  igraph_list_triangles(&c_graph, &c_res);

                                        /* Convert output */
  PROTECT(res=R_igraph_vector_int_to_SEXPp1(&c_res));
  igraph_vector_int_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  result=res;

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_maxflow                             /
/-------------------------------------------*/
SEXP R_igraph_maxflow(SEXP graph, SEXP source, SEXP target, SEXP capacity) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_real_t c_value;
  igraph_vector_t c_flow;
  igraph_vector_t c_cut;
  igraph_vector_t c_partition1;
  igraph_vector_t c_partition2;
  igraph_integer_t c_source;
  igraph_integer_t c_target;
  igraph_vector_t c_capacity;
  igraph_maxflow_stats_t c_stats;
  SEXP value;
  SEXP flow;
  SEXP cut;
  SEXP partition1;
  SEXP partition2;
  SEXP stats;

  SEXP result, names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_init(&c_flow, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_flow);
  flow=R_GlobalEnv; /* hack to have a non-NULL value */
  if (0 != igraph_vector_init(&c_cut, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_cut);
  cut=R_GlobalEnv; /* hack to have a non-NULL value */
  if (0 != igraph_vector_init(&c_partition1, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_partition1);
  if (0 != igraph_vector_init(&c_partition2, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_partition2);
  c_source=(igraph_integer_t) REAL(source)[0];
  c_target=(igraph_integer_t) REAL(target)[0];
  if (!isNull(capacity)) { R_SEXP_to_vector(capacity, &c_capacity); }
                                        /* Call igraph */
  igraph_maxflow(&c_graph, &c_value, (isNull(flow) ? 0 : &c_flow), (isNull(cut) ? 0 : &c_cut), &c_partition1, &c_partition2, c_source, c_target, (isNull(capacity) ? 0 : &c_capacity), &c_stats);

                                        /* Convert output */
  PROTECT(result=NEW_LIST(6));
  PROTECT(names=NEW_CHARACTER(6));
  PROTECT(value=NEW_NUMERIC(1));
  REAL(value)[0]=c_value;
  PROTECT(flow=R_igraph_0orvector_to_SEXP(&c_flow));
  igraph_vector_destroy(&c_flow);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(cut=R_igraph_0orvector_to_SEXPp1(&c_cut));
  igraph_vector_destroy(&c_cut);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(partition1=R_igraph_vector_to_SEXPp1(&c_partition1));
  igraph_vector_destroy(&c_partition1);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(partition2=R_igraph_vector_to_SEXPp1(&c_partition2));
  igraph_vector_destroy(&c_partition2);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(stats=R_igraph_maxflow_stats_to_SEXP(&c_stats));
  SET_VECTOR_ELT(result, 0, value);
  SET_VECTOR_ELT(result, 1, flow);
  SET_VECTOR_ELT(result, 2, cut);
  SET_VECTOR_ELT(result, 3, partition1);
  SET_VECTOR_ELT(result, 4, partition2);
  SET_VECTOR_ELT(result, 5, stats);
  SET_STRING_ELT(names, 0, CREATE_STRING_VECTOR("value"));
  SET_STRING_ELT(names, 1, CREATE_STRING_VECTOR("flow"));
  SET_STRING_ELT(names, 2, CREATE_STRING_VECTOR("cut"));
  SET_STRING_ELT(names, 3, CREATE_STRING_VECTOR("partition1"));
  SET_STRING_ELT(names, 4, CREATE_STRING_VECTOR("partition2"));
  SET_STRING_ELT(names, 5, CREATE_STRING_VECTOR("stats"));
  SET_NAMES(result, names);
  UNPROTECT(7);

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_dominator_tree                      /
/-------------------------------------------*/
SEXP R_igraph_dominator_tree(SEXP graph, SEXP root, SEXP mode) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_integer_t c_root;
  igraph_vector_t c_dom;
  igraph_t c_domtree;
  igraph_vector_t c_leftout;
  igraph_neimode_t c_mode;
  SEXP dom;
  SEXP domtree;
  SEXP leftout;

  SEXP result, names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  c_root=(igraph_integer_t) REAL(root)[0];
  if (0 != igraph_vector_init(&c_dom, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_dom);
  domtree=R_GlobalEnv; /* hack to have a non-NULL value */
  if (0 != igraph_vector_init(&c_leftout, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_leftout);
  c_mode=(igraph_neimode_t) REAL(mode)[0];
                                        /* Call igraph */
  igraph_dominator_tree(&c_graph, c_root, &c_dom, (isNull(domtree) ? 0 : &c_domtree), &c_leftout, c_mode);

                                        /* Convert output */
  PROTECT(result=NEW_LIST(3));
  PROTECT(names=NEW_CHARACTER(3));
  PROTECT(dom=R_igraph_vector_to_SEXPp1(&c_dom));
  igraph_vector_destroy(&c_dom);
  IGRAPH_FINALLY_CLEAN(1);
  IGRAPH_FINALLY(igraph_destroy, &c_domtree);
  PROTECT(domtree=R_igraph_to_SEXP(&c_domtree));
  igraph_destroy(&c_domtree);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(leftout=R_igraph_vector_to_SEXPp1(&c_leftout));
  igraph_vector_destroy(&c_leftout);
  IGRAPH_FINALLY_CLEAN(1);
  SET_VECTOR_ELT(result, 0, dom);
  SET_VECTOR_ELT(result, 1, domtree);
  SET_VECTOR_ELT(result, 2, leftout);
  SET_STRING_ELT(names, 0, CREATE_STRING_VECTOR("dom"));
  SET_STRING_ELT(names, 1, CREATE_STRING_VECTOR("domtree"));
  SET_STRING_ELT(names, 2, CREATE_STRING_VECTOR("leftout"));
  SET_NAMES(result, names);
  UNPROTECT(4);

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_all_st_cuts                         /
/-------------------------------------------*/
SEXP R_igraph_all_st_cuts(SEXP graph, SEXP source, SEXP target) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_ptr_t c_cuts;
  igraph_vector_ptr_t c_partition1s;
  igraph_integer_t c_source;
  igraph_integer_t c_target;
  SEXP cuts;
  SEXP partition1s;

  SEXP result, names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_ptr_init(&c_cuts, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(R_igraph_vectorlist_destroy, &c_cuts);
  if (0 != igraph_vector_ptr_init(&c_partition1s, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(R_igraph_vectorlist_destroy, &c_partition1s);
  c_source=(igraph_integer_t) REAL(source)[0];
  c_target=(igraph_integer_t) REAL(target)[0];
                                        /* Call igraph */
  igraph_all_st_cuts(&c_graph, &c_cuts, &c_partition1s, c_source, c_target);

                                        /* Convert output */
  PROTECT(result=NEW_LIST(2));
  PROTECT(names=NEW_CHARACTER(2));
  PROTECT(cuts=R_igraph_vectorlist_to_SEXP_p1(&c_cuts));
  R_igraph_vectorlist_destroy(&c_cuts);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(partition1s=R_igraph_vectorlist_to_SEXP_p1(&c_partition1s));
  R_igraph_vectorlist_destroy(&c_partition1s);
  IGRAPH_FINALLY_CLEAN(1);
  SET_VECTOR_ELT(result, 0, cuts);
  SET_VECTOR_ELT(result, 1, partition1s);
  SET_STRING_ELT(names, 0, CREATE_STRING_VECTOR("cuts"));
  SET_STRING_ELT(names, 1, CREATE_STRING_VECTOR("partition1s"));
  SET_NAMES(result, names);
  UNPROTECT(3);

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_all_st_mincuts                      /
/-------------------------------------------*/
SEXP R_igraph_all_st_mincuts(SEXP graph, SEXP source, SEXP target, SEXP capacity) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_real_t c_value;
  igraph_vector_ptr_t c_cuts;
  igraph_vector_ptr_t c_partition1s;
  igraph_integer_t c_source;
  igraph_integer_t c_target;
  igraph_vector_t c_capacity;
  SEXP value;
  SEXP cuts;
  SEXP partition1s;

  SEXP result, names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_ptr_init(&c_cuts, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(R_igraph_vectorlist_destroy, &c_cuts);
  if (0 != igraph_vector_ptr_init(&c_partition1s, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(R_igraph_vectorlist_destroy, &c_partition1s);
  c_source=(igraph_integer_t) REAL(source)[0];
  c_target=(igraph_integer_t) REAL(target)[0];
  if (!isNull(capacity)) { R_SEXP_to_vector(capacity, &c_capacity); }
                                        /* Call igraph */
  igraph_all_st_mincuts(&c_graph, &c_value, &c_cuts, &c_partition1s, c_source, c_target, (isNull(capacity) ? 0 : &c_capacity));

                                        /* Convert output */
  PROTECT(result=NEW_LIST(3));
  PROTECT(names=NEW_CHARACTER(3));
  PROTECT(value=NEW_NUMERIC(1));
  REAL(value)[0]=c_value;
  PROTECT(cuts=R_igraph_vectorlist_to_SEXP_p1(&c_cuts));
  R_igraph_vectorlist_destroy(&c_cuts);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(partition1s=R_igraph_vectorlist_to_SEXP_p1(&c_partition1s));
  R_igraph_vectorlist_destroy(&c_partition1s);
  IGRAPH_FINALLY_CLEAN(1);
  SET_VECTOR_ELT(result, 0, value);
  SET_VECTOR_ELT(result, 1, cuts);
  SET_VECTOR_ELT(result, 2, partition1s);
  SET_STRING_ELT(names, 0, CREATE_STRING_VECTOR("value"));
  SET_STRING_ELT(names, 1, CREATE_STRING_VECTOR("cuts"));
  SET_STRING_ELT(names, 2, CREATE_STRING_VECTOR("partition1s"));
  SET_NAMES(result, names);
  UNPROTECT(4);

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_is_separator                        /
/-------------------------------------------*/
SEXP R_igraph_is_separator(SEXP graph, SEXP candidate) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vs_t c_candidate;
  igraph_bool_t c_res;
  SEXP res;

  SEXP result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  R_SEXP_to_igraph_vs(candidate, &c_graph, &c_candidate);
                                        /* Call igraph */
  igraph_is_separator(&c_graph, c_candidate, &c_res);

                                        /* Convert output */
  igraph_vs_destroy(&c_candidate);
  PROTECT(res=NEW_LOGICAL(1));
  LOGICAL(res)[0]=c_res;
  result=res;

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_is_minimal_separator                /
/-------------------------------------------*/
SEXP R_igraph_is_minimal_separator(SEXP graph, SEXP candidate) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vs_t c_candidate;
  igraph_bool_t c_res;
  SEXP res;

  SEXP result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  R_SEXP_to_igraph_vs(candidate, &c_graph, &c_candidate);
                                        /* Call igraph */
  igraph_is_minimal_separator(&c_graph, c_candidate, &c_res);

                                        /* Convert output */
  igraph_vs_destroy(&c_candidate);
  PROTECT(res=NEW_LOGICAL(1));
  LOGICAL(res)[0]=c_res;
  result=res;

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_all_minimal_st_separators           /
/-------------------------------------------*/
SEXP R_igraph_all_minimal_st_separators(SEXP graph) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_ptr_t c_separators;
  SEXP separators;

  SEXP result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_ptr_init(&c_separators, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(R_igraph_vectorlist_destroy, &c_separators);
                                        /* Call igraph */
  igraph_all_minimal_st_separators(&c_graph, &c_separators);

                                        /* Convert output */
  PROTECT(separators=R_igraph_vectorlist_to_SEXP_p1(&c_separators));
  R_igraph_vectorlist_destroy(&c_separators);
  IGRAPH_FINALLY_CLEAN(1);
  result=separators;

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_minimum_size_separators             /
/-------------------------------------------*/
SEXP R_igraph_minimum_size_separators(SEXP graph) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_ptr_t c_separators;
  SEXP separators;

  SEXP result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_ptr_init(&c_separators, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(R_igraph_vectorlist_destroy, &c_separators);
                                        /* Call igraph */
  igraph_minimum_size_separators(&c_graph, &c_separators);

                                        /* Convert output */
  PROTECT(separators=R_igraph_vectorlist_to_SEXP_p1(&c_separators));
  R_igraph_vectorlist_destroy(&c_separators);
  IGRAPH_FINALLY_CLEAN(1);
  result=separators;

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_isoclass                            /
/-------------------------------------------*/
SEXP R_igraph_isoclass(SEXP graph) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_integer_t c_isoclass;
  SEXP isoclass;

  SEXP result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
                                        /* Call igraph */
  igraph_isoclass(&c_graph, &c_isoclass);

                                        /* Convert output */
  PROTECT(isoclass=NEW_INTEGER(1));
  INTEGER(isoclass)[0]=c_isoclass;
  result=isoclass;

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_isomorphic                          /
/-------------------------------------------*/
SEXP R_igraph_isomorphic(SEXP graph1, SEXP graph2) {
                                        /* Declarations */
  igraph_t c_graph1;
  igraph_t c_graph2;
  igraph_bool_t c_iso;
  SEXP iso;

  SEXP result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph1, &c_graph1);
  R_SEXP_to_igraph(graph2, &c_graph2);
                                        /* Call igraph */
  igraph_isomorphic(&c_graph1, &c_graph2, &c_iso);

                                        /* Convert output */
  PROTECT(iso=NEW_LOGICAL(1));
  LOGICAL(iso)[0]=c_iso;
  result=iso;

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_isoclass_subgraph                   /
/-------------------------------------------*/
SEXP R_igraph_isoclass_subgraph(SEXP graph, SEXP vids) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_t c_vids;
  igraph_integer_t c_isoclass;
  SEXP isoclass;

  SEXP result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  R_SEXP_to_vector(vids, &c_vids);
                                        /* Call igraph */
  igraph_isoclass_subgraph(&c_graph, &c_vids, &c_isoclass);

                                        /* Convert output */
  PROTECT(isoclass=NEW_INTEGER(1));
  INTEGER(isoclass)[0]=c_isoclass;
  result=isoclass;

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_isoclass_create                     /
/-------------------------------------------*/
SEXP R_igraph_isoclass_create(SEXP size, SEXP number, SEXP directed) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_integer_t c_size;
  igraph_integer_t c_number;
  igraph_bool_t c_directed;
  SEXP graph;

  SEXP result;
                                        /* Convert input */
  c_size=INTEGER(size)[0];
  c_number=INTEGER(number)[0];
  c_directed=LOGICAL(directed)[0];
                                        /* Call igraph */
  igraph_isoclass_create(&c_graph, c_size, c_number, c_directed);

                                        /* Convert output */
  IGRAPH_FINALLY(igraph_destroy, &c_graph);
  PROTECT(graph=R_igraph_to_SEXP(&c_graph));
  igraph_destroy(&c_graph);
  IGRAPH_FINALLY_CLEAN(1);
  result=graph;

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_isomorphic_vf2                      /
/-------------------------------------------*/
SEXP R_igraph_isomorphic_vf2(SEXP graph1, SEXP graph2, SEXP vertex_color1, SEXP vertex_color2, SEXP edge_color1, SEXP edge_color2) {
                                        /* Declarations */
  igraph_t c_graph1;
  igraph_t c_graph2;
  igraph_vector_int_t c_vertex_color1;
  igraph_vector_int_t c_vertex_color2;
  igraph_vector_int_t c_edge_color1;
  igraph_vector_int_t c_edge_color2;
  igraph_bool_t c_iso;
  igraph_vector_t c_map12;
  igraph_vector_t c_map21;



  SEXP iso;
  SEXP map12;
  SEXP map21;

  SEXP result, names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph1, &c_graph1);
  R_SEXP_to_igraph(graph2, &c_graph2);
  if (!isNull(vertex_color1)) { R_SEXP_to_vector_int(vertex_color1, &c_vertex_color1); }
  if (!isNull(vertex_color2)) { R_SEXP_to_vector_int(vertex_color2, &c_vertex_color2); }
  if (!isNull(edge_color1)) { R_SEXP_to_vector_int(edge_color1, &c_edge_color1); }
  if (!isNull(edge_color2)) { R_SEXP_to_vector_int(edge_color2, &c_edge_color2); }
  if (0 != igraph_vector_init(&c_map12, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_map12);
  map12=R_GlobalEnv; /* hack to have a non-NULL value */
  if (0 != igraph_vector_init(&c_map21, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_map21);
  map21=R_GlobalEnv; /* hack to have a non-NULL value */
                                        /* Call igraph */
  igraph_isomorphic_vf2(&c_graph1, &c_graph2, (isNull(vertex_color1) ? 0 : &c_vertex_color1), (isNull(vertex_color2) ? 0 : &c_vertex_color2), (isNull(edge_color1) ? 0 : &c_edge_color1), (isNull(edge_color2) ? 0 : &c_edge_color2), &c_iso, (isNull(map12) ? 0 : &c_map12), (isNull(map21) ? 0 : &c_map21), 0, 0, 0);

                                        /* Convert output */
  PROTECT(result=NEW_LIST(3));
  PROTECT(names=NEW_CHARACTER(3));
  PROTECT(iso=NEW_LOGICAL(1));
  LOGICAL(iso)[0]=c_iso;
  PROTECT(map12=R_igraph_0orvector_to_SEXPp1(&c_map12));
  igraph_vector_destroy(&c_map12);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(map21=R_igraph_0orvector_to_SEXPp1(&c_map21));
  igraph_vector_destroy(&c_map21);
  IGRAPH_FINALLY_CLEAN(1);
  SET_VECTOR_ELT(result, 0, iso);
  SET_VECTOR_ELT(result, 1, map12);
  SET_VECTOR_ELT(result, 2, map21);
  SET_STRING_ELT(names, 0, CREATE_STRING_VECTOR("iso"));
  SET_STRING_ELT(names, 1, CREATE_STRING_VECTOR("map12"));
  SET_STRING_ELT(names, 2, CREATE_STRING_VECTOR("map21"));
  SET_NAMES(result, names);
  UNPROTECT(4);

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_count_isomorphisms_vf2              /
/-------------------------------------------*/
SEXP R_igraph_count_isomorphisms_vf2(SEXP graph1, SEXP graph2, SEXP vertex_color1, SEXP vertex_color2, SEXP edge_color1, SEXP edge_color2) {
                                        /* Declarations */
  igraph_t c_graph1;
  igraph_t c_graph2;
  igraph_vector_int_t c_vertex_color1;
  igraph_vector_int_t c_vertex_color2;
  igraph_vector_int_t c_edge_color1;
  igraph_vector_int_t c_edge_color2;
  igraph_integer_t c_count;



  SEXP count;

  SEXP result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph1, &c_graph1);
  R_SEXP_to_igraph(graph2, &c_graph2);
  if (!isNull(vertex_color1)) { R_SEXP_to_vector_int(vertex_color1, &c_vertex_color1); }
  if (!isNull(vertex_color2)) { R_SEXP_to_vector_int(vertex_color2, &c_vertex_color2); }
  if (!isNull(edge_color1)) { R_SEXP_to_vector_int(edge_color1, &c_edge_color1); }
  if (!isNull(edge_color2)) { R_SEXP_to_vector_int(edge_color2, &c_edge_color2); }
                                        /* Call igraph */
  igraph_count_isomorphisms_vf2(&c_graph1, &c_graph2, (isNull(vertex_color1) ? 0 : &c_vertex_color1), (isNull(vertex_color2) ? 0 : &c_vertex_color2), (isNull(edge_color1) ? 0 : &c_edge_color1), (isNull(edge_color2) ? 0 : &c_edge_color2), &c_count, 0, 0, 0);

                                        /* Convert output */
  PROTECT(count=NEW_INTEGER(1));
  INTEGER(count)[0]=c_count;
  result=count;

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_get_isomorphisms_vf2                /
/-------------------------------------------*/
SEXP R_igraph_get_isomorphisms_vf2(SEXP graph1, SEXP graph2, SEXP vertex_color1, SEXP vertex_color2, SEXP edge_color1, SEXP edge_color2) {
                                        /* Declarations */
  igraph_t c_graph1;
  igraph_t c_graph2;
  igraph_vector_int_t c_vertex_color1;
  igraph_vector_int_t c_vertex_color2;
  igraph_vector_int_t c_edge_color1;
  igraph_vector_int_t c_edge_color2;
  igraph_vector_ptr_t c_maps;



  SEXP maps;

  SEXP result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph1, &c_graph1);
  R_SEXP_to_igraph(graph2, &c_graph2);
  if (!isNull(vertex_color1)) { R_SEXP_to_vector_int(vertex_color1, &c_vertex_color1); }
  if (!isNull(vertex_color2)) { R_SEXP_to_vector_int(vertex_color2, &c_vertex_color2); }
  if (!isNull(edge_color1)) { R_SEXP_to_vector_int(edge_color1, &c_edge_color1); }
  if (!isNull(edge_color2)) { R_SEXP_to_vector_int(edge_color2, &c_edge_color2); }
  if (0 != igraph_vector_ptr_init(&c_maps, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(R_igraph_vectorlist_destroy, &c_maps);
                                        /* Call igraph */
  igraph_get_isomorphisms_vf2(&c_graph1, &c_graph2, (isNull(vertex_color1) ? 0 : &c_vertex_color1), (isNull(vertex_color2) ? 0 : &c_vertex_color2), (isNull(edge_color1) ? 0 : &c_edge_color1), (isNull(edge_color2) ? 0 : &c_edge_color2), &c_maps, 0, 0, 0);

                                        /* Convert output */
  PROTECT(maps=R_igraph_vectorlist_to_SEXP(&c_maps));
  R_igraph_vectorlist_destroy(&c_maps);
  IGRAPH_FINALLY_CLEAN(1);
  result=maps;

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_subisomorphic_vf2                   /
/-------------------------------------------*/
SEXP R_igraph_subisomorphic_vf2(SEXP graph1, SEXP graph2, SEXP vertex_color1, SEXP vertex_color2, SEXP edge_color1, SEXP edge_color2) {
                                        /* Declarations */
  igraph_t c_graph1;
  igraph_t c_graph2;
  igraph_vector_int_t c_vertex_color1;
  igraph_vector_int_t c_vertex_color2;
  igraph_vector_int_t c_edge_color1;
  igraph_vector_int_t c_edge_color2;
  igraph_bool_t c_iso;
  igraph_vector_t c_map12;
  igraph_vector_t c_map21;



  SEXP iso;
  SEXP map12;
  SEXP map21;

  SEXP result, names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph1, &c_graph1);
  R_SEXP_to_igraph(graph2, &c_graph2);
  if (!isNull(vertex_color1)) { R_SEXP_to_vector_int(vertex_color1, &c_vertex_color1); }
  if (!isNull(vertex_color2)) { R_SEXP_to_vector_int(vertex_color2, &c_vertex_color2); }
  if (!isNull(edge_color1)) { R_SEXP_to_vector_int(edge_color1, &c_edge_color1); }
  if (!isNull(edge_color2)) { R_SEXP_to_vector_int(edge_color2, &c_edge_color2); }
  if (0 != igraph_vector_init(&c_map12, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_map12);
  map12=R_GlobalEnv; /* hack to have a non-NULL value */
  if (0 != igraph_vector_init(&c_map21, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_map21);
  map21=R_GlobalEnv; /* hack to have a non-NULL value */
                                        /* Call igraph */
  igraph_subisomorphic_vf2(&c_graph1, &c_graph2, (isNull(vertex_color1) ? 0 : &c_vertex_color1), (isNull(vertex_color2) ? 0 : &c_vertex_color2), (isNull(edge_color1) ? 0 : &c_edge_color1), (isNull(edge_color2) ? 0 : &c_edge_color2), &c_iso, (isNull(map12) ? 0 : &c_map12), (isNull(map21) ? 0 : &c_map21), 0, 0, 0);

                                        /* Convert output */
  PROTECT(result=NEW_LIST(3));
  PROTECT(names=NEW_CHARACTER(3));
  PROTECT(iso=NEW_LOGICAL(1));
  LOGICAL(iso)[0]=c_iso;
  PROTECT(map12=R_igraph_0orvector_to_SEXPp1(&c_map12));
  igraph_vector_destroy(&c_map12);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(map21=R_igraph_0orvector_to_SEXPp1(&c_map21));
  igraph_vector_destroy(&c_map21);
  IGRAPH_FINALLY_CLEAN(1);
  SET_VECTOR_ELT(result, 0, iso);
  SET_VECTOR_ELT(result, 1, map12);
  SET_VECTOR_ELT(result, 2, map21);
  SET_STRING_ELT(names, 0, CREATE_STRING_VECTOR("iso"));
  SET_STRING_ELT(names, 1, CREATE_STRING_VECTOR("map12"));
  SET_STRING_ELT(names, 2, CREATE_STRING_VECTOR("map21"));
  SET_NAMES(result, names);
  UNPROTECT(4);

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_count_subisomorphisms_vf2           /
/-------------------------------------------*/
SEXP R_igraph_count_subisomorphisms_vf2(SEXP graph1, SEXP graph2, SEXP vertex_color1, SEXP vertex_color2, SEXP edge_color1, SEXP edge_color2) {
                                        /* Declarations */
  igraph_t c_graph1;
  igraph_t c_graph2;
  igraph_vector_int_t c_vertex_color1;
  igraph_vector_int_t c_vertex_color2;
  igraph_vector_int_t c_edge_color1;
  igraph_vector_int_t c_edge_color2;
  igraph_integer_t c_count;



  SEXP count;

  SEXP result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph1, &c_graph1);
  R_SEXP_to_igraph(graph2, &c_graph2);
  if (!isNull(vertex_color1)) { R_SEXP_to_vector_int(vertex_color1, &c_vertex_color1); }
  if (!isNull(vertex_color2)) { R_SEXP_to_vector_int(vertex_color2, &c_vertex_color2); }
  if (!isNull(edge_color1)) { R_SEXP_to_vector_int(edge_color1, &c_edge_color1); }
  if (!isNull(edge_color2)) { R_SEXP_to_vector_int(edge_color2, &c_edge_color2); }
                                        /* Call igraph */
  igraph_count_subisomorphisms_vf2(&c_graph1, &c_graph2, (isNull(vertex_color1) ? 0 : &c_vertex_color1), (isNull(vertex_color2) ? 0 : &c_vertex_color2), (isNull(edge_color1) ? 0 : &c_edge_color1), (isNull(edge_color2) ? 0 : &c_edge_color2), &c_count, 0, 0, 0);

                                        /* Convert output */
  PROTECT(count=NEW_INTEGER(1));
  INTEGER(count)[0]=c_count;
  result=count;

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_get_subisomorphisms_vf2             /
/-------------------------------------------*/
SEXP R_igraph_get_subisomorphisms_vf2(SEXP graph1, SEXP graph2, SEXP vertex_color1, SEXP vertex_color2, SEXP edge_color1, SEXP edge_color2) {
                                        /* Declarations */
  igraph_t c_graph1;
  igraph_t c_graph2;
  igraph_vector_int_t c_vertex_color1;
  igraph_vector_int_t c_vertex_color2;
  igraph_vector_int_t c_edge_color1;
  igraph_vector_int_t c_edge_color2;
  igraph_vector_ptr_t c_maps;



  SEXP maps;

  SEXP result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph1, &c_graph1);
  R_SEXP_to_igraph(graph2, &c_graph2);
  if (!isNull(vertex_color1)) { R_SEXP_to_vector_int(vertex_color1, &c_vertex_color1); }
  if (!isNull(vertex_color2)) { R_SEXP_to_vector_int(vertex_color2, &c_vertex_color2); }
  if (!isNull(edge_color1)) { R_SEXP_to_vector_int(edge_color1, &c_edge_color1); }
  if (!isNull(edge_color2)) { R_SEXP_to_vector_int(edge_color2, &c_edge_color2); }
  if (0 != igraph_vector_ptr_init(&c_maps, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(R_igraph_vectorlist_destroy, &c_maps);
                                        /* Call igraph */
  igraph_get_subisomorphisms_vf2(&c_graph1, &c_graph2, (isNull(vertex_color1) ? 0 : &c_vertex_color1), (isNull(vertex_color2) ? 0 : &c_vertex_color2), (isNull(edge_color1) ? 0 : &c_edge_color1), (isNull(edge_color2) ? 0 : &c_edge_color2), &c_maps, 0, 0, 0);

                                        /* Convert output */
  PROTECT(maps=R_igraph_vectorlist_to_SEXP(&c_maps));
  R_igraph_vectorlist_destroy(&c_maps);
  IGRAPH_FINALLY_CLEAN(1);
  result=maps;

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_isomorphic_34                       /
/-------------------------------------------*/
SEXP R_igraph_isomorphic_34(SEXP graph1, SEXP graph2) {
                                        /* Declarations */
  igraph_t c_graph1;
  igraph_t c_graph2;
  igraph_bool_t c_iso;
  SEXP iso;

  SEXP result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph1, &c_graph1);
  R_SEXP_to_igraph(graph2, &c_graph2);
                                        /* Call igraph */
  igraph_isomorphic_34(&c_graph1, &c_graph2, &c_iso);

                                        /* Convert output */
  PROTECT(iso=NEW_LOGICAL(1));
  LOGICAL(iso)[0]=c_iso;
  result=iso;

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_canonical_permutation               /
/-------------------------------------------*/
SEXP R_igraph_canonical_permutation(SEXP graph, SEXP sh) {
                                        /* Declarations */
  igraph_t c_graph;

  igraph_vector_t c_labeling;
  igraph_bliss_sh_t c_sh;
  igraph_bliss_info_t c_info;
  SEXP labeling;
  SEXP info;

  SEXP result, names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_init(&c_labeling, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_labeling);
  c_sh=REAL(sh)[0];
                                        /* Call igraph */
  igraph_canonical_permutation(&c_graph, 0, &c_labeling, c_sh, &c_info);

                                        /* Convert output */
  PROTECT(result=NEW_LIST(2));
  PROTECT(names=NEW_CHARACTER(2));
  PROTECT(labeling=R_igraph_vector_to_SEXPp1(&c_labeling));
  igraph_vector_destroy(&c_labeling);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(info=R_igraph_bliss_info_to_SEXP(&c_info));
  if (c_info.group_size) { free(c_info.group_size); }
  SET_VECTOR_ELT(result, 0, labeling);
  SET_VECTOR_ELT(result, 1, info);
  SET_STRING_ELT(names, 0, CREATE_STRING_VECTOR("labeling"));
  SET_STRING_ELT(names, 1, CREATE_STRING_VECTOR("info"));
  SET_NAMES(result, names);
  UNPROTECT(3);

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_permute_vertices                    /
/-------------------------------------------*/
SEXP R_igraph_permute_vertices(SEXP graph, SEXP permutation) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_t c_res;
  igraph_vector_t c_permutation;
  SEXP res;

  SEXP result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  R_SEXP_to_vector(permutation, &c_permutation);
                                        /* Call igraph */
  igraph_permute_vertices(&c_graph, &c_res, &c_permutation);

                                        /* Convert output */
  IGRAPH_FINALLY(igraph_destroy, &c_res);
  PROTECT(res=R_igraph_to_SEXP(&c_res));
  igraph_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  result=res;

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_isomorphic_bliss                    /
/-------------------------------------------*/
SEXP R_igraph_isomorphic_bliss(SEXP graph1, SEXP graph2, SEXP sh) {
                                        /* Declarations */
  igraph_t c_graph1;
  igraph_t c_graph2;


  igraph_bool_t c_iso;
  igraph_vector_t c_map12;
  igraph_vector_t c_map21;
  igraph_bliss_sh_t c_sh;
  igraph_bliss_info_t c_info1;
  igraph_bliss_info_t c_info2;
  SEXP iso;
  SEXP map12;
  SEXP map21;
  SEXP info1;
  SEXP info2;

  SEXP result, names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph1, &c_graph1);
  R_SEXP_to_igraph(graph2, &c_graph2);
  if (0 != igraph_vector_init(&c_map12, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_map12);
  map12=R_GlobalEnv; /* hack to have a non-NULL value */
  if (0 != igraph_vector_init(&c_map21, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_map21);
  map21=R_GlobalEnv; /* hack to have a non-NULL value */
  c_sh=REAL(sh)[0];
                                        /* Call igraph */
  igraph_isomorphic_bliss(&c_graph1, &c_graph2, 0, 0, &c_iso, (isNull(map12) ? 0 : &c_map12), (isNull(map21) ? 0 : &c_map21), c_sh, &c_info1, &c_info2);

                                        /* Convert output */
  PROTECT(result=NEW_LIST(5));
  PROTECT(names=NEW_CHARACTER(5));
  PROTECT(iso=NEW_LOGICAL(1));
  LOGICAL(iso)[0]=c_iso;
  PROTECT(map12=R_igraph_0orvector_to_SEXPp1(&c_map12));
  igraph_vector_destroy(&c_map12);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(map21=R_igraph_0orvector_to_SEXPp1(&c_map21));
  igraph_vector_destroy(&c_map21);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(info1=R_igraph_bliss_info_to_SEXP(&c_info1));
  if (c_info1.group_size) { free(c_info1.group_size); }
  PROTECT(info2=R_igraph_bliss_info_to_SEXP(&c_info2));
  if (c_info2.group_size) { free(c_info2.group_size); }
  SET_VECTOR_ELT(result, 0, iso);
  SET_VECTOR_ELT(result, 1, map12);
  SET_VECTOR_ELT(result, 2, map21);
  SET_VECTOR_ELT(result, 3, info1);
  SET_VECTOR_ELT(result, 4, info2);
  SET_STRING_ELT(names, 0, CREATE_STRING_VECTOR("iso"));
  SET_STRING_ELT(names, 1, CREATE_STRING_VECTOR("map12"));
  SET_STRING_ELT(names, 2, CREATE_STRING_VECTOR("map21"));
  SET_STRING_ELT(names, 3, CREATE_STRING_VECTOR("info1"));
  SET_STRING_ELT(names, 4, CREATE_STRING_VECTOR("info2"));
  SET_NAMES(result, names);
  UNPROTECT(6);

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_automorphisms                       /
/-------------------------------------------*/
SEXP R_igraph_automorphisms(SEXP graph, SEXP sh) {
                                        /* Declarations */
  igraph_t c_graph;

  igraph_bliss_sh_t c_sh;
  igraph_bliss_info_t c_info;
  SEXP info;

  SEXP result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  c_sh=REAL(sh)[0];
                                        /* Call igraph */
  igraph_automorphisms(&c_graph, 0, c_sh, &c_info);

                                        /* Convert output */
  PROTECT(info=R_igraph_bliss_info_to_SEXP(&c_info));
  if (c_info.group_size) { free(c_info.group_size); }
  result=info;

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_scg_grouping                        /
/-------------------------------------------*/
SEXP R_igraph_scg_grouping(SEXP V, SEXP nt, SEXP nt_vec, SEXP mtype, SEXP algo, SEXP p, SEXP maxiter) {
                                        /* Declarations */
  igraph_matrix_t c_V;
  igraph_vector_t c_groups;
  igraph_integer_t c_nt;
  igraph_vector_t c_nt_vec;
  igraph_scg_matrix_t c_mtype;
  igraph_scg_algorithm_t c_algo;
  igraph_vector_t c_p;
  igraph_integer_t c_maxiter;
  SEXP groups;

  SEXP result;
                                        /* Convert input */
  R_SEXP_to_matrix(V, &c_V);
  if (0 != igraph_vector_init(&c_groups, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_groups);
  c_nt=INTEGER(nt)[0];
  if (!isNull(nt_vec)) { R_SEXP_to_vector(nt_vec, &c_nt_vec); }
  c_mtype=(igraph_scg_matrix_t) REAL(mtype)[0];
  c_algo=(igraph_scg_algorithm_t) REAL(algo)[0];
  if (!isNull(p)) { R_SEXP_to_vector(p, &c_p); }
  c_maxiter=INTEGER(maxiter)[0];
                                        /* Call igraph */
  igraph_scg_grouping(&c_V, &c_groups, c_nt, (isNull(nt_vec) ? 0 : &c_nt_vec), c_mtype, c_algo, (isNull(p) ? 0 : &c_p), c_maxiter);

                                        /* Convert output */
  PROTECT(groups=R_igraph_vector_to_SEXPp1(&c_groups));
  igraph_vector_destroy(&c_groups);
  IGRAPH_FINALLY_CLEAN(1);
  result=groups;

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_scg_norm_eps                        /
/-------------------------------------------*/
SEXP R_igraph_scg_norm_eps(SEXP V, SEXP groups, SEXP mtype, SEXP p, SEXP norm) {
                                        /* Declarations */
  igraph_matrix_t c_V;
  igraph_vector_t c_groups;
  igraph_vector_t c_eps;
  igraph_scg_matrix_t c_mtype;
  igraph_vector_t c_p;
  igraph_scg_norm_t c_norm;
  SEXP eps;

  SEXP result;
                                        /* Convert input */
  R_SEXP_to_matrix(V, &c_V);
  R_SEXP_to_vector(groups, &c_groups);
  if (0 != igraph_vector_init(&c_eps, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_eps);
  c_mtype=(igraph_scg_matrix_t) REAL(mtype)[0];
  if (!isNull(p)) { R_SEXP_to_vector(p, &c_p); }
  c_norm=(igraph_scg_norm_t) REAL(norm)[0];
                                        /* Call igraph */
  igraph_scg_norm_eps(&c_V, &c_groups, &c_eps, c_mtype, (isNull(p) ? 0 : &c_p), c_norm);

                                        /* Convert output */
  PROTECT(eps=R_igraph_vector_to_SEXP(&c_eps));
  igraph_vector_destroy(&c_eps);
  IGRAPH_FINALLY_CLEAN(1);
  result=eps;

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_is_matching                         /
/-------------------------------------------*/
SEXP R_igraph_is_matching(SEXP graph, SEXP types, SEXP matching) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_bool_t c_types;
  igraph_vector_long_t c_matching;
  igraph_bool_t c_res;
  SEXP res;

  SEXP result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (!isNull(types)) { R_SEXP_to_vector_bool(types, &c_types); }
  R_SEXP_to_vector_long_copy(matching, &c_matching);
                                        /* Call igraph */
  igraph_is_matching(&c_graph, (isNull(types) ? 0 : &c_types), &c_matching, &c_res);

                                        /* Convert output */
  igraph_vector_long_destroy(&c_matching);
  PROTECT(res=NEW_LOGICAL(1));
  LOGICAL(res)[0]=c_res;
  result=res;

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_is_maximal_matching                 /
/-------------------------------------------*/
SEXP R_igraph_is_maximal_matching(SEXP graph, SEXP types, SEXP matching) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_bool_t c_types;
  igraph_vector_long_t c_matching;
  igraph_bool_t c_res;
  SEXP res;

  SEXP result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (!isNull(types)) { R_SEXP_to_vector_bool(types, &c_types); }
  R_SEXP_to_vector_long_copy(matching, &c_matching);
                                        /* Call igraph */
  igraph_is_maximal_matching(&c_graph, (isNull(types) ? 0 : &c_types), &c_matching, &c_res);

                                        /* Convert output */
  igraph_vector_long_destroy(&c_matching);
  PROTECT(res=NEW_LOGICAL(1));
  LOGICAL(res)[0]=c_res;
  result=res;

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_maximum_bipartite_matching          /
/-------------------------------------------*/
SEXP R_igraph_maximum_bipartite_matching(SEXP graph, SEXP types, SEXP weights, SEXP eps) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_bool_t c_types;
  igraph_integer_t c_matching_size;
  igraph_real_t c_matching_weight;
  igraph_vector_long_t c_matching;
  igraph_vector_t c_weights;
  igraph_real_t c_eps;
  SEXP matching_size;
  SEXP matching_weight;
  SEXP matching;

  SEXP result, names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (!isNull(types)) { R_SEXP_to_vector_bool(types, &c_types); }
  if (0 != igraph_vector_long_init(&c_matching, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_long_destroy, &c_matching);
  if (!isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
  c_eps=REAL(eps)[0];
                                        /* Call igraph */
  igraph_maximum_bipartite_matching(&c_graph, (isNull(types) ? 0 : &c_types), &c_matching_size, &c_matching_weight, &c_matching, (isNull(weights) ? 0 : &c_weights), c_eps);

                                        /* Convert output */
  PROTECT(result=NEW_LIST(3));
  PROTECT(names=NEW_CHARACTER(3));
  PROTECT(matching_size=NEW_INTEGER(1));
  INTEGER(matching_size)[0]=c_matching_size;
  PROTECT(matching_weight=NEW_NUMERIC(1));
  REAL(matching_weight)[0]=c_matching_weight;
  PROTECT(matching=R_igraph_vector_long_to_SEXPp1(&c_matching));
  igraph_vector_long_destroy(&c_matching);
  IGRAPH_FINALLY_CLEAN(1);
  SET_VECTOR_ELT(result, 0, matching_size);
  SET_VECTOR_ELT(result, 1, matching_weight);
  SET_VECTOR_ELT(result, 2, matching);
  SET_STRING_ELT(names, 0, CREATE_STRING_VECTOR("matching_size"));
  SET_STRING_ELT(names, 1, CREATE_STRING_VECTOR("matching_weight"));
  SET_STRING_ELT(names, 2, CREATE_STRING_VECTOR("matching"));
  SET_NAMES(result, names);
  UNPROTECT(4);

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_eigen_adjacency                     /
/-------------------------------------------*/
SEXP R_igraph_eigen_adjacency(SEXP graph, SEXP algorithm, SEXP which, SEXP options) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_integer_t c_algorithm;
  igraph_eigen_which_t c_which;
  igraph_arpack_options_t c_options;

  igraph_vector_t c_values;
  igraph_matrix_t c_vectors;


  SEXP values;
  SEXP vectors;

  SEXP result, names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  c_algorithm=REAL(algorithm)[0];
  R_SEXP_to_igraph_eigen_which(which, &c_which);
  R_SEXP_to_igraph_arpack_options(options, &c_options);
  if (0 != igraph_vector_init(&c_values, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_values);
  if (0 != igraph_matrix_init(&c_vectors, 0, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_matrix_destroy, &c_vectors);
                                        /* Call igraph */
  igraph_eigen_adjacency(&c_graph, c_algorithm, &c_which, &c_options, 0, &c_values, &c_vectors, 0, 0);

                                        /* Convert output */
  PROTECT(result=NEW_LIST(3));
  PROTECT(names=NEW_CHARACTER(3));
  PROTECT(options=R_igraph_arpack_options_to_SEXP(&c_options));
  PROTECT(values=R_igraph_vector_to_SEXP(&c_values));
  igraph_vector_destroy(&c_values);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(vectors=R_igraph_matrix_to_SEXP(&c_vectors));
  igraph_matrix_destroy(&c_vectors);
  IGRAPH_FINALLY_CLEAN(1);
  SET_VECTOR_ELT(result, 0, options);
  SET_VECTOR_ELT(result, 1, values);
  SET_VECTOR_ELT(result, 2, vectors);
  SET_STRING_ELT(names, 0, CREATE_STRING_VECTOR("options"));
  SET_STRING_ELT(names, 1, CREATE_STRING_VECTOR("values"));
  SET_STRING_ELT(names, 2, CREATE_STRING_VECTOR("vectors"));
  SET_NAMES(result, names);
  UNPROTECT(4);

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_power_law_fit                       /
/-------------------------------------------*/
SEXP R_igraph_power_law_fit(SEXP data, SEXP xmin, SEXP force_continuous) {
                                        /* Declarations */
  igraph_vector_t c_data;
  igraph_plfit_result_t c_res;
  igraph_real_t c_xmin;
  igraph_bool_t c_force_continuous;
  SEXP res;

  SEXP result;
                                        /* Convert input */
  R_SEXP_to_vector(data, &c_data);
  c_xmin=REAL(xmin)[0];
  c_force_continuous=LOGICAL(force_continuous)[0];
                                        /* Call igraph */
  igraph_power_law_fit(&c_data, &c_res, c_xmin, c_force_continuous);

                                        /* Convert output */
  PROTECT(res=R_igraph_plfit_result_to_SEXP(&c_res));
  result=res;

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_sir                                 /
/-------------------------------------------*/
SEXP R_igraph_sir(SEXP graph, SEXP beta, SEXP gamma, SEXP no_sim) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_real_t c_beta;
  igraph_real_t c_gamma;
  igraph_integer_t c_no_sim;
  igraph_vector_ptr_t c_res;
  SEXP res;

  SEXP result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  c_beta=REAL(beta)[0];
  c_gamma=REAL(gamma)[0];
  c_no_sim=INTEGER(no_sim)[0];
  if (0 != igraph_vector_ptr_init(&c_res, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(R_igraph_sirlist_destroy, &c_res);
                                        /* Call igraph */
  igraph_sir(&c_graph, c_beta, c_gamma, c_no_sim, &c_res);

                                        /* Convert output */
  PROTECT(res=R_igraph_sirlist_to_SEXP(&c_res));
  R_igraph_sirlist_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  result=res;

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_convex_hull                         /
/-------------------------------------------*/
SEXP R_igraph_convex_hull(SEXP data) {
                                        /* Declarations */
  igraph_matrix_t c_data;
  igraph_vector_t c_resverts;
  igraph_matrix_t c_rescoords;
  SEXP resverts;
  SEXP rescoords;

  SEXP result, names;
                                        /* Convert input */
  R_SEXP_to_matrix(data, &c_data);
  if (0 != igraph_vector_init(&c_resverts, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_resverts);
  if (0 != igraph_matrix_init(&c_rescoords, 0, 0)) {
  igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_matrix_destroy, &c_rescoords);
                                        /* Call igraph */
  igraph_convex_hull(&c_data, &c_resverts, &c_rescoords);

                                        /* Convert output */
  PROTECT(result=NEW_LIST(2));
  PROTECT(names=NEW_CHARACTER(2));
  PROTECT(resverts=R_igraph_vector_to_SEXP(&c_resverts));
  igraph_vector_destroy(&c_resverts);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(rescoords=R_igraph_matrix_to_SEXP(&c_rescoords));
  igraph_matrix_destroy(&c_rescoords);
  IGRAPH_FINALLY_CLEAN(1);
  SET_VECTOR_ELT(result, 0, resverts);
  SET_VECTOR_ELT(result, 1, rescoords);
  SET_STRING_ELT(names, 0, CREATE_STRING_VECTOR("resverts"));
  SET_STRING_ELT(names, 1, CREATE_STRING_VECTOR("rescoords"));
  SET_NAMES(result, names);
  UNPROTECT(3);

  UNPROTECT(1);
  return(result);
}

/*-------------------------------------------/
/ igraph_dim_select                          /
/-------------------------------------------*/
SEXP R_igraph_dim_select(SEXP sv) {
                                        /* Declarations */
  igraph_vector_t c_sv;
  igraph_integer_t c_dim;
  SEXP dim;

  SEXP result;
                                        /* Convert input */
  R_SEXP_to_vector(sv, &c_sv);
                                        /* Call igraph */
  igraph_dim_select(&c_sv, &c_dim);

                                        /* Convert output */
  PROTECT(dim=NEW_INTEGER(1));
  INTEGER(dim)[0]=c_dim;
  result=dim;

  UNPROTECT(1);
  return(result);
}
