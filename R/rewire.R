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
#'   rewire(each_edge(p = .1, loops = FALSE)) %>%
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
  ensure_igraph(graph)

  loops <- as.logical(loops)
  mode <- if (loops) 1 else 0

  on.exit(.Call(R_igraph_finalizer))
  .Call(R_igraph_rewire, graph, as.numeric(niter), as.numeric(mode))
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
#' @param loops Logical scalar, whether loop edges are allowed in the rewired
#'   graph.
#' @param multiple Logical scalar, whether multiple edges are allowed in the
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
  loops = FALSE,
  multiple = FALSE,
  mode = c("all", "out", "in", "total")
) {
  mode <- switch(
    igraph.match.arg(mode),
    "out" = 1,
    "in" = 2,
    "all" = 3,
    "total" = 3
  )
  multiple <- as.logical(multiple)
  if (mode != 3) {
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
  ensure_igraph(graph)

  on.exit(.Call(R_igraph_finalizer))
  .Call(
    R_igraph_rewire_edges,
    graph,
    as.numeric(prob),
    as.logical(loops),
    as.logical(multiple)
  )
}

rewire_each_directed_edge <- function(graph, prob, loops, mode) {
  ensure_igraph(graph)

  on.exit(.Call(R_igraph_finalizer))
  .Call(
    R_igraph_rewire_directed_edges,
    graph,
    as.numeric(prob),
    as.logical(loops),
    as.numeric(mode)
  )
}
