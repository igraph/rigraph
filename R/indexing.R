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

get_adjacency_submatrix <- function(x, i, j, attr = NULL) {
  # If i or j is NULL, assume all nodes
  # if not NULL make sure to handle duplicates correctly
  if (missing(i)) {
    i_seq <- seq_len(vcount(x))
    has_i <- FALSE
  } else{
    i_seq <- i
    has_i <- TRUE
  }
  if (missing(j)) {
    j_seq <- seq_len(vcount(x))
    has_j <- FALSE
  } else {
    j_seq <- j
    has_j <- TRUE
  }

  adj <- adjacent_vertices(x, i_seq, mode = "out")
  i_degree <- map_int(adj, length)

  from_id <- rep(i_seq, i_degree)
  to_id <- unlist(adj)

  edge_list <- data.frame(from = as.integer(from_id), to = as.integer(to_id))
  if(has_j){
    edge_list <- edge_list[edge_list$to %in% j_seq, ]
  }
  
  row_indices <- edge_list[[1]]
  col_indices <- edge_list[[2]]

  values <- if (is.null(attr)) {
    1
  } else {
    valid_edges <- get_edge_ids(x, edge_list)
    edge_attr(x, attr, valid_edges)
  }

  res <- Matrix::sparseMatrix(
    i = if (has_i) match(row_indices, i_seq) else row_indices,
    j = if (has_j) match(col_indices, j_seq) else col_indices,
    x = values,
    dims = c(length(i_seq), length(j_seq))
  )

  if ("name" %in% vertex_attr_names(x) && !is.null(dim(res))) {
    rownames(res) <- vertex_attr(x, "name", i_seq)
    colnames(res) <- vertex_attr(x, "name", j_seq)
  }

  res
}


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
#'   \item The `from` and `to` arguments can be used to check
#'     the existence of many edges. In this case, both `from` and
#'     `to` must be present and they must have the same length. They
#'     must contain vertex ids or names. A numeric vector is returned, of
#'     the same length as `from` and `to`, it contains ones
#'     for existing edges edges and zeros for non-existing ones.
#'     Example: \preformatted{  graph[from=1:3, to=c(2,3,5)]}.
#'   \item For weighted graphs, the `[` operator returns the edge
#'     weights. For non-esistent edges zero weights are returned. Other
#'     edge attributes can be queried as well, by giving the `attr`
#'     argument.
#'   \item Querying edge ids instead of the existance of edges or edge
#'     attributes. E.g. \preformatted{  graph[1, 2, edges=TRUE]}
#'     returns the id of the edge between vertices 1 and 2, or zero if
#'     there is no such edge.
#'   \item Adding one or more edges to a graph. For this the element(s) of
#'     the imaginary adjacency matrix must be set to a non-zero numeric
#'     value (or `TRUE`): \preformatted{  graph[1, 2] <- 1
#' graph[1:3,1] <- 1
#' graph[from=1:3, to=c(2,3,5)] <- TRUE}
#'     This does not affect edges that are already present in the graph,
#'     i.e. no multiple edges are created.
#'   \item Adding weighted edges to a graph. The `attr` argument
#'     contains the name of the edge attribute to set, so it does not
#'     have to be \sQuote{weight}: \preformatted{  graph[1, 2, attr="weight"]<- 5
#' graph[from=1:3, to=c(2,3,5)] <- c(1,-1,4)}
#'     If an edge is already present in the network, then only its
#'     weights or other attribute are updated. If the graph is already
#'     weighted, then the `attr="weight"` setting is implicit, and
#'     one does not need to give it explicitly.
#'   \item Deleting edges. The replacement syntax allow the deletion of
#'     edges, by specifying `FALSE` or `NULL` as the
#'     replacement value: \preformatted{  graph[v, w] <- FALSE}
#'     removes the edge from vertex \eqn{v} to vertex \eqn{w}.
#'     As this can be used to delete edges between two sets of vertices,
#'     either pairwise: \preformatted{  graph[from=v, to=w] <- FALSE}
#'     or not: \preformatted{  graph[v, w] <- FALSE }
#'     if \eqn{v} and \eqn{w} are vectors of edge ids or names.
#' }
#'
#' \sQuote{`[`} allows logical indices and negative indices as well,
#' with the usual R semantics. E.g. \preformatted{  graph[degree(graph)==0, 1] <- 1}
#' adds an edge from every isolate vertex to vertex one,
#' and \preformatted{  G <- make_empty_graph(10)
#' G[-1,1] <- TRUE}
#'  creates a star graph.
#'
#' Of course, the indexing operators support vertex names,
#' so instead of a numeric vertex id a vertex can also be given to
#' \sQuote{`[`} and \sQuote{`[[`}.
#'
#' @param x The graph.
#' @param i Index. Vertex ids or names or logical vectors. See details
#'   below.
#' @param j Index. Vertex ids or names or logical vectors. See details
#'   below.
#' @param ... Currently ignored.
#' @param from A numeric or character vector giving vertex ids or
#'   names. Together with the `to` argument, it can be used to
#'   query/set a sequence of edges. See details below. This argument cannot
#'   be present together with any of the `i` and `j` arguments
#'   and if it is present, then the `to` argument must be present as
#'   well.
#' @param to A numeric or character vector giving vertex ids or
#'   names. Together with the `from` argument, it can be used to
#'   query/set a sequence of edges. See details below. This argument cannot
#'   be present together with any of the `i` and `j` arguments
#'   and if it is present, then the `from` argument must be present as
#'   well.
#' @param sparse Logical scalar, whether to return sparse matrices.
#' @param edges Logical scalar, whether to return edge ids.
#' @param drop Ignored.
#' @param attr If not `NULL`, then it should be the name of an edge
#'   attribute. This attribute is queried and returned.
#' @return A scalar or matrix. See details below.
#'
#' @family structural queries
#'
#' @method [ igraph
#' @export
`[.igraph` <- function(
    x, i, j, ..., from, to,
    sparse = igraph_opt("sparsematrices"),
    edges = FALSE, drop = TRUE,
    attr = if (is_weighted(x)) "weight" else NULL) {
  ################################################################
  ## Argument checks
  if ((!missing(from) || !missing(to)) &&
    (!missing(i) || !missing(j))) {
    stop("Cannot give 'from'/'to' together with regular indices")
  }
  if ((!missing(from) && missing(to)) ||
    (missing(from) && !missing(to))) {
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
    res <- get_edge_ids(x, data.frame(from, to), error = FALSE)
    if (edges) {
      ## nop
    } else if (!is.null(attr)) {
      if (any(res != 0)) {
        res[res != 0] <- edge_attr(x, attr, res[res != 0])
      }
    } else {
      res <- as.logical(res) + 0
    }
    return(res)
  }

  if (missing(i) && missing(j)) {
    return(as_adjacency_matrix(x, sparse = sparse, attr = attr))
  }

  # convert logical, character or negative i/j to proper vertex ids
  # also check if any vertex is duplicated and record a mapping
  i_has_dupes <- FALSE
  j_has_dupes <- FALSE

  if (!missing(i)) {
    i <- as_igraph_vs(x, i)
    if (anyDuplicated(i)) {
      i_has_dupes <- TRUE
      i_dupl <- i
      i <- unique(i)
      i_map <- match(i_dupl, i)
    }
  }
  if (!missing(j)) {
    j <- as_igraph_vs(x, j)
    if (anyDuplicated(j)) {
      j_has_dupes <- TRUE
      j_dupl <- j
      j <- unique(j)
      j_map <- match(j_dupl, j)
    }
  }

  sub_adjmat <- get_adjacency_submatrix(x, i = i, j = j, attr = attr)
  if (i_has_dupes) {
    sub_adjmat <- sub_adjmat[i_map, , drop = FALSE]
  }
  if (j_has_dupes) {
    sub_adjmat <- sub_adjmat[, j_map, drop = FALSE]
  }

  if (!sparse) {
    as.matrix(sub_adjmat[, , drop = drop])
  } else{
    sub_adjmat[, , drop = drop]
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
#'     if the `edges` argument is set to
#'     `TRUE`: \preformatted{  graph[[1:3, , edges=TRUE]]
#' graph[[, 1:3, edges=TRUE]]}
#'   \item Querying the edge ids between two sets or vertices,
#'     if both indices are used. E.g. \preformatted{  graph[[v, w, edges=TRUE]]}
#'     gives the edge ids of all the edges that exist from vertices
#'     \eqn{v} to vertices \eqn{w}.
#'  }
#'
#' The alternative argument names `from` and `to` can be used
#' instead of the usual `i` and `j`, to make the code more
#' readable: \preformatted{ graph[[from = 1:3]]
#' graph[[from = v, to = w, edges = TRUE]]}
#'
#' \sQuote{`[[`} operators allows logical indices and negative indices
#' as well, with the usual R semantics.
#'
#' Vertex names are also supported, so instead of a numeric vertex id a
#' vertex can also be given to \sQuote{`[`} and \sQuote{`[[`}.
#'
#' @param x The graph.
#' @param i Index, integer, character or logical, see details below.
#' @param j Index, integer, character or logical, see details below.
#' @param from A numeric or character vector giving vertex ids or
#'   names. Together with the `to` argument, it can be used to
#'   query/set a sequence of edges. See details below. This argument cannot
#'   be present together with any of the `i` and `j` arguments
#'   and if it is present, then the `to` argument must be present as
#'   well.
#' @param to A numeric or character vector giving vertex ids or
#'   names. Together with the `from` argument, it can be used to
#'   query/set a sequence of edges. See details below. This argument cannot
#'   be present together with any of the `i` and `j` arguments
#'   and if it is present, then the `from` argument must be present as
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
`[[.igraph` <- function(x, i, j, from, to, ..., directed = TRUE,
                        edges = FALSE, exact = TRUE) {
  getfun <- if (edges) as_adj_edge_list else as_adj_list

  if (!missing(i) && !missing(from)) stop("Cannot give both 'i' and 'from'")
  if (!missing(j) && !missing(to)) stop("Cannot give both 'j' and 'to'")
  if (missing(i) && !missing(from)) i <- from
  if (missing(j) && !missing(to)) j <- to

  if (missing(i) && missing(j)) {
    mode <- if (directed) "out" else "all"
    getfun(x, mode = mode)
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
      lapply(adjacent_vertices(x, i, mode = mode), intersection, V(x)[.env$j])
    } else {
      i <- as_igraph_vs(x, i)
      j <- as_igraph_vs(x, j)
      mode <- if (directed) "out" else "all"
      ee <- incident_edges(x, i, mode = mode)
      lapply(seq_along(i), function(yy) {
        from <- i[yy]
        el <- ends(x, ee[[yy]], names = FALSE)
        other <- ifelse(el[, 1] == from, el[, 2], el[, 1])
        ee[[yy]][other %in% j]
      })
    }
  }
}

#' @method length igraph
#' @family structural queries
#' @export
length.igraph <- function(x) {
  vcount(x)
}

expand.grid.unordered <- function(i, j, loops = FALSE, directed = FALSE) {
  grid <- vctrs::vec_expand_grid(i = i, j = j)
  if (!directed) {
    grid <- vctrs::vec_unique(data.frame(
      i = pmin(grid$i, grid$j),
      j = pmax(grid$i, grid$j)
    ))
  }
  if (!loops) {
    grid <- grid[grid[, 1] != grid[, 2], ]
  }
  grid
}

#' @method [<- igraph
#' @family functions for manipulating graph structure
#' @export
`[<-.igraph` <- function(x, i, j, ..., from, to,
                         attr = if (is_weighted(x)) "weight" else NULL,
                         loops = FALSE,
                         value) {
  ################################################################
  ## Argument checks
  if ((!missing(from) || !missing(to)) &&
    (!missing(i) || !missing(j))) {
    stop("Cannot give 'from'/'to' together with regular indices")
  }
  if ((!missing(from) && missing(to)) ||
    (missing(from) && !missing(to))) {
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
      (is.null(attr) && is.numeric(value) && value == 0)) {
      ## Delete edges
      todel <- get_edge_ids(x, c(rbind(from, to)))
      x <- delete_edges(x, todel)
    } else {
      ## Addition or update of an attribute (or both)
      ids <- get_edge_ids(x, c(rbind(from, to)))
      if (any(ids == 0)) {
        x <- add_edges(x, rbind(from[ids == 0], to[ids == 0]))
      }
      if (!is.null(attr)) {
        ids <- get_edge_ids(x, c(rbind(from, to)))
        x <- set_edge_attr(x, attr, ids, value = value)
      }
    }
  } else if (is.null(value) ||
    (is.logical(value) && !value) ||
    (is.null(attr) && is.numeric(value) && value == 0)) {
    ## Delete edges
    if (missing(i) && missing(j)) {
      todel <- seq_len(ecount(x))
    } else if (missing(j)) {
      todel <- unlist(incident_edges(x, v = i, mode = "out"))
    } else if (missing(i)) {
      todel <- unlist(incident_edges(x, v = j, mode = "in"))
    } else {
      edge_pairs <- expand.grid(i, j)
      edge_ids <- get_edge_ids(x, c(rbind(edge_pairs[, 1], edge_pairs[, 2])))
      todel <- edge_ids[edge_ids != 0]
    }
    x <- delete_edges(x, todel)
  } else {
    ## Addition or update of an attribute (or both)
    i <- if (missing(i)) as.numeric(V(x)) else as_igraph_vs(x, i)
    j <- if (missing(j)) as.numeric(V(x)) else as_igraph_vs(x, j)
    if (length(i) != 0 && length(j) != 0) {
      edge_pairs <- expand.grid.unordered(i, j, loops = loops, directed = is_directed(x))

      edge_ids <- get_edge_ids(x, c(rbind(edge_pairs[, 1], edge_pairs[, 2])))
      toadd <- c(rbind(edge_pairs[edge_ids == 0, 1], edge_pairs[edge_ids == 0, 2]))

      if (is.null(attr)) {
        if (value > 1) {
          cli::cli_abort("value greater than one but graph is not weighted and no attribute was specified.")
        }
        x <- add_edges(x, toadd)
      } else {
        x <- add_edges(x, toadd, attr = structure(list(value), names = attr))
        toupdate <- edge_ids[edge_ids != 0]
        x <- set_edge_attr(x, attr, toupdate, value)
      }
    }
  }
  x
}
