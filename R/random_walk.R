
#' Random walk on a graph
#'
#' `random_walk()` performs a random walk on the graph and returns the
#' vertices that the random walk passed through. `random_edge_walk()`
#' is the same but returns the edges that that random walk passed through.
#'
#' Do a random walk. From the given start vertex, take the given number of
#' steps, choosing an edge from the actual vertex uniformly randomly. Edge
#' directions are observed in directed graphs (see the `mode` argument
#' as well). Multiple and loop edges are also observed.
#'
#' For igraph < 1.6.0, `random_walk()` counted steps differently,
#' and returned a sequence of length `steps` instead of `steps + 1`.
#' This has changed to improve consistency with the underlying C library.
#'
#' @param graph The input graph, might be undirected or directed.
#' @param start The start vertex.
#' @param steps The number of steps to make.
#' @param weights The edge weights. Larger edge weights increase the
#'   probability that an edge is selected by the random walker. In other
#'   words, larger edge weights correspond to stronger connections. The
#'   \sQuote{weight} edge attribute is used if present. Supply
#'   \sQuote{`NA`} here if you want to ignore the \sQuote{weight} edge
#'   attribute.
#' @param mode How to follow directed edges. `"out"` steps along the
#'   edge direction, `"in"` is opposite to that. `"all"` ignores
#'   edge directions. This argument is ignored for undirected graphs.
#' @param stuck What to do if the random walk gets stuck. `"return"`
#'   returns the partial walk, `"error"` raises an error.
#' @return For `random_walk()`, a vertex sequence of length `steps + 1`
#'   containing the vertices along the walk, starting with `start`.
#'   For `random_edge_walk()`, an edge sequence of length `steps` containing
#'   the edges along the walk.
#' @family random_walk
#' @export
#' @examples
#' ## Stationary distribution of a Markov chain
#' g <- make_ring(10, directed = TRUE) %u%
#'   make_star(11, center = 11) + edge(11, 1)
#'
#' ec <- eigen_centrality(g, directed = TRUE)$vector
#' pg <- page_rank(g, damping = 0.999)$vector
#' w <- random_walk(g, start = 1, steps = 10000)
#'
#' ## These are similar, but not exactly the same
#' cor(table(w), ec)
#'
#' ## But these are (almost) the same
#' cor(table(w), pg)
#' @cdocs igraph_random_walk
random_walk <- function(
    graph,
    start,
    steps,
    weights = NULL,
    mode = c("out", "in", "all", "total"),
    stuck = c("return", "error")) {
  mode <- match.arg(mode)
  stuck <- match.arg(stuck)
  out <- random_walk_impl(graph, start, steps, weights, mode, stuck)
  # FIXME: Support returning the full structure
  out$vertices
}

#' @rdname random_walk
#' @export
#' @cdocs igraph_random_walk
random_edge_walk <- function(
    graph,
    start,
    steps,
    weights = NULL,
    mode = c("out", "in", "all", "total"),
    stuck = c("return", "error")) {
  mode <- match.arg(mode)
  stuck <- match.arg(stuck)
  out <- random_walk_impl(graph, start, steps, weights, mode, stuck)
  # FIXME: Support returning the full structure
  out$edges
}

