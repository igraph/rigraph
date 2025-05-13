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

find_cycle <- find_cycle_impl


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
#' @export

simple_cycles <- function(
  graph,
  mode = c("out", "in", "all", "total"),
  min = NULL,
  max = NULL
) {
  # Argument checks
  ensure_igraph(graph)

  simple_cycles_impl(graph, mode, min %||% -1, max %||% -1)
}
