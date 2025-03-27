#' Greedy vertex coloring
#'
#' `greedy_vertex_coloring()` finds a coloring for the vertices of a graph
#' based on a simple greedy algorithm.
#'
#' The goal of vertex coloring is to assign a "color" (represented as a positive
#' integer) to each vertex of the graph such that neighboring vertices never
#' have the same color. This function solves the problem by considering the
#' vertices one by one according to a heuristic, always choosing the smallest
#' color that differs from that of already colored neighbors. The coloring
#' obtained this way is not necessarily minimum but it can be calculated in
#' linear time.
#'
#' @param graph The graph object to color.
#' @param heuristic The selection heuristic for the next vertex to consider.
#'   Possible values are: \dQuote{colored_neighbors} selects the vertex with the
#'   largest number of already colored neighbors. \dQuote{dsatur} selects the
#'   vertex with the largest number of unique colors in its neighborhood, i.e.
#'   its "saturation degree"; when there are several maximum saturation degree
#'   vertices, the one with the most uncolored neighbors will be selected.
#' @return A numeric vector where item `i` contains the color index
#'   associated to vertex `i`.
#'
#' @family coloring
#' @export
#' @keywords graphs
#' @examples
#'
#' g <- make_graph("petersen")
#' col <- greedy_vertex_coloring(g)
#' plot(g, vertex.color = col)
#'
#' @cdocs igraph_vertex_coloring_greedy
greedy_vertex_coloring <- vertex_coloring_greedy_impl
