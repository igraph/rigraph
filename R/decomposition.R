#' Chordality of a graph
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `is.chordal()` was renamed to [is_chordal()] to create a more
#' consistent API.
#' @inheritParams is_chordal
#' @keywords internal
#' @export
is.chordal <- function(
  graph,
  alpha = NULL,
  alpham1 = NULL,
  fillin = FALSE,
  newgraph = FALSE
) {
  # nocov start
  lifecycle::deprecate_warn("2.0.0", "is.chordal()", "is_chordal()")
  is_chordal(
    graph = graph,
    alpha = alpha,
    alpham1 = alpham1,
    fillin = fillin,
    newgraph = newgraph
  )
} # nocov end
#   IGraph R package
#   Copyright (C) 2008-2012  Gabor Csardi <csardi.gabor@gmail.com>
#   334 Harvard street, Cambridge, MA 02139 USA
#
#   This program is free software; you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation; either version 2 of the License, or
#   (at your option) any later version.
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with this program; if not, write to the Free Software
#   Foundation, Inc.,  51 Franklin Street, Fifth Floor, Boston, MA
#   02110-1301 USA
#
###################################################################

###################################################################
# Graph decomposition
###################################################################

#' Chordality of a graph
#'
#' A graph is chordal (or triangulated) if each of its cycles of four or more
#' nodes has a chord, which is an edge joining two nodes that are not adjacent
#' in the cycle. An equivalent definition is that any chordless cycles have at
#' most three nodes.
#'
#' The chordality of the graph is decided by first performing maximum
#' cardinality search on it (if the `alpha` and `alpham1` arguments
#' are `NULL`), and then calculating the set of fill-in edges.
#'
#' The set of fill-in edges is empty if and only if the graph is chordal.
#'
#' It is also true that adding the fill-in edges to the graph makes it chordal.
#'
#' @param graph The input graph. It may be directed, but edge directions are
#'   ignored, as the algorithm is defined for undirected graphs.
#' @inheritParams rlang::args_dots_empty
#' @param alpha Numeric vector, the maximal chardinality ordering of the
#'   vertices. If it is `NULL`, then it is automatically calculated by
#'   calling [max_cardinality()], or from `alpham1` if
#'   that is given..
#' @param alpham1 Numeric vector, the inverse of `alpha`. If it is
#'   `NULL`, then it is automatically calculated by calling
#'   [max_cardinality()], or from `alpha`.
#' @param fillin Logical, whether to calculate the fill-in edges.
#' @param newgraph Logical, whether to calculate the triangulated graph.
#' @return A list with three members:
#'   \describe{
#'     \item{chordal}{
#'       Logical, it is `TRUE` iff the input graph is chordal.
#'     }
#'     \item{fillin}{
#'       If requested, then a numeric vector giving the fill-in edges. `NULL` otherwise.
#'     }
#'     \item{newgraph}{
#'       If requested, then the triangulated graph, an `igraph` object. `NULL` otherwise.
#'     }
#'   }
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @seealso [max_cardinality()]
#' @references Robert E Tarjan and Mihalis Yannakakis. (1984). Simple
#' linear-time algorithms to test chordality of graphs, test acyclicity of
#' hypergraphs, and selectively reduce acyclic hypergraphs.  *SIAM Journal
#' of Computation* 13, 566--579.
#' @family chordal
#' @export
#' @keywords graphs
#' @examples
#'
#' ## The examples from the Tarjan-Yannakakis paper
#' g1 <- graph_from_literal(
#'   A - B:C:I, B - A:C:D, C - A:B:E:H, D - B:E:F,
#'   E - C:D:F:H, F - D:E:G, G - F:H, H - C:E:G:I,
#'   I - A:H
#' )
#' max_cardinality(g1)
#' is_chordal(g1, fillin = TRUE)
#'
#' g2 <- graph_from_literal(
#'   A - B:E, B - A:E:F:D, C - E:D:G, D - B:F:E:C:G,
#'   E - A:B:C:D:F, F - B:D:E, G - C:D:H:I, H - G:I:J,
#'   I - G:H:J, J - H:I
#' )
#' max_cardinality(g2)
#' is_chordal(g2, fillin = TRUE)
#'
is_chordal <- function(
  graph,
  ...,
  alpha = NULL,
  alpham1 = NULL,
  fillin = FALSE,
  newgraph = FALSE
) {
  # BEGIN GENERATED ARG_HANDLE: is_chordal, do not edit, see tools/generate-migrations.R
  # fmt: skip
  if (...length() > 0L) {
    .arg_ambiguous <- base::intersect(base::names(base::Filter(function(.x) !(base::is.symbol(.x) && !base::nzchar(base::as.character(.x))), base::as.list(base::substitute(...())))), base::c("a", "al", "alp", "alph"))
    if (base::length(.arg_ambiguous) > 0L) cli::cli_abort("Argument {.arg {(.arg_ambiguous[[1L]])}} matches multiple arguments of {.fn is_chordal}.")
    # Pre-3.0.0 signature: is_chordal(graph, alpha, alpham1, fillin, newgraph)
    .old_signature <- function(alpha, alpham1, fillin, newgraph, ...) {
      if (...length() > 0L) {
        .arg_extra <- base::names(base::substitute(...()))
        .arg_extra <- .arg_extra[base::nzchar(.arg_extra)]
        if (base::length(.arg_extra) == 0L) cli::cli_abort("Too many arguments passed to {.fn is_chordal}.", call = base::parent.frame())
        cli::cli_abort(base::c("Unexpected argument passed to {.fn is_chordal}: {.arg {(.arg_extra)}}.", i = "Arguments after {.arg ...} must be spelled out in full."), call = base::parent.frame())
      }
      base::c(
        if (!base::missing(alpha)) base::list(alpha = alpha),
        if (!base::missing(alpham1)) base::list(alpham1 = alpham1),
        if (!base::missing(fillin)) base::list(fillin = fillin),
        if (!base::missing(newgraph)) base::list(newgraph = newgraph)
      )
    }
    .arg_handle <- .old_signature(...)
    if (base::length(.arg_handle) > 0L) {
      .arg_names <- base::names(.arg_handle)
      .arg_conflict <- base::intersect(.arg_names, base::c(
        if (!base::missing(alpha)) "alpha",
        if (!base::missing(alpham1)) "alpham1",
        if (!base::missing(fillin)) "fillin",
        if (!base::missing(newgraph)) "newgraph"
      ))
      if (base::length(.arg_conflict) > 0L) cli::cli_abort(base::c("Argument {.arg {(.arg_conflict)}} of {.fn is_chordal} was supplied more than once.", i = "Pass it exactly once, by its new name {.arg {(.arg_conflict)}}."))
      base::list2env(.arg_handle, base::environment())
      lifecycle::deprecate_soft(
        "3.0.0",
        what = base::I("Calling `is_chordal()` with positional or abbreviated arguments"),
        details = base::c(
          i = base::paste0("Detected call:  is_chordal(", base::paste(base::c("graph", .arg_names), collapse = ", "), ")"),
          i = base::paste0("Use instead:    is_chordal(", base::paste(base::c("graph", base::paste0(.arg_names, " = ")), collapse = ", "), ")")
        )
      )
    }
  }
  # END GENERATED ARG_HANDLE

  ensure_igraph(graph)
  if (!is.null(alpha)) {
    alpha <- as.numeric(alpha) - 1
  }
  if (!is.null(alpham1)) {
    alpham1 <- as.numeric(alpham1) - 1
  }
  fillin <- as.logical(fillin)
  newgraph <- as.logical(newgraph)
  on.exit(.Call(Rx_igraph_finalizer))
  res <- .Call(
    Rx_igraph_is_chordal,
    graph,
    alpha,
    alpham1,
    fillin,
    newgraph
  )
  if (fillin) {
    res$fillin <- res$fillin + 1
  }
  res
}
