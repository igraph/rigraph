## -----------------------------------------------------------------------
##
##   IGraph R package
##   Copyright (C) 2014  Gabor Csardi <csardi.gabor@gmail.com>
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

#' Rewiring edges of a graph
#'
#' See the links below for the implemented rewiring methods.
#'
#' @param graph The graph to rewire
#' @param with A function call to one of the rewiring methods,
#'   see details below.
#' @return The rewired graph.
#'
#' @family rewiring functions
#' @export rewire
#' @examples
#' g <- make_ring(10)
#' g %>%
#'   rewire(each_edge(p = 0.1, loops = FALSE)) %>%
#'   plot(layout = layout_in_circle)
#' print_all(rewire(g, with = keeping_degseq(niter = vcount(g) * 10)))
rewire <- function(graph, with) {
  if (!is(with, "igraph_rewiring_method")) {
    cli::cli_abort(
      "{.arg with} must be an igraph rewiring method,
      not {.obj_type_friendly {with}}."
    )
  }
  do_call(with$fun, list(graph), .args = with$args)
}

#' Graph rewiring while preserving the degree distribution
#'
#' This function can be used together with [rewire()] to
#' randomly rewire the edges while preserving the original graph's degree
#' distribution.
#'
#' The rewiring algorithm chooses two arbitrary edges in each step ((a,b)
#' and (c,d)) and substitutes them with (a,d) and (c,b), if they not
#' already exists in the graph. The algorithm does not create multiple
#' edges.
#'
#' @param loops Whether to allow destroying and creating loop edges.
#' @param niter Number of rewiring trials to perform.
#'
#' @author Tamas Nepusz \email{ntamas@@gmail.com} and Gabor Csardi
#' \email{csardi.gabor@@gmail.com}
#' @family rewiring functions
#' @seealso [sample_degseq()]
#' @export
#' @keywords graphs
#' @examples
#' g <- make_ring(10)
#' g %>%
#'   rewire(keeping_degseq(niter = 20)) %>%
#'   degree()
#' print_all(rewire(g, with = keeping_degseq(niter = vcount(g) * 10)))
keeping_degseq <- function(loops = FALSE, niter = 100) {
  method <- list(
    fun = rewire_keeping_degseq,
    args = list(loops = loops, niter = niter)
  )
  add_class(method, "igraph_rewiring_method")
}

rewire_keeping_degseq <- function(graph, loops, niter) {
  loops <- as.logical(loops)
  mode <- if (loops) "simple_loops" else "simple"

  rewire_impl(
    rewire = graph,
    n = niter,
    mode = mode
  )
}

#' Rewires the endpoints of the edges of a graph to a random vertex
#'
#' This function can be used together with [rewire()].
#' This method rewires the endpoints of the edges with a constant probability
#' uniformly randomly to a new vertex in a graph.
#'
#' Note that this method might create graphs with multiple and/or loop edges.
#'
#' @param prob The rewiring probability, a real number between zero and one.
#' @inheritParams rlang::args_dots_empty
#' @param loops Logical, whether loop edges are allowed in the rewired
#'   graph.
#' @param multiple Logical, whether multiple edges are allowed in the
#'   generated graph.
#' @param mode Character string, specifies which endpoint of the edges to rewire
#'   in directed graphs. \sQuote{all} rewires both endpoints, \sQuote{in} rewires
#'   the start (tail) of each directed edge, \sQuote{out} rewires the end (head)
#'   of each directed edge. Ignored for undirected graphs.
#'
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @family rewiring functions
#' @export
#' @keywords graphs
#' @examples
#'
#' # Some random shortcuts shorten the distances on a lattice
#' g <- make_lattice(length = 100, dim = 1, nei = 5)
#' mean_distance(g)
#' g <- rewire(g, each_edge(prob = 0.05))
#' mean_distance(g)
#'
#' # Rewiring the start of each directed edge preserves the in-degree distribution
#' # but not the out-degree distribution
#' g <- sample_pa(1000)
#' g2 <- g %>% rewire(each_edge(mode = "in", multiple = TRUE, prob = 0.2))
#' degree(g, mode = "in") == degree(g2, mode = "in")
each_edge <- function(
  prob,
  ...,
  loops = FALSE,
  multiple = FALSE,
  mode = c("all", "out", "in", "total")
) {
  # BEGIN GENERATED ARG_HANDLE: each_edge, do not edit, see tools/generate-migrations.R
  # fmt: skip
  if (...length() > 0L) {
    .arg_ambiguous <- base::intersect(base::names(base::Filter(function(.x) !(base::is.symbol(.x) && !base::nzchar(base::as.character(.x))), base::as.list(base::substitute(...())))), base::c("m"))
    if (base::length(.arg_ambiguous) > 0L) cli::cli_abort("Argument {.arg {(.arg_ambiguous[[1L]])}} matches multiple arguments of {.fn each_edge}.")
    # Pre-3.0.0 signature: each_edge(prob, loops, multiple, mode)
    .old_signature <- function(loops, multiple, mode, ...) {
      if (...length() > 0L) {
        .arg_extra <- base::names(base::substitute(...()))
        .arg_extra <- .arg_extra[base::nzchar(.arg_extra)]
        if (base::length(.arg_extra) == 0L) cli::cli_abort("Too many arguments passed to {.fn each_edge}.", call = base::parent.frame())
        cli::cli_abort(base::c("Unexpected argument passed to {.fn each_edge}: {.arg {(.arg_extra)}}.", i = "Arguments after {.arg ...} must be spelled out in full."), call = base::parent.frame())
      }
      base::c(
        if (!base::missing(loops)) base::list(loops = loops),
        if (!base::missing(multiple)) base::list(multiple = multiple),
        if (!base::missing(mode)) base::list(mode = mode)
      )
    }
    .arg_handle <- .old_signature(...)
    if (base::length(.arg_handle) > 0L) {
      .arg_names <- base::names(.arg_handle)
      .arg_conflict <- base::intersect(.arg_names, base::c(
        if (!base::missing(loops)) "loops",
        if (!base::missing(multiple)) "multiple",
        if (!base::missing(mode)) "mode"
      ))
      if (base::length(.arg_conflict) > 0L) cli::cli_abort(base::c("Argument {.arg {(.arg_conflict)}} of {.fn each_edge} was supplied more than once.", i = "Pass it exactly once, by its new name {.arg {(.arg_conflict)}}."))
      base::list2env(.arg_handle, base::environment())
      lifecycle::deprecate_soft(
        "3.0.0",
        what = base::I("Calling `each_edge()` with positional or abbreviated arguments"),
        details = base::c(
          i = base::paste0("Detected call:  each_edge(", base::paste(base::c("prob", .arg_names), collapse = ", "), ")"),
          i = base::paste0("Use instead:    each_edge(", base::paste(base::c("prob", base::paste0(.arg_names, " = ")), collapse = ", "), ")")
        )
      )
    }
  }
  # END GENERATED ARG_HANDLE

  mode <- igraph_match_arg(mode)
  multiple <- as.logical(multiple)
  if (mode != "all" && mode != "total") {
    if (!multiple) {
      cli::cli_abort(
        '{.code multiple = FALSE} is not supported
         when {.code mode != "all"}'
      )
    }
    method <- list(
      fun = rewire_each_directed_edge,
      args = list(prob = prob, loops = loops, mode = mode)
    )
  } else {
    method <- list(
      fun = rewire_each_edge,
      args = list(prob = prob, loops = loops, multiple = multiple)
    )
  }
  add_class(method, "igraph_rewiring_method")
}

rewire_each_edge <- function(graph, prob, loops, multiple) {
  rewire_edges_impl(
    graph = graph,
    prob = prob,
    loops = loops,
    multiple = multiple
  )
}

rewire_each_directed_edge <- function(graph, prob, loops, mode) {
  rewire_directed_edges_impl(
    graph = graph,
    prob = prob,
    loops = loops,
    mode = mode
  )
}
