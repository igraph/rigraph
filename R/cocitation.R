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

#' Cocitation coupling
#'
#' Two vertices are cocited if there is another vertex citing both of them.
#' `cocitation()` simply counts how many types two vertices are cocited. The
#' bibliographic coupling of two vertices is the number of other vertices they
#' both cite, `bibcoupling()` calculates this.
#'
#' `cocitation()` calculates the cocitation counts for the vertices in the
#' `v` argument and all vertices in the graph.
#'
#' `bibcoupling()` calculates the bibliographic coupling for vertices in
#' `v` and all vertices in the graph.
#'
#' Calculating the cocitation or bibliographic coupling for only one vertex
#' costs the same amount of computation as for all vertices. This might change
#' in the future.
#'
#' @param graph The graph object to analyze
#' @param v Vertex sequence or numeric vector, the vertex ids for which the
#'   cocitation or bibliographic coupling values we want to calculate. The
#'   default is all vertices.
#' @return A numeric matrix with `length(v)` lines and
#'   `vcount(graph)` columns. Element `(i,j)` contains the cocitation
#'   or bibliographic coupling for vertices `v[i]` and `j`.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @family cocitation
#' @export
#' @keywords graphs
#' @examples
#'
#' g <- make_kautz_graph(2, 3)
#' cocitation(g)
#' bibcoupling(g)
#'
cocitation <- function(graph, v = V(graph)) {
  ensure_igraph(graph)

  v <- as_igraph_vs(graph, v)
  on.exit(.Call(R_igraph_finalizer))
  res <- .Call(R_igraph_cocitation, graph, v - 1)
  if (igraph_opt("add.vertex.names") && is_named(graph)) {
    rownames(res) <- vertex_attr(graph, "name", v)
    colnames(res) <- vertex_attr(graph, "name")
  }
  res
}

#' @rdname cocitation
#' @export
bibcoupling <- function(graph, v = V(graph)) {
  ensure_igraph(graph)

  v <- as_igraph_vs(graph, v)
  on.exit(.Call(R_igraph_finalizer))
  res <- .Call(R_igraph_bibcoupling, graph, v - 1)
  if (igraph_opt("add.vertex.names") && is_named(graph)) {
    rownames(res) <- vertex_attr(graph, "name", v)
    colnames(res) <- vertex_attr(graph, "name")
  }
  res
}
