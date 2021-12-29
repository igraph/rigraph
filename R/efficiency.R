
#' Global efficiency of a graph
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
#' @param graph The graph to analyze.
#' @param weights The edge weights. All edge weights must be non-negative;
#' additionally, no edge weight may be NaN. If it is \code{NULL} (the default)
#' and the graph has a \code{weight} edge attribute, then it is used automatically.
#' @param directed Logical scalar, whether to consider directed paths. Ignored
#' for undirected graphs.
#' @return The global efficiency of the graph as a single number.
#' 
#' @references V. Latora and M. Marchiori: Efficient Behavior of Small-World
#' Networks, Phys. Rev. Lett. 87, 198701 (2001).
#' 
#' @export
#' @keywords graphs
#' @examples
#' 
#' g <- make_graph("zachary")
#' global_efficiency(g)

global_efficiency <- global_efficiency
