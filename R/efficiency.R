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
#' @inheritParams rlang::args_dots_empty
#' @param weights The edge weights. All edge weights must be non-negative;
#'   additionally, no edge weight may be NaN. If it is `NULL` (the default)
#'   and the graph has a `weight` edge attribute, then it is used automatically.
#' @param vertices The vertex IDs of the vertices for which the calculation will be done.
#'   Applies to the local efficiency calculation only. The default `NULL`
#'   selects all vertices.
#' @param vids `r lifecycle::badge("deprecated")` Use `vertices` instead.
#' @param directed Logical, whether to consider directed paths. Ignored
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
global_efficiency <- function(
  graph,
  ...,
  weights = NULL,
  directed = TRUE
) {
  # BEGIN GENERATED ARG_HANDLE: global_efficiency, do not edit, see tools/generate-migrations.R
  # fmt: skip
  if (...length() > 0L) {
    # Pre-3.0.0 signature: global_efficiency(graph, weights, directed)
    .old_signature <- function(weights, directed, ...) {
      if (...length() > 0L) {
        .arg_extra <- base::names(base::substitute(...()))
        .arg_extra <- .arg_extra[base::nzchar(.arg_extra)]
        if (base::length(.arg_extra) == 0L) cli::cli_abort("Too many arguments passed to {.fn global_efficiency}.", call = base::parent.frame())
        cli::cli_abort(base::c("Unexpected argument passed to {.fn global_efficiency}: {.arg {(.arg_extra)}}.", i = "Arguments after {.arg ...} must be spelled out in full."), call = base::parent.frame())
      }
      base::c(
        if (!base::missing(weights)) base::list(weights = weights),
        if (!base::missing(directed)) base::list(directed = directed)
      )
    }
    .arg_handle <- .old_signature(...)
    if (base::length(.arg_handle) > 0L) {
      .arg_names <- base::names(.arg_handle)
      .arg_conflict <- base::intersect(.arg_names, base::c(
        if (!base::missing(weights)) "weights",
        if (!base::missing(directed)) "directed"
      ))
      if (base::length(.arg_conflict) > 0L) cli::cli_abort(base::c("Argument {.arg {(.arg_conflict)}} of {.fn global_efficiency} was supplied more than once.", i = "Pass it exactly once, by its new name {.arg {(.arg_conflict)}}."))
      base::list2env(.arg_handle, base::environment())
      lifecycle::deprecate_soft(
        "3.0.0",
        what = base::I("Calling `global_efficiency()` with positional or abbreviated arguments"),
        details = base::c(
          i = base::paste0("Detected call:  global_efficiency(", base::paste(base::c("graph", .arg_names), collapse = ", "), ")"),
          i = base::paste0("Use instead:    global_efficiency(", base::paste(base::c("graph", base::paste0(.arg_names, " = ")), collapse = ", "), ")")
        )
      )
    }
  }
  # END GENERATED ARG_HANDLE

  global_efficiency_impl(
    graph = graph,
    weights = weights,
    directed = directed
  )
}

#' @rdname global_efficiency
#' @inheritParams rlang::args_dots_empty
#' @export
local_efficiency <- function(
  graph,
  vertices = NULL,
  ...,
  weights = NULL,
  directed = TRUE,
  mode = c("all", "out", "in", "total"),
  vids = deprecated()
) {
  # BEGIN GENERATED ARG_HANDLE: local_efficiency, do not edit, see tools/generate-migrations.R
  # fmt: skip
  if (...length() > 0L) {
    .arg_forbidden <- base::intersect(base::names(base::sys.call()), base::c("v"))
    if (base::length(.arg_forbidden) > 0L) cli::cli_abort(base::c("Argument {.arg {(.arg_forbidden)}} matches multiple formal arguments of {.fn local_efficiency}.", i = "Spell out the full argument name."))
    # Pre-3.0.0 signature: local_efficiency(graph, vids, weights, directed, mode)
    .old_signature <- function(weights, directed, mode, ...) {
      if (...length() > 0L) {
        .arg_extra <- base::names(base::substitute(...()))
        .arg_extra <- .arg_extra[base::nzchar(.arg_extra)]
        if (base::length(.arg_extra) == 0L) cli::cli_abort("Too many arguments passed to {.fn local_efficiency}.", call = base::parent.frame())
        cli::cli_abort(base::c("Unexpected argument passed to {.fn local_efficiency}: {.arg {(.arg_extra)}}.", i = "Arguments after {.arg ...} must be spelled out in full."), call = base::parent.frame())
      }
      base::c(
        if (!base::missing(weights)) base::list(weights = weights),
        if (!base::missing(directed)) base::list(directed = directed),
        if (!base::missing(mode)) base::list(mode = mode)
      )
    }
    .arg_handle <- .old_signature(...)
    if (base::length(.arg_handle) > 0L) {
      .arg_names <- base::names(.arg_handle)
      .arg_conflict <- base::intersect(.arg_names, base::c(
        if (!base::missing(weights)) "weights",
        if (!base::missing(directed)) "directed",
        if (!base::missing(mode)) "mode"
      ))
      if (base::length(.arg_conflict) > 0L) cli::cli_abort(base::c("Argument {.arg {(.arg_conflict)}} of {.fn local_efficiency} was supplied more than once.", i = "Pass it exactly once, by its new name {.arg {(.arg_conflict)}}."))
      base::list2env(.arg_handle, base::environment())
      lifecycle::deprecate_soft(
        "3.0.0",
        what = base::I("Calling `local_efficiency()` with positional or abbreviated arguments"),
        details = base::c(
          i = base::paste0("Detected call:  local_efficiency(", base::paste(base::c("graph", "vertices", .arg_names), collapse = ", "), ")"),
          i = base::paste0("Use instead:    local_efficiency(", base::paste(base::c("graph", "vertices", base::paste0(.arg_names, " = ")), collapse = ", "), ")")
        )
      )
    }
  }
  # END GENERATED ARG_HANDLE

  if (lifecycle::is_present(vids)) {
    if (!missing(vertices)) {
      cli::cli_abort(c(
        "Argument {.arg vertices} of {.fn local_efficiency} was supplied more than once.",
        i = "It was also supplied via its legacy name {.arg vids}."
      ))
    }
    lifecycle::deprecate_soft(
      "3.0.0",
      "local_efficiency(vids = )",
      "local_efficiency(vertices = )"
    )
    vertices <- vids
  }

  if (is.null(vertices)) {
    vertices <- V(graph)
  }

  local_efficiency_impl(
    graph = graph,
    vids = vertices,
    weights = weights,
    directed = directed,
    mode = mode
  )
}

#' @rdname global_efficiency
#' @inheritParams rlang::args_dots_empty
#' @export
average_local_efficiency <- function(
  graph,
  ...,
  weights = NULL,
  directed = TRUE,
  mode = c("all", "out", "in", "total")
) {
  # BEGIN GENERATED ARG_HANDLE: average_local_efficiency, do not edit, see tools/generate-migrations.R
  # fmt: skip
  if (...length() > 0L) {
    # Pre-3.0.0 signature: average_local_efficiency(graph, weights, directed, mode)
    .old_signature <- function(weights, directed, mode, ...) {
      if (...length() > 0L) {
        .arg_extra <- base::names(base::substitute(...()))
        .arg_extra <- .arg_extra[base::nzchar(.arg_extra)]
        if (base::length(.arg_extra) == 0L) cli::cli_abort("Too many arguments passed to {.fn average_local_efficiency}.", call = base::parent.frame())
        cli::cli_abort(base::c("Unexpected argument passed to {.fn average_local_efficiency}: {.arg {(.arg_extra)}}.", i = "Arguments after {.arg ...} must be spelled out in full."), call = base::parent.frame())
      }
      base::c(
        if (!base::missing(weights)) base::list(weights = weights),
        if (!base::missing(directed)) base::list(directed = directed),
        if (!base::missing(mode)) base::list(mode = mode)
      )
    }
    .arg_handle <- .old_signature(...)
    if (base::length(.arg_handle) > 0L) {
      .arg_names <- base::names(.arg_handle)
      .arg_conflict <- base::intersect(.arg_names, base::c(
        if (!base::missing(weights)) "weights",
        if (!base::missing(directed)) "directed",
        if (!base::missing(mode)) "mode"
      ))
      if (base::length(.arg_conflict) > 0L) cli::cli_abort(base::c("Argument {.arg {(.arg_conflict)}} of {.fn average_local_efficiency} was supplied more than once.", i = "Pass it exactly once, by its new name {.arg {(.arg_conflict)}}."))
      base::list2env(.arg_handle, base::environment())
      lifecycle::deprecate_soft(
        "3.0.0",
        what = base::I("Calling `average_local_efficiency()` with positional or abbreviated arguments"),
        details = base::c(
          i = base::paste0("Detected call:  average_local_efficiency(", base::paste(base::c("graph", .arg_names), collapse = ", "), ")"),
          i = base::paste0("Use instead:    average_local_efficiency(", base::paste(base::c("graph", base::paste0(.arg_names, " = ")), collapse = ", "), ")")
        )
      )
    }
  }
  # END GENERATED ARG_HANDLE

  average_local_efficiency_impl(
    graph = graph,
    weights = weights,
    directed = directed,
    mode = mode
  )
}
