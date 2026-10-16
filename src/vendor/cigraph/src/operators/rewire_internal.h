#ifndef IGRAPH_OPERATORS_REWIRE_INTERNAL_H
#define IGRAPH_OPERATORS_REWIRE_INTERNAL_H

#include "igraph_decls.h"
#include "igraph_constants.h"
#include "igraph_datatype.h"
#include "igraph_error.h"

__BEGIN_DECLS

IGRAPH_PRIVATE_EXPORT igraph_error_t igraph_i_rewire(
    igraph_t *graph, igraph_int_t n, igraph_bool_t loops,
    igraph_bool_t use_adjlist, igraph_rewiring_stats_t *stats);

__END_DECLS

#endif
