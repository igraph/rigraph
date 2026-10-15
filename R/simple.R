#' Simple graphs
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `is.simple()` was renamed to [is_simple()] to create a more
#' consistent API.
#' @inheritParams is_simple
#' @keywords internal
#' @export
is.simple <- function(graph) {
  # nocov start
  lifecycle::deprecate_warn("2.0.0", "is.simple()", "is_simple()")
  is_simple(graph = graph)
} # nocov end

## -----------------------------------------------------------------------
##
##   IGraph R package
##   Copyright (C) 2015  Gabor Csardi <csardi.gabor@gmail.com>
##   334 Harvard street, Cambridge, MA 02139 USA
##
##   This program is free software; you can redistribute it and/or modify
##   it under the terms of the GNU General Public License as published by
##   the Free Software Foundation; either version 2 of the License, or
##   (at your option) any later version.
##
##   This program is distributed in the hope that it will be useful,
##   but WITHOUT ANY WARRANTY; without even the implied warranty of
##   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
##   GNU General Public License for more details.
##
##   You should have received a copy of the GNU General Public License
##   along with this program; if not, write to the Free Software
##   Foundation, Inc.,  51 Franklin Street, Fifth Floor, Boston, MA
##   02110-1301 USA
##
## -----------------------------------------------------------------------

#' Simple graphs
#'
#' Simple graphs are graphs which do not contain loop and multiple edges.
#'
#' A loop edge is an edge for which the two endpoints are the same
#' vertex. Two edges are multiple edges if they have exactly the same two
#' endpoints (for directed graphs order does matter). A graph is simple is
#' it does not contain loop edges and multiple edges.
#'
#' `is_simple()` checks whether a graph is simple.
#'
#' `simplify()` removes the loop and/or multiple edges from a graph.  If
#' both `remove.loops` and `remove.multiple` are `TRUE` the
#' function returns a simple graph. If the graph is already simple, it is
#' returned unchanged.
#'
#' `simplify_and_colorize()` constructs a new, simple graph from a graph and
#' also sets a `color` attribute on both the vertices and the edges.
#' The colors of the vertices represent the number of self-loops that were
#' originally incident on them, while the colors of the edges represent the
#' multiplicities of the same edges in the original graph. This allows one to
#' take into account the edge multiplicities and the number of loop edges in
#' the VF2 isomorphism algorithm. Other graph, vertex and edge attributes from
#' the original graph are discarded as the primary purpose of this function is
#' to facilitate the usage of multigraphs with the VF2 algorithm.
#'
#' @aliases simplify
#' @param graph The graph to work on.
#' @param remove.loops Logical, whether the loop edges are to be removed.
#' @param remove.multiple Logical, whether the multiple edges are to be
#'   removed.
#' @inheritParams rlang::args_dots_empty
#' @param edge_attr_combine Specifies what to do with edge attributes, if
#'   `remove.multiple=TRUE`. In this case many edges might be mapped to a
#'   single one in the new graph, and their attributes are combined. Please see
#'   [attribute.combination()] for details on this. The default `NULL` uses
#'   the `edge_attr_combine` igraph option.
#' @return a graph object with the loop and/or multiple edges removed; the
#'   input graph is returned unchanged if it is already simple.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @seealso [which_loop()], [which_multiple()] and
#' [count_multiple()], [delete_edges()],
#' [delete_vertices()]
#' @keywords graphs
#' @examples
#'
#' g <- make_graph(c(1, 2, 1, 2, 3, 3))
#' is_simple(g)
#' is_simple(simplify(g, remove.loops = FALSE))
#' is_simple(simplify(g, remove.multiple = FALSE))
#' is_simple(simplify(g))
#' @family simple
#' @family functions for manipulating graph structure
#' @family isomorphism
#' @export
simplify <- function(
  graph,
  remove.multiple = TRUE,
  remove.loops = TRUE,
  ...,
  edge_attr_combine = NULL
) {
  # BEGIN GENERATED ARG_HANDLE: simplify, do not edit, see tools/generate-migrations.R
  # fmt: skip
  if (...length() > 0L) {
    .arg_ambiguous <- base::intersect(base::names(base::substitute(...())), base::c("e", "ed", "edg", "edge"))
    if (base::length(.arg_ambiguous) > 0L) cli::cli_abort("Argument {.arg {(.arg_ambiguous[[1L]])}} matches multiple arguments of {.fn simplify}.")
    # Pre-3.0.0 signature: simplify(graph, remove.multiple, remove.loops, edge.attr.comb)
    .old_signature <- function(edge.attr.comb, ...) {
      if (...length() > 0L) {
        .arg_extra <- base::names(base::substitute(...()))
        .arg_extra <- .arg_extra[base::nzchar(.arg_extra)]
        if (base::length(.arg_extra) == 0L) cli::cli_abort("Too many arguments passed to {.fn simplify}.", call = base::parent.frame())
        cli::cli_abort(base::c("Unexpected argument passed to {.fn simplify}: {.arg {(.arg_extra)}}.", i = "Arguments after {.arg ...} must be spelled out in full."), call = base::parent.frame())
      }
      base::c(
        if (!base::missing(edge.attr.comb)) base::list(edge_attr_combine = edge.attr.comb)
      )
    }
    .arg_handle <- .old_signature(...)
    if (base::length(.arg_handle) > 0L) {
      .arg_names <- base::names(.arg_handle)
      .arg_conflict <- base::intersect(.arg_names, base::c(
        if (!base::missing(edge_attr_combine)) "edge_attr_combine"
      ))
      if (base::length(.arg_conflict) > 0L) cli::cli_abort(base::c("Argument {.arg {(.arg_conflict)}} of {.fn simplify} was supplied more than once.", i = "Pass it exactly once, by its new name {.arg {(.arg_conflict)}}."))
      base::list2env(.arg_handle, base::environment())
      lifecycle::deprecate_soft(
        "3.0.0",
        what = base::I("Calling `simplify()` with positional or abbreviated arguments"),
        details = base::c(
          i = base::paste0("Detected call:  simplify(", base::paste(base::c("graph", "remove.multiple", "remove.loops", base::c(edge_attr_combine = "edge.attr.comb")[.arg_names]), collapse = ", "), ")"),
          i = base::paste0("Use instead:    simplify(", base::paste(base::c("graph", "remove.multiple", "remove.loops", base::paste0(.arg_names, " = ")), collapse = ", "), ")")
        )
      )
    }
  }
  # END GENERATED ARG_HANDLE

  # There was a short-circuit here -- `if (is_simple(graph)) return(graph)` --
  # on the grounds that a graph with no loops and no multiple edges has
  # nothing for simplify_impl() to remove. That is true of its *structure* and
  # false of its attributes: `edge_attr_combine` does not only combine attributes
  # across merged edges, it decides which survive at all, and an attribute the
  # combination list does not name is dropped even when every group has one
  # member. The default list ends in `"ignore"`, so `simplify(g)` on a simple
  # graph is meant to keep `weight` and drop everything else, and
  # `edge_attr_combine = "ignore"` is meant to leave no edge attributes at all.
  # Returning `graph` untouched silently kept them both.
  #
  # Guarding the short-circuit on the graph having no edge attributes does not
  # fix it, which is the part worth remembering: `is_simple()` populates the
  # C core's property cache, and `simplify.c` has a cache fast path of its own
  # that returns early without applying `edge_comb` once the cache says there
  # is nothing to remove. So merely *asking* whether the graph is simple
  # changes what simplifying it does. On 2.3.3 that made the result depend on
  # whether anything had happened to touch the cache first; the short-circuit
  # made the cache-warm answer the only answer.
  #
  # The check therefore lives at the call site that wants it --
  # `graph_from_literal_i()`, which is what #824 and #1981 were about, and
  # which simplifies a graph it has only just built from the formula, before
  # any attribute is set on it. Everywhere else `simplify()` goes through
  # `simplify_impl()` as it always did.
  if (is.null(edge_attr_combine)) {
    edge_attr_combine <- igraph_opt("edge_attr_combine")
  }
  simplify_impl(
    graph = graph,
    remove_multiple = remove.multiple,
    remove_loops = remove.loops,
    edge_attr_comb = edge_attr_combine
  )
}

#' @export
#' @rdname simplify
is_simple <- function(graph) {
  is_simple_impl(
    graph = graph
  )
}

#' @export
#' @rdname simplify
simplify_and_colorize <- function(graph) {
  # Argument checks
  ensure_igraph(graph)

  # Function call
  res <- simplify_and_colorize_impl(
    graph = graph
  )

  V(res$res)$color <- res$vertex_color
  E(res$res)$color <- res$edge_color
  res$res
}
