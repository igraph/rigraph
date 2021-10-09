
## IGraph library.
## Copyright (C) 2010-2012  Gabor Csardi <csardi.gabor@gmail.com>
## 334 Harvard street, Cambridge, MA 02139 USA

## This program is free software; you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 2 of the License, or
## (at your option) any later version.

## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.

## You should have received a copy of the GNU General Public License
## along with this program; if not, write to the Free Software
## Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 
## 02110-1301 USA

# Indexing of igraph graphs.
#
# Goals:
# 1. flexible graph manipulation
# 2. to be as close to the usual matrix and adjacency list semantics,
#    as possible
# 3. simple
# 4. fast
# 5. orthogonal
#
# Rules:
# - [ is about the existence of the edges.
# - [ can be used for weights as well, if the graph is weighted.
# - [[ is about adjacent vertices, and essentially works as an
#   adjacency list.
#
# Use cases:
# - G[1,2]      is there an edge from vertex 1 to vertex 2?
# - G[1,1:3]    are there edges from vertex 1 to vertices 1:3?
# - G[1:2,1:3]  are there adges from vertices 1:2 to vertices 1:3?
#               this returns a (possibly sparse) matrix.
# - G[degree(G)==0,1:4]
#               logical vectors work
# - G[1,-1]     negative indices work
#
# - G[[1,]]     adjacent vertices of 1
# - G[[,1]]     adjacent predecessors of 1
# - G[[degree(G),]]
#               logical vectors work
# - G[[-1,]]    negative indices work
#
# - G[1,2,attr="value"]
#               query an edge attribute
# - G[1:3,2,eid=TRUE]
#               create an edge sequence


#' Query and manipulate a graph as it were an adjacency matrix
#'
#' @details
#' The single bracket indexes the (possibly weighted) adjacency matrix of
#' the graph. Here is what you can do with it:
#'
#' \enumerate{
#' \item Check whether there is an edge between two vertices (\eqn{v}
#'   and \eqn{w}) in the graph: \preformatted{  graph[v, w]}
#'    A numeric scalar is returned, one if the edge exists, zero
#'     otherwise.
#'   \item Extract the (sparse) adjacency matrix of the graph, or part of
#'     it: \preformatted{  graph[]
#' graph[1:3,5:6]
#' graph[c(1,3,5),]}
#'     The first variants returns the full adjacency matrix, the other
#'     two return part of it.
#'   \item The \code{from} and \code{to} arguments can be used to check
#'     the existence of many edges. In this case, both \code{from} and
#'     \code{to} must be present and they must have the same length. They
#'     must contain vertex ids or names. A numeric vector is returned, of
#'     the same length as \code{from} and \code{to}, it contains ones
#'     for existing edges edges and zeros for non-existing ones.
#'     Example: \preformatted{  graph[from=1:3, to=c(2,3,5)]}.
#'   \item For weighted graphs, the \code{[} operator returns the edge
#'     weights. For non-esistent edges zero weights are returned. Other
#'     edge attributes can be queried as well, by giving the \code{attr}
#'     argument. 
#'   \item Querying edge ids instead of the existance of edges or edge
#'     attributes. E.g. \preformatted{  graph[1, 2, edges=TRUE]}
#'     returns the id of the edge between vertices 1 and 2, or zero if
#'     there is no such edge.
#'   \item Adding one or more edges to a graph. For this the element(s) of
#'     the imaginary adjacency matrix must be set to a non-zero numeric
#'     value (or \code{TRUE}): \preformatted{  graph[1, 2] <- 1
#' graph[1:3,1] <- 1
#' graph[from=1:3, to=c(2,3,5)] <- TRUE}
#'     This does not affect edges that are already present in the graph,
#'     i.e. no multiple edges are created.
#'   \item Adding weighted edges to a graph. The \code{attr} argument
#'     contains the name of the edge attribute to set, so it does not
#'     have to be \sQuote{weight}: \preformatted{  graph[1, 2, attr="weight"]<- 5
#' graph[from=1:3, to=c(2,3,5)] <- c(1,-1,4)}
#'     If an edge is already present in the network, then only its
#'     weights or other attribute are updated. If the graph is already
#'     weighted, then the \code{attr="weight"} setting is implicit, and
#'     one does not need to give it explicitly.
#'   \item Deleting edges. The replacement syntax allow the deletion of
#'     edges, by specifying \code{FALSE} or \code{NULL} as the
#'     replacement value: \preformatted{  graph[v, w] <- FALSE}
#'     removes the edge from vertex \eqn{v} to vertex \eqn{w}.
#'     As this can be used to delete edges between two sets of vertices,
#'     either pairwise: \preformatted{  graph[from=v, to=w] <- FALSE}
#'     or not: \preformatted{  graph[v, w] <- FALSE }
#'     if \eqn{v} and \eqn{w} are vectors of edge ids or names.
#' }
#'
#' \sQuote{\code{[}} allows logical indices and negative indices as well,
#' with the usual R semantics. E.g. \preformatted{  graph[degree(graph)==0, 1] <- 1}
#' adds an edge from every isolate vertex to vertex one,
#' and \preformatted{  G <- make_empty_graph(10)
#' G[-1,1] <- TRUE}
#'  creates a star graph.
#'
#' Of course, the indexing operators support vertex names,
#' so instead of a numeric vertex id a vertex can also be given to
#' \sQuote{\code{[}} and \sQuote{\code{[[}}.
#' 
#' @param x The graph.
#' @param i Index. Vertex ids or names or logical vectors. See details
#'   below.
#' @param j Index. Vertex ids or names or logical vectors. See details
#'   below.
#' @param ... Currently ignored.
#' @param from A numeric or character vector giving vertex ids or
#'   names. Together with the \code{to} argument, it can be used to
#'   query/set a sequence of edges. See details below. This argument cannot
#'   be present together with any of the \code{i} and \code{j} arguments
#'   and if it is present, then the \code{to} argument must be present as
#'   well.
#' @param to A numeric or character vector giving vertex ids or
#'   names. Together with the \code{from} argument, it can be used to
#'   query/set a sequence of edges. See details below. This argument cannot
#'   be present together with any of the \code{i} and \code{j} arguments
#'   and if it is present, then the \code{from} argument must be present as
#'   well.
#' @param sparse Logical scalar, whether to return sparse matrices.
#' @param edges Logical scalar, whether to return edge ids.
#' @param drop Ignored.
#' @param attr If not \code{NULL}, then it should be the name of an edge
#'   attribute. This attribute is queried and returned.
#' @return A scalar or matrix. See details below.
#'
#' @family structural queries
#' 
#' @method [ igraph
#' @export

`[.igraph` <- function(x, i, j, ..., from, to,
                       sparse=igraph_opt("sparsematrices"),
                       edges=FALSE, drop=TRUE,
                       attr=if (is_weighted(x)) "weight" else NULL) {
  ## TODO: make it faster, don't need the whole matrix usually

  ################################################################
  ## Argument checks
  if ((!missing(from) || !missing(to)) &&
      (!missing(i)    || !missing(j))) {
    stop("Cannot give 'from'/'to' together with regular indices")
  }
  if ((!missing(from) &&  missing(to)) ||
      ( missing(from) && !missing(to))) {
    stop("Cannot give 'from'/'to' without the other")
  }
  if (!missing(from)) {
    if ((!is.numeric(from) && !is.character(from)) || any(is.na(from))) {
      stop("'from' must be a numeric or character vector without NAs")
    }
    if ((!is.numeric(to) && !is.character(to)) || any(is.na(to))) {
      stop("'to' must be a numeric or character vector without NAs")
    }
    if (length(from) != length(to)) {
      stop("'from' and 'to' must have the same length")
    }
  }

  ##################################################################
  
  if (!missing(from)) {
    res <- get.edge.ids(x, rbind(from, to), error=FALSE)
    if (edges) {
      ## nop
    } else if (!is.null(attr)) {
      if (any(res!=0)) {
        res[res!=0] <- edge_attr(x, attr, res[res!=0])
      }
    } else {
      res <- as.logical(res)+0
    }
    res
  } else if (missing(i) && missing(j)) {
    as_adj(x, sparse=sparse, attr=attr, edges=edges)
  } else if (missing(j)) {
    as_adj(x, sparse=sparse, attr=attr, edges=edges)[i,,drop=drop]
  } else if (missing(i)) {
    as_adj(x, sparse=sparse, attr=attr, edges=edges)[,j,drop=drop]
  } else {
    as_adj(x, sparse=sparse, attr=attr, edges=edges)[i,j,drop=drop]
  }
}

#' Query and manipulate a graph as it were an adjacency list
#'
#' @details
#' The double bracket operator indexes the (imaginary) adjacency list
#' of the graph. This can used for the following operations:
#' \enumerate{
#'   \item Querying the adjacent vertices for one or more
#'     vertices: \preformatted{  graph[[1:3,]]
#' graph[[,1:3]]}
#'     The first form gives the successors, the second the predecessors
#'     or the 1:3 vertices. (For undirected graphs they are equivalent.)
#'   \item Querying the incident edges for one or more vertices,
#'     if the \code{edges} argument is set to
#'     \code{TRUE}: \preformatted{  graph[[1:3, , edges=TRUE]]
#' graph[[, 1:3, edges=TRUE]]}
#'   \item Querying the edge ids between two sets or vertices,
#'     if both indices are used. E.g. \preformatted{  graph[[v, w, edges=TRUE]]}
#'     gives the edge ids of all the edges that exist from vertices
#'     \eqn{v} to vertices \eqn{w}.
#'  }
#'
#' The alternative argument names \code{from} and \code{to} can be used
#' instead of the usual \code{i} and \code{j}, to make the code more
#' readable: \preformatted{ graph[[from = 1:3]]
#' graph[[from = v, to = w, edges = TRUE]]}
#'
#' \sQuote{\code{[[}} operators allows logical indices and negative indices
#' as well, with the usual R semantics.
#'
#' Vertex names are also supported, so instead of a numeric vertex id a
#' vertex can also be given to \sQuote{\code{[}} and \sQuote{\code{[[}}.
#' 
#' @param x The graph.
#' @param i Index, integer, character or logical, see details below.
#' @param j Index, integer, character or logical, see details below.
#' @param from A numeric or character vector giving vertex ids or
#'   names. Together with the \code{to} argument, it can be used to
#'   query/set a sequence of edges. See details below. This argument cannot
#'   be present together with any of the \code{i} and \code{j} arguments
#'   and if it is present, then the \code{to} argument must be present as
#'   well.
#' @param to A numeric or character vector giving vertex ids or
#'   names. Together with the \code{from} argument, it can be used to
#'   query/set a sequence of edges. See details below. This argument cannot
#'   be present together with any of the \code{i} and \code{j} arguments
#'   and if it is present, then the \code{from} argument must be present as
#'   well.
#' @param ... Additional arguments are not used currently.
#' @param directed Logical scalar, whether to consider edge directions
#'   in directed graphs. It is ignored for undirected graphs.
#' @param edges Logical scalar, whether to return edge ids.
#' @param exact Ignored.
#'
#' @family structural queries
#'
#' @method [[ igraph
#' @export

`[[.igraph` <- function(x, i, j, from, to, ..., directed=TRUE,
                        edges=FALSE, exact=TRUE) {

  getfun <- if (edges) as_adj_edge_list else as_adj_list

  if (!missing(i) && !missing(from)) stop("Cannot give both 'i' and 'from'")
  if (!missing(j) && !missing(to)) stop("Cannot give both 'j' and 'to'")
  if (missing(i) && ! missing(from)) i <- from
  if (missing(j) && ! missing(to)) j <- to

  if (missing(i) && missing(j)) {
    mode <- if (directed) "out" else "all"
    getfun(x, mode=mode)
  } else if (missing(j)) {
    mode <- if (directed) "out" else "all"
    if (!edges) {
      adjacent_vertices(x, i, mode = if (directed) "out" else "all")
    } else {
      incident_edges(x, i, mode = if (directed) "out" else "all")
    }
  } else if (missing(i)) {
    if (!edges) {
      adjacent_vertices(x, j, mode = if (directed) "in" else "all")
    } else {
      incident_edges(x, j, mode = if (directed) "in" else "all")
    }
  } else {
    if (!edges) {
      mode <- if (directed) "out" else "all"
      lapply(adjacent_vertices(x, i, mode = mode), intersection, V(x)[j])
    } else {
      i <- as.igraph.vs(x, i)
      j <- as.igraph.vs(x, j)
      mode <- if (directed) "out" else "all"
      ee <- incident_edges(x, i, mode = mode)
      lapply(seq_along(i), function(yy) {
        from <- i[yy]
        el <- ends(x, ee[[yy]], names = FALSE)
        other <- ifelse(el[,1]==from, el[,2], el[,1])
        ee[[yy]][other %in% j]
      })
      
    }
  }
}

#' @method [<- igraph
#' @family functions for manipulating graph structure
#' @export

`[<-.igraph` <- function(x, i, j, ..., from, to,
                         attr=if (is_weighted(x)) "weight" else NULL,
                         value) {
  ## TODO: rewrite this in C to make it faster

  ################################################################
  ## Argument checks
  if ((!missing(from) || !missing(to)) &&
      (!missing(i)    || !missing(j))) {
    stop("Cannot give 'from'/'to' together with regular indices")
  }
  if ((!missing(from) &&  missing(to)) ||
      ( missing(from) && !missing(to))) {
    stop("Cannot give 'from'/'to' without the other")
  }
  if (is.null(attr) &&
      (!is.null(value) && !is.numeric(value) && !is.logical(value))) {
    stop("New value should be NULL, numeric or logical")
  }  
  if (is.null(attr) && !is.null(value) && length(value) != 1) {
    stop("Logical or numeric value must be of length 1")
  }
  if (!missing(from)) {
    if ((!is.numeric(from) && !is.character(from)) || any(is.na(from))) {
      stop("'from' must be a numeric or character vector without NAs")
    }
    if ((!is.numeric(to) && !is.character(to)) || any(is.na(to))) {
      stop("'to' must be a numeric or character vector without NAs")
    }
    if (length(from) != length(to)) {
      stop("'from' and 'to' must have the same length")
    }
  }

  ##################################################################

  if (!missing(from)) {    
    if (is.null(value) ||
        (is.logical(value) && !value) ||
        (is.null(attr) && is.numeric(value) && value==0)) {
      ## Delete edges
      todel <- x[from=from, to=to, ..., edges=TRUE]
      x <- delete_edges(x, todel)
    } else {
      ## Addition or update of an attribute (or both)
      ids <- x[from=from, to=to, ..., edges=TRUE]
      if (any(ids==0)) {
        x <- add_edges(x, rbind(from[ids==0], to[ids==0]))
      }
      if (!is.null(attr)) {
        ids <- x[from=from, to=to, ..., edges=TRUE]
        x <- set_edge_attr(x, attr, ids, value=value)
      }
    }
  } else if (is.null(value) ||
      (is.logical(value) && !value) ||
      (is.null(attr) && is.numeric(value) && value==0)) {
    ## Delete edges
    if (missing(i) && missing(j)) {
      todel <- unlist(x[[ ,  , ..., edges=TRUE]])
    } else if (missing(j)) {
      todel <- unlist(x[[i,  , ..., edges=TRUE]])
    } else if (missing(i)) {
      todel <- unlist(x[[ , j, ..., edges=TRUE]])
    } else {
      todel <- unlist(x[[i, j, ..., edges=TRUE]])
    }
    x <- delete_edges(x, todel)
  } else {
    ## Addition or update of an attribute (or both)
    i <- if (missing(i)) as.numeric(V(x)) else as.igraph.vs(x, i)
    j <- if (missing(j)) as.numeric(V(x)) else as.igraph.vs(x, j)
    if (length(i) != 0 && length(j) != 0) {
      ## Existing edges, and their endpoints
      exe <- lapply(x[[i, j, ..., edges=TRUE]], as.vector)
      exv <- lapply(x[[i, j, ...]], as.vector)
      toadd <- unlist(lapply(seq_along(exv), function(idx) {
        to <- setdiff(j, exv[[idx]])
        if (length(to!=0)) {
          rbind(i[idx], setdiff(j, exv[[idx]]))
        } else {
          numeric()
        }
      }))
      ## Do the changes
      if (is.null(attr)) {
        x <- add_edges(x, toadd)
      } else {
        x <- add_edges(x, toadd, attr=structure(list(value), names=attr))
        toupdate <- unlist(exe)
        x <- set_edge_attr(x, attr, toupdate, value)
      }
    }    
  }
  x
}
