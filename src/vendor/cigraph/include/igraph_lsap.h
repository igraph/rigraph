
#ifndef IGRAPH_LSAP_H
#define IGRAPH_LSAP_H

#include "igraph_decls.h"
#include "igraph_error.h"
#include "igraph_matrix.h"
#include "igraph_vector.h"
#include "igraph_types.h"

IGRAPH_BEGIN_C_DECLS

IGRAPH_EXPORT igraph_error_t igraph_solve_lsap(const igraph_matrix_t *c, igraph_int_t n,
                      igraph_vector_int_t *p);

IGRAPH_END_C_DECLS

#endif
