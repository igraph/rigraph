
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
#' \code{is_degseq} checks whether the given vertex degrees (in- and
#' out-degrees for directed graphs) can be realized by a graph. Note that the
#' graph does not have to be simple, it may contain loop and multiple edges.
#' For undirected graphs, it also checks whether the sum of degrees is even.
#' For directed graphs, the function checks whether the lengths of the two
#' degree vectors are equal and whether their sums are also equal. These are
#' known sufficient and necessary conditions for a degree sequence to be valid.
#' 
#' @aliases is.degree.sequence is_degseq
#' @param out.deg Integer vector, the degree sequence for undirected graphs, or
#' the out-degree sequence for directed graphs.
#' @param in.deg \code{NULL} or an integer vector. For undirected graphs, it
#' should be \code{NULL}. For directed graphs it specifies the in-degrees.
#' @return A logical scalar.
#' @author Tamas Nepusz \email{ntamas@@gmail.com}
#' @references Hakimi SL: On the realizability of a set of integers as degrees
#' of the vertices of a simple graph. \emph{J SIAM Appl Math} 10:496-506, 1962.
#' 
#' PL Erdos, I Miklos and Z Toroczkai: A simple Havel-Hakimi type algorithm to
#' realize graphical degree sequences of directed graphs.  \emph{The Electronic
#' Journal of Combinatorics} 17(1):R66, 2010.
#' @keywords graphs
#'
#' @family graphical degree sequences
#' @examples
#' g <- sample_gnp(100, 2/100)
#' is_degseq(degree(g))
#' is_graphical(degree(g))
#' @export
#' @include auto.R

is_degseq <- is_degseq

#' Is a degree sequence graphical?
#' 
#' Determine whether the given vertex degrees (in- and out-degrees for
#' directed graphs) can be realized in a simple graph, i.e. a graph without
#' multiple or loop edges.
#' 
#' @aliases is.graphical.degree.sequence
#' @param out.deg Integer vector, the degree sequence for undirected graphs, or
#' the out-degree sequence for directed graphs.
#' @param in.deg \code{NULL} or an integer vector. For undirected graphs, it
#' should be \code{NULL}. For directed graphs it specifies the in-degrees.
#' @return A logical scalar.
#' @author Tamas Nepusz \email{ntamas@@gmail.com}
#' @references Hakimi SL: On the realizability of a set of integers as degrees
#' of the vertices of a simple graph. \emph{J SIAM Appl Math} 10:496-506, 1962.
#' 
#' PL Erdos, I Miklos and Z Toroczkai: A simple Havel-Hakimi type algorithm to
#' realize graphical degree sequences of directed graphs.  \emph{The Electronic
#' Journal of Combinatorics} 17(1):R66, 2010.
#' @keywords graphs
#' 
#' @family graphical degree sequences
#' @examples
#' g <- sample_gnp(100, 2/100)
#' is_degseq(degree(g))
#' is_graphical(degree(g))
#' @export
#' @include auto.R

is_graphical <- is_graphical
