#' Is this object an igraph graph?
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `is.igraph()` was renamed to [is_igraph()] to create a more
#' consistent API.
#' @inheritParams is_igraph
#' @keywords internal
#' @export
is.igraph <- function(graph) {
  # nocov start
  lifecycle::deprecate_warn("2.2.0", "is.igraph()", "is_igraph()")
  is_igraph(graph = graph)
} # nocov end
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

#' Is this object an igraph graph?
#'
#' @param graph An R object.
#' @return A logical constant, `TRUE` if argument `graph` is a graph
#'   object.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @export
#' @keywords graphs
#' @examples
#'
#' g <- make_ring(10)
#' is_igraph(g)
#' is_igraph(numeric(10))
is_igraph <- function(graph) {
  if (!inherits(graph, "igraph")) {
    return(FALSE)
  }

  warn_version(graph)
  TRUE
}

#' Incident vertices of some graph edges
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' Use [ends()].
#' @inheritParams ends
#' @export
#' @keywords internal
get.edge <- function(graph, id) {
  lifecycle::deprecate_stop("2.2.0", "get.edge()", "ends()")
}


#' Head of the edge(s) in a graph
#'
#' For undirected graphs, head and tail is not defined.  In this case
#' `head_of()` returns vertices incident to the supplied edges, and
#' `tail_of()` returns the other end(s) of the edge(s).
#'
#' @param graph The input graph.
#' @param es The edges to query.
#' @return A vertex sequence with the head(s) of the edge(s).
#'
#' @family structural queries
#'
#' @export
head_of <- function(graph, es) {
  create_vs(graph, ends(graph, es, names = FALSE)[, 2])
}

#' Tails of the edge(s) in a graph
#'
#' For undirected graphs, head and tail is not defined.  In this case
#' `tail_of()` returns vertices incident to the supplied edges, and
#' `head_of()` returns the other end(s) of the edge(s).
#'
#' @param graph The input graph.
#' @param es The edges to query.
#' @return A vertex sequence with the tail(s) of the edge(s).
#'
#' @family structural queries
#'
#' @export
tail_of <- function(graph, es) {
  create_vs(graph, ends(graph, es, names = FALSE)[, 1])
}
