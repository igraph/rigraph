
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
#' \code{is_simple} checks whether a graph is simple.
#' 
#' \code{simplify} removes the loop and/or multiple edges from a graph.  If
#' both \code{remove.loops} and \code{remove.multiple} are \code{TRUE} the
#' function returns a simple graph.
#' 
#' @aliases simplify is.simple is_simple
#' @param graph The graph to work on.
#' @param remove.loops Logical, whether the loop edges are to be removed.
#' @param remove.multiple Logical, whether the multiple edges are to be
#' removed.
#' @param edge.attr.comb Specifies what to do with edge attributes, if
#' \code{remove.multiple=TRUE}. In this case many edges might be mapped to a
#' single one in the new graph, and their attributes are combined. Please see
#' \code{\link{attribute.combination}} for details on this.
#' @return A new graph object with the edges deleted.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @seealso \code{\link{which_loop}}, \code{\link{which_multiple}} and
#' \code{\link{count_multiple}}, \code{\link{delete_edges}},
#' \code{\link{delete_vertices}}
#' @keywords graphs
#' @examples
#' 
#' g <- graph( c(1,2,1,2,3,3) )
#' is_simple(g)
#' is_simple(simplify(g, remove.loops=FALSE))
#' is_simple(simplify(g, remove.multiple=FALSE))
#' is_simple(simplify(g))
#' @export
#' @include auto.R

simplify <- simplify

#' @export
#' @rdname simplify

is_simple <- is_simple
