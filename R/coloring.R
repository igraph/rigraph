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
  # fmt: skip
  if (...length() > 0L) {
    # Pre-3.0.0 signature: greedy_vertex_coloring(graph, heuristic)
    .old_signature <- function(heuristic, ...) {
      if (...length() > 0L) {
        .arg_extra <- base::names(base::substitute(...()))
        .arg_extra <- .arg_extra[base::nzchar(.arg_extra)]
        if (base::length(.arg_extra) == 0L) cli::cli_abort("Too many arguments passed to {.fn greedy_vertex_coloring}.", call = base::parent.frame())
        cli::cli_abort(base::c("Unexpected argument passed to {.fn greedy_vertex_coloring}: {.arg {(.arg_extra)}}.", i = "Arguments after {.arg ...} must be spelled out in full."), call = base::parent.frame())
      }
      base::c(
        if (!base::missing(heuristic)) base::list(heuristic = heuristic)
      )
    }
    .arg_handle <- .old_signature(...)
    if (base::length(.arg_handle) > 0L) {
      .arg_names <- base::names(.arg_handle)
      .arg_conflict <- base::intersect(.arg_names, base::c(
        if (!base::missing(heuristic)) "heuristic"
      ))
      if (base::length(.arg_conflict) > 0L) cli::cli_abort(base::c("Argument {.arg {(.arg_conflict)}} of {.fn greedy_vertex_coloring} was supplied more than once.", i = "Pass it exactly once, by its new name {.arg {(.arg_conflict)}}."))
      base::list2env(.arg_handle, base::environment())
      lifecycle::deprecate_soft(
        "3.0.0",
        what = base::I("Calling `greedy_vertex_coloring()` with positional or abbreviated arguments"),
        details = base::c(
          i = base::paste0("Detected call:  greedy_vertex_coloring(", base::paste(base::c("graph", .arg_names), collapse = ", "), ")"),
          i = base::paste0("Use instead:    greedy_vertex_coloring(", base::paste(base::c("graph", base::paste0(.arg_names, " = ")), collapse = ", "), ")")
        )
      )
    }
  }
  # END GENERATED ARG_HANDLE

  vertex_coloring_greedy_impl(
    graph = graph,
    heuristic = heuristic
  )
}
