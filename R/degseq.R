
#' Is a degree sequence graphical?
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `is.graphical.degree.sequence()` was renamed to `is_graphical()` to create a more
#' consistent API.
#' @inheritParams is_graphical
#' @keywords internal
#' @export
is.graphical.degree.sequence <- function(out.deg, in.deg = NULL, allowed.edge.types = c("simple", "loops", "multi", "all")) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "is.graphical.degree.sequence()", "is_graphical()")
  is_graphical(out.deg = out.deg, in.deg = in.deg, allowed.edge.types = allowed.edge.types)
} # nocov end

#' Check if a degree sequence is valid for a multi-graph
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `is.degree.sequence()` was renamed to `is_degseq()` to create a more
#' consistent API.
#' @inheritParams is_degseq
#' @keywords internal
#' @export
is.degree.sequence <- function(out.deg, in.deg = NULL) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "is.degree.sequence()", "is_degseq()")
  is_degseq(out.deg = out.deg, in.deg = in.deg)
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

#' Check if a degree sequence is valid for a multi-graph
#'
#' `is_degseq()` checks whether the given vertex degrees (in- and
#' out-degrees for directed graphs) can be realized by a graph. Note that the
#' graph does not have to be simple, it may contain loop and multiple edges.
#' For undirected graphs, it also checks whether the sum of degrees is even.
#' For directed graphs, the function checks whether the lengths of the two
#' degree vectors are equal and whether their sums are also equal. These are
#' known sufficient and necessary conditions for a degree sequence to be valid.
#'
#' @aliases is_degseq
#' @param out.deg Integer vector, the degree sequence for undirected graphs, or
#'   the out-degree sequence for directed graphs.
#' @param in.deg `NULL` or an integer vector. For undirected graphs, it
#'   should be `NULL`. For directed graphs it specifies the in-degrees.
#' @return A logical scalar.
#' @author Tamás Nepusz \email{ntamas@@gmail.com} and Szabolcs Horvát \email{szhorvat@gmail.com}
#' @references Z Király, Recognizing graphic degree sequences and generating
#' all realizations. TR-2011-11, Egerváry Research Group, H-1117, Budapest,
#' Hungary. ISSN 1587-4451 (2012).
#'
#' B. Cloteaux, Is This for Real? Fast Graphicality Testing, *Comput. Sci. Eng.* 17, 91 (2015).
#'
#' A. Berger, A note on the characterization of digraphic sequences, *Discrete Math.* 314, 38 (2014).
#'
#' G. Cairns and S. Mendan, Degree Sequence for Graphs with Loops (2013).
#'
#' @keywords graphs
#'
#' @family graphical degree sequences
#' @examples
#' g <- sample_gnp(100, 2 / 100)
#' is_degseq(degree(g))
#' is_graphical(degree(g))
#' @export
is_degseq <- function(out.deg, in.deg = NULL) {
  is_graphical(out.deg, in.deg, allowed.edge.types = "all")
}

#' Is a degree sequence graphical?
#'
#' Determine whether the given vertex degrees (in- and out-degrees for
#' directed graphs) can be realized by a graph.
#'
#' The classical concept of graphicality assumes simple graphs. This function
#' can perform the check also when self-loops, multi-edges, or both are allowed
#' in the graph.
#'
#' @param out.deg Integer vector, the degree sequence for undirected graphs, or
#'   the out-degree sequence for directed graphs.
#' @param in.deg `NULL` or an integer vector. For undirected graphs, it
#'   should be `NULL`. For directed graphs it specifies the in-degrees.
#' @param allowed.edge.types The allowed edge types in the graph. \sQuote{simple}
#'   means that neither loop nor multiple edges are allowed (i.e. the graph must be
#'   simple). \sQuote{loops} means that loop edges are allowed but mutiple edges
#'   are not. \sQuote{multi} means that multiple edges are allowed but loop edges
#'   are not. \sQuote{all} means that both loop edges and multiple edges are
#'   allowed.
#' @return A logical scalar.
#' @author Tamás Nepusz \email{ntamas@@gmail.com}
#' @references Hakimi SL: On the realizability of a set of integers as degrees
#' of the vertices of a simple graph. *J SIAM Appl Math* 10:496-506, 1962.
#'
#' PL Erdős, I Miklós and Z Toroczkai: A simple Havel-Hakimi type algorithm to
#' realize graphical degree sequences of directed graphs.  *The Electronic
#' Journal of Combinatorics* 17(1):R66, 2010.
#' @keywords graphs
#'
#' @family graphical degree sequences
#' @examples
#' g <- sample_gnp(100, 2 / 100)
#' is_degseq(degree(g))
#' is_graphical(degree(g))
#' @export
#' @cdocs igraph_is_graphical
is_graphical <- is_graphical_impl
