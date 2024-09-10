
## ----------------------------------------------------------------
##
##   IGraph R package
##   Copyright (C) 2005-2021  The igraph development team
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
## -----------------------------------------------------------------

#' Find Eulerian paths or cycles in a graph
#'
#' `has_eulerian_path()` and `has_eulerian_cycle()` checks whether there
#' is an Eulerian path or cycle in the input graph. `eulerian_path()` and
#' `eulerian_cycle()` return such a path or cycle if it exists, and throws
#' an error otherwise.
#'
#' `has_eulerian_path()` decides whether the input graph has an Eulerian
#' *path*, i.e. a path that passes through every edge of the graph exactly
#' once, and returns a logical value as a result. `eulerian_path()` returns
#' a possible Eulerian path, described with its edge and vertex sequence, or
#' throws an error if no such path exists.
#'
#' `has_eulerian_cycle()` decides whether the input graph has an Eulerian
#' *cycle*, i.e. a path that passes through every edge of the graph exactly
#' once and that returns to its starting point, and returns a logical value as
#' a result. `eulerian_cycle()` returns a possible Eulerian cycle, described
#' with its edge and vertex sequence, or throws an error if no such cycle exists.
#'
#' @param graph An igraph graph object
#' @return For `has_eulerian_path()` and `has_eulerian_cycle()`, a logical
#'   value that indicates whether the graph contains an Eulerian path or cycle.
#'   For `eulerian_path()` and `eulerian_cycle()`, a named list with two
#'   entries: \item{epath}{A vector containing the edge ids along the Eulerian
#'   path or cycle.} \item{vpath}{A vector containing the vertex ids along the
#'   Eulerian path or cycle.}
#'
#' @keywords graphs
#' @examples
#'
#' g <- make_graph(~ A - B - C - D - E - A - F - D - B - F - E)
#'
#' has_eulerian_path(g)
#' eulerian_path(g)
#'
#' has_eulerian_cycle(g)
#' try(eulerian_cycle(g))
#'
#' @family cycles
#' @export
#' @cdocs igraph_is_eulerian
has_eulerian_path <- function(graph) {
  is_eulerian_impl(graph)$has_path
}

#' @rdname has_eulerian_path
#' @export
#' @cdocs igraph_is_eulerian
has_eulerian_cycle <- function(graph) {
  is_eulerian_impl(graph)$has_cycle
}

#' @rdname has_eulerian_path
#' @export
#' @cdocs igraph_eulerian_path
eulerian_path <- eulerian_path_impl

#' @rdname has_eulerian_path
#' @export
#' @cdocs igraph_eulerian_cycle
eulerian_cycle <- eulerian_cycle_impl
