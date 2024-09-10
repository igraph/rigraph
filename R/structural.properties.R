
#' Shortest (directed or undirected) paths between vertices
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `get.shortest.paths()` was renamed to `shortest_paths()` to create a more
#' consistent API.
#' @inheritParams shortest_paths
#' @keywords internal
#' @export
get.shortest.paths <- function(graph, from, to = V(graph), mode = c("out", "all", "in"), weights = NULL, output = c("vpath", "epath", "both"), predecessors = FALSE, inbound.edges = FALSE, algorithm = c("automatic", "unweighted", "dijkstra", "bellman-ford")) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "get.shortest.paths()", "shortest_paths()")
  shortest_paths(graph = graph, from = from, to = to, mode = mode, weights = weights, output = output, predecessors = predecessors, inbound.edges = inbound.edges, algorithm = algorithm)
} # nocov end

#' Shortest (directed or undirected) paths between vertices
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `get.all.shortest.paths()` was renamed to `all_shortest_paths()` to create a more
#' consistent API.
#' @inheritParams all_shortest_paths
#' @keywords internal
#' @export
get.all.shortest.paths <- function(graph, from, to = V(graph), mode = c("out", "all", "in"), weights = NULL) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "get.all.shortest.paths()", "all_shortest_paths()")
  all_shortest_paths(graph = graph, from = from, to = to, mode = mode, weights = weights)
} # nocov end

#' Diameter of a graph
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `get.diameter()` was renamed to `get_diameter()` to create a more
#' consistent API.
#' @inheritParams get_diameter
#' @keywords internal
#' @export
get.diameter <- function(graph, directed = TRUE, unconnected = TRUE, weights = NULL) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "get.diameter()", "get_diameter()")
  get_diameter(graph = graph, directed = directed, unconnected = unconnected, weights = weights)
} # nocov end

#' Convert a general graph into a forest
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `unfold.tree()` was renamed to `unfold_tree()` to create a more
#' consistent API.
#' @inheritParams unfold_tree
#' @keywords internal
#' @export
unfold.tree <- function(graph, mode = c("all", "out", "in", "total"), roots) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "unfold.tree()", "unfold_tree()")
  unfold_tree(graph = graph, mode = mode, roots = roots)
} # nocov end

#' Topological sorting of vertices in a graph
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `topological.sort()` was renamed to `topo_sort()` to create a more
#' consistent API.
#' @inheritParams topo_sort
#' @keywords internal
#' @export
topological.sort <- function(graph, mode = c("out", "all", "in")) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "topological.sort()", "topo_sort()")
  topo_sort(graph = graph, mode = mode)
} # nocov end

#' Shortest (directed or undirected) paths between vertices
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `shortest.paths()` was renamed to `distances()` to create a more
#' consistent API.
#' @inheritParams distances
#' @keywords internal
#' @export
shortest.paths <- function(graph, v = V(graph), to = V(graph), mode = c("all", "out", "in"), weights = NULL, algorithm = c("automatic", "unweighted", "dijkstra", "bellman-ford", "johnson")) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "shortest.paths()", "distances()")
  algorithm <- igraph.match.arg(algorithm)
  mode <- igraph.match.arg(mode)
  distances(graph = graph, v = v, to = to, mode = mode, weights = weights, algorithm = algorithm)
} # nocov end

#' Neighborhood of graph vertices
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `neighborhood.size()` was renamed to `ego_size()` to create a more
#' consistent API.
#' @inheritParams ego_size
#' @keywords internal
#' @export
neighborhood.size <- function(graph, order = 1, nodes = V(graph), mode = c("all", "out", "in"), mindist = 0) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "neighborhood.size()", "ego_size()")
  ego_size(graph = graph, order = order, nodes = nodes, mode = mode, mindist = mindist)
} # nocov end

#' Matching
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `maximum.bipartite.matching()` was renamed to `max_bipartite_match()` to create a more
#' consistent API.
#' @inheritParams max_bipartite_match
#' @keywords internal
#' @export
maximum.bipartite.matching <- function(graph, types = NULL, weights = NULL, eps = .Machine$double.eps) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "maximum.bipartite.matching()", "max_bipartite_match()")
  max_bipartite_match(graph = graph, types = types, weights = weights, eps = eps)
} # nocov end

#' Find mutual edges in a directed graph
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `is.mutual()` was renamed to `which_mutual()` to create a more
#' consistent API.
#' @inheritParams which_mutual
#' @keywords internal
#' @export
is.mutual <- function(graph, eids = E(graph), loops = TRUE) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "is.mutual()", "which_mutual()")
  which_mutual(graph = graph, eids = eids, loops = loops)
} # nocov end

#' Find the multiple or loop edges in a graph
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `is.multiple()` was renamed to `which_multiple()` to create a more
#' consistent API.
#' @inheritParams which_multiple
#' @keywords internal
#' @export
is.multiple <- function(graph, eids = E(graph)) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "is.multiple()", "which_multiple()")
  which_multiple(graph = graph, eids = eids)
} # nocov end

#' Matching
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `is.maximal.matching()` was renamed to `is_max_matching()` to create a more
#' consistent API.
#' @inheritParams is_max_matching
#' @keywords internal
#' @export
is.maximal.matching <- function(graph, matching, types = NULL) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "is.maximal.matching()", "is_max_matching()")
  is_max_matching(graph = graph, matching = matching, types = types)
} # nocov end

#' Matching
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `is.matching()` was renamed to `is_matching()` to create a more
#' consistent API.
#' @inheritParams is_matching
#' @keywords internal
#' @export
is.matching <- function(graph, matching, types = NULL) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "is.matching()", "is_matching()")
  is_matching(graph = graph, matching = matching, types = types)
} # nocov end

#' Find the multiple or loop edges in a graph
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `is.loop()` was renamed to `which_loop()` to create a more
#' consistent API.
#' @inheritParams which_loop
#' @keywords internal
#' @export
is.loop <- function(graph, eids = E(graph)) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "is.loop()", "which_loop()")
  which_loop(graph = graph, eids = eids)
} # nocov end

#' Connected components of a graph
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `is.connected()` was renamed to `is_connected()` to create a more
#' consistent API.
#' @inheritParams is_connected
#' @keywords internal
#' @export
is.connected <- function(graph, mode = c("weak", "strong")) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "is.connected()", "is_connected()")
  is_connected(graph = graph, mode = mode)
} # nocov end

#' Subgraph of a graph
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `induced.subgraph()` was renamed to `induced_subgraph()` to create a more
#' consistent API.
#' @inheritParams induced_subgraph
#' @keywords internal
#' @export
induced.subgraph <- function(graph, vids, impl = c("auto", "copy_and_delete", "create_from_scratch")) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "induced.subgraph()", "induced_subgraph()")
  induced_subgraph(graph = graph, vids = vids, impl = impl)
} # nocov end

#' Find the multiple or loop edges in a graph
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `has.multiple()` was renamed to `any_multiple()` to create a more
#' consistent API.
#' @inheritParams any_multiple
#' @keywords internal
#' @export
has.multiple <- function(graph) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "has.multiple()", "any_multiple()")
  any_multiple(graph = graph)
} # nocov end

#' Neighborhood of graph vertices
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `graph.neighborhood()` was renamed to `make_ego_graph()` to create a more
#' consistent API.
#' @inheritParams make_ego_graph
#' @keywords internal
#' @export
graph.neighborhood <- function(graph, order = 1, nodes = V(graph), mode = c("all", "out", "in"), mindist = 0) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "graph.neighborhood()", "make_ego_graph()")
  make_ego_graph(graph = graph, order = order, nodes = nodes, mode = mode, mindist = mindist)
} # nocov end

#' Graph Laplacian
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `graph.laplacian()` was renamed to `laplacian_matrix()` to create a more
#' consistent API.
#' @inheritParams laplacian_matrix
#' @keywords internal
#' @export
graph.laplacian <- function(graph, normalized = FALSE, weights = NULL, sparse = igraph_opt("sparsematrices")) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "graph.laplacian()", "laplacian_matrix()")
  laplacian_matrix(graph = graph, normalized = normalized, weights = weights, sparse = sparse)
} # nocov end

#' Average nearest neighbor degree
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `graph.knn()` was renamed to `knn()` to create a more
#' consistent API.
#' @inheritParams knn
#' @keywords internal
#' @export
graph.knn <- function(graph, vids = V(graph), mode = c("all", "out", "in", "total"), neighbor.degree.mode = c("all", "out", "in", "total"), weights = NULL) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "graph.knn()", "knn()")
  knn(graph = graph, vids = vids, mode = mode, neighbor.degree.mode = neighbor.degree.mode, weights = weights)
} # nocov end

#' Depth-first search
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `graph.dfs()` was renamed to `dfs()` to create a more
#' consistent API.
#' @inheritParams dfs
#' @keywords internal
#' @export
graph.dfs <- function(graph, root, mode = c("out", "in", "all", "total"), unreachable = TRUE, order = TRUE, order.out = FALSE, father = FALSE, dist = FALSE, in.callback = NULL, out.callback = NULL, extra = NULL, rho = parent.frame(), neimode) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "graph.dfs()", "dfs()")
  dfs(graph = graph, root = root, mode = mode, unreachable = unreachable, order = order, order.out = order.out, father = father, dist = dist, in.callback = in.callback, out.callback = out.callback, extra = extra, rho = rho, neimode = neimode)
} # nocov end

#' Graph density
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `graph.density()` was renamed to `edge_density()` to create a more
#' consistent API.
#' @inheritParams edge_density
#' @keywords internal
#' @export
graph.density <- function(graph, loops = FALSE) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "graph.density()", "edge_density()")
  edge_density(graph = graph, loops = loops)
} # nocov end

#' K-core decomposition of graphs
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `graph.coreness()` was renamed to `coreness()` to create a more
#' consistent API.
#' @inheritParams coreness
#' @keywords internal
#' @export
graph.coreness <- function(graph, mode = c("all", "out", "in")) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "graph.coreness()", "coreness()")
  coreness(graph = graph, mode = mode)
} # nocov end

#' Breadth-first search
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `graph.bfs()` was renamed to `bfs()` to create a more
#' consistent API.
#' @inheritParams bfs
#' @keywords internal
#' @export
graph.bfs <- function(graph, root, mode = c("out", "in", "all", "total"), unreachable = TRUE, restricted = NULL, order = TRUE, rank = FALSE, father = FALSE, pred = FALSE, succ = FALSE, dist = FALSE, callback = NULL, extra = NULL, rho = parent.frame(), neimode) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "graph.bfs()", "bfs()")
  bfs(graph = graph, root = root, mode = mode, unreachable = unreachable, restricted = restricted, order = order, rank = rank, father = father, pred = pred, succ = succ, dist = dist, callback = callback, extra = extra, rho = rho, neimode = neimode)
} # nocov end

#' Diameter of a graph
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `farthest.nodes()` was renamed to `farthest_vertices()` to create a more
#' consistent API.
#' @inheritParams farthest_vertices
#' @keywords internal
#' @export
farthest.nodes <- function(graph, directed = TRUE, unconnected = TRUE, weights = NULL) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "farthest.nodes()", "farthest_vertices()")
  farthest_vertices(graph = graph, directed = directed, unconnected = unconnected, weights = weights)
} # nocov end

#' Degree and degree distribution of the vertices
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `degree.distribution()` was renamed to `degree_distribution()` to create a more
#' consistent API.
#' @inheritParams degree_distribution
#' @keywords internal
#' @export
degree.distribution <- function(graph, cumulative = FALSE, ...) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "degree.distribution()", "degree_distribution()")
  degree_distribution(graph = graph, cumulative = cumulative, ...)
} # nocov end

#' Find the multiple or loop edges in a graph
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `count.multiple()` was renamed to `count_multiple()` to create a more
#' consistent API.
#' @inheritParams count_multiple
#' @keywords internal
#' @export
count.multiple <- function(graph, eids = E(graph)) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "count.multiple()", "count_multiple()")
  count_multiple(graph = graph, eids = eids)
} # nocov end

#' Connected components of a graph
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `clusters()` was renamed to `components()` to create a more
#' consistent API.
#' @inheritParams components
#' @keywords internal
#' @export
clusters <- function(graph, mode = c("weak", "strong")) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "clusters()", "components()")
  components(graph = graph, mode = mode)
} # nocov end

#' Shortest (directed or undirected) paths between vertices
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `average.path.length()` was renamed to `mean_distance()` to create a more
#' consistent API.
#' @inheritParams mean_distance
#' @keywords internal
#' @export
average.path.length <- function(graph, weights = NULL, directed = TRUE, unconnected = TRUE, details = FALSE) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "average.path.length()", "mean_distance()")
  mean_distance(graph = graph, weights = weights, directed = directed, unconnected = unconnected, details = details)
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
# Structural properties
###################################################################



#' Diameter of a graph
#'
#' The diameter of a graph is the length of the longest geodesic.
#'
#' The diameter is calculated by using a breadth-first search like method.
#'
#' `get_diameter()` returns a path with the actual diameter. If there are
#' many shortest paths of the length of the diameter, then it returns the first
#' one found.
#'
#' `farthest_vertices()` returns two vertex ids, the vertices which are
#' connected by the diameter path.
#'
#' @param graph The graph to analyze.
#' @param directed Logical, whether directed or undirected paths are to be
#'   considered. This is ignored for undirected graphs.
#' @param unconnected Logical, what to do if the graph is unconnected. If
#'   FALSE, the function will return a number that is one larger the largest
#'   possible diameter, which is always the number of vertices. If TRUE, the
#'   diameters of the connected components will be calculated and the largest one
#'   will be returned.
#' @param weights Optional positive weight vector for calculating weighted
#'   distances. If the graph has a `weight` edge attribute, then this is
#'   used by default.
#' @return A numeric constant for `diameter()`, a numeric vector for
#'   `get_diameter()`. `farthest_vertices()` returns a list with two
#'   entries: \itemize{
#'   \item `vertices` The two vertices that are the farthest.
#'   \item `distance` Their distance.
#'   }
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @seealso [distances()]
#' @family paths
#' @export
#' @keywords graphs
#' @examples
#'
#' g <- make_ring(10)
#' g2 <- delete_edges(g, c(1, 2, 1, 10))
#' diameter(g2, unconnected = TRUE)
#' diameter(g2, unconnected = FALSE)
#'
#' ## Weighted diameter
#' set.seed(1)
#' g <- make_ring(10)
#' E(g)$weight <- sample(seq_len(ecount(g)))
#' diameter(g)
#' get_diameter(g)
#' diameter(g, weights = NA)
#' get_diameter(g, weights = NA)
#'
diameter <- function(graph, directed = TRUE, unconnected = TRUE, weights = NULL) {
  ensure_igraph(graph)

  if (is.null(weights) && "weight" %in% edge_attr_names(graph)) {
    weights <- E(graph)$weight
  }
  if (!is.null(weights) && any(!is.na(weights))) {
    weights <- as.numeric(weights)
  } else {
    weights <- NULL
  }

  on.exit(.Call(R_igraph_finalizer))
  .Call(
    R_igraph_diameter, graph, as.logical(directed),
    as.logical(unconnected), weights
  )
}

#' @rdname diameter
#' @export
get_diameter <- function(graph, directed = TRUE, unconnected = TRUE,
                         weights = NULL) {
  ensure_igraph(graph)

  if (is.null(weights) && "weight" %in% edge_attr_names(graph)) {
    weights <- E(graph)$weight
  }
  if (!is.null(weights) && any(!is.na(weights))) {
    weights <- as.numeric(weights)
  } else {
    weights <- NULL
  }

  on.exit(.Call(R_igraph_finalizer))
  res <- .Call(
    R_igraph_get_diameter, graph, as.logical(directed),
    as.logical(unconnected), weights
  ) + 1L

  if (igraph_opt("return.vs.es")) {
    res <- create_vs(graph, res)
  }

  res
}

#' @rdname diameter
#' @export
farthest_vertices <- function(graph, directed = TRUE, unconnected = TRUE,
                              weights = NULL) {
  ensure_igraph(graph)

  if (is.null(weights) && "weight" %in% edge_attr_names(graph)) {
    weights <- E(graph)$weight
  }
  if (!is.null(weights) && any(!is.na(weights))) {
    weights <- as.numeric(weights)
  } else {
    weights <- NULL
  }

  on.exit(.Call(R_igraph_finalizer))
  res <- .Call(
    R_igraph_farthest_points, graph, as.logical(directed),
    as.logical(unconnected), weights
  )
  res <- list(vertices = res[1:2] + 1L, distance = res[3])

  if (igraph_opt("return.vs.es")) {
    res$vertices <- create_vs(graph, res$vertices)
  }

  res
}

#' @export
#' @rdname distances
#' @cdocs igraph_average_path_length_dijkstra
mean_distance <- average_path_length_dijkstra_impl



#' Degree and degree distribution of the vertices
#'
#' The degree of a vertex is its most basic structural property, the number of
#' its adjacent edges.
#'
#'
#' @param graph The graph to analyze.
#' @param v The ids of vertices of which the degree will be calculated.
#' @param mode Character string, \dQuote{out} for out-degree, \dQuote{in} for
#'   in-degree or \dQuote{total} for the sum of the two. For undirected graphs
#'   this argument is ignored. \dQuote{all} is a synonym of \dQuote{total}.
#' @param loops Logical; whether the loop edges are also counted.
#' @param normalized Logical scalar, whether to normalize the degree.  If
#'   `TRUE` then the result is divided by \eqn{n-1}, where \eqn{n} is the
#'   number of vertices in the graph.
#' @inheritParams rlang::args_dots_empty
#' @return For `degree()` a numeric vector of the same length as argument
#'   `v`.
#'
#'   For `degree_distribution()` a numeric vector of the same length as the
#'   maximum degree plus one. The first element is the relative frequency zero
#'   degree vertices, the second vertices with degree one, etc.
#'
#'   For `max_degree()`, the largest degree in the graph. When no vertices are
#'   selected, or when the input is the null graph, zero is returned as this
#'   is the smallest possible degree.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @keywords graphs
#' @family structural.properties
#' @export
#' @examples
#'
#' g <- make_ring(10)
#' degree(g)
#' g2 <- sample_gnp(1000, 10 / 1000)
#' max_degree(g2)
#' degree_distribution(g2)
#'
degree <- function(graph, v = V(graph),
                   mode = c("all", "out", "in", "total"), loops = TRUE,
                   normalized = FALSE) {
  ensure_igraph(graph)
  v <- as_igraph_vs(graph, v)
  mode <- igraph.match.arg(mode)
  mode <- switch(mode,
    "out" = 1,
    "in" = 2,
    "all" = 3,
    "total" = 3
  )

  on.exit(.Call(R_igraph_finalizer))
  res <- .Call(
    R_igraph_degree, graph, v - 1,
    as.numeric(mode), as.logical(loops)
  )
  if (normalized) {
    res <- res / (vcount(graph) - 1)
  }
  if (igraph_opt("add.vertex.names") && is_named(graph)) {
    names(res) <- V(graph)$name[v]
  }
  res
}

#' @rdname degree
#' @export
#' @cdocs igraph_maxdegree
max_degree <- maxdegree_impl

#' @rdname degree
#' @param cumulative Logical; whether the cumulative degree distribution is to
#'   be calculated.
#' @export
#' @importFrom graphics hist
degree_distribution <- function(graph, cumulative = FALSE, ...) {
  ensure_igraph(graph)
  cs <- degree(graph, ...)
  hi <- hist(cs, -1:max(cs), plot = FALSE)$density
  if (!cumulative) {
    res <- hi
  } else {
    res <- rev(cumsum(rev(hi)))
  }

  res
}



#' Shortest (directed or undirected) paths between vertices
#'
#' `distances()` calculates the length of all the shortest paths from
#' or to the vertices in the network. `shortest_paths()` calculates one
#' shortest path (the path itself, and not just its length) from or to the
#' given vertex.
#'
#' The shortest path, or geodesic between two pair of vertices is a path with
#' the minimal number of vertices. The functions documented in this manual page
#' all calculate shortest paths between vertex pairs.
#'
#' `distances()` calculates the lengths of pairwise shortest paths from
#' a set of vertices (`from`) to another set of vertices (`to`). It
#' uses different algorithms, depending on the `algorithm` argument and
#' the `weight` edge attribute of the graph. The implemented algorithms
#' are breadth-first search (\sQuote{`unweighted`}), this only works for
#' unweighted graphs; the Dijkstra algorithm (\sQuote{`dijkstra`}), this
#' works for graphs with non-negative edge weights; the Bellman-Ford algorithm
#' (\sQuote{`bellman-ford`}); Johnson's algorithm
#' (\sQuote{`johnson`}); and a faster version of the Floyd-Warshall algorithm
#' with expected quadratic running time (\sQuote{`floyd-warshall`}). The latter
#' three algorithms work with arbitrary
#' edge weights, but (naturally) only for graphs that don't have a negative
#' cycle. Note that a negative-weight edge in an undirected graph implies
#' such a cycle. Johnson's algorithm performs better than the Bellman-Ford
#' one when many source (and target) vertices are given, with all-pairs
#' shortest path length calculations being the typical use case.
#'
#' igraph can choose automatically between algorithms, and chooses the most
#' efficient one that is appropriate for the supplied weights (if any). For
#' automatic algorithm selection, supply \sQuote{`automatic`} as the
#' `algorithm` argument. (This is also the default.)
#'
#' `shortest_paths()` calculates a single shortest path (i.e. the path
#' itself, not just its length) between the source vertex given in `from`,
#' to the target vertices given in `to`. `shortest_paths()` uses
#' breadth-first search for unweighted graphs and Dijkstra's algorithm for
#' weighted graphs. The latter only works if the edge weights are non-negative.
#'
#' `all_shortest_paths()` calculates *all* shortest paths between
#' pairs of vertices, including several shortest paths of the same length.
#' More precisely, it computerd all shortest path starting at `from`, and
#' ending at any vertex given in `to`. It uses a breadth-first search for
#' unweighted graphs and Dijkstra's algorithm for weighted ones. The latter
#' only supports non-negative edge weights. Caution: in multigraphs, the
#' result size is exponentially large in the number of vertex pairs with
#' multiple edges between them.
#'
#' `mean_distance()` calculates the average path length in a graph, by
#' calculating the shortest paths between all pairs of vertices (both ways for
#' directed graphs). It uses a breadth-first search for unweighted graphs and
#' Dijkstra's algorithm for weighted ones. The latter only supports non-negative
#' edge weights.
#'
#' `distance_table()` calculates a histogram, by calculating the shortest
#' path length between each pair of vertices. For directed graphs both
#' directions are considered, so every pair of vertices appears twice in the
#' histogram.
#'
#' @param graph The graph to work on.
#' @param v Numeric vector, the vertices from which the shortest paths will be
#'   calculated.
#' @param to Numeric vector, the vertices to which the shortest paths will be
#'   calculated. By default it includes all vertices. Note that for
#'   `distances()` every vertex must be included here at most once. (This
#'   is not required for `shortest_paths()`.
#' @param mode Character constant, gives whether the shortest paths to or from
#'   the given vertices should be calculated for directed graphs. If `out`
#'   then the shortest paths *from* the vertex, if `in` then *to*
#'   it will be considered. If `all`, the default, then the graph is treated
#'   as undirected, i.e. edge directions are not taken into account. This
#'   argument is ignored for undirected graphs.
#' @param weights Possibly a numeric vector giving edge weights. If this is
#'   `NULL` and the graph has a `weight` edge attribute, then the
#'   attribute is used. If this is `NA` then no weights are used (even if
#'   the graph has a `weight` attribute). In a weighted graph, the length
#'   of a path is the sum of the weights of its constituent edges.
#' @param algorithm Which algorithm to use for the calculation. By default
#'   igraph tries to select the fastest suitable algorithm. If there are no
#'   weights, then an unweighted breadth-first search is used, otherwise if all
#'   weights are positive, then Dijkstra's algorithm is used. If there are
#'   negative weights and we do the calculation for more than 100 sources, then
#'   Johnson's algorithm is used. Otherwise the Bellman-Ford algorithm is used.
#'   You can override igraph's choice by explicitly giving this parameter. Note
#'   that the igraph C core might still override your choice in obvious cases,
#'   i.e. if there are no edge weights, then the unweighted algorithm will be
#'   used, regardless of this argument.
#' @param details Whether to provide additional details in the result.
#'   Functions accepting this argument (like `mean_distance()`) return
#'   additional information like the number of disconnected vertex pairs in
#'   the result when this parameter is set to `TRUE`.
#' @param unconnected What to do if the graph is unconnected (not
#'   strongly connected if directed paths are considered). If TRUE, only
#'   the lengths of the existing paths are considered and averaged; if
#'   FALSE, the length of the missing paths are considered as having infinite
#'   length, making the mean distance infinite as well.
#' @return For `distances()` a numeric matrix with `length(to)`
#'   columns and `length(v)` rows. The shortest path length from a vertex to
#'   itself is always zero. For unreachable vertices `Inf` is included.
#'
#'   For `shortest_paths()` a named list with four entries is returned:
#'   \item{vpath}{This itself is a list, of length `length(to)`; list
#'   element `i` contains the vertex ids on the path from vertex `from`
#'   to vertex `to[i]` (or the other way for directed graphs depending on
#'   the `mode` argument). The vector also contains `from` and `i`
#'   as the first and last elements. If `from` is the same as `i` then
#'   it is only included once. If there is no path between two vertices then a
#'   numeric vector of length zero is returned as the list element. If this
#'   output is not requested in the `output` argument, then it will be
#'   `NULL`.} \item{epath}{This is a list similar to `vpath`, but the
#'   vectors of the list contain the edge ids along the shortest paths, instead
#'   of the vertex ids. This entry is set to `NULL` if it is not requested
#'   in the `output` argument.} \item{predecessors}{Numeric vector, the
#'   predecessor of each vertex in the `to` argument, or `NULL` if it
#'   was not requested.} \item{inbound_edges}{Numeric vector, the inbound edge
#'   for each vertex, or `NULL`, if it was not requested.}
#'
#'   For `all_shortest_paths()` a list is returned, each list element
#'   contains a shortest path from `from` to a vertex in `to`. The
#'   shortest paths to the same vertex are collected into consecutive elements
#'   of the list.
#'
#'   For `mean_distance()` a single number is returned if `details=FALSE`,
#'   or a named list with two entries: `res` is the mean distance as a numeric
#'   scalar and `unconnected` is the number of unconnected vertex pairs,
#'   also as a numeric scalar.
#'
#'   `distance_table()` returns a named list with two entries: `res` is
#'   a numeric vector, the histogram of distances, `unconnected` is a
#'   numeric scalar, the number of pairs for which the first vertex is not
#'   reachable from the second. In undirected and directed graphs, unorderde
#'   and ordered pairs are considered, respectively. Therefore the sum of the
#'   two entries is always \eqn{n(n-1)} for directed graphs and \eqn{n(n-1)/2}
#'   for undirected graphs.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @references West, D.B. (1996). *Introduction to Graph Theory.* Upper
#' Saddle River, N.J.: Prentice Hall.
#' @family structural.properties
#' @family paths
#' @export
#' @keywords graphs
#' @examples
#'
#' g <- make_ring(10)
#' distances(g)
#' shortest_paths(g, 5)
#' all_shortest_paths(g, 1, 6:8)
#' mean_distance(g)
#' ## Weighted shortest paths
#' el <- matrix(
#'   ncol = 3, byrow = TRUE,
#'   c(
#'     1, 2, 0,
#'     1, 3, 2,
#'     1, 4, 1,
#'     2, 3, 0,
#'     2, 5, 5,
#'     2, 6, 2,
#'     3, 2, 1,
#'     3, 4, 1,
#'     3, 7, 1,
#'     4, 3, 0,
#'     4, 7, 2,
#'     5, 6, 2,
#'     5, 8, 8,
#'     6, 3, 2,
#'     6, 7, 1,
#'     6, 9, 1,
#'     6, 10, 3,
#'     8, 6, 1,
#'     8, 9, 1,
#'     9, 10, 4
#'   )
#' )
#' g2 <- add_edges(make_empty_graph(10), t(el[, 1:2]), weight = el[, 3])
#' distances(g2, mode = "out")
#'
distances <- function(graph, v = V(graph), to = V(graph),
                      mode = c("all", "out", "in"),
                      weights = NULL,
                      algorithm = c(
                        "automatic", "unweighted", "dijkstra",
                        "bellman-ford", "johnson", "floyd-warshall"
                      )) {
  ensure_igraph(graph)

  # make sure that the lower-level function in C gets mode == "out"
  # unconditionally when the graph is undirected; this is used for
  # the selection of Johnson's algorithm in automatic mode
  if (!is_directed(graph)) {
    mode <- "out"
  }

  v <- as_igraph_vs(graph, v)
  to <- as_igraph_vs(graph, to)
  mode <- igraph.match.arg(mode)
  mode <- switch(mode,
    "out" = 1,
    "in" = 2,
    "all" = 3
  )
  algorithm <- igraph.match.arg(algorithm)
  algorithm <- switch(algorithm,
    "automatic" = 0,
    "unweighted" = 1,
    "dijkstra" = 2,
    "bellman-ford" = 3,
    "johnson" = 4,
    "floyd-warshall" = 5
  )

  if (is.null(weights)) {
    if ("weight" %in% edge_attr_names(graph)) {
      weights <- as.numeric(E(graph)$weight)
    }
  } else {
    if (length(weights) == 1 && is.na(weights)) {
      weights <- NULL
    } else {
      weights <- as.numeric(weights)
    }
  }

  if (!is.null(weights) && algorithm == 1) {
    weights <- NULL
    warning("Unweighted algorithm chosen, weights ignored")
  }

  on.exit(.Call(R_igraph_finalizer))
  res <- .Call(
    R_igraph_shortest_paths, graph, v - 1, to - 1,
    as.numeric(mode), weights, as.numeric(algorithm)
  )

  if (igraph_opt("add.vertex.names") && is_named(graph)) {
    rownames(res) <- V(graph)$name[v]
    colnames(res) <- V(graph)$name[to]
  }
  res
}

#' @rdname distances
#' @param from Numeric constant, the vertex from or to the shortest paths will
#'   be calculated. Note that right now this is not a vector of vertex ids, but
#'   only a single vertex.
#' @param output Character scalar, defines how to report the shortest paths.
#'   \dQuote{vpath} means that the vertices along the paths are reported, this
#'   form was used prior to igraph version 0.6. \dQuote{epath} means that the
#'   edges along the paths are reported. \dQuote{both} means that both forms are
#'   returned, in a named list with components \dQuote{vpath} and \dQuote{epath}.
#' @param predecessors Logical scalar, whether to return the predecessor vertex
#'   for each vertex. The predecessor of vertex `i` in the tree is the
#'   vertex from which vertex `i` was reached. The predecessor of the start
#'   vertex (in the `from` argument) is itself by definition. If the
#'   predecessor is zero, it means that the given vertex was not reached from the
#'   source during the search. Note that the search terminates if all the
#'   vertices in `to` are reached.
#' @param inbound.edges Logical scalar, whether to return the inbound edge for
#'   each vertex. The inbound edge of vertex `i` in the tree is the edge via
#'   which vertex `i` was reached. The start vertex and vertices that were
#'   not reached during the search will have zero in the corresponding entry of
#'   the vector. Note that the search terminates if all the vertices in `to`
#'   are reached.
#' @export
shortest_paths <- function(graph, from, to = V(graph),
                           mode = c("out", "all", "in"),
                           weights = NULL,
                           output = c("vpath", "epath", "both"),
                           predecessors = FALSE, inbound.edges = FALSE,
                           algorithm = c("automatic", "unweighted", "dijkstra", "bellman-ford")) {
  ensure_igraph(graph)
  mode <- igraph.match.arg(mode)
  mode <- switch(mode,
    "out" = 1,
    "in" = 2,
    "all" = 3
  )
  output <- igraph.match.arg(output)
  output <- switch(output,
    "vpath" = 0,
    "epath" = 1,
    "both" = 2
  )
  algorithm <- igraph.match.arg(algorithm)
  algorithm <- switch(algorithm,
    "automatic" = 0,
    "unweighted" = 1,
    "dijkstra" = 2,
    "bellman-ford" = 3
  )

  if (is.null(weights)) {
    if ("weight" %in% edge_attr_names(graph)) {
      weights <- as.numeric(E(graph)$weight)
    }
  } else {
    if (length(weights) == 1 && is.na(weights)) {
      weights <- NULL
    } else {
      weights <- as.numeric(weights)
    }
  }

  if (!is.null(weights) && algorithm == 1) {
    weights <- NULL
    warning("Unweighted algorithm chosen, weights ignored")
  }

  to <- as_igraph_vs(graph, to) - 1
  on.exit(.Call(R_igraph_finalizer))
  res <- .Call(
    R_igraph_get_shortest_paths, graph,
    as_igraph_vs(graph, from) - 1, to, as.numeric(mode),
    as.numeric(length(to)), weights, as.numeric(output),
    as.logical(predecessors), as.logical(inbound.edges),
    as.numeric(algorithm)
  )

  if (!is.null(res$vpath)) {
    res$vpath <- lapply(res$vpath, function(x) x + 1)
  }
  if (!is.null(res$epath)) {
    res$epath <- lapply(res$epath, function(x) x + 1)
  }
  if (!is.null(res$predecessors)) {
    res$predecessors <- res$predecessors + 1
  }
  if (!is.null(res$inbound_edges)) {
    res$inbound_edges <- res$inbound_edges + 1
  }

  if (igraph_opt("return.vs.es")) {
    if (!is.null(res$vpath)) {
      res$vpath <- lapply(res$vpath, unsafe_create_vs, graph = graph, verts = V(graph))
    }
    if (!is.null(res$epath)) {
      res$epath <- lapply(res$epath, unsafe_create_es, graph = graph, es = E(graph))
    }
    if (!is.null(res$predecessors)) {
      res$predecessors <- create_vs(res$predecessors,
        graph = graph,
        na_ok = TRUE
      )
    }
    if (!is.null(res$inbound_edges)) {
      res$inbound_edges <- create_es(res$inbound_edges,
        graph = graph,
        na_ok = TRUE
      )
    }
  }

  res
}

#' @export
#' @rdname distances
all_shortest_paths <- function(graph, from,
                               to = V(graph),
                               mode = c("out", "all", "in"),
                               weights = NULL) {
  ensure_igraph(graph)
  mode <- igraph.match.arg(mode)
  mode <- switch(mode,
    "out" = 1,
    "in" = 2,
    "all" = 3
  )

  if (is.null(weights)) {
    if ("weight" %in% edge_attr_names(graph)) {
      weights <- as.numeric(E(graph)$weight)
    }
  } else {
    if (length(weights) == 1 && is.na(weights)) {
      weights <- NULL
    } else {
      weights <- as.numeric(weights)
    }
  }

  on.exit(.Call(R_igraph_finalizer))
  if (is.null(weights)) {
    res <- .Call(
      R_igraph_get_all_shortest_paths, graph,
      as_igraph_vs(graph, from) - 1, as_igraph_vs(graph, to) - 1,
      as.numeric(mode)
    )
  } else {
    res <- .Call(
      R_igraph_get_all_shortest_paths_dijkstra, graph,
      as_igraph_vs(graph, from) - 1, as_igraph_vs(graph, to) - 1,
      weights, as.numeric(mode)
    )
  }

  if (igraph_opt("return.vs.es")) {
    res$vpaths <- lapply(res$vpaths, unsafe_create_vs, graph = graph, verts = V(graph))
  }

  # Transitional, eventually, remove $res
  res$res <- res$vpaths

  res
}

#' Find the \eqn{k} shortest paths between two vertices
#'
#' Finds the \eqn{k} shortest paths between the given source and target
#' vertex in order of increasing length. Currently this function uses
#' Yen's algorithm.
#'
#' @param graph The input graph.
#' @param from The source vertex of the shortest paths.
#' @param to The target vertex of the shortest paths.
#' @param k The number of paths to find. They will be returned in order of
#' increasing length.
#' @inheritParams rlang::args_dots_empty
#' @inheritParams shortest_paths
#' @return A named list with two components is returned:
#' \item{vpaths}{The list of \eqn{k} shortest paths in terms of vertices}
#' \item{epaths}{The list of \eqn{k} shortest paths in terms of edges}
#' @references Yen, Jin Y.:
#' An algorithm for finding shortest routes from all source nodes to a given
#' destination in general networks.
#' Quarterly of Applied Mathematics. 27 (4): 526–530. (1970)
#' \doi{10.1090/qam/253822}
#' @export
#' @family structural.properties
#' @seealso [shortest_paths()], [all_shortest_paths()]
#' @keywords graphs
#' @cdocs igraph_get_k_shortest_paths
k_shortest_paths <- get_k_shortest_paths_impl

#' In- or out- component of a vertex
#'
#' Finds all vertices reachable from a given vertex, or the opposite: all
#' vertices from which a given vertex is reachable via a directed path.
#'
#' A breadth-first search is conducted starting from vertex `v`.
#'
#' @param graph The graph to analyze.
#' @param v The vertex to start the search from.
#' @param mode Character string, either \dQuote{in}, \dQuote{out} or
#'   \dQuote{all}. If \dQuote{in} all vertices from which `v` is reachable
#'   are listed. If \dQuote{out} all vertices reachable from `v` are
#'   returned. If \dQuote{all} returns the union of these. It is ignored for
#'   undirected graphs.
#' @return Numeric vector, the ids of the vertices in the same component as
#'   `v`.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @seealso [components()]
#' @family structural.properties
#' @export
#' @keywords graphs
#' @examples
#'
#' g <- sample_gnp(100, 1 / 200)
#' subcomponent(g, 1, "in")
#' subcomponent(g, 1, "out")
#' subcomponent(g, 1, "all")
subcomponent <- function(graph, v, mode = c("all", "out", "in")) {
  ensure_igraph(graph)
  mode <- igraph.match.arg(mode)
  mode <- switch(mode,
    "out" = 1,
    "in" = 2,
    "all" = 3
  )

  on.exit(.Call(R_igraph_finalizer))
  res <- .Call(
    R_igraph_subcomponent, graph, as_igraph_vs(graph, v) - 1,
    as.numeric(mode)
  ) + 1L

  if (igraph_opt("return.vs.es")) res <- create_vs(graph, res)

  res
}

#' Subgraph of a graph
#'
#' `subgraph()` creates a subgraph of a graph, containing only the specified
#' vertices and all the edges among them.
#'
#' `induced_subgraph()` calculates the induced subgraph of a set of vertices
#' in a graph. This means that exactly the specified vertices and all the edges
#' between them will be kept in the result graph.
#'
#' `subgraph.edges()` calculates the subgraph of a graph. For this function
#' one can specify the vertices and edges to keep. This function will be
#' renamed to `subgraph()` in the next major version of igraph.
#'
#' The `subgraph()` function currently does the same as `induced_subgraph()`
#' (assuming \sQuote{`auto`} as the `impl` argument), but this behaviour
#' is deprecated. In the next major version, `subgraph()` will overtake the
#' functionality of `subgraph.edges()`.
#'
#' @aliases subgraph.edges
#' @param graph The original graph.
#' @return A new graph object.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @family structural.properties
#' @export
#' @keywords graphs
#' @examples
#'
#' g <- make_ring(10)
#' g2 <- induced_subgraph(g, 1:7)
#' g3 <- subgraph.edges(g, 1:5)
#'
subgraph <- function(graph, vids) {
  induced_subgraph(graph, vids)
}

#' @rdname subgraph
#' @param vids Numeric vector, the vertices of the original graph which will
#'   form the subgraph.
#' @param impl Character scalar, to choose between two implementation of the
#'   subgraph calculation. \sQuote{`copy_and_delete`} copies the graph
#'   first, and then deletes the vertices and edges that are not included in the
#'   result graph. \sQuote{`create_from_scratch`} searches for all vertices
#'   and edges that must be kept and then uses them to create the graph from
#'   scratch. \sQuote{`auto`} chooses between the two implementations
#'   automatically, using heuristics based on the size of the original and the
#'   result graph.
#' @export
induced_subgraph <- function(graph, vids, impl = c("auto", "copy_and_delete", "create_from_scratch")) {
  # Argument checks
  ensure_igraph(graph)
  vids <- as_igraph_vs(graph, vids)
  impl <- switch(igraph.match.arg(impl),
    "auto" = 0L,
    "copy_and_delete" = 1L,
    "create_from_scratch" = 2L
  )

  on.exit(.Call(R_igraph_finalizer))
  # Function call
  res <- .Call(R_igraph_induced_subgraph, graph, vids - 1, impl)

  res
}

#' @rdname subgraph
#' @param eids The edge ids of the edges that will be kept in the result graph.
#' @param delete.vertices Logical scalar, whether to remove vertices that do
#'   not have any adjacent edges in `eids`.
#' @export
subgraph.edges <- function(graph, eids, delete.vertices = TRUE) {
  # Argument checks
  ensure_igraph(graph)
  eids <- as_igraph_es(graph, eids)
  delete.vertices <- as.logical(delete.vertices)

  on.exit(.Call(R_igraph_finalizer))
  # Function call
  res <- .Call(R_igraph_subgraph_from_edges, graph, eids - 1, delete.vertices)

  res
}

#' Transitivity of a graph
#'
#' Transitivity measures the probability that the adjacent vertices of a vertex
#' are connected. This is sometimes also called the clustering coefficient.
#'
#' Note that there are essentially two classes of transitivity measures, one is
#' a vertex-level, the other a graph level property.
#'
#' There are several generalizations of transitivity to weighted graphs, here
#' we use the definition by A. Barrat, this is a local vertex-level quantity,
#' its formula is
#'
#' \deqn{C_i^w=\frac{1}{s_i(k_i-1)}\sum_{j,h}\frac{w_{ij}+w_{ih}}{2}a_{ij}a_{ih}a_{jh}}{
#' weighted C_i = 1/s_i 1/(k_i-1) sum( (w_ij+w_ih)/2 a_ij a_ih a_jh, j, h)}
#'
#' \eqn{s_i}{s_i} is the strength of vertex \eqn{i}{i}, see
#' [strength()], \eqn{a_{ij}}{a_ij} are elements of the
#' adjacency matrix, \eqn{k_i}{k_i} is the vertex degree, \eqn{w_{ij}}{w_ij}
#' are the weights.
#'
#' This formula gives back the normal not-weighted local transitivity if all
#' the edge weights are the same.
#'
#' The `barrat` type of transitivity does not work for graphs with
#' multiple and/or loop edges. If you want to calculate it for a directed
#' graph, call [as.undirected()] with the `collapse` mode first.
#'
#' @param graph The graph to analyze.
#' @param type The type of the transitivity to calculate. Possible values:
#'   \describe{ \item{"global"}{The global transitivity of an undirected
#'   graph. This is simply the ratio of the count of triangles and connected triples
#'   in the graph. In directed graphs, edge directions are ignored.}
#'   \item{"local"}{The local transitivity of an undirected graph. It is
#'   calculated for each vertex given in the `vids` argument. The local
#'   transitivity of a vertex is the ratio of the count of triangles connected to the
#'   vertex and the triples centered on the vertex. In directed graphs, edge
#'   directions are ignored.}
#'   \item{"undirected"}{This is the same as `global`.}
#'   \item{"globalundirected"}{This is the same as `global`.}
#'   \item{"localundirected"}{This is the same as `local`.}
#'   \item{"barrat"}{The weighted transitivity as defined by A.
#'   Barrat. See details below.}
#'   \item{"weighted"}{The same as `barrat`.} }
#' @param vids The vertex ids for the local transitivity will be calculated.
#'   This will be ignored for global transitivity types.  The default value is
#'   `NULL`, in this case all vertices are considered. It is slightly faster
#'   to supply `NULL` here than `V(graph)`.
#' @param weights Optional weights for weighted transitivity. It is ignored for
#'   other transitivity measures. If it is `NULL` (the default) and the
#'   graph has a `weight` edge attribute, then it is used automatically.
#' @param isolates Character scalar, for local versions of transitivity, it
#'   defines how to treat vertices with degree zero and one.
#'   If it is \sQuote{`NaN`} then their local transitivity is
#'   reported as `NaN` and they are not included in the averaging, for the
#'   transitivity types that calculate an average. If there are no vertices with
#'   degree two or higher, then the averaging will still result `NaN`. If it
#'   is \sQuote{`zero`}, then we report 0 transitivity for them, and they
#'   are included in the averaging, if an average is calculated.
#'   For the global transitivity, it controls how to handle graphs with
#'   no connected triplets: `NaN` or zero will be returned according to
#'   the respective setting.
#' @return For \sQuote{`global`} a single number, or `NaN` if there
#'   are no connected triples in the graph.
#'
#'   For \sQuote{`local`} a vector of transitivity scores, one for each
#'   vertex in \sQuote{`vids`}.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @references Wasserman, S., and Faust, K. (1994). *Social Network
#' Analysis: Methods and Applications.* Cambridge: Cambridge University Press.
#'
#' Alain Barrat, Marc Barthelemy, Romualdo Pastor-Satorras, Alessandro
#' Vespignani: The architecture of complex weighted networks, Proc. Natl. Acad.
#' Sci. USA 101, 3747 (2004)
#' @family structural.properties
#' @export
#' @keywords graphs
#' @examples
#'
#' g <- make_ring(10)
#' transitivity(g)
#' g2 <- sample_gnp(1000, 10 / 1000)
#' transitivity(g2) # this is about 10/1000
#'
#' # Weighted version, the figure from the Barrat paper
#' gw <- graph_from_literal(A - B:C:D:E, B - C:D, C - D)
#' E(gw)$weight <- 1
#' E(gw)[V(gw)[name == "A"] %--% V(gw)[name == "E"]]$weight <- 5
#' transitivity(gw, vids = "A", type = "local")
#' transitivity(gw, vids = "A", type = "weighted")
#'
#' # Weighted reduces to "local" if weights are the same
#' gw2 <- sample_gnp(1000, 10 / 1000)
#' E(gw2)$weight <- 1
#' t1 <- transitivity(gw2, type = "local")
#' t2 <- transitivity(gw2, type = "weighted")
#' all(is.na(t1) == is.na(t2))
#' all(na.omit(t1 == t2))
#'
transitivity <- function(graph, type = c(
                           "undirected", "global", "globalundirected",
                           "localundirected", "local", "average",
                           "localaverage", "localaverageundirected",
                           "barrat", "weighted"
                         ),
                         vids = NULL, weights = NULL, isolates = c("NaN", "zero")) {
  ensure_igraph(graph)
  type <- igraph.match.arg(type)
  type <- switch(type,
    "undirected" = 0L,
    "global" = 0L,
    "globalundirected" = 0L,
    "localundirected" = 1L,
    "local" = 1L,
    "average" = 2L,
    "localaverage" = 2L,
    "localaverageundirected" = 2L,
    "barrat" = 3L,
    "weighted" = 3L
  )

  if (is.null(weights) && "weight" %in% edge_attr_names(graph)) {
    weights <- E(graph)$weight
  }
  if (!is.null(weights) && any(!is.na(weights))) {
    weights <- as.numeric(weights)
  } else {
    weights <- NULL
  }

  isolates <- igraph.match.arg(isolates)
  isolates <- as.double(switch(isolates,
    "nan" = 0,
    "zero" = 1
  ))

  on.exit(.Call(R_igraph_finalizer))
  if (type == 0) {
    .Call(R_igraph_transitivity_undirected, graph, isolates)
  } else if (type == 1) {
    if (is.null(vids)) {
      res <- .Call(R_igraph_transitivity_local_undirected_all, graph, isolates)
      if (igraph_opt("add.vertex.names") && is_named(graph)) {
        names(res) <- V(graph)$name
      }
      res
    } else {
      vids <- as_igraph_vs(graph, vids)
      res <- .Call(
        R_igraph_transitivity_local_undirected, graph, vids - 1,
        isolates
      )
      if (igraph_opt("add.vertex.names") && is_named(graph)) {
        names(res) <- V(graph)$name[vids]
      }
      res
    }
  } else if (type == 2) {
    .Call(R_igraph_transitivity_avglocal_undirected, graph, isolates)
  } else if (type == 3) {
    if (is.null(vids)) {
      vids <- V(graph)
    }
    vids <- as_igraph_vs(graph, vids)
    res <- if (is.null(weights)) {
      .Call(
        R_igraph_transitivity_local_undirected, graph, vids - 1,
        isolates
      )
    } else {
      .Call(
        R_igraph_transitivity_barrat, graph, vids - 1, weights,
        isolates
      )
    }
    if (igraph_opt("add.vertex.names") && is_named(graph)) {
      names(res) <- V(graph)$name[vids]
    }
    res
  }
}


#' Burt's constraint
#'
#' Given a graph, `constraint()` calculates Burt's constraint for each
#' vertex.
#'
#' Burt's constraint is higher if ego has less, or mutually
#' stronger related (i.e. more redundant) contacts. Burt's measure of
#' constraint, \eqn{C_i}{C[i]}, of vertex \eqn{i}'s ego network
#' \eqn{V_i}{V[i]}, is defined for directed and valued graphs,
#' \deqn{C_i=\sum_{j \in V_i \setminus \{i\}} (p_{ij}+\sum_{q \in V_i
#'     \setminus \{i,j\}} p_{iq} p_{qj})^2}{
#'   C[i] = sum( [sum( p[i,j] + p[i,q] p[q,j], q in V[i], q != i,j )]^2, j in
#'   V[i], j != i).
#' }
#' for a graph of order (i.e. number of vertices) \eqn{N}, where
#' proportional tie strengths are defined as
#' \deqn{p_{ij} = \frac{a_{ij}+a_{ji}}{\sum_{k \in V_i \setminus \{i\}}(a_{ik}+a_{ki})},}{
#'   p[i,j]=(a[i,j]+a[j,i]) / sum(a[i,k]+a[k,i], k in V[i], k != i),
#' }
#' \eqn{a_{ij}}{a[i,j]} are elements of \eqn{A} and the latter being the
#' graph adjacency matrix. For isolated vertices, constraint is undefined.
#'
#' @param graph A graph object, the input graph.
#' @param nodes The vertices for which the constraint will be calculated.
#'   Defaults to all vertices.
#' @param weights The weights of the edges. If this is `NULL` and there is
#'   a `weight` edge attribute this is used. If there is no such edge
#'   attribute all edges will have the same weight.
#' @return A numeric vector of constraint scores
#' @author Jeroen Bruggeman
#' (<https://sites.google.com/site/jebrug/jeroen-bruggeman-social-science>)
#' and Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @references Burt, R.S. (2004). Structural holes and good ideas.
#' *American Journal of Sociology* 110, 349-399.
#' @family structural.properties
#' @export
#' @keywords graphs
#' @examples
#'
#' g <- sample_gnp(20, 5 / 20)
#' constraint(g)
#'
constraint <- function(graph, nodes = V(graph), weights = NULL) {
  ensure_igraph(graph)
  nodes <- as_igraph_vs(graph, nodes)

  if (is.null(weights)) {
    if ("weight" %in% edge_attr_names(graph)) {
      weights <- E(graph)$weight
    }
  }

  on.exit(.Call(R_igraph_finalizer))
  res <- .Call(R_igraph_constraint, graph, nodes - 1, as.numeric(weights))
  if (igraph_opt("add.vertex.names") && is_named(graph)) {
    names(res) <- V(graph)$name[nodes]
  }
  res
}



#' Reciprocity of graphs
#'
#' Calculates the reciprocity of a directed graph.
#'
#' The measure of reciprocity defines the proportion of mutual connections, in
#' a directed graph. It is most commonly defined as the probability that the
#' opposite counterpart of a directed edge is also included in the graph. Or in
#' adjacency matrix notation:
#' \eqn{1 - \left(\sum_{i,j} |A_{ij} - A_{ji}|\right) / \left(2\sum_{i,j} A_{ij}\right)}{1 - (sum_ij |A_ij - A_ji|) / (2 sum_ij A_ij)}.
#' This measure is calculated if the `mode` argument is `default`.
#'
#' Prior to igraph version 0.6, another measure was implemented, defined as the
#' probability of mutual connection between a vertex pair, if we know that
#' there is a (possibly non-mutual) connection between them. In other words,
#' (unordered) vertex pairs are classified into three groups: (1)
#' not-connected, (2) non-reciprocally connected, (3) reciprocally connected.
#' The result is the size of group (3), divided by the sum of group sizes
#' (2)+(3). This measure is calculated if `mode` is `ratio`.
#'
#' @param graph The graph object.
#' @param ignore.loops Logical constant, whether to ignore loop edges.
#' @param mode See below.
#' @return A numeric scalar between zero and one.
#' @author Tamas Nepusz \email{ntamas@@gmail.com} and Gabor Csardi
#' \email{csardi.gabor@@gmail.com}
#' @family structural.properties
#' @export
#' @keywords graphs
#' @examples
#'
#' g <- sample_gnp(20, 5 / 20, directed = TRUE)
#' reciprocity(g)
#'
#' @cdocs igraph_reciprocity
reciprocity <- reciprocity_impl


#' Graph density
#'
#' The density of a graph is the ratio of the actual number of edges and the
#' largest possible number of edges in the graph, assuming that no multi-edges
#' are present.
#'
#' The concept of density is ill-defined for multigraphs. Note that this function
#' does not check whether the graph has multi-edges and will return meaningless
#' results for such graphs.
#'
#' @param graph The input graph.
#' @param loops Logical constant, whether loop edges may exist in the graph.
#'   This affects the calculation of the largest possible number of edges in the
#'   graph. If this parameter is set to FALSE yet the graph contains self-loops,
#'   the result will not be meaningful.
#' @return A real constant. This function returns `NaN` (=0.0/0.0) for an
#'   empty graph with zero vertices.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @seealso [vcount()], [ecount()], [simplify()]
#' to get rid of the multiple and/or loop edges.
#' @references Wasserman, S., and Faust, K.  (1994).  Social Network Analysis:
#' Methods and Applications.  Cambridge: Cambridge University Press.
#' @family structural.properties
#' @export
#' @keywords graphs
#' @examples
#'
#' edge_density(make_empty_graph(n = 10)) # empty graphs have density 0
#' edge_density(make_full_graph(n = 10)) # complete graphs have density 1
#' edge_density(sample_gnp(n = 100, p = 0.4)) # density will be close to p
#'
#' # loop edges
#' g <- make_graph(c(1, 2, 2, 2, 2, 3)) # graph with a self-loop
#' edge_density(g, loops = FALSE) # this is wrong!!!
#' edge_density(g, loops = TRUE) # this is right!!!
#' edge_density(simplify(g), loops = FALSE) # this is also right, but different
#'
#' @cdocs igraph_density
edge_density <- density_impl

#' @rdname ego
#' @export
ego_size <- function(graph, order = 1, nodes = V(graph),
                     mode = c("all", "out", "in"), mindist = 0) {
  ensure_igraph(graph)
  mode <- igraph.match.arg(mode)
  mode <- switch(mode,
    "out" = 1,
    "in" = 2,
    "all" = 3
  )
  mindist <- as.numeric(mindist)

  on.exit(.Call(R_igraph_finalizer))
  .Call(
    R_igraph_neighborhood_size, graph,
    as_igraph_vs(graph, nodes) - 1, as.numeric(order), as.numeric(mode),
    mindist
  )
}

#' @export
#' @rdname ego
neighborhood_size <- ego_size

#' Neighborhood of graph vertices
#'
#' These functions find the vertices not farther than a given limit from
#' another fixed vertex, these are called the neighborhood of the vertex.
#' Note that `ego()` and `neighborhood()`,
#' `ego_size()` and `neighborhood_size()`,
#' `make_ego_graph()` and `make_neighborhood()_graph()`,
#' are synonyms (aliases).
#'
#' The neighborhood of a given order `r` of a vertex `v` includes all
#' vertices which are closer to `v` than the order. I.e. order 0 is always
#' `v` itself, order 1 is `v` plus its immediate neighbors, order 2
#' is order 1 plus the immediate neighbors of the vertices in order 1, etc.
#'
#' `ego_size()`/`neighborhood_size()` (synonyms) returns the size of the neighborhoods of the given order,
#' for each given vertex.
#'
#' `ego()`/`neighborhood()` (synonyms) returns the vertices belonging to the neighborhoods of the given
#' order, for each given vertex.
#'
#' `make_ego_graph()`/`make_neighborhood()_graph()` (synonyms) is creates (sub)graphs from all neighborhoods of
#' the given vertices with the given order parameter. This function preserves
#' the vertex, edge and graph attributes.
#'
#' `connect()` creates a new graph by connecting each vertex to
#' all other vertices in its neighborhood.
#'
#' @aliases neighborhood ego_graph
#' @aliases connect ego_size ego
#' @param graph The input graph.
#' @param order Integer giving the order of the neighborhood.
#' @param nodes The vertices for which the calculation is performed.
#' @param mode Character constant, it specifies how to use the direction of
#'   the edges if a directed graph is analyzed. For \sQuote{out} only the
#'   outgoing edges are followed, so all vertices reachable from the source
#'   vertex in at most `order` steps are counted. For \sQuote{"in"} all
#'   vertices from which the source vertex is reachable in at most `order`
#'   steps are counted. \sQuote{"all"} ignores the direction of the edges. This
#'   argument is ignored for undirected graphs.
#' @param mindist The minimum distance to include the vertex in the result.
#' @return
#'   \itemize{
#'   \item{`ego_size()`/`neighborhood_size()` returns with an integer vector.}
#'   \item{`ego()`/`neighborhood()` (synonyms) returns A list of `igraph.vs` or a list of numeric
#'         vectors depending on the value of `igraph_opt("return.vs.es")`,
#'         see details for performance characteristics.}
#'   \item{`make_ego_graph()`/`make_neighborhood_graph()` returns with a list of graphs.}
#'   \item{`connect()` returns with a new graph object.}
#'   }
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}, the first version was
#' done by Vincent Matossian
#' @family structural.properties
#' @export
#' @keywords graphs
#' @examples
#'
#' g <- make_ring(10)
#'
#' ego_size(g, order = 0, 1:3)
#' ego_size(g, order = 1, 1:3)
#' ego_size(g, order = 2, 1:3)
#'
#' # neighborhood_size() is an alias of ego_size()
#' neighborhood_size(g, order = 0, 1:3)
#' neighborhood_size(g, order = 1, 1:3)
#' neighborhood_size(g, order = 2, 1:3)
#'
#' ego(g, order = 0, 1:3)
#' ego(g, order = 1, 1:3)
#' ego(g, order = 2, 1:3)
#'
#' # neighborhood() is an alias of ego()
#' neighborhood(g, order = 0, 1:3)
#' neighborhood(g, order = 1, 1:3)
#' neighborhood(g, order = 2, 1:3)
#'
#' # attributes are preserved
#' V(g)$name <- c("a", "b", "c", "d", "e", "f", "g", "h", "i", "j")
#' make_ego_graph(g, order = 2, 1:3)
#' # make_neighborhood_graph() is an alias of make_ego_graph()
#' make_neighborhood_graph(g, order = 2, 1:3)
#'
#' # connecting to the neighborhood
#' g <- make_ring(10)
#' g <- connect(g, 2)
#'
ego <- function(graph, order = 1, nodes = V(graph),
                mode = c("all", "out", "in"), mindist = 0) {
  ensure_igraph(graph)
  mode <- igraph.match.arg(mode)
  mode <- switch(mode,
    "out" = 1,
    "in" = 2,
    "all" = 3
  )
  mindist <- as.numeric(mindist)

  on.exit(.Call(R_igraph_finalizer))
  res <- .Call(
    R_igraph_neighborhood, graph,
    as_igraph_vs(graph, nodes) - 1, as.numeric(order),
    as.numeric(mode), mindist
  )
  res <- lapply(res, function(x) x + 1)

  if (igraph_opt("return.vs.es")) {
    res <- lapply(res, unsafe_create_vs, graph = graph, verts = V(graph))
  }

  res
}

#' @export
#' @rdname ego
neighborhood <- ego
#' @rdname ego
#' @export
make_ego_graph <- function(graph, order = 1, nodes = V(graph),
                           mode = c("all", "out", "in"), mindist = 0) {
  ensure_igraph(graph)
  mode <- igraph.match.arg(mode)
  mode <- switch(mode,
    "out" = 1L,
    "in" = 2L,
    "all" = 3L
  )
  mindist <- as.numeric(mindist)

  on.exit(.Call(R_igraph_finalizer))
  res <- .Call(
    R_igraph_neighborhood_graphs, graph,
    as_igraph_vs(graph, nodes) - 1, as.numeric(order),
    as.integer(mode), mindist
  )
  res
}

#' @export
#' @rdname ego
make_neighborhood_graph <- make_ego_graph

#' K-core decomposition of graphs
#'
#' The k-core of graph is a maximal subgraph in which each vertex has at least
#' degree k. The coreness of a vertex is k if it belongs to the k-core but not
#' to the (k+1)-core.
#'
#' The k-core of a graph is the maximal subgraph in which every vertex has at
#' least degree k. The cores of a graph form layers: the (k+1)-core is always a
#' subgraph of the k-core.
#'
#' This function calculates the coreness for each vertex.
#'
#' @param graph The input graph, it can be directed or undirected
#' @param mode The type of the core in directed graphs. Character constant,
#'   possible values: `in`: in-cores are computed, `out`: out-cores are
#'   computed, `all`: the corresponding undirected graph is considered. This
#'   argument is ignored for undirected graphs.
#' @return Numeric vector of integer numbers giving the coreness of each
#'   vertex.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @seealso [degree()]
#' @references Vladimir Batagelj, Matjaz Zaversnik: An O(m) Algorithm for Cores
#' Decomposition of Networks, 2002
#'
#' Seidman S. B. (1983) Network structure and minimum degree, *Social
#' Networks*, 5, 269--287.
#' @family structural.properties
#' @export
#' @keywords graphs
#' @examples
#'
#' g <- make_ring(10)
#' g <- add_edges(g, c(1, 2, 2, 3, 1, 3))
#' coreness(g) # small core triangle in a ring
#'
coreness <- function(graph, mode = c("all", "out", "in")) {
  ensure_igraph(graph)
  mode <- igraph.match.arg(mode)
  mode <- switch(mode,
    "out" = 1,
    "in" = 2,
    "all" = 3
  )

  on.exit(.Call(R_igraph_finalizer))
  res <- .Call(R_igraph_coreness, graph, as.numeric(mode))
  if (igraph_opt("add.vertex.names") && is_named(graph)) {
    names(res) <- vertex_attr(graph, "name")
  }
  res
}



#' Topological sorting of vertices in a graph
#'
#' A topological sorting of a directed acyclic graph is a linear ordering of
#' its nodes where each node comes before all nodes to which it has edges.
#'
#' Every DAG has at least one topological sort, and may have many.  This
#' function returns a possible topological sort among them. If the graph is not
#' acyclic (it has at least one cycle), a partial topological sort is returned
#' and a warning is issued.
#'
#' @param graph The input graph, should be directed
#' @param mode Specifies how to use the direction of the edges.  For
#'   \dQuote{`out`}, the sorting order ensures that each node comes before
#'   all nodes to which it has edges, so nodes with no incoming edges go first.
#'   For \dQuote{`in`}, it is quite the opposite: each node comes before all
#'   nodes from which it receives edges. Nodes with no outgoing edges go first.
#' @return A vertex sequence (by default, but see the `return.vs.es`
#'   option of [igraph_options()]) containing vertices in
#'   topologically sorted order.
#' @author Tamas Nepusz \email{ntamas@@gmail.com} and Gabor Csardi
#' \email{csardi.gabor@@gmail.com} for the R interface
#' @keywords graphs
#' @family structural.properties
#' @export
#' @examples
#'
#' g <- sample_pa(100)
#' topo_sort(g)
#'
topo_sort <- function(graph, mode = c("out", "all", "in")) {
  ensure_igraph(graph)
  mode <- igraph.match.arg(mode)
  mode <- switch(mode,
    "out" = 1,
    "in" = 2,
    "all" = 3
  )

  on.exit(.Call(R_igraph_finalizer))
  res <- .Call(R_igraph_topological_sorting, graph, as.numeric(mode)) + 1L

  if (igraph_opt("return.vs.es")) res <- create_vs(graph, res)

  res
}

#' Finding a feedback arc set in a graph
#'
#' A feedback arc set of a graph is a subset of edges whose removal breaks all
#' cycles in the graph.
#'
#' Feedback arc sets are typically used in directed graphs. The removal of a
#' feedback arc set of a directed graph ensures that the remaining graph is a
#' directed acyclic graph (DAG). For undirected graphs, the removal of a feedback
#' arc set ensures that the remaining graph is a forest (i.e. every connected
#' component is a tree).
#'
#' @param graph The input graph
#' @param weights Potential edge weights. If the graph has an edge
#'   attribute called \sQuote{`weight`}, and this argument is
#'   `NULL`, then the edge attribute is used automatically. The goal of
#'   the feedback arc set problem is to find a feedback arc set with the smallest
#'   total weight.
#' @param algo Specifies the algorithm to use. \dQuote{`exact_ip`} solves
#'   the feedback arc set problem with an exact integer programming algorithm that
#'   guarantees that the total weight of the removed edges is as small as possible.
#'   \dQuote{`approx_eades`} uses a fast (linear-time) approximation
#'   algorithm from Eades, Lin and Smyth. \dQuote{`exact`} is an alias to
#'   \dQuote{`exact_ip`} while \dQuote{`approx`} is an alias to
#'   \dQuote{`approx_eades`}.
#' @return An edge sequence (by default, but see the `return.vs.es` option
#'   of [igraph_options()]) containing the feedback arc set.
#' @references Peter Eades, Xuemin Lin and W.F.Smyth: A fast and effective
#' heuristic for the feedback arc set problem. *Information Processing Letters*
#' 47:6, pp. 319-323, 1993
#' @keywords graphs
#' @family structural.properties
#' @family cycles
#' @export
#' @examples
#'
#' g <- sample_gnm(20, 40, directed = TRUE)
#' feedback_arc_set(g)
#' feedback_arc_set(g, algo = "approx_eades")
#' @cdocs igraph_feedback_arc_set
feedback_arc_set <- feedback_arc_set_impl

#' Girth of a graph
#'
#' The girth of a graph is the length of the shortest circle in it.
#'
#' The current implementation works for undirected graphs only, directed graphs
#' are treated as undirected graphs. Loop edges and multiple edges are ignored.
#' If the graph is a forest (i.e. acyclic), then `Inf` is returned.
#'
#' This implementation is based on Alon Itai and Michael Rodeh: Finding a
#' minimum circuit in a graph *Proceedings of the ninth annual ACM
#' symposium on Theory of computing*, 1-10, 1977. The first implementation of
#' this function was done by Keith Briggs, thanks Keith.
#'
#' @param graph The input graph. It may be directed, but the algorithm searches
#'   for undirected circles anyway.
#' @param circle Logical scalar, whether to return the shortest circle itself.
#' @return A named list with two components: \item{girth}{Integer constant, the
#'   girth of the graph, or 0 if the graph is acyclic.} \item{circle}{Numeric
#'   vector with the vertex ids in the shortest circle.}
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @references Alon Itai and Michael Rodeh: Finding a minimum circuit in a
#' graph *Proceedings of the ninth annual ACM symposium on Theory of
#' computing*, 1-10, 1977
#' @family structural.properties
#' @family cycles
#' @export
#' @keywords graphs
#' @examples
#'
#' # No circle in a tree
#' g <- make_tree(1000, 3)
#' girth(g)
#'
#' # The worst case running time is for a ring
#' g <- make_ring(100)
#' girth(g)
#'
#' # What about a random graph?
#' g <- sample_gnp(1000, 1 / 1000)
#' girth(g)
#'
girth <- function(graph, circle = TRUE) {
  ensure_igraph(graph)

  on.exit(.Call(R_igraph_finalizer))
  res <- .Call(R_igraph_girth, graph, as.logical(circle))
  if (res$girth == 0) {
    res$girth <- Inf
  }
  if (igraph_opt("return.vs.es") && circle) {
    res$circle <- create_vs(graph, res$circle)
  }
  res
}

#' Find the multiple or loop edges in a graph
#'
#' A loop edge is an edge from a vertex to itself. An edge is a multiple edge
#' if it has exactly the same head and tail vertices as another edge. A graph
#' without multiple and loop edges is called a simple graph.
#'
#' `any_loop()` decides whether the graph has any loop edges.
#'
#' `which_loop()` decides whether the edges of the graph are loop edges.
#'
#' `any_multiple()` decides whether the graph has any multiple edges.
#'
#' `which_multiple()` decides whether the edges of the graph are multiple
#' edges.
#'
#' `count_multiple()` counts the multiplicity of each edge of a graph.
#'
#' Note that the semantics for `which_multiple()` and `count_multiple()` is
#' different. `which_multiple()` gives `TRUE` for all occurrences of a
#' multiple edge except for one. I.e. if there are three `i-j` edges in the
#' graph then `which_multiple()` returns `TRUE` for only two of them while
#' `count_multiple()` returns \sQuote{3} for all three.
#'
#' See the examples for getting rid of multiple edges while keeping their
#' original multiplicity as an edge attribute.
#'
#' @param graph The input graph.
#' @param eids The edges to which the query is restricted. By default this is
#'   all edges in the graph.
#' @return `any_loop()` and `any_multiple()` return a logical scalar.
#'   `which_loop()` and `which_multiple()` return a logical vector.
#'   `count_multiple()` returns a numeric vector.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @seealso [simplify()] to eliminate loop and multiple edges.
#' @family structural.properties
#' @export
#' @keywords graphs
#' @examples
#'
#' # Loops
#' g <- make_graph(c(1, 1, 2, 2, 3, 3, 4, 5))
#' any_loop(g)
#' which_loop(g)
#'
#' # Multiple edges
#' g <- sample_pa(10, m = 3, algorithm = "bag")
#' any_multiple(g)
#' which_multiple(g)
#' count_multiple(g)
#' which_multiple(simplify(g))
#' all(count_multiple(simplify(g)) == 1)
#'
#' # Direction of the edge is important
#' which_multiple(make_graph(c(1, 2, 2, 1)))
#' which_multiple(make_graph(c(1, 2, 2, 1), dir = FALSE))
#'
#' # Remove multiple edges but keep multiplicity
#' g <- sample_pa(10, m = 3, algorithm = "bag")
#' E(g)$weight <- count_multiple(g)
#' g <- simplify(g, edge.attr.comb = list(weight = "min"))
#' any(which_multiple(g))
#' E(g)$weight
#'
#' @cdocs igraph_is_multiple
which_multiple <- is_multiple_impl
#' @rdname which_multiple
#' @export
#' @cdocs igraph_has_multiple
any_multiple <- has_multiple_impl
#' @rdname which_multiple
#' @export
#' @cdocs igraph_count_multiple
count_multiple <- count_multiple_impl
#' @rdname which_multiple
#' @export
#' @cdocs igraph_is_loop
which_loop <- is_loop_impl
#' @rdname which_multiple
#' @export
#' @cdocs igraph_has_loop
any_loop <- has_loop_impl


#' Breadth-first search
#'
#' Breadth-first search is an algorithm to traverse a graph. We start from a
#' root vertex and spread along every edge \dQuote{simultaneously}.
#'
#'
#' The callback function must have the following arguments:
#' \describe{
#' \item{graph}{The input graph is passed to the callback function here.}
#' \item{data}{A named numeric vector, with the following entries:
#' \sQuote{vid}, the vertex that was just visited, \sQuote{pred}, its
#' predecessor (zero if this is the first vertex), \sQuote{succ}, its successor
#' (zero if this is the last vertex), \sQuote{rank}, the rank of the
#' current vertex, \sQuote{dist}, its distance from the root of the search
#' tree.}
#' \item{extra}{The extra argument.}
#' }
#'
#' The callback must return `FALSE`
#' to continue the search or `TRUE` to terminate it. See examples below on how to
#' use the callback function.
#'
#' @param graph The input graph.
#' @param root Numeric vector, usually of length one. The root vertex, or root
#'   vertices to start the search from.
#' @param mode For directed graphs specifies the type of edges to follow.
#'   \sQuote{out} follows outgoing, \sQuote{in} incoming edges. \sQuote{all}
#'   ignores edge directions completely. \sQuote{total} is a synonym for
#'   \sQuote{all}. This argument is ignored for undirected graphs.
#' @param unreachable Logical scalar, whether the search should visit the
#'   vertices that are unreachable from the given root vertex (or vertices). If
#'   `TRUE`, then additional searches are performed until all vertices are
#'   visited.
#' @param restricted `NULL` (=no restriction), or a vector of vertices
#'   (ids or symbolic names). In the latter case, the search is restricted to the
#'   given vertices.
#' @param order Logical scalar, whether to return the ordering of the vertices.
#' @param rank Logical scalar, whether to return the rank of the vertices.
#' @param father Logical scalar, whether to return the father of the vertices.
#' @param pred Logical scalar, whether to return the predecessors of the
#'   vertices.
#' @param succ Logical scalar, whether to return the successors of the
#'   vertices.
#' @param dist Logical scalar, whether to return the distance from the root of
#'   the search tree.
#' @param callback If not `NULL`, then it must be callback function. This
#'   is called whenever a vertex is visited. See details below.
#' @param extra Additional argument to supply to the callback function.
#' @param rho The environment in which the callback function is evaluated.
#' @param neimode This argument is deprecated from igraph 1.3.0; use
#'   `mode` instead.
#' @return A named list with the following entries:
#'   \item{root}{Numeric scalar.
#'   The root vertex that was used as the starting point of the search.}
#'   \item{neimode}{Character scalar. The `mode` argument of the function
#'   call. Note that for undirected graphs this is always \sQuote{all},
#'   irrespectively of the supplied value.}
#'   \item{order}{Numeric vector. The
#'   vertex ids, in the order in which they were visited by the search.}
#'   \item{rank}{Numeric vector. The rank for each vertex, zero for unreachable vertices.}
#'   \item{father}{Numeric
#'   vector. The father of each vertex, i.e. the vertex it was discovered from.}
#'   \item{pred}{Numeric vector. The previously visited vertex for each vertex,
#'   or 0 if there was no such vertex.}
#'   \item{succ}{Numeric vector. The next
#'   vertex that was visited after the current one, or 0 if there was no such
#'   vertex.}
#'   \item{dist}{Numeric vector, for each vertex its distance from the
#'   root of the search tree. Unreachable vertices have a negative distance
#'   as of igraph 1.6.0, this used to be `NaN`.}
#'
#'   Note that `order`, `rank`, `father`, `pred`, `succ`
#'   and `dist` might be `NULL` if their corresponding argument is
#'   `FALSE`, i.e. if their calculation is not requested.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @seealso [dfs()] for depth-first search.
#' @family structural.properties
#' @export
#' @keywords graphs
#' @examples
#'
#' ## Two rings
#' bfs(make_ring(10) %du% make_ring(10),
#'   root = 1, "out",
#'   order = TRUE, rank = TRUE, father = TRUE, pred = TRUE,
#'   succ = TRUE, dist = TRUE
#' )
#'
#' ## How to use a callback
#' f <- function(graph, data, extra) {
#'   print(data)
#'   FALSE
#' }
#' tmp <- bfs(make_ring(10) %du% make_ring(10),
#'   root = 1, "out",
#'   callback = f
#' )
#'
#' ## How to use a callback to stop the search
#' ## We stop after visiting all vertices in the initial component
#' f <- function(graph, data, extra) {
#'   data["succ"] == -1
#' }
#' bfs(make_ring(10) %du% make_ring(10), root = 1, callback = f)
#'
bfs <- function(
    graph,
    root,
    mode = c("out", "in", "all", "total"),
    unreachable = TRUE,
    restricted = NULL,
    order = TRUE,
    rank = FALSE,
    father = FALSE,
    pred = FALSE,
    succ = FALSE,
    dist = FALSE,
    callback = NULL,
    extra = NULL,
    rho = parent.frame(),
    neimode) {
  ensure_igraph(graph)

  if (!missing(neimode)) {
    warning("Argument `neimode' is deprecated; use `mode' instead")
    if (missing(mode)) {
      mode <- neimode
    }
  }

  if (length(root) == 1) {
    root <- as_igraph_vs(graph, root) - 1
    roots <- NULL
  } else {
    roots <- as_igraph_vs(graph, root) - 1
    root <- 0 # ignored anyway
  }
  mode <- switch(igraph.match.arg(mode),
    "out" = 1,
    "in" = 2,
    "all" = 3,
    "total" = 3
  )
  unreachable <- as.logical(unreachable)
  if (!is.null(restricted)) {
    restricted <- as_igraph_vs(graph, restricted) - 1
  }
  if (!is.null(callback)) {
    callback <- as.function(callback)
  }

  on.exit(.Call(R_igraph_finalizer))
  res <- .Call(
    R_igraph_bfs, graph, root, roots, mode, unreachable,
    restricted,
    as.logical(order), as.logical(rank), as.logical(father),
    as.logical(pred), as.logical(succ), as.logical(dist),
    callback, extra, rho
  )

  # Remove in 1.4.0
  res$neimode <- res$mode

  if (order) res$order <- res$order + 1
  if (rank) res$rank <- res$rank + 1
  if (father) res$father <- res$father + 1
  if (pred) res$pred <- res$pred + 1
  if (succ) res$succ <- res$succ + 1

  if (igraph_opt("return.vs.es")) {
    if (order) res$order <- V(graph)[.env$res$order, na_ok = TRUE]
    if (father) res$father <- create_vs(graph, res$father, na_ok = TRUE)
    if (pred) res$pred <- create_vs(graph, res$pred, na_ok = TRUE)
    if (succ) res$succ <- create_vs(graph, res$succ, na_ok = TRUE)
  } else {
    if (order) res$order <- res$order[res$order != 0]
  }

  if (igraph_opt("add.vertex.names") && is_named(graph)) {
    if (rank) names(res$rank) <- V(graph)$name
    if (father) names(res$father) <- V(graph)$name
    if (pred) names(res$pred) <- V(graph)$name
    if (succ) names(res$succ) <- V(graph)$name
    if (dist) names(res$dist) <- V(graph)$name
  }

  if (rank) {
    res$rank[is.nan(res$rank)] <- 0
  }

  if (dist) {
    res$dist[is.nan(res$dist)] <- -3
  }

  res
}



#' Depth-first search
#'
#' Depth-first search is an algorithm to traverse a graph. It starts from a
#' root vertex and tries to go quickly as far from as possible.
#'
#' The callback functions must have the following arguments: \describe{
#' \item{graph}{The input graph is passed to the callback function here.}
#' \item{data}{A named numeric vector, with the following entries:
#' \sQuote{vid}, the vertex that was just visited and \sQuote{dist}, its
#' distance from the root of the search tree.} \item{extra}{The extra
#' argument.} } The callback must return FALSE to continue the search or TRUE
#' to terminate it. See examples below on how to use the callback functions.
#'
#' @param graph The input graph.
#' @param root The single root vertex to start the search from.
#' @param mode For directed graphs specifies the type of edges to follow.
#'   \sQuote{out} follows outgoing, \sQuote{in} incoming edges. \sQuote{all}
#'   ignores edge directions completely. \sQuote{total} is a synonym for
#'   \sQuote{all}. This argument is ignored for undirected graphs.
#' @param unreachable Logical scalar, whether the search should visit the
#'   vertices that are unreachable from the given root vertex (or vertices). If
#'   `TRUE`, then additional searches are performed until all vertices are
#'   visited.
#' @param order Logical scalar, whether to return the DFS ordering of the
#'   vertices.
#' @param order.out Logical scalar, whether to return the ordering based on
#'   leaving the subtree of the vertex.
#' @param father Logical scalar, whether to return the father of the vertices.
#' @param dist Logical scalar, whether to return the distance from the root of
#'   the search tree.
#' @param in.callback If not `NULL`, then it must be callback function.
#'   This is called whenever a vertex is visited. See details below.
#' @param out.callback If not `NULL`, then it must be callback function.
#'   This is called whenever the subtree of a vertex is completed by the
#'   algorithm. See details below.
#' @param extra Additional argument to supply to the callback function.
#' @param rho The environment in which the callback function is evaluated.
#' @param neimode This argument is deprecated from igraph 1.3.0; use
#'   `mode` instead.
#' @return A named list with the following entries: \item{root}{Numeric scalar.
#'   The root vertex that was used as the starting point of the search.}
#'   \item{neimode}{Character scalar. The `mode` argument of the function
#'   call. Note that for undirected graphs this is always \sQuote{all},
#'   irrespectively of the supplied value.} \item{order}{Numeric vector. The
#'   vertex ids, in the order in which they were visited by the search.}
#'   \item{order.out}{Numeric vector, the vertex ids, in the order of the
#'   completion of their subtree.} \item{father}{Numeric vector. The father of
#'   each vertex, i.e. the vertex it was discovered from.} \item{dist}{Numeric
#'   vector, for each vertex its distance from the root of the search tree.}
#'
#'   Note that `order`, `order.out`, `father`, and `dist`
#'   might be `NULL` if their corresponding argument is `FALSE`, i.e.
#'   if their calculation is not requested.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @seealso [bfs()] for breadth-first search.
#' @family structural.properties
#' @export
#' @keywords graphs
#' @examples
#'
#' ## A graph with two separate trees
#' dfs(make_tree(10) %du% make_tree(10),
#'   root = 1, "out",
#'   TRUE, TRUE, TRUE, TRUE
#' )
#'
#' ## How to use a callback
#' f.in <- function(graph, data, extra) {
#'   cat("in:", paste(collapse = ", ", data), "\n")
#'   FALSE
#' }
#' f.out <- function(graph, data, extra) {
#'   cat("out:", paste(collapse = ", ", data), "\n")
#'   FALSE
#' }
#' tmp <- dfs(make_tree(10),
#'   root = 1, "out",
#'   in.callback = f.in, out.callback = f.out
#' )
#'
#' ## Terminate after the first component, using a callback
#' f.out <- function(graph, data, extra) {
#'   data["vid"] == 1
#' }
#' tmp <- dfs(make_tree(10) %du% make_tree(10),
#'   root = 1,
#'   out.callback = f.out
#' )
#'
dfs <- function(graph, root, mode = c("out", "in", "all", "total"),
                unreachable = TRUE,
                order = TRUE, order.out = FALSE, father = FALSE, dist = FALSE,
                in.callback = NULL, out.callback = NULL, extra = NULL,
                rho = parent.frame(), neimode) {
  ensure_igraph(graph)
  if (!missing(neimode)) {
    warning("Argument `neimode' is deprecated; use `mode' instead")
    if (missing(mode)) {
      mode <- neimode
    }
  }

  root <- as_igraph_vs(graph, root) - 1
  mode <- switch(igraph.match.arg(mode),
    "out" = 1,
    "in" = 2,
    "all" = 3,
    "total" = 3
  )
  unreachable <- as.logical(unreachable)
  if (!is.null(in.callback)) {
    in.callback <- as.function(in.callback)
  }
  if (!is.null(out.callback)) {
    out.callback <- as.function(out.callback)
  }

  on.exit(.Call(R_igraph_finalizer))
  res <- .Call(
    R_igraph_dfs, graph, root, mode, unreachable,
    as.logical(order), as.logical(order.out), as.logical(father),
    as.logical(dist), in.callback, out.callback, extra, rho
  )

  # Remove in 1.4.0
  res$neimode <- res$mode

  if (order) res$order <- res$order + 1
  if (order.out) res$order.out <- res$order.out + 1
  if (father) res$father <- res$father + 1

  if (igraph_opt("return.vs.es")) {
    if (order) res$order <- V(graph)[.env$res$order, na_ok = TRUE]
    if (order.out) res$order.out <- V(graph)[.env$res$order.out, na_ok = TRUE]
    if (father) res$father <- create_vs(graph, res$father, na_ok = TRUE)
  } else {
    if (order) res$order <- res$order[res$order != 0]
    if (order.out) res$order.out <- res$order.out[res$order.out != 0]
  }

  if (igraph_opt("add.vertex.names") && is_named(graph)) {
    if (father) names(res$father) <- V(graph)$name
    if (dist) names(res$dist) <- V(graph)$name
  }

  res
}

#' Connected components of a graph
#'
#' Calculate the maximal (weakly or strongly) connected components of a graph
#'
#' `is_connected()` decides whether the graph is weakly or strongly
#' connected. The null graph is considered disconnected.
#'
#' `components()` finds the maximal (weakly or strongly) connected components
#' of a graph.
#'
#' `count_components()` does almost the same as `components()` but returns only
#' the number of clusters found instead of returning the actual clusters.
#'
#' `component_distribution()` creates a histogram for the maximal connected
#' component sizes.
#'
#' `largest_component()` returns the largest connected component of a graph. For
#' directed graphs, optionally the largest weakly or strongly connected component.
#' In case of a tie, the first component by vertex ID order is returned. Vertex
#' IDs from the original graph are not retained in the returned graph.
#'
#' The weakly connected components are found by a simple breadth-first search.
#' The strongly connected components are implemented by two consecutive
#' depth-first searches.
#'
#' @param graph The graph to analyze.
#' @param mode Character string, either \dQuote{weak} or \dQuote{strong}.  For
#'   directed graphs \dQuote{weak} implies weakly, \dQuote{strong} strongly
#'   connected components to search. It is ignored for undirected graphs.
#' @param \dots Additional attributes to pass to `cluster`, right now only
#'   `mode` makes sense.
#' @return For `is_connected()` a logical constant.
#'
#'   For `components()` a named list with three components:
#'   \item{membership}{numeric vector giving the cluster id to which each vertex
#'   belongs.} \item{csize}{numeric vector giving the sizes of the clusters.}
#'   \item{no}{numeric constant, the number of clusters.}
#'
#'   For `count_components()` an integer constant is returned.
#'
#'   For `component_distribution()` a numeric vector with the relative
#'   frequencies. The length of the vector is the size of the largest component
#'   plus one. Note that (for currently unknown reasons) the first element of the
#'   vector is the number of clusters of size zero, so this is always zero.
#'
#'   For `largest_component()` the largest connected component of the graph.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @seealso [decompose()], [subcomponent()], [groups()]
#' @family structural.properties
#' @export
#' @keywords graphs
#' @examples
#'
#' g <- sample_gnp(20, 1 / 20)
#' clu <- components(g)
#' groups(clu)
#' largest_component(g)
components <- function(graph, mode = c("weak", "strong")) {
  # Argument checks
  ensure_igraph(graph)
  mode <- switch(igraph.match.arg(mode),
    "weak" = 1,
    "strong" = 2
  )

  on.exit(.Call(R_igraph_finalizer))
  # Function call
  res <- .Call(R_igraph_connected_components, graph, mode)
  res$membership <- res$membership + 1
  if (igraph_opt("add.vertex.names") && is_named(graph)) {
    names(res$membership) <- V(graph)$name
  }

  res
}

#' @rdname components
#' @export
#' @cdocs igraph_is_connected
is_connected <- is_connected_impl

#' @rdname components
#' @export
count_components <- function(graph, mode = c("weak", "strong")) {
  ensure_igraph(graph)
  mode <- igraph.match.arg(mode)
  mode <- switch(mode,
    "weak" = 1L,
    "strong" = 2L
  )

  on.exit(.Call(R_igraph_finalizer))
  .Call(R_igraph_no_components, graph, mode)
}

#' Convert a general graph into a forest
#'
#' Perform a breadth-first search on a graph and convert it into a tree or
#' forest by replicating vertices that were found more than once.
#'
#' A forest is a graph, whose components are trees.
#'
#' The `roots` vector can be calculated by simply doing a topological sort
#' in all components of the graph, see the examples below.
#'
#' @param graph The input graph, it can be either directed or undirected.
#' @param mode Character string, defined the types of the paths used for the
#'   breadth-first search. \dQuote{out} follows the outgoing, \dQuote{in} the
#'   incoming edges, \dQuote{all} and \dQuote{total} both of them. This argument
#'   is ignored for undirected graphs.
#' @param roots A vector giving the vertices from which the breadth-first
#'   search is performed. Typically it contains one vertex per component.
#' @return A list with two components: \item{tree}{The result, an `igraph`
#'   object, a tree or a forest.} \item{vertex_index}{A numeric vector, it gives
#'   a mapping from the vertices of the new graph to the vertices of the old
#'   graph.}
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @family structural.properties
#' @export
#' @keywords graphs
#' @examples
#'
#' g <- make_tree(10) %du% make_tree(10)
#' V(g)$id <- seq_len(vcount(g)) - 1
#' roots <- sapply(decompose(g), function(x) {
#'   V(x)$id[topo_sort(x)[1] + 1]
#' })
#' tree <- unfold_tree(g, roots = roots)
#'
unfold_tree <- function(graph, mode = c("all", "out", "in", "total"), roots) {
  # Argument checks
  ensure_igraph(graph)
  mode <- switch(igraph.match.arg(mode),
    "out" = 1,
    "in" = 2,
    "all" = 3,
    "total" = 3
  )
  roots <- as_igraph_vs(graph, roots) - 1

  on.exit(.Call(R_igraph_finalizer))
  # Function call
  res <- .Call(R_igraph_unfold_tree, graph, mode, roots)
  res
}

#' Graph Laplacian
#'
#' The Laplacian of a graph.
#'
#' The Laplacian Matrix of a graph is a symmetric matrix having the same number
#' of rows and columns as the number of vertices in the graph and element (i,j)
#' is d\[i\], the degree of vertex i if if i==j, -1 if i!=j and there is an edge
#' between vertices i and j and 0 otherwise.
#'
#' The Laplacian matrix can also be normalized, with several
#' conventional normalization methods.
#' See the "Normalization methods" section on this page.
#'
#' The weighted version of the Laplacian simply works with the weighted degree
#' instead of the plain degree. I.e. (i,j) is d\[i\], the weighted degree of
#' vertex i if if i==j, -w if i!=j and there is an edge between vertices i and
#' j with weight w, and 0 otherwise. The weighted degree of a vertex is the sum
#' of the weights of its adjacent edges.
#'
#' @param graph The input graph.
#' @param normalization The normalization method to use when calculating the
#'   Laplacian matrix. See the "Normalization methods" section on this page.
#' @param normalized Deprecated, use `normalization` instead.
#' @param weights An optional vector giving edge weights for weighted Laplacian
#'   matrix. If this is `NULL` and the graph has an edge attribute called
#'   `weight`, then it will be used automatically. Set this to `NA` if
#'   you want the unweighted Laplacian on a graph that has a `weight` edge
#'   attribute.
#' @param sparse Logical scalar, whether to return the result as a sparse
#'   matrix. The `Matrix` package is required for sparse matrices.
#' @return A numeric matrix.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @export
#' @keywords graphs
#' @section Normalization methods:
#'
#' The Laplacian matrix \eqn{L} is defined in terms of the adjacency matrix
#' \eqn{A} and a diagonal matrix \eqn{D} containing the degrees as follows:
#'
#' - "unnormalized": Unnormalized Laplacian, \eqn{L = D - A}.
#' - "symmetric": Symmetrically normalized Laplacian,
#' \eqn{L = I - D^{-\frac{1}{2}} A D^{-\frac{1}{2}}}{L = I - D^(-1/2) A D^(-1/2)}.
#' - "left": Left-stochastic normalized Laplacian, \eqn{{L = I - D^{-1} A}}{L = I - D^-1 A}.
#' - "rigth": Right-stochastic normalized Laplacian, \eqn{L = I - A D^{-1}}{L = I - A D^-1}.
#'
#' @examples
#'
#' g <- make_ring(10)
#' laplacian_matrix(g)
#' laplacian_matrix(g, normalization = "unnormalized")
#' laplacian_matrix(g, normalization = "unnormalized", sparse = FALSE)
#'
#' @cdocs igraph_get_laplacian_sparse
#' @cdocs igraph_get_laplacian
laplacian_matrix <- function(graph, weights = NULL,
                             sparse = igraph_opt("sparsematrices"), normalization = c("unnormalized", "symmetric", "left", "right"), normalized) {
  # Argument checks
  if (lifecycle::is_present(normalized)) {
    lifecycle::deprecate_soft(
      "2.0.3",
      "make_lattice(normalized = 'provide normalization instead')",
      details = c("`normalized` is now deprecated, use `normalization` instead.")
    )
    normalized <- as.logical(normalized)

    normalization <- "unnormalized"
    if (normalized) {
      if (is_directed(graph)) {
        normalization <- "left"
      } else {
        normalization <- "symmetric"
      }
    }
  }
  ensure_igraph(graph)
  if (is.null(weights) && "weight" %in% edge_attr_names(graph)) {
    weights <- E(graph)$weight
  }
  if (!is.null(weights) && any(!is.na(weights))) {
    weights <- as.numeric(weights)
  } else {
    weights <- NULL
  }
  sparse <- as.logical(sparse)

  on.exit(.Call(R_igraph_finalizer))
  # Function call
  if (sparse) {
    res <- get_laplacian_sparse_impl(graph, "out", normalization, weights)
  } else {
    res <- get_laplacian_impl(graph, "out", normalization, weights)
  }
  if (sparse) {
    res <- igraph.i.spMatrix(res)
  }
  if (igraph_opt("add.vertex.names") && is_named(graph)) {
    rownames(res) <- colnames(res) <- V(graph)$name
  }
  res
}

#' Matching
#'
#' A matching in a graph means the selection of a set of edges that are
#' pairwise non-adjacent, i.e. they have no common incident vertices. A
#' matching is maximal if it is not a proper subset of any other matching.
#'
#' `is_matching()` checks a matching vector and verifies whether its
#' length matches the number of vertices in the given graph, its values are
#' between zero (inclusive) and the number of vertices (inclusive), and
#' whether there exists a corresponding edge in the graph for every matched
#' vertex pair. For bipartite graphs, it also verifies whether the matched
#' vertices are in different parts of the graph.
#'
#' `is_max_matching()` checks whether a matching is maximal.  A matching
#' is maximal if and only if there exists no unmatched vertex in a graph
#' such that one of its neighbors is also unmatched.
#'
#' `max_bipartite_match()` calculates a maximum matching in a bipartite
#' graph. A matching in a bipartite graph is a partial assignment of
#' vertices of the first kind to vertices of the second kind such that each
#' vertex of the first kind is matched to at most one vertex of the second
#' kind and vice versa, and matched vertices must be connected by an edge
#' in the graph. The size (or cardinality) of a matching is the number of
#' edges. A matching is a maximum matching if there exists no other
#' matching with larger cardinality.  For weighted graphs, a maximum
#' matching is a matching whose edges have the largest possible total
#' weight among all possible matchings.
#'
#' Maximum matchings in bipartite graphs are found by the push-relabel
#' algorithm with greedy initialization and a global relabeling after every
#' \eqn{n/2} steps where \eqn{n} is the number of vertices in the graph.
#'
#' @rdname matching
#' @aliases max_bipartite_match
#' @param graph The input graph. It might be directed, but edge directions will
#'   be ignored.
#' @param types Vertex types, if the graph is bipartite. By default they
#'   are taken from the \sQuote{`type`} vertex attribute, if present.
#' @param matching A potential matching. An integer vector that gives the
#'   pair in the matching for each vertex. For vertices without a pair,
#'   supply `NA` here.
#' @param weights Potential edge weights. If the graph has an edge
#'   attribute called \sQuote{`weight`}, and this argument is
#'   `NULL`, then the edge attribute is used automatically.
#'   In weighted matching, the weights of the edges must match as
#'   much as possible.
#' @param eps A small real number used in equality tests in the weighted
#'   bipartite matching algorithm. Two real numbers are considered equal in
#'   the algorithm if their difference is smaller than `eps`. This is
#'   required to avoid the accumulation of numerical errors. By default it is
#'   set to the smallest \eqn{x}, such that \eqn{1+x \ne 1}{1+x != 1}
#'   holds. If you are running the algorithm with no weights, this argument
#'   is ignored.
#' @return `is_matching()` and `is_max_matching()` return a logical
#'   scalar.
#'
#'   `max_bipartite_match()` returns a list with components:
#'   \item{matching_size}{The size of the matching, i.e. the number of edges
#'     connecting the matched vertices.}
#'   \item{matching_weight}{The weights of the matching, if the graph was
#'     weighted. For unweighted graphs this is the same as the size of the
#'     matching.}
#'   \item{matching}{The matching itself. Numeric vertex id, or vertex
#'     names if the graph was named. Non-matched vertices are denoted by
#'     `NA`.}
#' @author Tamas Nepusz \email{ntamas@@gmail.com}
#' @examples
#' g <- graph_from_literal(a - b - c - d - e - f)
#' m1 <- c("b", "a", "d", "c", "f", "e") # maximal matching
#' m2 <- c("b", "a", "d", "c", NA, NA) # non-maximal matching
#' m3 <- c("b", "c", "d", "c", NA, NA) # not a matching
#' is_matching(g, m1)
#' is_matching(g, m2)
#' is_matching(g, m3)
#' is_max_matching(g, m1)
#' is_max_matching(g, m2)
#' is_max_matching(g, m3)
#'
#' V(g)$type <- rep(c(FALSE, TRUE), 3)
#' print_all(g, v = TRUE)
#' max_bipartite_match(g)
#'
#' g2 <- graph_from_literal(a - b - c - d - e - f - g)
#' V(g2)$type <- rep(c(FALSE, TRUE), length.out = vcount(g2))
#' print_all(g2, v = TRUE)
#' max_bipartite_match(g2)
#' #' @keywords graphs
#' @family structural.properties
#' @export
is_matching <- function(graph, matching, types = NULL) {
  # Argument checks
  ensure_igraph(graph)
  types <- handle_vertex_type_arg(types, graph, required = F)
  matching <- as_igraph_vs(graph, matching, na.ok = TRUE) - 1
  matching[is.na(matching)] <- -1

  on.exit(.Call(R_igraph_finalizer))
  # Function call
  res <- .Call(R_igraph_is_matching, graph, types, matching)

  res
}

#' @export
#' @rdname matching
is_max_matching <- function(graph, matching, types = NULL) {
  # Argument checks
  ensure_igraph(graph)
  types <- handle_vertex_type_arg(types, graph, required = F)
  matching <- as_igraph_vs(graph, matching, na.ok = TRUE) - 1
  matching[is.na(matching)] <- -1

  on.exit(.Call(R_igraph_finalizer))
  # Function call
  res <- .Call(R_igraph_is_maximal_matching, graph, types, matching)

  res
}

#' @export
#' @rdname matching
max_bipartite_match <- function(graph, types = NULL, weights = NULL,
                                eps = .Machine$double.eps) {
  # Argument checks
  ensure_igraph(graph)
  types <- handle_vertex_type_arg(types, graph)
  if (is.null(weights) && "weight" %in% edge_attr_names(graph)) {
    weights <- E(graph)$weight
  }
  if (!is.null(weights) && any(!is.na(weights))) {
    weights <- as.numeric(weights)
  } else {
    weights <- NULL
  }
  eps <- as.numeric(eps)

  on.exit(.Call(R_igraph_finalizer))
  # Function call
  res <- .Call(
    R_igraph_maximum_bipartite_matching, graph, types,
    weights, eps
  )

  res$matching[res$matching == 0] <- NA
  if (igraph_opt("add.vertex.names") && is_named(graph)) {
    res$matching <- V(graph)$name[res$matching]
    names(res$matching) <- V(graph)$name
  }
  res
}


#' Find mutual edges in a directed graph
#'
#' This function checks the reciprocal pair of the supplied edges.
#'
#' In a directed graph an (A,B) edge is mutual if the graph also includes a
#' (B,A) directed edge.
#'
#' Note that multi-graphs are not handled properly, i.e. if the graph contains
#' two copies of (A,B) and one copy of (B,A), then these three edges are
#' considered to be mutual.
#'
#' Undirected graphs contain only mutual edges by definition.
#'
#' @param graph The input graph.
#' @param eids Edge sequence, the edges that will be probed. By default is
#'   includes all edges in the order of their ids.
#' @param loops Logical, whether to consider directed self-loops to be mutual.
#' @return A logical vector of the same length as the number of edges supplied.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @seealso [reciprocity()], [dyad_census()] if you just
#' want some statistics about mutual edges.
#' @keywords graphs
#' @examples
#'
#' g <- sample_gnm(10, 50, directed = TRUE)
#' reciprocity(g)
#' dyad_census(g)
#' which_mutual(g)
#' sum(which_mutual(g)) / 2 == dyad_census(g)$mut
#' @family structural.properties
#' @export
#' @cdocs igraph_is_mutual
which_mutual <- is_mutual_impl


#' Average nearest neighbor degree
#'
#' Calculate the average nearest neighbor degree of the given vertices and the
#' same quantity in the function of vertex degree
#'
#' Note that for zero degree vertices the answer in \sQuote{`knn`} is
#' `NaN` (zero divided by zero), the same is true for \sQuote{`knnk`}
#' if a given degree never appears in the network.
#'
#' The weighted version computes a weighted average of the neighbor degrees as
#'
#' \deqn{k_{nn,u} = \frac{1}{s_u} \sum_v w_{uv} k_v,}{k_nn_u = 1/s_u sum_v w_uv k_v,}
#'
#' where \eqn{s_u = \sum_v w_{uv}}{s_u = sum_v w_uv} is the sum of the incident
#' edge weights of vertex `u`, i.e. its strength.
#' The sum runs over the neighbors `v` of vertex `u`
#' as indicated by `mode`. \eqn{w_{uv}}{w_uv} denotes the weighted adjacency matrix
#' and \eqn{k_v}{k_v} is the neighbors' degree, specified by `neighbor_degree_mode`.
#'
#' @param graph The input graph. It may be directed.
#' @param vids The vertices for which the calculation is performed. Normally it
#'   includes all vertices. Note, that if not all vertices are given here, then
#'   both \sQuote{`knn`} and \sQuote{`knnk`} will be calculated based
#'   on the given vertices only.
#' @param mode Character constant to indicate the type of neighbors to consider
#'   in directed graphs. `out` considers out-neighbors, `in` considers
#'   in-neighbors and `all` ignores edge directions.
#' @param neighbor.degree.mode The type of degree to average in directed graphs.
#'   `out` averages out-degrees, `in` averages in-degrees and `all`
#'   ignores edge directions for the degree calculation.
#' @param weights Weight vector. If the graph has a `weight` edge
#'   attribute, then this is used by default. If this argument is given, then
#'   vertex strength (see [strength()]) is used instead of vertex
#'   degree. But note that `knnk` is still given in the function of the
#'   normal vertex degree.
#'   Weights are are used to calculate a weighted degree (also called
#'   [strength()]) instead of the degree.
#' @return A list with two members: \item{knn}{A numeric vector giving the
#'   average nearest neighbor degree for all vertices in `vids`.}
#'   \item{knnk}{A numeric vector, its length is the maximum (total) vertex
#'   degree in the graph. The first element is the average nearest neighbor
#'   degree of vertices with degree one, etc.  }
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @references Alain Barrat, Marc Barthelemy, Romualdo Pastor-Satorras,
#' Alessandro Vespignani: The architecture of complex weighted networks, Proc.
#' Natl. Acad. Sci. USA 101, 3747 (2004)
#' @keywords graphs
#' @examples
#'
#' # Some trivial ones
#' g <- make_ring(10)
#' knn(g)
#' g2 <- make_star(10)
#' knn(g2)
#'
#' # A scale-free one, try to plot 'knnk'
#' g3 <- sample_pa(1000, m = 5)
#' knn(g3)
#'
#' # A random graph
#' g4 <- sample_gnp(1000, p = 5 / 1000)
#' knn(g4)
#'
#' # A weighted graph
#' g5 <- make_star(10)
#' E(g5)$weight <- seq(ecount(g5))
#' knn(g5)
#' @family structural.properties
#' @export
#' @cdocs igraph_avg_nearest_neighbor_degree
knn <- avg_nearest_neighbor_degree_impl
