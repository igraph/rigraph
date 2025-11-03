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

#include "igraph_motifs.h"
#include "igraph_error.h"

#include "rinterface.h"

#include <R.h>
#include <Rinternals.h>

/* Structure to hold callback data */
typedef struct {
  SEXP callback;
} R_igraph_motifs_data_t;

/* Handler function for motifs callback - converts C types to R types */
igraph_error_t R_igraph_motifs_handler(const igraph_t *graph,
                                       igraph_vector_int_t *vids,
                                       igraph_integer_t isoclass,
                                       void *extra) {

  R_igraph_motifs_data_t *data = (R_igraph_motifs_data_t *)extra;
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
  
  R_igraph_motifs_data_t data = { .callback = callback };
  
  return igraph_motifs_randesu_callback(
      graph, size, cut_prob,
      R_igraph_motifs_handler, &data);
}
