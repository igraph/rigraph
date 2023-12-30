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

SEXP R_igraph_add_env(SEXP graph);

void R_igraph_attribute_clean_preserve_list(void);
void R_igraph_set_in_r_check(bool set);
void R_igraph_error(void);
void R_igraph_warning(void);
void R_igraph_interrupt(void);

SEXP R_igraph_vector_to_SEXP(const igraph_vector_t *v);
SEXP R_igraph_vector_int_to_SEXP(const igraph_vector_int_t *v);
SEXP R_igraph_vector_int_to_SEXPp1(const igraph_vector_int_t *v);
SEXP R_igraph_vector_bool_to_SEXP(const igraph_vector_bool_t *v);
SEXP R_igraph_vector_complex_to_SEXP(const igraph_vector_complex_t* v);
SEXP R_igraph_0orvector_to_SEXP(const igraph_vector_t *v);
SEXP R_igraph_0orvector_bool_to_SEXP(const igraph_vector_bool_t *v);
SEXP R_igraph_0orvector_complex_to_SEXP(const igraph_vector_complex_t *v);
SEXP R_igraph_matrix_to_SEXP(const igraph_matrix_t *m);
SEXP R_igraph_matrix_complex_to_SEXP(const igraph_matrix_complex_t *m);
SEXP R_igraph_0ormatrix_complex_to_SEXP(const igraph_matrix_complex_t *m);
SEXP R_igraph_strvector_to_SEXP(const igraph_strvector_t *m);
SEXP R_igraph_to_SEXP(const igraph_t *graph);
SEXP R_igraph_vector_int_list_to_SEXP(const igraph_vector_int_list_t *list);
SEXP R_igraph_0orvector_int_list_to_SEXP(const igraph_vector_int_list_t *list);
void R_igraph_vectorlist_destroy(igraph_vector_ptr_t *ptr);
SEXP R_igraph_matrixlist_to_SEXP(const igraph_vector_ptr_t *ptr);
void R_igraph_matrixlist_destroy(igraph_vector_ptr_t *ptr);
SEXP R_igraph_graphlist_to_SEXP(const igraph_graph_list_t *list);
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
int R_SEXP_to_igraph_vs(SEXP rit, igraph_t *graph, igraph_vs_t *it, igraph_vector_int_t *data);
int R_SEXP_to_igraph_es(SEXP rit, igraph_t *graph, igraph_es_t *it, igraph_vector_int_t *data);
int R_SEXP_to_igraph_adjlist(SEXP vectorlist, igraph_adjlist_t *ptr);
int R_igraph_SEXP_to_vector_int_list(SEXP vectorlist,
                                    igraph_vector_int_list_t *list);
int R_igraph_SEXP_to_matrixlist(SEXP matrixlist, igraph_matrix_list_t *list);
int R_SEXP_to_vector_bool(SEXP sv, igraph_vector_bool_t *v);
int R_SEXP_to_vector_bool_copy(SEXP sv, igraph_vector_bool_t *v);
int R_SEXP_to_vector_int_copy(SEXP sv, igraph_vector_int_t *v);
int R_SEXP_to_hrg(SEXP shrg, igraph_hrg_t *hrg);
int R_SEXP_to_hrg_copy(SEXP shrg, igraph_hrg_t *hrg);
int R_SEXP_to_sparsemat(SEXP pakl, igraph_sparsemat_t *akl);

int R_SEXP_to_igraph_layout_drl_options(SEXP in, igraph_layout_drl_options_t *opt);
int R_SEXP_to_attr_comb(SEXP input, igraph_attribute_combination_t *comb);
SEXP R_igraph_bliss_info_to_SEXP(const igraph_bliss_info_t *info);
int R_SEXP_to_igraph_eigen_which(SEXP in, igraph_eigen_which_t *out);
int R_SEXP_to_igraph_arpack_options(SEXP in, igraph_arpack_options_t *opt);
SEXP R_igraph_vector_int_list_to_SEXPp1(const igraph_vector_int_list_t *list);
SEXP R_igraph_0orvector_to_SEXPp1(const igraph_vector_t *v);
SEXP R_igraph_0ormatrix_to_SEXP(const igraph_matrix_t *m);
SEXP R_igraph_vector_to_SEXPp1(const igraph_vector_t *v);
SEXP R_igraph_arpack_options_to_SEXP(const igraph_arpack_options_t *opt);

SEXP R_igraph_matrix_int_to_SEXP(const igraph_matrix_int_t *m);
int R_SEXP_to_matrix_int(SEXP pakl, igraph_matrix_int_t *akl);

int R_igraph_SEXP_to_vector_list(SEXP vectorlist, igraph_vector_list_t *list);

#define IGRAPH_R_CHECK(func) \
    do { \
        R_igraph_attribute_clean_preserve_list(); \
        R_igraph_set_in_r_check(true); \
        igraph_error_type_t __c = func; \
        R_igraph_set_in_r_check(false); \
        R_igraph_warning(); \
        if (__c == IGRAPH_INTERRUPTED) { R_igraph_interrupt(); } \
        else if (__c != IGRAPH_SUCCESS) { R_igraph_error(); } \
    } while (0)
