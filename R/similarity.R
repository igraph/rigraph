#' Similarity measures of two vertices
#'
#' These functions calculates similarity scores for vertices based on their
#' connection patterns.
#'
#' @details
#' The Jaccard similarity coefficient of two vertices is the number of common
#' neighbors divided by the number of vertices that are neighbors of at least
#' one of the two vertices being considered. The `jaccard` method
#' calculates the pairwise Jaccard similarities for some (or all) of the
#' vertices.
#'
#' The Dice similarity coefficient of two vertices is twice the number of
#' common neighbors divided by the sum of the degrees of the vertices.
#' Methof `dice` calculates the pairwise Dice similarities for some
#' (or all) of the vertices.
#'
#' The inverse log-weighted similarity of two vertices is the number of their
#' common neighbors, weighted by the inverse logarithm of their degrees.  It is
#' based on the assumption that two vertices should be considered more similar
#' if they share a low-degree common neighbor, since high-degree common
#' neighbors are more likely to appear even by pure chance.  Isolated vertices
#' will have zero similarity to any other vertex.  Self-similarities are not
#' calculated.  See the following paper for more details: Lada A. Adamic and
#' Eytan Adar: Friends and neighbors on the Web. Social Networks,
#' 25(3):211-230, 2003.
#'
#' @aliases similarity.jaccard similarity.dice similarity.invlogweighted
#' @param graph The input graph.
#' @param vids The vertex ids for which the similarity is calculated.
#' @param mode The type of neighboring vertices to use for the calculation,
#'   possible values: \sQuote{`out`}, \sQuote{`in`},
#'   \sQuote{`all`}.
#' @param loops Whether to include vertices themselves in the neighbor
#'   sets.
#' @param method The method to use.
#' @return A `length(vids)` by `length(vids)` numeric matrix
#'   containing the similarity scores. This argument is ignored by the
#'   `invlogweighted` method.
#' @author Tamas Nepusz \email{ntamas@@gmail.com} and Gabor Csardi
#'   \email{csardi.gabor@@gmail.com} for the manual page.
#' @references Lada A. Adamic and Eytan Adar: Friends and neighbors on the Web.
#'   *Social Networks*, 25(3):211-230, 2003.
#' @keywords graphs
#' @family similarity
#' @family cocitation
#' @export
#' @examples
#'
#' g <- make_ring(5)
#' similarity(g, method = "dice")
#' similarity(g, method = "jaccard")
similarity <- function(graph, vids = V(graph),
                       mode = c(
                         "all", "out", "in",
                         "total"
                       ),
                       loops = FALSE,
                       method = c(
                         "jaccard",
                         "dice", "invlogweighted"
                       )) {
  method <- igraph.match.arg(method)
  if (method == "jaccard") {
    similarity.jaccard(graph, vids, mode, loops)
  } else if (method == "dice") {
    similarity.dice(graph, vids, mode, loops)
  } else if (method == "invlogweighted") {
    similarity.invlogweighted(graph, vids, mode)
  }
}

#' @export
#' @cdocs igraph_similarity_jaccard
similarity.jaccard <- similarity_jaccard_impl
#' @export
#' @cdocs igraph_similarity_dice
similarity.dice <- similarity_dice_impl
#' @export
#' @cdocs igraph_similarity_inverse_log_weighted
similarity.invlogweighted <- similarity_inverse_log_weighted_impl
