#' Decide whether a graph is a tree.
#'
#' `is_tree()` decides whether a graph is a tree, and optionally returns a
#' possible root vertex if the graph is a tree.
#'
#' An undirected graph is a tree if it is connected and has no cycles.
#' In the directed case, a possible additional requirement is that all edges
#' are oriented away from a root (out-tree or arborescence) or all edges are
#' oriented towards a root (in-tree or anti-arborescence). This test can be
#' controlled using the mode parameter.
#'
#' By convention, the null graph (i.e. the graph with no vertices) is considered
#' not to be a tree.
#'
#' @param graph An igraph graph object
#' @inheritParams rlang::args_dots_empty
#' @param mode Whether to consider edge directions in a directed graph.
#'   \sQuote{all} ignores edge directions; \sQuote{out} requires edges to be
#'   oriented outwards from the root, \sQuote{in} requires edges to be oriented
#'   towards the root.
#' @param details Whether to return only whether the graph is a tree (`FALSE`)
#'   or also a possible root (`TRUE`)
#' @return When `details` is `FALSE`, a logical value that indicates
#'   whether the graph is a tree. When `details` is `TRUE`, a named
#'   list with two entries:
#'   \describe{
#'     \item{res}{
#'       Logical value that indicates whether the graph is a tree.
#'     }
#'     \item{root}{
#'       The root vertex of the tree; undefined if the graph is not a tree.
#'     }
#'   }
#'
#' @keywords graphs
#' @examples
#'
#' g <- make_tree(7, 2)
#' is_tree(g)
#' is_tree(g, details = TRUE)
#'
#' @family trees
#' @export
is_tree <- function(
  graph,
  ...,
  mode = c("out", "in", "all", "total"),
  details = FALSE
) {
  # BEGIN GENERATED ARG_HANDLE: is_tree, do not edit, see tools/generate-migrations.R
  # fmt: skip
  if (...length() > 0L) {
    # Pre-3.0.0 signature: is_tree(graph, mode, details)
    .old_signature <- function(mode, details, ...) {
      if (...length() > 0L) {
        .arg_extra <- base::names(base::substitute(...()))
        .arg_extra <- .arg_extra[base::nzchar(.arg_extra)]
        if (base::length(.arg_extra) == 0L) cli::cli_abort("Too many arguments passed to {.fn is_tree}.", call = base::parent.frame())
        cli::cli_abort(base::c("Unexpected argument passed to {.fn is_tree}: {.arg {(.arg_extra)}}.", i = "Arguments after {.arg ...} must be spelled out in full."), call = base::parent.frame())
      }
      base::c(
        if (!base::missing(mode)) base::list(mode = mode),
        if (!base::missing(details)) base::list(details = details)
      )
    }
    .arg_handle <- .old_signature(...)
    if (base::length(.arg_handle) > 0L) {
      .arg_names <- base::names(.arg_handle)
      .arg_conflict <- base::intersect(.arg_names, base::c(
        if (!base::missing(mode)) "mode",
        if (!base::missing(details)) "details"
      ))
      if (base::length(.arg_conflict) > 0L) cli::cli_abort(base::c("Argument {.arg {(.arg_conflict)}} of {.fn is_tree} was supplied more than once.", i = "Pass it exactly once, by its new name {.arg {(.arg_conflict)}}."))
      base::list2env(.arg_handle, base::environment())
      lifecycle::deprecate_soft(
        "3.0.0",
        what = base::I("Calling `is_tree()` with positional or abbreviated arguments"),
        details = base::c(
          i = base::paste0("Detected call:  is_tree(", base::paste(base::c("graph", .arg_names), collapse = ", "), ")"),
          i = base::paste0("Use instead:    is_tree(", base::paste(base::c("graph", base::paste0(.arg_names, " = ")), collapse = ", "), ")")
        )
      )
    }
  }
  # END GENERATED ARG_HANDLE

  out <- is_tree_impl(
    graph = graph,
    mode = mode,
    details = details
  )

  if (isTRUE(details) && !out$res && vcount(graph) > 0) {
    out$root <- V(graph)[1]
  }
  out
}

#' Decide whether a graph is a forest.
#'
#' `is_forest()` decides whether a graph is a forest, and optionally returns a
#' set of possible root vertices for its components.
#'
#' An undirected graph is a forest if it has no cycles. In the directed case,
#' a possible additional requirement is that edges in each tree are oriented
#' away from the root (out-trees or arborescences) or all edges are oriented
#' towards the root (in-trees or anti-arborescences). This test can be
#' controlled using the mode parameter.
#'
#' By convention, the null graph (i.e. the graph with no vertices) is considered
#' to be a forest.
#'
#' @param graph An igraph graph object
#' @inheritParams rlang::args_dots_empty
#' @param mode Whether to consider edge directions in a directed graph.
#'   \sQuote{all} ignores edge directions; \sQuote{out} requires edges to be
#'   oriented outwards from the root, \sQuote{in} requires edges to be oriented
#'   towards the root.
#' @param details Whether to return only whether the graph is a tree (`FALSE`)
#'   or also a possible root (`TRUE`)
#' @return When `details` is `FALSE`, a logical value that indicates
#'   whether the graph is a tree. When `details` is `TRUE`, a named
#'   list with two entries:
#'   \describe{
#'     \item{res}{
#'       Logical value that indicates whether the graph is a tree.
#'     }
#'     \item{root}{
#'       The root vertex of the tree; undefined if the graph is not a tree.
#'     }
#'   }
#'
#' @keywords graphs
#' @examples
#'
#' g <- make_tree(3) + make_tree(5, 3)
#' is_forest(g)
#' is_forest(g, details = TRUE)
#'
#' @family trees
#' @export
is_forest <- function(
  graph,
  ...,
  mode = c("out", "in", "all", "total"),
  details = FALSE
) {
  # BEGIN GENERATED ARG_HANDLE: is_forest, do not edit, see tools/generate-migrations.R
  # fmt: skip
  if (...length() > 0L) {
    # Pre-3.0.0 signature: is_forest(graph, mode, details)
    .old_signature <- function(mode, details, ...) {
      if (...length() > 0L) {
        .arg_extra <- base::names(base::substitute(...()))
        .arg_extra <- .arg_extra[base::nzchar(.arg_extra)]
        if (base::length(.arg_extra) == 0L) cli::cli_abort("Too many arguments passed to {.fn is_forest}.", call = base::parent.frame())
        cli::cli_abort(base::c("Unexpected argument passed to {.fn is_forest}: {.arg {(.arg_extra)}}.", i = "Arguments after {.arg ...} must be spelled out in full."), call = base::parent.frame())
      }
      base::c(
        if (!base::missing(mode)) base::list(mode = mode),
        if (!base::missing(details)) base::list(details = details)
      )
    }
    .arg_handle <- .old_signature(...)
    if (base::length(.arg_handle) > 0L) {
      .arg_names <- base::names(.arg_handle)
      .arg_conflict <- base::intersect(.arg_names, base::c(
        if (!base::missing(mode)) "mode",
        if (!base::missing(details)) "details"
      ))
      if (base::length(.arg_conflict) > 0L) cli::cli_abort(base::c("Argument {.arg {(.arg_conflict)}} of {.fn is_forest} was supplied more than once.", i = "Pass it exactly once, by its new name {.arg {(.arg_conflict)}}."))
      base::list2env(.arg_handle, base::environment())
      lifecycle::deprecate_soft(
        "3.0.0",
        what = base::I("Calling `is_forest()` with positional or abbreviated arguments"),
        details = base::c(
          i = base::paste0("Detected call:  is_forest(", base::paste(base::c("graph", .arg_names), collapse = ", "), ")"),
          i = base::paste0("Use instead:    is_forest(", base::paste(base::c("graph", base::paste0(.arg_names, " = ")), collapse = ", "), ")")
        )
      )
    }
  }
  # END GENERATED ARG_HANDLE

  is_forest_impl(
    graph = graph,
    mode = mode,
    details = details
  )
}

#' Convert a tree graph to its Prüfer sequence
#'
#' `to_prufer()` converts a tree graph into its Prüfer sequence.
#'
#' The Prüfer sequence of a tree graph with n labeled vertices is a sequence of
#' n-2 numbers, constructed as follows. If the graph has more than two vertices,
#' find a vertex with degree one, remove it from the tree and add the label of
#' the vertex that it was connected to to the sequence. Repeat until there are
#' only two vertices in the remaining graph.
#'
#' @param graph The graph to convert to a Prüfer sequence
#' @return The Prüfer sequence of the graph, represented as a numeric vector of
#'   vertex IDs in the sequence.
#'
#' @seealso [make_from_prufer()] to construct a graph from its
#' Prüfer sequence
#' @keywords graphs
#' @examples
#'
#' g <- make_tree(13, 3)
#' to_prufer(g)
#'
#' @family trees
#' @export
to_prufer <- function(graph) {
  to_prufer_impl(
    graph = graph
  )
}

#' Samples from the spanning trees of a graph randomly and uniformly
#'
#' `sample_spanning_tree()` picks a spanning tree of an undirected graph
#' randomly and uniformly, using loop-erased random walks.
#'
#' @param graph The input graph to sample from. Edge directions are ignored if
#'   the graph is directed.
#' @inheritParams rlang::args_dots_empty
#' @param vid When the graph is disconnected, this argument specifies how to
#'   handle the situation. When the argument is zero (the default), the sampling
#'   will be performed component-wise, and the result will be a spanning forest.
#'   When the argument contains a vertex ID, only the component containing the
#'   given vertex will be processed, and the result will be a spanning tree of the
#'   component of the graph.
#' @return An edge sequence containing the edges of the spanning tree. Use
#'   [subgraph_from_edges()] to extract the corresponding subgraph.
#'
#' @keywords graph
#' @seealso [subgraph_from_edges()] to extract the tree itself
#' @examples
#'
#' g <- make_full_graph(10) %du% make_full_graph(5)
#' edges <- sample_spanning_tree(g)
#' forest <- subgraph_from_edges(g, edges)
#'
#' @family trees
#' @export
sample_spanning_tree <- function(
  graph,
  ...,
  vid = 0
) {
  # BEGIN GENERATED ARG_HANDLE: sample_spanning_tree, do not edit, see tools/generate-migrations.R
  # fmt: skip
  if (...length() > 0L) {
    # Pre-3.0.0 signature: sample_spanning_tree(graph, vid)
    .old_signature <- function(vid, ...) {
      if (...length() > 0L) {
        .arg_extra <- base::names(base::substitute(...()))
        .arg_extra <- .arg_extra[base::nzchar(.arg_extra)]
        if (base::length(.arg_extra) == 0L) cli::cli_abort("Too many arguments passed to {.fn sample_spanning_tree}.", call = base::parent.frame())
        cli::cli_abort(base::c("Unexpected argument passed to {.fn sample_spanning_tree}: {.arg {(.arg_extra)}}.", i = "Arguments after {.arg ...} must be spelled out in full."), call = base::parent.frame())
      }
      base::c(
        if (!base::missing(vid)) base::list(vid = vid)
      )
    }
    .arg_handle <- .old_signature(...)
    if (base::length(.arg_handle) > 0L) {
      .arg_names <- base::names(.arg_handle)
      .arg_conflict <- base::intersect(.arg_names, base::c(
        if (!base::missing(vid)) "vid"
      ))
      if (base::length(.arg_conflict) > 0L) cli::cli_abort(base::c("Argument {.arg {(.arg_conflict)}} of {.fn sample_spanning_tree} was supplied more than once.", i = "Pass it exactly once, by its new name {.arg {(.arg_conflict)}}."))
      base::list2env(.arg_handle, base::environment())
      lifecycle::deprecate_soft(
        "3.0.0",
        what = base::I("Calling `sample_spanning_tree()` with positional or abbreviated arguments"),
        details = base::c(
          i = base::paste0("Detected call:  sample_spanning_tree(", base::paste(base::c("graph", .arg_names), collapse = ", "), ")"),
          i = base::paste0("Use instead:    sample_spanning_tree(", base::paste(base::c("graph", base::paste0(.arg_names, " = ")), collapse = ", "), ")")
        )
      )
    }
  }
  # END GENERATED ARG_HANDLE

  random_spanning_tree_impl(
    graph = graph,
    vid = vid
  )
}
