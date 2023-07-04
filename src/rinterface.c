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
#include "graph/attributes.h"
#include "graph/neighbors.h"

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
  IGRAPH_FINALLY_CLEAN(1);
  r_result = graph;

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
  igraph_matrix_t c_W;
  igraph_bool_t c_directed;
  SEXP graph;

  SEXP r_result;
                                        /* Convert input */
  c_nodes=INTEGER(nodes)[0];
  R_SEXP_to_matrix(W, &c_W);
  c_directed=LOGICAL(directed)[0];
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_extended_chordal_ring(&c_graph, c_nodes, &c_W, c_directed));

                                        /* Convert output */
  IGRAPH_FINALLY(igraph_destroy, &c_graph);
  PROTECT(graph=R_igraph_to_SEXP(&c_graph));
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
  igraph_vector_t c_shifts;
  igraph_integer_t c_repeats;
  SEXP graph;

  SEXP r_result;
                                        /* Convert input */
  c_n=INTEGER(n)[0];
  R_SEXP_to_vector(shifts, &c_shifts);
  c_repeats=INTEGER(repeats)[0];
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_lcf_vector(&c_graph, c_n, &c_shifts, c_repeats));

                                        /* Convert output */
  IGRAPH_FINALLY(igraph_destroy, &c_graph);
  PROTECT(graph=R_igraph_to_SEXP(&c_graph));
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
  types=R_GlobalEnv; /* hack to have a non-NULL value */
  c_n1=INTEGER(n1)[0];
  c_n2=INTEGER(n2)[0];
  c_directed=LOGICAL(directed)[0];
  c_mode = (igraph_neimode_t) Rf_asInteger(mode);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_full_bipartite(&c_graph, (Rf_isNull(types) ? 0 : &c_types), c_n1, c_n2, c_directed, c_mode));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(2));
  PROTECT(r_names=NEW_CHARACTER(2));
  IGRAPH_FINALLY(igraph_destroy, &c_graph);
  PROTECT(graph=R_igraph_to_SEXP(&c_graph));
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(types=R_igraph_0orvector_bool_to_SEXP(&c_types));
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
/ igraph_realize_degree_sequence             /
/-------------------------------------------*/
SEXP R_igraph_realize_degree_sequence(SEXP out_deg, SEXP in_deg, SEXP allowed_edge_types, SEXP method) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_t c_out_deg;
  igraph_vector_t c_in_deg;
  igraph_edge_type_sw_t c_allowed_edge_types;
  igraph_realize_degseq_t c_method;
  SEXP graph;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_vector(out_deg, &c_out_deg);
  if (!Rf_isNull(in_deg)) { R_SEXP_to_vector(in_deg, &c_in_deg); }
  c_allowed_edge_types = (igraph_edge_type_sw_t) Rf_asInteger(allowed_edge_types);
  c_method = (igraph_realize_degseq_t) Rf_asInteger(method);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_realize_degree_sequence(&c_graph, &c_out_deg, (Rf_isNull(in_deg) ? 0 : &c_in_deg), c_allowed_edge_types, c_method));

                                        /* Convert output */
  IGRAPH_FINALLY(igraph_destroy, &c_graph);
  PROTECT(graph=R_igraph_to_SEXP(&c_graph));
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
  igraph_vector_t c_node_type_vec;
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
  if (0 != igraph_vector_init(&c_node_type_vec, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_node_type_vec);
  c_directed=LOGICAL(directed)[0];
  c_loops=LOGICAL(loops)[0];
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_preference_game(&c_graph, c_nodes, c_types, &c_type_dist, c_fixed_sizes, &c_pref_matrix, &c_node_type_vec, c_directed, c_loops));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(2));
  PROTECT(r_names=NEW_CHARACTER(2));
  IGRAPH_FINALLY(igraph_destroy, &c_graph);
  PROTECT(graph=R_igraph_to_SEXP(&c_graph));
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(node_type_vec=R_igraph_vector_to_SEXP(&c_node_type_vec));
  igraph_vector_destroy(&c_node_type_vec);
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
  igraph_vector_t c_node_type_in_vec;
  igraph_vector_t c_node_type_out_vec;
  igraph_bool_t c_loops;
  SEXP graph;
  SEXP node_type_in_vec;
  SEXP node_type_out_vec;

  SEXP r_result, r_names;
                                        /* Convert input */
  c_nodes=INTEGER(nodes)[0];
  c_out_types=INTEGER(out_types)[0];
  c_in_types=INTEGER(in_types)[0];
  R_SEXP_to_matrix(type_dist_matrix, &c_type_dist_matrix);
  R_SEXP_to_matrix(pref_matrix, &c_pref_matrix);
  if (0 != igraph_vector_init(&c_node_type_in_vec, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_node_type_in_vec);
  if (0 != igraph_vector_init(&c_node_type_out_vec, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_node_type_out_vec);
  c_loops=LOGICAL(loops)[0];
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_asymmetric_preference_game(&c_graph, c_nodes, c_out_types, c_in_types, &c_type_dist_matrix, &c_pref_matrix, &c_node_type_in_vec, &c_node_type_out_vec, c_loops));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(3));
  PROTECT(r_names=NEW_CHARACTER(3));
  IGRAPH_FINALLY(igraph_destroy, &c_graph);
  PROTECT(graph=R_igraph_to_SEXP(&c_graph));
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(node_type_in_vec=R_igraph_vector_to_SEXP(&c_node_type_in_vec));
  igraph_vector_destroy(&c_node_type_in_vec);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(node_type_out_vec=R_igraph_vector_to_SEXP(&c_node_type_out_vec));
  igraph_vector_destroy(&c_node_type_out_vec);
  IGRAPH_FINALLY_CLEAN(1);
  SET_VECTOR_ELT(r_result, 0, graph);
  SET_VECTOR_ELT(r_result, 1, node_type_in_vec);
  SET_VECTOR_ELT(r_result, 2, node_type_out_vec);
  SET_STRING_ELT(r_names, 0, Rf_mkChar("graph"));
  SET_STRING_ELT(r_names, 1, Rf_mkChar("node_type_in_vec"));
  SET_STRING_ELT(r_names, 2, Rf_mkChar("node_type_out_vec"));
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
  if (!Rf_isNull(fitness_in)) { R_SEXP_to_vector(fitness_in, &c_fitness_in); }
  c_loops=LOGICAL(loops)[0];
  c_multiple=LOGICAL(multiple)[0];
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_static_fitness_game(&c_graph, c_no_of_edges, &c_fitness_out, (Rf_isNull(fitness_in) ? 0 : &c_fitness_in), c_loops, c_multiple));

                                        /* Convert output */
  IGRAPH_FINALLY(igraph_destroy, &c_graph);
  PROTECT(graph=R_igraph_to_SEXP(&c_graph));
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
  R_SEXP_to_vector_int_copy(block_sizes, &c_block_sizes);
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_block_sizes);
  c_directed=LOGICAL(directed)[0];
  c_loops=LOGICAL(loops)[0];
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_sbm_game(&c_graph, c_n, &c_pref_matrix, &c_block_sizes, c_directed, c_loops));

                                        /* Convert output */
  IGRAPH_FINALLY(igraph_destroy, &c_graph);
  PROTECT(graph=R_igraph_to_SEXP(&c_graph));
  IGRAPH_FINALLY_CLEAN(1);
  igraph_vector_int_destroy(&c_block_sizes);
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
  igraph_vector_ptr_t c_rholist;
  igraph_vector_ptr_t c_Clist;
  igraph_real_t c_p;
  SEXP graph;

  SEXP r_result;
                                        /* Convert input */
  c_n=INTEGER(n)[0];
  R_SEXP_to_vector_int_copy(mlist, &c_mlist);
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_mlist);
  R_igraph_SEXP_to_vectorlist(rholist, &c_rholist);
  R_igraph_SEXP_to_matrixlist(Clist, &c_Clist);
  c_p=REAL(p)[0];
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_hsbm_list_game(&c_graph, c_n, &c_mlist, &c_rholist, &c_Clist, c_p));

                                        /* Convert output */
  IGRAPH_FINALLY(igraph_destroy, &c_graph);
  PROTECT(graph=R_igraph_to_SEXP(&c_graph));
  IGRAPH_FINALLY_CLEAN(1);
  igraph_vector_int_destroy(&c_mlist);
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
  igraph_vector_t c_permutation;
  SEXP new_graph;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(old_graph, &c_old_graph);
  c_corr=REAL(corr)[0];
  c_p=REAL(p)[0];
  if (!Rf_isNull(permutation)) { R_SEXP_to_vector(permutation, &c_permutation); }
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_correlated_game(&c_old_graph, &c_new_graph, c_corr, c_p, (Rf_isNull(permutation) ? 0 : &c_permutation)));

                                        /* Convert output */
  IGRAPH_FINALLY(igraph_destroy, &c_new_graph);
  PROTECT(new_graph=R_igraph_to_SEXP(&c_new_graph));
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
  igraph_vector_t c_permutation;
  SEXP graph1;
  SEXP graph2;

  SEXP r_result, r_names;
                                        /* Convert input */
  c_n=INTEGER(n)[0];
  c_corr=REAL(corr)[0];
  c_p=REAL(p)[0];
  c_directed=LOGICAL(directed)[0];
  if (!Rf_isNull(permutation)) { R_SEXP_to_vector(permutation, &c_permutation); }
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_correlated_pair_game(&c_graph1, &c_graph2, c_n, c_corr, c_p, c_directed, (Rf_isNull(permutation) ? 0 : &c_permutation)));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(2));
  PROTECT(r_names=NEW_CHARACTER(2));
  IGRAPH_FINALLY(igraph_destroy, &c_graph1);
  PROTECT(graph1=R_igraph_to_SEXP(&c_graph1));
  IGRAPH_FINALLY_CLEAN(1);
  IGRAPH_FINALLY(igraph_destroy, &c_graph2);
  PROTECT(graph2=R_igraph_to_SEXP(&c_graph2));
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
  igraph_vector_t c_reachable_count;
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
  if (0 != igraph_vector_init(&c_reachable_count, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_reachable_count);
  reachable_count=R_GlobalEnv; /* hack to have a non-NULL value */
  R_SEXP_to_igraph_vs(vids, &c_graph, &c_vids);
  c_mode = (igraph_neimode_t) Rf_asInteger(mode);
  if (!Rf_isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
  c_normalized=LOGICAL(normalized)[0];
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_closeness(&c_graph, &c_res, (Rf_isNull(reachable_count) ? 0 : &c_reachable_count), &c_all_reachable, c_vids, c_mode, (Rf_isNull(weights) ? 0 : &c_weights), c_normalized));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(3));
  PROTECT(r_names=NEW_CHARACTER(3));
  PROTECT(res=R_igraph_vector_to_SEXP(&c_res));
  igraph_vector_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(reachable_count=R_igraph_0orvector_to_SEXP(&c_reachable_count));
  igraph_vector_destroy(&c_reachable_count);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(all_reachable=NEW_LOGICAL(1));
  LOGICAL(all_reachable)[0]=c_all_reachable;
  igraph_vs_destroy(&c_vids);
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
  igraph_vector_t c_reachable_count;
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
  if (0 != igraph_vector_init(&c_reachable_count, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_reachable_count);
  reachable_count=R_GlobalEnv; /* hack to have a non-NULL value */
  R_SEXP_to_igraph_vs(vids, &c_graph, &c_vids);
  c_mode = (igraph_neimode_t) Rf_asInteger(mode);
  if (!Rf_isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
  c_normalized=LOGICAL(normalized)[0];
  c_cutoff=REAL(cutoff)[0];
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_closeness_cutoff(&c_graph, &c_res, (Rf_isNull(reachable_count) ? 0 : &c_reachable_count), &c_all_reachable, c_vids, c_mode, (Rf_isNull(weights) ? 0 : &c_weights), c_normalized, c_cutoff));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(3));
  PROTECT(r_names=NEW_CHARACTER(3));
  PROTECT(res=R_igraph_vector_to_SEXP(&c_res));
  igraph_vector_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(reachable_count=R_igraph_0orvector_to_SEXP(&c_reachable_count));
  igraph_vector_destroy(&c_reachable_count);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(all_reachable=NEW_LOGICAL(1));
  LOGICAL(all_reachable)[0]=c_all_reachable;
  igraph_vs_destroy(&c_vids);
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

  SEXP r_result, r_names;
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
  c_from = (igraph_integer_t) REAL(from)[0];
  R_SEXP_to_igraph_vs(to, &c_graph, &c_to);
  c_mode = (igraph_neimode_t) Rf_asInteger(mode);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_get_all_shortest_paths(&c_graph, &c_res, &c_nrgeo, c_from, c_to, c_mode));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(2));
  PROTECT(r_names=NEW_CHARACTER(2));
  PROTECT(res=R_igraph_vectorlist_to_SEXP_p1(&c_res));
  R_igraph_vectorlist_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(nrgeo=R_igraph_vector_to_SEXP(&c_nrgeo));
  igraph_vector_destroy(&c_nrgeo);
  IGRAPH_FINALLY_CLEAN(1);
  igraph_vs_destroy(&c_to);
  SET_VECTOR_ELT(r_result, 0, res);
  SET_VECTOR_ELT(r_result, 1, nrgeo);
  SET_STRING_ELT(r_names, 0, Rf_mkChar("res"));
  SET_STRING_ELT(r_names, 1, Rf_mkChar("nrgeo"));
  SET_NAMES(r_result, r_names);
  UNPROTECT(3);

  UNPROTECT(1);
  return(r_result);
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

  SEXP r_result, r_names;
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
  c_from = (igraph_integer_t) REAL(from)[0];
  R_SEXP_to_igraph_vs(to, &c_graph, &c_to);
  if (!Rf_isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
  c_mode = (igraph_neimode_t) Rf_asInteger(mode);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_get_all_shortest_paths_dijkstra(&c_graph, &c_res, &c_nrgeo, c_from, c_to, (Rf_isNull(weights) ? 0 : &c_weights), c_mode));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(2));
  PROTECT(r_names=NEW_CHARACTER(2));
  PROTECT(res=R_igraph_vectorlist_to_SEXP_p1(&c_res));
  R_igraph_vectorlist_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(nrgeo=R_igraph_vector_to_SEXP(&c_nrgeo));
  igraph_vector_destroy(&c_nrgeo);
  IGRAPH_FINALLY_CLEAN(1);
  igraph_vs_destroy(&c_to);
  SET_VECTOR_ELT(r_result, 0, res);
  SET_VECTOR_ELT(r_result, 1, nrgeo);
  SET_STRING_ELT(r_names, 0, Rf_mkChar("res"));
  SET_STRING_ELT(r_names, 1, Rf_mkChar("nrgeo"));
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
  R_SEXP_to_igraph_vs(to, &c_graph, &c_to);
  c_cutoff=INTEGER(cutoff)[0];
  c_mode = (igraph_neimode_t) Rf_asInteger(mode);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_get_all_simple_paths(&c_graph, &c_res, c_from, c_to, c_cutoff, c_mode));

                                        /* Convert output */
  PROTECT(res=R_igraph_vector_int_to_SEXPp1(&c_res));
  igraph_vector_int_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  igraph_vs_destroy(&c_to);
  r_result = res;

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
  R_SEXP_to_igraph_vs(vids, &c_graph, &c_vids);
  c_directed=LOGICAL(directed)[0];
  if (!Rf_isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
  c_cutoff=REAL(cutoff)[0];
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_betweenness_cutoff(&c_graph, &c_res, c_vids, c_directed, (Rf_isNull(weights) ? 0 : &c_weights), c_cutoff));

                                        /* Convert output */
  PROTECT(res=R_igraph_vector_to_SEXP(&c_res));
  igraph_vector_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  igraph_vs_destroy(&c_vids);
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
  R_SEXP_to_igraph_vs(vids, &c_graph, &c_vids);
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
  igraph_vs_destroy(&c_vids);
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
  R_SEXP_to_igraph_vs(vids, &c_graph, &c_vids);
  c_directed=LOGICAL(directed)[0];
  c_damping=REAL(damping)[0];
  if (!Rf_isNull(personalized)) { R_SEXP_to_vector(personalized, &c_personalized); }
  if (!Rf_isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
  if (c_algo == IGRAPH_PAGERANK_ALGO_ARPACK) {
    R_SEXP_to_igraph_arpack_options(options, &c_options1);
    c_options = &c_options1;
  } else {
    c_options = 0;
  }
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_personalized_pagerank(&c_graph, c_algo, &c_vector, &c_value, c_vids, c_directed, c_damping, (Rf_isNull(personalized) ? 0 : &c_personalized), (Rf_isNull(weights) ? 0 : &c_weights), c_options));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(3));
  PROTECT(r_names=NEW_CHARACTER(3));
  PROTECT(vector=R_igraph_vector_to_SEXP(&c_vector));
  igraph_vector_destroy(&c_vector);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(value=NEW_NUMERIC(1));
  REAL(value)[0]=c_value;
  igraph_vs_destroy(&c_vids);
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
  R_SEXP_to_igraph_vs(vids, &c_graph, &c_vids);
  c_impl = (igraph_subgraph_implementation_t) Rf_asInteger(impl);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_induced_subgraph(&c_graph, &c_res, c_vids, c_impl));

                                        /* Convert output */
  IGRAPH_FINALLY(igraph_destroy, &c_res);
  PROTECT(res=R_igraph_to_SEXP(&c_res));
  IGRAPH_FINALLY_CLEAN(1);
  igraph_vs_destroy(&c_vids);
  r_result = res;

  UNPROTECT(1);
  return(r_result);
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

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  R_SEXP_to_igraph_es(eids, &c_graph, &c_eids);
  c_delete_vertices=LOGICAL(delete_vertices)[0];
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_subgraph_edges(&c_graph, &c_res, c_eids, c_delete_vertices));

                                        /* Convert output */
  IGRAPH_FINALLY(igraph_destroy, &c_res);
  PROTECT(res=R_igraph_to_SEXP(&c_res));
  IGRAPH_FINALLY_CLEAN(1);
  igraph_es_destroy(&c_eids);
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
  R_SEXP_to_igraph_es(eids, &c_graph, &c_eids);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_reverse_edges(&c_graph, c_eids));

                                        /* Convert output */
  PROTECT(graph=R_igraph_to_SEXP(&c_graph));
  IGRAPH_FINALLY_CLEAN(1);
  igraph_es_destroy(&c_eids);
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
  IGRAPH_FINALLY_CLEAN(1);
  igraph_attribute_combination_destroy(&c_edge_attr_comb);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = graph;

  UNPROTECT(1);
  return(r_result);
}

/*-------------------------------------------/
/ igraph_feedback_arc_set                    /
/-------------------------------------------*/
SEXP R_igraph_feedback_arc_set(SEXP graph, SEXP weights, SEXP algo) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_t c_result;
  igraph_vector_t c_weights;
  igraph_fas_algorithm_t c_algo;
  SEXP result;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_init(&c_result, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_result);
  if (!Rf_isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
  c_algo = (igraph_fas_algorithm_t) Rf_asInteger(algo);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_feedback_arc_set(&c_graph, &c_result, (Rf_isNull(weights) ? 0 : &c_weights), c_algo));

                                        /* Convert output */
  PROTECT(result=R_igraph_vector_to_SEXPp1(&c_result));
  igraph_vector_destroy(&c_result);
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
  R_SEXP_to_igraph_es(es, &c_graph, &c_es);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_is_loop(&c_graph, &c_res, c_es));

                                        /* Convert output */
  PROTECT(res=R_igraph_vector_bool_to_SEXP(&c_res));
  igraph_vector_bool_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  igraph_es_destroy(&c_es);
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
  R_SEXP_to_igraph_es(es, &c_graph, &c_es);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_is_multiple(&c_graph, &c_res, c_es));

                                        /* Convert output */
  PROTECT(res=R_igraph_vector_bool_to_SEXP(&c_res));
  igraph_vector_bool_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  igraph_es_destroy(&c_es);
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
  igraph_vector_t c_res;
  igraph_es_t c_es;
  SEXP res;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_init(&c_res, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_res);
  R_SEXP_to_igraph_es(es, &c_graph, &c_es);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_count_multiple(&c_graph, &c_res, c_es));

                                        /* Convert output */
  PROTECT(res=R_igraph_vector_to_SEXP(&c_res));
  igraph_vector_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  igraph_es_destroy(&c_es);
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
/ igraph_arpack_unpack_complex               /
/-------------------------------------------*/
SEXP R_igraph_arpack_unpack_complex(SEXP vectors, SEXP values, SEXP nev) {
                                        /* Declarations */
  igraph_matrix_t c_vectors;
  igraph_matrix_t c_values;
  long int c_nev;

  SEXP r_result, r_names;
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
  IGRAPH_R_CHECK(igraph_arpack_unpack_complex(&c_vectors, &c_values, c_nev));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(2));
  PROTECT(r_names=NEW_CHARACTER(2));
  PROTECT(vectors=R_igraph_matrix_to_SEXP(&c_vectors));
  igraph_matrix_destroy(&c_vectors);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(values=R_igraph_matrix_to_SEXP(&c_values));
  igraph_matrix_destroy(&c_values);
  IGRAPH_FINALLY_CLEAN(1);
  SET_VECTOR_ELT(r_result, 0, vectors);
  SET_VECTOR_ELT(r_result, 1, values);
  SET_STRING_ELT(r_names, 0, Rf_mkChar("vectors"));
  SET_STRING_ELT(r_names, 1, Rf_mkChar("values"));
  SET_NAMES(r_result, r_names);
  UNPROTECT(3);

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
  igraph_vector_t c_roots;
  igraph_vector_t c_vertex_index;
  SEXP tree;
  SEXP vertex_index;

  SEXP r_result, r_names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  c_mode = (igraph_neimode_t) Rf_asInteger(mode);
  R_SEXP_to_vector(roots, &c_roots);
  if (0 != igraph_vector_init(&c_vertex_index, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_vertex_index);
  vertex_index=R_GlobalEnv; /* hack to have a non-NULL value */
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_unfold_tree(&c_graph, &c_tree, c_mode, &c_roots, (Rf_isNull(vertex_index) ? 0 : &c_vertex_index)));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(2));
  PROTECT(r_names=NEW_CHARACTER(2));
  IGRAPH_FINALLY(igraph_destroy, &c_tree);
  PROTECT(tree=R_igraph_to_SEXP(&c_tree));
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(vertex_index=R_igraph_0orvector_to_SEXPp1(&c_vertex_index));
  igraph_vector_destroy(&c_vertex_index);
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
SEXP R_igraph_is_mutual(SEXP graph, SEXP es) {
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
  R_SEXP_to_igraph_es(es, &c_graph, &c_es);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_is_mutual(&c_graph, &c_res, c_es));

                                        /* Convert output */
  PROTECT(res=R_igraph_vector_bool_to_SEXP(&c_res));
  igraph_vector_bool_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  igraph_es_destroy(&c_es);
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
  igraph_vector_t c_alpha;
  igraph_vector_t c_alpham1;
  SEXP alpha;
  SEXP alpham1;

  SEXP r_result, r_names;
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
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_maximum_cardinality_search(&c_graph, &c_alpha, &c_alpham1));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(2));
  PROTECT(r_names=NEW_CHARACTER(2));
  PROTECT(alpha=R_igraph_vector_to_SEXPp1(&c_alpha));
  igraph_vector_destroy(&c_alpha);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(alpham1=R_igraph_vector_to_SEXPp1(&c_alpham1));
  igraph_vector_destroy(&c_alpham1);
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
  R_SEXP_to_igraph_vs(vids, &c_graph, &c_vids);
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
  knnk=R_GlobalEnv; /* hack to have a non-NULL value */
  if (!Rf_isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_avg_nearest_neighbor_degree(&c_graph, c_vids, c_mode, c_neighbor_degree_mode, &c_knn, (Rf_isNull(knnk) ? 0 : &c_knnk), (Rf_isNull(weights) ? 0 : &c_weights)));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(2));
  PROTECT(r_names=NEW_CHARACTER(2));
  igraph_vs_destroy(&c_vids);
  PROTECT(knn=R_igraph_vector_to_SEXP(&c_knn));
  igraph_vector_destroy(&c_knn);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(knnk=R_igraph_0orvector_to_SEXP(&c_knnk));
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
  R_SEXP_to_igraph_vs(vids, &c_graph, &c_vids);
  c_mode = (igraph_neimode_t) Rf_asInteger(mode);
  c_loops=LOGICAL(loops)[0];
  if (!Rf_isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_strength(&c_graph, &c_res, c_vids, c_mode, c_loops, (Rf_isNull(weights) ? 0 : &c_weights)));

                                        /* Convert output */
  PROTECT(res=R_igraph_vector_to_SEXP(&c_res));
  igraph_vector_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  igraph_vs_destroy(&c_vids);
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
  if (!Rf_isNull(graph)) { R_SEXP_to_igraph(graph, &c_graph); }
  c_nodes=INTEGER(nodes)[0];
  c_mode = (igraph_neimode_t) Rf_asInteger(mode);
  c_loops=LOGICAL(loops)[0];
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_centralization_degree_tmax((Rf_isNull(graph) ? 0 : &c_graph), c_nodes, c_mode, c_loops, &c_res));

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
  if (!Rf_isNull(graph)) { R_SEXP_to_igraph(graph, &c_graph); }
  c_nodes=INTEGER(nodes)[0];
  c_directed=LOGICAL(directed)[0];
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_centralization_betweenness_tmax((Rf_isNull(graph) ? 0 : &c_graph), c_nodes, c_directed, &c_res));

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
  if (!Rf_isNull(graph)) { R_SEXP_to_igraph(graph, &c_graph); }
  c_nodes=INTEGER(nodes)[0];
  c_mode = (igraph_neimode_t) Rf_asInteger(mode);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_centralization_closeness_tmax((Rf_isNull(graph) ? 0 : &c_graph), c_nodes, c_mode, &c_res));

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
  if (!Rf_isNull(graph)) { R_SEXP_to_igraph(graph, &c_graph); }
  c_nodes=INTEGER(nodes)[0];
  c_directed=LOGICAL(directed)[0];
  c_scale=LOGICAL(scale)[0];
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_centralization_eigenvector_centrality_tmax((Rf_isNull(graph) ? 0 : &c_graph), c_nodes, c_directed, c_scale, &c_res));

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
SEXP R_igraph_assortativity_nominal(SEXP graph, SEXP types, SEXP directed) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_t c_types;
  igraph_real_t c_res;
  igraph_bool_t c_directed;
  SEXP res;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  R_SEXP_to_vector(types, &c_types);
  c_directed=LOGICAL(directed)[0];
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_assortativity_nominal(&c_graph, &c_types, &c_res, c_directed));

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
SEXP R_igraph_assortativity(SEXP graph, SEXP types1, SEXP types2, SEXP directed) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_t c_types1;
  igraph_vector_t c_types2;
  igraph_real_t c_res;
  igraph_bool_t c_directed;
  SEXP res;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  R_SEXP_to_vector(types1, &c_types1);
  if (!Rf_isNull(types2)) { R_SEXP_to_vector(types2, &c_types2); }
  c_directed=LOGICAL(directed)[0];
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_assortativity(&c_graph, &c_types1, (Rf_isNull(types2) ? 0 : &c_types2), &c_res, c_directed));

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
  igraph_vector_t c_mapping;
  igraph_attribute_combination_t c_vertex_attr_comb;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph_copy(graph, &c_graph);
  IGRAPH_FINALLY(igraph_destroy, &c_graph);
  R_SEXP_to_vector(mapping, &c_mapping);
  R_SEXP_to_attr_comb(vertex_attr_comb, &c_vertex_attr_comb);
  IGRAPH_FINALLY(igraph_attribute_combination_destroy, &c_vertex_attr_comb);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_contract_vertices(&c_graph, &c_mapping, &c_vertex_attr_comb));

                                        /* Convert output */
  PROTECT(graph=R_igraph_to_SEXP(&c_graph));
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
  R_SEXP_to_igraph_vs(vids, &c_graph, &c_vids);
  c_mode = (igraph_neimode_t) Rf_asInteger(mode);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_eccentricity(&c_graph, &c_res, c_vids, c_mode));

                                        /* Convert output */
  PROTECT(res=R_igraph_vector_to_SEXP(&c_res));
  igraph_vector_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  igraph_vs_destroy(&c_vids);
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
  R_SEXP_to_igraph_vs(vids, &c_graph, &c_vids);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_diversity(&c_graph, (Rf_isNull(weights) ? 0 : &c_weights), &c_res, c_vids));

                                        /* Convert output */
  PROTECT(res=R_igraph_vector_to_SEXP(&c_res));
  igraph_vector_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  igraph_vs_destroy(&c_vids);
  r_result = res;

  UNPROTECT(1);
  return(r_result);
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

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_init(&c_walk, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_walk);
  c_start = (igraph_integer_t) REAL(start)[0];
  c_mode = (igraph_neimode_t) Rf_asInteger(mode);
  c_steps=INTEGER(steps)[0];
  c_stuck = (igraph_random_walk_stuck_t) Rf_asInteger(stuck);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_random_walk(&c_graph, &c_walk, c_start, c_mode, c_steps, c_stuck));

                                        /* Convert output */
  PROTECT(walk=R_igraph_vector_to_SEXPp1(&c_walk));
  igraph_vector_destroy(&c_walk);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = walk;

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
  igraph_vector_t c_edgewalk;
  igraph_integer_t c_start;
  igraph_neimode_t c_mode;
  igraph_integer_t c_steps;
  igraph_random_walk_stuck_t c_stuck;
  SEXP edgewalk;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (!Rf_isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
  if (0 != igraph_vector_init(&c_edgewalk, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_edgewalk);
  c_start = (igraph_integer_t) REAL(start)[0];
  c_mode = (igraph_neimode_t) Rf_asInteger(mode);
  c_steps=INTEGER(steps)[0];
  c_stuck = (igraph_random_walk_stuck_t) Rf_asInteger(stuck);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_random_edge_walk(&c_graph, (Rf_isNull(weights) ? 0 : &c_weights), &c_edgewalk, c_start, c_mode, c_steps, c_stuck));

                                        /* Convert output */
  PROTECT(edgewalk=R_igraph_vector_to_SEXPp1(&c_edgewalk));
  igraph_vector_destroy(&c_edgewalk);
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
  R_SEXP_to_igraph_vs(vids, &c_graph, &c_vids);
  if (!Rf_isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
  c_directed=LOGICAL(directed)[0];
  c_mode = (igraph_neimode_t) Rf_asInteger(mode);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_local_efficiency(&c_graph, &c_res, c_vids, (Rf_isNull(weights) ? 0 : &c_weights), c_directed, c_mode));

                                        /* Convert output */
  PROTECT(res=R_igraph_vector_to_SEXP(&c_res));
  igraph_vector_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  igraph_vs_destroy(&c_vids);
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
/ igraph_is_graphical                        /
/-------------------------------------------*/
SEXP R_igraph_is_graphical(SEXP out_deg, SEXP in_deg, SEXP allowed_edge_types) {
                                        /* Declarations */
  igraph_vector_t c_out_deg;
  igraph_vector_t c_in_deg;
  igraph_edge_type_sw_t c_allowed_edge_types;
  igraph_bool_t c_res;
  SEXP res;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_vector(out_deg, &c_out_deg);
  if (!Rf_isNull(in_deg)) { R_SEXP_to_vector(in_deg, &c_in_deg); }
  c_allowed_edge_types = (igraph_edge_type_sw_t) Rf_asInteger(allowed_edge_types);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_is_graphical(&c_out_deg, (Rf_isNull(in_deg) ? 0 : &c_in_deg), c_allowed_edge_types, &c_res));

                                        /* Convert output */
  PROTECT(res=NEW_LOGICAL(1));
  LOGICAL(res)[0]=c_res;
  r_result = res;

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
  igraph_vector_t c_edges;
  igraph_bool_t c_directed;
  SEXP graph;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_vector_bool(types, &c_types);
  R_SEXP_to_vector(edges, &c_edges);
  c_directed=LOGICAL(directed)[0];
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_create_bipartite(&c_graph, &c_types, &c_edges, c_directed));

                                        /* Convert output */
  IGRAPH_FINALLY(igraph_destroy, &c_graph);
  PROTECT(graph=R_igraph_to_SEXP(&c_graph));
  IGRAPH_FINALLY_CLEAN(1);
  r_result = graph;

  UNPROTECT(1);
  return(r_result);
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
  IGRAPH_R_CHECK(igraph_incidence(&c_graph, &c_types, &c_incidence, c_directed, c_mode, c_multiple));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(2));
  PROTECT(r_names=NEW_CHARACTER(2));
  IGRAPH_FINALLY(igraph_destroy, &c_graph);
  PROTECT(graph=R_igraph_to_SEXP(&c_graph));
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

  SEXP r_result, r_names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (!Rf_isNull(types)) { R_SEXP_to_vector_bool(types, &c_types); }
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
  IGRAPH_R_CHECK(igraph_get_incidence(&c_graph, (Rf_isNull(types) ? 0 : &c_types), &c_res, (Rf_isNull(row_ids) ? 0 : &c_row_ids), (Rf_isNull(col_ids) ? 0 : &c_col_ids)));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(3));
  PROTECT(r_names=NEW_CHARACTER(3));
  PROTECT(res=R_igraph_matrix_to_SEXP(&c_res));
  igraph_matrix_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(row_ids=R_igraph_0orvector_to_SEXP(&c_row_ids));
  igraph_vector_destroy(&c_row_ids);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(col_ids=R_igraph_0orvector_to_SEXP(&c_col_ids));
  igraph_vector_destroy(&c_col_ids);
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
  type=R_GlobalEnv; /* hack to have a non-NULL value */
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_is_bipartite(&c_graph, &c_res, (Rf_isNull(type) ? 0 : &c_type)));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(2));
  PROTECT(r_names=NEW_CHARACTER(2));
  PROTECT(res=NEW_LOGICAL(1));
  LOGICAL(res)[0]=c_res;
  PROTECT(type=R_igraph_0orvector_bool_to_SEXP(&c_type));
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
  types=R_GlobalEnv; /* hack to have a non-NULL value */
  c_n1=INTEGER(n1)[0];
  c_n2=INTEGER(n2)[0];
  c_p=REAL(p)[0];
  c_directed=LOGICAL(directed)[0];
  c_mode = (igraph_neimode_t) Rf_asInteger(mode);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_bipartite_game_gnp(&c_graph, (Rf_isNull(types) ? 0 : &c_types), c_n1, c_n2, c_p, c_directed, c_mode));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(2));
  PROTECT(r_names=NEW_CHARACTER(2));
  IGRAPH_FINALLY(igraph_destroy, &c_graph);
  PROTECT(graph=R_igraph_to_SEXP(&c_graph));
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(types=R_igraph_0orvector_bool_to_SEXP(&c_types));
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
  types=R_GlobalEnv; /* hack to have a non-NULL value */
  c_n1=INTEGER(n1)[0];
  c_n2=INTEGER(n2)[0];
  c_m=INTEGER(m)[0];
  c_directed=LOGICAL(directed)[0];
  c_mode = (igraph_neimode_t) Rf_asInteger(mode);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_bipartite_game_gnm(&c_graph, (Rf_isNull(types) ? 0 : &c_types), c_n1, c_n2, c_m, c_directed, c_mode));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(2));
  PROTECT(r_names=NEW_CHARACTER(2));
  IGRAPH_FINALLY(igraph_destroy, &c_graph);
  PROTECT(graph=R_igraph_to_SEXP(&c_graph));
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(types=R_igraph_0orvector_bool_to_SEXP(&c_types));
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

  SEXP r_result, r_names;
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
  c_no=0;
  c_mode=REAL(mode)[0];
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_clusters(&c_graph, &c_membership, &c_csize, &c_no, c_mode));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(3));
  PROTECT(r_names=NEW_CHARACTER(3));
  PROTECT(membership=R_igraph_vector_to_SEXP(&c_membership));
  igraph_vector_destroy(&c_membership);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(csize=R_igraph_vector_to_SEXP(&c_csize));
  igraph_vector_destroy(&c_csize);
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
  IGRAPH_R_CHECK(igraph_articulation_points(&c_graph, &c_res));

                                        /* Convert output */
  PROTECT(res=R_igraph_vector_to_SEXPp1(&c_res));
  igraph_vector_destroy(&c_res);
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
  igraph_vector_ptr_t c_tree_edges;
  igraph_vector_ptr_t c_component_edges;
  igraph_vector_ptr_t c_components;
  igraph_vector_t c_articulation_points;
  SEXP no;
  SEXP tree_edges;
  SEXP component_edges;
  SEXP components;
  SEXP articulation_points;

  SEXP r_result, r_names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  c_no=0;
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
  IGRAPH_R_CHECK(igraph_biconnected_components(&c_graph, &c_no, &c_tree_edges, &c_component_edges, &c_components, &c_articulation_points));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(5));
  PROTECT(r_names=NEW_CHARACTER(5));
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
  IGRAPH_R_CHECK(igraph_bridges(&c_graph, &c_res));

                                        /* Convert output */
  PROTECT(res=R_igraph_vector_to_SEXPp1(&c_res));
  igraph_vector_destroy(&c_res);
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
  igraph_vector_ptr_t c_res;
  igraph_integer_t c_min_size;
  igraph_integer_t c_max_size;
  SEXP res;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_ptr_init(&c_res, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(R_igraph_vectorlist_destroy, &c_res);
  c_min_size=INTEGER(min_size)[0];
  c_max_size=INTEGER(max_size)[0];
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_cliques(&c_graph, &c_res, c_min_size, c_max_size));

                                        /* Convert output */
  PROTECT(res=R_igraph_vectorlist_to_SEXP_p1(&c_res));
  R_igraph_vectorlist_destroy(&c_res);
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
  igraph_vector_ptr_t c_res;
  SEXP res;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_ptr_init(&c_res, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(R_igraph_vectorlist_destroy, &c_res);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_largest_cliques(&c_graph, &c_res));

                                        /* Convert output */
  PROTECT(res=R_igraph_vectorlist_to_SEXP_p1(&c_res));
  R_igraph_vectorlist_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = res;

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
  igraph_vector_ptr_t c_res;
  igraph_real_t c_min_weight;
  igraph_real_t c_max_weight;
  igraph_bool_t c_maximal;
  SEXP res;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (!Rf_isNull(vertex_weights)) { R_SEXP_to_vector(vertex_weights, &c_vertex_weights); }
  if (0 != igraph_vector_ptr_init(&c_res, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(R_igraph_vectorlist_destroy, &c_res);
  c_min_weight=REAL(min_weight)[0];
  c_max_weight=REAL(max_weight)[0];
  c_maximal=LOGICAL(maximal)[0];
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_weighted_cliques(&c_graph, (Rf_isNull(vertex_weights) ? 0 : &c_vertex_weights), &c_res, c_min_weight, c_max_weight, c_maximal));

                                        /* Convert output */
  PROTECT(res=R_igraph_vectorlist_to_SEXP_p1(&c_res));
  R_igraph_vectorlist_destroy(&c_res);
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
  igraph_vector_ptr_t c_res;
  SEXP res;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (!Rf_isNull(vertex_weights)) { R_SEXP_to_vector(vertex_weights, &c_vertex_weights); }
  if (0 != igraph_vector_ptr_init(&c_res, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(R_igraph_vectorlist_destroy, &c_res);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_largest_weighted_cliques(&c_graph, (Rf_isNull(vertex_weights) ? 0 : &c_vertex_weights), &c_res));

                                        /* Convert output */
  PROTECT(res=R_igraph_vectorlist_to_SEXP_p1(&c_res));
  R_igraph_vectorlist_destroy(&c_res);
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
  igraph_vector_t c_order;
  SEXP res;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_matrix_init(&c_res, 0, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_matrix_destroy, &c_res);
  c_center = (igraph_integer_t) REAL(center)[0];
  if (!Rf_isNull(order)) { R_SEXP_to_vector(order, &c_order); }
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_layout_star(&c_graph, &c_res, c_center, (Rf_isNull(order) ? 0 : &c_order)));

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
  long int c_width;
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
  long int c_width;
  long int c_height;
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
  if (!Rf_isNull(fixed)) { R_SEXP_to_vector_bool(fixed, &c_fixed); }
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_layout_drl(&c_graph, &c_res, c_use_seed, &c_options, (Rf_isNull(weights) ? 0 : &c_weights), (Rf_isNull(fixed) ? 0 : &c_fixed)));

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
SEXP R_igraph_layout_drl_3d(SEXP graph, SEXP res, SEXP use_seed, SEXP options, SEXP weights, SEXP fixed) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_matrix_t c_res;
  igraph_bool_t c_use_seed;
  igraph_layout_drl_options_t c_options;
  igraph_vector_t c_weights;
  igraph_vector_bool_t c_fixed;

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
  if (!Rf_isNull(fixed)) { R_SEXP_to_vector_bool(fixed, &c_fixed); }
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_layout_drl_3d(&c_graph, &c_res, c_use_seed, &c_options, (Rf_isNull(weights) ? 0 : &c_weights), (Rf_isNull(fixed) ? 0 : &c_fixed)));

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
  igraph_vector_t c_extd_to_orig_eids;
  igraph_vector_t c_layers;
  igraph_real_t c_hgap;
  igraph_real_t c_vgap;
  long int c_maxiter;
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
  extd_graph=R_GlobalEnv; /* hack to have a non-NULL value */
  if (0 != igraph_vector_init(&c_extd_to_orig_eids, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_extd_to_orig_eids);
  extd_to_orig_eids=R_GlobalEnv; /* hack to have a non-NULL value */
  if (!Rf_isNull(layers)) { R_SEXP_to_vector(layers, &c_layers); }
  c_hgap=REAL(hgap)[0];
  c_vgap=REAL(vgap)[0];
  c_maxiter=INTEGER(maxiter)[0];
  if (!Rf_isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_layout_sugiyama(&c_graph, &c_res, (Rf_isNull(extd_graph) ? 0 : &c_extd_graph), (Rf_isNull(extd_to_orig_eids) ? 0 : &c_extd_to_orig_eids), (Rf_isNull(layers) ? 0 : &c_layers), c_hgap, c_vgap, c_maxiter, (Rf_isNull(weights) ? 0 : &c_weights)));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(3));
  PROTECT(r_names=NEW_CHARACTER(3));
  PROTECT(res=R_igraph_matrix_to_SEXP(&c_res));
  igraph_matrix_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  IGRAPH_FINALLY(igraph_destroy, &c_extd_graph);
  PROTECT(extd_graph=R_igraph_to_SEXP(&c_extd_graph));
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(extd_to_orig_eids=R_igraph_0orvector_to_SEXPp1(&c_extd_to_orig_eids));
  igraph_vector_destroy(&c_extd_to_orig_eids);
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
  long int c_dim;
  SEXP res;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_matrix_init(&c_res, 0, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_matrix_destroy, &c_res);
  if (!Rf_isNull(dist)) { R_SEXP_to_matrix(dist, &c_dist); }
  c_dim=INTEGER(dim)[0];
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_layout_mds(&c_graph, &c_res, (Rf_isNull(dist) ? 0 : &c_dist), c_dim));

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
  long int c_maxiter;
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
  R_SEXP_to_igraph_vs(vids, &c_graph, &c_vids);
  c_mode = (igraph_neimode_t) Rf_asInteger(mode);
  c_loops=LOGICAL(loops)[0];
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_similarity_jaccard(&c_graph, &c_res, c_vids, c_mode, c_loops));

                                        /* Convert output */
  PROTECT(res=R_igraph_matrix_to_SEXP(&c_res));
  igraph_matrix_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  igraph_vs_destroy(&c_vids);
  r_result = res;

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
  R_SEXP_to_igraph_vs(vids, &c_graph, &c_vids);
  c_mode = (igraph_neimode_t) Rf_asInteger(mode);
  c_loops=LOGICAL(loops)[0];
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_similarity_dice(&c_graph, &c_res, c_vids, c_mode, c_loops));

                                        /* Convert output */
  PROTECT(res=R_igraph_matrix_to_SEXP(&c_res));
  igraph_matrix_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  igraph_vs_destroy(&c_vids);
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
  R_SEXP_to_igraph_vs(vids, &c_graph, &c_vids);
  c_mode = (igraph_neimode_t) Rf_asInteger(mode);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_similarity_inverse_log_weighted(&c_graph, &c_res, c_vids, c_mode));

                                        /* Convert output */
  PROTECT(res=R_igraph_matrix_to_SEXP(&c_res));
  igraph_matrix_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  igraph_vs_destroy(&c_vids);
  r_result = res;

  UNPROTECT(1);
  return(r_result);
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

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_vector(comm1, &c_comm1);
  R_SEXP_to_vector(comm2, &c_comm2);
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
  igraph_vector_t c_membership;
  igraph_vector_t c_weights;
  igraph_real_t c_resolution;
  igraph_bool_t c_directed;
  igraph_real_t c_modularity;
  SEXP modularity;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  R_SEXP_to_vector(membership, &c_membership);
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
  igraph_vector_t c_membership;
  igraph_real_t c_modularity;
  SEXP membership;
  SEXP modularity;

  SEXP r_result, r_names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  c_no_of_communities=INTEGER(no_of_communities)[0];
  if (0 != igraph_vector_init(&c_membership, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_membership);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_community_fluid_communities(&c_graph, c_no_of_communities, &c_membership, &c_modularity));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(2));
  PROTECT(r_names=NEW_CHARACTER(2));
  PROTECT(membership=R_igraph_vector_to_SEXP(&c_membership));
  igraph_vector_destroy(&c_membership);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(modularity=NEW_NUMERIC(1));
  REAL(modularity)[0]=c_modularity;
  SET_VECTOR_ELT(r_result, 0, membership);
  SET_VECTOR_ELT(r_result, 1, modularity);
  SET_STRING_ELT(r_names, 0, Rf_mkChar("membership"));
  SET_STRING_ELT(r_names, 1, Rf_mkChar("modularity"));
  SET_NAMES(r_result, r_names);
  UNPROTECT(3);

  UNPROTECT(1);
  return(r_result);
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

  SEXP r_result, r_names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_init(&c_membership, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_membership);
  if (!Rf_isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
  if (!Rf_isNull(initial)) { R_SEXP_to_vector(initial, &c_initial); }
  if (!Rf_isNull(fixed)) { R_SEXP_to_vector_bool(fixed, &c_fixed); }
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_community_label_propagation(&c_graph, &c_membership, (Rf_isNull(weights) ? 0 : &c_weights), (Rf_isNull(initial) ? 0 : &c_initial), (Rf_isNull(fixed) ? 0 : &c_fixed), &c_modularity));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(2));
  PROTECT(r_names=NEW_CHARACTER(2));
  PROTECT(membership=R_igraph_vector_to_SEXP(&c_membership));
  igraph_vector_destroy(&c_membership);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(modularity=NEW_NUMERIC(1));
  REAL(modularity)[0]=c_modularity;
  SET_VECTOR_ELT(r_result, 0, membership);
  SET_VECTOR_ELT(r_result, 1, modularity);
  SET_STRING_ELT(r_names, 0, Rf_mkChar("membership"));
  SET_STRING_ELT(r_names, 1, Rf_mkChar("modularity"));
  SET_NAMES(r_result, r_names);
  UNPROTECT(3);

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
  igraph_vector_t c_membership;
  igraph_matrix_t c_memberships;
  igraph_vector_t c_modularity;
  SEXP membership;
  SEXP memberships;
  SEXP modularity;

  SEXP r_result, r_names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (!Rf_isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
  c_resolution=REAL(resolution)[0];
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
  IGRAPH_R_CHECK(igraph_community_multilevel(&c_graph, (Rf_isNull(weights) ? 0 : &c_weights), c_resolution, &c_membership, (Rf_isNull(memberships) ? 0 : &c_memberships), (Rf_isNull(modularity) ? 0 : &c_modularity)));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(3));
  PROTECT(r_names=NEW_CHARACTER(3));
  PROTECT(membership=R_igraph_vector_to_SEXP(&c_membership));
  igraph_vector_destroy(&c_membership);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(memberships=R_igraph_0ormatrix_to_SEXP(&c_memberships));
  igraph_matrix_destroy(&c_memberships);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(modularity=R_igraph_0orvector_to_SEXP(&c_modularity));
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
  igraph_vector_t c_membership;
  igraph_vector_t c_weights;
  SEXP modularity;
  SEXP membership;

  SEXP r_result, r_names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_init(&c_membership, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_membership);
  membership=R_GlobalEnv; /* hack to have a non-NULL value */
  if (!Rf_isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_community_optimal_modularity(&c_graph, &c_modularity, (Rf_isNull(membership) ? 0 : &c_membership), (Rf_isNull(weights) ? 0 : &c_weights)));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(2));
  PROTECT(r_names=NEW_CHARACTER(2));
  PROTECT(modularity=NEW_NUMERIC(1));
  REAL(modularity)[0]=c_modularity;
  PROTECT(membership=R_igraph_0orvector_to_SEXP(&c_membership));
  igraph_vector_destroy(&c_membership);
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

  SEXP r_result, r_names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (!Rf_isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
  if (!Rf_isNull(vertex_weights)) { R_SEXP_to_vector(vertex_weights, &c_vertex_weights); }
  c_resolution_parameter=REAL(resolution_parameter)[0];
  c_beta=REAL(beta)[0];
  c_start=LOGICAL(start)[0];
  if (!Rf_isNull(membership)) {
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
  c_nb_clusters=0;
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_community_leiden(&c_graph, (Rf_isNull(weights) ? 0 : &c_weights), (Rf_isNull(vertex_weights) ? 0 : &c_vertex_weights), c_resolution_parameter, c_beta, c_start, (Rf_isNull(membership) ? 0 : &c_membership), &c_nb_clusters, &c_quality));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(3));
  PROTECT(r_names=NEW_CHARACTER(3));
  PROTECT(membership=R_igraph_0orvector_to_SEXP(&c_membership));
  igraph_vector_destroy(&c_membership);
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
  igraph_vector_t c_comm1;
  igraph_vector_t c_comm2;
  igraph_integer_t c_distance12;
  igraph_integer_t c_distance21;
  SEXP distance12;
  SEXP distance21;

  SEXP r_result, r_names;
                                        /* Convert input */
  R_SEXP_to_vector(comm1, &c_comm1);
  R_SEXP_to_vector(comm2, &c_comm2);
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
/ igraph_hrg_fit                             /
/-------------------------------------------*/
SEXP R_igraph_hrg_fit(SEXP graph, SEXP hrg, SEXP start, SEXP steps) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_hrg_t c_hrg;
  igraph_bool_t c_start;
  int c_steps;

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
  igraph_vector_t c_parents;
  igraph_vector_t c_weights;
  igraph_hrg_t c_hrg;
  igraph_bool_t c_start;
  int c_num_samples;
  SEXP parents;
  SEXP weights;

  SEXP r_result, r_names;
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
  IGRAPH_R_CHECK(igraph_hrg_consensus(&c_graph, &c_parents, &c_weights, &c_hrg, c_start, c_num_samples));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(3));
  PROTECT(r_names=NEW_CHARACTER(3));
  PROTECT(parents=R_igraph_vector_to_SEXP(&c_parents));
  igraph_vector_destroy(&c_parents);
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
  igraph_vector_t c_edges;
  igraph_vector_t c_prob;
  igraph_hrg_t c_hrg;
  igraph_bool_t c_start;
  int c_num_samples;
  int c_num_bins;
  SEXP edges;
  SEXP prob;

  SEXP r_result, r_names;
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
  IGRAPH_R_CHECK(igraph_hrg_predict(&c_graph, &c_edges, &c_prob, &c_hrg, c_start, c_num_samples, c_num_bins));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(3));
  PROTECT(r_names=NEW_CHARACTER(3));
  PROTECT(edges=R_igraph_vector_to_SEXPp1(&c_edges));
  igraph_vector_destroy(&c_edges);
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

  SEXP r_result, r_names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (!Rf_isNull(e_weights)) { R_SEXP_to_vector(e_weights, &c_e_weights); }
  if (!Rf_isNull(v_weights)) { R_SEXP_to_vector(v_weights, &c_v_weights); }
  c_nb_trials=INTEGER(nb_trials)[0];
  if (0 != igraph_vector_init(&c_membership, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_membership);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_community_infomap(&c_graph, (Rf_isNull(e_weights) ? 0 : &c_e_weights), (Rf_isNull(v_weights) ? 0 : &c_v_weights), c_nb_trials, &c_membership, &c_codelength));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(2));
  PROTECT(r_names=NEW_CHARACTER(2));
  PROTECT(membership=R_igraph_vector_to_SEXP(&c_membership));
  igraph_vector_destroy(&c_membership);
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
  IGRAPH_FINALLY_CLEAN(1);
  igraph_attribute_combination_destroy(&c_edge_attr_comb);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = graph;

  UNPROTECT(1);
  return(r_result);
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

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_matrix_init(&c_res, 0, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_matrix_destroy, &c_res);
  c_column_wise=LOGICAL(column_wise)[0];
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_get_stochastic(&c_graph, &c_res, c_column_wise));

                                        /* Convert output */
  PROTECT(res=R_igraph_matrix_to_SEXP(&c_res));
  igraph_matrix_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = res;

  UNPROTECT(1);
  return(r_result);
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

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  /* Don't need to init. */
  c_column_wise=LOGICAL(column_wise)[0];
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_get_stochastic_sparsemat(&c_graph, &c_sparsemat, c_column_wise));

                                        /* Convert output */
  PROTECT(sparsemat=R_igraph_sparsemat_to_SEXP(&c_sparsemat));
  igraph_sparsemat_destroy(&c_sparsemat);
  r_result = sparsemat;

  UNPROTECT(1);
  return(r_result);
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

  SEXP r_result, r_names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  c_mut=0;
  c_asym=0;
  c_null=0;
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_dyad_census(&c_graph, &c_mut, &c_asym, &c_null));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(3));
  PROTECT(r_names=NEW_CHARACTER(3));
  PROTECT(mut=NEW_INTEGER(1));
  INTEGER(mut)[0]=c_mut;
  PROTECT(asym=NEW_INTEGER(1));
  INTEGER(asym)[0]=c_asym;
  PROTECT(null=NEW_INTEGER(1));
  INTEGER(null)[0]=c_null;
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
  R_SEXP_to_igraph_vs(vids, &c_graph, &c_vids);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_adjacent_triangles(&c_graph, &c_res, c_vids));

                                        /* Convert output */
  PROTECT(res=R_igraph_vector_to_SEXP(&c_res));
  igraph_vector_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  igraph_vs_destroy(&c_vids);
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
  int c_k;
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
  int c_k;
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
  igraph_vector_ptr_t c_neighborhoods;
  SEXP res;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_init(&c_res, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_res);
  if (!Rf_isNull(weights)) { R_SEXP_to_vector(weights, &c_weights); }
  if (!Rf_isNull(neighborhoods)) { R_igraph_SEXP_to_vectorlist_int(neighborhoods, &c_neighborhoods); }
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
  PROTECT(res=R_igraph_vector_int_to_SEXPp1(&c_res));
  igraph_vector_int_destroy(&c_res);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = res;

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

  SEXP r_result, r_names;
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
  c_source = (igraph_integer_t) REAL(source)[0];
  c_target = (igraph_integer_t) REAL(target)[0];
  if (!Rf_isNull(capacity)) { R_SEXP_to_vector(capacity, &c_capacity); }
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_maxflow(&c_graph, &c_value, (Rf_isNull(flow) ? 0 : &c_flow), (Rf_isNull(cut) ? 0 : &c_cut), &c_partition1, &c_partition2, c_source, c_target, (Rf_isNull(capacity) ? 0 : &c_capacity), &c_stats));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(6));
  PROTECT(r_names=NEW_CHARACTER(6));
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
  igraph_vector_t c_cut;
  igraph_vector_t c_partition1;
  igraph_vector_t c_partition2;
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
  c_source = (igraph_integer_t) REAL(source)[0];
  c_target = (igraph_integer_t) REAL(target)[0];
  if (!Rf_isNull(capacity)) { R_SEXP_to_vector(capacity, &c_capacity); }
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_st_mincut(&c_graph, &c_value, (Rf_isNull(cut) ? 0 : &c_cut), &c_partition1, &c_partition2, c_source, c_target, (Rf_isNull(capacity) ? 0 : &c_capacity)));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(4));
  PROTECT(r_names=NEW_CHARACTER(4));
  PROTECT(value=NEW_NUMERIC(1));
  REAL(value)[0]=c_value;
  PROTECT(cut=R_igraph_0orvector_to_SEXPp1(&c_cut));
  igraph_vector_destroy(&c_cut);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(partition1=R_igraph_vector_to_SEXPp1(&c_partition1));
  igraph_vector_destroy(&c_partition1);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(partition2=R_igraph_vector_to_SEXPp1(&c_partition2));
  igraph_vector_destroy(&c_partition2);
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

  SEXP r_result, r_names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  c_root = (igraph_integer_t) REAL(root)[0];
  if (0 != igraph_vector_init(&c_dom, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_dom);
  domtree=R_GlobalEnv; /* hack to have a non-NULL value */
  if (0 != igraph_vector_init(&c_leftout, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_leftout);
  c_mode = (igraph_neimode_t) Rf_asInteger(mode);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_dominator_tree(&c_graph, c_root, &c_dom, (Rf_isNull(domtree) ? 0 : &c_domtree), &c_leftout, c_mode));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(3));
  PROTECT(r_names=NEW_CHARACTER(3));
  PROTECT(dom=R_igraph_vector_to_SEXPp1(&c_dom));
  igraph_vector_destroy(&c_dom);
  IGRAPH_FINALLY_CLEAN(1);
  IGRAPH_FINALLY(igraph_destroy, &c_domtree);
  PROTECT(domtree=R_igraph_to_SEXP(&c_domtree));
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(leftout=R_igraph_vector_to_SEXPp1(&c_leftout));
  igraph_vector_destroy(&c_leftout);
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
  igraph_vector_ptr_t c_cuts;
  igraph_vector_ptr_t c_partition1s;
  igraph_integer_t c_source;
  igraph_integer_t c_target;
  SEXP cuts;
  SEXP partition1s;

  SEXP r_result, r_names;
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
  c_source = (igraph_integer_t) REAL(source)[0];
  c_target = (igraph_integer_t) REAL(target)[0];
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_all_st_cuts(&c_graph, &c_cuts, &c_partition1s, c_source, c_target));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(2));
  PROTECT(r_names=NEW_CHARACTER(2));
  PROTECT(cuts=R_igraph_vectorlist_to_SEXP_p1(&c_cuts));
  R_igraph_vectorlist_destroy(&c_cuts);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(partition1s=R_igraph_vectorlist_to_SEXP_p1(&c_partition1s));
  R_igraph_vectorlist_destroy(&c_partition1s);
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
  igraph_vector_ptr_t c_cuts;
  igraph_vector_ptr_t c_partition1s;
  igraph_integer_t c_source;
  igraph_integer_t c_target;
  igraph_vector_t c_capacity;
  SEXP value;
  SEXP cuts;
  SEXP partition1s;

  SEXP r_result, r_names;
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
  PROTECT(cuts=R_igraph_vectorlist_to_SEXP_p1(&c_cuts));
  R_igraph_vectorlist_destroy(&c_cuts);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(partition1s=R_igraph_vectorlist_to_SEXP_p1(&c_partition1s));
  R_igraph_vectorlist_destroy(&c_partition1s);
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
  R_SEXP_to_igraph_vs(candidate, &c_graph, &c_candidate);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_is_separator(&c_graph, c_candidate, &c_res));

                                        /* Convert output */
  igraph_vs_destroy(&c_candidate);
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
  R_SEXP_to_igraph_vs(candidate, &c_graph, &c_candidate);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_is_minimal_separator(&c_graph, c_candidate, &c_res));

                                        /* Convert output */
  igraph_vs_destroy(&c_candidate);
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
  igraph_vector_ptr_t c_separators;
  SEXP separators;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_ptr_init(&c_separators, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(R_igraph_vectorlist_destroy, &c_separators);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_all_minimal_st_separators(&c_graph, &c_separators));

                                        /* Convert output */
  PROTECT(separators=R_igraph_vectorlist_to_SEXP_p1(&c_separators));
  R_igraph_vectorlist_destroy(&c_separators);
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
  igraph_vector_ptr_t c_separators;
  SEXP separators;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_ptr_init(&c_separators, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(R_igraph_vectorlist_destroy, &c_separators);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_minimum_size_separators(&c_graph, &c_separators));

                                        /* Convert output */
  PROTECT(separators=R_igraph_vectorlist_to_SEXP_p1(&c_separators));
  R_igraph_vectorlist_destroy(&c_separators);
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
  igraph_vector_t c_vids;
  igraph_integer_t c_isoclass;
  SEXP isoclass;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  R_SEXP_to_vector(vids, &c_vids);
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
  igraph_vector_t c_map12;
  igraph_vector_t c_map21;



  SEXP iso;
  SEXP map12;
  SEXP map21;

  SEXP r_result, r_names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph1, &c_graph1);
  R_SEXP_to_igraph(graph2, &c_graph2);
  if (!Rf_isNull(vertex_color1)) {
    R_SEXP_to_vector_int_copy(vertex_color1, &c_vertex_color1);
  } else {
    IGRAPH_R_CHECK(igraph_vector_int_init(&c_vertex_color1, 0));
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_vertex_color1);
  if (!Rf_isNull(vertex_color2)) {
    R_SEXP_to_vector_int_copy(vertex_color2, &c_vertex_color2);
  } else {
    IGRAPH_R_CHECK(igraph_vector_int_init(&c_vertex_color2, 0));
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_vertex_color2);
  if (!Rf_isNull(edge_color1)) {
    R_SEXP_to_vector_int_copy(edge_color1, &c_edge_color1);
  } else {
    IGRAPH_R_CHECK(igraph_vector_int_init(&c_edge_color1, 0));
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_edge_color1);
  if (!Rf_isNull(edge_color2)) {
    R_SEXP_to_vector_int_copy(edge_color2, &c_edge_color2);
  } else {
    IGRAPH_R_CHECK(igraph_vector_int_init(&c_edge_color2, 0));
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_edge_color2);
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
  IGRAPH_R_CHECK(igraph_isomorphic_vf2(&c_graph1, &c_graph2, (Rf_isNull(vertex_color1) ? 0 : &c_vertex_color1), (Rf_isNull(vertex_color2) ? 0 : &c_vertex_color2), (Rf_isNull(edge_color1) ? 0 : &c_edge_color1), (Rf_isNull(edge_color2) ? 0 : &c_edge_color2), &c_iso, (Rf_isNull(map12) ? 0 : &c_map12), (Rf_isNull(map21) ? 0 : &c_map21), 0, 0, 0));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(3));
  PROTECT(r_names=NEW_CHARACTER(3));
  igraph_vector_int_destroy(&c_vertex_color1);
  IGRAPH_FINALLY_CLEAN(1);
  igraph_vector_int_destroy(&c_vertex_color2);
  IGRAPH_FINALLY_CLEAN(1);
  igraph_vector_int_destroy(&c_edge_color1);
  IGRAPH_FINALLY_CLEAN(1);
  igraph_vector_int_destroy(&c_edge_color2);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(iso=NEW_LOGICAL(1));
  LOGICAL(iso)[0]=c_iso;
  PROTECT(map12=R_igraph_0orvector_to_SEXPp1(&c_map12));
  igraph_vector_destroy(&c_map12);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(map21=R_igraph_0orvector_to_SEXPp1(&c_map21));
  igraph_vector_destroy(&c_map21);
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
  if (!Rf_isNull(vertex_color1)) {
    R_SEXP_to_vector_int_copy(vertex_color1, &c_vertex_color1);
  } else {
    IGRAPH_R_CHECK(igraph_vector_int_init(&c_vertex_color1, 0));
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_vertex_color1);
  if (!Rf_isNull(vertex_color2)) {
    R_SEXP_to_vector_int_copy(vertex_color2, &c_vertex_color2);
  } else {
    IGRAPH_R_CHECK(igraph_vector_int_init(&c_vertex_color2, 0));
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_vertex_color2);
  if (!Rf_isNull(edge_color1)) {
    R_SEXP_to_vector_int_copy(edge_color1, &c_edge_color1);
  } else {
    IGRAPH_R_CHECK(igraph_vector_int_init(&c_edge_color1, 0));
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_edge_color1);
  if (!Rf_isNull(edge_color2)) {
    R_SEXP_to_vector_int_copy(edge_color2, &c_edge_color2);
  } else {
    IGRAPH_R_CHECK(igraph_vector_int_init(&c_edge_color2, 0));
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_edge_color2);
  c_count=0;
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_count_isomorphisms_vf2(&c_graph1, &c_graph2, (Rf_isNull(vertex_color1) ? 0 : &c_vertex_color1), (Rf_isNull(vertex_color2) ? 0 : &c_vertex_color2), (Rf_isNull(edge_color1) ? 0 : &c_edge_color1), (Rf_isNull(edge_color2) ? 0 : &c_edge_color2), &c_count, 0, 0, 0));

                                        /* Convert output */
  igraph_vector_int_destroy(&c_vertex_color1);
  IGRAPH_FINALLY_CLEAN(1);
  igraph_vector_int_destroy(&c_vertex_color2);
  IGRAPH_FINALLY_CLEAN(1);
  igraph_vector_int_destroy(&c_edge_color1);
  IGRAPH_FINALLY_CLEAN(1);
  igraph_vector_int_destroy(&c_edge_color2);
  IGRAPH_FINALLY_CLEAN(1);
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
  igraph_vector_ptr_t c_maps;



  SEXP maps;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph1, &c_graph1);
  R_SEXP_to_igraph(graph2, &c_graph2);
  if (!Rf_isNull(vertex_color1)) {
    R_SEXP_to_vector_int_copy(vertex_color1, &c_vertex_color1);
  } else {
    IGRAPH_R_CHECK(igraph_vector_int_init(&c_vertex_color1, 0));
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_vertex_color1);
  if (!Rf_isNull(vertex_color2)) {
    R_SEXP_to_vector_int_copy(vertex_color2, &c_vertex_color2);
  } else {
    IGRAPH_R_CHECK(igraph_vector_int_init(&c_vertex_color2, 0));
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_vertex_color2);
  if (!Rf_isNull(edge_color1)) {
    R_SEXP_to_vector_int_copy(edge_color1, &c_edge_color1);
  } else {
    IGRAPH_R_CHECK(igraph_vector_int_init(&c_edge_color1, 0));
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_edge_color1);
  if (!Rf_isNull(edge_color2)) {
    R_SEXP_to_vector_int_copy(edge_color2, &c_edge_color2);
  } else {
    IGRAPH_R_CHECK(igraph_vector_int_init(&c_edge_color2, 0));
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_edge_color2);
  if (0 != igraph_vector_ptr_init(&c_maps, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(R_igraph_vectorlist_destroy, &c_maps);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_get_isomorphisms_vf2(&c_graph1, &c_graph2, (Rf_isNull(vertex_color1) ? 0 : &c_vertex_color1), (Rf_isNull(vertex_color2) ? 0 : &c_vertex_color2), (Rf_isNull(edge_color1) ? 0 : &c_edge_color1), (Rf_isNull(edge_color2) ? 0 : &c_edge_color2), &c_maps, 0, 0, 0));

                                        /* Convert output */
  igraph_vector_int_destroy(&c_vertex_color1);
  IGRAPH_FINALLY_CLEAN(1);
  igraph_vector_int_destroy(&c_vertex_color2);
  IGRAPH_FINALLY_CLEAN(1);
  igraph_vector_int_destroy(&c_edge_color1);
  IGRAPH_FINALLY_CLEAN(1);
  igraph_vector_int_destroy(&c_edge_color2);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(maps=R_igraph_vectorlist_to_SEXP(&c_maps));
  R_igraph_vectorlist_destroy(&c_maps);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = maps;

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
  igraph_vector_t c_map12;
  igraph_vector_t c_map21;



  SEXP iso;
  SEXP map12;
  SEXP map21;

  SEXP r_result, r_names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph1, &c_graph1);
  R_SEXP_to_igraph(graph2, &c_graph2);
  if (!Rf_isNull(vertex_color1)) {
    R_SEXP_to_vector_int_copy(vertex_color1, &c_vertex_color1);
  } else {
    IGRAPH_R_CHECK(igraph_vector_int_init(&c_vertex_color1, 0));
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_vertex_color1);
  if (!Rf_isNull(vertex_color2)) {
    R_SEXP_to_vector_int_copy(vertex_color2, &c_vertex_color2);
  } else {
    IGRAPH_R_CHECK(igraph_vector_int_init(&c_vertex_color2, 0));
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_vertex_color2);
  if (!Rf_isNull(edge_color1)) {
    R_SEXP_to_vector_int_copy(edge_color1, &c_edge_color1);
  } else {
    IGRAPH_R_CHECK(igraph_vector_int_init(&c_edge_color1, 0));
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_edge_color1);
  if (!Rf_isNull(edge_color2)) {
    R_SEXP_to_vector_int_copy(edge_color2, &c_edge_color2);
  } else {
    IGRAPH_R_CHECK(igraph_vector_int_init(&c_edge_color2, 0));
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_edge_color2);
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
  IGRAPH_R_CHECK(igraph_subisomorphic_vf2(&c_graph1, &c_graph2, (Rf_isNull(vertex_color1) ? 0 : &c_vertex_color1), (Rf_isNull(vertex_color2) ? 0 : &c_vertex_color2), (Rf_isNull(edge_color1) ? 0 : &c_edge_color1), (Rf_isNull(edge_color2) ? 0 : &c_edge_color2), &c_iso, (Rf_isNull(map12) ? 0 : &c_map12), (Rf_isNull(map21) ? 0 : &c_map21), 0, 0, 0));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(3));
  PROTECT(r_names=NEW_CHARACTER(3));
  igraph_vector_int_destroy(&c_vertex_color1);
  IGRAPH_FINALLY_CLEAN(1);
  igraph_vector_int_destroy(&c_vertex_color2);
  IGRAPH_FINALLY_CLEAN(1);
  igraph_vector_int_destroy(&c_edge_color1);
  IGRAPH_FINALLY_CLEAN(1);
  igraph_vector_int_destroy(&c_edge_color2);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(iso=NEW_LOGICAL(1));
  LOGICAL(iso)[0]=c_iso;
  PROTECT(map12=R_igraph_0orvector_to_SEXPp1(&c_map12));
  igraph_vector_destroy(&c_map12);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(map21=R_igraph_0orvector_to_SEXPp1(&c_map21));
  igraph_vector_destroy(&c_map21);
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
  if (!Rf_isNull(vertex_color1)) {
    R_SEXP_to_vector_int_copy(vertex_color1, &c_vertex_color1);
  } else {
    IGRAPH_R_CHECK(igraph_vector_int_init(&c_vertex_color1, 0));
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_vertex_color1);
  if (!Rf_isNull(vertex_color2)) {
    R_SEXP_to_vector_int_copy(vertex_color2, &c_vertex_color2);
  } else {
    IGRAPH_R_CHECK(igraph_vector_int_init(&c_vertex_color2, 0));
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_vertex_color2);
  if (!Rf_isNull(edge_color1)) {
    R_SEXP_to_vector_int_copy(edge_color1, &c_edge_color1);
  } else {
    IGRAPH_R_CHECK(igraph_vector_int_init(&c_edge_color1, 0));
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_edge_color1);
  if (!Rf_isNull(edge_color2)) {
    R_SEXP_to_vector_int_copy(edge_color2, &c_edge_color2);
  } else {
    IGRAPH_R_CHECK(igraph_vector_int_init(&c_edge_color2, 0));
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_edge_color2);
  c_count=0;
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_count_subisomorphisms_vf2(&c_graph1, &c_graph2, (Rf_isNull(vertex_color1) ? 0 : &c_vertex_color1), (Rf_isNull(vertex_color2) ? 0 : &c_vertex_color2), (Rf_isNull(edge_color1) ? 0 : &c_edge_color1), (Rf_isNull(edge_color2) ? 0 : &c_edge_color2), &c_count, 0, 0, 0));

                                        /* Convert output */
  igraph_vector_int_destroy(&c_vertex_color1);
  IGRAPH_FINALLY_CLEAN(1);
  igraph_vector_int_destroy(&c_vertex_color2);
  IGRAPH_FINALLY_CLEAN(1);
  igraph_vector_int_destroy(&c_edge_color1);
  IGRAPH_FINALLY_CLEAN(1);
  igraph_vector_int_destroy(&c_edge_color2);
  IGRAPH_FINALLY_CLEAN(1);
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
  igraph_vector_ptr_t c_maps;



  SEXP maps;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph1, &c_graph1);
  R_SEXP_to_igraph(graph2, &c_graph2);
  if (!Rf_isNull(vertex_color1)) {
    R_SEXP_to_vector_int_copy(vertex_color1, &c_vertex_color1);
  } else {
    IGRAPH_R_CHECK(igraph_vector_int_init(&c_vertex_color1, 0));
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_vertex_color1);
  if (!Rf_isNull(vertex_color2)) {
    R_SEXP_to_vector_int_copy(vertex_color2, &c_vertex_color2);
  } else {
    IGRAPH_R_CHECK(igraph_vector_int_init(&c_vertex_color2, 0));
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_vertex_color2);
  if (!Rf_isNull(edge_color1)) {
    R_SEXP_to_vector_int_copy(edge_color1, &c_edge_color1);
  } else {
    IGRAPH_R_CHECK(igraph_vector_int_init(&c_edge_color1, 0));
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_edge_color1);
  if (!Rf_isNull(edge_color2)) {
    R_SEXP_to_vector_int_copy(edge_color2, &c_edge_color2);
  } else {
    IGRAPH_R_CHECK(igraph_vector_int_init(&c_edge_color2, 0));
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_edge_color2);
  if (0 != igraph_vector_ptr_init(&c_maps, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(R_igraph_vectorlist_destroy, &c_maps);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_get_subisomorphisms_vf2(&c_graph1, &c_graph2, (Rf_isNull(vertex_color1) ? 0 : &c_vertex_color1), (Rf_isNull(vertex_color2) ? 0 : &c_vertex_color2), (Rf_isNull(edge_color1) ? 0 : &c_edge_color1), (Rf_isNull(edge_color2) ? 0 : &c_edge_color2), &c_maps, 0, 0, 0));

                                        /* Convert output */
  igraph_vector_int_destroy(&c_vertex_color1);
  IGRAPH_FINALLY_CLEAN(1);
  igraph_vector_int_destroy(&c_vertex_color2);
  IGRAPH_FINALLY_CLEAN(1);
  igraph_vector_int_destroy(&c_edge_color1);
  IGRAPH_FINALLY_CLEAN(1);
  igraph_vector_int_destroy(&c_edge_color2);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(maps=R_igraph_vectorlist_to_SEXP(&c_maps));
  R_igraph_vectorlist_destroy(&c_maps);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = maps;

  UNPROTECT(1);
  return(r_result);
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

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph1, &c_graph1);
  R_SEXP_to_igraph(graph2, &c_graph2);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_isomorphic_34(&c_graph1, &c_graph2, &c_iso));

                                        /* Convert output */
  PROTECT(iso=NEW_LOGICAL(1));
  LOGICAL(iso)[0]=c_iso;
  r_result = iso;

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
  igraph_vector_t c_labeling;
  igraph_bliss_sh_t c_sh;
  igraph_bliss_info_t c_info;
  SEXP labeling;
  SEXP info;

  SEXP r_result, r_names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (!Rf_isNull(colors)) {
    R_SEXP_to_vector_int_copy(colors, &c_colors);
  } else {
    IGRAPH_R_CHECK(igraph_vector_int_init(&c_colors, 0));
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_colors);
  if (0 != igraph_vector_init(&c_labeling, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_labeling);
  c_sh = (igraph_bliss_sh_t) Rf_asInteger(sh);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_canonical_permutation(&c_graph, (Rf_isNull(colors) ? 0 : &c_colors), &c_labeling, c_sh, &c_info));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(2));
  PROTECT(r_names=NEW_CHARACTER(2));
  igraph_vector_int_destroy(&c_colors);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(labeling=R_igraph_vector_to_SEXPp1(&c_labeling));
  igraph_vector_destroy(&c_labeling);
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
  igraph_vector_t c_permutation;
  SEXP res;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  R_SEXP_to_vector(permutation, &c_permutation);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_permute_vertices(&c_graph, &c_res, &c_permutation));

                                        /* Convert output */
  IGRAPH_FINALLY(igraph_destroy, &c_res);
  PROTECT(res=R_igraph_to_SEXP(&c_res));
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

  SEXP r_result, r_names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph1, &c_graph1);
  R_SEXP_to_igraph(graph2, &c_graph2);
  if (!Rf_isNull(colors1)) {
    R_SEXP_to_vector_int_copy(colors1, &c_colors1);
  } else {
    IGRAPH_R_CHECK(igraph_vector_int_init(&c_colors1, 0));
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_colors1);
  if (!Rf_isNull(colors2)) {
    R_SEXP_to_vector_int_copy(colors2, &c_colors2);
  } else {
    IGRAPH_R_CHECK(igraph_vector_int_init(&c_colors2, 0));
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_colors2);
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
  c_sh = (igraph_bliss_sh_t) Rf_asInteger(sh);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_isomorphic_bliss(&c_graph1, &c_graph2, (Rf_isNull(colors1) ? 0 : &c_colors1), (Rf_isNull(colors2) ? 0 : &c_colors2), &c_iso, (Rf_isNull(map12) ? 0 : &c_map12), (Rf_isNull(map21) ? 0 : &c_map21), c_sh, &c_info1, &c_info2));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(5));
  PROTECT(r_names=NEW_CHARACTER(5));
  igraph_vector_int_destroy(&c_colors1);
  IGRAPH_FINALLY_CLEAN(1);
  igraph_vector_int_destroy(&c_colors2);
  IGRAPH_FINALLY_CLEAN(1);
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
  if (!Rf_isNull(colors)) {
    R_SEXP_to_vector_int_copy(colors, &c_colors);
  } else {
    IGRAPH_R_CHECK(igraph_vector_int_init(&c_colors, 0));
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_colors);
  c_sh = (igraph_bliss_sh_t) Rf_asInteger(sh);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_automorphisms(&c_graph, (Rf_isNull(colors) ? 0 : &c_colors), c_sh, &c_info));

                                        /* Convert output */
  igraph_vector_int_destroy(&c_colors);
  IGRAPH_FINALLY_CLEAN(1);
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
  igraph_vector_ptr_t c_generators;
  igraph_bliss_sh_t c_sh;
  igraph_bliss_info_t c_info;
  SEXP generators;
  SEXP info;

  SEXP r_result, r_names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (!Rf_isNull(colors)) {
    R_SEXP_to_vector_int_copy(colors, &c_colors);
  } else {
    IGRAPH_R_CHECK(igraph_vector_int_init(&c_colors, 0));
  }
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_colors);
  if (0 != igraph_vector_ptr_init(&c_generators, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(R_igraph_vectorlist_destroy, &c_generators);
  c_sh = (igraph_bliss_sh_t) Rf_asInteger(sh);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_automorphism_group(&c_graph, (Rf_isNull(colors) ? 0 : &c_colors), &c_generators, c_sh, &c_info));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(2));
  PROTECT(r_names=NEW_CHARACTER(2));
  igraph_vector_int_destroy(&c_colors);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(generators=R_igraph_vectorlist_to_SEXP_p1(&c_generators));
  R_igraph_vectorlist_destroy(&c_generators);
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

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_matrix(V, &c_V);
  if (0 != igraph_vector_init(&c_groups, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_groups);
  c_nt=INTEGER(nt)[0];
  if (!Rf_isNull(nt_vec)) { R_SEXP_to_vector(nt_vec, &c_nt_vec); }
  c_mtype = (igraph_scg_matrix_t) Rf_asInteger(mtype);
  c_algo = (igraph_scg_algorithm_t) Rf_asInteger(algo);
  if (!Rf_isNull(p)) { R_SEXP_to_vector(p, &c_p); }
  c_maxiter=INTEGER(maxiter)[0];
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_scg_grouping(&c_V, &c_groups, c_nt, (Rf_isNull(nt_vec) ? 0 : &c_nt_vec), c_mtype, c_algo, (Rf_isNull(p) ? 0 : &c_p), c_maxiter));

                                        /* Convert output */
  PROTECT(groups=R_igraph_vector_to_SEXPp1(&c_groups));
  igraph_vector_destroy(&c_groups);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = groups;

  UNPROTECT(1);
  return(r_result);
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

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_matrix(V, &c_V);
  R_SEXP_to_vector(groups, &c_groups);
  if (0 != igraph_vector_init(&c_eps, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_eps);
  c_mtype = (igraph_scg_matrix_t) Rf_asInteger(mtype);
  if (!Rf_isNull(p)) { R_SEXP_to_vector(p, &c_p); }
  c_norm = (igraph_scg_norm_t) Rf_asInteger(norm);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_scg_norm_eps(&c_V, &c_groups, &c_eps, c_mtype, (Rf_isNull(p) ? 0 : &c_p), c_norm));

                                        /* Convert output */
  PROTECT(eps=R_igraph_vector_to_SEXP(&c_eps));
  igraph_vector_destroy(&c_eps);
  IGRAPH_FINALLY_CLEAN(1);
  r_result = eps;

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
  igraph_vector_long_t c_matching;
  igraph_bool_t c_res;
  SEXP res;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (!Rf_isNull(types)) { R_SEXP_to_vector_bool(types, &c_types); }
  R_SEXP_to_vector_long_copy(matching, &c_matching);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_is_matching(&c_graph, (Rf_isNull(types) ? 0 : &c_types), &c_matching, &c_res));

                                        /* Convert output */
  igraph_vector_long_destroy(&c_matching);
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
  igraph_vector_long_t c_matching;
  igraph_bool_t c_res;
  SEXP res;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (!Rf_isNull(types)) { R_SEXP_to_vector_bool(types, &c_types); }
  R_SEXP_to_vector_long_copy(matching, &c_matching);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_is_maximal_matching(&c_graph, (Rf_isNull(types) ? 0 : &c_types), &c_matching, &c_res));

                                        /* Convert output */
  igraph_vector_long_destroy(&c_matching);
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
  igraph_vector_long_t c_matching;
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
  if (0 != igraph_vector_long_init(&c_matching, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_long_destroy, &c_matching);
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
  PROTECT(matching=R_igraph_vector_long_to_SEXPp1(&c_matching));
  igraph_vector_long_destroy(&c_matching);
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
  igraph_t c_graph;
  igraph_eigen_algorithm_t c_algorithm;
  igraph_eigen_which_t c_which;
  igraph_arpack_options_t c_options;

  igraph_vector_t c_values;
  igraph_matrix_t c_vectors;
  igraph_vector_complex_t c_cmplxvalues;
  igraph_matrix_complex_t c_cmplxvectors;
  SEXP values;
  SEXP vectors;
  SEXP cmplxvalues;
  SEXP cmplxvectors;

  SEXP r_result, r_names;
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
  if (0 != igraph_vector_complex_init(&c_cmplxvalues, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_complex_destroy, &c_cmplxvalues);
  cmplxvalues=R_GlobalEnv; /* hack to have a non-NULL value */
  if (0 != igraph_matrix_complex_init(&c_cmplxvectors, 0, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_matrix_complex_destroy, &c_cmplxvectors);
  cmplxvectors=R_GlobalEnv; /* hack to have a non-NULL value */
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_eigen_adjacency(&c_graph, c_algorithm, &c_which, &c_options, 0, &c_values, &c_vectors, (Rf_isNull(cmplxvalues) ? 0 : &c_cmplxvalues), (Rf_isNull(cmplxvectors) ? 0 : &c_cmplxvectors)));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(5));
  PROTECT(r_names=NEW_CHARACTER(5));
  PROTECT(options=R_igraph_arpack_options_to_SEXP(&c_options));
  PROTECT(values=R_igraph_vector_to_SEXP(&c_values));
  igraph_vector_destroy(&c_values);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(vectors=R_igraph_matrix_to_SEXP(&c_vectors));
  igraph_matrix_destroy(&c_vectors);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(cmplxvalues=R_igraph_0orvector_complex_to_SEXP(&c_cmplxvalues));
  igraph_vector_complex_destroy(&c_cmplxvalues);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(cmplxvectors=R_igraph_0ormatrix_complex_to_SEXP(&c_cmplxvectors));
  igraph_matrix_complex_destroy(&c_cmplxvectors);
  IGRAPH_FINALLY_CLEAN(1);
  SET_VECTOR_ELT(r_result, 0, options);
  SET_VECTOR_ELT(r_result, 1, values);
  SET_VECTOR_ELT(r_result, 2, vectors);
  SET_VECTOR_ELT(r_result, 3, cmplxvalues);
  SET_VECTOR_ELT(r_result, 4, cmplxvectors);
  SET_STRING_ELT(r_names, 0, Rf_mkChar("options"));
  SET_STRING_ELT(r_names, 1, Rf_mkChar("values"));
  SET_STRING_ELT(r_names, 2, Rf_mkChar("vectors"));
  SET_STRING_ELT(r_names, 3, Rf_mkChar("cmplxvalues"));
  SET_STRING_ELT(r_names, 4, Rf_mkChar("cmplxvectors"));
  SET_NAMES(r_result, r_names);
  UNPROTECT(6);

  UNPROTECT(1);
  return(r_result);
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
  igraph_vector_t c_resverts;
  igraph_matrix_t c_rescoords;
  SEXP resverts;
  SEXP rescoords;

  SEXP r_result, r_names;
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
  IGRAPH_R_CHECK(igraph_convex_hull(&c_data, &c_resverts, &c_rescoords));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(2));
  PROTECT(r_names=NEW_CHARACTER(2));
  PROTECT(resverts=R_igraph_vector_to_SEXPp1(&c_resverts));
  igraph_vector_destroy(&c_resverts);
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
  igraph_vector_t c_edge_res;
  igraph_vector_t c_vertex_res;
  SEXP edge_res;
  SEXP vertex_res;

  SEXP r_result, r_names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_init(&c_edge_res, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_edge_res);
  if (0 != igraph_vector_init(&c_vertex_res, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_vertex_res);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_eulerian_path(&c_graph, &c_edge_res, &c_vertex_res));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(2));
  PROTECT(r_names=NEW_CHARACTER(2));
  PROTECT(edge_res=R_igraph_vector_to_SEXPp1(&c_edge_res));
  igraph_vector_destroy(&c_edge_res);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(vertex_res=R_igraph_vector_to_SEXPp1(&c_vertex_res));
  igraph_vector_destroy(&c_vertex_res);
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
  igraph_vector_t c_edge_res;
  igraph_vector_t c_vertex_res;
  SEXP edge_res;
  SEXP vertex_res;

  SEXP r_result, r_names;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_init(&c_edge_res, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_edge_res);
  if (0 != igraph_vector_init(&c_vertex_res, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_vertex_res);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_eulerian_cycle(&c_graph, &c_edge_res, &c_vertex_res));

                                        /* Convert output */
  PROTECT(r_result=NEW_LIST(2));
  PROTECT(r_names=NEW_CHARACTER(2));
  PROTECT(edge_res=R_igraph_vector_to_SEXPp1(&c_edge_res));
  igraph_vector_destroy(&c_edge_res);
  IGRAPH_FINALLY_CLEAN(1);
  PROTECT(vertex_res=R_igraph_vector_to_SEXPp1(&c_vertex_res));
  igraph_vector_destroy(&c_vertex_res);
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
/ igraph_from_prufer                         /
/-------------------------------------------*/
SEXP R_igraph_from_prufer(SEXP prufer) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_int_t c_prufer;
  SEXP graph;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_vector_int_copy(prufer, &c_prufer);
  IGRAPH_FINALLY(igraph_vector_int_destroy, &c_prufer);
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_from_prufer(&c_graph, &c_prufer));

                                        /* Convert output */
  IGRAPH_FINALLY(igraph_destroy, &c_graph);
  PROTECT(graph=R_igraph_to_SEXP(&c_graph));
  IGRAPH_FINALLY_CLEAN(1);
  igraph_vector_int_destroy(&c_prufer);
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
/ igraph_random_spanning_tree                /
/-------------------------------------------*/
SEXP R_igraph_random_spanning_tree(SEXP graph, SEXP vid) {
                                        /* Declarations */
  igraph_t c_graph;
  igraph_vector_t c_res;
  igraph_integer_t c_vid;
  SEXP res;

  SEXP r_result;
                                        /* Convert input */
  R_SEXP_to_igraph(graph, &c_graph);
  if (0 != igraph_vector_init(&c_res, 0)) {
    igraph_error("", __FILE__, __LINE__, IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_vector_destroy, &c_res);
  c_vid = (igraph_integer_t) REAL(vid)[0];
                                        /* Call igraph */
  IGRAPH_R_CHECK(igraph_random_spanning_tree(&c_graph, &c_res, c_vid));

                                        /* Convert output */
  PROTECT(res=R_igraph_vector_to_SEXPp1(&c_res));
  igraph_vector_destroy(&c_res);
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
