#   IGraph R package
#   Copyright (C) 2005-2012  Gabor Csardi <csardi.gabor@gmail.com>
#   334 Harvard street, Cambridge, MA 02139 USA
#
#   This program is free software; you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation; either version 2 of the License, or
#   (at your option) any later version.
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with this program; if not, write to the Free Software
#   Foundation, Inc.,  51 Franklin Street, Fifth Floor, Boston, MA
#   02110-1301 USA
#
###################################################################



#' Minimum spanning tree
#'
#' A *spanning tree* of a connected graph is a connected subgraph with
#' the smallest number of edges that includes all vertices of the graph.
#' A graph will have many spanning trees. Among these, the *minimum spanning
#' tree* will have the smallest sum of edge weights.
#'
#' The *minimum spanning forest* of a disconnected graph is the collection
#' of minimum spanning trees of all of its components.
#'
#' If the graph is not connected a minimum spanning forest is returned.
#'
#' @aliases minimum.spanning.tree
#' @param graph The graph object to analyze.
#' @param weights Numeric vector giving the weights of the edges in the
#'   graph. The order is determined by the edge ids. This is ignored if the
#'   `unweighted` algorithm is chosen. Edge weights are interpreted as
#'   distances.
#' @param algorithm The algorithm to use for calculation. `unweighted` can
#'   be used for unweighted graphs, and `prim` runs Prim's algorithm for
#'   weighted graphs.  If this is `NULL` then igraph will select the
#'   algorithm automatically: if the graph has an edge attribute called
#'   `weight` or the `weights` argument is not `NULL` then Prim's
#'   algorithm is chosen, otherwise the unweighted algorithm is used.
#' @param \dots Additional arguments, unused.
#' @return A graph object with the minimum spanning forest. To check whether it
#'   is a tree, check that the number of its edges is `vcount(graph)-1`.
#'   The edge and vertex attributes of the original graph are preserved in the
#'   result.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @seealso [components()]
#' @references Prim, R.C. 1957. Shortest connection networks and some
#' generalizations *Bell System Technical Journal*, 37 1389--1401.
#' @family minimum.spanning.tree
#' @export
#' @keywords graphs
#' @examples
#'
#' g <- sample_gnp(100, 3 / 100)
#' g_mst <- mst(g)
#'
mst <- function(graph, weights = NULL,
                algorithm = NULL, ...) {
  ensure_igraph(graph)

  if (is.null(algorithm)) {
    if (!is.null(weights) || "weight" %in% edge_attr_names(graph)) {
      algorithm <- "prim"
    } else {
      algorithm <- "unweighted"
    }
  }

  if (algorithm == "unweighted") {
    on.exit(.Call(R_igraph_finalizer))
    .Call(R_igraph_minimum_spanning_tree_unweighted, graph)
  } else if (algorithm == "prim") {
    if (is.null(weights) && !"weight" %in% edge_attr_names(graph)) {
      stop("edges weights must be supplied for Prim's algorithm")
    } else if (is.null(weights)) {
      weights <- E(graph)$weight
    }
    on.exit(.Call(R_igraph_finalizer))
    .Call(R_igraph_minimum_spanning_tree_prim, graph, as.numeric(weights))
  } else {
    stop("Invalid algorithm")
  }
}

#' Minimum spanning tree
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `minimum.spanning.tree()` was renamed to `mst()` to create a more
#' consistent API.
#' @inheritParams mst
#' @keywords internal
#' @export
minimum.spanning.tree <- function(graph , weights = NULL , algorithm = NULL , ...) {
   lifecycle::deprecate_soft("1.5.0", "minimum.spanning.tree()", "mst()")
   mst(graph = graph, weights = weights, algorithm = algorithm, ...)
}
