#' Greedy vertex coloring
#'
#' \code{greedy_vertex_coloring} finds a coloring for the vertices of a graph
#' based on a simple greedy algorithm.
#'
#' The goal of vertex coloring is to assign a "color" (i.e. a positive integer
#' index) to each vertex of the graph such that neighboring vertices never have
#' the same color. This function solves the problem by considering the vertices
#' one by one according to a heuristic, always choosing the smallest color index
#' that differs from that of already colored neighbors. The coloring obtained
#' this way is not necessarily minimal but it can be calculated in linear time.
#'
#' @param graph The graph object to color
#' @param heuristic The selection heuristic for the next vertex to consider.
#' Currently only one heuristic is supported: \dQuote{colored_neighbors}
#' selects the vertex with the largest number of already colored neighbors.
#' @return A numeric vector where item \code{i} contains the color index
#' associated to vertex \code{i}
#'
#' @export
#' @keywords graphs
#' @examples
#'
#' g <- make_graph("petersen")
#' col <- greedy_vertex_coloring(g)
#' plot(g, vertex.color=col)
#'
greedy_vertex_coloring <- greedy_vertex_coloring