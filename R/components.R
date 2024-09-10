
#' Connected components of a graph
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `no.clusters()` was renamed to `count_components()` to create a more
#' consistent API.
#' @inheritParams count_components
#' @keywords internal
#' @export
no.clusters <- function(graph, mode = c("weak", "strong")) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "no.clusters()", "count_components()")
  count_components(graph = graph, mode = mode)
} # nocov end

#' Decompose a graph into components
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `decompose.graph()` was renamed to `decompose()` to create a more
#' consistent API.
#' @inheritParams decompose
#' @keywords internal
#' @export
decompose.graph <- function(graph, mode = c("weak", "strong"), max.comps = NA, min.vertices = 0) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "decompose.graph()", "decompose()")
  decompose(graph = graph, mode = mode, max.comps = max.comps, min.vertices = min.vertices)
} # nocov end

#' Connected components of a graph
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `cluster.distribution()` was renamed to `component_distribution()` to create a more
#' consistent API.
#' @inheritParams component_distribution
#' @keywords internal
#' @export
cluster.distribution <- function(graph, cumulative = FALSE, mul.size = FALSE, ...) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "cluster.distribution()", "component_distribution()")
  component_distribution(graph = graph, cumulative = cumulative, mul.size = mul.size, ...)
} # nocov end

#' Biconnected components
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `biconnected.components()` was renamed to `biconnected_components()` to create a more
#' consistent API.
#' @inheritParams biconnected_components
#' @keywords internal
#' @export
biconnected.components <- function(graph) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "biconnected.components()", "biconnected_components()")
  biconnected_components(graph = graph)
} # nocov end

#' Articulation points and bridges of a graph
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `articulation.points()` was renamed to `articulation_points()` to create a more
#' consistent API.
#' @inheritParams articulation_points
#' @keywords internal
#' @export
articulation.points <- function(graph) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "articulation.points()", "articulation_points()")
  articulation_points(graph = graph)
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

###################################################################
# Connected components, subgraphs, kinda
###################################################################

#' @rdname components
#' @param cumulative Logical, if TRUE the cumulative distirubution (relative
#'   frequency) is calculated.
#' @param mul.size Logical. If TRUE the relative frequencies will be multiplied
#'   by the cluster sizes.
#' @family components
#' @export
#' @importFrom graphics hist
component_distribution <- function(graph, cumulative = FALSE, mul.size = FALSE,
                                   ...) {
  ensure_igraph(graph)

  cs <- components(graph, ...)$csize
  hi <- hist(cs, -1:max(cs), plot = FALSE)$density
  if (mul.size) {
    hi <- hi * 1:max(cs)
    hi <- hi / sum(hi)
  }
  if (!cumulative) {
    res <- hi
  } else {
    res <- rev(cumsum(rev(hi)))
  }

  res
}



#' Decompose a graph into components
#'
#' Creates a separate graph for each connected component of a graph.
#'
#' @param graph The original graph.
#' @param mode Character constant giving the type of the components, wither
#'   `weak` for weakly connected components or `strong` for strongly
#'   connected components.
#' @param max.comps The maximum number of components to return. The first
#'   `max.comps` components will be returned (which hold at least
#'   `min.vertices` vertices, see the next parameter), the others will be
#'   ignored. Supply `NA` here if you don't want to limit the number of
#'   components.
#' @param min.vertices The minimum number of vertices a component should
#'   contain in order to place it in the result list. E.g. supply 2 here to ignore
#'   isolate vertices.
#' @return A list of graph objects.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @seealso [is_connected()] to decide whether a graph is connected,
#' [components()] to calculate the connected components of a graph.
#' @family components
#' @export
#' @keywords graphs
#' @examples
#'
#' # the diameter of each component in a random graph
#' g <- sample_gnp(1000, 1 / 1000)
#' components <- decompose(g, min.vertices = 2)
#' sapply(components, diameter)
#'
decompose <- function(graph, mode = c("weak", "strong"), max.comps = NA,
                      min.vertices = 0) {
  ensure_igraph(graph)
  mode <- igraph.match.arg(mode)
  mode <- switch(mode,
    "weak" = 1L,
    "strong" = 2L
  )

  if (is.na(max.comps)) {
    max.comps <- -1
  }
  on.exit(.Call(R_igraph_finalizer))
  .Call(
    R_igraph_decompose, graph, as.numeric(mode),
    as.numeric(max.comps), as.numeric(min.vertices)
  )
}


#' Articulation points and bridges of a graph
#'
#' `articulation_points()` finds the articulation points (or cut vertices)
# " of a graph, while \code{bridges()} finds the bridges (or cut-edges) of a graph.
#'
#' Articulation points or cut vertices are vertices whose removal increases the
#' number of connected components in a graph. Similarly, bridges or cut-edges
#' are edges whose removal increases the number of connected components in a
#' graph. If the original graph was connected, then the removal of a single
#' articulation point or a single bridge makes it disconnected. If a graph
#' contains no articulation points, then its vertex connectivity is at least
# " two. If a graph contains no bridges, then its edge connectivity is at least
#' two.
#'
#' @param graph The input graph. It is treated as an undirected graph, even if
#'   it is directed.
#' @return For `articulation_points()`, a numeric vector giving the vertex
#'   IDs of the articulation points of the input graph. For `bridges()`, a
#'   numeric vector giving the edge IDs of the bridges of the input graph.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @seealso [biconnected_components()], [components()],
#' [is_connected()], [vertex_connectivity()],
#' [edge_connectivity()]
#' @keywords graphs
#' @examples
#'
#' g <- disjoint_union(make_full_graph(5), make_full_graph(5))
#' clu <- components(g)$membership
#' g <- add_edges(g, c(match(1, clu), match(2, clu)))
#' articulation_points(g)
#'
#' g <- make_graph("krackhardt_kite")
#' bridges(g)
#'
#' @family components
#' @export
#' @cdocs igraph_articulation_points
articulation_points <- articulation_points_impl

#' @rdname articulation_points
#' @export
#' @cdocs igraph_bridges
bridges <- bridges_impl


#' Biconnected components
#'
#' Finding the biconnected components of a graph
#'
#' A graph is biconnected if the removal of any single vertex (and its adjacent
#' edges) does not disconnect it.
#'
#' A biconnected component of a graph is a maximal biconnected subgraph of it.
#' The biconnected components of a graph can be given by the partition of its
#' edges: every edge is a member of exactly one biconnected component. Note
#' that this is not true for vertices: the same vertex can be part of many
#' biconnected components.
#'
#' @param graph The input graph. It is treated as an undirected graph, even if
#'   it is directed.
#' @return A named list with three components: \item{no}{Numeric scalar, an
#'   integer giving the number of biconnected components in the graph.}
#'   \item{tree_edges}{The components themselves, a list of numeric vectors. Each
#'   vector is a set of edge ids giving the edges in a biconnected component.
#'   These edges define a spanning tree of the component.}
#'   \item{component_edges}{A list of numeric vectors. It gives all edges in the
#'   components.} \item{components}{A list of numeric vectors, the vertices of
#'   the components.} \item{articulation_points}{The articulation points of the
#'   graph. See [articulation_points()].}
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @seealso [articulation_points()], [components()],
#' [is_connected()], [vertex_connectivity()]
#' @keywords graphs
#' @examples
#'
#' g <- disjoint_union(make_full_graph(5), make_full_graph(5))
#' clu <- components(g)$membership
#' g <- add_edges(g, c(which(clu == 1), which(clu == 2)))
#' bc <- biconnected_components(g)
#' @family components
#' @export
#' @cdocs igraph_biconnected_components
biconnected_components <- function(graph) {
  # Function call
  res <- biconnected_components_impl(graph)

  # TODO: Clean up after fixing "." / "_" problem.
  # See https://github.com/igraph/rigraph/issues/1203

  if (igraph_opt("return.vs.es")) {
    res$tree_edges <- lapply(res$tree_edges, unsafe_create_es, graph = graph, es = E(graph))
    res$tree.edges <- NULL
  }

  if (igraph_opt("return.vs.es")) {
    res$component_edges <- lapply(res$component_edges, unsafe_create_es, graph = graph, es = E(graph))
    res$component.edges <- NULL
  }
  if (igraph_opt("return.vs.es")) {
    res$components <- lapply(res$components, unsafe_create_vs, graph = graph, verts = V(graph))
  }
  if (igraph_opt("return.vs.es")) {
    res$articulation_points <- create_vs(graph, res$articulation_points)
    res$articulation.points <- NULL
  }
  res
}

#' Check biconnectedness
#'
#' @description
#' `r lifecycle::badge("experimental")`
#'
#' Tests whether a graph is biconnected.
#'
#' @details
#' A graph is biconnected if the removal of any single vertex (and its adjacent
#' edges) does not disconnect it.
#'
#' igraph does not consider single-vertex graphs biconnected.
#'
#' Note that some authors do not consider the graph consisting of
#' two connected vertices as biconnected, however, igraph does.
#'
#' @param graph The input graph. Edge directions are ignored.
#' @return Logical, `TRUE` if the graph is biconnected.
#' @seealso [articulation_points()], [biconnected_components()],
#' [is_connected()], [vertex_connectivity()]
#' @keywords graphs
#' @examples
#' is_biconnected(make_graph("bull"))
#' is_biconnected(make_graph("dodecahedron"))
#' is_biconnected(make_full_graph(1))
#' is_biconnected(make_full_graph(2))
#' @family components
#' @export
#' @cdocs igraph_is_biconnected
is_biconnected <- is_biconnected_impl


#' @rdname components
#' @export
largest_component <- function(graph, mode = c("weak", "strong")) {
  if (!is_igraph(graph)) {
    stop("Not a graph object")
  }

  comps <- components(graph, mode = mode)

  lcc_id <- which.max(comps$csize)
  vids <- V(graph)[comps$membership == lcc_id]

  induced_subgraph(graph, vids)
}
