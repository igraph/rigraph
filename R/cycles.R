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
#' g <- make_lattice(c(3,3))
#' find_cycle(g)
#'
#' # Empty results are returned for acyclic graphs
#' find_cycle(sample_tree(5))
#'
#' @family cycles
#' @export

find_cycle <- find_cycle_impl
