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

#include <R.h>
#include <Rdefines.h>

#include "rinterface.h"

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
