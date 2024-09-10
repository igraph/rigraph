
#' Efficiency of a graph
#'
#' These functions calculate the global or average local efficiency of a network,
#' or the local efficiency of every vertex in the network. See below for
#' definitions.
#'
#' @section Global efficiency:
#'
#' The global efficiency of a network is defined as the average of inverse
#' distances between all pairs of vertices.
#'
#' More precisely:
#'
#' \deqn{E_g = \frac{1}{n (n-1)} \sum_{i \ne j} \frac{1}{d_{ij}}}{
#' E_g = 1/(n*(n-1)) sum_{i!=j} 1/d_ij}
#'
#' where \eqn{n}{n} is the number of vertices.
#'
#' The inverse distance between pairs that are not reachable from each other is
#' considered to be zero. For graphs with fewer than 2 vertices, NaN is returned.
#'
#' @section Local efficiency:
#'
#' The local efficiency of a network around a vertex is defined as follows: We
#' remove the vertex and compute the distances (shortest path lengths) between
#' its neighbours through the rest of the network. The local efficiency around
#' the removed vertex is the average of the inverse of these distances.
#'
#' The inverse distance between two vertices which are not reachable from each
#' other is considered to be zero. The local efficiency around a vertex with
#' fewer than two neighbours is taken to be zero by convention.
#'
#' @section Average local efficiency:
#'
#' The average local efficiency of a network is simply the arithmetic mean of
#' the local efficiencies of all the vertices; see the definition for local
#' efficiency above.
#'
#' @param graph The graph to analyze.
#' @param weights The edge weights. All edge weights must be non-negative;
#'   additionally, no edge weight may be NaN. If it is `NULL` (the default)
#'   and the graph has a `weight` edge attribute, then it is used automatically.
#' @param vids The vertex ids of the vertices for which the calculation will be done.
#'   Applies to the local efficiency calculation only.
#' @param directed Logical scalar, whether to consider directed paths. Ignored
#'   for undirected graphs.
#' @param mode Specifies how to define the local neighborhood of a vertex in
#'   directed graphs. \dQuote{out} considers out-neighbors only, \dQuote{in}
#'   considers in-neighbors only, \dQuote{all} considers both.
#' @return For `global_efficiency()`, the global efficiency of the graph as a
#'   single number. For `average_local_efficiency()`, the average local
#'   efficiency of the graph as a single number. For `local_efficiency()`, the
#'   local efficiency of each vertex in a vector.
#'
#' @references V. Latora and M. Marchiori: Efficient Behavior of Small-World
#' Networks, Phys. Rev. Lett. 87, 198701 (2001).
#'
#' I. Vragović, E. Louis, and A. Díaz-Guilera, Efficiency of informational
#' transfer in regular and complex networks, Phys. Rev. E 71, 1 (2005).
#'
#' @family efficiency
#' @export
#' @keywords graphs
#' @examples
#'
#' g <- make_graph("zachary")
#' global_efficiency(g)
#' average_local_efficiency(g)
#' @cdocs igraph_global_efficiency
global_efficiency <- global_efficiency_impl

#' @rdname global_efficiency
#' @export
#' @cdocs igraph_local_efficiency
local_efficiency <- local_efficiency_impl

#' @rdname global_efficiency
#' @export
#' @cdocs igraph_average_local_efficiency
average_local_efficiency <- average_local_efficiency_impl
