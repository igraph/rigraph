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
#' @inheritParams rlang::args_dots_empty
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
greedy_vertex_coloring <- function(
  graph,
  ...,
  heuristic = c("colored_neighbors", "dsatur")
) {
  # BEGIN GENERATED ARG_HANDLE: greedy_vertex_coloring, do not edit, see tools/generate-migrations.R
  if (...length() > 0L) {
    .arg_handle <- migrate_recover_args(
      list(...),
      current = list(heuristic = heuristic),
      recover_new = c("heuristic"),
      recover_old = c("heuristic"),
      match_names = c("heuristic"),
      match_to = c("heuristic"),
      defaults = list(heuristic = c("colored_neighbors", "dsatur")),
      head_args = c("graph"),
      fn_name = "greedy_vertex_coloring"
    )
    list2env(.arg_handle$values, environment())
    lifecycle::deprecate_soft(
      "3.0.0",
      what = I(.arg_handle$what),
      details = .arg_handle$details
    )
  }
  # END GENERATED ARG_HANDLE

  vertex_coloring_greedy_impl(
    graph = graph,
    heuristic = heuristic
  )
}
