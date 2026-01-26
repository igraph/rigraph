/* -*- mode: C -*-  */
/*
   IGraph library.
   Copyright (C) 2010  Gabor Csardi <csardi.gabor@gmail.com>
   Rue de l'Industrie 5, Lausanne 1005, Switzerland

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

#include <stdbool.h>

// Require R_ and Rf_ prefixes for R API
#define R_NO_REMAP

#include <R.h>
#include <Rinternals.h>
#include <Rdefines.h>

#include "config.h"
#include "igraph.h"
#include "cigraph/src/graph/attributes.h"
#include "cigraph/src/graph/internal.h"

#include "uuid/uuid.h"

#define IGRAPH_I_DESTROY IGRAPH_I_ATTRIBUTE_DESTROY

SEXP Rx_igraph_add_env(SEXP graph);

void Rx_igraph_attribute_clean_preserve_list(void);
void Rx_igraph_set_in_r_check(bool set);
void Rx_igraph_error(void);
void Rx_igraph_warning(void);
void Rx_igraph_interrupt(void);

SEXP Ry_igraph_vector_to_SEXP(const igraph_vector_t *v);
SEXP Ry_igraph_vector_to_SEXPp1(const igraph_vector_t *v);
SEXP Ry_igraph_vector_int_to_SEXP(const igraph_vector_int_t *v);
SEXP Ry_igraph_vector_int_to_SEXPp1(const igraph_vector_int_t *v);
SEXP Ry_igraph_vector_bool_to_SEXP(const igraph_vector_bool_t *v);
SEXP Rx_igraph_vector_complex_to_SEXP(const igraph_vector_complex_t* v);
SEXP Ry_igraph_0orvector_to_SEXP(const igraph_vector_t *v);
SEXP Ry_igraph_0orvector_to_SEXPp1(const igraph_vector_t *v);
SEXP Rx_igraph_0orvector_bool_to_SEXP(const igraph_vector_bool_t *v);
SEXP Ry_igraph_0orvector_complex_to_SEXP(const igraph_vector_complex_t *v);
SEXP Ry_igraph_matrix_to_SEXP(const igraph_matrix_t *m);
SEXP Ry_igraph_matrix_int_to_SEXP(const igraph_matrix_int_t *m);
SEXP Rx_igraph_matrix_complex_to_SEXP(const igraph_matrix_complex_t *m);
SEXP Rx_igraph_0ormatrix_to_SEXP(const igraph_matrix_t *m);
SEXP Rx_igraph_0ormatrix_int_to_SEXP(const igraph_matrix_int_t *m);
SEXP Ry_igraph_0ormatrix_complex_to_SEXP(const igraph_matrix_complex_t *m);
SEXP Rx_igraph_strvector_to_SEXP(const igraph_strvector_t *m);
SEXP Ry_igraph_to_SEXP(const igraph_t *graph);
SEXP Rx_igraph_vector_list_to_SEXP(const igraph_vector_list_t *list);
SEXP Ry_igraph_vector_int_list_to_SEXP(const igraph_vector_int_list_t *list);
SEXP Ry_igraph_vector_int_list_to_SEXPp1(const igraph_vector_int_list_t *list);
SEXP Rx_igraph_0orvector_int_list_to_SEXP(const igraph_vector_int_list_t *list);
SEXP Rx_igraph_matrixlist_to_SEXP(const igraph_matrix_list_t *ptr);
SEXP Ry_igraph_graphlist_to_SEXP(const igraph_graph_list_t *list);
SEXP Ry_igraph_graph_ptr_list_to_SEXP(const igraph_vector_ptr_t *ptr);
SEXP Ry_igraph_hrg_to_SEXP(const igraph_hrg_t *hrg);
SEXP Ry_igraph_plfit_result_to_SEXP(const igraph_plfit_result_t *plfit);
SEXP Ry_igraph_sparsemat_to_SEXP(const igraph_sparsemat_t *sp);
void Rz_SEXP_to_sparsemat(SEXP sm, igraph_sparsemat_t *sp);
SEXP Rx_igraph_0orsparsemat_to_SEXP(const igraph_sparsemat_t *sp);
SEXP Ry_igraph_maxflow_stats_to_SEXP(const igraph_maxflow_stats_t *st);
SEXP Ry_igraph_sirlist_to_SEXP(const igraph_vector_ptr_t *sl);
void Ry_igraph_sirlist_destroy(igraph_vector_ptr_t *sl);
SEXP Ry_igraph_arpack_options_to_SEXP(const igraph_arpack_options_t *opt);
SEXP Ry_igraph_bliss_info_to_SEXP(const igraph_bliss_info_t *info);

igraph_error_t Rx_igraph_SEXP_to_strvector(SEXP rval, igraph_strvector_t *sv);
igraph_error_t Rx_igraph_SEXP_to_strvector_copy(SEXP rval, igraph_strvector_t *sv);
void           Rz_SEXP_to_vector(SEXP sv, igraph_vector_t *v);
igraph_error_t Rz_SEXP_to_vector_copy(SEXP sv, igraph_vector_t *v);
void           Rz_SEXP_to_matrix(SEXP pakl, igraph_matrix_t *akl);
igraph_error_t Rz_SEXP_to_matrix_int(SEXP pakl, igraph_matrix_int_t *akl);
void           Rz_SEXP_to_matrix_complex(SEXP pakl, igraph_matrix_complex_t *akl);
igraph_error_t Rz_SEXP_to_igraph_matrix_copy(SEXP pakl, igraph_matrix_t *akl);
igraph_error_t Rz_SEXP_to_igraph(SEXP graph, igraph_t *res);
igraph_error_t Rz_SEXP_to_igraph_copy(SEXP graph, igraph_t *res);
igraph_error_t Rz_SEXP_to_igraph_vs(SEXP rit, igraph_t *graph, igraph_vs_t *it, igraph_vector_int_t *data);
igraph_error_t Rz_SEXP_to_igraph_es(SEXP rit, igraph_t *graph, igraph_es_t *it, igraph_vector_int_t *data);
igraph_error_t Rz_SEXP_to_igraph_adjlist(SEXP vectorlist, igraph_adjlist_t *ptr);
igraph_error_t Rz_SEXP_to_graph_ptr_list(SEXP graphlist, igraph_vector_ptr_t *ptr, igraph_t **storage);
void           Ry_igraph_SEXP_to_vector_list(SEXP vectorlist, igraph_vector_list_t *list);
igraph_error_t Ry_igraph_SEXP_to_vector_int_list(SEXP vectorlist, igraph_vector_int_list_t *list);
void           Ry_igraph_SEXP_to_matrixlist(SEXP matrixlist, igraph_matrix_list_t *list);
void           Rz_SEXP_to_vector_bool(SEXP sv, igraph_vector_bool_t *v);
igraph_error_t Rz_SEXP_to_vector_bool_copy(SEXP sv, igraph_vector_bool_t *v);
igraph_error_t Rz_SEXP_to_vector_int_copy(SEXP sv, igraph_vector_int_t *v);
igraph_error_t Rz_SEXP_to_hrg(SEXP shrg, igraph_hrg_t *hrg);
igraph_error_t Rz_SEXP_to_hrg_copy(SEXP shrg, igraph_hrg_t *hrg);
void           Rz_SEXP_to_igraph_layout_drl_options(SEXP in, igraph_layout_drl_options_t *opt);
igraph_error_t Rz_SEXP_to_igraph_eigen_which(SEXP in, igraph_eigen_which_t *out);
void           Rz_SEXP_to_igraph_arpack_options(SEXP in, igraph_arpack_options_t *opt);
igraph_error_t Rz_SEXP_to_attr_comb(SEXP input, igraph_attribute_combination_t *comb);

/* The following IGRAPH_R_... macros must only be called from top-level C code,
 * i.e. in C functions which are called from R directly. */

#define IGRAPH_R_CHECK(func) \
    do { \
        Rx_igraph_attribute_clean_preserve_list(); \
        Rx_igraph_set_in_r_check(true); \
        igraph_error_type_t __c = func; \
        Rx_igraph_set_in_r_check(false); \
        Rx_igraph_warning(); \
        if (__c == IGRAPH_INTERRUPTED) { Rx_igraph_interrupt(); } \
        else if (__c != IGRAPH_SUCCESS) { Rx_igraph_error(); } \
    } while (0)

// This is a variant of IGRAPH_FINALLY that satisfies UBSAN checks.
#define IGRAPH_FINALLY_PV(func, ptr) \
    do { \
        /* the following branch makes the compiler check the compatibility of \
         * func and ptr to detect cases when we are accidentally invoking an \
         * incorrect destructor function with the pointer */ \
        if (0) { func(ptr); } \
        IGRAPH_FINALLY_REAL((func##_pv), (ptr)); \
    } while (0)

// These functions are never meant to be called directly, only through IGRAPH_FINALLY_PV.
void igraph_destroy_pv(void *pv_ptr);
void igraph_matrix_destroy_pv(void *pv_ptr);
void igraph_vector_destroy_pv(void *pv_ptr);
void igraph_vector_int_destroy_pv(void *pv_ptr);
void igraph_vector_bool_destroy_pv(void *pv_ptr);
void igraph_vector_int_list_destroy_pv(void *pv_ptr);

#define IGRAPH_R_CHECK_INT(v) R_check_int_scalar(v)
#define IGRAPH_R_CHECK_REAL(v) R_check_real_scalar(v)
#define IGRAPH_R_CHECK_BOOL(v) R_check_bool_scalar(v)

void R_check_int_scalar(SEXP value);
void R_check_real_scalar(SEXP value);
void R_check_bool_scalar(SEXP value);
FILE* Ry_igraph_fopen_read(SEXP instream);
FILE* Ry_igraph_fopen_write(SEXP outstream);

igraph_error_t Rw_get_int_scalar(SEXP sexp, R_xlen_t index, igraph_integer_t *res);
igraph_error_t Rw_get_real_scalar(SEXP sexp, R_xlen_t index, igraph_real_t *res);
igraph_error_t Rw_get_bool_scalar(SEXP sexp, R_xlen_t index, igraph_bool_t *res);

/* Helper functions */
SEXP Rx_igraph_i_lang7(SEXP s, SEXP t, SEXP u, SEXP v, SEXP w, SEXP x, SEXP y);
SEXP Rx_igraph_getListElement(SEXP list, const char *str);

/* Declarations for functions from rinterface.c needed by wrappers in rinterface_extra.c */
SEXP R_igraph_adjacency(SEXP adjmatrix, SEXP mode, SEXP loops);
SEXP R_igraph_weighted_adjacency(SEXP adjmatrix, SEXP mode, SEXP loops);
SEXP R_igraph_create_bipartite(SEXP types, SEXP edges, SEXP directed);
SEXP R_igraph_finalizer(void);
SEXP R_igraph_vcount(SEXP graph);
SEXP R_igraph_layout_drl(SEXP graph, SEXP res, SEXP use_seed, SEXP options, SEXP weights);
SEXP R_igraph_layout_drl_3d(SEXP graph, SEXP res, SEXP use_seed, SEXP options, SEXP weights);

/* Declarations for callback functions */

/* Motifs */
igraph_error_t R_igraph_motifs_handler(const igraph_t *graph,
                                       igraph_vector_int_t *vids,
                                       igraph_integer_t isoclass,
                                       void *extra);

igraph_error_t igraph_motifs_randesu_callback_closure(
    const igraph_t *graph,
    igraph_integer_t size,
    const igraph_vector_t *cut_prob,
    SEXP callback);

/* Cliques */
igraph_error_t R_igraph_clique_handler(const igraph_vector_int_t *clique, void *extra);

igraph_error_t igraph_cliques_callback_closure(
    const igraph_t *graph,
    igraph_integer_t min_size,
    igraph_integer_t max_size,
    SEXP callback);

igraph_error_t igraph_maximal_cliques_callback_closure(
    const igraph_t *graph,
    igraph_integer_t min_size,
    igraph_integer_t max_size,
    SEXP callback);

/* Cycles */
igraph_error_t R_igraph_cycle_handler(
    const igraph_vector_int_t *vertices,
    const igraph_vector_int_t *edges,
    void *extra);

igraph_error_t igraph_simple_cycles_callback_closure(
    const igraph_t *graph,
    igraph_neimode_t mode,
    igraph_integer_t min_cycle_length,
    igraph_integer_t max_cycle_length,
    SEXP callback);

/* Isomorphisms */
igraph_error_t R_igraph_isomorphism_handler(
    const igraph_vector_int_t *map12,
    const igraph_vector_int_t *map21,
    void *extra);

igraph_error_t igraph_get_isomorphisms_vf2_callback_closure(
    const igraph_t *graph1,
    const igraph_t *graph2,
    const igraph_vector_int_t *vertex_color1,
    const igraph_vector_int_t *vertex_color2,
    const igraph_vector_int_t *edge_color1,
    const igraph_vector_int_t *edge_color2,
    SEXP callback);

igraph_error_t igraph_get_subisomorphisms_vf2_callback_closure(
    const igraph_t *graph1,
    const igraph_t *graph2,
    const igraph_vector_int_t *vertex_color1,
    const igraph_vector_int_t *vertex_color2,
    const igraph_vector_int_t *edge_color1,
    const igraph_vector_int_t *edge_color2,
    SEXP callback);

/* BFS */
igraph_error_t R_igraph_bfs_handler(
    const igraph_t *graph,
    igraph_integer_t vid,
    igraph_integer_t pred,
    igraph_integer_t succ,
    igraph_integer_t rank,
    igraph_integer_t dist,
    void *extra);

igraph_error_t igraph_bfs_closure(
    const igraph_t *graph,
    igraph_integer_t root,
    const igraph_vector_int_t *roots,
    igraph_neimode_t mode,
    igraph_bool_t unreachable,
    const igraph_vector_int_t *restricted,
    igraph_vector_int_t *order,
    igraph_vector_int_t *rank,
    igraph_vector_int_t *parents,
    igraph_vector_int_t *pred,
    igraph_vector_int_t *succ,
    igraph_vector_int_t *dist,
    SEXP callback);

/* DFS */
igraph_error_t R_igraph_dfs_handler_in(
    const igraph_t *graph,
    igraph_integer_t vid,
    igraph_integer_t dist,
    void *extra);

igraph_error_t R_igraph_dfs_handler_out(
    const igraph_t *graph,
    igraph_integer_t vid,
    igraph_integer_t dist,
    void *extra);

igraph_error_t igraph_dfs_closure(
    const igraph_t *graph,
    igraph_integer_t root,
    igraph_neimode_t mode,
    igraph_bool_t unreachable,
    igraph_vector_int_t *order,
    igraph_vector_int_t *order_out,
    igraph_vector_int_t *father,
    igraph_vector_int_t *dist,
    SEXP in_callback,
    SEXP out_callback);

/* Leading eigenvector community detection */
SEXP R_igraph_levc_arpack_multiplier(SEXP extP, SEXP extE, SEXP pv);

igraph_error_t R_igraph_levc_handler(
    const igraph_vector_int_t *membership,
    igraph_integer_t comm,
    igraph_real_t eigenvalue,
    const igraph_vector_t *eigenvector,
    igraph_arpack_function_t *arpack_multiplier,
    void *arpack_extra,
    void *extra);

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
    SEXP env_arp);
