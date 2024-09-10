
#' Simple graphs
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `is.simple()` was renamed to `is_simple()` to create a more
#' consistent API.
#' @inheritParams is_simple
#' @keywords internal
#' @export
is.simple <- function(graph) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "is.simple()", "is_simple()")
  is_simple(graph = graph)
} # nocov end

## -----------------------------------------------------------------------
##
##   IGraph R package
##   Copyright (C) 2015  Gabor Csardi <csardi.gabor@gmail.com>
##   334 Harvard street, Cambridge, MA 02139 USA
##
##   This program is free software; you can redistribute it and/or modify
##   it under the terms of the GNU General Public License as published by
##   the Free Software Foundation; either version 2 of the License, or
##   (at your option) any later version.
##
##   This program is distributed in the hope that it will be useful,
##   but WITHOUT ANY WARRANTY; without even the implied warranty of
##   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
##   GNU General Public License for more details.
##
##   You should have received a copy of the GNU General Public License
##   along with this program; if not, write to the Free Software
##   Foundation, Inc.,  51 Franklin Street, Fifth Floor, Boston, MA
##   02110-1301 USA
##
## -----------------------------------------------------------------------

#' Simple graphs
#'
#' Simple graphs are graphs which do not contain loop and multiple edges.
#'
#' A loop edge is an edge for which the two endpoints are the same
#' vertex. Two edges are multiple edges if they have exactly the same two
#' endpoints (for directed graphs order does matter). A graph is simple is
#' it does not contain loop edges and multiple edges.
#'
#' `is_simple()` checks whether a graph is simple.
#'
#' `simplify()` removes the loop and/or multiple edges from a graph.  If
#' both `remove.loops` and `remove.multiple` are `TRUE` the
#' function returns a simple graph.
#'
#' `simplify_and_colorize()` constructs a new, simple graph from a graph and
#' also sets a `color` attribute on both the vertices and the edges.
#' The colors of the vertices represent the number of self-loops that were
#' originally incident on them, while the colors of the edges represent the
#' multiplicities of the same edges in the original graph. This allows one to
#' take into account the edge multiplicities and the number of loop edges in
#' the VF2 isomorphism algorithm. Other graph, vertex and edge attributes from
#' the original graph are discarded as the primary purpose of this function is
#' to facilitate the usage of multigraphs with the VF2 algorithm.
#'
#' @aliases simplify
#' @param graph The graph to work on.
#' @param remove.loops Logical, whether the loop edges are to be removed.
#' @param remove.multiple Logical, whether the multiple edges are to be
#'   removed.
#' @param edge.attr.comb Specifies what to do with edge attributes, if
#'   `remove.multiple=TRUE`. In this case many edges might be mapped to a
#'   single one in the new graph, and their attributes are combined. Please see
#'   [attribute.combination()] for details on this.
#' @return a new graph object with the edges deleted.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @seealso [which_loop()], [which_multiple()] and
#' [count_multiple()], [delete_edges()],
#' [delete_vertices()]
#' @keywords graphs
#' @examples
#'
#' g <- make_graph(c(1, 2, 1, 2, 3, 3))
#' is_simple(g)
#' is_simple(simplify(g, remove.loops = FALSE))
#' is_simple(simplify(g, remove.multiple = FALSE))
#' is_simple(simplify(g))
#' @family simple
#' @family functions for manipulating graph structure
#' @family isomorphism
#' @export
#' @cdocs igraph_simplify
simplify <- simplify_impl

#' @export
#' @rdname simplify
#' @cdocs igraph_is_simple
is_simple <- is_simple_impl

#' @export
#' @rdname simplify
simplify_and_colorize <- function(graph) {
  # Argument checks
  ensure_igraph(graph)

  on.exit(.Call(R_igraph_finalizer))
  # Function call
  res <- .Call(R_igraph_simplify_and_colorize, graph)

  V(res$res)$color <- res$vertex_color
  E(res$res)$color <- res$edge_color
  res$res
}
