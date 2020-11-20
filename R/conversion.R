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

get.adjacency.dense <- function(graph, type=c("both", "upper", "lower"),
                                attr=NULL, edges=FALSE, names=TRUE) {

  if (!is_igraph(graph)) {
    stop("Not a graph object")
  }
  
  type <- igraph.match.arg(type)
  type <- switch(type, "upper"=0, "lower"=1, "both"=2)
  
  if (edges || is.null(attr)) {    
    on.exit( .Call(C_R_igraph_finalizer) )
    res <- .Call(C_R_igraph_get_adjacency, graph, as.numeric(type),
                 as.logical(edges))
  } else {
    attr <- as.character(attr)
    if (! attr %in% edge_attr_names(graph)) {
      stop("no such edge attribute")
    }
    exattr <- edge_attr(graph, attr)
    if (is.logical(exattr)) {
      res <- matrix(FALSE, nrow=vcount(graph), ncol=vcount(graph))
    } else if (is.character(exattr)) {
      res <- matrix("", nrow=vcount(graph), ncol=vcount(graph))
    } else if (is.numeric(exattr)) {
      res <- matrix(0, nrow=vcount(graph), ncol=vcount(graph))
    } else {
      stop("Sparse matrices must be either numeric or logical,",
           "and the edge attribute is not")
    }
    if (is_directed(graph)) {
      for (i in seq(length=ecount(graph))) {
        e <- ends(graph, i, names = FALSE)
        res[ e[1], e[2] ] <- edge_attr(graph, attr, i)
      }
    } else {
      if (type==0) {
        ## upper
        for (i in seq(length=ecount(graph))) {
          e <- ends(graph, i, names = FALSE)
          res[ min(e), max(e) ] <- edge_attr(graph, attr, i)
        }        
      } else if (type==1) {
        ## lower
        for (i in seq(length=ecount(graph))) {
          e <- ends(graph, i, names = FALSE)
          res[ max(e), min(e) ] <- edge_attr(graph, attr, i)
        }        
      } else if (type==2) {
        ## both
        for (i in seq(length=ecount(graph))) {
          e <- ends(graph, i, names = FALSE)
          res[ e[1], e[2] ] <- edge_attr(graph, attr, i)
          if (e[1] != e[2]) {
            res[ e[2], e[1] ] <- edge_attr(graph, attr, i)
          }
        }
      }
    }
  }

  if (names && "name" %in% vertex_attr_names(graph)) {
    colnames(res) <- rownames(res) <- V(graph)$name
  }
  
  res  
}

get.adjacency.sparse <- function(graph, type=c("both", "upper", "lower"),
                                 attr=NULL, edges=FALSE, names=TRUE) {

  if (!is_igraph(graph)) {
    stop("Not a graph object")
  }

  type <- igraph.match.arg(type)

  vc <- vcount(graph)
  
  el <- as_edgelist(graph, names=FALSE)
  if (edges) {
    value <- seq_len(nrow(el))
  } else if (!is.null(attr)) {
    attr <- as.character(attr)
    if (!attr %in% edge_attr_names(graph)) {
      stop("no such edge attribute")
    }
    value <- edge_attr(graph, name=attr)
    if (!is.numeric(value) && !is.logical(value)) {
      stop("Sparse matrices must be either numeric or logical,",
           "and the edge attribute is not")
    }
  } else {
    value <- rep(1, nrow(el))
  }

  if (is_directed(graph)) {
    res <- Matrix::sparseMatrix(dims=c(vc, vc), i=el[,1], j=el[,2], x=value)
  } else {
    if (type=="upper") {
      ## upper
      res <- Matrix::sparseMatrix(dims=c(vc, vc), i=pmin(el[,1],el[,2]),
                          j=pmax(el[,1],el[,2]), x=value)
    } else if (type=="lower") {
      ## lower
      res <- Matrix::sparseMatrix(dims=c(vc, vc), i=pmax(el[,1],el[,2]),
                          j=pmin(el[,1],el[,2]), x=value)
    } else if (type=="both") {
      ## both
      res <- Matrix::sparseMatrix(dims=c(vc, vc), i=pmin(el[,1],el[,2]),
                          j=pmax(el[,1],el[,2]), x=value, symmetric=TRUE)
      res <- as(res, "dgCMatrix")
    }
  }

  if (names && "name" %in% vertex_attr_names(graph)) {
    colnames(res) <- rownames(res) <- V(graph)$name
  }

  res
}

#' Convert a graph to an adjacency matrix
#' 
#' Sometimes it is useful to work with a standard representation of a
#' graph, like an adjacency matrix.
#' 
#' \code{as_adjacency_matrix} returns the adjacency matrix of a graph, a
#' regular matrix if \code{sparse} is \code{FALSE}, or a sparse matrix, as
#' defined in the \sQuote{\code{Matrix}} package, if \code{sparse} if
#' \code{TRUE}.
#' 
#' @aliases get.adjacency
#' @param graph The graph to convert.
#' @param type Gives how to create the adjacency matrix for undirected graphs.
#' It is ignored for directed graphs. Possible values: \code{upper}: the upper
#' right triangle of the matrix is used, \code{lower}: the lower left triangle
#' of the matrix is used. \code{both}: the whole matrix is used, a symmetric
#' matrix is returned.
#' @param attr Either \code{NULL} or a character string giving an edge
#' attribute name. If \code{NULL} a traditional adjacency matrix is returned.
#' If not \code{NULL} then the values of the given edge attribute are included
#' in the adjacency matrix. If the graph has multiple edges, the edge attribute
#' of an arbitrarily chosen edge (for the multiple edges) is included. This
#' argument is ignored if \code{edges} is \code{TRUE}.
#' 
#' Note that this works only for certain attribute types. If the \code{sparse}
#' argumen is \code{TRUE}, then the attribute must be either logical or
#' numeric. If the \code{sparse} argument is \code{FALSE}, then character is
#' also allowed. The reason for the difference is that the \code{Matrix}
#' package does not support character sparse matrices yet.
#' @param edges Logical scalar, whether to return the edge ids in the matrix.
#' For non-existant edges zero is returned.
#' @param names Logical constant, whether to assign row and column names
#' to the matrix. These are only assigned if the \code{name} vertex attribute
#' is present in the graph.
#' @param sparse Logical scalar, whether to create a sparse matrix. The
#' \sQuote{\code{Matrix}} package must be installed for creating sparse
#' matrices.
#' @return A \code{vcount(graph)} by \code{vcount(graph)} (usually) numeric
#' matrix.
#'
#' @seealso \code{\link{graph_from_adjacency_matrix}}, \code{\link{read_graph}}
#' @examples
#' 
#' g <- sample_gnp(10, 2/10)
#' as_adjacency_matrix(g)
#' V(g)$name <- letters[1:vcount(g)]
#' as_adjacency_matrix(g)
#' E(g)$weight <- runif(ecount(g))
#' as_adjacency_matrix(g, attr="weight")
#' @export

as_adjacency_matrix <- function(graph, type=c("both", "upper", "lower"),
                                attr=NULL, edges=FALSE, names=TRUE, 
                                sparse=igraph_opt("sparsematrices")) {
  if (!is_igraph(graph)) {
    stop("Not a graph object")
  }

  if (!sparse) {
    get.adjacency.dense(graph, type=type, attr=attr, edges=edges, names=names)
  } else {
    get.adjacency.sparse(graph, type=type, attr=attr, edges=edges, names=names)
  }  
}

#' @export
#' @rdname as_adjacency_matrix

as_adj <- as_adjacency_matrix

#' Convert a graph to an edge list
#' 
#' Sometimes it is useful to work with a standard representation of a
#' graph, like an edge list.
#' 
#' \code{as_edgelist} returns the list of edges in a graph.
#' 
#' @aliases get.edgelist
#' @param graph The graph to convert.
#' @param names Whether to return a character matrix containing vertex
#' names (ie. the \code{name} vertex attribute) if they exist or numeric
#' vertex ids.
#' @return A \code{gsize(graph)} by 2 numeric matrix.
#' @seealso \code{\link{graph_from_adjacency_matrix}}, \code{\link{read_graph}}
#' @keywords graphs
#' @examples
#' 
#' g <- sample_gnp(10, 2/10)
#' as_edgelist(g)
#'
#' V(g)$name <- LETTERS[seq_len(gorder(g))]
#' as_edgelist(g)
#' 
#' @export

as_edgelist <- function(graph, names=TRUE) {
  if (!is_igraph(graph)) {
    stop("Not a graph object")
  }
  on.exit( .Call(C_R_igraph_finalizer) )
  res <- matrix(.Call(C_R_igraph_get_edgelist, graph, TRUE),
                ncol=2)
  res <- res+1
  if (names && "name" %in% vertex_attr_names(graph)) {
    res <- matrix(V(graph)$name[ res ], ncol=2)
  }

  res
}



#' Convert between directed and undirected graphs
#' 
#' \code{as.directed} converts an undirected graph to directed,
#' \code{as.undirected} does the opposite, it converts a directed graph to
#' undirected.
#' 
#' Conversion algorithms for \code{as.directed}: \describe{
#' \item{"arbitrary"}{The number of edges in the graph stays the same, an
#' arbitrarily directed edge is created for each undirected edge.}
#' \item{"mutual"}{Two directed edges are created for each undirected
#' edge, one in each direction.} }
#' 
#' Conversion algorithms for \code{as.undirected}: \describe{
#' \item{"each"}{The number of edges remains constant, an undirected edge
#' is created for each directed one, this version might create graphs with
#' multiple edges.} \item{"collapse"}{One undirected edge will be created
#' for each pair of vertices which are connected with at least one directed
#' edge, no multiple edges will be created.} \item{"mutual"}{One
#' undirected edge will be created for each pair of mutual edges. Non-mutual
#' edges are ignored. This mode might create multiple edges if there are more
#' than one mutual edge pairs between the same pair of vertices.  } }
#' 
#' @aliases as.directed as.undirected
#' @param graph The graph to convert.
#' @param mode Character constant, defines the conversion algorithm. For
#' \code{as.directed} it can be \code{mutual} or \code{arbitrary}. For
#' \code{as.undirected} it can be \code{each}, \code{collapse} or
#' \code{mutual}. See details below.
#' @return A new graph object.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @seealso \code{\link{simplify}} for removing multiple and/or loop edges from
#' a graph.
#' @export
#' @keywords graphs
#' @examples
#' 
#' g <- make_ring(10)
#' as.directed(g, "mutual")
#' g2 <- make_star(10)
#' as.undirected(g)
#' 
#' # Combining edge attributes
#' g3 <- make_ring(10, directed=TRUE, mutual=TRUE)
#' E(g3)$weight <- seq_len(ecount(g3))
#' ug3 <- as.undirected(g3)
#' print(ug3, e=TRUE)
#' \dontrun{
#'   x11(width=10, height=5)
#'   layout(rbind(1:2))
#'   plot( g3, layout=layout_in_circle, edge.label=E(g3)$weight)
#'   plot(ug3, layout=layout_in_circle, edge.label=E(ug3)$weight)
#' }
#' 
#' g4 <- graph(c(1,2, 3,2,3,4,3,4, 5,4,5,4,
#'               6,7, 7,6,7,8,7,8, 8,7,8,9,8,9,
#'               9,8,9,8,9,9, 10,10,10,10))
#' E(g4)$weight <- seq_len(ecount(g4))
#' ug4 <- as.undirected(g4, mode="mutual",
#'               edge.attr.comb=list(weight=length))
#' print(ug4, e=TRUE)
#' 
as.directed <- function(graph, mode=c("mutual", "arbitrary")) {
  if (!is_igraph(graph)) {
    stop("Not a graph object")
  }

  mode <- igraph.match.arg(mode)
  mode <- switch(mode, "arbitrary"=0, "mutual"=1)
  
  on.exit( .Call(C_R_igraph_finalizer) )
  .Call(C_R_igraph_to_directed, graph, as.numeric(mode))
}

#' @rdname as.directed
#' @param edge.attr.comb Specifies what to do with edge attributes, if
#' \code{mode="collapse"} or \code{mode="mutual"}.  In these cases many edges
#' might be mapped to a single one in the new graph, and their attributes are
#' combined. Please see \code{\link{attribute.combination}} for details on
#' this.
#' @export

as.undirected <- function(graph, mode=c("collapse", "each", "mutual"), edge.attr.comb=igraph_opt("edge.attr.comb")) {
  # Argument checks
  if (!is_igraph(graph)) { stop("Not a graph object") }
  mode <- switch(igraph.match.arg(mode), "collapse"=1, "each"=0, "mutual"=2)
  edge.attr.comb <- igraph.i.attribute.combination(edge.attr.comb)

  on.exit( .Call(C_R_igraph_finalizer) )
  # Function call
  res <- .Call(C_R_igraph_to_undirected, graph, mode, edge.attr.comb)

  res
}


#' Adjacency lists
#' 
#' Create adjacency lists from a graph, either for adjacent edges or for
#' neighboring vertices
#' 
#' \code{as_adj_list} returns a list of numeric vectors, which include the ids
#' of neighbor vertices (according to the \code{mode} argument) of all
#' vertices.
#' 
#' \code{as_adj_edge_list} returns a list of numeric vectors, which include the
#' ids of adjacent edgs (according to the \code{mode} argument) of all
#' vertices.
#' 
#' @aliases as_adj_list get.adjedgelist
#' @param graph The input graph.
#' @param mode Character scalar, it gives what kind of adjacent edges/vertices
#' to include in the lists. \sQuote{\code{out}} is for outgoing edges/vertices,
#' \sQuote{\code{in}} is for incoming edges/vertices, \sQuote{\code{all}} is
#' for both. This argument is ignored for undirected graphs.
#' @return A list of numeric vectors.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @seealso \code{\link{as_edgelist}}, \code{\link{as_adj}}
#' @export
#' @keywords graphs
#' @examples
#' 
#' g <- make_ring(10)
#' as_adj_list(g)
#' as_adj_edge_list(g)
#' 
as_adj_list <- function(graph, mode=c("all", "out", "in", "total")) {
  if (!is_igraph(graph)) {
    stop("Not a graph object")
  }

  mode <- igraph.match.arg(mode)
  mode <- as.numeric(switch(mode, "out"=1, "in"=2, "all"=3, "total"=3))
  on.exit( .Call(C_R_igraph_finalizer) )
  res <- .Call(C_R_igraph_get_adjlist, graph, mode)
  res <- lapply(res, function(x) V(graph)[x + 1])
  if (is_named(graph)) names(res) <- V(graph)$name
  res
}

#' @rdname as_adj_list
#' @aliases get.adjlist
#' @export

as_adj_edge_list <- function(graph, mode=c("all", "out", "in", "total")) {
  if (!is_igraph(graph)) {
    stop("Not a graph object")
  }

  mode <- igraph.match.arg(mode)
  mode <- as.numeric(switch(mode, "out"=1, "in"=2, "all"=3, "total"=3))
  on.exit( .Call(C_R_igraph_finalizer) )
  res <- .Call(C_R_igraph_get_adjedgelist, graph, mode)
  res <- lapply(res, function(x) E(graph)[x + 1])
  if (is_named(graph)) names(res) <- V(graph)$name
  res
}

#' Convert graphNEL objects from the graph package to igraph
#' 
#' The graphNEL class is defined in the \code{graph} package, it is another
#' way to represent graphs. \code{graph_from_graphnel} takes a graphNEL
#' graph and converts it to an igraph graph. It handles all
#' graph/vertex/edge attributes. If the graphNEL graph has a vertex
#' attribute called \sQuote{\code{name}} it will be used as igraph vertex
#' attribute \sQuote{\code{name}} and the graphNEL vertex names will be
#' ignored.
#' 
#' Because graphNEL graphs poorly support multiple edges, the edge
#' attributes of the multiple edges are lost: they are all replaced by the
#' attributes of the first of the multiple edges.
#' 
#' @aliases igraph.from.graphNEL
#' @param graphNEL The graphNEL graph.
#' @param name Logical scalar, whether to add graphNEL vertex names as an
#' igraph vertex attribute called \sQuote{\code{name}}.
#' @param weight Logical scalar, whether to add graphNEL edge weights as an
#' igraph edge attribute called \sQuote{\code{weight}}. (graphNEL graphs are
#' always weighted.)
#' @param unlist.attrs Logical scalar. graphNEL attribute query functions
#' return the values of the attributes in R lists, if this argument is
#' \code{TRUE} (the default) these will be converted to atomic vectors,
#' whenever possible, before adding them to the igraph graph.
#' @return \code{graph_from_graphnel} returns an igraph graph object.
#' @seealso \code{\link{as_graphnel}} for the other direction,
#' \code{\link{as_adj}}, \code{\link{graph_from_adjacency_matrix}},
#' \code{\link{as_adj_list}} and \code{\link{graph.adjlist}} for other
#' graph representations.
#' @examples
#' \dontrun{
#' ## Undirected
#' g <- make_ring(10)
#' V(g)$name <- letters[1:10]
#' GNEL <- as_graphnel(g)
#' g2 <- graph_from_graphnel(GNEL)
#' g2
#' 
#' ## Directed
#' g3 <- make_star(10, mode="in")
#' V(g3)$name <- letters[1:10]
#' GNEL2 <- as_graphnel(g3)
#' g4 <- graph_from_graphnel(GNEL2)
#' g4
#' }
#' @export

graph_from_graphnel <- function(graphNEL, name=TRUE, weight=TRUE,
                                 unlist.attrs=TRUE) {

  if (!inherits(graphNEL, "graphNEL")) {
    stop("Not a graphNEL graph")
  }
  
  al <- lapply(graph::edgeL(graphNEL), "[[", "edges")
  if (graph::edgemode(graphNEL)=="undirected") {
    al <- mapply(SIMPLIFY=FALSE, seq_along(al), al, FUN=function(n, l) {
      c(l, rep(n, sum(l==n)))
    })
  }
  mode <- if (graph::edgemode(graphNEL)=="directed") "out" else "all"
  g <- graph_from_adj_list(al, mode=mode, duplicate=TRUE)
  if (name) {
    V(g)$name <- graph::nodes(graphNEL)
  }

  ## Graph attributes
  g.n <- names(graphNEL@graphData)
  g.n <- g.n [ g.n != "edgemode" ]
  for (n in g.n) {
    g <- set_graph_attr(g, n, graphNEL@graphData[[n]])
  }
  
  ## Vertex attributes
  v.n <- names(graph::nodeDataDefaults(graphNEL))
  for (n in v.n) {
    val <- unname(graph::nodeData(graphNEL, attr=n))
    if (unlist.attrs && all(sapply(val, length)==1)) { val <- unlist(val) }
    g <- set_vertex_attr(g, n, value=val)
  }

  ## Edge attributes
  e.n <- names(graph::edgeDataDefaults(graphNEL))
  if (!weight) { e.n <- e.n [ e.n != "weight" ] }
  if (length(e.n) > 0) {
    el <- as_edgelist(g)
    el <- paste(sep="|", el[,1], el[,2])
    for (n in e.n) {
      val <- unname(graph::edgeData(graphNEL, attr=n)[el])
      if (unlist.attrs && all(sapply(val, length)==1)) { val <- unlist(val) }
      g <- set_edge_attr(g, n, value=val)
    }
  }
  
  g 
}

#' Convert igraph graphs to graphNEL objects from the graph package
#' 
#' The graphNEL class is defined in the \code{graph} package, it is another
#' way to represent graphs. These functions are provided to convert between
#' the igraph and the graphNEL objects.
#' 
#' \code{as_graphnel} converts an igraph graph to a graphNEL graph. It
#' converts all graph/vertex/edge attributes. If the igraph graph has a
#' vertex attribute \sQuote{\code{name}}, then it will be used to assign
#' vertex names in the graphNEL graph. Otherwise numeric igraph vertex ids
#' will be used for this purpose.
#' 
#' @aliases igraph.to.graphNEL
#' @param graph An igraph graph object.
#' @return \code{as_graphnel} returns a graphNEL graph object.
#' @seealso \code{\link{graph_from_graphnel}} for the other direction,
#' \code{\link{as_adj}}, \code{\link{graph_from_adjacency_matrix}},
#' \code{\link{as_adj_list}} and \code{\link{graph.adjlist}} for
#' other graph representations.
#' @examples
#' ## Undirected
#' \dontrun{
#' g <- make_ring(10)
#' V(g)$name <- letters[1:10]
#' GNEL <- as_graphnel(g)
#' g2 <- graph_from_graphnel(GNEL)
#' g2
#' 
#' ## Directed
#' g3 <- make_star(10, mode="in")
#' V(g3)$name <- letters[1:10]
#' GNEL2 <- as_graphnel(g3)
#' g4 <- graph_from_graphnel(GNEL2)
#' g4
#' }
#' @export

as_graphnel <- function(graph) {

  if (!is_igraph(graph)) {
    stop("Not an igraph graph")
  }
  
  if ("name" %in% vertex_attr_names(graph) &&
      is.character(V(graph)$name)) {
    name <- V(graph)$name
  } else {
    name <- as.character(seq(vcount(graph)))    
  }

  edgemode <- if (is_directed(graph)) "directed" else "undirected"  

  if ("weight" %in% edge_attr_names(graph) &&
      is.numeric(E(graph)$weight)) {
    al <- lapply(as_adj_edge_list(graph, "out"), as.vector)
    for (i in seq(along=al)) {
      edges <- ends(graph, al[[i]], names = FALSE)
      edges <- ifelse( edges[,2]==i, edges[,1], edges[,2])
      weights <- E(graph)$weight[al[[i]]]
      al[[i]] <- list(edges=edges, weights=weights)
    }
  } else {
    al <- as_adj_list(graph, "out")
    al <- lapply(al, function(x) list(edges=as.vector(x)))
  }  
  
  names(al) <- name
  res <- graph::graphNEL(nodes=name, edgeL=al, edgemode=edgemode)

  ## Add graph attributes (other than 'directed')
  ## Are this "officially" supported at all?

  g.n <- graph_attr_names(graph)
  if ("directed" %in% g.n) {
    warning("Cannot add graph attribute `directed'")
    g.n <- g.n[ g.n != "directed" ]
  }
  for (n in g.n) {
    res@graphData[[n]] <- graph_attr(graph, n)
  }

  ## Add vertex attributes (other than 'name', that is already
  ## added as vertex names)
  
  v.n <- vertex_attr_names(graph)
  v.n <- v.n[ v.n != "name" ]
  for (n in v.n) {
    graph::nodeDataDefaults(res, attr=n) <- NA
    graph::nodeData(res, attr=n) <- vertex_attr(graph, n)
  }

  ## Add edge attributes (other than 'weight')
  
  e.n <- edge_attr_names(graph)
  e.n <- e.n[ e.n != "weight" ]
  if (length(e.n) > 0) {
    el <- as_edgelist(graph)
    el <- paste(sep="|", el[,1], el[,2])
    for (n in e.n) {
      graph::edgeDataDefaults(res, attr=n) <- NA
      res@edgeData@data[el] <- mapply(function(x,y) {
        xx <- c(x,y); names(xx)[length(xx)] <- n; xx },
                                      res@edgeData@data[el],
                                      edge_attr(graph, n),
                                      SIMPLIFY=FALSE)
    }
  }
  
  res
}

get.incidence.dense <- function(graph, types, names, attr) {

  if (is.null(attr)) {
    on.exit( .Call(C_R_igraph_finalizer) )
    ## Function call
    res <- .Call(C_R_igraph_get_incidence, graph, types)

    if (names && "name" %in% vertex_attr_names(graph)) {
      rownames(res$res) <- V(graph)$name[ res$row_ids+1 ]
      colnames(res$res) <- V(graph)$name[ res$col_ids+1 ]
    } else {
      rownames(res$res) <- res$row_ids+1
      colnames(res$res) <- res$col_ids+1
    }
    res$res
    
  } else {

    attr <- as.character(attr)
    if (!attr %in% edge_attr_names(graph)) {
      stop("no such edge attribute")
    }

    vc <- vcount(graph)
    n1 <- sum(!types)
    n2 <- vc-n1    
    res <- matrix(0, n1, n2)

    recode <- numeric(vc)
    recode[!types] <- seq_len(n1)
    recode[types]  <- seq_len(n2)
    
    for (i in seq(length=ecount(graph))) {
      eo <- ends(graph, i, names = FALSE)
      e <- recode[eo]
      if (!types[eo[1]]) {
        res[ e[1], e[2] ] <- edge_attr(graph, attr, i)
      } else{
        res[ e[2], e[1] ] <- edge_attr(graph, attr, i)
      }
    }

    if (names && "name" %in% vertex_attr_names(graph)) {
      rownames(res) <- V(graph)$name[ which(!types) ]
      colnames(res) <- V(graph)$name[ which( types) ]
    } else {
      rownames(res) <- which(!types)
      colnames(res) <- which(types)
    }

    res
  }
}

get.incidence.sparse <- function(graph, types, names, attr) {

  vc <- vcount(graph)
  if (length(types) != vc) {
    stop("Invalid types vector")
  }

  el <- as_edgelist(graph, names=FALSE)
  if (any(types[el[,1]] == types[el[,2]])) {
    stop("Invalid types vector, not a bipartite graph")
  }

  n1 <- sum(!types)
  n2 <- vc-n1

  recode <- numeric(vc)
  recode[!types] <- seq_len(n1)
  recode[types]  <- seq_len(n2) + n1

  el[,1] <- recode[el[,1]]
  el[,2] <- recode[el[,2]]

  change <- el[,1] > n1
  el[change,] <- el[change,2:1]
  el[,2] <- el[,2]-n1

  if (!is.null(attr)) {
    attr <- as.character(attr)
    if (!attr %in% edge_attr_names(graph)) {
      stop("no such edge attribute")
    }
    value <- edge_attr(graph, name=attr)
  } else { 
    value <- rep(1, nrow(el))
  }

  res <- Matrix::spMatrix(n1, n2, i=el[,1], j=el[,2], x=value)

  if (names && "name" %in% vertex_attr_names(graph)) {
    rownames(res) <- V(graph)$name[which(!types)]
    colnames(res) <- V(graph)$name[which(types)]
  } else {
    rownames(res) <- which(!types)
    colnames(res) <- which(types)
  }
  res
}



#' Incidence matrix of a bipartite graph
#' 
#' This function can return a sparse or dense incidence matrix of a bipartite
#' network. The incidence matrix is an \eqn{n} times \eqn{m} matrix, \eqn{n}
#' and \eqn{m} are the number of vertices of the two kinds.
#' 
#' Bipartite graphs have a \code{type} vertex attribute in igraph, this is
#' boolean and \code{FALSE} for the vertices of the first kind and \code{TRUE}
#' for vertices of the second kind.
#'
#' @aliases get.incidence
#' @param graph The input graph. The direction of the edges is ignored in
#' directed graphs.
#' @param types An optional vertex type vector to use instead of the
#' \code{type} vertex attribute. You must supply this argument if the graph has
#' no \code{type} vertex attribute.
#' @param attr Either \code{NULL} or a character string giving an edge
#' attribute name. If \code{NULL}, then a traditional incidence matrix is
#' returned. If not \code{NULL} then the values of the given edge attribute are
#' included in the incidence matrix. If the graph has multiple edges, the edge
#' attribute of an arbitrarily chosen edge (for the multiple edges) is
#' included.
#' @param names Logical scalar, if \code{TRUE} and the vertices in the graph
#' are named (i.e. the graph has a vertex attribute called \code{name}), then
#' vertex names will be added to the result as row and column names. Otherwise
#' the ids of the vertices are used as row and column names.
#' @param sparse Logical scalar, if it is \code{TRUE} then a sparse matrix is
#' created, you will need the \code{Matrix} package for this.
#' @return A sparse or dense matrix.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @seealso \code{\link{graph_from_incidence_matrix}} for the opposite operation.
#' @export
#' @keywords graphs
#' @examples
#' 
#' g <- make_bipartite_graph( c(0,1,0,1,0,0), c(1,2,2,3,3,4) )
#' as_incidence_matrix(g)
#' 
as_incidence_matrix <- function(graph, types=NULL, attr=NULL,
                          names=TRUE, sparse=FALSE) {
  # Argument checks
  if (!is_igraph(graph)) { stop("Not a graph object") }
  if (is.null(types) && "type" %in% vertex_attr_names(graph)) { 
    types <- V(graph)$type 
  } 
  if (!is.null(types)) { 
    types <- as.logical(types) 
  } else { 
    stop("Not a bipartite graph, supply `types' argument") 
  }
  
  names <- as.logical(names)
  sparse <- as.logical(sparse)
  
  if (sparse) {
    get.incidence.sparse(graph, types=types, names=names, attr=attr)
  } else {
    get.incidence.dense(graph, types=types, names=names, attr=attr)
  }
}

#' @rdname graph_from_data_frame
#' @param x An igraph object.
#' @param what Character constant, whether to return info about vertices,
#' edges, or both. The default is \sQuote{edges}.
#' @export

as_data_frame <- function(x, what=c("edges", "vertices", "both")) {

  if (!is_igraph(x)) { stop("Not a graph object") }
  what <- igraph.match.arg(what)

  if (what %in% c("vertices", "both")) {
    ver <- .Call(C_R_igraph_mybracket2, x, 9L, 3L)
    class(ver) <- "data.frame"
    rn <- if (is_named(x)) { V(x)$name } else { seq_len(vcount(x)) }
    rownames(ver) <- rn
  }

  if (what %in% c("edges", "both")) {
    el <- as_edgelist(x)
    edg <- c(list(from=el[,1]), list(to=el[,2]),
             .Call(C_R_igraph_mybracket2, x, 9L, 4L))
    class(edg) <- "data.frame"
    rownames(edg) <- seq_len(ecount(x))
  }
  
  if (what=="both") {
    list(vertices=ver, edges=edg)
  } else if (what=="vertices") {
    ver
  } else {
    edg
  }
}


#' Create graphs from adjacency lists
#' 
#' An adjacency list is a list of numeric vectors, containing the neighbor
#' vertices for each vertex. This function creates an igraph graph object from
#' such a list.
#' 
#' Adjacency lists are handy if you intend to do many (small) modifications to
#' a graph. In this case adjacency lists are more efficient than igraph graphs.
#' 
#' The idea is that you convert your graph to an adjacency list by
#' \code{\link{as_adj_list}}, do your modifications to the graphs and finally
#' create again an igraph graph by calling \code{graph_from_adj_list}.
#' 
#' @aliases graph.adjlist graph_from_adj_list
#' @param adjlist The adjacency list. It should be consistent, i.e. the maximum
#' throughout all vectors in the list must be less than the number of vectors
#' (=the number of vertices in the graph). Note that the list is expected to be
#' 0-indexed.
#' @param mode Character scalar, it specifies whether the graph to create is
#' undirected (\sQuote{all} or \sQuote{total}) or directed; and in the latter
#' case, whether it contains the outgoing (\sQuote{out}) or the incoming
#' (\sQuote{in}) neighbors of the vertices.
#' @param duplicate Logical scalar. For undirected graphs it gives whether
#' edges are included in the list twice. E.g. if it is \code{TRUE} then for an
#' undirected \code{{A,B}} edge \code{graph_from_adj_list} expects \code{A}
#' included in the neighbors of \code{B} and \code{B} to be included in the
#' neighbors of \code{A}.
#' 
#' This argument is ignored if \code{mode} is \code{out} or \code{in}.
#' @return An igraph graph object.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @seealso \code{\link{as_edgelist}}
#' @keywords graphs
#' @examples
#' 
#' ## Directed
#' g <- make_ring(10, dir=TRUE)
#' al <- as_adj_list(g, mode="out")
#' g2 <- graph_from_adj_list(al)
#' graph.isomorphic(g, g2)
#' 
#' ## Undirected
#' g <- make_ring(10)
#' al <- as_adj_list(g)
#' g2 <- graph_from_adj_list(al, mode="all")
#' graph.isomorphic(g, g2)
#' ecount(g2)
#' g3 <- graph_from_adj_list(al, mode="all", duplicate=FALSE)
#' ecount(g3)
#' which_multiple(g3)
#' @export

graph_from_adj_list <- graph_from_adj_list


#' Convert a graph to a long data frame
#'
#' A long data frame contains all metadata about both the vertices
#' and edges of the graph. It contains one row for each edge, and
#' all metadata about that edge and its incident vertices are included
#' in that row. The names of the columns that contain the metadata
#' of the incident vertices are prefixed with \code{from_} and \code{to_}.
#' The first two columns are always named \code{from} and \code{to} and
#' they contain the numeric ids of the incident vertices. The rows are
#' listed in the order of numeric vertex ids.
#'
#' @param graph Input graph
#' @return A long data frame.
#'
#' @export
#' @examples
#' g <- make_(ring(10),
#'         with_vertex_(name = letters[1:10], color = "red"),
#'         with_edge_(weight = 1:10, color = "green")
#'       )
#' as_long_data_frame(g)

as_long_data_frame <- function(graph) {

  if (!is_igraph(graph)) { stop("Not a graph object") }

  ver <- .Call(C_R_igraph_mybracket2, graph, 9L, 3L)
  class(ver) <- "data.frame"
  rn <- if (is_named(graph)) { V(graph)$name } else { seq_len(vcount(graph)) }
  rownames(ver) <- rn

  el <- as_edgelist(graph, names = FALSE)
  edg <- c(list(from=el[,1]), list(to=el[,2]),
           .Call(C_R_igraph_mybracket2, graph, 9L, 4L))
  class(edg) <- "data.frame"
  rownames(edg) <- seq_len(ecount(graph))

  ver2 <- ver
  names(ver) <- paste0("from_", names(ver))
  names(ver2) <- paste0("to_", names(ver2))

  edg <- cbind(edg, ver[ el[,1], ], ver2[ el[,2], ])

  edg
}
