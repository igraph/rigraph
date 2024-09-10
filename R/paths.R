
#' Shortest (directed or undirected) paths between vertices
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `path.length.hist()` was renamed to `distance_table()` to create a more
#' consistent API.
#' @inheritParams distance_table
#' @keywords internal
#' @export
path.length.hist <- function(graph, directed = TRUE) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "path.length.hist()", "distance_table()")
  distance_table(graph = graph, directed = directed)
} # nocov end

#' Maximum cardinality search
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `maximum.cardinality.search()` was renamed to `max_cardinality()` to create a more
#' consistent API.
#' @inheritParams max_cardinality
#' @keywords internal
#' @export
maximum.cardinality.search <- function(graph) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "maximum.cardinality.search()", "max_cardinality()")
  max_cardinality(graph = graph)
} # nocov end

#' Directed acyclic graphs
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `is.dag()` was renamed to `is_dag()` to create a more
#' consistent API.
#' @inheritParams is_dag
#' @keywords internal
#' @export
is.dag <- function(graph) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "is.dag()", "is_dag()")
  is_dag(graph = graph)
} # nocov end
## -----------------------------------------------------------------------
##
##   IGraph R package
##   Copyright (C) 2014  Gabor Csardi <csardi.gabor@gmail.com>
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

#' List all simple paths from one source
#'
#' This function lists are simple paths from one source vertex to another
#' vertex or vertices. A path is simple if the vertices it visits are not
#' visited more than once.
#'
#' Note that potentially there are exponentially many paths between two
#' vertices of a graph, and you may run out of memory when using this
#' function, if your graph is lattice-like.
#'
#' This function currently ignored multiple and loop edges.
#'
#' @param graph The input graph.
#' @param from The source vertex.
#' @param to The target vertex of vertices. Defaults to all vertices.
#' @param mode Character constant, gives whether the shortest paths to or
#'   from the given vertices should be calculated for directed graphs. If
#'   `out` then the shortest paths *from* the vertex, if `in`
#'   then *to* it will be considered. If `all`, the default, then
#'   the corresponding undirected graph will be used, i.e. not directed paths
#'   are searched. This argument is ignored for undirected graphs.
#' @param cutoff Maximum length of path that is considered. If negative, paths of all lengths are considered.
#' @return A list of integer vectors, each integer vector is a path from
#'   the source vertex to one of the target vertices. A path is given by its
#'   vertex ids.
#' @keywords graphs
#' @examples
#'
#' g <- make_ring(10)
#' all_simple_paths(g, 1, 5)
#' all_simple_paths(g, 1, c(3, 5))
#'
#' @family paths
#' @export
all_simple_paths <- function(graph, from, to = V(graph),
                             mode = c("out", "in", "all", "total"),
                             cutoff = -1) {
  ## Argument checks
  ensure_igraph(graph)
  from <- as_igraph_vs(graph, from)
  to <- as_igraph_vs(graph, to)
  mode <- switch(igraph.match.arg(mode),
    "out" = 1,
    "in" = 2,
    "all" = 3,
    "total" = 3
  )

  on.exit(.Call(R_igraph_finalizer))

  ## Function call
  res <- .Call(
    R_igraph_get_all_simple_paths, graph, from - 1, to - 1,
    as.numeric(cutoff), mode
  )
  res <- get.all.simple.paths.pp(res)

  if (igraph_opt("return.vs.es")) {
    res <- lapply(res, unsafe_create_vs, graph = graph, verts = V(graph))
  }
  res
}


#' Directed acyclic graphs
#'
#' This function tests whether the given graph is a DAG, a directed acyclic
#' graph.
#'
#' `is_dag()` checks whether there is a directed cycle in the graph. If not,
#' the graph is a DAG.
#'
#' @param graph The input graph. It may be undirected, in which case
#'   `FALSE` is reported.
#' @return A logical vector of length one.
#' @author Tamas Nepusz \email{ntamas@@gmail.com} for the C code, Gabor Csardi
#' \email{csardi.gabor@@gmail.com} for the R interface.
#' @keywords graphs
#' @examples
#'
#' g <- make_tree(10)
#' is_dag(g)
#' g2 <- g + edge(5, 1)
#' is_dag(g2)
#' @family cycles
#' @family structural.properties
#' @export
#' @cdocs igraph_is_dag
is_dag <- is_dag_impl

#' Acyclic graphs
#'
#' This function tests whether the given graph is free of cycles.
#'
#' This function looks for directed cycles in directed graphs and undirected
#' cycles in undirected graphs.
#'
#' @param graph The input graph.
#' @return A logical vector of length one.
#' @keywords graphs
#' @examples
#'
#' g <- make_graph(c(1,2, 1,3, 2,4, 3,4), directed = TRUE)
#' is_acyclic(g)
#' is_acyclic(as.undirected(g))
#' @seealso [is_forest()] and [is_dag()] for functions specific to undirected
#' and directed graphs.
#' @family cycles
#' @family structural.properties
#' @export
#' @cdocs igraph_is_acyclic
is_acyclic <- is_acyclic_impl

#' Maximum cardinality search
#'
#' Maximum cardinality search is a simple ordering a vertices that is useful in
#' determining the chordality of a graph.
#'
#' Maximum cardinality search visits the vertices in such an order that every
#' time the vertex with the most already visited neighbors is visited. Ties are
#' broken randomly.
#'
#' The algorithm provides a simple basis for deciding whether a graph is
#' chordal, see References below, and also [is_chordal()].
#'
#' @aliases max_cardinality
#' @param graph The input graph. It may be directed, but edge directions are
#'   ignored, as the algorithm is defined for undirected graphs.
#' @return A list with two components: \item{alpha}{Numeric vector. The
#'   1-based rank of each vertex in the graph such that the vertex with rank 1
#'   is visited first, the vertex with rank 2 is visited second and so on.}
#'   \item{alpham1}{Numeric vector. The inverse of `alpha`. In other words,
#'   the elements of this vector are the vertices in reverse maximum cardinality
#'   search order.}
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @seealso [is_chordal()]
#' @references Robert E Tarjan and Mihalis Yannakakis. (1984). Simple
#' linear-time algorithms to test chordality of graphs, test acyclicity of
#' hypergraphs, and selectively reduce acyclic hypergraphs.  *SIAM Journal
#' of Computation* 13, 566--579.
#' @keywords graphs
#' @export
#' @examples
#'
#' ## The examples from the Tarjan-Yannakakis paper
#' g1 <- graph_from_literal(
#'   A - B:C:I, B - A:C:D, C - A:B:E:H, D - B:E:F,
#'   E - C:D:F:H, F - D:E:G, G - F:H, H - C:E:G:I,
#'   I - A:H
#' )
#' max_cardinality(g1)
#' is_chordal(g1, fillin = TRUE)
#'
#' g2 <- graph_from_literal(
#'   A - B:E, B - A:E:F:D, C - E:D:G, D - B:F:E:C:G,
#'   E - A:B:C:D:F, F - B:D:E, G - C:D:H:I, H - G:I:J,
#'   I - G:H:J, J - H:I
#' )
#' max_cardinality(g2)
#' is_chordal(g2, fillin = TRUE)
#' @family chordal
#' @cdocs igraph_maximum_cardinality_search
max_cardinality <- maximum_cardinality_search_impl


#' Eccentricity of the vertices in a graph
#'
#' The eccentricity of a vertex is its shortest path distance from the farthest
#' other node in the graph.
#'
#' The eccentricity of a vertex is calculated by measuring the shortest
#' distance from (or to) the vertex, to (or from) all vertices in the graph,
#' and taking the maximum.
#'
#' This implementation ignores vertex pairs that are in different components.
#' Isolate vertices have eccentricity zero.
#'
#' @param graph The input graph, it can be directed or undirected.
#' @param vids The vertices for which the eccentricity is calculated.
#' @inheritParams distances
#' @inheritParams rlang::args_dots_empty
#' @return `eccentricity()` returns a numeric vector, containing the
#'   eccentricity score of each given vertex.
#' @seealso [radius()] for a related concept,
#'   [distances()] for general shortest path calculations.
#' @references Harary, F. Graph Theory. Reading, MA: Addison-Wesley, p. 35,
#' 1994.
#' @examples
#' g <- make_star(10, mode = "undirected")
#' eccentricity(g)
#' @family paths
#' @export
#' @cdocs igraph_eccentricity_dijkstra
eccentricity <- function(graph, vids = V(graph), ..., weights = NULL, mode = c("all", "out", "in", "total")) {
    if (...length() > 0) {
    lifecycle::deprecate_soft(
      "2.1.0",
      "eccentricity(... =)",
      details = "The argument `mode` must be named."
    )

    rlang::check_dots_unnamed()

    dots <- list(...)

    if (missing(mode) && length(dots) > 0) {
      mode <- dots[[1]]
    }
  }

  eccentricity_dijkstra_impl(graph, vids = vids, weights = weights, mode = mode)
}


#' Radius of a graph
#'
#' The eccentricity of a vertex is its distance from the farthest other node
#' in the graph. The smallest eccentricity in a graph is called its radius.
#'
#' The eccentricity of a vertex is calculated by measuring the shortest
#' distance from (or to) the vertex, to (or from) all vertices in the
#' graph, and taking the maximum.
#'
#' This implementation ignores vertex pairs that are in different
#' components. Isolated vertices have eccentricity zero.
#'
#' @param graph The input graph, it can be directed or undirected.
#' @inheritParams eccentricity
#' @inheritParams rlang::args_dots_empty
#' @return A numeric scalar, the radius of the graph.
#' @seealso [eccentricity()] for the underlying
#'   calculations, [distances] for general shortest path
#'   calculations.
#' @references Harary, F. Graph Theory. Reading, MA: Addison-Wesley, p. 35,
#' 1994.
#' @examples
#' g <- make_star(10, mode = "undirected")
#' eccentricity(g)
#' radius(g)
#' @family paths
#' @export
#' @cdocs igraph_radius_dijkstra
radius <- function(graph, ..., weights = NULL, mode = c("all", "out", "in", "total")) {
  if (...length() > 0) {
    lifecycle::deprecate_soft(
      "2.1.0",
      "radius(... =)",
      details = "The argument `mode` must be named."
    )

    rlang::check_dots_unnamed()

    dots <- list(...)

    if (missing(mode) && length(dots) > 0) {
      mode <- dots[[1]]
    }
  }

  radius_dijkstra_impl(graph, weights = weights, mode = mode)
}

#' Central vertices of a graph
#'
#' @description
#' `r lifecycle::badge("experimental")`
#'
#' The center of a graph is the set of its vertices with minimal eccentricity.
#'
#' @inheritParams eccentricity
#' @inheritParams rlang::args_dots_empty
#' @return The vertex IDs of the central vertices.
#' @seealso [eccentricity()], [radius()]
#' @family paths
#' @examples
#' tree <- make_tree(100, 7)
#' graph_center(tree)
#' graph_center(tree, mode = "in")
#' graph_center(tree, mode = "out")
#'
#' # Without and with weights
#' ring <- make_ring(10)
#' graph_center(ring)
#' # Add weights
#' E(ring)$weight <- seq_len(ecount(ring))
#' graph_center(ring)
#'
#' @export
#' @cdocs igraph_graph_center_dijkstra
graph_center <- graph_center_dijkstra_impl

#' @rdname distances
#' @param directed Whether to consider directed paths in directed graphs,
#'   this argument is ignored for undirected graphs.
#' @export
#' @cdocs igraph_path_length_hist
distance_table <- path_length_hist_impl
