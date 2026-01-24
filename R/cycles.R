## -----------------------------------------------------------------------
##
##   igraph R package
##   Copyright (C) 2024  The igraph development team <igraph@igraph.org>
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
##   along with this program.  If not, see <https://www.gnu.org/licenses/>.
##
## -----------------------------------------------------------------------

#' Finds a cycle in a graph, if there is one
#'
#' @description
#' `r lifecycle::badge("experimental")`
#'
#' This function returns a cycle of the graph, in terms of both its vertices
#' and edges. If the graph is acyclic, it returns empty vertex and edge
#' sequences.
#'
#' Use [is_acyclic()] to determine if a graph has cycles, without returning
#' a specific cycle.
#'
#' @param graph The input graph.
#' @param mode Character constant specifying how to handle directed graphs.
#'   `out` follows edge directions, `in` follows edges in the reverse direction,
#'   and `all` ignores edge directions. Ignored in undirected graphs.
#' @return A list of integer vectors, each integer vector is a path from
#'   the source vertex to one of the target vertices. A path is given by its
#'   vertex ids.
#' @keywords graphs
#' @examples
#'
#' g <- make_lattice(c(3, 3))
#' find_cycle(g)
#'
#' # Empty results are returned for acyclic graphs
#' find_cycle(sample_tree(5))
#'
#' @family cycles
#' @cdocs igraph_find_cycle
#' @export

find_cycle <- function(graph, mode = c("out", "in", "all", "total")) {
  find_cycle_impl(
    graph = graph,
    mode = mode
  )
}


#' Finds all simple cycles in a graph.
#'
#' @description
#' `r lifecycle::badge("experimental")`
#'
#' This function lists all simple cycles in a graph within a range of cycle
#' lengths. A cycle is called simple if it has no repeated vertices.
#'
#' Multi-edges and self-loops are taken into account. Note that typical graphs
#' have exponentially many cycles and the presence of multi-edges exacerbates
#' this combinatorial explosion.
#'
#' @inheritParams find_cycle
#' @param min Lower limit on cycle lengths to consider. `NULL` means no limit.
#' @param max Upper limit on cycle lengths to consider. `NULL` means no limit.
#' @return A named list, with two entries:
#' \item{vertices}{The list of cycles in terms of their vertices.}
#' \item{edges}{The list of cycles in terms of their edges.}
#' @keywords graphs
#' @examples
#'
#' g <- graph_from_literal(A -+ B -+ C -+ A -+ D -+ E +- F -+ A, E -+ E, A -+ F, simplify = FALSE)
#' simple_cycles(g)
#' simple_cycles(g, mode = "all") # ignore edge directions
#' simple_cycles(g, mode = "all", min = 2, max = 3) # limit cycle lengths
#'
#' @family cycles
#' @cdocs igraph_simple_cycles
#' @param ... These dots are for future extensions and must be empty.
#' @param callback Optional function to call for each cycle found. If provided,
#'   the function should accept two arguments: `vertices` (integer vector of vertex
#'   IDs in the cycle) and `edges` (integer vector of edge IDs
#'   in the cycle). The function should return `TRUE` to continue
#'   the search or `FALSE` to stop it. If `NULL` (the default), all cycles are
#'   collected and returned as a list.
#' @return If `callback` is `NULL`, returns a list with two elements: `vertices`
#'   (list of integer vectors with vertex IDs) and `edges` (list of integer vectors
#'   with edge IDs). If `callback` is provided, returns `NULL` invisibly.
#' @export
#' @cdocs igraph_simple_cycles igraph_simple_cycles_callback

simple_cycles <- function(
  graph,
  mode = c("out", "in", "all", "total"),
  min = NULL,
  max = NULL,
  ...,
  callback = NULL
) {
  # Argument checks
  ensure_igraph(graph)
  check_dots_empty()

  if (is.null(callback)) {
    simple_cycles_impl(
      graph = graph,
      mode = mode,
      min_cycle_length = min %||% -1,
      max_cycle_length = max %||% -1
    )
  } else {

    simple_cycles_callback_closure_impl(
      graph = graph,
      mode = mode,
      min_cycle_length = min %||% -1,
      max_cycle_length = max %||% -1,
      callback = callback
    )
    invisible(NULL)
  }
}
