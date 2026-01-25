/* -*- mode: C -*-  */
/*
   IGraph library.
   Copyright (C) 2024  The igraph development team

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

#include "rinterface.h"

#include <R.h>
#include <Rinternals.h>
#include <igraph.h>

/* Generic structure to hold callback data */
typedef struct {
  SEXP callback;
} R_igraph_callback_data_t;

/* Handler function for motifs callback - converts C types to R types */
igraph_error_t R_igraph_motifs_handler(const igraph_t *graph,
                                       igraph_vector_int_t *vids,
                                       igraph_integer_t isoclass,
                                       void *extra) {

  R_igraph_callback_data_t *data = (R_igraph_callback_data_t *)extra;
  SEXP callback = data->callback;
  SEXP vids_r, isoclass_r, R_fcall, result;
  igraph_bool_t cres;

  /* Create R vector for vertex IDs (add 1 for R's 1-based indexing) */
  PROTECT(vids_r = NEW_INTEGER(igraph_vector_int_size(vids)));
  for (igraph_integer_t i = 0; i < igraph_vector_int_size(vids); i++) {
    INTEGER(vids_r)[i] = VECTOR(*vids)[i] + 1;
  }

  /* Create R integer for isoclass (add 1 for R's 1-based indexing) */
  PROTECT(isoclass_r = NEW_INTEGER(1));
  INTEGER(isoclass_r)[0] = isoclass + 1;

  /* Call the R function: callback(vids, isoclass) */
  PROTECT(R_fcall = Rf_lang3(callback, vids_r, isoclass_r));
  PROTECT(result = Rf_eval(R_fcall, R_GlobalEnv));

  /* Check if result is an error condition (from tryCatch) */
  if (Rf_inherits(result, "error")) {
    UNPROTECT(4);
    igraph_error("Error in R callback function", __FILE__, __LINE__, IGRAPH_FAILURE);
    return IGRAPH_FAILURE;
  }

  cres = Rf_asLogical(result);

  UNPROTECT(4);
  /* R callback returns TRUE to continue, FALSE to stop */
  return cres ? IGRAPH_SUCCESS : IGRAPH_STOP;
}

/* Closure function that wraps igraph_motifs_randesu_callback
   and translates between SEXP callback and handler + extra */
igraph_error_t igraph_motifs_randesu_callback_closure(
    const igraph_t *graph,
    igraph_integer_t size,
    const igraph_vector_t *cut_prob,
    SEXP callback) {

  R_igraph_callback_data_t data = { .callback = callback };

  return igraph_motifs_randesu_callback(
      graph, size, cut_prob,
      R_igraph_motifs_handler, &data);
}

/* Handler function for clique callbacks - converts C types to R types */
igraph_error_t R_igraph_clique_handler(const igraph_vector_int_t *clique, void *extra) {
  R_igraph_callback_data_t *data = (R_igraph_callback_data_t *)extra;
  SEXP callback = data->callback;
  SEXP clique_r, R_fcall, result;
  igraph_bool_t cres;

  /* Create R vector for clique (add 1 for R's 1-based indexing) */
  PROTECT(clique_r = NEW_INTEGER(igraph_vector_int_size(clique)));
  for (igraph_integer_t i = 0; i < igraph_vector_int_size(clique); i++) {
    INTEGER(clique_r)[i] = igraph_vector_int_get(clique, i) + 1;
  }

  /* Call the R function: callback(clique) */
  PROTECT(R_fcall = Rf_lang2(callback, clique_r));
  PROTECT(result = Rf_eval(R_fcall, R_GlobalEnv));

  /* Check if result is an error condition (from tryCatch) */
  if (Rf_inherits(result, "error")) {
    UNPROTECT(3);
    igraph_error("Error in R callback function", __FILE__, __LINE__, IGRAPH_FAILURE);
    return IGRAPH_FAILURE;
  }

  cres = Rf_asLogical(result);

  UNPROTECT(3);
  /* R callback returns TRUE to continue, FALSE to stop */
  return cres ? IGRAPH_SUCCESS : IGRAPH_STOP;
}

/* Closure functions for clique callbacks */
igraph_error_t igraph_cliques_callback_closure(
    const igraph_t *graph,
    igraph_integer_t min_size,
    igraph_integer_t max_size,
    SEXP callback) {

  R_igraph_callback_data_t data = { .callback = callback };

  return igraph_cliques_callback(
      graph, min_size, max_size,
      R_igraph_clique_handler, &data);
}

igraph_error_t igraph_maximal_cliques_callback_closure(
    const igraph_t *graph,
    igraph_integer_t min_size,
    igraph_integer_t max_size,
    SEXP callback) {

  R_igraph_callback_data_t data = { .callback = callback };

  return igraph_maximal_cliques_callback(
      graph, R_igraph_clique_handler, &data,
      min_size, max_size);
}

/* Handler function for cycle callbacks - converts C types to R types */
igraph_error_t R_igraph_cycle_handler(
    const igraph_vector_int_t *vertices,
    const igraph_vector_int_t *edges,
    void *extra) {

  R_igraph_callback_data_t *data = (R_igraph_callback_data_t *)extra;
  SEXP callback = data->callback;
  SEXP vertices_r, edges_r, R_fcall, result;
  igraph_bool_t cres;

  /* Create R vector for vertices (add 1 for R's 1-based indexing) */
  PROTECT(vertices_r = NEW_INTEGER(igraph_vector_int_size(vertices)));
  for (igraph_integer_t i = 0; i < igraph_vector_int_size(vertices); i++) {
    INTEGER(vertices_r)[i] = igraph_vector_int_get(vertices, i) + 1;
  }

  /* Create R vector for edges (add 1 for R's 1-based indexing) */
  PROTECT(edges_r = NEW_INTEGER(igraph_vector_int_size(edges)));
  for (igraph_integer_t i = 0; i < igraph_vector_int_size(edges); i++) {
    INTEGER(edges_r)[i] = igraph_vector_int_get(edges, i) + 1;
  }

  /* Call the R function: callback(vertices, edges) */
  PROTECT(R_fcall = Rf_lang3(callback, vertices_r, edges_r));
  PROTECT(result = Rf_eval(R_fcall, R_GlobalEnv));

  /* Check if result is an error condition (from tryCatch) */
  if (Rf_inherits(result, "error")) {
    UNPROTECT(4);
    igraph_error("Error in R callback function", __FILE__, __LINE__, IGRAPH_FAILURE);
    return IGRAPH_FAILURE;
  }

  cres = Rf_asLogical(result);

  UNPROTECT(4);
  /* R callback returns TRUE to continue, FALSE to stop */
  return cres ? IGRAPH_SUCCESS : IGRAPH_STOP;
}

/* Closure function for simple_cycles_callback */
igraph_error_t igraph_simple_cycles_callback_closure(
    const igraph_t *graph,
    igraph_neimode_t mode,
    igraph_integer_t min_cycle_length,
    igraph_integer_t max_cycle_length,
    SEXP callback) {

  R_igraph_callback_data_t data = { .callback = callback };

  return igraph_simple_cycles_callback(
      graph, mode, min_cycle_length, max_cycle_length,
      R_igraph_cycle_handler, &data);
}

/* Handler function for isomorphism callbacks - converts C types to R types */
igraph_error_t R_igraph_isomorphism_handler(
    const igraph_vector_int_t *map12,
    const igraph_vector_int_t *map21,
    void *extra) {

  R_igraph_callback_data_t *data = (R_igraph_callback_data_t *)extra;
  SEXP callback = data->callback;
  SEXP map12_r, map21_r, R_fcall, result;
  igraph_bool_t cres;

  /* Create R vector for map12 (add 1 for R's 1-based indexing) */
  PROTECT(map12_r = NEW_INTEGER(igraph_vector_int_size(map12)));
  for (igraph_integer_t i = 0; i < igraph_vector_int_size(map12); i++) {
    INTEGER(map12_r)[i] = igraph_vector_int_get(map12, i) + 1;
  }

  /* Create R vector for map21 (add 1 for R's 1-based indexing) */
  PROTECT(map21_r = NEW_INTEGER(igraph_vector_int_size(map21)));
  for (igraph_integer_t i = 0; i < igraph_vector_int_size(map21); i++) {
    INTEGER(map21_r)[i] = igraph_vector_int_get(map21, i) + 1;
  }

  /* Call the R function: callback(map12, map21) */
  PROTECT(R_fcall = Rf_lang3(callback, map12_r, map21_r));
  PROTECT(result = Rf_eval(R_fcall, R_GlobalEnv));

  /* Check if result is an error condition (from tryCatch) */
  if (Rf_inherits(result, "error")) {
    UNPROTECT(4);
    igraph_error("Error in R callback function", __FILE__, __LINE__, IGRAPH_FAILURE);
    return IGRAPH_FAILURE;
  }

  cres = Rf_asLogical(result);

  UNPROTECT(4);
  /* R callback returns TRUE to continue, FALSE to stop */
  return cres ? IGRAPH_SUCCESS : IGRAPH_STOP;
}

/* Closure functions for isomorphism callbacks */
igraph_error_t igraph_get_isomorphisms_vf2_callback_closure(
    const igraph_t *graph1,
    const igraph_t *graph2,
    const igraph_vector_int_t *vertex_color1,
    const igraph_vector_int_t *vertex_color2,
    const igraph_vector_int_t *edge_color1,
    const igraph_vector_int_t *edge_color2,
    SEXP callback) {

  R_igraph_callback_data_t data = { .callback = callback };

  return igraph_get_isomorphisms_vf2_callback(
      graph1, graph2,
      vertex_color1, vertex_color2,
      edge_color1, edge_color2,
      NULL, NULL,
      R_igraph_isomorphism_handler,
      NULL, NULL, &data);
}

igraph_error_t igraph_get_subisomorphisms_vf2_callback_closure(
    const igraph_t *graph1,
    const igraph_t *graph2,
    const igraph_vector_int_t *vertex_color1,
    const igraph_vector_int_t *vertex_color2,
    const igraph_vector_int_t *edge_color1,
    const igraph_vector_int_t *edge_color2,
    SEXP callback) {

  R_igraph_callback_data_t data = { .callback = callback };

  return igraph_get_subisomorphisms_vf2_callback(
      graph1, graph2,
      vertex_color1, vertex_color2,
      edge_color1, edge_color2,
      NULL, NULL,
      R_igraph_isomorphism_handler,
      NULL, NULL, &data);
}

/* Leading eigenvector community detection callback support */

/* Structure to hold ARPACK function pointer */
typedef struct {
  igraph_arpack_function_t *fun;
} R_igraph_arpack_function_container_t;

/* Extended callback data structure for leading eigenvector */
typedef struct {
  SEXP callback;
  SEXP extra;
  SEXP env;
  SEXP env_arp;
} R_igraph_levc_callback_data_t;

/* Helper function to call ARPACK multiplier from R - exported for use from R */
SEXP R_igraph_levc_arpack_multiplier(SEXP extP, SEXP extE, SEXP pv) {
  R_igraph_arpack_function_container_t *cont = R_ExternalPtrAddr(extP);
  igraph_arpack_function_t *fun = cont->fun;
  void *extra = R_ExternalPtrAddr(extE);
  SEXP res;

  PROTECT(res = NEW_NUMERIC(Rf_xlength(pv)));
  fun(REAL(res), REAL(pv), Rf_xlength(pv), extra);

  UNPROTECT(1);
  return res;
}

/* Handler for leading eigenvector callbacks - converts C types to R types */
igraph_error_t R_igraph_levc_handler(
    const igraph_vector_int_t *membership,
    igraph_integer_t comm,
    igraph_real_t eigenvalue,
    const igraph_vector_t *eigenvector,
    igraph_arpack_function_t *arpack_multiplier,
    void *arpack_extra,
    void *extra) {

  R_igraph_levc_callback_data_t *data = (R_igraph_levc_callback_data_t *)extra;
  SEXP callback = data->callback;
  SEXP s_memb, s_comm, s_evalue, s_evector, s_multip;
  SEXP R_fcall, R_multip_call;
  SEXP res, l1, l2, l3;
  int result;
  R_igraph_arpack_function_container_t cont = { arpack_multiplier };

  /* Convert C types to R types */
  PROTECT(s_memb = Ry_igraph_vector_int_to_SEXP(membership));
  PROTECT(s_comm = NEW_NUMERIC(1));
  REAL(s_comm)[0] = comm;
  PROTECT(s_evalue = NEW_NUMERIC(1));
  REAL(s_evalue)[0] = eigenvalue;
  PROTECT(s_evector = Ry_igraph_vector_to_SEXP(eigenvector));
  
  /* Create the ARPACK multiplier function accessible from R */
  PROTECT(l1 = Rf_install("igraph.i.levc.arp"));
  PROTECT(l2 = R_MakeExternalPtr((void*)&cont, R_NilValue, R_NilValue));
  PROTECT(l3 = R_MakeExternalPtr(arpack_extra, R_NilValue, R_NilValue));
  PROTECT(R_multip_call = Rf_lang3(l1, l2, l3));
  PROTECT(s_multip = Rf_eval(R_multip_call, data->env_arp));

  /* Build the call: callback(membership, community, value, vector, multiplier, extra) */
  PROTECT(R_fcall = Rx_igraph_i_lang7(callback, s_memb, s_comm, s_evalue, s_evector, s_multip, data->extra));
  PROTECT(res = Rf_eval(R_fcall, data->env));

  /* Check if result is an error condition (from tryCatch) */
  if (Rf_inherits(res, "error")) {
    UNPROTECT(11);
    igraph_error("Error in R callback function", __FILE__, __LINE__, IGRAPH_FAILURE);
    return IGRAPH_FAILURE;
  }

  result = (int) REAL(AS_NUMERIC(res))[0];

  UNPROTECT(11);
  return result;
}

/* Closure function for leading eigenvector community detection */
igraph_error_t igraph_community_leading_eigenvector_callback_closure(
    const igraph_t *graph,
    const igraph_vector_t *weights,
    igraph_matrix_int_t *merges,
    igraph_vector_int_t *membership,
    igraph_integer_t steps,
    igraph_arpack_options_t *options,
    igraph_real_t *modularity,
    igraph_bool_t start,
    igraph_vector_t *eigenvalues,
    igraph_vector_list_t *eigenvectors,
    igraph_vector_t *history,
    SEXP callback,
    SEXP extra,
    SEXP env,
    SEXP env_arp) {

  /* If callback is NULL, pass NULL to the C function */
  if (Rf_isNull(callback)) {
    return igraph_community_leading_eigenvector(
        graph, weights, merges, membership, steps, options, modularity, start,
        eigenvalues, eigenvectors, history,
        NULL, NULL);
  }

  /* Otherwise, use the handler */
  R_igraph_levc_callback_data_t data = { 
    .callback = callback, 
    .extra = extra ? extra : R_NilValue,  /* Convert NULL to R_NilValue */
    .env = env,
    .env_arp = env_arp
  };

  return igraph_community_leading_eigenvector(
      graph, weights, merges, membership, steps, options, modularity, start,
      eigenvalues, eigenvectors, history,
      R_igraph_levc_handler, &data);
}
