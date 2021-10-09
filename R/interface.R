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
# Structure building
###################################################################

#' Add edges to a graph
#'
#' The new edges are given as a vertex sequence, e.g. internal
#' numeric vertex ids, or vertex names. The first edge points from
#' \code{edges[1]} to \code{edges[2]}, the second from \code{edges[3]}
#' to \code{edges[4]}, etc.
#' 
#' If attributes are supplied, and they are not present in the graph,
#' their values for the original edges of the graph are set to \code{NA}.
#' 
#' @param graph The input graph
#' @param edges The edges to add, a vertex sequence with even number
#'   of vertices. 
#' @param ... Additional arguments, they must be named,
#'   and they will be added as edge attributes, for the newly added
#'   edges. See also details below.
#' @param attr A named list, its elements will be added
#'   as edge attributes, for the newly added edges. See also details
#'   below.
#' @return The graph, with the edges (and attributes) added.
#'
#' @export
#'
#' @aliases add.edges
#' @family functions for manipulating graph structure
#' 
#' @examples
#' g <- make_empty_graph(n = 5) %>%
#'   add_edges(c(1,2, 2,3, 3,4, 4,5)) %>%
#'   set_edge_attr("color", value = "red") %>%
#'   add_edges(c(5,1), color = "green")
#' E(g)[[]]
#' plot(g)

add_edges <- function(graph, edges, ..., attr = list()) {
  if (!is_igraph(graph)) {
    stop("Not a graph object")
  }

  attrs <- list(...)
  attrs <- append(attrs, attr)
  nam <- names(attrs)
  if (length(attrs) != 0 && (is.null(nam) || any(nam==""))) {
    stop("please supply names for attributes")
  }
  
  edges.orig <- ecount(graph)  
  on.exit( .Call(C_R_igraph_finalizer) )
  graph <- .Call(C_R_igraph_add_edges, graph, as.igraph.vs(graph, edges)-1)
  edges.new <- ecount(graph)
  
  if (edges.new-edges.orig != 0) {
    idx <- seq(edges.orig+1, edges.new)
  } else {
    idx <- numeric()
  }

  eattrs <- .Call(C_R_igraph_mybracket2, graph, 9L, 4L)
  for (i in seq(attrs)) { eattrs[[nam[i]]][idx] <- attrs[[nam[i]]] }

  .Call(C_R_igraph_mybracket2_set, graph, 9L, 4L, eattrs)
}

#' Add vertices to a graph
#' 
#' If attributes are supplied, and they are not present in the graph,
#' their values for the original vertices of the graph are set to
#' \code{NA}.
#'
#' @param graph The input graph.
#' @param nv The number of vertices to add.
#' @param ... Additional arguments, they must be named,
#'   and they will be added as vertex attributes, for the newly added
#'   vertices. See also details below.
#' @param attr A named list, its elements will be added
#'   as vertex attributes, for the newly added vertices. See also details
#'   below.
#' @return The graph, with the vertices (and attributes) added.
#'
#' @aliases add.vertices
#' @family functions for manipulating graph structure
#' 
#' @export
#' @examples
#' g <- make_empty_graph() %>%
#'   add_vertices(3, color = "red") %>%
#'   add_vertices(2, color = "green") %>%
#'   add_edges(c(1,2, 2,3, 3,4, 4,5))
#' g
#' V(g)[[]]
#' plot(g)

add_vertices <- function(graph, nv, ..., attr=list()) {
  if (!is_igraph(graph)) {
    stop("Not a graph object")
  }

  attrs <- list(...)
  attrs <- append(attrs, attr)
  nam <- names(attrs)
  if (length(attrs) != 0 && (is.null(nam) || any(nam==""))) {
    stop("please supply names for attributes")
  }

  vertices.orig <- vcount(graph)  
  on.exit( .Call(C_R_igraph_finalizer) )
  graph <- .Call(C_R_igraph_add_vertices, graph, as.numeric(nv))
  vertices.new <- vcount(graph)

  if (vertices.new-vertices.orig != 0) {
    idx <- seq(vertices.orig+1, vertices.new)
  } else {
    idx <- numeric()
  }

  vattrs <- .Call(C_R_igraph_mybracket2, graph, 9L, 3L)
  for (i in seq(attrs)) { vattrs[[nam[i]]][idx] <- attrs[[nam[i]]] }

  .Call(C_R_igraph_mybracket2_set, graph, 9L, 3L, vattrs)
}

#' Delete edges from a graph
#'
#' @param graph The input graph.
#' @param edges The edges to remove, specified as an edge sequence.
#' @return The graph, with the edges removed.
#'
#' @aliases delete.edges
#' @family functions for manipulating graph structure
#' 
#' @export
#' @examples
#' g <- make_ring(10) %>%
#'   delete_edges(seq(1, 9, by = 2))
#' g
#'
#' g <- make_ring(10) %>%
#'   delete_edges("10|1")
#' g

delete_edges <- function(graph, edges) {
  if (!is_igraph(graph)) {
    stop("Not a graph object")
  }
  on.exit( .Call(C_R_igraph_finalizer) )
  .Call(C_R_igraph_delete_edges, graph, as.igraph.es(graph, edges)-1)
}

#' Delete vertices from a graph
#' 
#' @param graph The input graph.
#' @param v The vertices to remove, a vertex sequence.
#' @return The graph, with the vertices removed.
#'
#' @aliases delete.vertices
#' @family functions for manipulating graph structure
#' 
#' @export
#' @examples
#' g <- make_ring(10) %>%
#'   set_vertex_attr("name", value = LETTERS[1:10])
#' g
#' V(g)
#' 
#' g2 <- delete_vertices(g, c(1,5)) %>%
#'   delete_vertices("B")
#' g2
#' V(g2)

delete_vertices <- function(graph, v) {
  if (!is_igraph(graph)) {
    stop("Not a graph object")
  }
  on.exit( .Call(C_R_igraph_finalizer) )
  .Call(C_R_igraph_delete_vertices, graph, as.igraph.vs(graph, v)-1)
}

###################################################################
# Structure query
###################################################################

#' The size of the graph (number of edges)
#'
#' \code{ecount} of an alias of this function.
#' 
#' @param graph The graph.
#' @return Numeric scalar, the number of edges.
#'
#' @aliases ecount
#' @family structural queries
#' 
#' @export
#' @examples
#' g <- sample_gnp(100, 2/100)
#' gsize(g)
#' 
#' # Number of edges in a G(n,p) graph
#' replicate(100, sample_gnp(10, 1/2), simplify = FALSE) %>%
#'   vapply(gsize, 0) %>%
#'   hist()

gsize <- function(graph) {
  if (!is_igraph(graph)) {
    stop("Not a graph object")
  }
  on.exit( .Call(C_R_igraph_finalizer) )
  .Call(C_R_igraph_ecount, graph)
}

#' Neighboring (adjacent) vertices in a graph
#'
#' A vertex is a neighbor of another one (in other words, the two
#' vertices are adjacent), if they are incident to the same edge.
#'
#' @param graph The input graph.
#' @param v The vertex of which the adjacent vertices are queried.
#' @param mode Whether to query outgoing (\sQuote{out}), incoming
#'   (\sQuote{in}) edges, or both types (\sQuote{all}). This is
#'   ignored for undirected graphs.
#' @return A vertex sequence containing the neighbors of the input vertex.
#'
#' @family structural queries
#' 
#' @export
#' @examples
#' g <- make_graph("Zachary")
#' n1 <- neighbors(g, 1)
#' n34 <- neighbors(g, 34)
#' intersection(n1, n34)

neighbors <- function(graph, v, mode = c("out", "in", "all", "total")) {
  if (!is_igraph(graph)) {
    stop("Not a graph object")
  }
  if (is.character(mode)) {
    mode <- igraph.match.arg(mode)
    mode <- switch(mode, "out"=1, "in"=2, "all"=3, "total"=3)
  }
  on.exit( .Call(C_R_igraph_finalizer) )
  res <- .Call(C_R_igraph_neighbors, graph, as.igraph.vs(graph, v)-1,
               as.numeric(mode))
  V(graph)[res + 1]
}

#' Incident edges of a vertex in a graph
#'
#' @param graph The input graph.
#' @param v The vertex of which the incident edges are queried.
#' @param mode Whether to query outgoing (\sQuote{out}), incoming
#'   (\sQuote{in}) edges, or both types (\sQuote{all}). This is
#'   ignored for undirected graphs.
#' @return An edge sequence containing the incident edges of
#'   the input vertex.
#'
#' @family structural queries
#'
#' @export
#' @examples
#' g <- make_graph("Zachary")
#' incident(g, 1)
#' incident(g, 34)

incident <- function(graph, v, mode=c("all", "out", "in", "total")) {
  if (!is_igraph(graph)) {
    stop("Not a graph object")
  }
  if (is_directed(graph)) {
    mode <- igraph.match.arg(mode)
    mode <- switch(mode, "out"=1, "in"=2, "all"=3, "total"=3)
  } else {
    mode=1
  }
  on.exit( .Call(C_R_igraph_finalizer) )
  res <- .Call(C_R_igraph_incident, graph, as.igraph.vs(graph, v)-1,
               as.numeric(mode)) + 1L

  if (igraph_opt("return.vs.es")) res <- create_es(graph, res)

  res
}  

#' Check whether a graph is directed
#'
#' @param graph The input graph
#' @return Logical scalar, whether the graph is directed.
#'
#' @aliases is.directed
#' @family structural queries
#' 
#' @export
#' @examples
#' g <- make_ring(10)
#' is_directed(g)
#'
#' g2 <- make_ring(10, directed = TRUE)
#' is_directed(g2)

is_directed <- function(graph) {
  if (!is_igraph(graph)) {
    stop("Not a graph object")
  }
  on.exit( .Call(C_R_igraph_finalizer) )
  .Call(C_R_igraph_is_directed, graph)
}

#' Incident vertices of some graph edges
#'
#' @param graph The input graph
#' @param es The sequence of edges to query
#' @param names Whether to return vertex names or
#'   numeric vertex ids. By default vertex names are used.
#' @return A two column matrix of vertex names or vertex ids.
#'
#' @aliases get.edges get.edge
#' @family structural queries
#' 
#' @export
#' @importFrom stats na.omit
#' @examples
#' g <- make_ring(5)
#' ends(g, E(g))

ends <- function(graph, es, names = TRUE) {

  if (!is_igraph(graph)) {
    stop("Not a graph object")
  }

  es2 <- as.igraph.es(graph, na.omit(es)) - 1
  res <- matrix(NA_integer_, ncol = length(es), nrow = 2)

  on.exit( .Call(C_R_igraph_finalizer) )

  if (length(es) == 1) {
    res[, !is.na(es)] <- .Call(C_R_igraph_get_edge, graph, es2) + 1

  } else  {
    res[, !is.na(es)] <- .Call(C_R_igraph_edges, graph, es2) + 1
  }

  if (names && is_named(graph)) {
    res <- vertex_attr(graph, "name")[res]
  }

  matrix(res, ncol = 2, byrow = TRUE)
}

#' @export

get.edges <- function(graph, es) {
  ends(graph, es, names = FALSE)
}


#' Find the edge ids based on the incident vertices of the edges
#' 
#' Find the edges in an igraph graph that have the specified end points. This
#' function handles multi-graph (graphs with multiple edges) and can consider
#' or ignore the edge directions in directed graphs.
#' 
#' igraph vertex ids are natural numbers, starting from one, up to the number
#' of vertices in the graph. Similarly, edges are also numbered from one, up to
#' the number of edges.
#' 
#' This function allows finding the edges of the graph, via their incident
#' vertices.
#' 
#' @param graph The input graph.
#' @param vp The incident vertices, given as vertex ids or symbolic vertex
#' names. They are interpreted pairwise, i.e. the first and second are used for
#' the first edge, the third and fourth for the second, etc.
#' @param directed Logical scalar, whether to consider edge directions in
#' directed graphs. This argument is ignored for undirected graphs.
#' @param error Logical scalar, whether to report an error if an edge is not
#' found in the graph. If \code{FALSE}, then no error is reported, and zero is
#' returned for the non-existant edge(s).
#' @param multi Logical scalar, whether to handle multiple edges properly. If
#' \code{FALSE}, and a pair of vertices are given twice (or more), then always
#' the same edge id is reported back for them. If \code{TRUE}, then the edge
#' ids of multiple edges are correctly reported.
#' @return A numeric vector of edge ids, one for each pair of input vertices.
#' If there is no edge in the input graph for a given pair of vertices, then
#' zero is reported. (If the \code{error} argument is \code{FALSE}.)
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @export
#' @family structural queries
#' 
#' @examples
#' 
#' g <- make_ring(10)
#' ei <- get.edge.ids(g, c(1,2, 4,5))
#' E(g)[ei]
#' 
#' ## non-existant edge
#' get.edge.ids(g, c(2,1, 1,4, 5,4))
#' 
get.edge.ids <- function(graph, vp, directed=TRUE, error=FALSE, multi=FALSE) {
  if (!is_igraph(graph)) {
    stop("Not a graph object")
  }
  on.exit( .Call(C_R_igraph_finalizer) )
  .Call(C_R_igraph_get_eids, graph, as.igraph.vs(graph, vp)-1,
        as.logical(directed), as.logical(error), as.logical(multi)) + 1
}  


#' Order (number of vertices) of a graph
#'
#' @param graph The graph
#' @return Number of vertices, numeric scalar.
#'
#' @aliases vcount
#' @family structural queries
#' 
#' @export
#' @examples
#' g <- make_ring(10)
#' gorder(g)

gorder <- gorder

#' Adjacent vertices of multiple vertices in a graph
#'
#' This function is similar to \code{\link{neighbors}}, but it queries
#' the adjacent vertices for multiple vertices at once.
#'
#' @param graph Input graph.
#' @param v The vertices to query.
#' @param mode Whether to query outgoing (\sQuote{out}), incoming
#'   (\sQuote{in}) edges, or both types (\sQuote{all}). This is
#'   ignored for undirected graphs.
#' @return A list of vertex sequences.
#'
#' @family structural queries
#' @export
#' @examples
#' g <- make_graph("Zachary")
#' adjacent_vertices(g, c(1, 34))

adjacent_vertices <- function(graph, v,
                               mode = c("out", "in", "all", "total")) {

  if (!is_igraph(graph)) stop("Not a graph object")

  vv <- as.igraph.vs(graph, v) - 1
  mode <- switch(match.arg(mode), "out" = 1, "in" = 2, "all" = 3, "total" = 3)

  on.exit(.Call(C_R_igraph_finalizer) )

  res <- .Call(C_R_igraph_adjacent_vertices, graph, vv, mode)

  if (igraph_opt("return.vs.es")) {
    res <- lapply(res, function(x) create_vs(graph, x + 1))
  }

  if (is_named(graph)) names(res) <- V(graph)$name[vv + 1]

  res
}

#' Incident edges of multiple vertices in a graph
#'
#' This function is similar to \code{\link{incident}}, but it
#' queries multiple vertices at once.
#'
#' @param graph Input graph.
#' @param v The vertices to query
#' @param mode Whether to query outgoing (\sQuote{out}), incoming
#'   (\sQuote{in}) edges, or both types (\sQuote{all}). This is
#'   ignored for undirected graphs.
#' @return A list of edge sequences.
#'
#' @family structural queries
#' @export
#' @examples
#' g <- make_graph("Zachary")
#' incident_edges(g, c(1, 34))

incident_edges <- function(graph, v,
                           mode = c("out", "in", "all", "total")) {

  if (!is_igraph(graph)) stop("Not a graph object")

  vv <- as.igraph.vs(graph, v) - 1
  mode <- switch(match.arg(mode), "out" = 1, "in" = 2, "all" = 3, "total" = 3)

  on.exit(.Call(C_R_igraph_finalizer) )

  res <- .Call(C_R_igraph_incident_edges, graph, vv, mode)

  if (igraph_opt("return.vs.es")) {
    res <- lapply(res, function(x) create_es(graph, x + 1))
  }

  if (is_named(graph)) names(res) <- V(graph)$name[vv + 1]

  res
}
