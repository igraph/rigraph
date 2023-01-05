
#' Random walk on a graph
#'
#' \code{random_walk} performs a random walk on the graph and returns the
#' vertices that the random walk passed through. \code{random_edge_walk}
#' is the same but returns the edges that that random walk passed through.
#'
#' Do a random walk. From the given start vertex, take the given number of
#' steps, choosing an edge from the actual vertex uniformly randomly. Edge
#' directions are observed in directed graphs (see the \code{mode} argument
#' as well). Multiple and loop edges are also observed.
#'
#' @param graph The input graph, might be undirected or directed.
#' @param start The start vertex.
#' @param steps The number of steps to make.
#' @param weights The edge weights. Larger edge weights increase the
#'   probability that an edge is selected by the random walker. In other
#'   words, larger edge weights correspond to stronger connections. The
#'   \sQuote{weight} edge attribute is used if present. Supply
#'   \sQuote{\code{NA}} here if you want to ignore the \sQuote{weight} edge
#'   attribute.
#' @param mode How to follow directed edges. \code{"out"} steps along the
#'   edge direction, \code{"in"} is opposite to that. \code{"all"} ignores
#'   edge directions. This argument is ignored for undirected graphs.
#' @param stuck What to do if the random walk gets stuck. \code{"return"}
#'   returns the partial walk, \code{"error"} raises an error.
#' @return For \code{random_walk}, a vertex sequence containing the vertices
#'   along the walk. For \code{random_edge_walk}, an edge sequence containing
#'   the edges along the walk.
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
random_walk <- random_walk

#' @rdname random_walk
random_edge_walk <- random_edge_walk
