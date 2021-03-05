#   IGraph R package
#   Copyright (C) 2005-2012  Gabor Csardi <csardi.gabor@gmail.com>
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
# Connected components, subgraphs, kinda
###################################################################

#' @export

count_components <- function(graph, mode=c("weak", "strong")) {
  if (!is_igraph(graph)) {
    stop("Not a graph object")
  }
  mode <- igraph.match.arg(mode)
  mode <- switch(mode, "weak"=1, "strong"=2)

  on.exit( .Call(C_R_igraph_finalizer) )
  .Call(C_R_igraph_no_clusters, graph, as.numeric(mode))
}

#' @rdname components
#' @param cumulative Logical, if TRUE the cumulative distirubution (relative
#' frequency) is calculated.
#' @param mul.size Logical. If TRUE the relative frequencies will be multiplied
#' by the cluster sizes.
#' @export
#' @importFrom graphics hist

component_distribution <- function(graph, cumulative=FALSE, mul.size=FALSE,
                                 ...) {
  if (!is_igraph(graph)) {
    stop("Not a graph object")
  }
  
  cs <- components(graph, ...)$csize;
  hi <- hist(cs, -1:max(cs), plot=FALSE)$density
  if (mul.size) {
    hi <- hi*1:max(cs)
    hi <- hi/sum(hi)
  }
  if (!cumulative) {
    res <- hi
  } else {
    res <- rev(cumsum(rev(hi)));
  }
  
  res
}

#' @export

is_connected <- function(graph, mode=c("weak", "strong")) {
  if (!is_igraph(graph)) {
    stop("Not a graph object")
  }
  mode <- igraph.match.arg(mode)
  mode <- switch(mode, "weak"=1, "strong"=2)

  on.exit( .Call(C_R_igraph_finalizer) )
  .Call(C_R_igraph_is_connected, graph, as.numeric(mode))
}



#' Decompose a graph into components
#' 
#' Creates a separate graph for each component of a graph.
#' 
#' @aliases decompose.graph
#' @param graph The original graph.
#' @param mode Character constant giving the type of the components, wither
#' \code{weak} for weakly connected components or \code{strong} for strongly
#' connected components.
#' @param max.comps The maximum number of components to return. The first
#' \code{max.comps} components will be returned (which hold at least
#' \code{min.vertices} vertices, see the next parameter), the others will be
#' ignored. Supply \code{NA} here if you don't want to limit the number of
#' components.
#' @param min.vertices The minimum number of vertices a component should
#' contain in order to place it in the result list. Eg. supply 2 here to ignore
#' isolate vertices.
#' @return A list of graph objects.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @seealso \code{\link{is_connected}} to decide whether a graph is connected,
#' \code{\link{components}} to calculate the connected components of a graph.
#' @export
#' @keywords graphs
#' @examples
#' 
#' # the diameter of each component in a random graph
#' g <- sample_gnp(1000, 1/1000)
#' components <- decompose(g, min.vertices=2)
#' sapply(components, diameter)
#' 
decompose <- function(graph, mode=c("weak", "strong"), max.comps=NA,
                      min.vertices=0) {
  if (!is_igraph(graph)) {
    stop("Not a graph object")
  }
  mode <- igraph.match.arg(mode)
  mode <- switch(mode, "weak"=1, "strong"=2)

  if (is.na(max.comps)) {
    max.comps=-1
  }
  on.exit( .Call(C_R_igraph_finalizer) )
  .Call(C_R_igraph_decompose, graph, as.numeric(mode),
        as.numeric(max.comps), as.numeric(min.vertices))
}


#' Articulation points of a graph
#' 
#' Articuation points or cut vertices are vertices whose removal increases the
#' number of connected components in a graph.
#' 
#' Articuation points or cut vertices are vertices whose removal increases the
#' number of connected components in a graph. If the original graph was
#' connected, then the removal of a single articulation point makes it
#' undirected. If a graph contains no articulation points, then its vertex
#' connectivity is at least two.
#' 
#' @aliases articulation.points articulation_points
#' @param graph The input graph. It is treated as an undirected graph, even if
#' it is directed.
#' @return A numeric vector giving the vertex ids of the articulation points of
#' the input graph.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @seealso \code{\link{biconnected_components}}, \code{\link{components}},
#' \code{\link{is_connected}}, \code{\link{vertex_connectivity}}
#' @keywords graphs
#' @examples
#' 
#' g <- disjoint_union( make_full_graph(5), make_full_graph(5) )
#' clu <- components(g)$membership
#' g <- add_edges(g, c(match(1, clu), match(2, clu)) )
#' articulation_points(g)
#' @export
#' @include auto.R

articulation_points <- articulation_points


#' Biconnected components
#' 
#' Finding the biconnected components of a graph
#' 
#' A graph is biconnected if the removal of any single vertex (and its adjacent
#' edges) does not disconnect it.
#' 
#' A biconnected component of a graph is a maximal biconnected subgraph of it.
#' The biconnected components of a graph can be given by the partition of its
#' edges: every edge is a member of exactly one biconnected component. Note
#' that this is not true for vertices: the same vertex can be part of many
#' biconnected components.
#' 
#' @aliases biconnected.components biconnected_components
#' @param graph The input graph. It is treated as an undirected graph, even if
#' it is directed.
#' @return A named list with three components: \item{no}{Numeric scalar, an
#' integer giving the number of biconnected components in the graph.}
#' \item{tree_edges}{The components themselves, a list of numeric vectors. Each
#' vector is a set of edge ids giving the edges in a biconnected component.
#' These edges define a spanning tree of the component.}
#' \item{component_edges}{A list of numeric vectors. It gives all edges in the
#' components.} \item{components}{A list of numeric vectors, the vertices of
#' the components.} \item{articulation_points}{The articulation points of the
#' graph. See \code{\link{articulation_points}}.}
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @seealso \code{\link{articulation_points}}, \code{\link{components}},
#' \code{\link{is_connected}}, \code{\link{vertex_connectivity}}
#' @keywords graphs
#' @examples
#' 
#' g <- disjoint_union( make_full_graph(5), make_full_graph(5) )
#' clu <- components(g)$membership
#' g <- add_edges(g, c(which(clu==1), which(clu==2)))
#' bc <- biconnected_components(g)
#' @export

biconnected_components <- biconnected_components
