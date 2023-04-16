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
#include "igraph_neighborhood.h"

#include "config.h"

// Require R_ and Rf_ prefixes for R API
#define R_NO_REMAP

#include <R.h>
#include <Rinternals.h>
#include <Rdefines.h>
#include <R_ext/Visibility.h>

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

SEXP R_igraph_vector_to_SEXP(const igraph_vector_t *v);
SEXP R_igraph_vector_int_to_SEXP(const igraph_vector_int_t *v);
SEXP R_igraph_vector_int_to_SEXPp1(const igraph_vector_int_t *v);
SEXP R_igraph_vector_bool_to_SEXP(const igraph_vector_bool_t *v);
SEXP R_igraph_vector_complex_to_SEXP(const igraph_vector_complex_t* v);
SEXP R_igraph_0orvector_to_SEXP(const igraph_vector_t *v);
SEXP R_igraph_0orvector_int_to_SEXP(const igraph_vector_int_t *v);
SEXP R_igraph_0orvector_bool_to_SEXP(const igraph_vector_bool_t *v);
SEXP R_igraph_0orvector_complex_to_SEXP(const igraph_vector_complex_t *v);
SEXP R_igraph_matrix_to_SEXP(const igraph_matrix_t *m);
SEXP R_igraph_matrix_int_to_SEXP(const igraph_matrix_int_t *m);
SEXP R_igraph_matrix_complex_to_SEXP(const igraph_matrix_complex_t *m);
SEXP R_igraph_0ormatrix_complex_to_SEXP(const igraph_matrix_complex_t *m);
SEXP R_igraph_strvector_to_SEXP(const igraph_strvector_t *m);
SEXP R_igraph_to_SEXP(const igraph_t *graph);
SEXP R_igraph_vectorlist_to_SEXP(const igraph_vector_ptr_t *ptr);
SEXP R_igraph_vectorlist_int_to_SEXP(const igraph_vector_int_list_t *list);
SEXP R_igraph_0orvectorlist_to_SEXP(const igraph_vector_ptr_t *ptr);
void R_igraph_vectorlist_destroy(igraph_vector_ptr_t *ptr);
SEXP R_igraph_matrixlist_to_SEXP(const igraph_vector_ptr_t *ptr);
void R_igraph_matrixlist_destroy(igraph_vector_ptr_t *ptr);
SEXP R_igraph_graphlist_to_SEXP(const igraph_graph_list_t *list);
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
int R_SEXP_to_matrix_int(SEXP pakl, igraph_matrix_int_t *akl);
int R_SEXP_to_matrix_complex(SEXP pakl, igraph_matrix_complex_t *akl);
int R_SEXP_to_igraph_matrix_copy(SEXP pakl, igraph_matrix_t *akl);
int R_SEXP_to_igraph(SEXP graph, igraph_t *res);
int R_SEXP_to_igraph_copy(SEXP graph, igraph_t *res);
int R_SEXP_to_igraph_vs(SEXP rit, igraph_t *graph, igraph_vs_t *it);
int R_SEXP_to_igraph_es(SEXP rit, igraph_t *graph, igraph_es_t *it);
int R_SEXP_to_igraph_adjlist(SEXP vectorlist, igraph_adjlist_t *ptr);
int R_igraph_SEXP_to_0orvectorlist(SEXP vectorlist,
                                   igraph_vector_ptr_t *ptr);
int R_igraph_SEXP_to_vectorlist(SEXP vectorlist, igraph_vector_list_t *list);
int R_igraph_SEXP_to_vector_int_list(SEXP vectorlist,
                                    igraph_vector_int_list_t *list);
int R_igraph_SEXP_to_matrixlist(SEXP matrixlist, igraph_matrix_list_t *list);
int R_SEXP_to_vector_bool(SEXP sv, igraph_vector_bool_t *v);
int R_SEXP_to_vector_bool_copy(SEXP sv, igraph_vector_bool_t *v);
int R_SEXP_to_vector_int(SEXP sv, igraph_vector_int_t *v);
int R_SEXP_to_hrg(SEXP shrg, igraph_hrg_t *hrg);
int R_SEXP_to_hrg_copy(SEXP shrg, igraph_hrg_t *hrg);
int R_SEXP_to_sparsemat(SEXP pakl, igraph_sparsemat_t *akl);

int R_SEXP_to_igraph_layout_drl_options(SEXP in, igraph_layout_drl_options_t *opt);
int R_SEXP_to_attr_comb(SEXP input, igraph_attribute_combination_t *comb);
SEXP R_igraph_bliss_info_to_SEXP(const igraph_bliss_info_t *info);
int R_SEXP_to_igraph_eigen_which(SEXP in, igraph_eigen_which_t *out);
int R_SEXP_to_igraph_arpack_options(SEXP in, igraph_arpack_options_t *opt);
SEXP R_igraph_vectorlist_to_SEXP_p1(const igraph_vector_ptr_t *ptr);
SEXP R_igraph_0orvector_int_to_SEXPp1(const igraph_vector_int_t *v);
SEXP R_igraph_0ormatrix_int_to_SEXP(const igraph_matrix_t *m);
SEXP R_igraph_vector_to_SEXPp1(const igraph_vector_t *v);
SEXP R_igraph_vector_int_to_SEXPp1(const igraph_vector_int_t *v);
SEXP R_igraph_arpack_options_to_SEXP(const igraph_arpack_options_t *opt);

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

  SEXP r_result;
                                        /* Convert input */
  c_n=INTEGER(n)[0];
  c_directed=LOGICAL(directed)[0];
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_empty(&c_graph, c_n, c_directed));

                                        /* Convert output */
  IGRAPH_FINALLY(igraph_destroy, &c_graph);
  PROTECT(graph=R_igraph_to_SEXP(&c_graph));
  igraph_destroy(&c_graph);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = graph;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_copy                                /
/-------------------------------------------*/
SEXP R_igraph_copy(SEXP from) {
                                        /* Declarations */
  igraph_t c_to;
  igraph_t c_from;
  SEXP to;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(from, &c_from);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_copy(&c_to, &c_from));

                                        /* Convert output */
  IGRAPH_FINALLY(igraph_destroy, &c_to);
  PROTECT(to=R_igraph_to_SEXP(&c_to));
  igraph_destroy(&c_to);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = to;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_delete_vertices_idx                 /
/-------------------------------------------*/
SEXP R_igraph_delete_vertices_idx(SEXP graph, SEXP vertices) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vs_t c_vertices;
  igraph_vector_int_t c_idx;
  igraph_vector_int_t c_invidx;
  SEXP idx;
  SEXP invidx;

  SEXP r_result, r_names;
                                        /* Convert input */
  R_SEXP_to_igraph_copy(graph, &c_graph);
  IGRAPH_FINALLY(igraph_destroy, &c_graph);
  if (0 != igraph_vector_int_init(&c_idx, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_idx);
  if (0 != igraph_vector_int_init(&c_invidx, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_invidx);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_delete_vertices_idx(&c_graph, c_vertices, &c_idx, &c_invidx));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(3));
  PROTECT(r_names=NEW_CHARACTER(3));
  PROTECT(graph=R_igraph_to_SEXP(&c_graph));
  igraph_destroy(&c_graph);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(idx=R_igraph_vector_int_to_SEXP(&c_idx));
  igraph_vector_int_destroy(&c_idx);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(invidx=R_igraph_vector_int_to_SEXP(&c_invidx));
  igraph_vector_int_destroy(&c_invidx);
  IGRAPH_FINALLY_CLEAN(1);
  SET_VECTOR_ELT(r_result, 0, graph);
  SET_VECTOR_ELT(r_result, 1, idx);
  SET_VECTOR_ELT(r_result, 2, invidx);
  SET_STRING_ELT(r_names, 0, Rf_mkChar("graph"));
  SET_STRING_ELT(r_names, 1, Rf_mkChar("idx"));
  SET_STRING_ELT(r_names, 2, Rf_mkChar("invidx"));
  SET_NAMES(r_result, r_names);
  UNPROTECT(4);

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_vcount                              /
/-------------------------------------------*/
SEXP R_igraph_vcount(SEXP graph) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_integer_t c_result;
  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
                                        /* Call igraph */
  c_result=igraph_vcount(&c_graph);

                                        /* Convert output */

  PROTECT(r_result=NEW_INTEGER(1));
  INTEGER(r_result)[0]=c_result;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_empty_attrs                         /
/-------------------------------------------*/
SEXP R_igraph_empty_attrs(SEXP n, SEXP directed) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_integer_t c_n;
  igraph_bool_t c_directed;

  SEXP graph;

  SEXP r_result;
                                        /* Convert input */
  c_n=INTEGER(n)[0];
  c_directed=LOGICAL(directed)[0];
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_empty_attrs(&c_graph, c_n, c_directed, 0));

                                        /* Convert output */
  IGRAPH_FINALLY(igraph_destroy, &c_graph);
  PROTECT(graph=R_igraph_to_SEXP(&c_graph));
  igraph_destroy(&c_graph);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = graph;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_get_all_eids_between                /
/-------------------------------------------*/
SEXP R_igraph_get_all_eids_between(SEXP graph, SEXP from, SEXP to, SEXP directed) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_int_t c_eids;
  igraph_integer_t c_from;
  igraph_integer_t c_to;
  igraph_bool_t c_directed;
  SEXP eids;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_int_init(&c_eids, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_eids);
  c_from = (igraph_integer_t) REAL(from)[0];
  c_to = (igraph_integer_t) REAL(to)[0];
  c_directed=LOGICAL(directed)[0];
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_get_all_eids_between(&c_graph, &c_eids, c_from, c_to, c_directed));

                                        /* Convert output */
  PROTECT(eids=R_igraph_vector_int_to_SEXP(&c_eids));
  igraph_vector_int_destroy(&c_eids);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = eids;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_sparse_adjacency                    /
/-------------------------------------------*/
SEXP R_igraph_sparse_adjacency(SEXP adjmatrix, SEXP mode, SEXP loops) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_sparsemat_t c_adjmatrix;
  igraph_adjacency_t c_mode;
  igraph_loops_t c_loops;
  SEXP graph;

  SEXP r_result, r_names;
                                        /* Convert input */
  R_SEXP_to_sparsemat(adjmatrix, &c_adjmatrix);
  c_mode = (igraph_adjacency_t) Rf_asInteger(mode);
  c_loops = (igraph_loops_t) Rf_asInteger(loops);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_sparse_adjacency(&c_graph, &c_adjmatrix, c_mode, c_loops));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(2));
  PROTECT(r_names=NEW_CHARACTER(2));
  IGRAPH_FINALLY(igraph_destroy, &c_graph);
  PROTECT(graph=R_igraph_to_SEXP(&c_graph));
  igraph_destroy(&c_graph);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(adjmatrix=R_igraph_sparsemat_to_SEXP(&c_adjmatrix));
  igraph_sparsemat_destroy(&c_adjmatrix);
  IGRAPH_FINALLY_CLEAN(1);
  SET_VECTOR_ELT(r_result, 0, graph);
  SET_VECTOR_ELT(r_result, 1, adjmatrix);
  SET_STRING_ELT(r_names, 0, Rf_mkChar("graph"));
  SET_STRING_ELT(r_names, 1, Rf_mkChar("adjmatrix"));
  SET_NAMES(r_result, r_names);
  UNPROTECT(3);

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_sparse_weighted_adjacency           /
/-------------------------------------------*/
SEXP R_igraph_sparse_weighted_adjacency(SEXP adjmatrix, SEXP mode, SEXP loops) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_sparsemat_t c_adjmatrix;
  igraph_adjacency_t c_mode;
  igraph_vector_t c_weights;
  igraph_loops_t c_loops;
  SEXP graph;
  SEXP weights;

  SEXP r_result, r_names;
                                        /* Convert input */
  R_SEXP_to_sparsemat(adjmatrix, &c_adjmatrix);
  c_mode = (igraph_adjacency_t) Rf_asInteger(mode);
  if (0 != igraph_vector_init(&c_weights, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_weights);
  weights=R_GlobalEnv; /* hack to have a non-NULL value */
  c_loops = (igraph_loops_t) Rf_asInteger(loops);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_sparse_weighted_adjacency(&c_graph, &c_adjmatrix, c_mode, (Rf_isNull(weights) ? 0 : &c_weights), c_loops));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(3));
  PROTECT(r_names=NEW_CHARACTER(3));
  IGRAPH_FINALLY(igraph_destroy, &c_graph);
  PROTECT(graph=R_igraph_to_SEXP(&c_graph));
  igraph_destroy(&c_graph);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(adjmatrix=R_igraph_sparsemat_to_SEXP(&c_adjmatrix));
  igraph_sparsemat_destroy(&c_adjmatrix);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(weights=R_igraph_0orvector_to_SEXP(&c_weights));
  igraph_vector_destroy(&c_weights);
  IGRAPH_FINALLY_CLEAN(1);
  SET_VECTOR_ELT(r_result, 0, graph);
  SET_VECTOR_ELT(r_result, 1, adjmatrix);
  SET_VECTOR_ELT(r_result, 2, weights);
  SET_STRING_ELT(r_names, 0, Rf_mkChar("graph"));
  SET_STRING_ELT(r_names, 1, Rf_mkChar("adjmatrix"));
  SET_STRING_ELT(r_names, 2, Rf_mkChar("weights"));
  SET_NAMES(r_result, r_names);
  UNPROTECT(4);

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_wheel                               /
/-------------------------------------------*/
SEXP R_igraph_wheel(SEXP n, SEXP mode, SEXP center) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_integer_t c_n;
  igraph_wheel_mode_t c_mode;
  igraph_integer_t c_center;
  SEXP graph;

  SEXP r_result;
                                        /* Convert input */
  c_n=INTEGER(n)[0];
  c_mode = (igraph_wheel_mode_t) Rf_asInteger(mode);
  c_center=INTEGER(center)[0];
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_wheel(&c_graph, c_n, c_mode, c_center));

                                        /* Convert output */
  IGRAPH_FINALLY(igraph_destroy, &c_graph);
  PROTECT(graph=R_igraph_to_SEXP(&c_graph));
  igraph_destroy(&c_graph);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = graph;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_square_lattice                      /
/-------------------------------------------*/
SEXP R_igraph_square_lattice(SEXP dimvector, SEXP nei, SEXP directed, SEXP mutual, SEXP periodic) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_int_t c_dimvector;
  igraph_integer_t c_nei;
  igraph_bool_t c_directed;
  igraph_bool_t c_mutual;
  igraph_vector_bool_t c_periodic;
  SEXP graph;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_vector_int(dimvector, &c_dimvector);
  c_nei=INTEGER(nei)[0];
  c_directed=LOGICAL(directed)[0];
  c_mutual=LOGICAL(mutual)[0];
  R_SEXP_to_vector_bool(periodic, &c_periodic);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_square_lattice(&c_graph, &c_dimvector, c_nei, c_directed, c_mutual, &c_periodic));

                                        /* Convert output */
  IGRAPH_FINALLY(igraph_destroy, &c_graph);
  PROTECT(graph=R_igraph_to_SEXP(&c_graph));
  igraph_destroy(&c_graph);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = graph;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_triangular_lattice                  /
/-------------------------------------------*/
SEXP R_igraph_triangular_lattice(SEXP dimvector, SEXP directed, SEXP mutual) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_int_t c_dimvector;
  igraph_bool_t c_directed;
  igraph_bool_t c_mutual;
  SEXP graph;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_vector_int(dimvector, &c_dimvector);
  c_directed=LOGICAL(directed)[0];
  c_mutual=LOGICAL(mutual)[0];
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_triangular_lattice(&c_graph, &c_dimvector, c_directed, c_mutual));

                                        /* Convert output */
  IGRAPH_FINALLY(igraph_destroy, &c_graph);
  PROTECT(graph=R_igraph_to_SEXP(&c_graph));
  igraph_destroy(&c_graph);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = graph;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_kary_tree                           /
/-------------------------------------------*/
SEXP R_igraph_kary_tree(SEXP n, SEXP children, SEXP type) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_integer_t c_n;
  igraph_integer_t c_children;
  igraph_tree_mode_t c_type;
  SEXP graph;

  SEXP r_result;
                                        /* Convert input */
  c_n=INTEGER(n)[0];
  c_children=INTEGER(children)[0];
  c_type = (igraph_tree_mode_t) Rf_asInteger(type);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_kary_tree(&c_graph, c_n, c_children, c_type));

                                        /* Convert output */
  IGRAPH_FINALLY(igraph_destroy, &c_graph);
  PROTECT(graph=R_igraph_to_SEXP(&c_graph));
  igraph_destroy(&c_graph);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = graph;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_symmetric_tree                      /
/-------------------------------------------*/
SEXP R_igraph_symmetric_tree(SEXP branches, SEXP type) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_int_t c_branches;
  igraph_tree_mode_t c_type;
  SEXP graph;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_vector_int(branches, &c_branches);
  c_type = (igraph_tree_mode_t) Rf_asInteger(type);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_symmetric_tree(&c_graph, &c_branches, c_type));

                                        /* Convert output */
  IGRAPH_FINALLY(igraph_destroy, &c_graph);
  PROTECT(graph=R_igraph_to_SEXP(&c_graph));
  igraph_destroy(&c_graph);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = graph;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_regular_tree                        /
/-------------------------------------------*/
SEXP R_igraph_regular_tree(SEXP h, SEXP k, SEXP type) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_integer_t c_h;
  igraph_integer_t c_k;
  igraph_tree_mode_t c_type;
  SEXP graph;

  SEXP r_result;
                                        /* Convert input */
  c_h=INTEGER(h)[0];
  c_k=INTEGER(k)[0];
  c_type = (igraph_tree_mode_t) Rf_asInteger(type);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_regular_tree(&c_graph, c_h, c_k, c_type));

                                        /* Convert output */
  IGRAPH_FINALLY(igraph_destroy, &c_graph);
  PROTECT(graph=R_igraph_to_SEXP(&c_graph));
  igraph_destroy(&c_graph);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = graph;

  UNPROTECT(1);
  return(r_result);
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

  SEXP r_result;
                                        /* Convert input */
  c_n=INTEGER(n)[0];
  c_directed=LOGICAL(directed)[0];
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_full_citation(&c_graph, c_n, c_directed));

                                        /* Convert output */
  IGRAPH_FINALLY(igraph_destroy, &c_graph);
  PROTECT(graph=R_igraph_to_SEXP(&c_graph));
  igraph_destroy(&c_graph);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = graph;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_extended_chordal_ring               /
/-------------------------------------------*/
SEXP R_igraph_extended_chordal_ring(SEXP nodes, SEXP W, SEXP directed) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_integer_t c_nodes;
  igraph_matrix_int_t c_W;
  igraph_bool_t c_directed;
  SEXP graph;

  SEXP r_result;
                                        /* Convert input */
  c_nodes=INTEGER(nodes)[0];
  R_SEXP_to_matrix_int(W, &c_W);
  c_directed=LOGICAL(directed)[0];
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_extended_chordal_ring(&c_graph, c_nodes, &c_W, c_directed));

                                        /* Convert output */
  IGRAPH_FINALLY(igraph_destroy, &c_graph);
  PROTECT(graph=R_igraph_to_SEXP(&c_graph));
  igraph_destroy(&c_graph);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = graph;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_lcf_vector                          /
/-------------------------------------------*/
SEXP R_igraph_lcf_vector(SEXP n, SEXP shifts, SEXP repeats) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_integer_t c_n;
  igraph_vector_int_t c_shifts;
  igraph_integer_t c_repeats;
  SEXP graph;

  SEXP r_result;
                                        /* Convert input */
  c_n=INTEGER(n)[0];
  R_SEXP_to_vector_int(shifts, &c_shifts);
  c_repeats=INTEGER(repeats)[0];
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_lcf_vector(&c_graph, c_n, &c_shifts, c_repeats));

                                        /* Convert output */
  IGRAPH_FINALLY(igraph_destroy, &c_graph);
  PROTECT(graph=R_igraph_to_SEXP(&c_graph));
  igraph_destroy(&c_graph);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = graph;

  UNPROTECT(1);
  return(r_result);
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

  SEXP r_result;
                                        /* Convert input */
  if (0 != R_SEXP_to_igraph_adjlist(adjlist, &c_adjlist)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  c_mode = (igraph_neimode_t) Rf_asInteger(mode);
  c_duplicate=LOGICAL(duplicate)[0];
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_adjlist(&c_graph, &c_adjlist, c_mode, c_duplicate));

                                        /* Convert output */
  IGRAPH_FINALLY(igraph_destroy, &c_graph);
  PROTECT(graph=R_igraph_to_SEXP(&c_graph));
  igraph_destroy(&c_graph);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = graph;

  UNPROTECT(1);
  return(r_result);
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

  SEXP r_result, r_names;
                                        /* Convert input */
  if (0 != igraph_vector_bool_init(&c_types, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_bool_destroy, &c_types);
  c_n1=INTEGER(n1)[0];
  c_n2=INTEGER(n2)[0];
  c_directed=LOGICAL(directed)[0];
  c_mode = (igraph_neimode_t) Rf_asInteger(mode);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_full_bipartite(&c_graph, &c_types, c_n1, c_n2, c_directed, c_mode));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(2));
  PROTECT(r_names=NEW_CHARACTER(2));
  IGRAPH_FINALLY(igraph_destroy, &c_graph);
  PROTECT(graph=R_igraph_to_SEXP(&c_graph));
  igraph_destroy(&c_graph);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(types=R_igraph_vector_bool_to_SEXP(&c_types));
  igraph_vector_bool_destroy(&c_types);
  IGRAPH_FINALLY_CLEAN(1);
  SET_VECTOR_ELT(r_result, 0, graph);
  SET_VECTOR_ELT(r_result, 1, types);
  SET_STRING_ELT(r_names, 0, Rf_mkChar("graph"));
  SET_STRING_ELT(r_names, 1, Rf_mkChar("types"));
  SET_NAMES(r_result, r_names);
  UNPROTECT(3);

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_full_multipartite                   /
/-------------------------------------------*/
SEXP R_igraph_full_multipartite(SEXP n, SEXP directed, SEXP mode) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_int_t c_types;
  igraph_vector_int_t c_n;
  igraph_bool_t c_directed;
  igraph_neimode_t c_mode;
  SEXP graph;
  SEXP types;

  SEXP r_result, r_names;
                                        /* Convert input */
  if (0 != igraph_vector_int_init(&c_types, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_types);
  R_SEXP_to_vector_int(n, &c_n);
  c_directed=LOGICAL(directed)[0];
  c_mode = (igraph_neimode_t) Rf_asInteger(mode);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_full_multipartite(&c_graph, &c_types, &c_n, c_directed, c_mode));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(2));
  PROTECT(r_names=NEW_CHARACTER(2));
  IGRAPH_FINALLY(igraph_destroy, &c_graph);
  PROTECT(graph=R_igraph_to_SEXP(&c_graph));
  igraph_destroy(&c_graph);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(types=R_igraph_vector_int_to_SEXP(&c_types));
  igraph_vector_int_destroy(&c_types);
  IGRAPH_FINALLY_CLEAN(1);
  SET_VECTOR_ELT(r_result, 0, graph);
  SET_VECTOR_ELT(r_result, 1, types);
  SET_STRING_ELT(r_names, 0, Rf_mkChar("graph"));
  SET_STRING_ELT(r_names, 1, Rf_mkChar("types"));
  SET_NAMES(r_result, r_names);
  UNPROTECT(3);

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_realize_degree_sequence             /
/-------------------------------------------*/
SEXP R_igraph_realize_degree_sequence(SEXP out_deg, SEXP in_deg, SEXP allowed_edge_types, SEXP method) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_int_t c_out_deg;
  igraph_vector_int_t c_in_deg;
  igraph_edge_type_sw_t c_allowed_edge_types;
  igraph_realize_degseq_t c_method;
  SEXP graph;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_vector_int(out_deg, &c_out_deg);
  if (!Rf_isNull(in_deg)) { R_SEXP_to_vector_int(in_deg, &c_in_deg); }
  c_allowed_edge_types = (igraph_edge_type_sw_t) Rf_asInteger(allowed_edge_types);
  c_method = (igraph_realize_degseq_t) Rf_asInteger(method);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_realize_degree_sequence(&c_graph, &c_out_deg, (Rf_isNull(in_deg) ? 0 : &c_in_deg), c_allowed_edge_types, c_method));

                                        /* Convert output */
  IGRAPH_FINALLY(igraph_destroy, &c_graph);
  PROTECT(graph=R_igraph_to_SEXP(&c_graph));
  igraph_destroy(&c_graph);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = graph;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_circulant                           /
/-------------------------------------------*/
SEXP R_igraph_circulant(SEXP n, SEXP shifts, SEXP directed) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_integer_t c_n;
  igraph_vector_int_t c_shifts;
  igraph_bool_t c_directed;
  SEXP graph;

  SEXP r_result;
                                        /* Convert input */
  c_n=INTEGER(n)[0];
  R_SEXP_to_vector_int(shifts, &c_shifts);
  c_directed=LOGICAL(directed)[0];
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_circulant(&c_graph, c_n, &c_shifts, c_directed));

                                        /* Convert output */
  IGRAPH_FINALLY(igraph_destroy, &c_graph);
  PROTECT(graph=R_igraph_to_SEXP(&c_graph));
  igraph_destroy(&c_graph);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = graph;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_generalized_petersen                /
/-------------------------------------------*/
SEXP R_igraph_generalized_petersen(SEXP n, SEXP k) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_integer_t c_n;
  igraph_integer_t c_k;
  SEXP graph;

  SEXP r_result;
                                        /* Convert input */
  c_n=INTEGER(n)[0];
  c_k=INTEGER(k)[0];
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_generalized_petersen(&c_graph, c_n, c_k));

                                        /* Convert output */
  IGRAPH_FINALLY(igraph_destroy, &c_graph);
  PROTECT(graph=R_igraph_to_SEXP(&c_graph));
  igraph_destroy(&c_graph);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = graph;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_turan                               /
/-------------------------------------------*/
SEXP R_igraph_turan(SEXP n, SEXP r) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_int_t c_types;
  igraph_integer_t c_n;
  igraph_integer_t c_r;
  SEXP graph;
  SEXP types;

  SEXP r_result, r_names;
                                        /* Convert input */
  if (0 != igraph_vector_int_init(&c_types, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_types);
  c_n=INTEGER(n)[0];
  c_r=INTEGER(r)[0];
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_turan(&c_graph, &c_types, c_n, c_r));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(2));
  PROTECT(r_names=NEW_CHARACTER(2));
  IGRAPH_FINALLY(igraph_destroy, &c_graph);
  PROTECT(graph=R_igraph_to_SEXP(&c_graph));
  igraph_destroy(&c_graph);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(types=R_igraph_vector_int_to_SEXP(&c_types));
  igraph_vector_int_destroy(&c_types);
  IGRAPH_FINALLY_CLEAN(1);
  SET_VECTOR_ELT(r_result, 0, graph);
  SET_VECTOR_ELT(r_result, 1, types);
  SET_STRING_ELT(r_names, 0, Rf_mkChar("graph"));
  SET_STRING_ELT(r_names, 1, Rf_mkChar("types"));
  SET_NAMES(r_result, r_names);
  UNPROTECT(3);

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_weighted_sparsemat                  /
/-------------------------------------------*/
SEXP R_igraph_weighted_sparsemat(SEXP A, SEXP directed, SEXP attr, SEXP loops) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_sparsemat_t c_A;
  igraph_bool_t c_directed;
  const char* c_attr;
  igraph_bool_t c_loops;
  SEXP graph;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_sparsemat(A, &c_A);
  c_directed=LOGICAL(directed)[0];
  c_loops=LOGICAL(loops)[0];
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_weighted_sparsemat(&c_graph, &c_A, c_directed, c_attr, c_loops));

                                        /* Convert output */
  IGRAPH_FINALLY(igraph_destroy, &c_graph);
  PROTECT(graph=R_igraph_to_SEXP(&c_graph));
  igraph_destroy(&c_graph);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = graph;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_erdos_renyi_game                    /
/-------------------------------------------*/
SEXP R_igraph_erdos_renyi_game(SEXP type, SEXP n, SEXP p_or_m, SEXP directed, SEXP loops) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_erdos_renyi_t c_type;
  igraph_integer_t c_n;
  igraph_real_t c_p_or_m;
  igraph_bool_t c_directed;
  igraph_bool_t c_loops;
  SEXP graph;

  SEXP r_result;
                                        /* Convert input */
  c_type = (igraph_erdos_renyi_t) Rf_asInteger(type);
  c_n=INTEGER(n)[0];
  c_p_or_m=REAL(p_or_m)[0];
  c_directed=LOGICAL(directed)[0];
  c_loops=LOGICAL(loops)[0];
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_erdos_renyi_game(&c_graph, c_type, c_n, c_p_or_m, c_directed, c_loops));

                                        /* Convert output */
  IGRAPH_FINALLY(igraph_destroy, &c_graph);
  PROTECT(graph=R_igraph_to_SEXP(&c_graph));
  igraph_destroy(&c_graph);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = graph;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_preference_game                     /
/-------------------------------------------*/
SEXP R_igraph_preference_game(SEXP nodes, SEXP types, SEXP type_dist, SEXP fixed_sizes, SEXP pref_matrix, SEXP directed, SEXP loops) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_integer_t c_nodes;
  igraph_integer_t c_types;
  igraph_vector_t c_type_dist;
  igraph_bool_t c_fixed_sizes;
  igraph_matrix_t c_pref_matrix;
  igraph_vector_int_t c_node_type_vec;
  igraph_bool_t c_directed;
  igraph_bool_t c_loops;
  SEXP graph;
  SEXP node_type_vec;

  SEXP r_result, r_names;
                                        /* Convert input */
  c_nodes=INTEGER(nodes)[0];
  c_types=INTEGER(types)[0];
  R_SEXP_to_vector(type_dist, &c_type_dist);
  c_fixed_sizes=LOGICAL(fixed_sizes)[0];
  R_SEXP_to_matrix(pref_matrix, &c_pref_matrix);
  if (0 != igraph_vector_int_init(&c_node_type_vec, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_node_type_vec);
  c_directed=LOGICAL(directed)[0];
  c_loops=LOGICAL(loops)[0];
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_preference_game(&c_graph, c_nodes, c_types, &c_type_dist, c_fixed_sizes, &c_pref_matrix, &c_node_type_vec, c_directed, c_loops));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(2));
  PROTECT(r_names=NEW_CHARACTER(2));
  IGRAPH_FINALLY(igraph_destroy, &c_graph);
  PROTECT(graph=R_igraph_to_SEXP(&c_graph));
  igraph_destroy(&c_graph);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(node_type_vec=R_igraph_vector_int_to_SEXP(&c_node_type_vec));
  igraph_vector_int_destroy(&c_node_type_vec);
  IGRAPH_FINALLY_CLEAN(1);
  SET_VECTOR_ELT(r_result, 0, graph);
  SET_VECTOR_ELT(r_result, 1, node_type_vec);
  SET_STRING_ELT(r_names, 0, Rf_mkChar("graph"));
  SET_STRING_ELT(r_names, 1, Rf_mkChar("node_type_vec"));
  SET_NAMES(r_result, r_names);
  UNPROTECT(3);

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_asymmetric_preference_game          /
/-------------------------------------------*/
SEXP R_igraph_asymmetric_preference_game(SEXP nodes, SEXP out_types, SEXP in_types, SEXP type_dist_matrix, SEXP pref_matrix, SEXP loops) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_integer_t c_nodes;
  igraph_integer_t c_out_types;
  igraph_integer_t c_in_types;
  igraph_matrix_t c_type_dist_matrix;
  igraph_matrix_t c_pref_matrix;
  igraph_vector_int_t c_node_type_out_vec;
  igraph_vector_int_t c_node_type_in_vec;
  igraph_bool_t c_loops;
  SEXP graph;
  SEXP node_type_out_vec;
  SEXP node_type_in_vec;

  SEXP r_result, r_names;
                                        /* Convert input */
  c_nodes=INTEGER(nodes)[0];
  c_out_types=INTEGER(out_types)[0];
  c_in_types=INTEGER(in_types)[0];
  R_SEXP_to_matrix(type_dist_matrix, &c_type_dist_matrix);
  R_SEXP_to_matrix(pref_matrix, &c_pref_matrix);
  if (0 != igraph_vector_int_init(&c_node_type_out_vec, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_node_type_out_vec);
  if (0 != igraph_vector_int_init(&c_node_type_in_vec, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_node_type_in_vec);
  c_loops=LOGICAL(loops)[0];
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_asymmetric_preference_game(&c_graph, c_nodes, c_out_types, c_in_types, &c_type_dist_matrix, &c_pref_matrix, &c_node_type_out_vec, &c_node_type_in_vec, c_loops));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(3));
  PROTECT(r_names=NEW_CHARACTER(3));
  IGRAPH_FINALLY(igraph_destroy, &c_graph);
  PROTECT(graph=R_igraph_to_SEXP(&c_graph));
  igraph_destroy(&c_graph);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(node_type_out_vec=R_igraph_vector_int_to_SEXP(&c_node_type_out_vec));
  igraph_vector_int_destroy(&c_node_type_out_vec);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(node_type_in_vec=R_igraph_vector_int_to_SEXP(&c_node_type_in_vec));
  igraph_vector_int_destroy(&c_node_type_in_vec);
  IGRAPH_FINALLY_CLEAN(1);
  SET_VECTOR_ELT(r_result, 0, graph);
  SET_VECTOR_ELT(r_result, 1, node_type_out_vec);
  SET_VECTOR_ELT(r_result, 2, node_type_in_vec);
  SET_STRING_ELT(r_names, 0, Rf_mkChar("graph"));
  SET_STRING_ELT(r_names, 1, Rf_mkChar("node_type_out_vec"));
  SET_STRING_ELT(r_names, 2, Rf_mkChar("node_type_in_vec"));
  SET_NAMES(r_result, r_names);
  UNPROTECT(4);

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_rewire_edges                        /
/-------------------------------------------*/
SEXP R_igraph_rewire_edges(SEXP graph, SEXP prob, SEXP loops, SEXP multiple) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_real_t c_prob;
  igraph_bool_t c_loops;
  igraph_bool_t c_multiple;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph_copy(graph, &c_graph);
  IGRAPH_FINALLY(igraph_destroy, &c_graph);
  c_prob=REAL(prob)[0];
  c_loops=LOGICAL(loops)[0];
  c_multiple=LOGICAL(multiple)[0];
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_rewire_edges(&c_graph, c_prob, c_loops, c_multiple));

                                        /* Convert output */
  PROTECT(graph=R_igraph_to_SEXP(&c_graph));
  igraph_destroy(&c_graph);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = graph;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_rewire_directed_edges               /
/-------------------------------------------*/
SEXP R_igraph_rewire_directed_edges(SEXP graph, SEXP prob, SEXP loops, SEXP mode) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_real_t c_prob;
  igraph_bool_t c_loops;
  igraph_neimode_t c_mode;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph_copy(graph, &c_graph);
  IGRAPH_FINALLY(igraph_destroy, &c_graph);
  c_prob=REAL(prob)[0];
  c_loops=LOGICAL(loops)[0];
  c_mode = (igraph_neimode_t) Rf_asInteger(mode);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_rewire_directed_edges(&c_graph, c_prob, c_loops, c_mode));

                                        /* Convert output */
  PROTECT(graph=R_igraph_to_SEXP(&c_graph));
  igraph_destroy(&c_graph);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = graph;

  UNPROTECT(1);
  return(r_result);
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

  SEXP r_result;
                                        /* Convert input */
  c_nodes=INTEGER(nodes)[0];
  c_fw_prob=REAL(fw_prob)[0];
  c_bw_factor=REAL(bw_factor)[0];
  c_ambs=INTEGER(ambs)[0];
  c_directed=LOGICAL(directed)[0];
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_forest_fire_game(&c_graph, c_nodes, c_fw_prob, c_bw_factor, c_ambs, c_directed));

                                        /* Convert output */
  IGRAPH_FINALLY(igraph_destroy, &c_graph);
  PROTECT(graph=R_igraph_to_SEXP(&c_graph));
  igraph_destroy(&c_graph);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = graph;

  UNPROTECT(1);
  return(r_result);
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

  SEXP r_result;
                                        /* Convert input */
  c_no_of_edges=INTEGER(no_of_edges)[0];
  R_SEXP_to_vector(fitness_out, &c_fitness_out);
  R_SEXP_to_vector(fitness_in, &c_fitness_in);
  c_loops=LOGICAL(loops)[0];
  c_multiple=LOGICAL(multiple)[0];
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_static_fitness_game(&c_graph, c_no_of_edges, &c_fitness_out, &c_fitness_in, c_loops, c_multiple));

                                        /* Convert output */
  IGRAPH_FINALLY(igraph_destroy, &c_graph);
  PROTECT(graph=R_igraph_to_SEXP(&c_graph));
  igraph_destroy(&c_graph);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = graph;

  UNPROTECT(1);
  return(r_result);
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

  SEXP r_result;
                                        /* Convert input */
  c_no_of_nodes=INTEGER(no_of_nodes)[0];
  c_no_of_edges=INTEGER(no_of_edges)[0];
  c_exponent_out=REAL(exponent_out)[0];
  c_exponent_in=REAL(exponent_in)[0];
  c_loops=LOGICAL(loops)[0];
  c_multiple=LOGICAL(multiple)[0];
  c_finite_size_correction=LOGICAL(finite_size_correction)[0];
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_static_power_law_game(&c_graph, c_no_of_nodes, c_no_of_edges, c_exponent_out, c_exponent_in, c_loops, c_multiple, c_finite_size_correction));

                                        /* Convert output */
  IGRAPH_FINALLY(igraph_destroy, &c_graph);
  PROTECT(graph=R_igraph_to_SEXP(&c_graph));
  igraph_destroy(&c_graph);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = graph;

  UNPROTECT(1);
  return(r_result);
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

  SEXP r_result;
                                        /* Convert input */
  c_no_of_nodes=INTEGER(no_of_nodes)[0];
  c_k=INTEGER(k)[0];
  c_directed=LOGICAL(directed)[0];
  c_multiple=LOGICAL(multiple)[0];
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_k_regular_game(&c_graph, c_no_of_nodes, c_k, c_directed, c_multiple));

                                        /* Convert output */
  IGRAPH_FINALLY(igraph_destroy, &c_graph);
  PROTECT(graph=R_igraph_to_SEXP(&c_graph));
  igraph_destroy(&c_graph);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = graph;

  UNPROTECT(1);
  return(r_result);
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

  SEXP r_result;
                                        /* Convert input */
  c_n=INTEGER(n)[0];
  R_SEXP_to_matrix(pref_matrix, &c_pref_matrix);
  R_SEXP_to_vector_int(block_sizes, &c_block_sizes);
  c_directed=LOGICAL(directed)[0];
  c_loops=LOGICAL(loops)[0];
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_sbm_game(&c_graph, c_n, &c_pref_matrix, &c_block_sizes, c_directed, c_loops));

                                        /* Convert output */
  IGRAPH_FINALLY(igraph_destroy, &c_graph);
  PROTECT(graph=R_igraph_to_SEXP(&c_graph));
  igraph_destroy(&c_graph);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = graph;

  UNPROTECT(1);
  return(r_result);
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

  SEXP r_result;
                                        /* Convert input */
  c_n=INTEGER(n)[0];
  c_m=INTEGER(m)[0];
  R_SEXP_to_vector(rho, &c_rho);
  R_SEXP_to_matrix(C, &c_C);
  c_p=REAL(p)[0];
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_hsbm_game(&c_graph, c_n, c_m, &c_rho, &c_C, c_p));

                                        /* Convert output */
  IGRAPH_FINALLY(igraph_destroy, &c_graph);
  PROTECT(graph=R_igraph_to_SEXP(&c_graph));
  igraph_destroy(&c_graph);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = graph;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_hsbm_list_game                      /
/-------------------------------------------*/
SEXP R_igraph_hsbm_list_game(SEXP n, SEXP mlist, SEXP rholist, SEXP Clist, SEXP p) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_integer_t c_n;
  igraph_vector_int_t c_mlist;
  igraph_vector_list_t c_rholist;
  igraph_matrix_list_t c_Clist;
  igraph_real_t c_p;
  SEXP graph;

  SEXP r_result;
                                        /* Convert input */
  c_n=INTEGER(n)[0];
  R_SEXP_to_vector_int(mlist, &c_mlist);
  R_igraph_SEXP_to_vectorlist(rholist, &c_rholist);
  R_igraph_SEXP_to_matrixlist(Clist, &c_Clist);
  c_p=REAL(p)[0];
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_hsbm_list_game(&c_graph, c_n, &c_mlist, &c_rholist, &c_Clist, c_p));

                                        /* Convert output */
  IGRAPH_FINALLY(igraph_destroy, &c_graph);
  PROTECT(graph=R_igraph_to_SEXP(&c_graph));
  igraph_destroy(&c_graph);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = graph;

  UNPROTECT(1);
  return(r_result);
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
  igraph_vector_int_t c_permutation;
  SEXP new_graph;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(old_graph, &c_old_graph);
  c_corr=REAL(corr)[0];
  c_p=REAL(p)[0];
  R_SEXP_to_vector_int(permutation, &c_permutation);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_correlated_game(&c_old_graph, &c_new_graph, c_corr, c_p, &c_permutation));

                                        /* Convert output */
  IGRAPH_FINALLY(igraph_destroy, &c_new_graph);
  PROTECT(new_graph=R_igraph_to_SEXP(&c_new_graph));
  igraph_destroy(&c_new_graph);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = new_graph;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_correlated_pair_game                /
/-------------------------------------------*/
SEXP R_igraph_correlated_pair_game(SEXP n, SEXP corr, SEXP p, SEXP directed, SEXP permutation) {
                                        /* Declarations */
  igraph_t c_graph1;
  igraph_t c_graph2;
  igraph_integer_t c_n;
  igraph_real_t c_corr;
  igraph_real_t c_p;
  igraph_bool_t c_directed;
  igraph_vector_int_t c_permutation;
  SEXP graph1;
  SEXP graph2;

  SEXP r_result, r_names;
                                        /* Convert input */
  c_n=INTEGER(n)[0];
  c_corr=REAL(corr)[0];
  c_p=REAL(p)[0];
  c_directed=LOGICAL(directed)[0];
  R_SEXP_to_vector_int(permutation, &c_permutation);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_correlated_pair_game(&c_graph1, &c_graph2, c_n, c_corr, c_p, c_directed, &c_permutation));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(2));
  PROTECT(r_names=NEW_CHARACTER(2));
  IGRAPH_FINALLY(igraph_destroy, &c_graph1);
  PROTECT(graph1=R_igraph_to_SEXP(&c_graph1));
  igraph_destroy(&c_graph1);
  IGRAPH_FINALLY_CLEAN(1);
  IGRAPH_FINALLY(igraph_destroy, &c_graph2);
  PROTECT(graph2=R_igraph_to_SEXP(&c_graph2));
  igraph_destroy(&c_graph2);
  IGRAPH_FINALLY_CLEAN(1);
  SET_VECTOR_ELT(r_result, 0, graph1);
  SET_VECTOR_ELT(r_result, 1, graph2);
  SET_STRING_ELT(r_names, 0, Rf_mkChar("graph1"));
  SET_STRING_ELT(r_names, 1, Rf_mkChar("graph2"));
  SET_NAMES(r_result, r_names);
  UNPROTECT(3);

  UNPROTECT(1);
  return(r_result);
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

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_matrix(vecs, &c_vecs);
  c_directed=LOGICAL(directed)[0];
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_dot_product_game(&c_graph, &c_vecs, c_directed));

                                        /* Convert output */
  IGRAPH_FINALLY(igraph_destroy, &c_graph);
  PROTECT(graph=R_igraph_to_SEXP(&c_graph));
  igraph_destroy(&c_graph);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = graph;

  UNPROTECT(1);
  return(r_result);
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

  SEXP r_result;
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
  IGRAPH_R_CHECK(igraph_sample_sphere_surface(c_dim, c_n, c_radius, c_positive, &c_res));

                                        /* Convert output */
  PROTECT(res=R_igraph_matrix_to_SEXP(&c_res));
  igraph_matrix_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = res;

  UNPROTECT(1);
  return(r_result);
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

  SEXP r_result;
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
  IGRAPH_R_CHECK(igraph_sample_sphere_volume(c_dim, c_n, c_radius, c_positive, &c_res));

                                        /* Convert output */
  PROTECT(res=R_igraph_matrix_to_SEXP(&c_res));
  igraph_matrix_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = res;

  UNPROTECT(1);
  return(r_result);
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

  SEXP r_result;
                                        /* Convert input */
  c_n=INTEGER(n)[0];
  R_SEXP_to_vector(alpha, &c_alpha);
  if (0 != igraph_matrix_init(&c_res, 0, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_matrix_destroy, &c_res);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_sample_dirichlet(c_n, &c_alpha, &c_res));

                                        /* Convert output */
  PROTECT(res=R_igraph_matrix_to_SEXP(&c_res));
  igraph_matrix_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = res;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_closeness                           /
/-------------------------------------------*/
SEXP R_igraph_closeness(SEXP graph, SEXP vids, SEXP mode, SEXP weights, SEXP normalized) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_t c_res;
  igraph_vector_int_t c_reachable_count;
  igraph_bool_t c_all_reachable;
  igraph_vs_t c_vids;
  igraph_neimode_t c_mode;
  igraph_vector_t c_weights;
  igraph_bool_t c_normalized;
  SEXP res;
  SEXP reachable_count;
  SEXP all_reachable;

  SEXP r_result, r_names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_init(&c_res, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_res);
  if (0 != igraph_vector_int_init(&c_reachable_count, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_reachable_count);
  c_mode = (igraph_neimode_t) Rf_asInteger(mode);
  if (!Rf_isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
  c_normalized=LOGICAL(normalized)[0];
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_closeness(&c_graph, &c_res, &c_reachable_count, &c_all_reachable, c_vids, c_mode, (Rf_isNull(weights) ? 0 : &c_weights), c_normalized));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(3));
  PROTECT(r_names=NEW_CHARACTER(3));
  PROTECT(res=R_igraph_vector_to_SEXP(&c_res));
  igraph_vector_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(reachable_count=R_igraph_vector_int_to_SEXP(&c_reachable_count));
  igraph_vector_int_destroy(&c_reachable_count);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(all_reachable=NEW_LOGICAL(1));
  LOGICAL(all_reachable)[0]=c_all_reachable;
  SET_VECTOR_ELT(r_result, 0, res);
  SET_VECTOR_ELT(r_result, 1, reachable_count);
  SET_VECTOR_ELT(r_result, 2, all_reachable);
  SET_STRING_ELT(r_names, 0, Rf_mkChar("res"));
  SET_STRING_ELT(r_names, 1, Rf_mkChar("reachable_count"));
  SET_STRING_ELT(r_names, 2, Rf_mkChar("all_reachable"));
  SET_NAMES(r_result, r_names);
  UNPROTECT(4);

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_closeness_cutoff                    /
/-------------------------------------------*/
SEXP R_igraph_closeness_cutoff(SEXP graph, SEXP vids, SEXP mode, SEXP weights, SEXP normalized, SEXP cutoff) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_t c_res;
  igraph_vector_int_t c_reachable_count;
  igraph_bool_t c_all_reachable;
  igraph_vs_t c_vids;
  igraph_neimode_t c_mode;
  igraph_vector_t c_weights;
  igraph_bool_t c_normalized;
  igraph_real_t c_cutoff;
  SEXP res;
  SEXP reachable_count;
  SEXP all_reachable;

  SEXP r_result, r_names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_init(&c_res, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_res);
  if (0 != igraph_vector_int_init(&c_reachable_count, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_reachable_count);
  c_mode = (igraph_neimode_t) Rf_asInteger(mode);
  if (!Rf_isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
  c_normalized=LOGICAL(normalized)[0];
  c_cutoff=REAL(cutoff)[0];
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_closeness_cutoff(&c_graph, &c_res, &c_reachable_count, &c_all_reachable, c_vids, c_mode, (Rf_isNull(weights) ? 0 : &c_weights), c_normalized, c_cutoff));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(3));
  PROTECT(r_names=NEW_CHARACTER(3));
  PROTECT(res=R_igraph_vector_to_SEXP(&c_res));
  igraph_vector_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(reachable_count=R_igraph_vector_int_to_SEXP(&c_reachable_count));
  igraph_vector_int_destroy(&c_reachable_count);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(all_reachable=NEW_LOGICAL(1));
  LOGICAL(all_reachable)[0]=c_all_reachable;
  SET_VECTOR_ELT(r_result, 0, res);
  SET_VECTOR_ELT(r_result, 1, reachable_count);
  SET_VECTOR_ELT(r_result, 2, all_reachable);
  SET_STRING_ELT(r_names, 0, Rf_mkChar("res"));
  SET_STRING_ELT(r_names, 1, Rf_mkChar("reachable_count"));
  SET_STRING_ELT(r_names, 2, Rf_mkChar("all_reachable"));
  SET_NAMES(r_result, r_names);
  UNPROTECT(4);

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_distances                           /
/-------------------------------------------*/
SEXP R_igraph_distances(SEXP graph, SEXP from, SEXP to, SEXP mode) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_matrix_t c_res;
  igraph_vs_t c_from;
  igraph_vs_t c_to;
  igraph_neimode_t c_mode;
  SEXP res;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_matrix_init(&c_res, 0, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_matrix_destroy, &c_res);
  c_mode = (igraph_neimode_t) Rf_asInteger(mode);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_distances(&c_graph, &c_res, c_from, c_to, c_mode));

                                        /* Convert output */
  PROTECT(res=R_igraph_matrix_to_SEXP(&c_res));
  igraph_matrix_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = res;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_distances_cutoff                    /
/-------------------------------------------*/
SEXP R_igraph_distances_cutoff(SEXP graph, SEXP from, SEXP to, SEXP mode, SEXP cutoff) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_matrix_t c_res;
  igraph_vs_t c_from;
  igraph_vs_t c_to;
  igraph_neimode_t c_mode;
  igraph_real_t c_cutoff;
  SEXP res;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_matrix_init(&c_res, 0, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_matrix_destroy, &c_res);
  c_mode = (igraph_neimode_t) Rf_asInteger(mode);
  c_cutoff=REAL(cutoff)[0];
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_distances_cutoff(&c_graph, &c_res, c_from, c_to, c_mode, c_cutoff));

                                        /* Convert output */
  PROTECT(res=R_igraph_matrix_to_SEXP(&c_res));
  igraph_matrix_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = res;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_get_shortest_path                   /
/-------------------------------------------*/
SEXP R_igraph_get_shortest_path(SEXP graph, SEXP from, SEXP to, SEXP mode) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_int_t c_vertices;
  igraph_vector_int_t c_edges;
  igraph_integer_t c_from;
  igraph_integer_t c_to;
  igraph_neimode_t c_mode;
  SEXP vertices;
  SEXP edges;

  SEXP r_result, r_names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_int_init(&c_vertices, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_vertices);
  if (0 != igraph_vector_int_init(&c_edges, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_edges);
  c_from = (igraph_integer_t) REAL(from)[0];
  c_to = (igraph_integer_t) REAL(to)[0];
  c_mode = (igraph_neimode_t) Rf_asInteger(mode);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_get_shortest_path(&c_graph, &c_vertices, &c_edges, c_from, c_to, c_mode));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(2));
  PROTECT(r_names=NEW_CHARACTER(2));
  PROTECT(vertices=R_igraph_vector_int_to_SEXP(&c_vertices));
  igraph_vector_int_destroy(&c_vertices);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(edges=R_igraph_vector_int_to_SEXP(&c_edges));
  igraph_vector_int_destroy(&c_edges);
  IGRAPH_FINALLY_CLEAN(1);
  SET_VECTOR_ELT(r_result, 0, vertices);
  SET_VECTOR_ELT(r_result, 1, edges);
  SET_STRING_ELT(r_names, 0, Rf_mkChar("vertices"));
  SET_STRING_ELT(r_names, 1, Rf_mkChar("edges"));
  SET_NAMES(r_result, r_names);
  UNPROTECT(3);

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_get_shortest_path_bellman_ford      /
/-------------------------------------------*/
SEXP R_igraph_get_shortest_path_bellman_ford(SEXP graph, SEXP from, SEXP to, SEXP weights, SEXP mode) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_int_t c_vertices;
  igraph_vector_int_t c_edges;
  igraph_integer_t c_from;
  igraph_integer_t c_to;
  igraph_vector_t c_weights;
  igraph_neimode_t c_mode;
  SEXP vertices;
  SEXP edges;

  SEXP r_result, r_names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_int_init(&c_vertices, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_vertices);
  if (0 != igraph_vector_int_init(&c_edges, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_edges);
  c_from = (igraph_integer_t) REAL(from)[0];
  c_to = (igraph_integer_t) REAL(to)[0];
  if (!Rf_isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
  c_mode = (igraph_neimode_t) Rf_asInteger(mode);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_get_shortest_path_bellman_ford(&c_graph, &c_vertices, &c_edges, c_from, c_to, (Rf_isNull(weights) ? 0 : &c_weights), c_mode));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(2));
  PROTECT(r_names=NEW_CHARACTER(2));
  PROTECT(vertices=R_igraph_vector_int_to_SEXP(&c_vertices));
  igraph_vector_int_destroy(&c_vertices);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(edges=R_igraph_vector_int_to_SEXP(&c_edges));
  igraph_vector_int_destroy(&c_edges);
  IGRAPH_FINALLY_CLEAN(1);
  SET_VECTOR_ELT(r_result, 0, vertices);
  SET_VECTOR_ELT(r_result, 1, edges);
  SET_STRING_ELT(r_names, 0, Rf_mkChar("vertices"));
  SET_STRING_ELT(r_names, 1, Rf_mkChar("edges"));
  SET_NAMES(r_result, r_names);
  UNPROTECT(3);

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_get_shortest_path_dijkstra          /
/-------------------------------------------*/
SEXP R_igraph_get_shortest_path_dijkstra(SEXP graph, SEXP from, SEXP to, SEXP weights, SEXP mode) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_int_t c_vertices;
  igraph_vector_int_t c_edges;
  igraph_integer_t c_from;
  igraph_integer_t c_to;
  igraph_vector_t c_weights;
  igraph_neimode_t c_mode;
  SEXP vertices;
  SEXP edges;

  SEXP r_result, r_names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_int_init(&c_vertices, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_vertices);
  if (0 != igraph_vector_int_init(&c_edges, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_edges);
  c_from = (igraph_integer_t) REAL(from)[0];
  c_to = (igraph_integer_t) REAL(to)[0];
  if (!Rf_isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
  c_mode = (igraph_neimode_t) Rf_asInteger(mode);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_get_shortest_path_dijkstra(&c_graph, &c_vertices, &c_edges, c_from, c_to, (Rf_isNull(weights) ? 0 : &c_weights), c_mode));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(2));
  PROTECT(r_names=NEW_CHARACTER(2));
  PROTECT(vertices=R_igraph_vector_int_to_SEXP(&c_vertices));
  igraph_vector_int_destroy(&c_vertices);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(edges=R_igraph_vector_int_to_SEXP(&c_edges));
  igraph_vector_int_destroy(&c_edges);
  IGRAPH_FINALLY_CLEAN(1);
  SET_VECTOR_ELT(r_result, 0, vertices);
  SET_VECTOR_ELT(r_result, 1, edges);
  SET_STRING_ELT(r_names, 0, Rf_mkChar("vertices"));
  SET_STRING_ELT(r_names, 1, Rf_mkChar("edges"));
  SET_NAMES(r_result, r_names);
  UNPROTECT(3);

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_get_shortest_path_astar             /
/-------------------------------------------*/
SEXP R_igraph_get_shortest_path_astar(SEXP graph, SEXP from, SEXP to, SEXP weights, SEXP mode, SEXP heuristic) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_int_t c_vertices;
  igraph_vector_int_t c_edges;
  igraph_integer_t c_from;
  igraph_integer_t c_to;
  igraph_vector_t c_weights;
  igraph_neimode_t c_mode;
  igraph_astar_heuristic_func_t c_heuristic;

  SEXP vertices;
  SEXP edges;

  SEXP r_result, r_names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_int_init(&c_vertices, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_vertices);
  if (0 != igraph_vector_int_init(&c_edges, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_edges);
  c_from = (igraph_integer_t) REAL(from)[0];
  c_to = (igraph_integer_t) REAL(to)[0];
  if (!Rf_isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
  c_mode = (igraph_neimode_t) Rf_asInteger(mode);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_get_shortest_path_astar(&c_graph, &c_vertices, &c_edges, c_from, c_to, (Rf_isNull(weights) ? 0 : &c_weights), c_mode, c_heuristic, 0));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(2));
  PROTECT(r_names=NEW_CHARACTER(2));
  PROTECT(vertices=R_igraph_vector_int_to_SEXP(&c_vertices));
  igraph_vector_int_destroy(&c_vertices);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(edges=R_igraph_vector_int_to_SEXP(&c_edges));
  igraph_vector_int_destroy(&c_edges);
  IGRAPH_FINALLY_CLEAN(1);
  SET_VECTOR_ELT(r_result, 0, vertices);
  SET_VECTOR_ELT(r_result, 1, edges);
  SET_STRING_ELT(r_names, 0, Rf_mkChar("vertices"));
  SET_STRING_ELT(r_names, 1, Rf_mkChar("edges"));
  SET_NAMES(r_result, r_names);
  UNPROTECT(3);

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_get_all_shortest_paths              /
/-------------------------------------------*/
SEXP R_igraph_get_all_shortest_paths(SEXP graph, SEXP from, SEXP to, SEXP mode) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_int_list_t c_vertices;
  igraph_vector_int_list_t c_edges;
  igraph_vector_int_t c_nrgeo;
  igraph_integer_t c_from;
  igraph_vs_t c_to;
  igraph_neimode_t c_mode;
  SEXP vertices;
  SEXP edges;
  SEXP nrgeo;

  SEXP r_result, r_names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_int_list_init(&c_vertices, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_list_destroy, &c_vertices);
  if (0 != igraph_vector_int_list_init(&c_edges, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_list_destroy, &c_edges);
  if (0 != igraph_vector_int_init(&c_nrgeo, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_nrgeo);
  c_from = (igraph_integer_t) REAL(from)[0];
  c_mode = (igraph_neimode_t) Rf_asInteger(mode);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_get_all_shortest_paths(&c_graph, &c_vertices, &c_edges, &c_nrgeo, c_from, c_to, c_mode));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(3));
  PROTECT(r_names=NEW_CHARACTER(3));
  PROTECT(vertices=R_igraph_vectorlist_int_to_SEXP(&c_vertices));
  igraph_vector_int_list_destroy(&c_vertices);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(edges=R_igraph_vectorlist_int_to_SEXP(&c_edges));
  igraph_vector_int_list_destroy(&c_edges);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(nrgeo=R_igraph_vector_int_to_SEXP(&c_nrgeo));
  igraph_vector_int_destroy(&c_nrgeo);
  IGRAPH_FINALLY_CLEAN(1);
  SET_VECTOR_ELT(r_result, 0, vertices);
  SET_VECTOR_ELT(r_result, 1, edges);
  SET_VECTOR_ELT(r_result, 2, nrgeo);
  SET_STRING_ELT(r_names, 0, Rf_mkChar("vertices"));
  SET_STRING_ELT(r_names, 1, Rf_mkChar("edges"));
  SET_STRING_ELT(r_names, 2, Rf_mkChar("nrgeo"));
  SET_NAMES(r_result, r_names);
  UNPROTECT(4);

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_distances_dijkstra                  /
/-------------------------------------------*/
SEXP R_igraph_distances_dijkstra(SEXP graph, SEXP from, SEXP to, SEXP weights, SEXP mode) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_matrix_t c_res;
  igraph_vs_t c_from;
  igraph_vs_t c_to;
  igraph_vector_t c_weights;
  igraph_neimode_t c_mode;
  SEXP res;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_matrix_init(&c_res, 0, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_matrix_destroy, &c_res);
  if (!Rf_isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
  c_mode = (igraph_neimode_t) Rf_asInteger(mode);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_distances_dijkstra(&c_graph, &c_res, c_from, c_to, (Rf_isNull(weights) ? 0 : &c_weights), c_mode));

                                        /* Convert output */
  PROTECT(res=R_igraph_matrix_to_SEXP(&c_res));
  igraph_matrix_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = res;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_distances_dijkstra_cutoff           /
/-------------------------------------------*/
SEXP R_igraph_distances_dijkstra_cutoff(SEXP graph, SEXP from, SEXP to, SEXP weights, SEXP mode, SEXP cutoff) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_matrix_t c_res;
  igraph_vs_t c_from;
  igraph_vs_t c_to;
  igraph_vector_t c_weights;
  igraph_neimode_t c_mode;
  igraph_real_t c_cutoff;
  SEXP res;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_matrix_init(&c_res, 0, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_matrix_destroy, &c_res);
  if (!Rf_isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
  c_mode = (igraph_neimode_t) Rf_asInteger(mode);
  c_cutoff=REAL(cutoff)[0];
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_distances_dijkstra_cutoff(&c_graph, &c_res, c_from, c_to, (Rf_isNull(weights) ? 0 : &c_weights), c_mode, c_cutoff));

                                        /* Convert output */
  PROTECT(res=R_igraph_matrix_to_SEXP(&c_res));
  igraph_matrix_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = res;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_get_all_shortest_paths_dijkstra     /
/-------------------------------------------*/
SEXP R_igraph_get_all_shortest_paths_dijkstra(SEXP graph, SEXP from, SEXP to, SEXP weights, SEXP mode) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_int_list_t c_vertices;
  igraph_vector_int_list_t c_edges;
  igraph_vector_int_t c_nrgeo;
  igraph_integer_t c_from;
  igraph_vs_t c_to;
  igraph_vector_t c_weights;
  igraph_neimode_t c_mode;
  SEXP vertices;
  SEXP edges;
  SEXP nrgeo;

  SEXP r_result, r_names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_int_list_init(&c_vertices, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_list_destroy, &c_vertices);
  if (0 != igraph_vector_int_list_init(&c_edges, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_list_destroy, &c_edges);
  if (0 != igraph_vector_int_init(&c_nrgeo, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_nrgeo);
  c_from = (igraph_integer_t) REAL(from)[0];
  if (!Rf_isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
  c_mode = (igraph_neimode_t) Rf_asInteger(mode);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_get_all_shortest_paths_dijkstra(&c_graph, &c_vertices, &c_edges, &c_nrgeo, c_from, c_to, (Rf_isNull(weights) ? 0 : &c_weights), c_mode));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(3));
  PROTECT(r_names=NEW_CHARACTER(3));
  PROTECT(vertices=R_igraph_vectorlist_int_to_SEXP(&c_vertices));
  igraph_vector_int_list_destroy(&c_vertices);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(edges=R_igraph_vectorlist_int_to_SEXP(&c_edges));
  igraph_vector_int_list_destroy(&c_edges);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(nrgeo=R_igraph_vector_int_to_SEXP(&c_nrgeo));
  igraph_vector_int_destroy(&c_nrgeo);
  IGRAPH_FINALLY_CLEAN(1);
  SET_VECTOR_ELT(r_result, 0, vertices);
  SET_VECTOR_ELT(r_result, 1, edges);
  SET_VECTOR_ELT(r_result, 2, nrgeo);
  SET_STRING_ELT(r_names, 0, Rf_mkChar("vertices"));
  SET_STRING_ELT(r_names, 1, Rf_mkChar("edges"));
  SET_STRING_ELT(r_names, 2, Rf_mkChar("nrgeo"));
  SET_NAMES(r_result, r_names);
  UNPROTECT(4);

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_distances_bellman_ford              /
/-------------------------------------------*/
SEXP R_igraph_distances_bellman_ford(SEXP graph, SEXP from, SEXP to, SEXP weights, SEXP mode) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_matrix_t c_res;
  igraph_vs_t c_from;
  igraph_vs_t c_to;
  igraph_vector_t c_weights;
  igraph_neimode_t c_mode;
  SEXP res;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_matrix_init(&c_res, 0, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_matrix_destroy, &c_res);
  if (!Rf_isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
  c_mode = (igraph_neimode_t) Rf_asInteger(mode);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_distances_bellman_ford(&c_graph, &c_res, c_from, c_to, (Rf_isNull(weights) ? 0 : &c_weights), c_mode));

                                        /* Convert output */
  PROTECT(res=R_igraph_matrix_to_SEXP(&c_res));
  igraph_matrix_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = res;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_distances_johnson                   /
/-------------------------------------------*/
SEXP R_igraph_distances_johnson(SEXP graph, SEXP from, SEXP to, SEXP weights) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_matrix_t c_res;
  igraph_vs_t c_from;
  igraph_vs_t c_to;
  igraph_vector_t c_weights;
  SEXP res;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_matrix_init(&c_res, 0, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_matrix_destroy, &c_res);
  if (!Rf_isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_distances_johnson(&c_graph, &c_res, c_from, c_to, (Rf_isNull(weights) ? 0 : &c_weights)));

                                        /* Convert output */
  PROTECT(res=R_igraph_matrix_to_SEXP(&c_res));
  igraph_matrix_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = res;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_distances_floyd_warshall            /
/-------------------------------------------*/
SEXP R_igraph_distances_floyd_warshall(SEXP graph, SEXP from, SEXP to, SEXP weights, SEXP mode, SEXP method) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_matrix_t c_res;
  igraph_vs_t c_from;
  igraph_vs_t c_to;
  igraph_vector_t c_weights;
  igraph_neimode_t c_mode;
  igraph_floyd_warshall_algorithm_t c_method;
  SEXP res;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_matrix_init(&c_res, 0, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_matrix_destroy, &c_res);
  if (!Rf_isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
  c_mode = (igraph_neimode_t) Rf_asInteger(mode);
  c_method = (igraph_floyd_warshall_algorithm_t) Rf_asInteger(method);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_distances_floyd_warshall(&c_graph, &c_res, c_from, c_to, (Rf_isNull(weights) ? 0 : &c_weights), c_mode, c_method));

                                        /* Convert output */
  PROTECT(res=R_igraph_matrix_to_SEXP(&c_res));
  igraph_matrix_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = res;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_voronoi                             /
/-------------------------------------------*/
SEXP R_igraph_voronoi(SEXP graph, SEXP generators, SEXP weights, SEXP mode, SEXP tiebreaker) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_int_t c_membership;
  igraph_vector_t c_distances;
  igraph_vector_int_t c_generators;
  igraph_vector_t c_weights;
  igraph_neimode_t c_mode;
  igraph_voronoi_tiebreaker_t c_tiebreaker;
  SEXP membership;
  SEXP distances;

  SEXP r_result, r_names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_int_init(&c_membership, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_membership);
  if (0 != igraph_vector_init(&c_distances, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_distances);
  R_SEXP_to_vector_int(generators, &c_generators);
  if (!Rf_isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
  c_mode = (igraph_neimode_t) Rf_asInteger(mode);
  c_tiebreaker = (igraph_voronoi_tiebreaker_t) Rf_asInteger(tiebreaker);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_voronoi(&c_graph, &c_membership, &c_distances, &c_generators, (Rf_isNull(weights) ? 0 : &c_weights), c_mode, c_tiebreaker));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(2));
  PROTECT(r_names=NEW_CHARACTER(2));
  PROTECT(membership=R_igraph_vector_int_to_SEXP(&c_membership));
  igraph_vector_int_destroy(&c_membership);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(distances=R_igraph_vector_to_SEXP(&c_distances));
  igraph_vector_destroy(&c_distances);
  IGRAPH_FINALLY_CLEAN(1);
  SET_VECTOR_ELT(r_result, 0, membership);
  SET_VECTOR_ELT(r_result, 1, distances);
  SET_STRING_ELT(r_names, 0, Rf_mkChar("membership"));
  SET_STRING_ELT(r_names, 1, Rf_mkChar("distances"));
  SET_NAMES(r_result, r_names);
  UNPROTECT(3);

  UNPROTECT(1);
  return(r_result);
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

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_int_init(&c_res, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_res);
  c_from = (igraph_integer_t) REAL(from)[0];
  c_cutoff=INTEGER(cutoff)[0];
  c_mode = (igraph_neimode_t) Rf_asInteger(mode);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_get_all_simple_paths(&c_graph, &c_res, c_from, c_to, c_cutoff, c_mode));

                                        /* Convert output */
  PROTECT(res=R_igraph_vector_int_to_SEXP(&c_res));
  igraph_vector_int_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = res;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_get_k_shortest_paths                /
/-------------------------------------------*/
SEXP R_igraph_get_k_shortest_paths(SEXP graph, SEXP weights, SEXP k, SEXP from, SEXP to, SEXP mode) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_t c_weights;
  igraph_vector_int_list_t c_vertex_paths;
  igraph_vector_int_list_t c_edge_paths;
  igraph_integer_t c_k;
  igraph_integer_t c_from;
  igraph_integer_t c_to;
  igraph_neimode_t c_mode;
  SEXP vertex_paths;
  SEXP edge_paths;

  SEXP r_result, r_names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (!Rf_isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
  if (0 != igraph_vector_int_list_init(&c_vertex_paths, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_list_destroy, &c_vertex_paths);
  if (0 != igraph_vector_int_list_init(&c_edge_paths, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_list_destroy, &c_edge_paths);
  c_k=INTEGER(k)[0];
  c_from = (igraph_integer_t) REAL(from)[0];
  c_to = (igraph_integer_t) REAL(to)[0];
  c_mode = (igraph_neimode_t) Rf_asInteger(mode);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_get_k_shortest_paths(&c_graph, (Rf_isNull(weights) ? 0 : &c_weights), &c_vertex_paths, &c_edge_paths, c_k, c_from, c_to, c_mode));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(2));
  PROTECT(r_names=NEW_CHARACTER(2));
  PROTECT(vertex_paths=R_igraph_vectorlist_int_to_SEXP(&c_vertex_paths));
  igraph_vector_int_list_destroy(&c_vertex_paths);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(edge_paths=R_igraph_vectorlist_int_to_SEXP(&c_edge_paths));
  igraph_vector_int_list_destroy(&c_edge_paths);
  IGRAPH_FINALLY_CLEAN(1);
  SET_VECTOR_ELT(r_result, 0, vertex_paths);
  SET_VECTOR_ELT(r_result, 1, edge_paths);
  SET_STRING_ELT(r_names, 0, Rf_mkChar("vertex_paths"));
  SET_STRING_ELT(r_names, 1, Rf_mkChar("edge_paths"));
  SET_NAMES(r_result, r_names);
  UNPROTECT(3);

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_get_widest_path                     /
/-------------------------------------------*/
SEXP R_igraph_get_widest_path(SEXP graph, SEXP from, SEXP to, SEXP weights, SEXP mode) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_int_t c_vertices;
  igraph_vector_int_t c_edges;
  igraph_integer_t c_from;
  igraph_integer_t c_to;
  igraph_vector_t c_weights;
  igraph_neimode_t c_mode;
  SEXP vertices;
  SEXP edges;

  SEXP r_result, r_names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_int_init(&c_vertices, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_vertices);
  if (0 != igraph_vector_int_init(&c_edges, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_edges);
  c_from = (igraph_integer_t) REAL(from)[0];
  c_to = (igraph_integer_t) REAL(to)[0];
  if (!Rf_isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
  c_mode = (igraph_neimode_t) Rf_asInteger(mode);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_get_widest_path(&c_graph, &c_vertices, &c_edges, c_from, c_to, (Rf_isNull(weights) ? 0 : &c_weights), c_mode));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(2));
  PROTECT(r_names=NEW_CHARACTER(2));
  PROTECT(vertices=R_igraph_vector_int_to_SEXP(&c_vertices));
  igraph_vector_int_destroy(&c_vertices);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(edges=R_igraph_vector_int_to_SEXP(&c_edges));
  igraph_vector_int_destroy(&c_edges);
  IGRAPH_FINALLY_CLEAN(1);
  SET_VECTOR_ELT(r_result, 0, vertices);
  SET_VECTOR_ELT(r_result, 1, edges);
  SET_STRING_ELT(r_names, 0, Rf_mkChar("vertices"));
  SET_STRING_ELT(r_names, 1, Rf_mkChar("edges"));
  SET_NAMES(r_result, r_names);
  UNPROTECT(3);

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_get_widest_paths                    /
/-------------------------------------------*/
SEXP R_igraph_get_widest_paths(SEXP graph, SEXP from, SEXP to, SEXP weights, SEXP mode) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_int_list_t c_vertices;
  igraph_vector_int_list_t c_edges;
  igraph_integer_t c_from;
  igraph_vs_t c_to;
  igraph_vector_t c_weights;
  igraph_neimode_t c_mode;
  igraph_vector_int_t c_parents;
  igraph_vector_int_t c_inbound_edges;
  SEXP vertices;
  SEXP edges;
  SEXP parents;
  SEXP inbound_edges;

  SEXP r_result, r_names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_int_list_init(&c_vertices, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_list_destroy, &c_vertices);
  if (0 != igraph_vector_int_list_init(&c_edges, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_list_destroy, &c_edges);
  c_from = (igraph_integer_t) REAL(from)[0];
  if (!Rf_isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
  c_mode = (igraph_neimode_t) Rf_asInteger(mode);
  if (0 != igraph_vector_int_init(&c_parents, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_parents);
  if (0 != igraph_vector_int_init(&c_inbound_edges, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_inbound_edges);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_get_widest_paths(&c_graph, &c_vertices, &c_edges, c_from, c_to, (Rf_isNull(weights) ? 0 : &c_weights), c_mode, &c_parents, &c_inbound_edges));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(4));
  PROTECT(r_names=NEW_CHARACTER(4));
  PROTECT(vertices=R_igraph_vectorlist_int_to_SEXP(&c_vertices));
  igraph_vector_int_list_destroy(&c_vertices);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(edges=R_igraph_vectorlist_int_to_SEXP(&c_edges));
  igraph_vector_int_list_destroy(&c_edges);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(parents=R_igraph_vector_int_to_SEXP(&c_parents));
  igraph_vector_int_destroy(&c_parents);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(inbound_edges=R_igraph_vector_int_to_SEXP(&c_inbound_edges));
  igraph_vector_int_destroy(&c_inbound_edges);
  IGRAPH_FINALLY_CLEAN(1);
  SET_VECTOR_ELT(r_result, 0, vertices);
  SET_VECTOR_ELT(r_result, 1, edges);
  SET_VECTOR_ELT(r_result, 2, parents);
  SET_VECTOR_ELT(r_result, 3, inbound_edges);
  SET_STRING_ELT(r_names, 0, Rf_mkChar("vertices"));
  SET_STRING_ELT(r_names, 1, Rf_mkChar("edges"));
  SET_STRING_ELT(r_names, 2, Rf_mkChar("parents"));
  SET_STRING_ELT(r_names, 3, Rf_mkChar("inbound_edges"));
  SET_NAMES(r_result, r_names);
  UNPROTECT(5);

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_widest_path_widths_dijkstra         /
/-------------------------------------------*/
SEXP R_igraph_widest_path_widths_dijkstra(SEXP graph, SEXP from, SEXP to, SEXP weights, SEXP mode) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_matrix_t c_res;
  igraph_vs_t c_from;
  igraph_vs_t c_to;
  igraph_vector_t c_weights;
  igraph_neimode_t c_mode;
  SEXP res;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_matrix_init(&c_res, 0, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_matrix_destroy, &c_res);
  if (!Rf_isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
  c_mode = (igraph_neimode_t) Rf_asInteger(mode);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_widest_path_widths_dijkstra(&c_graph, &c_res, c_from, c_to, (Rf_isNull(weights) ? 0 : &c_weights), c_mode));

                                        /* Convert output */
  PROTECT(res=R_igraph_matrix_to_SEXP(&c_res));
  igraph_matrix_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = res;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_widest_path_widths_floyd_warshall   /
/-------------------------------------------*/
SEXP R_igraph_widest_path_widths_floyd_warshall(SEXP graph, SEXP from, SEXP to, SEXP weights, SEXP mode) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_matrix_t c_res;
  igraph_vs_t c_from;
  igraph_vs_t c_to;
  igraph_vector_t c_weights;
  igraph_neimode_t c_mode;
  SEXP res;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_matrix_init(&c_res, 0, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_matrix_destroy, &c_res);
  if (!Rf_isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
  c_mode = (igraph_neimode_t) Rf_asInteger(mode);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_widest_path_widths_floyd_warshall(&c_graph, &c_res, c_from, c_to, (Rf_isNull(weights) ? 0 : &c_weights), c_mode));

                                        /* Convert output */
  PROTECT(res=R_igraph_matrix_to_SEXP(&c_res));
  igraph_matrix_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = res;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_spanner                             /
/-------------------------------------------*/
SEXP R_igraph_spanner(SEXP graph, SEXP stretch, SEXP weights) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_int_t c_spanner;
  igraph_real_t c_stretch;
  igraph_vector_t c_weights;
  SEXP spanner;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_int_init(&c_spanner, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_spanner);
  c_stretch=REAL(stretch)[0];
  if (!Rf_isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_spanner(&c_graph, &c_spanner, c_stretch, (Rf_isNull(weights) ? 0 : &c_weights)));

                                        /* Convert output */
  PROTECT(spanner=R_igraph_vector_int_to_SEXP(&c_spanner));
  igraph_vector_int_destroy(&c_spanner);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = spanner;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_betweenness_cutoff                  /
/-------------------------------------------*/
SEXP R_igraph_betweenness_cutoff(SEXP graph, SEXP vids, SEXP directed, SEXP weights, SEXP cutoff) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_t c_res;
  igraph_vs_t c_vids;
  igraph_bool_t c_directed;
  igraph_vector_t c_weights;
  igraph_real_t c_cutoff;
  SEXP res;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_init(&c_res, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_res);
  c_directed=LOGICAL(directed)[0];
  if (!Rf_isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
  c_cutoff=REAL(cutoff)[0];
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_betweenness_cutoff(&c_graph, &c_res, c_vids, c_directed, (Rf_isNull(weights) ? 0 : &c_weights), c_cutoff));

                                        /* Convert output */
  PROTECT(res=R_igraph_vector_to_SEXP(&c_res));
  igraph_vector_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = res;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_betweenness_subset                  /
/-------------------------------------------*/
SEXP R_igraph_betweenness_subset(SEXP graph, SEXP vids, SEXP directed, SEXP sources, SEXP targets, SEXP weights) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_t c_res;
  igraph_vs_t c_vids;
  igraph_bool_t c_directed;
  igraph_vs_t c_sources;
  igraph_vs_t c_targets;
  igraph_vector_t c_weights;
  SEXP res;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_init(&c_res, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_res);
  c_directed=LOGICAL(directed)[0];
  if (!Rf_isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_betweenness_subset(&c_graph, &c_res, c_vids, c_directed, c_sources, c_targets, (Rf_isNull(weights) ? 0 : &c_weights)));

                                        /* Convert output */
  PROTECT(res=R_igraph_vector_to_SEXP(&c_res));
  igraph_vector_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = res;

  UNPROTECT(1);
  return(r_result);
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

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_init(&c_res, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_res);
  c_directed=LOGICAL(directed)[0];
  if (!Rf_isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_edge_betweenness(&c_graph, &c_res, c_directed, (Rf_isNull(weights) ? 0 : &c_weights)));

                                        /* Convert output */
  PROTECT(res=R_igraph_vector_to_SEXP(&c_res));
  igraph_vector_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = res;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_edge_betweenness_cutoff             /
/-------------------------------------------*/
SEXP R_igraph_edge_betweenness_cutoff(SEXP graph, SEXP directed, SEXP weights, SEXP cutoff) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_t c_res;
  igraph_bool_t c_directed;
  igraph_vector_t c_weights;
  igraph_real_t c_cutoff;
  SEXP res;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_init(&c_res, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_res);
  c_directed=LOGICAL(directed)[0];
  if (!Rf_isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
  c_cutoff=REAL(cutoff)[0];
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_edge_betweenness_cutoff(&c_graph, &c_res, c_directed, (Rf_isNull(weights) ? 0 : &c_weights), c_cutoff));

                                        /* Convert output */
  PROTECT(res=R_igraph_vector_to_SEXP(&c_res));
  igraph_vector_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = res;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_edge_betweenness_subset             /
/-------------------------------------------*/
SEXP R_igraph_edge_betweenness_subset(SEXP graph, SEXP eids, SEXP directed, SEXP sources, SEXP targets, SEXP weights) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_t c_res;
  igraph_es_t c_eids;
  igraph_bool_t c_directed;
  igraph_vs_t c_sources;
  igraph_vs_t c_targets;
  igraph_vector_t c_weights;
  SEXP res;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_init(&c_res, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_res);
  c_directed=LOGICAL(directed)[0];
  if (!Rf_isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_edge_betweenness_subset(&c_graph, &c_res, c_eids, c_directed, c_sources, c_targets, (Rf_isNull(weights) ? 0 : &c_weights)));

                                        /* Convert output */
  PROTECT(res=R_igraph_vector_to_SEXP(&c_res));
  igraph_vector_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = res;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_harmonic_centrality_cutoff          /
/-------------------------------------------*/
SEXP R_igraph_harmonic_centrality_cutoff(SEXP graph, SEXP vids, SEXP mode, SEXP weights, SEXP normalized, SEXP cutoff) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_t c_res;
  igraph_vs_t c_vids;
  igraph_neimode_t c_mode;
  igraph_vector_t c_weights;
  igraph_bool_t c_normalized;
  igraph_real_t c_cutoff;
  SEXP res;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_init(&c_res, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_res);
  c_mode = (igraph_neimode_t) Rf_asInteger(mode);
  if (!Rf_isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
  c_normalized=LOGICAL(normalized)[0];
  c_cutoff=REAL(cutoff)[0];
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_harmonic_centrality_cutoff(&c_graph, &c_res, c_vids, c_mode, (Rf_isNull(weights) ? 0 : &c_weights), c_normalized, c_cutoff));

                                        /* Convert output */
  PROTECT(res=R_igraph_vector_to_SEXP(&c_res));
  igraph_vector_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = res;

  UNPROTECT(1);
  return(r_result);
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
  igraph_arpack_options_t c_options1;
  void* c_options;
  SEXP vector;
  SEXP value;

  SEXP r_result, r_names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  c_algo = (igraph_pagerank_algo_t) Rf_asInteger(algo);
  if (0 != igraph_vector_init(&c_vector, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_vector);
  c_directed=LOGICAL(directed)[0];
  c_damping=REAL(damping)[0];
  R_SEXP_to_vector(personalized, &c_personalized);
  if (!Rf_isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
  if (c_algo == IGRAPH_PAGERANK_ALGO_ARPACK) {
    R_SEXP_to_igraph_arpack_options(options, &c_options1);
    c_options = &c_options1;
  } else {
    c_options = 0;
  }
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_personalized_pagerank(&c_graph, c_algo, &c_vector, &c_value, c_vids, c_directed, c_damping, &c_personalized, (Rf_isNull(weights) ? 0 : &c_weights), c_options));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(3));
  PROTECT(r_names=NEW_CHARACTER(3));
  PROTECT(vector=R_igraph_vector_to_SEXP(&c_vector));
  igraph_vector_destroy(&c_vector);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(value=NEW_NUMERIC(1));
  REAL(value)[0]=c_value;
  if (c_algo == IGRAPH_PAGERANK_ALGO_ARPACK) {
    PROTECT(options = R_igraph_arpack_options_to_SEXP(&c_options1));
  } else {
    PROTECT(options);
  }
  SET_VECTOR_ELT(r_result, 0, vector);
  SET_VECTOR_ELT(r_result, 1, value);
  SET_VECTOR_ELT(r_result, 2, options);
  SET_STRING_ELT(r_names, 0, Rf_mkChar("vector"));
  SET_STRING_ELT(r_names, 1, Rf_mkChar("value"));
  SET_STRING_ELT(r_names, 2, Rf_mkChar("options"));
  SET_NAMES(r_result, r_names);
  UNPROTECT(4);

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_personalized_pagerank_vs            /
/-------------------------------------------*/
SEXP R_igraph_personalized_pagerank_vs(SEXP graph, SEXP algo, SEXP vids, SEXP directed, SEXP damping, SEXP reset_vids, SEXP weights, SEXP options) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_pagerank_algo_t c_algo;
  igraph_vector_t c_vector;
  igraph_real_t c_value;
  igraph_vs_t c_vids;
  igraph_bool_t c_directed;
  igraph_real_t c_damping;
  igraph_vs_t c_reset_vids;
  igraph_vector_t c_weights;
  igraph_arpack_options_t c_options1;
  void* c_options;
  SEXP vector;
  SEXP value;

  SEXP r_result, r_names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  c_algo = (igraph_pagerank_algo_t) Rf_asInteger(algo);
  if (0 != igraph_vector_init(&c_vector, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_vector);
  c_directed=LOGICAL(directed)[0];
  c_damping=REAL(damping)[0];
  if (!Rf_isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
  if (c_algo == IGRAPH_PAGERANK_ALGO_ARPACK) {
    R_SEXP_to_igraph_arpack_options(options, &c_options1);
    c_options = &c_options1;
  } else {
    c_options = 0;
  }
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_personalized_pagerank_vs(&c_graph, c_algo, &c_vector, &c_value, c_vids, c_directed, c_damping, c_reset_vids, (Rf_isNull(weights) ? 0 : &c_weights), c_options));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(3));
  PROTECT(r_names=NEW_CHARACTER(3));
  PROTECT(vector=R_igraph_vector_to_SEXP(&c_vector));
  igraph_vector_destroy(&c_vector);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(value=NEW_NUMERIC(1));
  REAL(value)[0]=c_value;
  if (c_algo == IGRAPH_PAGERANK_ALGO_ARPACK) {
    PROTECT(options = R_igraph_arpack_options_to_SEXP(&c_options1));
  } else {
    PROTECT(options);
  }
  SET_VECTOR_ELT(r_result, 0, vector);
  SET_VECTOR_ELT(r_result, 1, value);
  SET_VECTOR_ELT(r_result, 2, options);
  SET_STRING_ELT(r_names, 0, Rf_mkChar("vector"));
  SET_STRING_ELT(r_names, 1, Rf_mkChar("value"));
  SET_STRING_ELT(r_names, 2, Rf_mkChar("options"));
  SET_NAMES(r_result, r_names);
  UNPROTECT(4);

  UNPROTECT(1);
  return(r_result);
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

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  c_impl = (igraph_subgraph_implementation_t) Rf_asInteger(impl);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_induced_subgraph(&c_graph, &c_res, c_vids, c_impl));

                                        /* Convert output */
  IGRAPH_FINALLY(igraph_destroy, &c_res);
  PROTECT(res=R_igraph_to_SEXP(&c_res));
  igraph_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = res;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_subgraph_from_edges                 /
/-------------------------------------------*/
SEXP R_igraph_subgraph_from_edges(SEXP graph, SEXP eids, SEXP delete_vertices) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_t c_res;
  igraph_es_t c_eids;
  igraph_bool_t c_delete_vertices;
  SEXP res;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  c_delete_vertices=LOGICAL(delete_vertices)[0];
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_subgraph_from_edges(&c_graph, &c_res, c_eids, c_delete_vertices));

                                        /* Convert output */
  IGRAPH_FINALLY(igraph_destroy, &c_res);
  PROTECT(res=R_igraph_to_SEXP(&c_res));
  igraph_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = res;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_reverse_edges                       /
/-------------------------------------------*/
SEXP R_igraph_reverse_edges(SEXP graph, SEXP eids) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_es_t c_eids;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph_copy(graph, &c_graph);
  IGRAPH_FINALLY(igraph_destroy, &c_graph);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_reverse_edges(&c_graph, c_eids));

                                        /* Convert output */
  PROTECT(graph=R_igraph_to_SEXP(&c_graph));
  igraph_destroy(&c_graph);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = graph;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_average_path_length_dijkstra        /
/-------------------------------------------*/
SEXP R_igraph_average_path_length_dijkstra(SEXP graph, SEXP weights, SEXP directed, SEXP unconn) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_real_t c_res;
  igraph_real_t c_unconn_pairs;
  igraph_vector_t c_weights;
  igraph_bool_t c_directed;
  igraph_bool_t c_unconn;
  SEXP res;
  SEXP unconn_pairs;

  SEXP r_result, r_names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (!Rf_isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
  c_directed=LOGICAL(directed)[0];
  c_unconn=LOGICAL(unconn)[0];
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_average_path_length_dijkstra(&c_graph, &c_res, &c_unconn_pairs, (Rf_isNull(weights) ? 0 : &c_weights), c_directed, c_unconn));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(2));
  PROTECT(r_names=NEW_CHARACTER(2));
  PROTECT(res=NEW_NUMERIC(1));
  REAL(res)[0]=c_res;
  PROTECT(unconn_pairs=NEW_NUMERIC(1));
  REAL(unconn_pairs)[0]=c_unconn_pairs;
  SET_VECTOR_ELT(r_result, 0, res);
  SET_VECTOR_ELT(r_result, 1, unconn_pairs);
  SET_STRING_ELT(r_names, 0, Rf_mkChar("res"));
  SET_STRING_ELT(r_names, 1, Rf_mkChar("unconnected"));
  SET_NAMES(r_result, r_names);
  UNPROTECT(3);

  UNPROTECT(1);
  return(r_result);
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

  SEXP r_result, r_names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_init(&c_res, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_res);
  c_directed=LOGICAL(directed)[0];
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_path_length_hist(&c_graph, &c_res, &c_unconnected, c_directed));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(2));
  PROTECT(r_names=NEW_CHARACTER(2));
  PROTECT(res=R_igraph_vector_to_SEXP(&c_res));
  igraph_vector_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(unconnected=NEW_NUMERIC(1));
  REAL(unconnected)[0]=c_unconnected;
  SET_VECTOR_ELT(r_result, 0, res);
  SET_VECTOR_ELT(r_result, 1, unconnected);
  SET_STRING_ELT(r_names, 0, Rf_mkChar("res"));
  SET_STRING_ELT(r_names, 1, Rf_mkChar("unconnected"));
  SET_NAMES(r_result, r_names);
  UNPROTECT(3);

  UNPROTECT(1);
  return(r_result);
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

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph_copy(graph, &c_graph);
  IGRAPH_FINALLY(igraph_destroy, &c_graph);
  c_remove_multiple=LOGICAL(remove_multiple)[0];
  c_remove_loops=LOGICAL(remove_loops)[0];
  R_SEXP_to_attr_comb(edge_attr_comb, &c_edge_attr_comb);
  IGRAPH_FINALLY(igraph_attribute_combination_destroy, &c_edge_attr_comb);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_simplify(&c_graph, c_remove_multiple, c_remove_loops, &c_edge_attr_comb));

                                        /* Convert output */
  PROTECT(graph=R_igraph_to_SEXP(&c_graph));
  igraph_destroy(&c_graph);
  IGRAPH_FINALLY_CLEAN(1);
  igraph_attribute_combination_destroy(&c_edge_attr_comb);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = graph;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_ecc                                 /
/-------------------------------------------*/
SEXP R_igraph_ecc(SEXP graph, SEXP eids, SEXP k, SEXP offset, SEXP normalize) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_t c_res;
  igraph_es_t c_eids;
  igraph_integer_t c_k;
  igraph_bool_t c_offset;
  igraph_bool_t c_normalize;
  SEXP res;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_init(&c_res, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_res);
  c_k=INTEGER(k)[0];
  c_offset=LOGICAL(offset)[0];
  c_normalize=LOGICAL(normalize)[0];
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_ecc(&c_graph, &c_res, c_eids, c_k, c_offset, c_normalize));

                                        /* Convert output */
  PROTECT(res=R_igraph_vector_to_SEXP(&c_res));
  igraph_vector_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = res;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_feedback_arc_set                    /
/-------------------------------------------*/
SEXP R_igraph_feedback_arc_set(SEXP graph, SEXP weights, SEXP algo) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_int_t c_result;
  igraph_vector_t c_weights;
  igraph_fas_algorithm_t c_algo;
  SEXP result;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_int_init(&c_result, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_result);
  if (!Rf_isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
  c_algo = (igraph_fas_algorithm_t) Rf_asInteger(algo);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_feedback_arc_set(&c_graph, &c_result, (Rf_isNull(weights) ? 0 : &c_weights), c_algo));

                                        /* Convert output */
  PROTECT(result=R_igraph_vector_int_to_SEXP(&c_result));
  igraph_vector_int_destroy(&c_result);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = result;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_is_loop                             /
/-------------------------------------------*/
SEXP R_igraph_is_loop(SEXP graph, SEXP es) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_bool_t c_res;
  igraph_es_t c_es;
  SEXP res;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_bool_init(&c_res, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_bool_destroy, &c_res);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_is_loop(&c_graph, &c_res, c_es));

                                        /* Convert output */
  PROTECT(res=R_igraph_vector_bool_to_SEXP(&c_res));
  igraph_vector_bool_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = res;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_is_dag                              /
/-------------------------------------------*/
SEXP R_igraph_is_dag(SEXP graph) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_bool_t c_res;
  SEXP res;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_is_dag(&c_graph, &c_res));

                                        /* Convert output */
  PROTECT(res=NEW_LOGICAL(1));
  LOGICAL(res)[0]=c_res;
  r_result = res;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_is_acyclic                          /
/-------------------------------------------*/
SEXP R_igraph_is_acyclic(SEXP graph) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_bool_t c_res;
  SEXP res;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_is_acyclic(&c_graph, &c_res));

                                        /* Convert output */
  PROTECT(res=NEW_LOGICAL(1));
  LOGICAL(res)[0]=c_res;
  r_result = res;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_is_simple                           /
/-------------------------------------------*/
SEXP R_igraph_is_simple(SEXP graph) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_bool_t c_res;
  SEXP res;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_is_simple(&c_graph, &c_res));

                                        /* Convert output */
  PROTECT(res=NEW_LOGICAL(1));
  LOGICAL(res)[0]=c_res;
  r_result = res;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_is_multiple                         /
/-------------------------------------------*/
SEXP R_igraph_is_multiple(SEXP graph, SEXP es) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_bool_t c_res;
  igraph_es_t c_es;
  SEXP res;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_bool_init(&c_res, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_bool_destroy, &c_res);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_is_multiple(&c_graph, &c_res, c_es));

                                        /* Convert output */
  PROTECT(res=R_igraph_vector_bool_to_SEXP(&c_res));
  igraph_vector_bool_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = res;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_has_loop                            /
/-------------------------------------------*/
SEXP R_igraph_has_loop(SEXP graph) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_bool_t c_res;
  SEXP res;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_has_loop(&c_graph, &c_res));

                                        /* Convert output */
  PROTECT(res=NEW_LOGICAL(1));
  LOGICAL(res)[0]=c_res;
  r_result = res;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_has_multiple                        /
/-------------------------------------------*/
SEXP R_igraph_has_multiple(SEXP graph) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_bool_t c_res;
  SEXP res;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_has_multiple(&c_graph, &c_res));

                                        /* Convert output */
  PROTECT(res=NEW_LOGICAL(1));
  LOGICAL(res)[0]=c_res;
  r_result = res;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_count_multiple                      /
/-------------------------------------------*/
SEXP R_igraph_count_multiple(SEXP graph, SEXP es) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_int_t c_res;
  igraph_es_t c_es;
  SEXP res;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_int_init(&c_res, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_res);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_count_multiple(&c_graph, &c_res, c_es));

                                        /* Convert output */
  PROTECT(res=R_igraph_vector_int_to_SEXP(&c_res));
  igraph_vector_int_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = res;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_is_perfect                          /
/-------------------------------------------*/
SEXP R_igraph_is_perfect(SEXP graph) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_bool_t c_res;
  SEXP res;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_is_perfect(&c_graph, &c_res));

                                        /* Convert output */
  PROTECT(res=NEW_LOGICAL(1));
  LOGICAL(res)[0]=c_res;
  r_result = res;

  UNPROTECT(1);
  return(r_result);
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

  SEXP r_result, r_names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_init(&c_vector, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_vector);
  c_directed=LOGICAL(directed)[0];
  c_scale=LOGICAL(scale)[0];
  if (!Rf_isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
  R_SEXP_to_igraph_arpack_options(options, &c_options);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_eigenvector_centrality(&c_graph, &c_vector, &c_value, c_directed, c_scale, (Rf_isNull(weights) ? 0 : &c_weights), &c_options));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(3));
  PROTECT(r_names=NEW_CHARACTER(3));
  PROTECT(vector=R_igraph_vector_to_SEXP(&c_vector));
  igraph_vector_destroy(&c_vector);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(value=NEW_NUMERIC(1));
  REAL(value)[0]=c_value;
  PROTECT(options=R_igraph_arpack_options_to_SEXP(&c_options));
  SET_VECTOR_ELT(r_result, 0, vector);
  SET_VECTOR_ELT(r_result, 1, value);
  SET_VECTOR_ELT(r_result, 2, options);
  SET_STRING_ELT(r_names, 0, Rf_mkChar("vector"));
  SET_STRING_ELT(r_names, 1, Rf_mkChar("value"));
  SET_STRING_ELT(r_names, 2, Rf_mkChar("options"));
  SET_NAMES(r_result, r_names);
  UNPROTECT(4);

  UNPROTECT(1);
  return(r_result);
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

  SEXP r_result, r_names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_init(&c_vector, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_vector);
  c_scale=LOGICAL(scale)[0];
  if (!Rf_isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
  R_SEXP_to_igraph_arpack_options(options, &c_options);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_hub_score(&c_graph, &c_vector, &c_value, c_scale, (Rf_isNull(weights) ? 0 : &c_weights), &c_options));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(3));
  PROTECT(r_names=NEW_CHARACTER(3));
  PROTECT(vector=R_igraph_vector_to_SEXP(&c_vector));
  igraph_vector_destroy(&c_vector);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(value=NEW_NUMERIC(1));
  REAL(value)[0]=c_value;
  PROTECT(options=R_igraph_arpack_options_to_SEXP(&c_options));
  SET_VECTOR_ELT(r_result, 0, vector);
  SET_VECTOR_ELT(r_result, 1, value);
  SET_VECTOR_ELT(r_result, 2, options);
  SET_STRING_ELT(r_names, 0, Rf_mkChar("vector"));
  SET_STRING_ELT(r_names, 1, Rf_mkChar("value"));
  SET_STRING_ELT(r_names, 2, Rf_mkChar("options"));
  SET_NAMES(r_result, r_names);
  UNPROTECT(4);

  UNPROTECT(1);
  return(r_result);
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

  SEXP r_result, r_names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_init(&c_vector, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_vector);
  c_scale=LOGICAL(scale)[0];
  if (!Rf_isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
  R_SEXP_to_igraph_arpack_options(options, &c_options);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_authority_score(&c_graph, &c_vector, &c_value, c_scale, (Rf_isNull(weights) ? 0 : &c_weights), &c_options));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(3));
  PROTECT(r_names=NEW_CHARACTER(3));
  PROTECT(vector=R_igraph_vector_to_SEXP(&c_vector));
  igraph_vector_destroy(&c_vector);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(value=NEW_NUMERIC(1));
  REAL(value)[0]=c_value;
  PROTECT(options=R_igraph_arpack_options_to_SEXP(&c_options));
  SET_VECTOR_ELT(r_result, 0, vector);
  SET_VECTOR_ELT(r_result, 1, value);
  SET_VECTOR_ELT(r_result, 2, options);
  SET_STRING_ELT(r_names, 0, Rf_mkChar("vector"));
  SET_STRING_ELT(r_names, 1, Rf_mkChar("value"));
  SET_STRING_ELT(r_names, 2, Rf_mkChar("options"));
  SET_NAMES(r_result, r_names);
  UNPROTECT(4);

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_hub_and_authority_scores            /
/-------------------------------------------*/
SEXP R_igraph_hub_and_authority_scores(SEXP graph, SEXP scale, SEXP weights, SEXP options) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_t c_hub_vector;
  igraph_vector_t c_authority_vector;
  igraph_real_t c_value;
  igraph_bool_t c_scale;
  igraph_vector_t c_weights;
  igraph_arpack_options_t c_options;
  SEXP hub_vector;
  SEXP authority_vector;
  SEXP value;

  SEXP r_result, r_names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_init(&c_hub_vector, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_hub_vector);
  if (0 != igraph_vector_init(&c_authority_vector, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_authority_vector);
  c_scale=LOGICAL(scale)[0];
  if (!Rf_isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
  R_SEXP_to_igraph_arpack_options(options, &c_options);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_hub_and_authority_scores(&c_graph, &c_hub_vector, &c_authority_vector, &c_value, c_scale, (Rf_isNull(weights) ? 0 : &c_weights), &c_options));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(4));
  PROTECT(r_names=NEW_CHARACTER(4));
  PROTECT(hub_vector=R_igraph_vector_to_SEXP(&c_hub_vector));
  igraph_vector_destroy(&c_hub_vector);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(authority_vector=R_igraph_vector_to_SEXP(&c_authority_vector));
  igraph_vector_destroy(&c_authority_vector);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(value=NEW_NUMERIC(1));
  REAL(value)[0]=c_value;
  PROTECT(options=R_igraph_arpack_options_to_SEXP(&c_options));
  SET_VECTOR_ELT(r_result, 0, hub_vector);
  SET_VECTOR_ELT(r_result, 1, authority_vector);
  SET_VECTOR_ELT(r_result, 2, value);
  SET_VECTOR_ELT(r_result, 3, options);
  SET_STRING_ELT(r_names, 0, Rf_mkChar("hub_vector"));
  SET_STRING_ELT(r_names, 1, Rf_mkChar("authority_vector"));
  SET_STRING_ELT(r_names, 2, Rf_mkChar("value"));
  SET_STRING_ELT(r_names, 3, Rf_mkChar("options"));
  SET_NAMES(r_result, r_names);
  UNPROTECT(5);

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_unfold_tree                         /
/-------------------------------------------*/
SEXP R_igraph_unfold_tree(SEXP graph, SEXP mode, SEXP roots) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_t c_tree;
  igraph_neimode_t c_mode;
  igraph_vector_int_t c_roots;
  igraph_vector_int_t c_vertex_index;
  SEXP tree;
  SEXP vertex_index;

  SEXP r_result, r_names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  c_mode = (igraph_neimode_t) Rf_asInteger(mode);
  R_SEXP_to_vector_int(roots, &c_roots);
  if (0 != igraph_vector_int_init(&c_vertex_index, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_vertex_index);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_unfold_tree(&c_graph, &c_tree, c_mode, &c_roots, &c_vertex_index));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(2));
  PROTECT(r_names=NEW_CHARACTER(2));
  IGRAPH_FINALLY(igraph_destroy, &c_tree);
  PROTECT(tree=R_igraph_to_SEXP(&c_tree));
  igraph_destroy(&c_tree);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(vertex_index=R_igraph_vector_int_to_SEXP(&c_vertex_index));
  igraph_vector_int_destroy(&c_vertex_index);
  IGRAPH_FINALLY_CLEAN(1);
  SET_VECTOR_ELT(r_result, 0, tree);
  SET_VECTOR_ELT(r_result, 1, vertex_index);
  SET_STRING_ELT(r_names, 0, Rf_mkChar("tree"));
  SET_STRING_ELT(r_names, 1, Rf_mkChar("vertex_index"));
  SET_NAMES(r_result, r_names);
  UNPROTECT(3);

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_is_mutual                           /
/-------------------------------------------*/
SEXP R_igraph_is_mutual(SEXP graph, SEXP es, SEXP loops) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_bool_t c_res;
  igraph_es_t c_es;
  igraph_bool_t c_loops;
  SEXP res;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_bool_init(&c_res, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_bool_destroy, &c_res);
  c_loops=LOGICAL(loops)[0];
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_is_mutual(&c_graph, &c_res, c_es, c_loops));

                                        /* Convert output */
  PROTECT(res=R_igraph_vector_bool_to_SEXP(&c_res));
  igraph_vector_bool_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = res;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_has_mutual                          /
/-------------------------------------------*/
SEXP R_igraph_has_mutual(SEXP graph, SEXP loops) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_bool_t c_res;
  igraph_bool_t c_loops;
  SEXP res;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  c_loops=LOGICAL(loops)[0];
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_has_mutual(&c_graph, &c_res, c_loops));

                                        /* Convert output */
  PROTECT(res=NEW_LOGICAL(1));
  LOGICAL(res)[0]=c_res;
  r_result = res;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_maximum_cardinality_search          /
/-------------------------------------------*/
SEXP R_igraph_maximum_cardinality_search(SEXP graph) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_int_t c_alpha;
  igraph_vector_int_t c_alpham1;
  SEXP alpha;
  SEXP alpham1;

  SEXP r_result, r_names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_int_init(&c_alpha, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_alpha);
  if (0 != igraph_vector_int_init(&c_alpham1, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_alpham1);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_maximum_cardinality_search(&c_graph, &c_alpha, &c_alpham1));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(2));
  PROTECT(r_names=NEW_CHARACTER(2));
  PROTECT(alpha=R_igraph_vector_int_to_SEXP(&c_alpha));
  igraph_vector_int_destroy(&c_alpha);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(alpham1=R_igraph_vector_int_to_SEXP(&c_alpham1));
  igraph_vector_int_destroy(&c_alpham1);
  IGRAPH_FINALLY_CLEAN(1);
  SET_VECTOR_ELT(r_result, 0, alpha);
  SET_VECTOR_ELT(r_result, 1, alpham1);
  SET_STRING_ELT(r_names, 0, Rf_mkChar("alpha"));
  SET_STRING_ELT(r_names, 1, Rf_mkChar("alpham1"));
  SET_NAMES(r_result, r_names);
  UNPROTECT(3);

  UNPROTECT(1);
  return(r_result);
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

  SEXP r_result, r_names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  c_mode = (igraph_neimode_t) Rf_asInteger(mode);
  c_neighbor_degree_mode = (igraph_neimode_t) Rf_asInteger(neighbor_degree_mode);
  if (0 != igraph_vector_init(&c_knn, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_knn);
  if (0 != igraph_vector_init(&c_knnk, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_knnk);
  if (!Rf_isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_avg_nearest_neighbor_degree(&c_graph, c_vids, c_mode, c_neighbor_degree_mode, &c_knn, &c_knnk, (Rf_isNull(weights) ? 0 : &c_weights)));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(2));
  PROTECT(r_names=NEW_CHARACTER(2));
  PROTECT(knn=R_igraph_vector_to_SEXP(&c_knn));
  igraph_vector_destroy(&c_knn);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(knnk=R_igraph_vector_to_SEXP(&c_knnk));
  igraph_vector_destroy(&c_knnk);
  IGRAPH_FINALLY_CLEAN(1);
  SET_VECTOR_ELT(r_result, 0, knn);
  SET_VECTOR_ELT(r_result, 1, knnk);
  SET_STRING_ELT(r_names, 0, Rf_mkChar("knn"));
  SET_STRING_ELT(r_names, 1, Rf_mkChar("knnk"));
  SET_NAMES(r_result, r_names);
  UNPROTECT(3);

  UNPROTECT(1);
  return(r_result);
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

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_init(&c_res, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_res);
  c_mode = (igraph_neimode_t) Rf_asInteger(mode);
  c_loops=LOGICAL(loops)[0];
  if (!Rf_isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_strength(&c_graph, &c_res, c_vids, c_mode, c_loops, (Rf_isNull(weights) ? 0 : &c_weights)));

                                        /* Convert output */
  PROTECT(res=R_igraph_vector_to_SEXP(&c_res));
  igraph_vector_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = res;

  UNPROTECT(1);
  return(r_result);
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
  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_vector(scores, &c_scores);
  c_theoretical_max=REAL(theoretical_max)[0];
  c_normalized=LOGICAL(normalized)[0];
                                        /* Call igraph */
  c_result=igraph_centralization(&c_scores, c_theoretical_max, c_normalized);

                                        /* Convert output */

  PROTECT(r_result=NEW_NUMERIC(1));
  REAL(r_result)[0]=c_result;

  UNPROTECT(1);
  return(r_result);
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

  SEXP r_result, r_names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_init(&c_res, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_res);
  c_mode = (igraph_neimode_t) Rf_asInteger(mode);
  c_loops=LOGICAL(loops)[0];
  c_normalized=LOGICAL(normalized)[0];
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_centralization_degree(&c_graph, &c_res, c_mode, c_loops, &c_centralization, &c_theoretical_max, c_normalized));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(3));
  PROTECT(r_names=NEW_CHARACTER(3));
  PROTECT(res=R_igraph_vector_to_SEXP(&c_res));
  igraph_vector_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(centralization=NEW_NUMERIC(1));
  REAL(centralization)[0]=c_centralization;
  PROTECT(theoretical_max=NEW_NUMERIC(1));
  REAL(theoretical_max)[0]=c_theoretical_max;
  SET_VECTOR_ELT(r_result, 0, res);
  SET_VECTOR_ELT(r_result, 1, centralization);
  SET_VECTOR_ELT(r_result, 2, theoretical_max);
  SET_STRING_ELT(r_names, 0, Rf_mkChar("res"));
  SET_STRING_ELT(r_names, 1, Rf_mkChar("centralization"));
  SET_STRING_ELT(r_names, 2, Rf_mkChar("theoretical_max"));
  SET_NAMES(r_result, r_names);
  UNPROTECT(4);

  UNPROTECT(1);
  return(r_result);
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

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  c_nodes=INTEGER(nodes)[0];
  c_mode = (igraph_neimode_t) Rf_asInteger(mode);
  c_loops=LOGICAL(loops)[0];
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_centralization_degree_tmax(&c_graph, c_nodes, c_mode, c_loops, &c_res));

                                        /* Convert output */
  PROTECT(res=NEW_NUMERIC(1));
  REAL(res)[0]=c_res;
  r_result = res;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_centralization_betweenness          /
/-------------------------------------------*/
SEXP R_igraph_centralization_betweenness(SEXP graph, SEXP directed, SEXP normalized) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_t c_res;
  igraph_bool_t c_directed;
  igraph_real_t c_centralization;
  igraph_real_t c_theoretical_max;
  igraph_bool_t c_normalized;
  SEXP res;
  SEXP centralization;
  SEXP theoretical_max;

  SEXP r_result, r_names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_init(&c_res, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_res);
  c_directed=LOGICAL(directed)[0];
  c_normalized=LOGICAL(normalized)[0];
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_centralization_betweenness(&c_graph, &c_res, c_directed, &c_centralization, &c_theoretical_max, c_normalized));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(3));
  PROTECT(r_names=NEW_CHARACTER(3));
  PROTECT(res=R_igraph_vector_to_SEXP(&c_res));
  igraph_vector_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(centralization=NEW_NUMERIC(1));
  REAL(centralization)[0]=c_centralization;
  PROTECT(theoretical_max=NEW_NUMERIC(1));
  REAL(theoretical_max)[0]=c_theoretical_max;
  SET_VECTOR_ELT(r_result, 0, res);
  SET_VECTOR_ELT(r_result, 1, centralization);
  SET_VECTOR_ELT(r_result, 2, theoretical_max);
  SET_STRING_ELT(r_names, 0, Rf_mkChar("res"));
  SET_STRING_ELT(r_names, 1, Rf_mkChar("centralization"));
  SET_STRING_ELT(r_names, 2, Rf_mkChar("theoretical_max"));
  SET_NAMES(r_result, r_names);
  UNPROTECT(4);

  UNPROTECT(1);
  return(r_result);
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

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  c_nodes=INTEGER(nodes)[0];
  c_directed=LOGICAL(directed)[0];
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_centralization_betweenness_tmax(&c_graph, c_nodes, c_directed, &c_res));

                                        /* Convert output */
  PROTECT(res=NEW_NUMERIC(1));
  REAL(res)[0]=c_res;
  r_result = res;

  UNPROTECT(1);
  return(r_result);
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

  SEXP r_result, r_names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_init(&c_res, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_res);
  c_mode = (igraph_neimode_t) Rf_asInteger(mode);
  c_normalized=LOGICAL(normalized)[0];
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_centralization_closeness(&c_graph, &c_res, c_mode, &c_centralization, &c_theoretical_max, c_normalized));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(3));
  PROTECT(r_names=NEW_CHARACTER(3));
  PROTECT(res=R_igraph_vector_to_SEXP(&c_res));
  igraph_vector_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(centralization=NEW_NUMERIC(1));
  REAL(centralization)[0]=c_centralization;
  PROTECT(theoretical_max=NEW_NUMERIC(1));
  REAL(theoretical_max)[0]=c_theoretical_max;
  SET_VECTOR_ELT(r_result, 0, res);
  SET_VECTOR_ELT(r_result, 1, centralization);
  SET_VECTOR_ELT(r_result, 2, theoretical_max);
  SET_STRING_ELT(r_names, 0, Rf_mkChar("res"));
  SET_STRING_ELT(r_names, 1, Rf_mkChar("centralization"));
  SET_STRING_ELT(r_names, 2, Rf_mkChar("theoretical_max"));
  SET_NAMES(r_result, r_names);
  UNPROTECT(4);

  UNPROTECT(1);
  return(r_result);
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

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  c_nodes=INTEGER(nodes)[0];
  c_mode = (igraph_neimode_t) Rf_asInteger(mode);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_centralization_closeness_tmax(&c_graph, c_nodes, c_mode, &c_res));

                                        /* Convert output */
  PROTECT(res=NEW_NUMERIC(1));
  REAL(res)[0]=c_res;
  r_result = res;

  UNPROTECT(1);
  return(r_result);
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

  SEXP r_result, r_names;
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
  IGRAPH_R_CHECK(igraph_centralization_eigenvector_centrality(&c_graph, &c_vector, &c_value, c_directed, c_scale, &c_options, &c_centralization, &c_theoretical_max, c_normalized));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(5));
  PROTECT(r_names=NEW_CHARACTER(5));
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
  SET_VECTOR_ELT(r_result, 0, vector);
  SET_VECTOR_ELT(r_result, 1, value);
  SET_VECTOR_ELT(r_result, 2, options);
  SET_VECTOR_ELT(r_result, 3, centralization);
  SET_VECTOR_ELT(r_result, 4, theoretical_max);
  SET_STRING_ELT(r_names, 0, Rf_mkChar("vector"));
  SET_STRING_ELT(r_names, 1, Rf_mkChar("value"));
  SET_STRING_ELT(r_names, 2, Rf_mkChar("options"));
  SET_STRING_ELT(r_names, 3, Rf_mkChar("centralization"));
  SET_STRING_ELT(r_names, 4, Rf_mkChar("theoretical_max"));
  SET_NAMES(r_result, r_names);
  UNPROTECT(6);

  UNPROTECT(1);
  return(r_result);
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

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  c_nodes=INTEGER(nodes)[0];
  c_directed=LOGICAL(directed)[0];
  c_scale=LOGICAL(scale)[0];
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_centralization_eigenvector_centrality_tmax(&c_graph, c_nodes, c_directed, c_scale, &c_res));

                                        /* Convert output */
  PROTECT(res=NEW_NUMERIC(1));
  REAL(res)[0]=c_res;
  r_result = res;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_assortativity_nominal               /
/-------------------------------------------*/
SEXP R_igraph_assortativity_nominal(SEXP graph, SEXP types, SEXP directed, SEXP normalized) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_int_t c_types;
  igraph_real_t c_res;
  igraph_bool_t c_directed;
  igraph_bool_t c_normalized;
  SEXP res;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  R_SEXP_to_vector_int(types, &c_types);
  c_directed=LOGICAL(directed)[0];
  c_normalized=LOGICAL(normalized)[0];
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_assortativity_nominal(&c_graph, &c_types, &c_res, c_directed, c_normalized));

                                        /* Convert output */
  PROTECT(res=NEW_NUMERIC(1));
  REAL(res)[0]=c_res;
  r_result = res;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_assortativity                       /
/-------------------------------------------*/
SEXP R_igraph_assortativity(SEXP graph, SEXP values, SEXP values_in, SEXP directed, SEXP normalized) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_t c_values;
  igraph_vector_t c_values_in;
  igraph_real_t c_res;
  igraph_bool_t c_directed;
  igraph_bool_t c_normalized;
  SEXP res;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  R_SEXP_to_vector(values, &c_values);
  R_SEXP_to_vector(values_in, &c_values_in);
  c_directed=LOGICAL(directed)[0];
  c_normalized=LOGICAL(normalized)[0];
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_assortativity(&c_graph, &c_values, &c_values_in, &c_res, c_directed, c_normalized));

                                        /* Convert output */
  PROTECT(res=NEW_NUMERIC(1));
  REAL(res)[0]=c_res;
  r_result = res;

  UNPROTECT(1);
  return(r_result);
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

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  c_directed=LOGICAL(directed)[0];
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_assortativity_degree(&c_graph, &c_res, c_directed));

                                        /* Convert output */
  PROTECT(res=NEW_NUMERIC(1));
  REAL(res)[0]=c_res;
  r_result = res;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_contract_vertices                   /
/-------------------------------------------*/
SEXP R_igraph_contract_vertices(SEXP graph, SEXP mapping, SEXP vertex_attr_comb) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_int_t c_mapping;
  igraph_attribute_combination_t c_vertex_attr_comb;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph_copy(graph, &c_graph);
  IGRAPH_FINALLY(igraph_destroy, &c_graph);
  R_SEXP_to_vector_int(mapping, &c_mapping);
  R_SEXP_to_attr_comb(vertex_attr_comb, &c_vertex_attr_comb);
  IGRAPH_FINALLY(igraph_attribute_combination_destroy, &c_vertex_attr_comb);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_contract_vertices(&c_graph, &c_mapping, &c_vertex_attr_comb));

                                        /* Convert output */
  PROTECT(graph=R_igraph_to_SEXP(&c_graph));
  igraph_destroy(&c_graph);
  IGRAPH_FINALLY_CLEAN(1);
  igraph_attribute_combination_destroy(&c_vertex_attr_comb);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = graph;

  UNPROTECT(1);
  return(r_result);
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

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_init(&c_res, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_res);
  c_mode = (igraph_neimode_t) Rf_asInteger(mode);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_eccentricity(&c_graph, &c_res, c_vids, c_mode));

                                        /* Convert output */
  PROTECT(res=R_igraph_vector_to_SEXP(&c_res));
  igraph_vector_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = res;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_eccentricity_dijkstra               /
/-------------------------------------------*/
SEXP R_igraph_eccentricity_dijkstra(SEXP graph, SEXP weights, SEXP vids, SEXP mode) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_t c_weights;
  igraph_vector_t c_res;
  igraph_vs_t c_vids;
  igraph_neimode_t c_mode;
  SEXP res;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (!Rf_isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
  if (0 != igraph_vector_init(&c_res, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_res);
  c_mode = (igraph_neimode_t) Rf_asInteger(mode);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_eccentricity_dijkstra(&c_graph, (Rf_isNull(weights) ? 0 : &c_weights), &c_res, c_vids, c_mode));

                                        /* Convert output */
  PROTECT(res=R_igraph_vector_to_SEXP(&c_res));
  igraph_vector_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = res;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_graph_center                        /
/-------------------------------------------*/
SEXP R_igraph_graph_center(SEXP graph, SEXP mode) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_int_t c_res;
  igraph_neimode_t c_mode;
  SEXP res;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_int_init(&c_res, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_res);
  c_mode = (igraph_neimode_t) Rf_asInteger(mode);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_graph_center(&c_graph, &c_res, c_mode));

                                        /* Convert output */
  PROTECT(res=R_igraph_vector_int_to_SEXP(&c_res));
  igraph_vector_int_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = res;

  UNPROTECT(1);
  return(r_result);
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

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  c_mode = (igraph_neimode_t) Rf_asInteger(mode);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_radius(&c_graph, &c_radius, c_mode));

                                        /* Convert output */
  PROTECT(radius=NEW_NUMERIC(1));
  REAL(radius)[0]=c_radius;
  r_result = radius;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_pseudo_diameter                     /
/-------------------------------------------*/
SEXP R_igraph_pseudo_diameter(SEXP graph, SEXP start_vid, SEXP directed, SEXP unconnected) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_real_t c_diameter;
  igraph_integer_t c_start_vid;
  igraph_integer_t c_from;
  igraph_integer_t c_to;
  igraph_bool_t c_directed;
  igraph_bool_t c_unconnected;
  SEXP diameter;
  SEXP from;
  SEXP to;

  SEXP r_result, r_names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  c_start_vid = (igraph_integer_t) REAL(start_vid)[0];
  c_from=0;
  c_to=0;
  c_directed=LOGICAL(directed)[0];
  c_unconnected=LOGICAL(unconnected)[0];
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_pseudo_diameter(&c_graph, &c_diameter, c_start_vid, &c_from, &c_to, c_directed, c_unconnected));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(3));
  PROTECT(r_names=NEW_CHARACTER(3));
  PROTECT(diameter=NEW_NUMERIC(1));
  REAL(diameter)[0]=c_diameter;
  PROTECT(from=NEW_INTEGER(1));
  INTEGER(from)[0]=c_from;
  PROTECT(to=NEW_INTEGER(1));
  INTEGER(to)[0]=c_to;
  SET_VECTOR_ELT(r_result, 0, diameter);
  SET_VECTOR_ELT(r_result, 1, from);
  SET_VECTOR_ELT(r_result, 2, to);
  SET_STRING_ELT(r_names, 0, Rf_mkChar("diameter"));
  SET_STRING_ELT(r_names, 1, Rf_mkChar("from"));
  SET_STRING_ELT(r_names, 2, Rf_mkChar("to"));
  SET_NAMES(r_result, r_names);
  UNPROTECT(4);

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_pseudo_diameter_dijkstra            /
/-------------------------------------------*/
SEXP R_igraph_pseudo_diameter_dijkstra(SEXP graph, SEXP weights, SEXP start_vid, SEXP directed, SEXP unconnected) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_t c_weights;
  igraph_real_t c_diameter;
  igraph_integer_t c_start_vid;
  igraph_integer_t c_from;
  igraph_integer_t c_to;
  igraph_bool_t c_directed;
  igraph_bool_t c_unconnected;
  SEXP diameter;
  SEXP from;
  SEXP to;

  SEXP r_result, r_names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (!Rf_isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
  c_start_vid = (igraph_integer_t) REAL(start_vid)[0];
  c_from=0;
  c_to=0;
  c_directed=LOGICAL(directed)[0];
  c_unconnected=LOGICAL(unconnected)[0];
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_pseudo_diameter_dijkstra(&c_graph, (Rf_isNull(weights) ? 0 : &c_weights), &c_diameter, c_start_vid, &c_from, &c_to, c_directed, c_unconnected));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(3));
  PROTECT(r_names=NEW_CHARACTER(3));
  PROTECT(diameter=NEW_NUMERIC(1));
  REAL(diameter)[0]=c_diameter;
  PROTECT(from=NEW_INTEGER(1));
  INTEGER(from)[0]=c_from;
  PROTECT(to=NEW_INTEGER(1));
  INTEGER(to)[0]=c_to;
  SET_VECTOR_ELT(r_result, 0, diameter);
  SET_VECTOR_ELT(r_result, 1, from);
  SET_VECTOR_ELT(r_result, 2, to);
  SET_STRING_ELT(r_names, 0, Rf_mkChar("diameter"));
  SET_STRING_ELT(r_names, 1, Rf_mkChar("from"));
  SET_STRING_ELT(r_names, 2, Rf_mkChar("to"));
  SET_NAMES(r_result, r_names);
  UNPROTECT(4);

  UNPROTECT(1);
  return(r_result);
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

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (!Rf_isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
  if (0 != igraph_vector_init(&c_res, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_res);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_diversity(&c_graph, (Rf_isNull(weights) ? 0 : &c_weights), &c_res, c_vids));

                                        /* Convert output */
  PROTECT(res=R_igraph_vector_to_SEXP(&c_res));
  igraph_vector_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = res;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_random_walk                         /
/-------------------------------------------*/
SEXP R_igraph_random_walk(SEXP graph, SEXP weights, SEXP start, SEXP mode, SEXP steps, SEXP stuck) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_t c_weights;
  igraph_vector_int_t c_vertices;
  igraph_vector_int_t c_edges;
  igraph_integer_t c_start;
  igraph_neimode_t c_mode;
  igraph_integer_t c_steps;
  igraph_random_walk_stuck_t c_stuck;
  SEXP vertices;
  SEXP edges;

  SEXP r_result, r_names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (!Rf_isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
  if (0 != igraph_vector_int_init(&c_vertices, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_vertices);
  if (0 != igraph_vector_int_init(&c_edges, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_edges);
  c_start = (igraph_integer_t) REAL(start)[0];
  c_mode = (igraph_neimode_t) Rf_asInteger(mode);
  c_steps=INTEGER(steps)[0];
  c_stuck = (igraph_random_walk_stuck_t) Rf_asInteger(stuck);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_random_walk(&c_graph, (Rf_isNull(weights) ? 0 : &c_weights), &c_vertices, &c_edges, c_start, c_mode, c_steps, c_stuck));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(2));
  PROTECT(r_names=NEW_CHARACTER(2));
  PROTECT(vertices=R_igraph_vector_int_to_SEXP(&c_vertices));
  igraph_vector_int_destroy(&c_vertices);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(edges=R_igraph_vector_int_to_SEXP(&c_edges));
  igraph_vector_int_destroy(&c_edges);
  IGRAPH_FINALLY_CLEAN(1);
  SET_VECTOR_ELT(r_result, 0, vertices);
  SET_VECTOR_ELT(r_result, 1, edges);
  SET_STRING_ELT(r_names, 0, Rf_mkChar("vertices"));
  SET_STRING_ELT(r_names, 1, Rf_mkChar("edges"));
  SET_NAMES(r_result, r_names);
  UNPROTECT(3);

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_random_edge_walk                    /
/-------------------------------------------*/
SEXP R_igraph_random_edge_walk(SEXP graph, SEXP weights, SEXP start, SEXP mode, SEXP steps, SEXP stuck) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_t c_weights;
  igraph_vector_int_t c_edgewalk;
  igraph_integer_t c_start;
  igraph_neimode_t c_mode;
  igraph_integer_t c_steps;
  igraph_random_walk_stuck_t c_stuck;
  SEXP edgewalk;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (!Rf_isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
  if (0 != igraph_vector_int_init(&c_edgewalk, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_edgewalk);
  c_start = (igraph_integer_t) REAL(start)[0];
  c_mode = (igraph_neimode_t) Rf_asInteger(mode);
  c_steps=INTEGER(steps)[0];
  c_stuck = (igraph_random_walk_stuck_t) Rf_asInteger(stuck);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_random_edge_walk(&c_graph, (Rf_isNull(weights) ? 0 : &c_weights), &c_edgewalk, c_start, c_mode, c_steps, c_stuck));

                                        /* Convert output */
  PROTECT(edgewalk=R_igraph_vector_int_to_SEXP(&c_edgewalk));
  igraph_vector_int_destroy(&c_edgewalk);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = edgewalk;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_global_efficiency                   /
/-------------------------------------------*/
SEXP R_igraph_global_efficiency(SEXP graph, SEXP weights, SEXP directed) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_real_t c_res;
  igraph_vector_t c_weights;
  igraph_bool_t c_directed;
  SEXP res;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (!Rf_isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
  c_directed=LOGICAL(directed)[0];
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_global_efficiency(&c_graph, &c_res, (Rf_isNull(weights) ? 0 : &c_weights), c_directed));

                                        /* Convert output */
  PROTECT(res=NEW_NUMERIC(1));
  REAL(res)[0]=c_res;
  r_result = res;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_local_efficiency                    /
/-------------------------------------------*/
SEXP R_igraph_local_efficiency(SEXP graph, SEXP vids, SEXP weights, SEXP directed, SEXP mode) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_t c_res;
  igraph_vs_t c_vids;
  igraph_vector_t c_weights;
  igraph_bool_t c_directed;
  igraph_neimode_t c_mode;
  SEXP res;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_init(&c_res, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_res);
  if (!Rf_isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
  c_directed=LOGICAL(directed)[0];
  c_mode = (igraph_neimode_t) Rf_asInteger(mode);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_local_efficiency(&c_graph, &c_res, c_vids, (Rf_isNull(weights) ? 0 : &c_weights), c_directed, c_mode));

                                        /* Convert output */
  PROTECT(res=R_igraph_vector_to_SEXP(&c_res));
  igraph_vector_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = res;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_average_local_efficiency            /
/-------------------------------------------*/
SEXP R_igraph_average_local_efficiency(SEXP graph, SEXP weights, SEXP directed, SEXP mode) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_real_t c_res;
  igraph_vector_t c_weights;
  igraph_bool_t c_directed;
  igraph_neimode_t c_mode;
  SEXP res;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (!Rf_isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
  c_directed=LOGICAL(directed)[0];
  c_mode = (igraph_neimode_t) Rf_asInteger(mode);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_average_local_efficiency(&c_graph, &c_res, (Rf_isNull(weights) ? 0 : &c_weights), c_directed, c_mode));

                                        /* Convert output */
  PROTECT(res=NEW_NUMERIC(1));
  REAL(res)[0]=c_res;
  r_result = res;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_transitive_closure_dag              /
/-------------------------------------------*/
SEXP R_igraph_transitive_closure_dag(SEXP graph) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_t c_closure;
  SEXP closure;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_transitive_closure_dag(&c_graph, &c_closure));

                                        /* Convert output */
  IGRAPH_FINALLY(igraph_destroy, &c_closure);
  PROTECT(closure=R_igraph_to_SEXP(&c_closure));
  igraph_destroy(&c_closure);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = closure;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_trussness                           /
/-------------------------------------------*/
SEXP R_igraph_trussness(SEXP graph) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_int_t c_trussness;
  SEXP trussness;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_int_init(&c_trussness, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_trussness);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_trussness(&c_graph, &c_trussness));

                                        /* Convert output */
  PROTECT(trussness=R_igraph_vector_int_to_SEXP(&c_trussness));
  igraph_vector_int_destroy(&c_trussness);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = trussness;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_is_graphical                        /
/-------------------------------------------*/
SEXP R_igraph_is_graphical(SEXP out_deg, SEXP in_deg, SEXP allowed_edge_types) {
                                        /* Declarations */
  igraph_vector_int_t c_out_deg;
  igraph_vector_int_t c_in_deg;
  igraph_edge_type_sw_t c_allowed_edge_types;
  igraph_bool_t c_res;
  SEXP res;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_vector_int(out_deg, &c_out_deg);
  R_SEXP_to_vector_int(in_deg, &c_in_deg);
  c_allowed_edge_types = (igraph_edge_type_sw_t) Rf_asInteger(allowed_edge_types);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_is_graphical(&c_out_deg, &c_in_deg, c_allowed_edge_types, &c_res));

                                        /* Convert output */
  PROTECT(res=NEW_LOGICAL(1));
  LOGICAL(res)[0]=c_res;
  r_result = res;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_bfs_simple                          /
/-------------------------------------------*/
SEXP R_igraph_bfs_simple(SEXP graph, SEXP root, SEXP mode) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_integer_t c_root;
  igraph_neimode_t c_mode;
  igraph_vector_int_t c_order;
  igraph_vector_int_t c_layers;
  igraph_vector_int_t c_parents;
  SEXP order;
  SEXP layers;
  SEXP parents;

  SEXP r_result, r_names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  c_root = (igraph_integer_t) REAL(root)[0];
  c_mode = (igraph_neimode_t) Rf_asInteger(mode);
  if (0 != igraph_vector_int_init(&c_order, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_order);
  if (0 != igraph_vector_int_init(&c_layers, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_layers);
  if (0 != igraph_vector_int_init(&c_parents, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_parents);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_bfs_simple(&c_graph, c_root, c_mode, &c_order, &c_layers, &c_parents));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(3));
  PROTECT(r_names=NEW_CHARACTER(3));
  PROTECT(order=R_igraph_vector_int_to_SEXP(&c_order));
  igraph_vector_int_destroy(&c_order);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(layers=R_igraph_vector_int_to_SEXP(&c_layers));
  igraph_vector_int_destroy(&c_layers);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(parents=R_igraph_vector_int_to_SEXP(&c_parents));
  igraph_vector_int_destroy(&c_parents);
  IGRAPH_FINALLY_CLEAN(1);
  SET_VECTOR_ELT(r_result, 0, order);
  SET_VECTOR_ELT(r_result, 1, layers);
  SET_VECTOR_ELT(r_result, 2, parents);
  SET_STRING_ELT(r_names, 0, Rf_mkChar("order"));
  SET_STRING_ELT(r_names, 1, Rf_mkChar("layers"));
  SET_STRING_ELT(r_names, 2, Rf_mkChar("parents"));
  SET_NAMES(r_result, r_names);
  UNPROTECT(4);

  UNPROTECT(1);
  return(r_result);
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

  SEXP r_result, r_names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (!Rf_isNull(types)) { R_SEXP_to_vector_bool(types, &c_types); }
  c_vcount1=0;
  c_ecount1=0;
  c_vcount2=0;
  c_ecount2=0;
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_bipartite_projection_size(&c_graph, (Rf_isNull(types) ? 0 : &c_types), &c_vcount1, &c_ecount1, &c_vcount2, &c_ecount2));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(4));
  PROTECT(r_names=NEW_CHARACTER(4));
  PROTECT(vcount1=NEW_INTEGER(1));
  INTEGER(vcount1)[0]=c_vcount1;
  PROTECT(ecount1=NEW_INTEGER(1));
  INTEGER(ecount1)[0]=c_ecount1;
  PROTECT(vcount2=NEW_INTEGER(1));
  INTEGER(vcount2)[0]=c_vcount2;
  PROTECT(ecount2=NEW_INTEGER(1));
  INTEGER(ecount2)[0]=c_ecount2;
  SET_VECTOR_ELT(r_result, 0, vcount1);
  SET_VECTOR_ELT(r_result, 1, ecount1);
  SET_VECTOR_ELT(r_result, 2, vcount2);
  SET_VECTOR_ELT(r_result, 3, ecount2);
  SET_STRING_ELT(r_names, 0, Rf_mkChar("vcount1"));
  SET_STRING_ELT(r_names, 1, Rf_mkChar("ecount1"));
  SET_STRING_ELT(r_names, 2, Rf_mkChar("vcount2"));
  SET_STRING_ELT(r_names, 3, Rf_mkChar("ecount2"));
  SET_NAMES(r_result, r_names);
  UNPROTECT(5);

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_create_bipartite                    /
/-------------------------------------------*/
SEXP R_igraph_create_bipartite(SEXP types, SEXP edges, SEXP directed) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_bool_t c_types;
  igraph_vector_int_t c_edges;
  igraph_bool_t c_directed;
  SEXP graph;

  SEXP r_result;
                                        /* Convert input */
  if (!Rf_isNull(types)) { R_SEXP_to_vector_bool(types, &c_types); }
  R_SEXP_to_vector_int(edges, &c_edges);
  c_directed=LOGICAL(directed)[0];
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_create_bipartite(&c_graph, (Rf_isNull(types) ? 0 : &c_types), &c_edges, c_directed));

                                        /* Convert output */
  IGRAPH_FINALLY(igraph_destroy, &c_graph);
  PROTECT(graph=R_igraph_to_SEXP(&c_graph));
  igraph_destroy(&c_graph);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = graph;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_biadjacency                         /
/-------------------------------------------*/
SEXP R_igraph_biadjacency(SEXP incidence, SEXP directed, SEXP mode, SEXP multiple) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_bool_t c_types;
  igraph_matrix_t c_incidence;
  igraph_bool_t c_directed;
  igraph_neimode_t c_mode;
  igraph_bool_t c_multiple;
  SEXP graph;
  SEXP types;

  SEXP r_result, r_names;
                                        /* Convert input */
  if (0 != igraph_vector_bool_init(&c_types, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_bool_destroy, &c_types);
  R_SEXP_to_matrix(incidence, &c_incidence);
  c_directed=LOGICAL(directed)[0];
  c_mode = (igraph_neimode_t) Rf_asInteger(mode);
  c_multiple=LOGICAL(multiple)[0];
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_biadjacency(&c_graph, &c_types, &c_incidence, c_directed, c_mode, c_multiple));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(2));
  PROTECT(r_names=NEW_CHARACTER(2));
  IGRAPH_FINALLY(igraph_destroy, &c_graph);
  PROTECT(graph=R_igraph_to_SEXP(&c_graph));
  igraph_destroy(&c_graph);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(types=R_igraph_vector_bool_to_SEXP(&c_types));
  igraph_vector_bool_destroy(&c_types);
  IGRAPH_FINALLY_CLEAN(1);
  SET_VECTOR_ELT(r_result, 0, graph);
  SET_VECTOR_ELT(r_result, 1, types);
  SET_STRING_ELT(r_names, 0, Rf_mkChar("graph"));
  SET_STRING_ELT(r_names, 1, Rf_mkChar("types"));
  SET_NAMES(r_result, r_names);
  UNPROTECT(3);

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_get_biadjacency                     /
/-------------------------------------------*/
SEXP R_igraph_get_biadjacency(SEXP graph, SEXP types) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_bool_t c_types;
  igraph_matrix_t c_res;
  igraph_vector_int_t c_row_ids;
  igraph_vector_int_t c_col_ids;
  SEXP res;
  SEXP row_ids;
  SEXP col_ids;

  SEXP r_result, r_names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (!Rf_isNull(types)) { R_SEXP_to_vector_bool(types, &c_types); }
  if (0 != igraph_matrix_init(&c_res, 0, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_matrix_destroy, &c_res);
  if (0 != igraph_vector_int_init(&c_row_ids, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_row_ids);
  if (0 != igraph_vector_int_init(&c_col_ids, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_col_ids);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_get_biadjacency(&c_graph, (Rf_isNull(types) ? 0 : &c_types), &c_res, &c_row_ids, &c_col_ids));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(3));
  PROTECT(r_names=NEW_CHARACTER(3));
  PROTECT(res=R_igraph_matrix_to_SEXP(&c_res));
  igraph_matrix_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(row_ids=R_igraph_vector_int_to_SEXP(&c_row_ids));
  igraph_vector_int_destroy(&c_row_ids);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(col_ids=R_igraph_vector_int_to_SEXP(&c_col_ids));
  igraph_vector_int_destroy(&c_col_ids);
  IGRAPH_FINALLY_CLEAN(1);
  SET_VECTOR_ELT(r_result, 0, res);
  SET_VECTOR_ELT(r_result, 1, row_ids);
  SET_VECTOR_ELT(r_result, 2, col_ids);
  SET_STRING_ELT(r_names, 0, Rf_mkChar("res"));
  SET_STRING_ELT(r_names, 1, Rf_mkChar("row_ids"));
  SET_STRING_ELT(r_names, 2, Rf_mkChar("col_ids"));
  SET_NAMES(r_result, r_names);
  UNPROTECT(4);

  UNPROTECT(1);
  return(r_result);
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

  SEXP r_result, r_names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_bool_init(&c_type, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_bool_destroy, &c_type);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_is_bipartite(&c_graph, &c_res, &c_type));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(2));
  PROTECT(r_names=NEW_CHARACTER(2));
  PROTECT(res=NEW_LOGICAL(1));
  LOGICAL(res)[0]=c_res;
  PROTECT(type=R_igraph_vector_bool_to_SEXP(&c_type));
  igraph_vector_bool_destroy(&c_type);
  IGRAPH_FINALLY_CLEAN(1);
  SET_VECTOR_ELT(r_result, 0, res);
  SET_VECTOR_ELT(r_result, 1, type);
  SET_STRING_ELT(r_names, 0, Rf_mkChar("res"));
  SET_STRING_ELT(r_names, 1, Rf_mkChar("type"));
  SET_NAMES(r_result, r_names);
  UNPROTECT(3);

  UNPROTECT(1);
  return(r_result);
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

  SEXP r_result, r_names;
                                        /* Convert input */
  if (0 != igraph_vector_bool_init(&c_types, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_bool_destroy, &c_types);
  c_n1=INTEGER(n1)[0];
  c_n2=INTEGER(n2)[0];
  c_p=REAL(p)[0];
  c_directed=LOGICAL(directed)[0];
  c_mode = (igraph_neimode_t) Rf_asInteger(mode);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_bipartite_game_gnp(&c_graph, &c_types, c_n1, c_n2, c_p, c_directed, c_mode));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(2));
  PROTECT(r_names=NEW_CHARACTER(2));
  IGRAPH_FINALLY(igraph_destroy, &c_graph);
  PROTECT(graph=R_igraph_to_SEXP(&c_graph));
  igraph_destroy(&c_graph);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(types=R_igraph_vector_bool_to_SEXP(&c_types));
  igraph_vector_bool_destroy(&c_types);
  IGRAPH_FINALLY_CLEAN(1);
  SET_VECTOR_ELT(r_result, 0, graph);
  SET_VECTOR_ELT(r_result, 1, types);
  SET_STRING_ELT(r_names, 0, Rf_mkChar("graph"));
  SET_STRING_ELT(r_names, 1, Rf_mkChar("types"));
  SET_NAMES(r_result, r_names);
  UNPROTECT(3);

  UNPROTECT(1);
  return(r_result);
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

  SEXP r_result, r_names;
                                        /* Convert input */
  if (0 != igraph_vector_bool_init(&c_types, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_bool_destroy, &c_types);
  c_n1=INTEGER(n1)[0];
  c_n2=INTEGER(n2)[0];
  c_m=INTEGER(m)[0];
  c_directed=LOGICAL(directed)[0];
  c_mode = (igraph_neimode_t) Rf_asInteger(mode);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_bipartite_game_gnm(&c_graph, &c_types, c_n1, c_n2, c_m, c_directed, c_mode));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(2));
  PROTECT(r_names=NEW_CHARACTER(2));
  IGRAPH_FINALLY(igraph_destroy, &c_graph);
  PROTECT(graph=R_igraph_to_SEXP(&c_graph));
  igraph_destroy(&c_graph);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(types=R_igraph_vector_bool_to_SEXP(&c_types));
  igraph_vector_bool_destroy(&c_types);
  IGRAPH_FINALLY_CLEAN(1);
  SET_VECTOR_ELT(r_result, 0, graph);
  SET_VECTOR_ELT(r_result, 1, types);
  SET_STRING_ELT(r_names, 0, Rf_mkChar("graph"));
  SET_STRING_ELT(r_names, 1, Rf_mkChar("types"));
  SET_NAMES(r_result, r_names);
  UNPROTECT(3);

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_bipartite_game                      /
/-------------------------------------------*/
SEXP R_igraph_bipartite_game(SEXP type, SEXP n1, SEXP n2, SEXP p, SEXP m, SEXP directed, SEXP mode) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_bool_t c_types;
  igraph_erdos_renyi_t c_type;
  igraph_integer_t c_n1;
  igraph_integer_t c_n2;
  igraph_real_t c_p;
  igraph_integer_t c_m;
  igraph_bool_t c_directed;
  igraph_neimode_t c_mode;
  SEXP graph;
  SEXP types;

  SEXP r_result, r_names;
                                        /* Convert input */
  if (0 != igraph_vector_bool_init(&c_types, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_bool_destroy, &c_types);
  c_type = (igraph_erdos_renyi_t) Rf_asInteger(type);
  c_n1=INTEGER(n1)[0];
  c_n2=INTEGER(n2)[0];
  c_p=REAL(p)[0];
  c_m=INTEGER(m)[0];
  c_directed=LOGICAL(directed)[0];
  c_mode = (igraph_neimode_t) Rf_asInteger(mode);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_bipartite_game(&c_graph, &c_types, c_type, c_n1, c_n2, c_p, c_m, c_directed, c_mode));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(2));
  PROTECT(r_names=NEW_CHARACTER(2));
  IGRAPH_FINALLY(igraph_destroy, &c_graph);
  PROTECT(graph=R_igraph_to_SEXP(&c_graph));
  igraph_destroy(&c_graph);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(types=R_igraph_vector_bool_to_SEXP(&c_types));
  igraph_vector_bool_destroy(&c_types);
  IGRAPH_FINALLY_CLEAN(1);
  SET_VECTOR_ELT(r_result, 0, graph);
  SET_VECTOR_ELT(r_result, 1, types);
  SET_STRING_ELT(r_names, 0, Rf_mkChar("graph"));
  SET_STRING_ELT(r_names, 1, Rf_mkChar("types"));
  SET_NAMES(r_result, r_names);
  UNPROTECT(3);

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_get_laplacian                       /
/-------------------------------------------*/
SEXP R_igraph_get_laplacian(SEXP graph, SEXP mode, SEXP normalization, SEXP weights) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_matrix_t c_res;
  igraph_neimode_t c_mode;
  igraph_laplacian_normalization_t c_normalization;
  igraph_vector_t c_weights;
  SEXP res;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_matrix_init(&c_res, 0, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_matrix_destroy, &c_res);
  c_mode = (igraph_neimode_t) Rf_asInteger(mode);
  c_normalization = (igraph_laplacian_normalization_t) Rf_asInteger(normalization);
  if (!Rf_isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_get_laplacian(&c_graph, &c_res, c_mode, c_normalization, (Rf_isNull(weights) ? 0 : &c_weights)));

                                        /* Convert output */
  PROTECT(res=R_igraph_matrix_to_SEXP(&c_res));
  igraph_matrix_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = res;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_get_laplacian_sparse                /
/-------------------------------------------*/
SEXP R_igraph_get_laplacian_sparse(SEXP graph, SEXP mode, SEXP normalization, SEXP weights) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_sparsemat_t c_sparseres;
  igraph_neimode_t c_mode;
  igraph_laplacian_normalization_t c_normalization;
  igraph_vector_t c_weights;
  SEXP sparseres;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_sparsemat_init(&c_sparseres, 0, 0, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_sparsemat_destroy, &c_sparseres);
  c_mode = (igraph_neimode_t) Rf_asInteger(mode);
  c_normalization = (igraph_laplacian_normalization_t) Rf_asInteger(normalization);
  if (!Rf_isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_get_laplacian_sparse(&c_graph, &c_sparseres, c_mode, c_normalization, (Rf_isNull(weights) ? 0 : &c_weights)));

                                        /* Convert output */
  PROTECT(sparseres=R_igraph_sparsemat_to_SEXP(&c_sparseres));
  igraph_sparsemat_destroy(&c_sparseres);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = sparseres;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_connected_components                /
/-------------------------------------------*/
SEXP R_igraph_connected_components(SEXP graph, SEXP mode) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_int_t c_membership;
  igraph_vector_int_t c_csize;
  igraph_integer_t c_no;
  igraph_connectedness_t c_mode;
  SEXP membership;
  SEXP csize;
  SEXP no;

  SEXP r_result, r_names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_int_init(&c_membership, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_membership);
  if (0 != igraph_vector_int_init(&c_csize, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_csize);
  c_no=0;
  c_mode=REAL(mode)[0];
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_connected_components(&c_graph, &c_membership, &c_csize, &c_no, c_mode));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(3));
  PROTECT(r_names=NEW_CHARACTER(3));
  PROTECT(membership=R_igraph_vector_int_to_SEXP(&c_membership));
  igraph_vector_int_destroy(&c_membership);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(csize=R_igraph_vector_int_to_SEXP(&c_csize));
  igraph_vector_int_destroy(&c_csize);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(no=NEW_INTEGER(1));
  INTEGER(no)[0]=c_no;
  SET_VECTOR_ELT(r_result, 0, membership);
  SET_VECTOR_ELT(r_result, 1, csize);
  SET_VECTOR_ELT(r_result, 2, no);
  SET_STRING_ELT(r_names, 0, Rf_mkChar("membership"));
  SET_STRING_ELT(r_names, 1, Rf_mkChar("csize"));
  SET_STRING_ELT(r_names, 2, Rf_mkChar("no"));
  SET_NAMES(r_result, r_names);
  UNPROTECT(4);

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_is_connected                        /
/-------------------------------------------*/
SEXP R_igraph_is_connected(SEXP graph, SEXP mode) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_bool_t c_res;
  igraph_connectedness_t c_mode;
  SEXP res;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  c_mode=REAL(mode)[0];
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_is_connected(&c_graph, &c_res, c_mode));

                                        /* Convert output */
  PROTECT(res=NEW_LOGICAL(1));
  LOGICAL(res)[0]=c_res;
  r_result = res;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_articulation_points                 /
/-------------------------------------------*/
SEXP R_igraph_articulation_points(SEXP graph) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_int_t c_res;
  SEXP res;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_int_init(&c_res, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_res);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_articulation_points(&c_graph, &c_res));

                                        /* Convert output */
  PROTECT(res=R_igraph_vector_int_to_SEXP(&c_res));
  igraph_vector_int_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = res;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_biconnected_components              /
/-------------------------------------------*/
SEXP R_igraph_biconnected_components(SEXP graph) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_integer_t c_no;
  igraph_vector_int_list_t c_tree_edges;
  igraph_vector_int_list_t c_component_edges;
  igraph_vector_int_list_t c_components;
  igraph_vector_int_t c_articulation_points;
  SEXP no;
  SEXP tree_edges;
  SEXP component_edges;
  SEXP components;
  SEXP articulation_points;

  SEXP r_result, r_names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  c_no=0;
  if (0 != igraph_vector_int_list_init(&c_tree_edges, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_list_destroy, &c_tree_edges);
  if (0 != igraph_vector_int_list_init(&c_component_edges, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_list_destroy, &c_component_edges);
  if (0 != igraph_vector_int_list_init(&c_components, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_list_destroy, &c_components);
  if (0 != igraph_vector_int_init(&c_articulation_points, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_articulation_points);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_biconnected_components(&c_graph, &c_no, &c_tree_edges, &c_component_edges, &c_components, &c_articulation_points));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(5));
  PROTECT(r_names=NEW_CHARACTER(5));
  PROTECT(no=NEW_INTEGER(1));
  INTEGER(no)[0]=c_no;
  PROTECT(tree_edges=R_igraph_vectorlist_int_to_SEXP(&c_tree_edges));
  igraph_vector_int_list_destroy(&c_tree_edges);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(component_edges=R_igraph_vectorlist_int_to_SEXP(&c_component_edges));
  igraph_vector_int_list_destroy(&c_component_edges);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(components=R_igraph_vectorlist_int_to_SEXP(&c_components));
  igraph_vector_int_list_destroy(&c_components);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(articulation_points=R_igraph_vector_int_to_SEXP(&c_articulation_points));
  igraph_vector_int_destroy(&c_articulation_points);
  IGRAPH_FINALLY_CLEAN(1);
  SET_VECTOR_ELT(r_result, 0, no);
  SET_VECTOR_ELT(r_result, 1, tree_edges);
  SET_VECTOR_ELT(r_result, 2, component_edges);
  SET_VECTOR_ELT(r_result, 3, components);
  SET_VECTOR_ELT(r_result, 4, articulation_points);
  SET_STRING_ELT(r_names, 0, Rf_mkChar("no"));
  SET_STRING_ELT(r_names, 1, Rf_mkChar("tree_edges"));
  SET_STRING_ELT(r_names, 2, Rf_mkChar("component_edges"));
  SET_STRING_ELT(r_names, 3, Rf_mkChar("components"));
  SET_STRING_ELT(r_names, 4, Rf_mkChar("articulation_points"));
  SET_NAMES(r_result, r_names);
  UNPROTECT(6);

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_bridges                             /
/-------------------------------------------*/
SEXP R_igraph_bridges(SEXP graph) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_int_t c_res;
  SEXP res;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_int_init(&c_res, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_res);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_bridges(&c_graph, &c_res));

                                        /* Convert output */
  PROTECT(res=R_igraph_vector_int_to_SEXP(&c_res));
  igraph_vector_int_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = res;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_cliques                             /
/-------------------------------------------*/
SEXP R_igraph_cliques(SEXP graph, SEXP min_size, SEXP max_size) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_int_list_t c_res;
  igraph_integer_t c_min_size;
  igraph_integer_t c_max_size;
  SEXP res;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_int_list_init(&c_res, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_list_destroy, &c_res);
  c_min_size=INTEGER(min_size)[0];
  c_max_size=INTEGER(max_size)[0];
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_cliques(&c_graph, &c_res, c_min_size, c_max_size));

                                        /* Convert output */
  PROTECT(res=R_igraph_vectorlist_int_to_SEXP(&c_res));
  igraph_vector_int_list_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = res;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_clique_size_hist                    /
/-------------------------------------------*/
SEXP R_igraph_clique_size_hist(SEXP graph, SEXP min_size, SEXP max_size) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_t c_hist;
  igraph_integer_t c_min_size;
  igraph_integer_t c_max_size;
  SEXP hist;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_init(&c_hist, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_hist);
  c_min_size=INTEGER(min_size)[0];
  c_max_size=INTEGER(max_size)[0];
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_clique_size_hist(&c_graph, &c_hist, c_min_size, c_max_size));

                                        /* Convert output */
  PROTECT(hist=R_igraph_vector_to_SEXP(&c_hist));
  igraph_vector_destroy(&c_hist);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = hist;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_largest_cliques                     /
/-------------------------------------------*/
SEXP R_igraph_largest_cliques(SEXP graph) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_int_list_t c_res;
  SEXP res;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_int_list_init(&c_res, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_list_destroy, &c_res);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_largest_cliques(&c_graph, &c_res));

                                        /* Convert output */
  PROTECT(res=R_igraph_vectorlist_int_to_SEXP(&c_res));
  igraph_vector_int_list_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = res;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_maximal_cliques_subset              /
/-------------------------------------------*/
SEXP R_igraph_maximal_cliques_subset(SEXP graph, SEXP subset, SEXP outfile, SEXP min_size, SEXP max_size) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_int_t c_subset;
  igraph_vector_int_list_t c_res;
  igraph_integer_t c_no;
  FILE* c_outfile;
  igraph_integer_t c_min_size;
  igraph_integer_t c_max_size;
  SEXP res;
  SEXP no;

  SEXP r_result, r_names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  R_SEXP_to_vector_int(subset, &c_subset);
  if (0 != igraph_vector_int_list_init(&c_res, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_list_destroy, &c_res);
  c_no=0;
  c_min_size=INTEGER(min_size)[0];
  c_max_size=INTEGER(max_size)[0];
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_maximal_cliques_subset(&c_graph, &c_subset, &c_res, &c_no, c_outfile, c_min_size, c_max_size));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(2));
  PROTECT(r_names=NEW_CHARACTER(2));
  PROTECT(res=R_igraph_vectorlist_int_to_SEXP(&c_res));
  igraph_vector_int_list_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(no=NEW_INTEGER(1));
  INTEGER(no)[0]=c_no;
  SET_VECTOR_ELT(r_result, 0, res);
  SET_VECTOR_ELT(r_result, 1, no);
  SET_STRING_ELT(r_names, 0, Rf_mkChar("res"));
  SET_STRING_ELT(r_names, 1, Rf_mkChar("no"));
  SET_NAMES(r_result, r_names);
  UNPROTECT(3);

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_maximal_cliques_hist                /
/-------------------------------------------*/
SEXP R_igraph_maximal_cliques_hist(SEXP graph, SEXP min_size, SEXP max_size) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_t c_hist;
  igraph_integer_t c_min_size;
  igraph_integer_t c_max_size;
  SEXP hist;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_init(&c_hist, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_hist);
  c_min_size=INTEGER(min_size)[0];
  c_max_size=INTEGER(max_size)[0];
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_maximal_cliques_hist(&c_graph, &c_hist, c_min_size, c_max_size));

                                        /* Convert output */
  PROTECT(hist=R_igraph_vector_to_SEXP(&c_hist));
  igraph_vector_destroy(&c_hist);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = hist;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_clique_number                       /
/-------------------------------------------*/
SEXP R_igraph_clique_number(SEXP graph) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_integer_t c_no;
  SEXP no;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  c_no=0;
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_clique_number(&c_graph, &c_no));

                                        /* Convert output */
  PROTECT(no=NEW_INTEGER(1));
  INTEGER(no)[0]=c_no;
  r_result = no;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_weighted_cliques                    /
/-------------------------------------------*/
SEXP R_igraph_weighted_cliques(SEXP graph, SEXP vertex_weights, SEXP min_weight, SEXP max_weight, SEXP maximal) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_t c_vertex_weights;
  igraph_vector_int_list_t c_res;
  igraph_real_t c_min_weight;
  igraph_real_t c_max_weight;
  igraph_bool_t c_maximal;
  SEXP res;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (!Rf_isNull(vertex_weights)) { R_SEXP_to_vector(vertex_weights, &c_vertex_weights); }
  if (0 != igraph_vector_int_list_init(&c_res, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_list_destroy, &c_res);
  c_min_weight=REAL(min_weight)[0];
  c_max_weight=REAL(max_weight)[0];
  c_maximal=LOGICAL(maximal)[0];
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_weighted_cliques(&c_graph, (Rf_isNull(vertex_weights) ? 0 : &c_vertex_weights), &c_res, c_min_weight, c_max_weight, c_maximal));

                                        /* Convert output */
  PROTECT(res=R_igraph_vectorlist_int_to_SEXP(&c_res));
  igraph_vector_int_list_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = res;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_largest_weighted_cliques            /
/-------------------------------------------*/
SEXP R_igraph_largest_weighted_cliques(SEXP graph, SEXP vertex_weights) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_t c_vertex_weights;
  igraph_vector_int_list_t c_res;
  SEXP res;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (!Rf_isNull(vertex_weights)) { R_SEXP_to_vector(vertex_weights, &c_vertex_weights); }
  if (0 != igraph_vector_int_list_init(&c_res, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_list_destroy, &c_res);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_largest_weighted_cliques(&c_graph, (Rf_isNull(vertex_weights) ? 0 : &c_vertex_weights), &c_res));

                                        /* Convert output */
  PROTECT(res=R_igraph_vectorlist_int_to_SEXP(&c_res));
  igraph_vector_int_list_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = res;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_weighted_clique_number              /
/-------------------------------------------*/
SEXP R_igraph_weighted_clique_number(SEXP graph, SEXP vertex_weights) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_t c_vertex_weights;
  igraph_real_t c_res;
  SEXP res;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (!Rf_isNull(vertex_weights)) { R_SEXP_to_vector(vertex_weights, &c_vertex_weights); }
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_weighted_clique_number(&c_graph, (Rf_isNull(vertex_weights) ? 0 : &c_vertex_weights), &c_res));

                                        /* Convert output */
  PROTECT(res=NEW_NUMERIC(1));
  REAL(res)[0]=c_res;
  r_result = res;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_layout_star                         /
/-------------------------------------------*/
SEXP R_igraph_layout_star(SEXP graph, SEXP center, SEXP order) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_matrix_t c_res;
  igraph_integer_t c_center;
  igraph_vector_int_t c_order;
  SEXP res;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_matrix_init(&c_res, 0, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_matrix_destroy, &c_res);
  c_center = (igraph_integer_t) REAL(center)[0];
  R_SEXP_to_vector_int(order, &c_order);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_layout_star(&c_graph, &c_res, c_center, &c_order));

                                        /* Convert output */
  PROTECT(res=R_igraph_matrix_to_SEXP(&c_res));
  igraph_matrix_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = res;

  UNPROTECT(1);
  return(r_result);
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

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_matrix_init(&c_res, 0, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_matrix_destroy, &c_res);
  c_width=INTEGER(width)[0];
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_layout_grid(&c_graph, &c_res, c_width));

                                        /* Convert output */
  PROTECT(res=R_igraph_matrix_to_SEXP(&c_res));
  igraph_matrix_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = res;

  UNPROTECT(1);
  return(r_result);
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

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_matrix_init(&c_res, 0, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_matrix_destroy, &c_res);
  c_width=INTEGER(width)[0];
  c_height=INTEGER(height)[0];
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_layout_grid_3d(&c_graph, &c_res, c_width, c_height));

                                        /* Convert output */
  PROTECT(res=R_igraph_matrix_to_SEXP(&c_res));
  igraph_matrix_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = res;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_roots_for_tree_layout               /
/-------------------------------------------*/
SEXP R_igraph_roots_for_tree_layout(SEXP graph, SEXP mode, SEXP heuristic) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_neimode_t c_mode;
  igraph_vector_int_t c_roots;
  igraph_root_choice_t c_heuristic;
  SEXP roots;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  c_mode = (igraph_neimode_t) Rf_asInteger(mode);
  if (0 != igraph_vector_int_init(&c_roots, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_roots);
  c_heuristic = (igraph_root_choice_t) Rf_asInteger(heuristic);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_roots_for_tree_layout(&c_graph, c_mode, &c_roots, c_heuristic));

                                        /* Convert output */
  PROTECT(roots=R_igraph_vector_int_to_SEXP(&c_roots));
  igraph_vector_int_destroy(&c_roots);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = roots;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_layout_drl                          /
/-------------------------------------------*/
SEXP R_igraph_layout_drl(SEXP graph, SEXP res, SEXP use_seed, SEXP options, SEXP weights) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_matrix_t c_res;
  igraph_bool_t c_use_seed;
  igraph_layout_drl_options_t c_options;
  igraph_vector_t c_weights;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != R_SEXP_to_igraph_matrix_copy(res, &c_res)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_matrix_destroy, &c_res);
  c_use_seed=LOGICAL(use_seed)[0];
  R_SEXP_to_igraph_layout_drl_options(options, &c_options);
  if (!Rf_isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_layout_drl(&c_graph, &c_res, c_use_seed, &c_options, (Rf_isNull(weights) ? 0 : &c_weights)));

                                        /* Convert output */
  PROTECT(res=R_igraph_matrix_to_SEXP(&c_res));
  igraph_matrix_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = res;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_layout_drl_3d                       /
/-------------------------------------------*/
SEXP R_igraph_layout_drl_3d(SEXP graph, SEXP res, SEXP use_seed, SEXP options, SEXP weights) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_matrix_t c_res;
  igraph_bool_t c_use_seed;
  igraph_layout_drl_options_t c_options;
  igraph_vector_t c_weights;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != R_SEXP_to_igraph_matrix_copy(res, &c_res)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_matrix_destroy, &c_res);
  c_use_seed=LOGICAL(use_seed)[0];
  R_SEXP_to_igraph_layout_drl_options(options, &c_options);
  if (!Rf_isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_layout_drl_3d(&c_graph, &c_res, c_use_seed, &c_options, (Rf_isNull(weights) ? 0 : &c_weights)));

                                        /* Convert output */
  PROTECT(res=R_igraph_matrix_to_SEXP(&c_res));
  igraph_matrix_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = res;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_layout_sugiyama                     /
/-------------------------------------------*/
SEXP R_igraph_layout_sugiyama(SEXP graph, SEXP layers, SEXP hgap, SEXP vgap, SEXP maxiter, SEXP weights) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_matrix_t c_res;
  igraph_t c_extd_graph;
  igraph_vector_int_t c_extd_to_orig_eids;
  igraph_vector_int_t c_layers;
  igraph_real_t c_hgap;
  igraph_real_t c_vgap;
  igraph_integer_t c_maxiter;
  igraph_vector_t c_weights;
  SEXP res;
  SEXP extd_graph;
  SEXP extd_to_orig_eids;

  SEXP r_result, r_names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_matrix_init(&c_res, 0, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_matrix_destroy, &c_res);
  if (0 != igraph_vector_int_init(&c_extd_to_orig_eids, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_extd_to_orig_eids);
  R_SEXP_to_vector_int(layers, &c_layers);
  c_hgap=REAL(hgap)[0];
  c_vgap=REAL(vgap)[0];
  c_maxiter=INTEGER(maxiter)[0];
  if (!Rf_isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_layout_sugiyama(&c_graph, &c_res, &c_extd_graph, &c_extd_to_orig_eids, &c_layers, c_hgap, c_vgap, c_maxiter, (Rf_isNull(weights) ? 0 : &c_weights)));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(3));
  PROTECT(r_names=NEW_CHARACTER(3));
  PROTECT(res=R_igraph_matrix_to_SEXP(&c_res));
  igraph_matrix_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  IGRAPH_FINALLY(igraph_destroy, &c_extd_graph);
  PROTECT(extd_graph=R_igraph_to_SEXP(&c_extd_graph));
  igraph_destroy(&c_extd_graph);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(extd_to_orig_eids=R_igraph_vector_int_to_SEXP(&c_extd_to_orig_eids));
  igraph_vector_int_destroy(&c_extd_to_orig_eids);
  IGRAPH_FINALLY_CLEAN(1);
  SET_VECTOR_ELT(r_result, 0, res);
  SET_VECTOR_ELT(r_result, 1, extd_graph);
  SET_VECTOR_ELT(r_result, 2, extd_to_orig_eids);
  SET_STRING_ELT(r_names, 0, Rf_mkChar("res"));
  SET_STRING_ELT(r_names, 1, Rf_mkChar("extd_graph"));
  SET_STRING_ELT(r_names, 2, Rf_mkChar("extd_to_orig_eids"));
  SET_NAMES(r_result, r_names);
  UNPROTECT(4);

  UNPROTECT(1);
  return(r_result);
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

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_matrix_init(&c_res, 0, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_matrix_destroy, &c_res);
  R_SEXP_to_matrix(dist, &c_dist);
  c_dim=INTEGER(dim)[0];
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_layout_mds(&c_graph, &c_res, &c_dist, c_dim));

                                        /* Convert output */
  PROTECT(res=R_igraph_matrix_to_SEXP(&c_res));
  igraph_matrix_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = res;

  UNPROTECT(1);
  return(r_result);
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

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (!Rf_isNull(types)) { R_SEXP_to_vector_bool(types, &c_types); }
  if (0 != igraph_matrix_init(&c_res, 0, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_matrix_destroy, &c_res);
  c_hgap=REAL(hgap)[0];
  c_vgap=REAL(vgap)[0];
  c_maxiter=INTEGER(maxiter)[0];
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_layout_bipartite(&c_graph, (Rf_isNull(types) ? 0 : &c_types), &c_res, c_hgap, c_vgap, c_maxiter));

                                        /* Convert output */
  PROTECT(res=R_igraph_matrix_to_SEXP(&c_res));
  igraph_matrix_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = res;

  UNPROTECT(1);
  return(r_result);
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

  SEXP r_result;
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
  IGRAPH_R_CHECK(igraph_layout_gem(&c_graph, &c_res, c_use_seed, c_maxiter, c_temp_max, c_temp_min, c_temp_init));

                                        /* Convert output */
  PROTECT(res=R_igraph_matrix_to_SEXP(&c_res));
  igraph_matrix_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = res;

  UNPROTECT(1);
  return(r_result);
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

  SEXP r_result;
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
  IGRAPH_R_CHECK(igraph_layout_davidson_harel(&c_graph, &c_res, c_use_seed, c_maxiter, c_fineiter, c_cool_fact, c_weight_node_dist, c_weight_border, c_weight_edge_lengths, c_weight_edge_crossings, c_weight_node_edge_dist));

                                        /* Convert output */
  PROTECT(res=R_igraph_matrix_to_SEXP(&c_res));
  igraph_matrix_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = res;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_layout_umap                         /
/-------------------------------------------*/
SEXP R_igraph_layout_umap(SEXP graph, SEXP res, SEXP use_seed, SEXP distances, SEXP min_dist, SEXP epochs, SEXP distances_are_weights) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_matrix_t c_res;
  igraph_bool_t c_use_seed;
  igraph_vector_t c_distances;
  igraph_real_t c_min_dist;
  igraph_integer_t c_epochs;
  igraph_bool_t c_distances_are_weights;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != R_SEXP_to_igraph_matrix_copy(res, &c_res)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_matrix_destroy, &c_res);
  c_use_seed=LOGICAL(use_seed)[0];
  R_SEXP_to_vector(distances, &c_distances);
  c_min_dist=REAL(min_dist)[0];
  c_epochs=INTEGER(epochs)[0];
  c_distances_are_weights=LOGICAL(distances_are_weights)[0];
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_layout_umap(&c_graph, &c_res, c_use_seed, &c_distances, c_min_dist, c_epochs, c_distances_are_weights));

                                        /* Convert output */
  PROTECT(res=R_igraph_matrix_to_SEXP(&c_res));
  igraph_matrix_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = res;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_layout_umap_3d                      /
/-------------------------------------------*/
SEXP R_igraph_layout_umap_3d(SEXP graph, SEXP res, SEXP use_seed, SEXP distances, SEXP min_dist, SEXP epochs, SEXP distances_are_weights) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_matrix_t c_res;
  igraph_bool_t c_use_seed;
  igraph_vector_t c_distances;
  igraph_real_t c_min_dist;
  igraph_integer_t c_epochs;
  igraph_bool_t c_distances_are_weights;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != R_SEXP_to_igraph_matrix_copy(res, &c_res)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_matrix_destroy, &c_res);
  c_use_seed=LOGICAL(use_seed)[0];
  R_SEXP_to_vector(distances, &c_distances);
  c_min_dist=REAL(min_dist)[0];
  c_epochs=INTEGER(epochs)[0];
  c_distances_are_weights=LOGICAL(distances_are_weights)[0];
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_layout_umap_3d(&c_graph, &c_res, c_use_seed, &c_distances, c_min_dist, c_epochs, c_distances_are_weights));

                                        /* Convert output */
  PROTECT(res=R_igraph_matrix_to_SEXP(&c_res));
  igraph_matrix_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = res;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_layout_umap_compute_weights         /
/-------------------------------------------*/
SEXP R_igraph_layout_umap_compute_weights(SEXP graph, SEXP distances, SEXP weights) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_t c_distances;
  igraph_vector_t c_weights;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  R_SEXP_to_vector(distances, &c_distances);
  if (0 != R_SEXP_to_vector_copy(weights, &c_weights)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_weights);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_layout_umap_compute_weights(&c_graph, &c_distances, &c_weights));

                                        /* Convert output */
  PROTECT(weights=R_igraph_vector_to_SEXP(&c_weights));
  igraph_vector_destroy(&c_weights);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = weights;

  UNPROTECT(1);
  return(r_result);
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

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_matrix_init(&c_res, 0, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_matrix_destroy, &c_res);
  c_mode = (igraph_neimode_t) Rf_asInteger(mode);
  c_loops=LOGICAL(loops)[0];
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_similarity_dice(&c_graph, &c_res, c_vids, c_mode, c_loops));

                                        /* Convert output */
  PROTECT(res=R_igraph_matrix_to_SEXP(&c_res));
  igraph_matrix_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = res;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_similarity_dice_es                  /
/-------------------------------------------*/
SEXP R_igraph_similarity_dice_es(SEXP graph, SEXP es, SEXP mode, SEXP loops) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_t c_res;
  igraph_es_t c_es;
  igraph_neimode_t c_mode;
  igraph_bool_t c_loops;
  SEXP res;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_init(&c_res, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_res);
  c_mode = (igraph_neimode_t) Rf_asInteger(mode);
  c_loops=LOGICAL(loops)[0];
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_similarity_dice_es(&c_graph, &c_res, c_es, c_mode, c_loops));

                                        /* Convert output */
  PROTECT(res=R_igraph_vector_to_SEXP(&c_res));
  igraph_vector_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = res;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_similarity_dice_pairs               /
/-------------------------------------------*/
SEXP R_igraph_similarity_dice_pairs(SEXP graph, SEXP pairs, SEXP mode, SEXP loops) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_t c_res;
  igraph_vector_int_t c_pairs;
  igraph_neimode_t c_mode;
  igraph_bool_t c_loops;
  SEXP res;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_init(&c_res, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_res);
  R_SEXP_to_vector_int(pairs, &c_pairs);
  c_mode = (igraph_neimode_t) Rf_asInteger(mode);
  c_loops=LOGICAL(loops)[0];
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_similarity_dice_pairs(&c_graph, &c_res, &c_pairs, c_mode, c_loops));

                                        /* Convert output */
  PROTECT(res=R_igraph_vector_to_SEXP(&c_res));
  igraph_vector_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = res;

  UNPROTECT(1);
  return(r_result);
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

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_matrix_init(&c_res, 0, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_matrix_destroy, &c_res);
  c_mode = (igraph_neimode_t) Rf_asInteger(mode);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_similarity_inverse_log_weighted(&c_graph, &c_res, c_vids, c_mode));

                                        /* Convert output */
  PROTECT(res=R_igraph_matrix_to_SEXP(&c_res));
  igraph_matrix_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = res;

  UNPROTECT(1);
  return(r_result);
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

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_matrix_init(&c_res, 0, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_matrix_destroy, &c_res);
  c_mode = (igraph_neimode_t) Rf_asInteger(mode);
  c_loops=LOGICAL(loops)[0];
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_similarity_jaccard(&c_graph, &c_res, c_vids, c_mode, c_loops));

                                        /* Convert output */
  PROTECT(res=R_igraph_matrix_to_SEXP(&c_res));
  igraph_matrix_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = res;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_similarity_jaccard_es               /
/-------------------------------------------*/
SEXP R_igraph_similarity_jaccard_es(SEXP graph, SEXP es, SEXP mode, SEXP loops) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_t c_res;
  igraph_es_t c_es;
  igraph_neimode_t c_mode;
  igraph_bool_t c_loops;
  SEXP res;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_init(&c_res, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_res);
  c_mode = (igraph_neimode_t) Rf_asInteger(mode);
  c_loops=LOGICAL(loops)[0];
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_similarity_jaccard_es(&c_graph, &c_res, c_es, c_mode, c_loops));

                                        /* Convert output */
  PROTECT(res=R_igraph_vector_to_SEXP(&c_res));
  igraph_vector_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = res;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_similarity_jaccard_pairs            /
/-------------------------------------------*/
SEXP R_igraph_similarity_jaccard_pairs(SEXP graph, SEXP pairs, SEXP mode, SEXP loops) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_t c_res;
  igraph_vector_int_t c_pairs;
  igraph_neimode_t c_mode;
  igraph_bool_t c_loops;
  SEXP res;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_init(&c_res, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_res);
  R_SEXP_to_vector_int(pairs, &c_pairs);
  c_mode = (igraph_neimode_t) Rf_asInteger(mode);
  c_loops=LOGICAL(loops)[0];
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_similarity_jaccard_pairs(&c_graph, &c_res, &c_pairs, c_mode, c_loops));

                                        /* Convert output */
  PROTECT(res=R_igraph_vector_to_SEXP(&c_res));
  igraph_vector_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = res;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_compare_communities                 /
/-------------------------------------------*/
SEXP R_igraph_compare_communities(SEXP comm1, SEXP comm2, SEXP method) {
                                        /* Declarations */
  igraph_vector_int_t c_comm1;
  igraph_vector_int_t c_comm2;
  igraph_real_t c_res;
  igraph_community_comparison_t c_method;
  SEXP res;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_vector_int(comm1, &c_comm1);
  R_SEXP_to_vector_int(comm2, &c_comm2);
  c_method = (igraph_community_comparison_t) Rf_asInteger(method);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_compare_communities(&c_comm1, &c_comm2, &c_res, c_method));

                                        /* Convert output */
  PROTECT(res=NEW_NUMERIC(1));
  REAL(res)[0]=c_res;
  r_result = res;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_modularity                          /
/-------------------------------------------*/
SEXP R_igraph_modularity(SEXP graph, SEXP membership, SEXP weights, SEXP resolution, SEXP directed) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_int_t c_membership;
  igraph_vector_t c_weights;
  igraph_real_t c_resolution;
  igraph_bool_t c_directed;
  igraph_real_t c_modularity;
  SEXP modularity;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  R_SEXP_to_vector_int(membership, &c_membership);
  if (!Rf_isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
  c_resolution=REAL(resolution)[0];
  c_directed=LOGICAL(directed)[0];
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_modularity(&c_graph, &c_membership, (Rf_isNull(weights) ? 0 : &c_weights), c_resolution, c_directed, &c_modularity));

                                        /* Convert output */
  PROTECT(modularity=NEW_NUMERIC(1));
  REAL(modularity)[0]=c_modularity;
  r_result = modularity;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_modularity_matrix                   /
/-------------------------------------------*/
SEXP R_igraph_modularity_matrix(SEXP graph, SEXP weights, SEXP resolution, SEXP directed) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_t c_weights;
  igraph_real_t c_resolution;
  igraph_matrix_t c_modmat;
  igraph_bool_t c_directed;
  SEXP modmat;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (!Rf_isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
  c_resolution=REAL(resolution)[0];
  if (0 != igraph_matrix_init(&c_modmat, 0, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_matrix_destroy, &c_modmat);
  c_directed=LOGICAL(directed)[0];
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_modularity_matrix(&c_graph, (Rf_isNull(weights) ? 0 : &c_weights), c_resolution, &c_modmat, c_directed));

                                        /* Convert output */
  PROTECT(modmat=R_igraph_matrix_to_SEXP(&c_modmat));
  igraph_matrix_destroy(&c_modmat);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = modmat;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_community_fluid_communities         /
/-------------------------------------------*/
SEXP R_igraph_community_fluid_communities(SEXP graph, SEXP no_of_communities) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_integer_t c_no_of_communities;
  igraph_vector_int_t c_membership;
  SEXP membership;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  c_no_of_communities=INTEGER(no_of_communities)[0];
  if (0 != igraph_vector_int_init(&c_membership, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_membership);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_community_fluid_communities(&c_graph, c_no_of_communities, &c_membership));

                                        /* Convert output */
  PROTECT(membership=R_igraph_vector_int_to_SEXP(&c_membership));
  igraph_vector_int_destroy(&c_membership);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = membership;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_community_label_propagation         /
/-------------------------------------------*/
SEXP R_igraph_community_label_propagation(SEXP graph, SEXP mode, SEXP weights, SEXP initial, SEXP fixed) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_int_t c_membership;
  igraph_neimode_t c_mode;
  igraph_vector_t c_weights;
  igraph_vector_int_t c_initial;
  igraph_vector_bool_t c_fixed;
  SEXP membership;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_int_init(&c_membership, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_membership);
  c_mode = (igraph_neimode_t) Rf_asInteger(mode);
  if (!Rf_isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
  R_SEXP_to_vector_int(initial, &c_initial);
  R_SEXP_to_vector_bool(fixed, &c_fixed);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_community_label_propagation(&c_graph, &c_membership, c_mode, (Rf_isNull(weights) ? 0 : &c_weights), &c_initial, &c_fixed));

                                        /* Convert output */
  PROTECT(membership=R_igraph_vector_int_to_SEXP(&c_membership));
  igraph_vector_int_destroy(&c_membership);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = membership;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_community_multilevel                /
/-------------------------------------------*/
SEXP R_igraph_community_multilevel(SEXP graph, SEXP weights, SEXP resolution) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_t c_weights;
  igraph_real_t c_resolution;
  igraph_vector_int_t c_membership;
  igraph_matrix_int_t c_memberships;
  igraph_vector_t c_modularity;
  SEXP membership;
  SEXP memberships;
  SEXP modularity;

  SEXP r_result, r_names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (!Rf_isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
  c_resolution=REAL(resolution)[0];
  if (0 != igraph_vector_int_init(&c_membership, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_membership);
  if (0 != igraph_matrix_int_init(&c_memberships, 0, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_matrix_int_destroy, &c_memberships);
  if (0 != igraph_vector_init(&c_modularity, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_modularity);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_community_multilevel(&c_graph, (Rf_isNull(weights) ? 0 : &c_weights), c_resolution, &c_membership, &c_memberships, &c_modularity));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(3));
  PROTECT(r_names=NEW_CHARACTER(3));
  PROTECT(membership=R_igraph_vector_int_to_SEXP(&c_membership));
  igraph_vector_int_destroy(&c_membership);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(memberships=R_igraph_matrix_int_to_SEXP(&c_memberships));
  igraph_matrix_int_destroy(&c_memberships);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(modularity=R_igraph_vector_to_SEXP(&c_modularity));
  igraph_vector_destroy(&c_modularity);
  IGRAPH_FINALLY_CLEAN(1);
  SET_VECTOR_ELT(r_result, 0, membership);
  SET_VECTOR_ELT(r_result, 1, memberships);
  SET_VECTOR_ELT(r_result, 2, modularity);
  SET_STRING_ELT(r_names, 0, Rf_mkChar("membership"));
  SET_STRING_ELT(r_names, 1, Rf_mkChar("memberships"));
  SET_STRING_ELT(r_names, 2, Rf_mkChar("modularity"));
  SET_NAMES(r_result, r_names);
  UNPROTECT(4);

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_community_optimal_modularity        /
/-------------------------------------------*/
SEXP R_igraph_community_optimal_modularity(SEXP graph, SEXP weights) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_real_t c_modularity;
  igraph_vector_int_t c_membership;
  igraph_vector_t c_weights;
  SEXP modularity;
  SEXP membership;

  SEXP r_result, r_names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_int_init(&c_membership, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_membership);
  if (!Rf_isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_community_optimal_modularity(&c_graph, &c_modularity, &c_membership, (Rf_isNull(weights) ? 0 : &c_weights)));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(2));
  PROTECT(r_names=NEW_CHARACTER(2));
  PROTECT(modularity=NEW_NUMERIC(1));
  REAL(modularity)[0]=c_modularity;
  PROTECT(membership=R_igraph_vector_int_to_SEXP(&c_membership));
  igraph_vector_int_destroy(&c_membership);
  IGRAPH_FINALLY_CLEAN(1);
  SET_VECTOR_ELT(r_result, 0, modularity);
  SET_VECTOR_ELT(r_result, 1, membership);
  SET_STRING_ELT(r_names, 0, Rf_mkChar("modularity"));
  SET_STRING_ELT(r_names, 1, Rf_mkChar("membership"));
  SET_NAMES(r_result, r_names);
  UNPROTECT(3);

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_community_leiden                    /
/-------------------------------------------*/
SEXP R_igraph_community_leiden(SEXP graph, SEXP weights, SEXP vertex_weights, SEXP resolution, SEXP beta, SEXP start, SEXP n_iterations, SEXP membership) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_t c_weights;
  igraph_vector_t c_vertex_weights;
  igraph_real_t c_resolution;
  igraph_real_t c_beta;
  igraph_bool_t c_start;
  igraph_integer_t c_n_iterations;
  igraph_vector_int_t c_membership;
  igraph_integer_t c_nb_clusters;
  igraph_real_t c_quality;
  SEXP nb_clusters;
  SEXP quality;

  SEXP r_result, r_names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (!Rf_isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
  if (!Rf_isNull(vertex_weights)) { R_SEXP_to_vector(vertex_weights, &c_vertex_weights); }
  c_resolution=REAL(resolution)[0];
  c_beta=REAL(beta)[0];
  c_start=LOGICAL(start)[0];
  c_n_iterations=INTEGER(n_iterations)[0];
  R_SEXP_to_vector_int(membership, &c_membership);
  c_nb_clusters=0;
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_community_leiden(&c_graph, (Rf_isNull(weights) ? 0 : &c_weights), (Rf_isNull(vertex_weights) ? 0 : &c_vertex_weights), c_resolution, c_beta, c_start, c_n_iterations, &c_membership, &c_nb_clusters, &c_quality));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(3));
  PROTECT(r_names=NEW_CHARACTER(3));
  PROTECT(membership=R_igraph_vector_int_to_SEXP(&c_membership));
  igraph_vector_int_destroy(&c_membership);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(nb_clusters=NEW_INTEGER(1));
  INTEGER(nb_clusters)[0]=c_nb_clusters;
  PROTECT(quality=NEW_NUMERIC(1));
  REAL(quality)[0]=c_quality;
  SET_VECTOR_ELT(r_result, 0, membership);
  SET_VECTOR_ELT(r_result, 1, nb_clusters);
  SET_VECTOR_ELT(r_result, 2, quality);
  SET_STRING_ELT(r_names, 0, Rf_mkChar("membership"));
  SET_STRING_ELT(r_names, 1, Rf_mkChar("nb_clusters"));
  SET_STRING_ELT(r_names, 2, Rf_mkChar("quality"));
  SET_NAMES(r_result, r_names);
  UNPROTECT(4);

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_split_join_distance                 /
/-------------------------------------------*/
SEXP R_igraph_split_join_distance(SEXP comm1, SEXP comm2) {
                                        /* Declarations */
  igraph_vector_int_t c_comm1;
  igraph_vector_int_t c_comm2;
  igraph_integer_t c_distance12;
  igraph_integer_t c_distance21;
  SEXP distance12;
  SEXP distance21;

  SEXP r_result, r_names;
                                        /* Convert input */
  R_SEXP_to_vector_int(comm1, &c_comm1);
  R_SEXP_to_vector_int(comm2, &c_comm2);
  c_distance12=0;
  c_distance21=0;
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_split_join_distance(&c_comm1, &c_comm2, &c_distance12, &c_distance21));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(2));
  PROTECT(r_names=NEW_CHARACTER(2));
  PROTECT(distance12=NEW_INTEGER(1));
  INTEGER(distance12)[0]=c_distance12;
  PROTECT(distance21=NEW_INTEGER(1));
  INTEGER(distance21)[0]=c_distance21;
  SET_VECTOR_ELT(r_result, 0, distance12);
  SET_VECTOR_ELT(r_result, 1, distance21);
  SET_STRING_ELT(r_names, 0, Rf_mkChar("distance12"));
  SET_STRING_ELT(r_names, 1, Rf_mkChar("distance21"));
  SET_NAMES(r_result, r_names);
  UNPROTECT(3);

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_community_infomap                   /
/-------------------------------------------*/
SEXP R_igraph_community_infomap(SEXP graph, SEXP e_weights, SEXP v_weights, SEXP nb_trials) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_t c_e_weights;
  igraph_vector_t c_v_weights;
  igraph_integer_t c_nb_trials;
  igraph_vector_int_t c_membership;
  igraph_real_t c_codelength;
  SEXP membership;
  SEXP codelength;

  SEXP r_result, r_names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (!Rf_isNull(e_weights)) { R_SEXP_to_vector(e_weights, &c_e_weights); }
  if (!Rf_isNull(v_weights)) { R_SEXP_to_vector(v_weights, &c_v_weights); }
  c_nb_trials=INTEGER(nb_trials)[0];
  if (0 != igraph_vector_int_init(&c_membership, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_membership);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_community_infomap(&c_graph, (Rf_isNull(e_weights) ? 0 : &c_e_weights), (Rf_isNull(v_weights) ? 0 : &c_v_weights), c_nb_trials, &c_membership, &c_codelength));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(2));
  PROTECT(r_names=NEW_CHARACTER(2));
  PROTECT(membership=R_igraph_vector_int_to_SEXP(&c_membership));
  igraph_vector_int_destroy(&c_membership);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(codelength=NEW_NUMERIC(1));
  REAL(codelength)[0]=c_codelength;
  SET_VECTOR_ELT(r_result, 0, membership);
  SET_VECTOR_ELT(r_result, 1, codelength);
  SET_STRING_ELT(r_names, 0, Rf_mkChar("membership"));
  SET_STRING_ELT(r_names, 1, Rf_mkChar("codelength"));
  SET_NAMES(r_result, r_names);
  UNPROTECT(3);

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_hrg_fit                             /
/-------------------------------------------*/
SEXP R_igraph_hrg_fit(SEXP graph, SEXP hrg, SEXP start, SEXP steps) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_hrg_t c_hrg;
  igraph_bool_t c_start;
  igraph_integer_t c_steps;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != R_SEXP_to_hrg_copy(hrg, &c_hrg)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_hrg_destroy, &c_hrg);
  c_start=LOGICAL(start)[0];
  c_steps=INTEGER(steps)[0];
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_hrg_fit(&c_graph, &c_hrg, c_start, c_steps));

                                        /* Convert output */
  PROTECT(hrg=R_igraph_hrg_to_SEXP(&c_hrg));
  igraph_hrg_destroy(&c_hrg);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = hrg;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_hrg_sample                          /
/-------------------------------------------*/
SEXP R_igraph_hrg_sample(SEXP hrg) {
                                        /* Declarations */
  igraph_hrg_t c_hrg;
  igraph_t c_sample;
  SEXP sample;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_hrg(hrg, &c_hrg);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_hrg_sample(&c_hrg, &c_sample));

                                        /* Convert output */
  IGRAPH_FINALLY(igraph_destroy, &c_sample);
  PROTECT(sample=R_igraph_to_SEXP(&c_sample));
  igraph_destroy(&c_sample);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = sample;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_hrg_sample_many                     /
/-------------------------------------------*/
SEXP R_igraph_hrg_sample_many(SEXP hrg, SEXP num_samples) {
                                        /* Declarations */
  igraph_hrg_t c_hrg;
  igraph_graph_list_t c_samples;
  igraph_integer_t c_num_samples;
  SEXP samples;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_hrg(hrg, &c_hrg);
  if (0 != igraph_graph_list_init(&c_samples, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_graph_list_destroy, &c_samples);
  c_num_samples=INTEGER(num_samples)[0];
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_hrg_sample_many(&c_hrg, &c_samples, c_num_samples));

                                        /* Convert output */
  PROTECT(samples=R_igraph_graphlist_to_SEXP(&c_samples));
  igraph_graph_list_destroy(&c_samples);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = samples;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_hrg_game                            /
/-------------------------------------------*/
SEXP R_igraph_hrg_game(SEXP hrg) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_hrg_t c_hrg;
  SEXP graph;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_hrg(hrg, &c_hrg);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_hrg_game(&c_graph, &c_hrg));

                                        /* Convert output */
  IGRAPH_FINALLY(igraph_destroy, &c_graph);
  PROTECT(graph=R_igraph_to_SEXP(&c_graph));
  igraph_destroy(&c_graph);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = graph;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_hrg_dendrogram                      /
/-------------------------------------------*/
SEXP R_igraph_hrg_dendrogram(SEXP hrg) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_hrg_t c_hrg;
  SEXP graph;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_hrg(hrg, &c_hrg);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_hrg_dendrogram(&c_graph, &c_hrg));

                                        /* Convert output */
  IGRAPH_FINALLY(igraph_destroy, &c_graph);
  PROTECT(graph=R_igraph_to_SEXP(&c_graph));
  igraph_destroy(&c_graph);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = graph;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_hrg_consensus                       /
/-------------------------------------------*/
SEXP R_igraph_hrg_consensus(SEXP graph, SEXP hrg, SEXP start, SEXP num_samples) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_int_t c_parents;
  igraph_vector_t c_weights;
  igraph_hrg_t c_hrg;
  igraph_bool_t c_start;
  igraph_integer_t c_num_samples;
  SEXP parents;
  SEXP weights;

  SEXP r_result, r_names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_int_init(&c_parents, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_parents);
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
  IGRAPH_R_CHECK(igraph_hrg_consensus(&c_graph, &c_parents, &c_weights, &c_hrg, c_start, c_num_samples));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(3));
  PROTECT(r_names=NEW_CHARACTER(3));
  PROTECT(parents=R_igraph_vector_int_to_SEXP(&c_parents));
  igraph_vector_int_destroy(&c_parents);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(weights=R_igraph_vector_to_SEXP(&c_weights));
  igraph_vector_destroy(&c_weights);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(hrg=R_igraph_hrg_to_SEXP(&c_hrg));
  igraph_hrg_destroy(&c_hrg);
  IGRAPH_FINALLY_CLEAN(1);
  SET_VECTOR_ELT(r_result, 0, parents);
  SET_VECTOR_ELT(r_result, 1, weights);
  SET_VECTOR_ELT(r_result, 2, hrg);
  SET_STRING_ELT(r_names, 0, Rf_mkChar("parents"));
  SET_STRING_ELT(r_names, 1, Rf_mkChar("weights"));
  SET_STRING_ELT(r_names, 2, Rf_mkChar("hrg"));
  SET_NAMES(r_result, r_names);
  UNPROTECT(4);

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_hrg_predict                         /
/-------------------------------------------*/
SEXP R_igraph_hrg_predict(SEXP graph, SEXP hrg, SEXP start, SEXP num_samples, SEXP num_bins) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_int_t c_edges;
  igraph_vector_t c_prob;
  igraph_hrg_t c_hrg;
  igraph_bool_t c_start;
  igraph_integer_t c_num_samples;
  igraph_integer_t c_num_bins;
  SEXP edges;
  SEXP prob;

  SEXP r_result, r_names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_int_init(&c_edges, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_edges);
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
  IGRAPH_R_CHECK(igraph_hrg_predict(&c_graph, &c_edges, &c_prob, &c_hrg, c_start, c_num_samples, c_num_bins));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(3));
  PROTECT(r_names=NEW_CHARACTER(3));
  PROTECT(edges=R_igraph_vector_int_to_SEXP(&c_edges));
  igraph_vector_int_destroy(&c_edges);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(prob=R_igraph_vector_to_SEXP(&c_prob));
  igraph_vector_destroy(&c_prob);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(hrg=R_igraph_hrg_to_SEXP(&c_hrg));
  igraph_hrg_destroy(&c_hrg);
  IGRAPH_FINALLY_CLEAN(1);
  SET_VECTOR_ELT(r_result, 0, edges);
  SET_VECTOR_ELT(r_result, 1, prob);
  SET_VECTOR_ELT(r_result, 2, hrg);
  SET_STRING_ELT(r_names, 0, Rf_mkChar("edges"));
  SET_STRING_ELT(r_names, 1, Rf_mkChar("prob"));
  SET_STRING_ELT(r_names, 2, Rf_mkChar("hrg"));
  SET_NAMES(r_result, r_names);
  UNPROTECT(4);

  UNPROTECT(1);
  return(r_result);
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

  SEXP r_result;
                                        /* Convert input */
  if (0 != igraph_hrg_init(&c_hrg, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_hrg_destroy, &c_hrg);
  R_SEXP_to_igraph(graph, &c_graph);
  R_SEXP_to_vector(prob, &c_prob);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_hrg_create(&c_hrg, &c_graph, &c_prob));

                                        /* Convert output */
  PROTECT(hrg=R_igraph_hrg_to_SEXP(&c_hrg));
  igraph_hrg_destroy(&c_hrg);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = hrg;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_hrg_resize                          /
/-------------------------------------------*/
SEXP R_igraph_hrg_resize(SEXP hrg, SEXP newsize) {
                                        /* Declarations */
  igraph_hrg_t c_hrg;
  igraph_integer_t c_newsize;

  SEXP r_result;
                                        /* Convert input */
  if (0 != R_SEXP_to_hrg_copy(hrg, &c_hrg)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_hrg_destroy, &c_hrg);
  c_newsize=INTEGER(newsize)[0];
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_hrg_resize(&c_hrg, c_newsize));

                                        /* Convert output */
  PROTECT(hrg=R_igraph_hrg_to_SEXP(&c_hrg));
  igraph_hrg_destroy(&c_hrg);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = hrg;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_hrg_size                            /
/-------------------------------------------*/
SEXP R_igraph_hrg_size(SEXP hrg) {
                                        /* Declarations */
  igraph_hrg_t c_hrg;
  igraph_integer_t c_result;
  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_hrg(hrg, &c_hrg);
                                        /* Call igraph */
  c_result=igraph_hrg_size(&c_hrg);

                                        /* Convert output */

  PROTECT(r_result=NEW_INTEGER(1));
  INTEGER(r_result)[0]=c_result;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_get_adjacency_sparse                /
/-------------------------------------------*/
SEXP R_igraph_get_adjacency_sparse(SEXP graph, SEXP type, SEXP weights, SEXP loops) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_sparsemat_t c_sparsemat;
  igraph_get_adjacency_t c_type;
  igraph_vector_t c_weights;
  igraph_loops_t c_loops;
  SEXP sparsemat;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_sparsemat_init(&c_sparsemat, 0, 0, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_sparsemat_destroy, &c_sparsemat);
  c_type = (igraph_get_adjacency_t) Rf_asInteger(type);
  if (!Rf_isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
  c_loops = (igraph_loops_t) Rf_asInteger(loops);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_get_adjacency_sparse(&c_graph, &c_sparsemat, c_type, (Rf_isNull(weights) ? 0 : &c_weights), c_loops));

                                        /* Convert output */
  PROTECT(sparsemat=R_igraph_sparsemat_to_SEXP(&c_sparsemat));
  igraph_sparsemat_destroy(&c_sparsemat);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = sparsemat;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_get_stochastic                      /
/-------------------------------------------*/
SEXP R_igraph_get_stochastic(SEXP graph, SEXP column_wise, SEXP weights) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_matrix_t c_res;
  igraph_bool_t c_column_wise;
  igraph_vector_t c_weights;
  SEXP res;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_matrix_init(&c_res, 0, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_matrix_destroy, &c_res);
  c_column_wise=LOGICAL(column_wise)[0];
  if (!Rf_isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_get_stochastic(&c_graph, &c_res, c_column_wise, (Rf_isNull(weights) ? 0 : &c_weights)));

                                        /* Convert output */
  PROTECT(res=R_igraph_matrix_to_SEXP(&c_res));
  igraph_matrix_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = res;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_get_stochastic_sparse               /
/-------------------------------------------*/
SEXP R_igraph_get_stochastic_sparse(SEXP graph, SEXP column_wise, SEXP weights) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_sparsemat_t c_sparsemat;
  igraph_bool_t c_column_wise;
  igraph_vector_t c_weights;
  SEXP sparsemat;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_sparsemat_init(&c_sparsemat, 0, 0, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_sparsemat_destroy, &c_sparsemat);
  c_column_wise=LOGICAL(column_wise)[0];
  if (!Rf_isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_get_stochastic_sparse(&c_graph, &c_sparsemat, c_column_wise, (Rf_isNull(weights) ? 0 : &c_weights)));

                                        /* Convert output */
  PROTECT(sparsemat=R_igraph_sparsemat_to_SEXP(&c_sparsemat));
  igraph_sparsemat_destroy(&c_sparsemat);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = sparsemat;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_to_directed                         /
/-------------------------------------------*/
SEXP R_igraph_to_directed(SEXP graph, SEXP mode) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_to_directed_t c_mode;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph_copy(graph, &c_graph);
  IGRAPH_FINALLY(igraph_destroy, &c_graph);
  c_mode = (igraph_to_directed_t) Rf_asInteger(mode);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_to_directed(&c_graph, c_mode));

                                        /* Convert output */
  PROTECT(graph=R_igraph_to_SEXP(&c_graph));
  igraph_destroy(&c_graph);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = graph;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_to_undirected                       /
/-------------------------------------------*/
SEXP R_igraph_to_undirected(SEXP graph, SEXP mode, SEXP edge_attr_comb) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_to_undirected_t c_mode;
  igraph_attribute_combination_t c_edge_attr_comb;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph_copy(graph, &c_graph);
  IGRAPH_FINALLY(igraph_destroy, &c_graph);
  c_mode = (igraph_to_undirected_t) Rf_asInteger(mode);
  R_SEXP_to_attr_comb(edge_attr_comb, &c_edge_attr_comb);
  IGRAPH_FINALLY(igraph_attribute_combination_destroy, &c_edge_attr_comb);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_to_undirected(&c_graph, c_mode, &c_edge_attr_comb));

                                        /* Convert output */
  PROTECT(graph=R_igraph_to_SEXP(&c_graph));
  igraph_destroy(&c_graph);
  IGRAPH_FINALLY_CLEAN(1);
  igraph_attribute_combination_destroy(&c_edge_attr_comb);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = graph;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_read_graph_dimacs_flow              /
/-------------------------------------------*/
SEXP R_igraph_read_graph_dimacs_flow(SEXP instream, SEXP directed) {
                                        /* Declarations */
  igraph_t c_graph;
  FILE* c_instream;
  igraph_strvector_t c_problem;
  igraph_vector_int_t c_label;
  igraph_integer_t c_source;
  igraph_integer_t c_target;
  igraph_vector_t c_capacity;
  igraph_bool_t c_directed;
  SEXP graph;
  SEXP problem;
  SEXP label;
  SEXP source;
  SEXP target;
  SEXP capacity;

  SEXP r_result, r_names;
                                        /* Convert input */
  if (0 != igraph_strvector_init(&c_problem, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_strvector_destroy, &c_problem);
  if (0 != igraph_vector_int_init(&c_label, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_label);
  c_source=0;
  c_target=0;
  if (0 != igraph_vector_init(&c_capacity, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_capacity);
  c_directed=LOGICAL(directed)[0];
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_read_graph_dimacs_flow(&c_graph, c_instream, &c_problem, &c_label, &c_source, &c_target, &c_capacity, c_directed));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(6));
  PROTECT(r_names=NEW_CHARACTER(6));
  IGRAPH_FINALLY(igraph_destroy, &c_graph);
  PROTECT(graph=R_igraph_to_SEXP(&c_graph));
  igraph_destroy(&c_graph);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(problem=R_igraph_strvector_to_SEXP(&c_problem));
  igraph_strvector_destroy(&c_problem);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(label=R_igraph_vector_int_to_SEXP(&c_label));
  igraph_vector_int_destroy(&c_label);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(source=NEW_INTEGER(1));
  INTEGER(source)[0]=c_source;
  PROTECT(target=NEW_INTEGER(1));
  INTEGER(target)[0]=c_target;
  PROTECT(capacity=R_igraph_vector_to_SEXP(&c_capacity));
  igraph_vector_destroy(&c_capacity);
  IGRAPH_FINALLY_CLEAN(1);
  SET_VECTOR_ELT(r_result, 0, graph);
  SET_VECTOR_ELT(r_result, 1, problem);
  SET_VECTOR_ELT(r_result, 2, label);
  SET_VECTOR_ELT(r_result, 3, source);
  SET_VECTOR_ELT(r_result, 4, target);
  SET_VECTOR_ELT(r_result, 5, capacity);
  SET_STRING_ELT(r_names, 0, Rf_mkChar("graph"));
  SET_STRING_ELT(r_names, 1, Rf_mkChar("problem"));
  SET_STRING_ELT(r_names, 2, Rf_mkChar("label"));
  SET_STRING_ELT(r_names, 3, Rf_mkChar("source"));
  SET_STRING_ELT(r_names, 4, Rf_mkChar("target"));
  SET_STRING_ELT(r_names, 5, Rf_mkChar("capacity"));
  SET_NAMES(r_result, r_names);
  UNPROTECT(7);

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_write_graph_dimacs_flow             /
/-------------------------------------------*/
SEXP R_igraph_write_graph_dimacs_flow(SEXP graph, SEXP outstream, SEXP source, SEXP target, SEXP capacity) {
                                        /* Declarations */
  igraph_t c_graph;
  FILE* c_outstream;
  igraph_integer_t c_source;
  igraph_integer_t c_target;
  igraph_vector_t c_capacity;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph_copy(graph, &c_graph);
  IGRAPH_FINALLY(igraph_destroy, &c_graph);
  c_source = (igraph_integer_t) REAL(source)[0];
  c_target = (igraph_integer_t) REAL(target)[0];
  R_SEXP_to_vector(capacity, &c_capacity);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_write_graph_dimacs_flow(&c_graph, c_outstream, c_source, c_target, &c_capacity));

                                        /* Convert output */
  PROTECT(graph=R_igraph_to_SEXP(&c_graph));
  igraph_destroy(&c_graph);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = graph;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_dyad_census                         /
/-------------------------------------------*/
SEXP R_igraph_dyad_census(SEXP graph) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_real_t c_mut;
  igraph_real_t c_asym;
  igraph_real_t c_null;
  SEXP mut;
  SEXP asym;
  SEXP null;

  SEXP r_result, r_names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_dyad_census(&c_graph, &c_mut, &c_asym, &c_null));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(3));
  PROTECT(r_names=NEW_CHARACTER(3));
  PROTECT(mut=NEW_NUMERIC(1));
  REAL(mut)[0]=c_mut;
  PROTECT(asym=NEW_NUMERIC(1));
  REAL(asym)[0]=c_asym;
  PROTECT(null=NEW_NUMERIC(1));
  REAL(null)[0]=c_null;
  SET_VECTOR_ELT(r_result, 0, mut);
  SET_VECTOR_ELT(r_result, 1, asym);
  SET_VECTOR_ELT(r_result, 2, null);
  SET_STRING_ELT(r_names, 0, Rf_mkChar("mut"));
  SET_STRING_ELT(r_names, 1, Rf_mkChar("asym"));
  SET_STRING_ELT(r_names, 2, Rf_mkChar("null"));
  SET_NAMES(r_result, r_names);
  UNPROTECT(4);

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_triad_census                        /
/-------------------------------------------*/
SEXP R_igraph_triad_census(SEXP graph) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_t c_res;
  SEXP res;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_init(&c_res, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_res);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_triad_census(&c_graph, &c_res));

                                        /* Convert output */
  PROTECT(res=R_igraph_vector_to_SEXP(&c_res));
  igraph_vector_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = res;

  UNPROTECT(1);
  return(r_result);
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

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_init(&c_res, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_res);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_adjacent_triangles(&c_graph, &c_res, c_vids));

                                        /* Convert output */
  PROTECT(res=R_igraph_vector_to_SEXP(&c_res));
  igraph_vector_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = res;

  UNPROTECT(1);
  return(r_result);
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

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_init(&c_res, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_res);
  if (!Rf_isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
  c_mode = (igraph_neimode_t) Rf_asInteger(mode);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_local_scan_0(&c_graph, &c_res, (Rf_isNull(weights) ? 0 : &c_weights), c_mode));

                                        /* Convert output */
  PROTECT(res=R_igraph_vector_to_SEXP(&c_res));
  igraph_vector_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = res;

  UNPROTECT(1);
  return(r_result);
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

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(us, &c_us);
  R_SEXP_to_igraph(them, &c_them);
  if (0 != igraph_vector_init(&c_res, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_res);
  if (!Rf_isNull(weights_them)) { R_SEXP_to_vector(weights_them, &c_weights_them); }
  c_mode = (igraph_neimode_t) Rf_asInteger(mode);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_local_scan_0_them(&c_us, &c_them, &c_res, (Rf_isNull(weights_them) ? 0 : &c_weights_them), c_mode));

                                        /* Convert output */
  PROTECT(res=R_igraph_vector_to_SEXP(&c_res));
  igraph_vector_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = res;

  UNPROTECT(1);
  return(r_result);
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

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_init(&c_res, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_res);
  if (!Rf_isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
  c_mode = (igraph_neimode_t) Rf_asInteger(mode);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_local_scan_1_ecount(&c_graph, &c_res, (Rf_isNull(weights) ? 0 : &c_weights), c_mode));

                                        /* Convert output */
  PROTECT(res=R_igraph_vector_to_SEXP(&c_res));
  igraph_vector_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = res;

  UNPROTECT(1);
  return(r_result);
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

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(us, &c_us);
  R_SEXP_to_igraph(them, &c_them);
  if (0 != igraph_vector_init(&c_res, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_res);
  if (!Rf_isNull(weights_them)) { R_SEXP_to_vector(weights_them, &c_weights_them); }
  c_mode = (igraph_neimode_t) Rf_asInteger(mode);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_local_scan_1_ecount_them(&c_us, &c_them, &c_res, (Rf_isNull(weights_them) ? 0 : &c_weights_them), c_mode));

                                        /* Convert output */
  PROTECT(res=R_igraph_vector_to_SEXP(&c_res));
  igraph_vector_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = res;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_local_scan_k_ecount                 /
/-------------------------------------------*/
SEXP R_igraph_local_scan_k_ecount(SEXP graph, SEXP k, SEXP weights, SEXP mode) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_integer_t c_k;
  igraph_vector_t c_res;
  igraph_vector_t c_weights;
  igraph_neimode_t c_mode;
  SEXP res;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  c_k=INTEGER(k)[0];
  if (0 != igraph_vector_init(&c_res, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_res);
  if (!Rf_isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
  c_mode = (igraph_neimode_t) Rf_asInteger(mode);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_local_scan_k_ecount(&c_graph, c_k, &c_res, (Rf_isNull(weights) ? 0 : &c_weights), c_mode));

                                        /* Convert output */
  PROTECT(res=R_igraph_vector_to_SEXP(&c_res));
  igraph_vector_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = res;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_local_scan_k_ecount_them            /
/-------------------------------------------*/
SEXP R_igraph_local_scan_k_ecount_them(SEXP us, SEXP them, SEXP k, SEXP weights_them, SEXP mode) {
                                        /* Declarations */
  igraph_t c_us;
  igraph_t c_them;
  igraph_integer_t c_k;
  igraph_vector_t c_res;
  igraph_vector_t c_weights_them;
  igraph_neimode_t c_mode;
  SEXP res;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(us, &c_us);
  R_SEXP_to_igraph(them, &c_them);
  c_k=INTEGER(k)[0];
  if (0 != igraph_vector_init(&c_res, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_res);
  if (!Rf_isNull(weights_them)) { R_SEXP_to_vector(weights_them, &c_weights_them); }
  c_mode = (igraph_neimode_t) Rf_asInteger(mode);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_local_scan_k_ecount_them(&c_us, &c_them, c_k, &c_res, (Rf_isNull(weights_them) ? 0 : &c_weights_them), c_mode));

                                        /* Convert output */
  PROTECT(res=R_igraph_vector_to_SEXP(&c_res));
  igraph_vector_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = res;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_local_scan_neighborhood_ecount      /
/-------------------------------------------*/
SEXP R_igraph_local_scan_neighborhood_ecount(SEXP graph, SEXP weights, SEXP neighborhoods) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_t c_res;
  igraph_vector_t c_weights;
  igraph_vector_int_list_t c_neighborhoods;
  SEXP res;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_init(&c_res, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_res);
  if (!Rf_isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
  if (!Rf_isNull(neighborhoods)) { R_igraph_SEXP_to_vector_int_list(neighborhoods, &c_neighborhoods); }
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_local_scan_neighborhood_ecount(&c_graph, &c_res, (Rf_isNull(weights) ? 0 : &c_weights), &c_neighborhoods));

                                        /* Convert output */
  PROTECT(res=R_igraph_vector_to_SEXP(&c_res));
  igraph_vector_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = res;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_local_scan_subset_ecount            /
/-------------------------------------------*/
SEXP R_igraph_local_scan_subset_ecount(SEXP graph, SEXP weights, SEXP subsets) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_t c_res;
  igraph_vector_t c_weights;
  igraph_vector_int_list_t c_subsets;
  SEXP res;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_init(&c_res, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_res);
  if (!Rf_isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
  if (!Rf_isNull(subsets)) { R_igraph_SEXP_to_vector_int_list(subsets, &c_subsets); }
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_local_scan_subset_ecount(&c_graph, &c_res, (Rf_isNull(weights) ? 0 : &c_weights), &c_subsets));

                                        /* Convert output */
  PROTECT(res=R_igraph_vector_to_SEXP(&c_res));
  igraph_vector_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = res;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_list_triangles                      /
/-------------------------------------------*/
SEXP R_igraph_list_triangles(SEXP graph) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_int_t c_res;
  SEXP res;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_int_init(&c_res, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_res);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_list_triangles(&c_graph, &c_res));

                                        /* Convert output */
  PROTECT(res=R_igraph_vector_int_to_SEXP(&c_res));
  igraph_vector_int_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = res;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_induced_subgraph_map                /
/-------------------------------------------*/
SEXP R_igraph_induced_subgraph_map(SEXP graph, SEXP vids, SEXP impl) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_t c_res;
  igraph_vs_t c_vids;
  igraph_subgraph_implementation_t c_impl;
  igraph_vector_int_t c_map;
  igraph_vector_int_t c_invmap;
  SEXP res;
  SEXP map;
  SEXP invmap;

  SEXP r_result, r_names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  c_impl = (igraph_subgraph_implementation_t) Rf_asInteger(impl);
  if (0 != igraph_vector_int_init(&c_map, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_map);
  if (0 != igraph_vector_int_init(&c_invmap, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_invmap);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_induced_subgraph_map(&c_graph, &c_res, c_vids, c_impl, &c_map, &c_invmap));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(3));
  PROTECT(r_names=NEW_CHARACTER(3));
  IGRAPH_FINALLY(igraph_destroy, &c_res);
  PROTECT(res=R_igraph_to_SEXP(&c_res));
  igraph_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(map=R_igraph_vector_int_to_SEXP(&c_map));
  igraph_vector_int_destroy(&c_map);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(invmap=R_igraph_vector_int_to_SEXP(&c_invmap));
  igraph_vector_int_destroy(&c_invmap);
  IGRAPH_FINALLY_CLEAN(1);
  SET_VECTOR_ELT(r_result, 0, res);
  SET_VECTOR_ELT(r_result, 1, map);
  SET_VECTOR_ELT(r_result, 2, invmap);
  SET_STRING_ELT(r_names, 0, Rf_mkChar("res"));
  SET_STRING_ELT(r_names, 1, Rf_mkChar("map"));
  SET_STRING_ELT(r_names, 2, Rf_mkChar("invmap"));
  SET_NAMES(r_result, r_names);
  UNPROTECT(4);

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_gomory_hu_tree                      /
/-------------------------------------------*/
SEXP R_igraph_gomory_hu_tree(SEXP graph, SEXP capacity) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_t c_tree;
  igraph_vector_t c_flows;
  igraph_vector_t c_capacity;
  SEXP tree;
  SEXP flows;

  SEXP r_result, r_names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_init(&c_flows, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_flows);
  if (!Rf_isNull(capacity)) { R_SEXP_to_vector(capacity, &c_capacity); }
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_gomory_hu_tree(&c_graph, &c_tree, &c_flows, (Rf_isNull(capacity) ? 0 : &c_capacity)));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(2));
  PROTECT(r_names=NEW_CHARACTER(2));
  IGRAPH_FINALLY(igraph_destroy, &c_tree);
  PROTECT(tree=R_igraph_to_SEXP(&c_tree));
  igraph_destroy(&c_tree);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(flows=R_igraph_vector_to_SEXP(&c_flows));
  igraph_vector_destroy(&c_flows);
  IGRAPH_FINALLY_CLEAN(1);
  SET_VECTOR_ELT(r_result, 0, tree);
  SET_VECTOR_ELT(r_result, 1, flows);
  SET_STRING_ELT(r_names, 0, Rf_mkChar("tree"));
  SET_STRING_ELT(r_names, 1, Rf_mkChar("flows"));
  SET_NAMES(r_result, r_names);
  UNPROTECT(3);

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_maxflow                             /
/-------------------------------------------*/
SEXP R_igraph_maxflow(SEXP graph, SEXP source, SEXP target, SEXP capacity) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_real_t c_value;
  igraph_vector_t c_flow;
  igraph_vector_int_t c_cut;
  igraph_vector_int_t c_partition1;
  igraph_vector_int_t c_partition2;
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

  SEXP r_result, r_names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_init(&c_flow, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_flow);
  if (0 != igraph_vector_int_init(&c_cut, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_cut);
  if (0 != igraph_vector_int_init(&c_partition1, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_partition1);
  if (0 != igraph_vector_int_init(&c_partition2, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_partition2);
  c_source = (igraph_integer_t) REAL(source)[0];
  c_target = (igraph_integer_t) REAL(target)[0];
  if (!Rf_isNull(capacity)) { R_SEXP_to_vector(capacity, &c_capacity); }
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_maxflow(&c_graph, &c_value, &c_flow, &c_cut, &c_partition1, &c_partition2, c_source, c_target, (Rf_isNull(capacity) ? 0 : &c_capacity), &c_stats));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(6));
  PROTECT(r_names=NEW_CHARACTER(6));
  PROTECT(value=NEW_NUMERIC(1));
  REAL(value)[0]=c_value;
  PROTECT(flow=R_igraph_vector_to_SEXP(&c_flow));
  igraph_vector_destroy(&c_flow);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(cut=R_igraph_vector_int_to_SEXP(&c_cut));
  igraph_vector_int_destroy(&c_cut);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(partition1=R_igraph_vector_int_to_SEXP(&c_partition1));
  igraph_vector_int_destroy(&c_partition1);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(partition2=R_igraph_vector_int_to_SEXP(&c_partition2));
  igraph_vector_int_destroy(&c_partition2);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(stats=R_igraph_maxflow_stats_to_SEXP(&c_stats));
  SET_VECTOR_ELT(r_result, 0, value);
  SET_VECTOR_ELT(r_result, 1, flow);
  SET_VECTOR_ELT(r_result, 2, cut);
  SET_VECTOR_ELT(r_result, 3, partition1);
  SET_VECTOR_ELT(r_result, 4, partition2);
  SET_VECTOR_ELT(r_result, 5, stats);
  SET_STRING_ELT(r_names, 0, Rf_mkChar("value"));
  SET_STRING_ELT(r_names, 1, Rf_mkChar("flow"));
  SET_STRING_ELT(r_names, 2, Rf_mkChar("cut"));
  SET_STRING_ELT(r_names, 3, Rf_mkChar("partition1"));
  SET_STRING_ELT(r_names, 4, Rf_mkChar("partition2"));
  SET_STRING_ELT(r_names, 5, Rf_mkChar("stats"));
  SET_NAMES(r_result, r_names);
  UNPROTECT(7);

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_st_mincut                           /
/-------------------------------------------*/
SEXP R_igraph_st_mincut(SEXP graph, SEXP source, SEXP target, SEXP capacity) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_real_t c_value;
  igraph_vector_int_t c_cut;
  igraph_vector_int_t c_partition1;
  igraph_vector_int_t c_partition2;
  igraph_integer_t c_source;
  igraph_integer_t c_target;
  igraph_vector_t c_capacity;
  SEXP value;
  SEXP cut;
  SEXP partition1;
  SEXP partition2;

  SEXP r_result, r_names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_int_init(&c_cut, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_cut);
  if (0 != igraph_vector_int_init(&c_partition1, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_partition1);
  if (0 != igraph_vector_int_init(&c_partition2, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_partition2);
  c_source = (igraph_integer_t) REAL(source)[0];
  c_target = (igraph_integer_t) REAL(target)[0];
  if (!Rf_isNull(capacity)) { R_SEXP_to_vector(capacity, &c_capacity); }
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_st_mincut(&c_graph, &c_value, &c_cut, &c_partition1, &c_partition2, c_source, c_target, (Rf_isNull(capacity) ? 0 : &c_capacity)));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(4));
  PROTECT(r_names=NEW_CHARACTER(4));
  PROTECT(value=NEW_NUMERIC(1));
  REAL(value)[0]=c_value;
  PROTECT(cut=R_igraph_vector_int_to_SEXP(&c_cut));
  igraph_vector_int_destroy(&c_cut);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(partition1=R_igraph_vector_int_to_SEXP(&c_partition1));
  igraph_vector_int_destroy(&c_partition1);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(partition2=R_igraph_vector_int_to_SEXP(&c_partition2));
  igraph_vector_int_destroy(&c_partition2);
  IGRAPH_FINALLY_CLEAN(1);
  SET_VECTOR_ELT(r_result, 0, value);
  SET_VECTOR_ELT(r_result, 1, cut);
  SET_VECTOR_ELT(r_result, 2, partition1);
  SET_VECTOR_ELT(r_result, 3, partition2);
  SET_STRING_ELT(r_names, 0, Rf_mkChar("value"));
  SET_STRING_ELT(r_names, 1, Rf_mkChar("cut"));
  SET_STRING_ELT(r_names, 2, Rf_mkChar("partition1"));
  SET_STRING_ELT(r_names, 3, Rf_mkChar("partition2"));
  SET_NAMES(r_result, r_names);
  UNPROTECT(5);

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_residual_graph                      /
/-------------------------------------------*/
SEXP R_igraph_residual_graph(SEXP graph, SEXP capacity, SEXP flow) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_t c_capacity;
  igraph_t c_residual;
  igraph_vector_t c_residual_capacity;
  igraph_vector_t c_flow;
  SEXP residual;
  SEXP residual_capacity;

  SEXP r_result, r_names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (!Rf_isNull(capacity)) { R_SEXP_to_vector(capacity, &c_capacity); }
  if (0 != igraph_vector_init(&c_residual_capacity, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_residual_capacity);
  residual_capacity=R_GlobalEnv; /* hack to have a non-NULL value */
  R_SEXP_to_vector(flow, &c_flow);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_residual_graph(&c_graph, (Rf_isNull(capacity) ? 0 : &c_capacity), &c_residual, (Rf_isNull(residual_capacity) ? 0 : &c_residual_capacity), &c_flow));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(2));
  PROTECT(r_names=NEW_CHARACTER(2));
  IGRAPH_FINALLY(igraph_destroy, &c_residual);
  PROTECT(residual=R_igraph_to_SEXP(&c_residual));
  igraph_destroy(&c_residual);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(residual_capacity=R_igraph_0orvector_to_SEXP(&c_residual_capacity));
  igraph_vector_destroy(&c_residual_capacity);
  IGRAPH_FINALLY_CLEAN(1);
  SET_VECTOR_ELT(r_result, 0, residual);
  SET_VECTOR_ELT(r_result, 1, residual_capacity);
  SET_STRING_ELT(r_names, 0, Rf_mkChar("residual"));
  SET_STRING_ELT(r_names, 1, Rf_mkChar("residual_capacity"));
  SET_NAMES(r_result, r_names);
  UNPROTECT(3);

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_reverse_residual_graph              /
/-------------------------------------------*/
SEXP R_igraph_reverse_residual_graph(SEXP graph, SEXP capacity, SEXP flow) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_t c_capacity;
  igraph_t c_residual;
  igraph_vector_t c_flow;
  SEXP residual;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (!Rf_isNull(capacity)) { R_SEXP_to_vector(capacity, &c_capacity); }
  R_SEXP_to_vector(flow, &c_flow);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_reverse_residual_graph(&c_graph, (Rf_isNull(capacity) ? 0 : &c_capacity), &c_residual, &c_flow));

                                        /* Convert output */
  IGRAPH_FINALLY(igraph_destroy, &c_residual);
  PROTECT(residual=R_igraph_to_SEXP(&c_residual));
  igraph_destroy(&c_residual);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = residual;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_dominator_tree                      /
/-------------------------------------------*/
SEXP R_igraph_dominator_tree(SEXP graph, SEXP root, SEXP mode) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_integer_t c_root;
  igraph_vector_int_t c_dom;
  igraph_t c_domtree;
  igraph_vector_int_t c_leftout;
  igraph_neimode_t c_mode;
  SEXP dom;
  SEXP domtree;
  SEXP leftout;

  SEXP r_result, r_names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  c_root = (igraph_integer_t) REAL(root)[0];
  if (0 != igraph_vector_int_init(&c_dom, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_dom);
  if (0 != igraph_vector_int_init(&c_leftout, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_leftout);
  c_mode = (igraph_neimode_t) Rf_asInteger(mode);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_dominator_tree(&c_graph, c_root, &c_dom, &c_domtree, &c_leftout, c_mode));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(3));
  PROTECT(r_names=NEW_CHARACTER(3));
  PROTECT(dom=R_igraph_vector_int_to_SEXP(&c_dom));
  igraph_vector_int_destroy(&c_dom);
  IGRAPH_FINALLY_CLEAN(1);
  IGRAPH_FINALLY(igraph_destroy, &c_domtree);
  PROTECT(domtree=R_igraph_to_SEXP(&c_domtree));
  igraph_destroy(&c_domtree);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(leftout=R_igraph_vector_int_to_SEXP(&c_leftout));
  igraph_vector_int_destroy(&c_leftout);
  IGRAPH_FINALLY_CLEAN(1);
  SET_VECTOR_ELT(r_result, 0, dom);
  SET_VECTOR_ELT(r_result, 1, domtree);
  SET_VECTOR_ELT(r_result, 2, leftout);
  SET_STRING_ELT(r_names, 0, Rf_mkChar("dom"));
  SET_STRING_ELT(r_names, 1, Rf_mkChar("domtree"));
  SET_STRING_ELT(r_names, 2, Rf_mkChar("leftout"));
  SET_NAMES(r_result, r_names);
  UNPROTECT(4);

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_all_st_cuts                         /
/-------------------------------------------*/
SEXP R_igraph_all_st_cuts(SEXP graph, SEXP source, SEXP target) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_int_list_t c_cuts;
  igraph_vector_int_list_t c_partition1s;
  igraph_integer_t c_source;
  igraph_integer_t c_target;
  SEXP cuts;
  SEXP partition1s;

  SEXP r_result, r_names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_int_list_init(&c_cuts, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_list_destroy, &c_cuts);
  if (0 != igraph_vector_int_list_init(&c_partition1s, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_list_destroy, &c_partition1s);
  c_source = (igraph_integer_t) REAL(source)[0];
  c_target = (igraph_integer_t) REAL(target)[0];
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_all_st_cuts(&c_graph, &c_cuts, &c_partition1s, c_source, c_target));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(2));
  PROTECT(r_names=NEW_CHARACTER(2));
  PROTECT(cuts=R_igraph_vectorlist_int_to_SEXP(&c_cuts));
  igraph_vector_int_list_destroy(&c_cuts);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(partition1s=R_igraph_vectorlist_int_to_SEXP(&c_partition1s));
  igraph_vector_int_list_destroy(&c_partition1s);
  IGRAPH_FINALLY_CLEAN(1);
  SET_VECTOR_ELT(r_result, 0, cuts);
  SET_VECTOR_ELT(r_result, 1, partition1s);
  SET_STRING_ELT(r_names, 0, Rf_mkChar("cuts"));
  SET_STRING_ELT(r_names, 1, Rf_mkChar("partition1s"));
  SET_NAMES(r_result, r_names);
  UNPROTECT(3);

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_all_st_mincuts                      /
/-------------------------------------------*/
SEXP R_igraph_all_st_mincuts(SEXP graph, SEXP source, SEXP target, SEXP capacity) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_real_t c_value;
  igraph_vector_int_list_t c_cuts;
  igraph_vector_int_list_t c_partition1s;
  igraph_integer_t c_source;
  igraph_integer_t c_target;
  igraph_vector_t c_capacity;
  SEXP value;
  SEXP cuts;
  SEXP partition1s;

  SEXP r_result, r_names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_int_list_init(&c_cuts, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_list_destroy, &c_cuts);
  if (0 != igraph_vector_int_list_init(&c_partition1s, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_list_destroy, &c_partition1s);
  c_source = (igraph_integer_t) REAL(source)[0];
  c_target = (igraph_integer_t) REAL(target)[0];
  if (!Rf_isNull(capacity)) { R_SEXP_to_vector(capacity, &c_capacity); }
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_all_st_mincuts(&c_graph, &c_value, &c_cuts, &c_partition1s, c_source, c_target, (Rf_isNull(capacity) ? 0 : &c_capacity)));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(3));
  PROTECT(r_names=NEW_CHARACTER(3));
  PROTECT(value=NEW_NUMERIC(1));
  REAL(value)[0]=c_value;
  PROTECT(cuts=R_igraph_vectorlist_int_to_SEXP(&c_cuts));
  igraph_vector_int_list_destroy(&c_cuts);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(partition1s=R_igraph_vectorlist_int_to_SEXP(&c_partition1s));
  igraph_vector_int_list_destroy(&c_partition1s);
  IGRAPH_FINALLY_CLEAN(1);
  SET_VECTOR_ELT(r_result, 0, value);
  SET_VECTOR_ELT(r_result, 1, cuts);
  SET_VECTOR_ELT(r_result, 2, partition1s);
  SET_STRING_ELT(r_names, 0, Rf_mkChar("value"));
  SET_STRING_ELT(r_names, 1, Rf_mkChar("cuts"));
  SET_STRING_ELT(r_names, 2, Rf_mkChar("partition1s"));
  SET_NAMES(r_result, r_names);
  UNPROTECT(4);

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_even_tarjan_reduction               /
/-------------------------------------------*/
SEXP R_igraph_even_tarjan_reduction(SEXP graph) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_t c_graphbar;
  igraph_vector_t c_capacity;
  SEXP graphbar;
  SEXP capacity;

  SEXP r_result, r_names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_init(&c_capacity, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_capacity);
  capacity=R_GlobalEnv; /* hack to have a non-NULL value */
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_even_tarjan_reduction(&c_graph, &c_graphbar, (Rf_isNull(capacity) ? 0 : &c_capacity)));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(2));
  PROTECT(r_names=NEW_CHARACTER(2));
  IGRAPH_FINALLY(igraph_destroy, &c_graphbar);
  PROTECT(graphbar=R_igraph_to_SEXP(&c_graphbar));
  igraph_destroy(&c_graphbar);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(capacity=R_igraph_0orvector_to_SEXP(&c_capacity));
  igraph_vector_destroy(&c_capacity);
  IGRAPH_FINALLY_CLEAN(1);
  SET_VECTOR_ELT(r_result, 0, graphbar);
  SET_VECTOR_ELT(r_result, 1, capacity);
  SET_STRING_ELT(r_names, 0, Rf_mkChar("graphbar"));
  SET_STRING_ELT(r_names, 1, Rf_mkChar("capacity"));
  SET_NAMES(r_result, r_names);
  UNPROTECT(3);

  UNPROTECT(1);
  return(r_result);
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

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_is_separator(&c_graph, c_candidate, &c_res));

                                        /* Convert output */
  PROTECT(res=NEW_LOGICAL(1));
  LOGICAL(res)[0]=c_res;
  r_result = res;

  UNPROTECT(1);
  return(r_result);
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

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_is_minimal_separator(&c_graph, c_candidate, &c_res));

                                        /* Convert output */
  PROTECT(res=NEW_LOGICAL(1));
  LOGICAL(res)[0]=c_res;
  r_result = res;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_all_minimal_st_separators           /
/-------------------------------------------*/
SEXP R_igraph_all_minimal_st_separators(SEXP graph) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_int_list_t c_separators;
  SEXP separators;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_int_list_init(&c_separators, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_list_destroy, &c_separators);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_all_minimal_st_separators(&c_graph, &c_separators));

                                        /* Convert output */
  PROTECT(separators=R_igraph_vectorlist_int_to_SEXP(&c_separators));
  igraph_vector_int_list_destroy(&c_separators);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = separators;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_minimum_size_separators             /
/-------------------------------------------*/
SEXP R_igraph_minimum_size_separators(SEXP graph) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_int_list_t c_separators;
  SEXP separators;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_int_list_init(&c_separators, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_list_destroy, &c_separators);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_minimum_size_separators(&c_graph, &c_separators));

                                        /* Convert output */
  PROTECT(separators=R_igraph_vectorlist_int_to_SEXP(&c_separators));
  igraph_vector_int_list_destroy(&c_separators);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = separators;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_isoclass                            /
/-------------------------------------------*/
SEXP R_igraph_isoclass(SEXP graph) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_integer_t c_isoclass;
  SEXP isoclass;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  c_isoclass=0;
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_isoclass(&c_graph, &c_isoclass));

                                        /* Convert output */
  PROTECT(isoclass=NEW_INTEGER(1));
  INTEGER(isoclass)[0]=c_isoclass;
  r_result = isoclass;

  UNPROTECT(1);
  return(r_result);
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

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph1, &c_graph1);
  R_SEXP_to_igraph(graph2, &c_graph2);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_isomorphic(&c_graph1, &c_graph2, &c_iso));

                                        /* Convert output */
  PROTECT(iso=NEW_LOGICAL(1));
  LOGICAL(iso)[0]=c_iso;
  r_result = iso;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_isoclass_subgraph                   /
/-------------------------------------------*/
SEXP R_igraph_isoclass_subgraph(SEXP graph, SEXP vids) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_int_t c_vids;
  igraph_integer_t c_isoclass;
  SEXP isoclass;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  R_SEXP_to_vector_int(vids, &c_vids);
  c_isoclass=0;
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_isoclass_subgraph(&c_graph, &c_vids, &c_isoclass));

                                        /* Convert output */
  PROTECT(isoclass=NEW_INTEGER(1));
  INTEGER(isoclass)[0]=c_isoclass;
  r_result = isoclass;

  UNPROTECT(1);
  return(r_result);
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

  SEXP r_result;
                                        /* Convert input */
  c_size=INTEGER(size)[0];
  c_number=INTEGER(number)[0];
  c_directed=LOGICAL(directed)[0];
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_isoclass_create(&c_graph, c_size, c_number, c_directed));

                                        /* Convert output */
  IGRAPH_FINALLY(igraph_destroy, &c_graph);
  PROTECT(graph=R_igraph_to_SEXP(&c_graph));
  igraph_destroy(&c_graph);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = graph;

  UNPROTECT(1);
  return(r_result);
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
  igraph_vector_int_t c_map12;
  igraph_vector_int_t c_map21;



  SEXP iso;
  SEXP map12;
  SEXP map21;

  SEXP r_result, r_names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph1, &c_graph1);
  R_SEXP_to_igraph(graph2, &c_graph2);
  if (!Rf_isNull(vertex_color1)) { R_SEXP_to_vector_int(vertex_color1, &c_vertex_color1); }
  if (!Rf_isNull(vertex_color2)) { R_SEXP_to_vector_int(vertex_color2, &c_vertex_color2); }
  if (!Rf_isNull(edge_color1)) { R_SEXP_to_vector_int(edge_color1, &c_edge_color1); }
  if (!Rf_isNull(edge_color2)) { R_SEXP_to_vector_int(edge_color2, &c_edge_color2); }
  if (0 != igraph_vector_int_init(&c_map12, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_map12);
  if (0 != igraph_vector_int_init(&c_map21, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_map21);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_isomorphic_vf2(&c_graph1, &c_graph2, (Rf_isNull(vertex_color1) ? 0 : &c_vertex_color1), (Rf_isNull(vertex_color2) ? 0 : &c_vertex_color2), (Rf_isNull(edge_color1) ? 0 : &c_edge_color1), (Rf_isNull(edge_color2) ? 0 : &c_edge_color2), &c_iso, &c_map12, &c_map21, 0, 0, 0));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(3));
  PROTECT(r_names=NEW_CHARACTER(3));
  PROTECT(iso=NEW_LOGICAL(1));
  LOGICAL(iso)[0]=c_iso;
  PROTECT(map12=R_igraph_vector_int_to_SEXP(&c_map12));
  igraph_vector_int_destroy(&c_map12);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(map21=R_igraph_vector_int_to_SEXP(&c_map21));
  igraph_vector_int_destroy(&c_map21);
  IGRAPH_FINALLY_CLEAN(1);
  SET_VECTOR_ELT(r_result, 0, iso);
  SET_VECTOR_ELT(r_result, 1, map12);
  SET_VECTOR_ELT(r_result, 2, map21);
  SET_STRING_ELT(r_names, 0, Rf_mkChar("iso"));
  SET_STRING_ELT(r_names, 1, Rf_mkChar("map12"));
  SET_STRING_ELT(r_names, 2, Rf_mkChar("map21"));
  SET_NAMES(r_result, r_names);
  UNPROTECT(4);

  UNPROTECT(1);
  return(r_result);
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

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph1, &c_graph1);
  R_SEXP_to_igraph(graph2, &c_graph2);
  if (!Rf_isNull(vertex_color1)) { R_SEXP_to_vector_int(vertex_color1, &c_vertex_color1); }
  if (!Rf_isNull(vertex_color2)) { R_SEXP_to_vector_int(vertex_color2, &c_vertex_color2); }
  if (!Rf_isNull(edge_color1)) { R_SEXP_to_vector_int(edge_color1, &c_edge_color1); }
  if (!Rf_isNull(edge_color2)) { R_SEXP_to_vector_int(edge_color2, &c_edge_color2); }
  c_count=0;
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_count_isomorphisms_vf2(&c_graph1, &c_graph2, (Rf_isNull(vertex_color1) ? 0 : &c_vertex_color1), (Rf_isNull(vertex_color2) ? 0 : &c_vertex_color2), (Rf_isNull(edge_color1) ? 0 : &c_edge_color1), (Rf_isNull(edge_color2) ? 0 : &c_edge_color2), &c_count, 0, 0, 0));

                                        /* Convert output */
  PROTECT(count=NEW_INTEGER(1));
  INTEGER(count)[0]=c_count;
  r_result = count;

  UNPROTECT(1);
  return(r_result);
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
  igraph_vector_int_list_t c_maps;



  SEXP maps;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph1, &c_graph1);
  R_SEXP_to_igraph(graph2, &c_graph2);
  if (!Rf_isNull(vertex_color1)) { R_SEXP_to_vector_int(vertex_color1, &c_vertex_color1); }
  if (!Rf_isNull(vertex_color2)) { R_SEXP_to_vector_int(vertex_color2, &c_vertex_color2); }
  if (!Rf_isNull(edge_color1)) { R_SEXP_to_vector_int(edge_color1, &c_edge_color1); }
  if (!Rf_isNull(edge_color2)) { R_SEXP_to_vector_int(edge_color2, &c_edge_color2); }
  if (0 != igraph_vector_int_list_init(&c_maps, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_list_destroy, &c_maps);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_get_isomorphisms_vf2(&c_graph1, &c_graph2, (Rf_isNull(vertex_color1) ? 0 : &c_vertex_color1), (Rf_isNull(vertex_color2) ? 0 : &c_vertex_color2), (Rf_isNull(edge_color1) ? 0 : &c_edge_color1), (Rf_isNull(edge_color2) ? 0 : &c_edge_color2), &c_maps, 0, 0, 0));

                                        /* Convert output */
  PROTECT(maps=R_igraph_vectorlist_int_to_SEXP(&c_maps));
  igraph_vector_int_list_destroy(&c_maps);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = maps;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_subisomorphic                       /
/-------------------------------------------*/
SEXP R_igraph_subisomorphic(SEXP graph1, SEXP graph2) {
                                        /* Declarations */
  igraph_t c_graph1;
  igraph_t c_graph2;
  igraph_bool_t c_iso;
  SEXP iso;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph1, &c_graph1);
  R_SEXP_to_igraph(graph2, &c_graph2);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_subisomorphic(&c_graph1, &c_graph2, &c_iso));

                                        /* Convert output */
  PROTECT(iso=NEW_LOGICAL(1));
  LOGICAL(iso)[0]=c_iso;
  r_result = iso;

  UNPROTECT(1);
  return(r_result);
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
  igraph_vector_int_t c_map12;
  igraph_vector_int_t c_map21;



  SEXP iso;
  SEXP map12;
  SEXP map21;

  SEXP r_result, r_names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph1, &c_graph1);
  R_SEXP_to_igraph(graph2, &c_graph2);
  if (!Rf_isNull(vertex_color1)) { R_SEXP_to_vector_int(vertex_color1, &c_vertex_color1); }
  if (!Rf_isNull(vertex_color2)) { R_SEXP_to_vector_int(vertex_color2, &c_vertex_color2); }
  if (!Rf_isNull(edge_color1)) { R_SEXP_to_vector_int(edge_color1, &c_edge_color1); }
  if (!Rf_isNull(edge_color2)) { R_SEXP_to_vector_int(edge_color2, &c_edge_color2); }
  if (0 != igraph_vector_int_init(&c_map12, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_map12);
  if (0 != igraph_vector_int_init(&c_map21, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_map21);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_subisomorphic_vf2(&c_graph1, &c_graph2, (Rf_isNull(vertex_color1) ? 0 : &c_vertex_color1), (Rf_isNull(vertex_color2) ? 0 : &c_vertex_color2), (Rf_isNull(edge_color1) ? 0 : &c_edge_color1), (Rf_isNull(edge_color2) ? 0 : &c_edge_color2), &c_iso, &c_map12, &c_map21, 0, 0, 0));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(3));
  PROTECT(r_names=NEW_CHARACTER(3));
  PROTECT(iso=NEW_LOGICAL(1));
  LOGICAL(iso)[0]=c_iso;
  PROTECT(map12=R_igraph_vector_int_to_SEXP(&c_map12));
  igraph_vector_int_destroy(&c_map12);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(map21=R_igraph_vector_int_to_SEXP(&c_map21));
  igraph_vector_int_destroy(&c_map21);
  IGRAPH_FINALLY_CLEAN(1);
  SET_VECTOR_ELT(r_result, 0, iso);
  SET_VECTOR_ELT(r_result, 1, map12);
  SET_VECTOR_ELT(r_result, 2, map21);
  SET_STRING_ELT(r_names, 0, Rf_mkChar("iso"));
  SET_STRING_ELT(r_names, 1, Rf_mkChar("map12"));
  SET_STRING_ELT(r_names, 2, Rf_mkChar("map21"));
  SET_NAMES(r_result, r_names);
  UNPROTECT(4);

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_subisomorphic_function_vf2          /
/-------------------------------------------*/
SEXP R_igraph_subisomorphic_function_vf2(SEXP graph1, SEXP graph2, SEXP vertex_color1, SEXP vertex_color2, SEXP edge_color1, SEXP edge_color2, SEXP ishohandler_fn) {
                                        /* Declarations */
  igraph_t c_graph1;
  igraph_t c_graph2;
  igraph_vector_int_t c_vertex_color1;
  igraph_vector_int_t c_vertex_color2;
  igraph_vector_int_t c_edge_color1;
  igraph_vector_int_t c_edge_color2;
  igraph_vector_int_t c_map12;
  igraph_vector_int_t c_map21;
  igraph_isohandler_t c_ishohandler_fn;



  SEXP map12;
  SEXP map21;

  SEXP r_result, r_names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph1, &c_graph1);
  R_SEXP_to_igraph(graph2, &c_graph2);
  if (!Rf_isNull(vertex_color1)) { R_SEXP_to_vector_int(vertex_color1, &c_vertex_color1); }
  if (!Rf_isNull(vertex_color2)) { R_SEXP_to_vector_int(vertex_color2, &c_vertex_color2); }
  if (!Rf_isNull(edge_color1)) { R_SEXP_to_vector_int(edge_color1, &c_edge_color1); }
  if (!Rf_isNull(edge_color2)) { R_SEXP_to_vector_int(edge_color2, &c_edge_color2); }
  if (0 != igraph_vector_int_init(&c_map12, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_map12);
  if (0 != igraph_vector_int_init(&c_map21, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_map21);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_subisomorphic_function_vf2(&c_graph1, &c_graph2, (Rf_isNull(vertex_color1) ? 0 : &c_vertex_color1), (Rf_isNull(vertex_color2) ? 0 : &c_vertex_color2), (Rf_isNull(edge_color1) ? 0 : &c_edge_color1), (Rf_isNull(edge_color2) ? 0 : &c_edge_color2), &c_map12, &c_map21, c_ishohandler_fn, 0, 0, 0));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(2));
  PROTECT(r_names=NEW_CHARACTER(2));
  PROTECT(map12=R_igraph_vector_int_to_SEXP(&c_map12));
  igraph_vector_int_destroy(&c_map12);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(map21=R_igraph_vector_int_to_SEXP(&c_map21));
  igraph_vector_int_destroy(&c_map21);
  IGRAPH_FINALLY_CLEAN(1);
  SET_VECTOR_ELT(r_result, 0, map12);
  SET_VECTOR_ELT(r_result, 1, map21);
  SET_STRING_ELT(r_names, 0, Rf_mkChar("map12"));
  SET_STRING_ELT(r_names, 1, Rf_mkChar("map21"));
  SET_NAMES(r_result, r_names);
  UNPROTECT(3);

  UNPROTECT(1);
  return(r_result);
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

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph1, &c_graph1);
  R_SEXP_to_igraph(graph2, &c_graph2);
  if (!Rf_isNull(vertex_color1)) { R_SEXP_to_vector_int(vertex_color1, &c_vertex_color1); }
  if (!Rf_isNull(vertex_color2)) { R_SEXP_to_vector_int(vertex_color2, &c_vertex_color2); }
  if (!Rf_isNull(edge_color1)) { R_SEXP_to_vector_int(edge_color1, &c_edge_color1); }
  if (!Rf_isNull(edge_color2)) { R_SEXP_to_vector_int(edge_color2, &c_edge_color2); }
  c_count=0;
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_count_subisomorphisms_vf2(&c_graph1, &c_graph2, (Rf_isNull(vertex_color1) ? 0 : &c_vertex_color1), (Rf_isNull(vertex_color2) ? 0 : &c_vertex_color2), (Rf_isNull(edge_color1) ? 0 : &c_edge_color1), (Rf_isNull(edge_color2) ? 0 : &c_edge_color2), &c_count, 0, 0, 0));

                                        /* Convert output */
  PROTECT(count=NEW_INTEGER(1));
  INTEGER(count)[0]=c_count;
  r_result = count;

  UNPROTECT(1);
  return(r_result);
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
  igraph_vector_int_list_t c_maps;



  SEXP maps;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph1, &c_graph1);
  R_SEXP_to_igraph(graph2, &c_graph2);
  if (!Rf_isNull(vertex_color1)) { R_SEXP_to_vector_int(vertex_color1, &c_vertex_color1); }
  if (!Rf_isNull(vertex_color2)) { R_SEXP_to_vector_int(vertex_color2, &c_vertex_color2); }
  if (!Rf_isNull(edge_color1)) { R_SEXP_to_vector_int(edge_color1, &c_edge_color1); }
  if (!Rf_isNull(edge_color2)) { R_SEXP_to_vector_int(edge_color2, &c_edge_color2); }
  if (0 != igraph_vector_int_list_init(&c_maps, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_list_destroy, &c_maps);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_get_subisomorphisms_vf2(&c_graph1, &c_graph2, (Rf_isNull(vertex_color1) ? 0 : &c_vertex_color1), (Rf_isNull(vertex_color2) ? 0 : &c_vertex_color2), (Rf_isNull(edge_color1) ? 0 : &c_edge_color1), (Rf_isNull(edge_color2) ? 0 : &c_edge_color2), &c_maps, 0, 0, 0));

                                        /* Convert output */
  PROTECT(maps=R_igraph_vectorlist_int_to_SEXP(&c_maps));
  igraph_vector_int_list_destroy(&c_maps);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = maps;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_canonical_permutation               /
/-------------------------------------------*/
SEXP R_igraph_canonical_permutation(SEXP graph, SEXP colors, SEXP sh) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_int_t c_colors;
  igraph_vector_int_t c_labeling;
  igraph_bliss_sh_t c_sh;
  igraph_bliss_info_t c_info;
  SEXP labeling;
  SEXP info;

  SEXP r_result, r_names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (!Rf_isNull(colors)) { R_SEXP_to_vector_int(colors, &c_colors); }
  if (0 != igraph_vector_int_init(&c_labeling, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_labeling);
  c_sh = (igraph_bliss_sh_t) Rf_asInteger(sh);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_canonical_permutation(&c_graph, (Rf_isNull(colors) ? 0 : &c_colors), &c_labeling, c_sh, &c_info));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(2));
  PROTECT(r_names=NEW_CHARACTER(2));
  PROTECT(labeling=R_igraph_vector_int_to_SEXP(&c_labeling));
  igraph_vector_int_destroy(&c_labeling);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(info=R_igraph_bliss_info_to_SEXP(&c_info));
  if (c_info.group_size) { free(c_info.group_size); }
  SET_VECTOR_ELT(r_result, 0, labeling);
  SET_VECTOR_ELT(r_result, 1, info);
  SET_STRING_ELT(r_names, 0, Rf_mkChar("labeling"));
  SET_STRING_ELT(r_names, 1, Rf_mkChar("info"));
  SET_NAMES(r_result, r_names);
  UNPROTECT(3);

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_permute_vertices                    /
/-------------------------------------------*/
SEXP R_igraph_permute_vertices(SEXP graph, SEXP permutation) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_t c_res;
  igraph_vector_int_t c_permutation;
  SEXP res;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  R_SEXP_to_vector_int(permutation, &c_permutation);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_permute_vertices(&c_graph, &c_res, &c_permutation));

                                        /* Convert output */
  IGRAPH_FINALLY(igraph_destroy, &c_res);
  PROTECT(res=R_igraph_to_SEXP(&c_res));
  igraph_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = res;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_isomorphic_bliss                    /
/-------------------------------------------*/
SEXP R_igraph_isomorphic_bliss(SEXP graph1, SEXP graph2, SEXP colors1, SEXP colors2, SEXP sh) {
                                        /* Declarations */
  igraph_t c_graph1;
  igraph_t c_graph2;
  igraph_vector_int_t c_colors1;
  igraph_vector_int_t c_colors2;
  igraph_bool_t c_iso;
  igraph_vector_int_t c_map12;
  igraph_vector_int_t c_map21;
  igraph_bliss_sh_t c_sh;
  igraph_bliss_info_t c_info1;
  igraph_bliss_info_t c_info2;
  SEXP iso;
  SEXP map12;
  SEXP map21;
  SEXP info1;
  SEXP info2;

  SEXP r_result, r_names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph1, &c_graph1);
  R_SEXP_to_igraph(graph2, &c_graph2);
  if (!Rf_isNull(colors1)) { R_SEXP_to_vector_int(colors1, &c_colors1); }
  if (!Rf_isNull(colors2)) { R_SEXP_to_vector_int(colors2, &c_colors2); }
  if (0 != igraph_vector_int_init(&c_map12, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_map12);
  if (0 != igraph_vector_int_init(&c_map21, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_map21);
  c_sh = (igraph_bliss_sh_t) Rf_asInteger(sh);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_isomorphic_bliss(&c_graph1, &c_graph2, (Rf_isNull(colors1) ? 0 : &c_colors1), (Rf_isNull(colors2) ? 0 : &c_colors2), &c_iso, &c_map12, &c_map21, c_sh, &c_info1, &c_info2));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(5));
  PROTECT(r_names=NEW_CHARACTER(5));
  PROTECT(iso=NEW_LOGICAL(1));
  LOGICAL(iso)[0]=c_iso;
  PROTECT(map12=R_igraph_vector_int_to_SEXP(&c_map12));
  igraph_vector_int_destroy(&c_map12);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(map21=R_igraph_vector_int_to_SEXP(&c_map21));
  igraph_vector_int_destroy(&c_map21);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(info1=R_igraph_bliss_info_to_SEXP(&c_info1));
  if (c_info1.group_size) { free(c_info1.group_size); }
  PROTECT(info2=R_igraph_bliss_info_to_SEXP(&c_info2));
  if (c_info2.group_size) { free(c_info2.group_size); }
  SET_VECTOR_ELT(r_result, 0, iso);
  SET_VECTOR_ELT(r_result, 1, map12);
  SET_VECTOR_ELT(r_result, 2, map21);
  SET_VECTOR_ELT(r_result, 3, info1);
  SET_VECTOR_ELT(r_result, 4, info2);
  SET_STRING_ELT(r_names, 0, Rf_mkChar("iso"));
  SET_STRING_ELT(r_names, 1, Rf_mkChar("map12"));
  SET_STRING_ELT(r_names, 2, Rf_mkChar("map21"));
  SET_STRING_ELT(r_names, 3, Rf_mkChar("info1"));
  SET_STRING_ELT(r_names, 4, Rf_mkChar("info2"));
  SET_NAMES(r_result, r_names);
  UNPROTECT(6);

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_automorphisms                       /
/-------------------------------------------*/
SEXP R_igraph_automorphisms(SEXP graph, SEXP colors, SEXP sh) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_int_t c_colors;
  igraph_bliss_sh_t c_sh;
  igraph_bliss_info_t c_info;
  SEXP info;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (!Rf_isNull(colors)) { R_SEXP_to_vector_int(colors, &c_colors); }
  c_sh = (igraph_bliss_sh_t) Rf_asInteger(sh);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_automorphisms(&c_graph, (Rf_isNull(colors) ? 0 : &c_colors), c_sh, &c_info));

                                        /* Convert output */
  PROTECT(info=R_igraph_bliss_info_to_SEXP(&c_info));
  if (c_info.group_size) { free(c_info.group_size); }
  r_result = info;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_automorphism_group                  /
/-------------------------------------------*/
SEXP R_igraph_automorphism_group(SEXP graph, SEXP colors, SEXP sh) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_int_t c_colors;
  igraph_vector_int_list_t c_generators;
  igraph_bliss_sh_t c_sh;
  igraph_bliss_info_t c_info;
  SEXP generators;
  SEXP info;

  SEXP r_result, r_names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (!Rf_isNull(colors)) { R_SEXP_to_vector_int(colors, &c_colors); }
  if (0 != igraph_vector_int_list_init(&c_generators, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_list_destroy, &c_generators);
  c_sh = (igraph_bliss_sh_t) Rf_asInteger(sh);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_automorphism_group(&c_graph, (Rf_isNull(colors) ? 0 : &c_colors), &c_generators, c_sh, &c_info));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(2));
  PROTECT(r_names=NEW_CHARACTER(2));
  PROTECT(generators=R_igraph_vectorlist_int_to_SEXP(&c_generators));
  igraph_vector_int_list_destroy(&c_generators);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(info=R_igraph_bliss_info_to_SEXP(&c_info));
  if (c_info.group_size) { free(c_info.group_size); }
  SET_VECTOR_ELT(r_result, 0, generators);
  SET_VECTOR_ELT(r_result, 1, info);
  SET_STRING_ELT(r_names, 0, Rf_mkChar("generators"));
  SET_STRING_ELT(r_names, 1, Rf_mkChar("info"));
  SET_NAMES(r_result, r_names);
  UNPROTECT(3);

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_simplify_and_colorize               /
/-------------------------------------------*/
SEXP R_igraph_simplify_and_colorize(SEXP graph) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_t c_res;
  igraph_vector_int_t c_vertex_color;
  igraph_vector_int_t c_edge_color;
  SEXP res;
  SEXP vertex_color;
  SEXP edge_color;

  SEXP r_result, r_names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_int_init(&c_vertex_color, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_vertex_color);
  if (0 != igraph_vector_int_init(&c_edge_color, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_edge_color);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_simplify_and_colorize(&c_graph, &c_res, &c_vertex_color, &c_edge_color));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(3));
  PROTECT(r_names=NEW_CHARACTER(3));
  IGRAPH_FINALLY(igraph_destroy, &c_res);
  PROTECT(res=R_igraph_to_SEXP(&c_res));
  igraph_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(vertex_color=R_igraph_vector_int_to_SEXP(&c_vertex_color));
  igraph_vector_int_destroy(&c_vertex_color);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(edge_color=R_igraph_vector_int_to_SEXP(&c_edge_color));
  igraph_vector_int_destroy(&c_edge_color);
  IGRAPH_FINALLY_CLEAN(1);
  SET_VECTOR_ELT(r_result, 0, res);
  SET_VECTOR_ELT(r_result, 1, vertex_color);
  SET_VECTOR_ELT(r_result, 2, edge_color);
  SET_STRING_ELT(r_names, 0, Rf_mkChar("res"));
  SET_STRING_ELT(r_names, 1, Rf_mkChar("vertex_color"));
  SET_STRING_ELT(r_names, 2, Rf_mkChar("edge_color"));
  SET_NAMES(r_result, r_names);
  UNPROTECT(4);

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_graph_count                         /
/-------------------------------------------*/
SEXP R_igraph_graph_count(SEXP n, SEXP directed) {
                                        /* Declarations */
  igraph_integer_t c_n;
  igraph_bool_t c_directed;
  igraph_integer_t c_count;
  SEXP count;

  SEXP r_result;
                                        /* Convert input */
  c_n=INTEGER(n)[0];
  c_directed=LOGICAL(directed)[0];
  c_count=0;
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_graph_count(c_n, c_directed, &c_count));

                                        /* Convert output */
  PROTECT(count=NEW_INTEGER(1));
  INTEGER(count)[0]=c_count;
  r_result = count;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_is_matching                         /
/-------------------------------------------*/
SEXP R_igraph_is_matching(SEXP graph, SEXP types, SEXP matching) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_bool_t c_types;
  igraph_vector_int_t c_matching;
  igraph_bool_t c_res;
  SEXP res;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (!Rf_isNull(types)) { R_SEXP_to_vector_bool(types, &c_types); }
  R_SEXP_to_vector_int(matching, &c_matching);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_is_matching(&c_graph, (Rf_isNull(types) ? 0 : &c_types), &c_matching, &c_res));

                                        /* Convert output */
  PROTECT(res=NEW_LOGICAL(1));
  LOGICAL(res)[0]=c_res;
  r_result = res;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_is_maximal_matching                 /
/-------------------------------------------*/
SEXP R_igraph_is_maximal_matching(SEXP graph, SEXP types, SEXP matching) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_bool_t c_types;
  igraph_vector_int_t c_matching;
  igraph_bool_t c_res;
  SEXP res;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (!Rf_isNull(types)) { R_SEXP_to_vector_bool(types, &c_types); }
  R_SEXP_to_vector_int(matching, &c_matching);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_is_maximal_matching(&c_graph, (Rf_isNull(types) ? 0 : &c_types), &c_matching, &c_res));

                                        /* Convert output */
  PROTECT(res=NEW_LOGICAL(1));
  LOGICAL(res)[0]=c_res;
  r_result = res;

  UNPROTECT(1);
  return(r_result);
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
  igraph_vector_int_t c_matching;
  igraph_vector_t c_weights;
  igraph_real_t c_eps;
  SEXP matching_size;
  SEXP matching_weight;
  SEXP matching;

  SEXP r_result, r_names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (!Rf_isNull(types)) { R_SEXP_to_vector_bool(types, &c_types); }
  c_matching_size=0;
  if (0 != igraph_vector_int_init(&c_matching, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_matching);
  if (!Rf_isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
  c_eps=REAL(eps)[0];
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_maximum_bipartite_matching(&c_graph, (Rf_isNull(types) ? 0 : &c_types), &c_matching_size, &c_matching_weight, &c_matching, (Rf_isNull(weights) ? 0 : &c_weights), c_eps));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(3));
  PROTECT(r_names=NEW_CHARACTER(3));
  PROTECT(matching_size=NEW_INTEGER(1));
  INTEGER(matching_size)[0]=c_matching_size;
  PROTECT(matching_weight=NEW_NUMERIC(1));
  REAL(matching_weight)[0]=c_matching_weight;
  PROTECT(matching=R_igraph_vector_int_to_SEXP(&c_matching));
  igraph_vector_int_destroy(&c_matching);
  IGRAPH_FINALLY_CLEAN(1);
  SET_VECTOR_ELT(r_result, 0, matching_size);
  SET_VECTOR_ELT(r_result, 1, matching_weight);
  SET_VECTOR_ELT(r_result, 2, matching);
  SET_STRING_ELT(r_names, 0, Rf_mkChar("matching_size"));
  SET_STRING_ELT(r_names, 1, Rf_mkChar("matching_weight"));
  SET_STRING_ELT(r_names, 2, Rf_mkChar("matching"));
  SET_NAMES(r_result, r_names);
  UNPROTECT(4);

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_eigen_adjacency                     /
/-------------------------------------------*/
SEXP R_igraph_eigen_adjacency(SEXP graph, SEXP algorithm, SEXP which, SEXP options) {
                                        /* Declarations */
  // FIXME
  return R_NilValue;
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

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_vector(data, &c_data);
  c_xmin=REAL(xmin)[0];
  c_force_continuous=LOGICAL(force_continuous)[0];
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_power_law_fit(&c_data, &c_res, c_xmin, c_force_continuous));

                                        /* Convert output */
  PROTECT(res=R_igraph_plfit_result_to_SEXP(&c_res));
  r_result = res;

  UNPROTECT(1);
  return(r_result);
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

  SEXP r_result;
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
  IGRAPH_R_CHECK(igraph_sir(&c_graph, c_beta, c_gamma, c_no_sim, &c_res));

                                        /* Convert output */
  PROTECT(res=R_igraph_sirlist_to_SEXP(&c_res));
  R_igraph_sirlist_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = res;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_convex_hull                         /
/-------------------------------------------*/
SEXP R_igraph_convex_hull(SEXP data) {
                                        /* Declarations */
  igraph_matrix_t c_data;
  igraph_vector_int_t c_resverts;
  igraph_matrix_t c_rescoords;
  SEXP resverts;
  SEXP rescoords;

  SEXP r_result, r_names;
                                        /* Convert input */
  R_SEXP_to_matrix(data, &c_data);
  if (0 != igraph_vector_int_init(&c_resverts, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_resverts);
  if (0 != igraph_matrix_init(&c_rescoords, 0, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_matrix_destroy, &c_rescoords);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_convex_hull(&c_data, &c_resverts, &c_rescoords));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(2));
  PROTECT(r_names=NEW_CHARACTER(2));
  PROTECT(resverts=R_igraph_vector_int_to_SEXPp1(&c_resverts));
  igraph_vector_int_destroy(&c_resverts);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(rescoords=R_igraph_matrix_to_SEXP(&c_rescoords));
  igraph_matrix_destroy(&c_rescoords);
  IGRAPH_FINALLY_CLEAN(1);
  SET_VECTOR_ELT(r_result, 0, resverts);
  SET_VECTOR_ELT(r_result, 1, rescoords);
  SET_STRING_ELT(r_names, 0, Rf_mkChar("resverts"));
  SET_STRING_ELT(r_names, 1, Rf_mkChar("rescoords"));
  SET_NAMES(r_result, r_names);
  UNPROTECT(3);

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_dim_select                          /
/-------------------------------------------*/
SEXP R_igraph_dim_select(SEXP sv) {
                                        /* Declarations */
  igraph_vector_t c_sv;
  igraph_integer_t c_dim;
  SEXP dim;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_vector(sv, &c_sv);
  c_dim=0;
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_dim_select(&c_sv, &c_dim));

                                        /* Convert output */
  PROTECT(dim=NEW_INTEGER(1));
  INTEGER(dim)[0]=c_dim;
  r_result = dim;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_almost_equals                       /
/-------------------------------------------*/
SEXP R_igraph_almost_equals(SEXP a, SEXP b, SEXP eps) {
                                        /* Declarations */
  double c_a;
  double c_b;
  double c_eps;
  igraph_bool_t c_result;
  SEXP r_result;
                                        /* Convert input */

                                        /* Call igraph */
  c_result=igraph_almost_equals(c_a, c_b, c_eps);

                                        /* Convert output */

  PROTECT(r_result=NEW_LOGICAL(1));
  LOGICAL(r_result)[0]=c_result;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_cmp_epsilon                         /
/-------------------------------------------*/
SEXP R_igraph_cmp_epsilon(SEXP a, SEXP b, SEXP eps) {
                                        /* Declarations */
  double c_a;
  double c_b;
  double c_eps;
  int c_result;
  SEXP r_result;
                                        /* Convert input */

                                        /* Call igraph */
  c_result=igraph_cmp_epsilon(c_a, c_b, c_eps);

                                        /* Convert output */



  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_eigen_matrix                        /
/-------------------------------------------*/
SEXP R_igraph_eigen_matrix(SEXP A, SEXP sA, SEXP fun, SEXP n, SEXP algorithm, SEXP which, SEXP options) {
  // FIXME
  return R_NilValue;
}

/*-------------------------------------------/
/ igraph_eigen_matrix_symmetric              /
/-------------------------------------------*/
SEXP R_igraph_eigen_matrix_symmetric(SEXP A, SEXP sA, SEXP fun, SEXP n, SEXP algorithm, SEXP which, SEXP options) {
                                        /* Declarations */
  igraph_matrix_t c_A;
  igraph_sparsemat_t c_sA;
  igraph_arpack_function_t c_fun;
  int c_n;

  igraph_eigen_algorithm_t c_algorithm;
  igraph_eigen_which_t c_which;
  igraph_arpack_options_t c_options;

  igraph_vector_t c_values;
  igraph_matrix_t c_vectors;
  SEXP values;
  SEXP vectors;

  SEXP r_result, r_names;
                                        /* Convert input */
  R_SEXP_to_matrix(A, &c_A);
  R_SEXP_to_sparsemat(sA, &c_sA);
  c_n=INTEGER(n)[0];
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
  IGRAPH_R_CHECK(igraph_eigen_matrix_symmetric(&c_A, &c_sA, c_fun, c_n, 0, c_algorithm, &c_which, &c_options, 0, &c_values, &c_vectors));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(3));
  PROTECT(r_names=NEW_CHARACTER(3));
  PROTECT(options=R_igraph_arpack_options_to_SEXP(&c_options));
  PROTECT(values=R_igraph_vector_to_SEXP(&c_values));
  igraph_vector_destroy(&c_values);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(vectors=R_igraph_matrix_to_SEXP(&c_vectors));
  igraph_matrix_destroy(&c_vectors);
  IGRAPH_FINALLY_CLEAN(1);
  SET_VECTOR_ELT(r_result, 0, options);
  SET_VECTOR_ELT(r_result, 1, values);
  SET_VECTOR_ELT(r_result, 2, vectors);
  SET_STRING_ELT(r_names, 0, Rf_mkChar("options"));
  SET_STRING_ELT(r_names, 1, Rf_mkChar("values"));
  SET_STRING_ELT(r_names, 2, Rf_mkChar("vectors"));
  SET_NAMES(r_result, r_names);
  UNPROTECT(4);

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_solve_lsap                          /
/-------------------------------------------*/
SEXP R_igraph_solve_lsap(SEXP c, SEXP n) {
                                        /* Declarations */
  igraph_matrix_t c_c;
  igraph_integer_t c_n;
  igraph_vector_int_t c_p;
  SEXP p;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_matrix(c, &c_c);
  c_n=INTEGER(n)[0];
  if (0 != igraph_vector_int_init(&c_p, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_p);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_solve_lsap(&c_c, c_n, &c_p));

                                        /* Convert output */
  PROTECT(p=R_igraph_vector_int_to_SEXP(&c_p));
  igraph_vector_int_destroy(&c_p);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = p;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_is_eulerian                         /
/-------------------------------------------*/
SEXP R_igraph_is_eulerian(SEXP graph) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_bool_t c_has_path;
  igraph_bool_t c_has_cycle;
  SEXP has_path;
  SEXP has_cycle;

  SEXP r_result, r_names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_is_eulerian(&c_graph, &c_has_path, &c_has_cycle));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(2));
  PROTECT(r_names=NEW_CHARACTER(2));
  PROTECT(has_path=NEW_LOGICAL(1));
  LOGICAL(has_path)[0]=c_has_path;
  PROTECT(has_cycle=NEW_LOGICAL(1));
  LOGICAL(has_cycle)[0]=c_has_cycle;
  SET_VECTOR_ELT(r_result, 0, has_path);
  SET_VECTOR_ELT(r_result, 1, has_cycle);
  SET_STRING_ELT(r_names, 0, Rf_mkChar("has_path"));
  SET_STRING_ELT(r_names, 1, Rf_mkChar("has_cycle"));
  SET_NAMES(r_result, r_names);
  UNPROTECT(3);

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_eulerian_path                       /
/-------------------------------------------*/
SEXP R_igraph_eulerian_path(SEXP graph) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_int_t c_edge_res;
  igraph_vector_int_t c_vertex_res;
  SEXP edge_res;
  SEXP vertex_res;

  SEXP r_result, r_names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_int_init(&c_edge_res, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_edge_res);
  if (0 != igraph_vector_int_init(&c_vertex_res, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_vertex_res);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_eulerian_path(&c_graph, &c_edge_res, &c_vertex_res));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(2));
  PROTECT(r_names=NEW_CHARACTER(2));
  PROTECT(edge_res=R_igraph_vector_int_to_SEXP(&c_edge_res));
  igraph_vector_int_destroy(&c_edge_res);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(vertex_res=R_igraph_vector_int_to_SEXP(&c_vertex_res));
  igraph_vector_int_destroy(&c_vertex_res);
  IGRAPH_FINALLY_CLEAN(1);
  SET_VECTOR_ELT(r_result, 0, edge_res);
  SET_VECTOR_ELT(r_result, 1, vertex_res);
  SET_STRING_ELT(r_names, 0, Rf_mkChar("epath"));
  SET_STRING_ELT(r_names, 1, Rf_mkChar("vpath"));
  SET_NAMES(r_result, r_names);
  UNPROTECT(3);

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_eulerian_cycle                      /
/-------------------------------------------*/
SEXP R_igraph_eulerian_cycle(SEXP graph) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_int_t c_edge_res;
  igraph_vector_int_t c_vertex_res;
  SEXP edge_res;
  SEXP vertex_res;

  SEXP r_result, r_names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_int_init(&c_edge_res, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_edge_res);
  if (0 != igraph_vector_int_init(&c_vertex_res, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_vertex_res);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_eulerian_cycle(&c_graph, &c_edge_res, &c_vertex_res));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(2));
  PROTECT(r_names=NEW_CHARACTER(2));
  PROTECT(edge_res=R_igraph_vector_int_to_SEXP(&c_edge_res));
  igraph_vector_int_destroy(&c_edge_res);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(vertex_res=R_igraph_vector_int_to_SEXP(&c_vertex_res));
  igraph_vector_int_destroy(&c_vertex_res);
  IGRAPH_FINALLY_CLEAN(1);
  SET_VECTOR_ELT(r_result, 0, edge_res);
  SET_VECTOR_ELT(r_result, 1, vertex_res);
  SET_STRING_ELT(r_names, 0, Rf_mkChar("epath"));
  SET_STRING_ELT(r_names, 1, Rf_mkChar("vpath"));
  SET_NAMES(r_result, r_names);
  UNPROTECT(3);

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_fundamental_cycles                  /
/-------------------------------------------*/
SEXP R_igraph_fundamental_cycles(SEXP graph, SEXP start, SEXP bfs_cutoff, SEXP weights) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_int_list_t c_basis;
  igraph_integer_t c_start;
  igraph_integer_t c_bfs_cutoff;
  igraph_vector_t c_weights;
  SEXP basis;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_int_list_init(&c_basis, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_list_destroy, &c_basis);
  c_start = (igraph_integer_t) REAL(start)[0];
  c_bfs_cutoff=INTEGER(bfs_cutoff)[0];
  if (!Rf_isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_fundamental_cycles(&c_graph, &c_basis, c_start, c_bfs_cutoff, (Rf_isNull(weights) ? 0 : &c_weights)));

                                        /* Convert output */
  PROTECT(basis=R_igraph_vectorlist_int_to_SEXP(&c_basis));
  igraph_vector_int_list_destroy(&c_basis);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = basis;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_minimum_cycle_basis                 /
/-------------------------------------------*/
SEXP R_igraph_minimum_cycle_basis(SEXP graph, SEXP bfs_cutoff, SEXP complete, SEXP use_cycle_order, SEXP weights) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_int_list_t c_basis;
  igraph_integer_t c_bfs_cutoff;
  igraph_bool_t c_complete;
  igraph_bool_t c_use_cycle_order;
  igraph_vector_t c_weights;
  SEXP basis;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_int_list_init(&c_basis, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_list_destroy, &c_basis);
  c_bfs_cutoff=INTEGER(bfs_cutoff)[0];
  c_complete=LOGICAL(complete)[0];
  c_use_cycle_order=LOGICAL(use_cycle_order)[0];
  if (!Rf_isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_minimum_cycle_basis(&c_graph, &c_basis, c_bfs_cutoff, c_complete, c_use_cycle_order, (Rf_isNull(weights) ? 0 : &c_weights)));

                                        /* Convert output */
  PROTECT(basis=R_igraph_vectorlist_int_to_SEXP(&c_basis));
  igraph_vector_int_list_destroy(&c_basis);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = basis;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_is_tree                             /
/-------------------------------------------*/
SEXP R_igraph_is_tree(SEXP graph, SEXP mode) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_bool_t c_res;
  igraph_integer_t c_root;
  igraph_neimode_t c_mode;
  SEXP res;
  SEXP root;

  SEXP r_result, r_names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  c_root = -1;
  c_mode = (igraph_neimode_t) Rf_asInteger(mode);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_is_tree(&c_graph, &c_res, &c_root, c_mode));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(2));
  PROTECT(r_names=NEW_CHARACTER(2));
  PROTECT(res=NEW_LOGICAL(1));
  LOGICAL(res)[0]=c_res;
  PROTECT(root = NEW_INTEGER(1));
  INTEGER(root)[0] = c_root + 1;
  SET_VECTOR_ELT(r_result, 0, res);
  SET_VECTOR_ELT(r_result, 1, root);
  SET_STRING_ELT(r_names, 0, Rf_mkChar("res"));
  SET_STRING_ELT(r_names, 1, Rf_mkChar("root"));
  SET_NAMES(r_result, r_names);
  UNPROTECT(3);

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_is_forest                           /
/-------------------------------------------*/
SEXP R_igraph_is_forest(SEXP graph, SEXP mode) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_bool_t c_res;
  igraph_vector_int_t c_roots;
  igraph_neimode_t c_mode;
  SEXP res;
  SEXP roots;

  SEXP r_result, r_names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_int_init(&c_roots, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_roots);
  c_mode = (igraph_neimode_t) Rf_asInteger(mode);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_is_forest(&c_graph, &c_res, &c_roots, c_mode));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(2));
  PROTECT(r_names=NEW_CHARACTER(2));
  PROTECT(res=NEW_LOGICAL(1));
  LOGICAL(res)[0]=c_res;
  PROTECT(roots=R_igraph_vector_int_to_SEXP(&c_roots));
  igraph_vector_int_destroy(&c_roots);
  IGRAPH_FINALLY_CLEAN(1);
  SET_VECTOR_ELT(r_result, 0, res);
  SET_VECTOR_ELT(r_result, 1, roots);
  SET_STRING_ELT(r_names, 0, Rf_mkChar("res"));
  SET_STRING_ELT(r_names, 1, Rf_mkChar("roots"));
  SET_NAMES(r_result, r_names);
  UNPROTECT(3);

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_from_prufer                         /
/-------------------------------------------*/
SEXP R_igraph_from_prufer(SEXP prufer) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_int_t c_prufer;
  SEXP graph;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_vector_int(prufer, &c_prufer);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_from_prufer(&c_graph, &c_prufer));

                                        /* Convert output */
  IGRAPH_FINALLY(igraph_destroy, &c_graph);
  PROTECT(graph=R_igraph_to_SEXP(&c_graph));
  igraph_destroy(&c_graph);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = graph;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_to_prufer                           /
/-------------------------------------------*/
SEXP R_igraph_to_prufer(SEXP graph) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_int_t c_prufer;
  SEXP prufer;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_int_init(&c_prufer, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_prufer);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_to_prufer(&c_graph, &c_prufer));

                                        /* Convert output */
  PROTECT(prufer=R_igraph_vector_int_to_SEXP(&c_prufer));
  igraph_vector_int_destroy(&c_prufer);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = prufer;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_tree_from_parent_vector             /
/-------------------------------------------*/
SEXP R_igraph_tree_from_parent_vector(SEXP parents, SEXP type) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_int_t c_parents;
  igraph_tree_mode_t c_type;
  SEXP graph;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_vector_int(parents, &c_parents);
  c_type = (igraph_tree_mode_t) Rf_asInteger(type);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_tree_from_parent_vector(&c_graph, &c_parents, c_type));

                                        /* Convert output */
  IGRAPH_FINALLY(igraph_destroy, &c_graph);
  PROTECT(graph=R_igraph_to_SEXP(&c_graph));
  igraph_destroy(&c_graph);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = graph;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_random_spanning_tree                /
/-------------------------------------------*/
SEXP R_igraph_random_spanning_tree(SEXP graph, SEXP vid) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_int_t c_res;
  igraph_integer_t c_vid;
  SEXP res;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_int_init(&c_res, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_res);
  c_vid = (igraph_integer_t) REAL(vid)[0];
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_random_spanning_tree(&c_graph, &c_res, c_vid));

                                        /* Convert output */
  PROTECT(res=R_igraph_vector_int_to_SEXP(&c_res));
  igraph_vector_int_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = res;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_tree_game                           /
/-------------------------------------------*/
SEXP R_igraph_tree_game(SEXP n, SEXP directed, SEXP method) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_integer_t c_n;
  igraph_bool_t c_directed;
  igraph_random_tree_t c_method;
  SEXP graph;

  SEXP r_result;
                                        /* Convert input */
  c_n=INTEGER(n)[0];
  c_directed=LOGICAL(directed)[0];
  c_method = (igraph_random_tree_t) Rf_asInteger(method);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_tree_game(&c_graph, c_n, c_directed, c_method));

                                        /* Convert output */
  IGRAPH_FINALLY(igraph_destroy, &c_graph);
  PROTECT(graph=R_igraph_to_SEXP(&c_graph));
  igraph_destroy(&c_graph);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = graph;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_vertex_coloring_greedy              /
/-------------------------------------------*/
SEXP R_igraph_vertex_coloring_greedy(SEXP graph, SEXP heuristic) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_int_t c_colors;
  igraph_coloring_greedy_t c_heuristic;
  SEXP colors;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_int_init(&c_colors, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_colors);
  c_heuristic = (igraph_coloring_greedy_t) Rf_asInteger(heuristic);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_vertex_coloring_greedy(&c_graph, &c_colors, c_heuristic));

                                        /* Convert output */
  PROTECT(colors=R_igraph_vector_int_to_SEXP(&c_colors));
  igraph_vector_int_destroy(&c_colors);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = colors;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_deterministic_optimal_imitation     /
/-------------------------------------------*/
SEXP R_igraph_deterministic_optimal_imitation(SEXP graph, SEXP vid, SEXP optimality, SEXP quantities, SEXP strategies, SEXP mode) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_integer_t c_vid;
  igraph_optimal_t c_optimality;
  igraph_vector_t c_quantities;
  igraph_vector_int_t c_strategies;
  igraph_neimode_t c_mode;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  c_vid = (igraph_integer_t) REAL(vid)[0];
  c_optimality = (igraph_optimal_t) Rf_asInteger(optimality);
  R_SEXP_to_vector(quantities, &c_quantities);
  R_SEXP_to_vector_int(strategies, &c_strategies);
  c_mode = (igraph_neimode_t) Rf_asInteger(mode);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_deterministic_optimal_imitation(&c_graph, c_vid, c_optimality, &c_quantities, &c_strategies, c_mode));

                                        /* Convert output */
  PROTECT(strategies=R_igraph_vector_int_to_SEXP(&c_strategies));
  igraph_vector_int_destroy(&c_strategies);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = strategies;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_stochastic_imitation                /
/-------------------------------------------*/
SEXP R_igraph_stochastic_imitation(SEXP graph, SEXP vid, SEXP algo, SEXP quantities, SEXP strategies, SEXP mode) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_integer_t c_vid;
  igraph_imitate_algorithm_t c_algo;
  igraph_vector_t c_quantities;
  igraph_vector_int_t c_strategies;
  igraph_neimode_t c_mode;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  c_vid = (igraph_integer_t) REAL(vid)[0];
  c_algo = (igraph_imitate_algorithm_t) Rf_asInteger(algo);
  R_SEXP_to_vector(quantities, &c_quantities);
  R_SEXP_to_vector_int(strategies, &c_strategies);
  c_mode = (igraph_neimode_t) Rf_asInteger(mode);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_stochastic_imitation(&c_graph, c_vid, c_algo, &c_quantities, &c_strategies, c_mode));

                                        /* Convert output */
  PROTECT(strategies=R_igraph_vector_int_to_SEXP(&c_strategies));
  igraph_vector_int_destroy(&c_strategies);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = strategies;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_moran_process                       /
/-------------------------------------------*/
SEXP R_igraph_moran_process(SEXP graph, SEXP weights, SEXP quantities, SEXP strategies, SEXP mode) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_t c_weights;
  igraph_vector_t c_quantities;
  igraph_vector_int_t c_strategies;
  igraph_neimode_t c_mode;

  SEXP r_result, r_names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (!Rf_isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
  if (0 != R_SEXP_to_vector_copy(quantities, &c_quantities)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_quantities);
  R_SEXP_to_vector_int(strategies, &c_strategies);
  c_mode = (igraph_neimode_t) Rf_asInteger(mode);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_moran_process(&c_graph, (Rf_isNull(weights) ? 0 : &c_weights), &c_quantities, &c_strategies, c_mode));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(2));
  PROTECT(r_names=NEW_CHARACTER(2));
  PROTECT(quantities=R_igraph_vector_to_SEXP(&c_quantities));
  igraph_vector_destroy(&c_quantities);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(strategies=R_igraph_vector_int_to_SEXP(&c_strategies));
  igraph_vector_int_destroy(&c_strategies);
  IGRAPH_FINALLY_CLEAN(1);
  SET_VECTOR_ELT(r_result, 0, quantities);
  SET_VECTOR_ELT(r_result, 1, strategies);
  SET_STRING_ELT(r_names, 0, Rf_mkChar("quantities"));
  SET_STRING_ELT(r_names, 1, Rf_mkChar("strategies"));
  SET_NAMES(r_result, r_names);
  UNPROTECT(3);

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_roulette_wheel_imitation            /
/-------------------------------------------*/
SEXP R_igraph_roulette_wheel_imitation(SEXP graph, SEXP vid, SEXP is_local, SEXP quantities, SEXP strategies, SEXP mode) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_integer_t c_vid;
  igraph_bool_t c_is_local;
  igraph_vector_t c_quantities;
  igraph_vector_int_t c_strategies;
  igraph_neimode_t c_mode;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  c_vid = (igraph_integer_t) REAL(vid)[0];
  c_is_local=LOGICAL(is_local)[0];
  R_SEXP_to_vector(quantities, &c_quantities);
  R_SEXP_to_vector_int(strategies, &c_strategies);
  c_mode = (igraph_neimode_t) Rf_asInteger(mode);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_roulette_wheel_imitation(&c_graph, c_vid, c_is_local, &c_quantities, &c_strategies, c_mode));

                                        /* Convert output */
  PROTECT(strategies=R_igraph_vector_int_to_SEXP(&c_strategies));
  igraph_vector_int_destroy(&c_strategies);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = strategies;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_has_attribute_table                 /
/-------------------------------------------*/
SEXP R_igraph_has_attribute_table() {
                                        /* Declarations */
  igraph_bool_t c_result;
  SEXP r_result;
                                        /* Convert input */

                                        /* Call igraph */
  c_result=igraph_has_attribute_table();

                                        /* Convert output */

  PROTECT(r_result=NEW_LOGICAL(1));
  LOGICAL(r_result)[0]=c_result;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_progress                            /
/-------------------------------------------*/
SEXP R_igraph_progress(SEXP message, SEXP percent) {
                                        /* Declarations */
  const char* c_message;
  igraph_real_t c_percent;

  int c_result;
  SEXP r_result;
                                        /* Convert input */
  c_percent=REAL(percent)[0];
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_progress(c_message, c_percent, 0));

                                        /* Convert output */



  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_status                              /
/-------------------------------------------*/
SEXP R_igraph_status(SEXP message) {
                                        /* Declarations */
  const char* c_message;

  int c_result;
  SEXP r_result;
                                        /* Convert input */

                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_status(c_message, 0));

                                        /* Convert output */



  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_strerror                            /
/-------------------------------------------*/
SEXP R_igraph_strerror(SEXP igraph_errno) {
                                        /* Declarations */
  int c_igraph_errno;
  const char* c_result;
  SEXP r_result;
                                        /* Convert input */

                                        /* Call igraph */
  c_result=igraph_strerror(c_igraph_errno);

                                        /* Convert output */



  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_expand_path_to_pairs                /
/-------------------------------------------*/
SEXP R_igraph_expand_path_to_pairs(SEXP path) {
                                        /* Declarations */
  igraph_vector_int_t c_path;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_vector_int(path, &c_path);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_expand_path_to_pairs(&c_path));

                                        /* Convert output */
  PROTECT(path=R_igraph_vector_int_to_SEXP(&c_path));
  igraph_vector_int_destroy(&c_path);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = path;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_invalidate_cache                    /
/-------------------------------------------*/
SEXP R_igraph_invalidate_cache(SEXP graph) {
                                        /* Declarations */
  igraph_t c_graph;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph_copy(graph, &c_graph);
  IGRAPH_FINALLY(igraph_destroy, &c_graph);
                                        /* Call igraph */
  igraph_invalidate_cache(&c_graph);

                                        /* Convert output */
  PROTECT(graph=R_igraph_to_SEXP(&c_graph));
  igraph_destroy(&c_graph);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = graph;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_vertex_path_from_edge_path          /
/-------------------------------------------*/
SEXP R_igraph_vertex_path_from_edge_path(SEXP graph, SEXP start, SEXP edge_path, SEXP mode) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_integer_t c_start;
  igraph_vector_int_t c_edge_path;
  igraph_vector_int_t c_vertex_path;
  igraph_neimode_t c_mode;
  SEXP vertex_path;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  c_start = (igraph_integer_t) REAL(start)[0];
  R_SEXP_to_vector_int(edge_path, &c_edge_path);
  if (0 != igraph_vector_int_init(&c_vertex_path, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_vertex_path);
  c_mode = (igraph_neimode_t) Rf_asInteger(mode);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_vertex_path_from_edge_path(&c_graph, c_start, &c_edge_path, &c_vertex_path, c_mode));

                                        /* Convert output */
  PROTECT(vertex_path=R_igraph_vector_int_to_SEXP(&c_vertex_path));
  igraph_vector_int_destroy(&c_vertex_path);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = vertex_path;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_version                             /
/-------------------------------------------*/
SEXP R_igraph_version() {
                                        /* Declarations */
  const char* c_version_string;
  int c_major;
  int c_minor;
  int c_subminor;
  SEXP version_string;
  SEXP major;
  SEXP minor;
  SEXP subminor;

  SEXP r_result, r_names;
                                        /* Convert input */

                                        /* Call igraph */
  igraph_version(&c_version_string, &c_major, &c_minor, &c_subminor);

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(4));
  PROTECT(r_names=NEW_CHARACTER(4));
  SET_VECTOR_ELT(r_result, 0, version_string);
  SET_VECTOR_ELT(r_result, 1, major);
  SET_VECTOR_ELT(r_result, 2, minor);
  SET_VECTOR_ELT(r_result, 3, subminor);
  SET_STRING_ELT(r_names, 0, Rf_mkChar("version_string"));
  SET_STRING_ELT(r_names, 1, Rf_mkChar("major"));
  SET_STRING_ELT(r_names, 2, Rf_mkChar("minor"));
  SET_STRING_ELT(r_names, 3, Rf_mkChar("subminor"));
  SET_NAMES(r_result, r_names);
  UNPROTECT(5);

  UNPROTECT(1);
  return(r_result);
}
