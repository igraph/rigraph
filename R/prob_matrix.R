
#' Sample a graph from a network probability matrix
#'
#' @param P Square matrix of probabilities. It is not checked if they
#'   are really probabilities, so negative values and values larger
#'   than one are allowed. Non-positive values never generate an edge,
#'   values larger than one always generate an edge.
#' @param directed Whether to create a directed graph. By default the
#'   graph is undirected if \code{P} is not symmetric, and directed
#'   otherwise. If directed is \code{FALSE}, then only the upper
#'   diagonal of \code{P} is used, including the diagonal itself.
#'
#' @export
#' @examples
#'
#' ## This is more efficient with sample_gnp...
#' P <- matrix(0.2, nrow = 10, ncol = 10)
#' sample_prob_matrix(P)
#'
#' ## Non-symmetric matrix, this will be a directed graph
#' P2 <- matrix(runif(100), nrow = 10)
#' sample_prob_matrix(P2)

sample_prob_matrix <- function(P, directed = ! isSymmetric(P)) {

  directed <- as.logical(directed)

  stopifnot(is.matrix(P) || inherits(P, "Matrix"),
            nrow(P) == ncol(P))
  stopifnot( length(directed) == 1, !is.na(directed) )

  graph_from_adjacency_matrix(
    P < runif(nrow(P) * ncol(P)),
    mode = if (directed) "directed" else "upper"
  )
}
