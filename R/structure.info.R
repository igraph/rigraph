
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

#' Are two vertices adjacent?
#'
#' The order of the vertices only matters in directed graphs,
#' where the existence of a directed `(v1, v2)` edge is queried.
#'
#' @aliases are.connected
#' @param graph The graph.
#' @param v1 The first vertex, tail in directed graphs.
#' @param v2 The second vertex, head in directed graphs.
#' @return A logical scalar, `TRUE` is a `(v1, v2)` exists in the
#'   graph.
#'
#' @family structural queries
#'
#' @export
#' @examples
#' ug <- make_ring(10)
#' ug
#' are_adjacent(ug, 1, 2)
#' are_adjacent(ug, 2, 1)
#'
#' dg <- make_ring(10, directed = TRUE)
#' dg
#' are_adjacent(ug, 1, 2)
#' are_adjacent(ug, 2, 1)
are_adjacent <- function(graph, v1, v2) {
  ensure_igraph(graph)

  on.exit(.Call(R_igraph_finalizer))
  .Call(
    R_igraph_are_connected, graph, as.igraph.vs(graph, v1) - 1,
    as.igraph.vs(graph, v2) - 1
  )
}