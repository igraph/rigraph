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

#' List all simple paths from one source
#' 
#' This function lists are simple paths from one source vertex to another
#' vertex or vertices. A path is simple if the vertices it visits are not
#' visited more than once.
#' 
#' Note that potentially there are exponentially many paths between two
#' vertices of a graph, and you may run out of memory when using this
#' function, if your graph is lattice-like.
#' 
#' This function currently ignored multiple and loop edges.
#' 
#' @param graph The input graph.
#' @param from The source vertex.
#' @param to The target vertex of vertices. Defaults to all vertices.
#' @param mode Character constant, gives whether the shortest paths to or
#'   from the given vertices should be calculated for directed graphs. If
#'   \code{out} then the shortest paths \emph{from} the vertex, if \code{in}
#'   then \emph{to} it will be considered. If \code{all}, the default, then
#'   the corresponding undirected graph will be used, ie. not directed paths
#'   are searched. This argument is ignored for undirected graphs.
#' @param cutoff Maximum length of path that is considered. If negative, paths of all lengths are considered.
#' @return A list of integer vectors, each integer vector is a path from
#'   the source vertex to one of the target vertices. A path is given by its
#'   vertex ids.
#' @keywords graphs
#' @examples
#' 
#' g <- make_ring(10)
#' all_simple_paths(g, 1, 5)
#' all_simple_paths(g, 1, c(3,5))
#' 
#' @export

all_simple_paths <- function(graph, from, to = V(graph),
                             mode = c("out", "in", "all", "total"),
                             cutoff = -1) {
  ## Argument checks
  if (!is_igraph(graph)) stop("Not a graph object")
  from <- as.igraph.vs(graph, from)
  to <- as.igraph.vs(graph, to)
  mode <- switch(igraph.match.arg(mode), "out" = 1, "in" = 2, "all" = 3,
                 "total" = 3)

  on.exit( .Call(C_R_igraph_finalizer) )

  ## Function call
  res <- .Call(C_R_igraph_get_all_simple_paths, graph, from - 1, to - 1,
               as.integer(cutoff), mode)
  res <- get.all.simple.paths.pp(res)

  if (igraph_opt("return.vs.es")) { 
    res <- lapply(res, create_vs, graph = graph)
  }
  res
}


#' Directed acyclic graphs
#' 
#' This function tests whether the given graph is a DAG, a directed acyclic
#' graph.
#' 
#' \code{is_dag} checks whether there is a directed cycle in the graph. If not,
#' the graph is a DAG.
#' 
#' @aliases is.dag is_dag
#' @param graph The input graph. It may be undirected, in which case
#' \code{FALSE} is reported.
#' @return A logical vector of length one.
#' @author Tamas Nepusz \email{ntamas@@gmail.com} for the C code, Gabor Csardi
#' \email{csardi.gabor@@gmail.com} for the R interface.
#' @keywords graphs
#' @examples
#' 
#' g <- make_tree(10)
#' is_dag(g)
#' g2 <- g + edge(5,1)
#' is_dag(g2)
#' @export
#' @include auto.R

is_dag <- is_dag


#' Maximum cardinality search
#' 
#' Maximum cardinality search is a simple ordering a vertices that is useful in
#' determining the chordality of a graph.
#' 
#' Maximum cardinality search visits the vertices in such an order that every
#' time the vertex with the most already visited neighbors is visited. Ties are
#' broken randomly.
#' 
#' The algorithm provides a simple basis for deciding whether a graph is
#' chordal, see References below, and also \code{\link{is_chordal}}.
#' 
#' @aliases maximum.cardinality.search max_cardinality
#' @param graph The input graph. It may be directed, but edge directions are
#' ignored, as the algorithm is defined for undirected graphs.
#' @return A list with two components: \item{alpha}{Numeric vector. The
#' vertices ordered according to the maximum cardinality search.}
#' \item{alpham1}{Numeric vector. The inverse of \code{alpha}.}
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @seealso \code{\link{is_chordal}}
#' @references Robert E Tarjan and Mihalis Yannakakis. (1984). Simple
#' linear-time algorithms to test chordality of graphs, test acyclicity of
#' hypergraphs, and selectively reduce acyclic hypergraphs.  \emph{SIAM Journal
#' of Computation} 13, 566--579.
#' @keywords graphs
#' @examples
#' 
#' ## The examples from the Tarjan-Yannakakis paper
#' g1 <- graph_from_literal(A-B:C:I, B-A:C:D, C-A:B:E:H, D-B:E:F,
#'                 E-C:D:F:H, F-D:E:G, G-F:H, H-C:E:G:I,
#'                 I-A:H)
#' max_cardinality(g1)
#' is_chordal(g1, fillin=TRUE)
#' 
#' g2 <- graph_from_literal(A-B:E, B-A:E:F:D, C-E:D:G, D-B:F:E:C:G,
#'                 E-A:B:C:D:F, F-B:D:E, G-C:D:H:I, H-G:I:J,
#'                 I-G:H:J, J-H:I)
#' max_cardinality(g2)
#' is_chordal(g2, fillin=TRUE)

max_cardinality <- max_cardinality


#' Eccentricity of the vertices in a graph
#' 
#' The eccentricity of a vertex is its shortest path distance from the farthest
#' other node in the graph.
#' 
#' The eccentricity of a vertex is calculated by measuring the shortest
#' distance from (or to) the vertex, to (or from) all vertices in the graph,
#' and taking the maximum.
#' 
#' This implementation ignores vertex pairs that are in different components.
#' Isolate vertices have eccentricity zero.
#' 
#' @param graph The input graph, it can be directed or undirected.
#' @param vids The vertices for which the eccentricity is calculated.
#' @param mode Character constant, gives whether the shortest paths to or from
#' the given vertices should be calculated for directed graphs. If \code{out}
#' then the shortest paths \emph{from} the vertex, if \code{in} then \emph{to}
#' it will be considered. If \code{all}, the default, then the corresponding
#' undirected graph will be used, edge directions will be ignored. This
#' argument is ignored for undirected graphs.
#' @return \code{eccentricity} returns a numeric vector, containing the
#' eccentricity score of each given vertex.
#' @seealso \code{\link{radius}} for a related concept,
#'   \code{\link{distances}} for general shortest path calculations.
#' @references Harary, F. Graph Theory. Reading, MA: Addison-Wesley, p. 35,
#' 1994.
#' @examples
#' g <- make_star(10, mode="undirected")
#' eccentricity(g)
#' @export
#' @include auto.R

eccentricity <- eccentricity


#' Radius of a graph
#' 
#' The eccentricity of a vertex is its shortest path distance from the
#' farthest other node in the graph. The smallest eccentricity in a graph
#' is called its radius
#' 
#' The eccentricity of a vertex is calculated by measuring the shortest
#' distance from (or to) the vertex, to (or from) all vertices in the
#' graph, and taking the maximum.
#' 
#' This implementation ignores vertex pairs that are in different
#' components.  Isolate vertices have eccentricity zero.
#' 
#' @param graph The input graph, it can be directed or undirected.
#' @param mode Character constant, gives whether the shortest paths to or from
#' the given vertices should be calculated for directed graphs. If \code{out}
#' then the shortest paths \emph{from} the vertex, if \code{in} then \emph{to}
#' it will be considered. If \code{all}, the default, then the corresponding
#' undirected graph will be used, edge directions will be ignored. This
#' argument is ignored for undirected graphs.
#' @return A numeric scalar, the radius of the graph.
#' @seealso \code{\link{eccentricity}} for the underlying
#'   calculations, code{\link{distances}} for general shortest path
#'   calculations. 
#' @references Harary, F. Graph Theory. Reading, MA: Addison-Wesley, p. 35,
#' 1994.
#' @examples
#' g <- make_star(10, mode="undirected")
#' eccentricity(g)
#' radius(g)
#' @export
#' @include auto.R

radius <- radius

#' @rdname distances
#' @param directed Whether to consider directed paths in directed graphs,
#'   this argument is ignored for undirected graphs.
#' @param unconnected What to do if the graph is unconnected (not
#'   strongly connected if directed paths are considered). If TRUE only
#'   the lengths of the existing paths are considered and averaged; if
#'   FALSE the length of the missing paths are counted having length
#'   \code{vcount(graph)}, one longer than the longest possible geodesic
#'   in the network.
#' @export

distance_table <- distance_table
