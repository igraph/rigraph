
#' Find triangles in graphs
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `adjacent.triangles()` was renamed to `count_triangles()` to create a more
#' consistent API.
#' @inheritParams count_triangles
#' @keywords internal
#' @export
adjacent.triangles <- function(graph, vids = V(graph)) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "adjacent.triangles()", "count_triangles()")
  count_triangles(graph = graph, vids = vids)
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


#' Find triangles in graphs
#'
#' Count how many triangles a vertex is part of, in a graph, or just list the
#' triangles of a graph.
#'
#' `triangles()` lists all triangles of a graph. For efficiency, all
#' triangles are returned in a single vector. The first three vertices belong
#' to the first triangle, etc.
#'
#' `count_triangles()` counts how many triangles a vertex is part of.
#'
#' @aliases triangles
#' @param graph The input graph. It might be directed, but edge directions are
#'   ignored.
#' @param vids The vertices to query, all of them by default. This might be a
#'   vector of numeric ids, or a character vector of symbolic vertex names for
#'   named graphs.
#' @return For `triangles()` a numeric vector of vertex ids, the first three
#'   vertices belong to the first triangle found, etc.
#'
#'   For `count_triangles()` a numeric vector, the number of triangles for all
#'   vertices queried.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @seealso [transitivity()]
#' @keywords graphs
#' @examples
#'
#' ## A small graph
#' kite <- make_graph("Krackhardt_Kite")
#' plot(kite)
#' matrix(triangles(kite), nrow = 3)
#'
#' ## Adjacenct triangles
#' atri <- count_triangles(kite)
#' plot(kite, vertex.label = atri)
#'
#' ## Always true
#' sum(count_triangles(kite)) == length(triangles(kite))
#'
#' ## Should match, local transitivity is the
#' ## number of adjacent triangles divided by the number
#' ## of adjacency triples
#' transitivity(kite, type = "local")
#' count_triangles(kite) / (degree(kite) * (degree(kite) - 1) / 2)
#' @family triangles
#' @export
#' @rdname count_triangles
#' @cdocs igraph_list_triangles
triangles <- list_triangles_impl

#' @export
#' @rdname count_triangles
#' @cdocs igraph_adjacent_triangles
count_triangles <- adjacent_triangles_impl
