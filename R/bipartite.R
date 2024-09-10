
#' Project a bipartite graph
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `bipartite.projection.size()` was renamed to `bipartite_projection_size()` to create a more
#' consistent API.
#' @inheritParams bipartite_projection_size
#' @keywords internal
#' @export
bipartite.projection.size <- function(graph, types = NULL) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "bipartite.projection.size()", "bipartite_projection_size()")
  bipartite_projection_size(graph = graph, types = types)
} # nocov end

#' Project a bipartite graph
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `bipartite.projection()` was renamed to `bipartite_projection()` to create a more
#' consistent API.
#' @inheritParams bipartite_projection
#' @keywords internal
#' @export
bipartite.projection <- function(graph, types = NULL, multiplicity = TRUE, probe1 = NULL, which = c("both", "true", "false"), remove.type = TRUE) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "bipartite.projection()", "bipartite_projection()")
  bipartite_projection(graph = graph, types = types, multiplicity = multiplicity, probe1 = probe1, which = which, remove.type = remove.type)
} # nocov end

#' Decide whether a graph is bipartite
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `bipartite.mapping()` was renamed to `bipartite_mapping()` to create a more
#' consistent API.
#' @inheritParams bipartite_mapping
#' @keywords internal
#' @export
bipartite.mapping <- function(graph) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "bipartite.mapping()", "bipartite_mapping()")
  bipartite_mapping(graph = graph)
} # nocov end
#   IGraph R package
#   Copyright (C) 2009-2012  Gabor Csardi <csardi.gabor@gmail.com>
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



#' Project a bipartite graph
#'
#' A bipartite graph is projected into two one-mode networks
#'
#' Bipartite graphs have a `type` vertex attribute in igraph, this is
#' boolean and `FALSE` for the vertices of the first kind and `TRUE`
#' for vertices of the second kind.
#'
#' `bipartite_projection_size()` calculates the number of vertices and edges
#' in the two projections of the bipartite graphs, without calculating the
#' projections themselves. This is useful to check how much memory the
#' projections would need if you have a large bipartite graph.
#'
#' `bipartite_projection()` calculates the actual projections.  You can use
#' the `probe1` argument to specify the order of the projections in the
#' result. By default vertex type `FALSE` is the first and `TRUE` is
#' the second.
#'
#' `bipartite_projection()` keeps vertex attributes.
#'
#' @param graph The input graph. It can be directed, but edge directions are
#'   ignored during the computation.
#' @param types An optional vertex type vector to use instead of the
#'   \sQuote{`type`} vertex attribute. You must supply this argument if the
#'   graph has no \sQuote{`type`} vertex attribute.
#' @param multiplicity If `TRUE`, then igraph keeps the multiplicity of
#'   the edges as an edge attribute called \sQuote{weight}.
#'   E.g. if there is an A-C-B and also an A-D-B
#'   triple in the bipartite graph (but no more X, such that A-X-B is also in the
#'   graph), then the multiplicity of the A-B edge in the projection will be 2.
#' @param probe1 This argument can be used to specify the order of the
#'   projections in the resulting list. If given, then it is considered as a
#'   vertex id (or a symbolic vertex name); the projection containing this vertex
#'   will be the first one in the result list.  This argument is ignored if only
#'   one projection is requested in argument `which`.
#' @param which A character scalar to specify which projection(s) to calculate.
#'   The default is to calculate both.
#' @param remove.type Logical scalar, whether to remove the `type` vertex
#'   attribute from the projections. This makes sense because these graphs are
#'   not bipartite any more. However if you want to combine them with each other
#'   (or other bipartite graphs), then it is worth keeping this attribute. By
#'   default it will be removed.
#' @return A list of two undirected graphs. See details above.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @family bipartite
#' @export
#' @keywords graphs
#' @examples
#'
#' ## Projection of a full bipartite graph is a full graph
#' g <- make_full_bipartite_graph(10, 5)
#' proj <- bipartite_projection(g)
#' graph.isomorphic(proj[[1]], make_full_graph(10))
#' graph.isomorphic(proj[[2]], make_full_graph(5))
#'
#' ## The projection keeps the vertex attributes
#' M <- matrix(0, nrow = 5, ncol = 3)
#' rownames(M) <- c("Alice", "Bob", "Cecil", "Dan", "Ethel")
#' colnames(M) <- c("Party", "Skiing", "Badminton")
#' M[] <- sample(0:1, length(M), replace = TRUE)
#' M
#' g2 <- graph_from_biadjacency_matrix(M)
#' g2$name <- "Event network"
#' proj2 <- bipartite_projection(g2)
#' print(proj2[[1]], g = TRUE, e = TRUE)
#' print(proj2[[2]], g = TRUE, e = TRUE)
#'
bipartite_projection <- function(graph, types = NULL,
                                 multiplicity = TRUE, probe1 = NULL,
                                 which = c("both", "true", "false"),
                                 remove.type = TRUE) {
  # Argument checks
  ensure_igraph(graph)
  types <- handle_vertex_type_arg(types, graph)
  if (!is.null(probe1)) {
    probe1 <- as_igraph_vs(graph, probe1) - 1
    if (length(probe1) < 1) {
      probe1 <- -1
    }
  } else {
    probe1 <- -1
  }
  which <- switch(igraph.match.arg(which),
    "both" = 0L,
    "false" = 1L,
    "true" = 2L
  )
  if (which != "both" && probe1 != -1) {
    warning("`probe1' ignored if only one projection is requested")
  }

  on.exit(.Call(R_igraph_finalizer))
  # Function call
  res <- .Call(
    R_igraph_bipartite_projection, graph, types,
    as.numeric(probe1), which
  )
  if (remove.type) {
    if (is_igraph(res[[1]])) {
      res[[1]] <- delete_vertex_attr(res[[1]], "type")
    }
    if (is_igraph(res[[2]])) {
      res[[2]] <- delete_vertex_attr(res[[2]], "type")
    }
  }
  if (which == 0L) {
    if (multiplicity) {
      E(res[[1]])$weight <- res[[3]]
      E(res[[2]])$weight <- res[[4]]
    }
    res[1:2]
  } else if (which == 1L) {
    if (multiplicity) {
      E(res[[1]])$weight <- res[[3]]
    }
    res[[1]]
  } else {
    if (multiplicity) {
      E(res[[2]])$weight <- res[[4]]
    }
    res[[2]]
  }
}

#' @rdname bipartite_projection
#' @export
#' @cdocs igraph_bipartite_projection_size
bipartite_projection_size <- bipartite_projection_size_impl

#' Decide whether a graph is bipartite
#'
#' This function decides whether the vertices of a network can be mapped to two
#' vertex types in a way that no vertices of the same type are connected.
#'
#' A bipartite graph in igraph has a \sQuote{`type`} vertex attribute
#' giving the two vertex types.
#'
#' This function simply checks whether a graph *could* be bipartite. It
#' tries to find a mapping that gives a possible division of the vertices into
#' two classes, such that no two vertices of the same class are connected by an
#' edge.
#'
#' The existence of such a mapping is equivalent of having no circuits of odd
#' length in the graph. A graph with loop edges cannot bipartite.
#'
#' Note that the mapping is not necessarily unique, e.g. if the graph has at
#' least two components, then the vertices in the separate components can be
#' mapped independently.
#'
#' @param graph The input graph.
#' @return A named list with two elements: \item{res}{A logical scalar,
#'   `TRUE` if the can be bipartite, `FALSE` otherwise.} \item{type}{A
#'   possible vertex type mapping, a logical vector. If no such mapping exists,
#'   then an empty vector.}
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @keywords graphs
#' @examples
#'
#' ## Rings with an even number of vertices are bipartite
#' g <- make_ring(10)
#' bipartite_mapping(g)
#'
#' ## All star graphs are bipartite
#' g2 <- make_star(10)
#' bipartite_mapping(g2)
#'
#' ## A graph containing a triangle is not bipartite
#' g3 <- make_ring(10)
#' g3 <- add_edges(g3, c(1, 3))
#' bipartite_mapping(g3)
#' @family bipartite
#' @export
#' @cdocs igraph_is_bipartite
bipartite_mapping <- is_bipartite_impl
