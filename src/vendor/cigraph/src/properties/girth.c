/*
   igraph library.
   Copyright (C) 2005-2021 The igraph development team

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

#include "igraph_structural.h"

#include "igraph_adjlist.h"
#include "igraph_components.h"
#include "igraph_dqueue.h"
#include "igraph_interface.h"

#include "core/interruption.h"

/**
 * \function igraph_girth
 * \brief The girth of a graph is the length of the shortest cycle in it.
 *
 * The current implementation works for undirected graphs only,
 * directed graphs are treated as undirected graphs. Self-loops and
 * multiple edges are ignored, i.e. cycles of length 1 or 2 are
 * not considered.
 *
 * </para><para>
 * For graphs that contain no cycles, and only for such graphs,
 * infinity is returned.
 *
 * </para><para>
 * The first implementation of this function was done by Keith Briggs,
 * thanks Keith.
 *
 * </para><para>
 * Reference:
 *
 * </para><para>
 * Alon Itai and Michael Rodeh:
 * Finding a minimum circuit in a graph
 * \emb Proceedings of the ninth annual ACM symposium on Theory of
 * computing \eme, 1-10, 1977.
 * https://doi.org/10.1145/800105.803390
 *
 * \param graph The input graph. Edge directions will be ignored.
 * \param girth Pointer to an \c igraph_real_t, if not \c NULL then the result
 *     will be stored here.
 * \param cycle Pointer to an initialized vector, the vertex IDs in
 *     the shortest cycle of length at least 3 will be stored here.
 *     If \c NULL then it is ignored.
 * \return Error code.
 *
 * Time complexity: O((|V|+|E|)^2), |V| is the number of vertices, |E|
 * is the number of edges in the general case. If the graph has no
 * cycles at all then the function needs O(|V|+|E|) time to realize
 * this and then it stops.
 *
 * \example examples/simple/igraph_girth.c
 */
igraph_error_t igraph_girth(const igraph_t *graph,
                            igraph_real_t *girth,
                            igraph_vector_int_t *cycle) {

    igraph_int_t no_of_nodes = igraph_vcount(graph);
    igraph_dqueue_int_t q;
    igraph_lazy_adjlist_t adjlist;
    igraph_int_t mincirc = IGRAPH_INTEGER_MAX, minvertex = 0;
    igraph_int_t node;
    igraph_bool_t triangle = false;
    igraph_vector_int_t *neis;
    igraph_vector_int_t level;
    igraph_int_t stoplevel = no_of_nodes + 1;
    igraph_bool_t anycircle = false;
    igraph_int_t t1 = 0, t2 = 0;

    IGRAPH_CHECK(igraph_lazy_adjlist_init(graph, &adjlist, IGRAPH_ALL, IGRAPH_NO_LOOPS, IGRAPH_NO_MULTIPLE));
    IGRAPH_FINALLY(igraph_lazy_adjlist_destroy, &adjlist);
    IGRAPH_DQUEUE_INT_INIT_FINALLY(&q, 100);
    IGRAPH_VECTOR_INT_INIT_FINALLY(&level, no_of_nodes);

    for (node = 0; !triangle && node < no_of_nodes; node++) {

        /* Are there circles in this graph at all? */
        if (node == 1 && anycircle == 0) {
            igraph_bool_t conn;
            IGRAPH_CHECK(igraph_is_connected(graph, &conn, IGRAPH_WEAK));
            if (conn) {
                /* No, there are none */
                break;
            }
        }

        anycircle = 0;
        igraph_dqueue_int_clear(&q);
        igraph_vector_int_null(&level);
        IGRAPH_CHECK(igraph_dqueue_int_push(&q, node));
        VECTOR(level)[node] = 1;

        IGRAPH_ALLOW_INTERRUPTION();

        while (!igraph_dqueue_int_empty(&q)) {
            igraph_int_t actnode = igraph_dqueue_int_pop(&q);
            igraph_int_t actlevel = VECTOR(level)[actnode];
            igraph_int_t i, n;

            if (actlevel >= stoplevel) {
                break;
            }

            neis = igraph_lazy_adjlist_get(&adjlist, actnode);
            IGRAPH_CHECK_OOM(neis, "Failed to query neighbors.");

            n = igraph_vector_int_size(neis);
            for (i = 0; i < n; i++) {
                igraph_int_t nei = VECTOR(*neis)[i];
                igraph_int_t neilevel = VECTOR(level)[nei];
                if (neilevel != 0) {
                    if (neilevel == actlevel - 1) {
                        continue;
                    } else {
                        /* found circle */
                        stoplevel = neilevel;
                        anycircle = 1;
                        if (actlevel < mincirc) {
                            /* Is it a minimum circle? */
                            mincirc = actlevel + neilevel - 1;
                            minvertex = node;
                            t1 = actnode; t2 = nei;
                            if (neilevel == 2) {
                                /* Is it a triangle? */
                                triangle = 1;
                            }
                        }
                        if (neilevel == actlevel) {
                            break;
                        }
                    }
                } else {
                    IGRAPH_CHECK(igraph_dqueue_int_push(&q, nei));
                    VECTOR(level)[nei] = actlevel + 1;
                }
            }

        } /* while q !empty */
    } /* node */

    if (girth) {
        if (mincirc == IGRAPH_INTEGER_MAX) {
            *girth = IGRAPH_INFINITY;
        } else {
            *girth = mincirc;
        }
    }

    if (mincirc == IGRAPH_INTEGER_MAX) {
        mincirc = 0;
    }

    /* Store the actual circle, if needed */
    if (cycle) {
        IGRAPH_CHECK(igraph_vector_int_resize(cycle, mincirc));
        if (mincirc != 0) {
            igraph_int_t i, n, idx = 0;
            igraph_dqueue_int_clear(&q);
            igraph_vector_int_null(&level); /* used for parent pointers */
#define PARENT(x) (VECTOR(level)[(x)])
            IGRAPH_CHECK(igraph_dqueue_int_push(&q, minvertex));
            PARENT(minvertex) = minvertex;
            while (PARENT(t1) == 0 || PARENT(t2) == 0) {
                igraph_int_t actnode = igraph_dqueue_int_pop(&q);
                neis = igraph_lazy_adjlist_get(&adjlist, actnode);
                IGRAPH_CHECK_OOM(neis, "Failed to query neighbors.");
                n = igraph_vector_int_size(neis);
                for (i = 0; i < n; i++) {
                    igraph_int_t nei = VECTOR(*neis)[i];
                    if (PARENT(nei) == 0) {
                        PARENT(nei) = actnode + 1;
                        IGRAPH_CHECK(igraph_dqueue_int_push(&q, nei));
                    }
                }
            }  /* while q !empty */
            /* Ok, now use PARENT to create the path */
            while (t1 != minvertex) {
                VECTOR(*cycle)[idx++] = t1;
                t1 = PARENT(t1) - 1;
            }
            VECTOR(*cycle)[idx] = minvertex;
            idx = mincirc - 1;
            while (t2 != minvertex) {
                VECTOR(*cycle)[idx--] = t2;
                t2 = PARENT(t2) - 1;
            }
        } /* anycircle */
    } /* circle */
#undef PARENT

    igraph_vector_int_destroy(&level);
    igraph_dqueue_int_destroy(&q);
    igraph_lazy_adjlist_destroy(&adjlist);
    IGRAPH_FINALLY_CLEAN(3);

    return IGRAPH_SUCCESS;
}
