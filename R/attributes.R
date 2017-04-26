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

##
## The brand new attribute interface:
##
## g(graph)$name                   # get a graph attribute
## g(graph)$name <- "Ring"         # set a graph attribute
## 
## v(graph)$color <- "red"         # set vertex attribute
## v(graph)$color[1:5] <- "blue"   
## v(graph)$color[c(5,6,7)]        # get vertex attribute
##
## e(graph)$weight <- 1            # set edge attribute
## e(graph)$weight[1:10]           # get edge attribute
##


#' Graph attributes of a graph
#'
#' @param graph Input graph.
#' @param name The name of attribute to query. If missing, then all
#'   attributes are returned in a list.
#' @return A list of graph attributes, or a single graph attribute.
#'
#' @aliases get.graph.attribute graph.attributes
#' @family graph attributes
#' 
#' @export
#' @examples
#' g <- make_ring(10)
#' graph_attr(g)
#' graph_attr(g, "name")

graph_attr <- function(graph, name) {
  if (!is_igraph(graph)) {
    stop("Not a graph object")
  }
  if (missing(name)) {
    graph.attributes(graph)
  } else {
    .Call(C_R_igraph_mybracket2, graph, 9L, 2L)[[as.character(name)]]
  }
}


#' Set all or some graph attributes
#'
#' @param graph The graph.
#' @param name The name of the attribute to set. If missing, then
#'   \code{value} should be a named list, and all list members
#'   are set as attributes.
#' @param value The value of the attribute to set
#' @return The graph, with the attribute(s) added.
#'
#' @aliases graph.attributes<-
#' @family graph attributes
#' 
#' @export
#' @examples
#' g <- make_graph(~ A - B:C:D)
#' graph_attr(g, "name") <- "4-star"
#' g
#'
#' graph_attr(g) <- list(layout = layout_with_fr(g),
#'                        name = "4-star layed out")
#' plot(g)

`graph_attr<-` <- function(graph, name, value) {
  if (missing(name)) {
    `graph.attributes<-`(graph, value)
  } else {
    set_graph_attr(graph, name, value)
  }
}

#' Set a graph attribute
#'
#' An existing attribute with the same name is overwritten.
#' 
#' @param graph The graph.
#' @param name The name of the attribute to set.
#' @param value New value of the attribute.
#' @return The graph with the new graph attribute added or set.
#'
#' @family graph attributes
#' @aliases set.graph.attribute
#' 
#' @export
#' @examples
#' g <- make_ring(10) %>%
#'   set_graph_attr("layout", layout_with_fr)
#' g
#' plot(g)

set_graph_attr <- function(graph, name, value) {
  if (!is_igraph(graph)) {
    stop("Not a graph object")
  }

  .Call(C_R_igraph_mybracket3_set, graph, 9L, 2L, name, value)
}

#' @export

graph.attributes <- function(graph) {
  if (!is_igraph(graph)) {
    stop("Not a graph object")
  }
  .Call(C_R_igraph_mybracket2_copy, graph, 9L, 2L)
} 

#' @export

"graph.attributes<-" <- function(graph, value) {
  if (!is_igraph(graph)) {
    stop("Not a graph object")
  }
  if (!is.list(value) || (length(value) > 0 && is.null(names(value))) ||
      any(names(value) == "") || any(duplicated(names(value)))) {
    stop("Value must be a named list with unique names")
  }
            
  .Call(C_R_igraph_mybracket2_set, graph, 9L, 2L, value)
}


#' Query vertex attributes of a graph
#'
#' @param graph The graph.
#' @param name Name of the attribute to query. If missing, then
#'   all vertex attributes are returned in a list.
#' @param index A vertex sequence, to query the attribute only
#'   for these vertices.
#' @return The value of the vertex attribute, or the list of
#'   all vertex attributes, if \code{name} is missing.
#'
#' @aliases get.vertex.attribute vertex.attributes
#' @family graph attributes
#' 
#' @export
#' @examples
#' g <- make_ring(10) %>%
#'   set_vertex_attr("color", value = "red") %>%
#'   set_vertex_attr("label", value = letters[1:10])
#' vertex_attr(g, "label")
#' vertex_attr(g)
#' plot(g)

vertex_attr <- function(graph, name, index=V(graph)) {
  if (!is_igraph(graph)) {
    stop("Not a graph object")
  }
  if (missing(name)) {
    if (missing(index)) {
      vertex.attributes(graph)
    } else {
      vertex.attributes(graph, index = index)
    }
  } else {
    myattr <-
      .Call(C_R_igraph_mybracket2, graph, 9L, 3L)[[as.character(name)]]
    if (! missing(index)) {
      index <- as.igraph.vs(graph, index)
      myattr <- myattr[index]
    }
    myattr
  }
}

#' Set one or more vertex attributes
#'
#' @param graph The graph.
#' @param name The name of the vertex attribute to set. If missing,
#'   then \code{value} must be a named list, and its entries are
#'   set as vertex attributes.
#' @param index An optional vertex sequence to set the attributes
#'   of a subset of vertices.
#' @param value The new value of the attribute(s) for all
#'   (or \code{index}) vertices. 
#' @return The graph, with the vertex attribute(s) added or set.
#'
#' @aliases vertex.attributes<-
#' @family graph attributes
#' 
#' @export
#' @examples
#' g <- make_ring(10)
#' vertex_attr(g) <- list(name = LETTERS[1:10],
#'                         color = rep("yellow", gorder(g)))
#' vertex_attr(g, "label") <- V(g)$name
#' g
#' plot(g)

`vertex_attr<-` <- function(graph, name, index = V(graph), value) {
  if (missing(name)) {
    `vertex.attributes<-`(graph, index = index, value = value)
  } else {
    set_vertex_attr(graph, name = name, index = index, value = value)
  }
}

#' Set vertex attributes
#' 
#' @param graph The graph.
#' @param name  The name of the attribute to set.
#' @param index An optional vertex sequence to set the attributes
#'   of a subset of vertices.
#' @param value The new value of the attribute for all (or \code{index})
#'   vertices.
#' @return The graph, with the vertex attribute added or set.
#'
#' @aliases set.vertex.attribute
#' @family graph attributes
#' 
#' @export
#' @examples
#' g <- make_ring(10) %>%
#'   set_vertex_attr("label", value = LETTERS[1:10])
#' g
#' plot(g)

set_vertex_attr <- function(graph, name, index = V(graph), value) {
  i_set_vertex_attr(graph = graph, name = name, index = index,
                    value = value)
}

i_set_vertex_attr <- function(graph, name, index=V(graph), value,
                              check = TRUE) {
  if (!is_igraph(graph)) {
    stop("Not a graph object")
  }
  single <- "single" %in% names(attributes(index)) && attr(index, "single")
  if (!missing(index) && check) { index <- as.igraph.vs(graph, index) }
  name <- as.character(name)
  vc <- vcount(graph)

  vattrs <- .Call(C_R_igraph_mybracket2, graph, 9L, 3L)
  if (single) {
    vattrs[[name]][[index]] <- value
  } else {
    vattrs[[name]][index] <- value
  }
  length(vattrs[[name]]) <- vc
  
  .Call(C_R_igraph_mybracket2_set, graph, 9L, 3L, vattrs)
}

#' @export

vertex.attributes <- function(graph, index = V(graph)) {
  if (!is_igraph(graph)) {
    stop("Not a graph object")
  }

  if (!missing(index)) {
    index <- as.igraph.vs(graph, index)
  }

  res <- .Call(C_R_igraph_mybracket2_copy, graph, 9L, 3L)

  if (!missing(index) &&
      (length(index) != vcount(graph) || any(index != V(graph)))) {
    for (i in seq_along(res)) {
      res[[i]] <- res[[i]][index]
    }
  }
  res
}

#' @export

"vertex.attributes<-" <- function(graph, index = V(graph), value) {
  if (!is_igraph(graph)) {
    stop("Not a graph object")
  }
  if (!is.list(value) || (length(value) > 0 && is.null(names(value))) ||
      any(names(value) == "") || any(duplicated(names(value)))) {
    stop("Value must be a named list with unique names")
  }
  if ( any(sapply(value, length) != length(index)) ) {
    stop("Invalid attribute value length, must match number of vertices")
  }

  if (!missing(index)) {
    index <- as.igraph.vs(graph, index)
    if (any(duplicated(index)) || any(is.na(index))) {
      stop("Invalid vertices in index")
    }
  }

  if (!missing(index) &&
      (length(index) != vcount(graph) || any(index != V(graph)))) {
    vs <- V(graph)
    for (i in seq_along(value)) {
      tmp <- value[[i]]
      length(tmp) <- 0
      length(tmp) <- length(vs)
      tmp[index] <- value[[i]]
      value[[i]] <- tmp
    }
  }

  .Call(C_R_igraph_mybracket2_set, graph, 9L, 3L, value)
}


#' Query edge attributes of a graph
#' 
#' @param graph The graph
#' @param name The name of the attribute to query. If missing, then
#'   all edge attributes are returned in a list.
#' @param index An optional edge sequence, to query edge attributes
#'   for a subset of edges.
#' @return The value of the edge attribute, or the list of all
#'   edge attributes if \code{name} is missing.
#'
#' @aliases get.edge.attribute edge.attributes
#' @family graph attributes
#' 
#' @export
#' @examples
#' g <- make_ring(10) %>%
#'   set_edge_attr("weight", value = 1:10) %>%
#'   set_edge_attr("color", value = "red")
#' g
#' plot(g, edge.width = E(g)$weight)

edge_attr <- function(graph, name, index=E(graph)) {
  if (!is_igraph(graph)) {
    stop("Not a graph object")
  }
  if (missing(name)) {
    edge.attributes(graph, name)
  } else {
    name <- as.character(name)
    index <- as.igraph.es(graph, index)
    myattr <- .Call(C_R_igraph_mybracket2, graph, 9L, 4L)[[name]]
    myattr[index]
  }
}

#' Set one or more edge attributes
#' 
#' @param graph The graph.
#' @param name The name of the edge attribute to set. If missing,
#'   then \code{value} must be a named list, and its entries are
#'   set as edge attributes.
#' @param index An optional edge sequence to set the attributes
#'   of a subset of edges.
#' @param value The new value of the attribute(s) for all
#'   (or \code{index}) edges.
#' @return The graph, with the edge attribute(s) added or set.
#'
#' @aliases edge.attributes<-
#' @family graph attributes
#' 
#' @export
#' @examples
#' g <- make_ring(10)
#' edge_attr(g) <- list(name = LETTERS[1:10],
#'                       color = rep("green", gsize(g)))
#' edge_attr(g, "label") <- E(g)$name
#' g
#' plot(g)

`edge_attr<-` <- function(graph, name, index = E(graph), value) {
  if (missing(name)) {
    `edge.attributes<-`(graph, index = index, value = value)
  } else {
    set_edge_attr(graph, name = name, index = index, value = value)
  }
}

#' Set edge attributes
#' 
#' @param graph The graph
#' @param name  The name of the attribute to set.
#' @param index An optional edge sequence to set the attributes of
#'   a subset of edges.
#' @param value The new value of the attribute for all (or \code{index})
#'   edges.
#' @return The graph, with the edge attribute added or set.
#'
#' @aliases set.edge.attribute
#' @family graph attributes
#' 
#' @export
#' @examples
#' g <- make_ring(10) %>%
#'   set_edge_attr("label", value = LETTERS[1:10])
#' g
#' plot(g)

set_edge_attr <- function(graph, name, index = E(graph), value) {
  i_set_edge_attr(graph = graph, name = name, index = index, value = value)
}

i_set_edge_attr <- function(graph, name, index=E(graph), value,
                              check = TRUE) {
  if (!is_igraph(graph)) {
    stop("Not a graph object")
  }
  single <- "single" %in% names(attributes(index)) && attr(index, "single")
  name <- as.character(name)
  if (!missing(index) && check) index <- as.igraph.es(graph, index)
  ec <- ecount(graph)

  eattrs <- .Call(C_R_igraph_mybracket2, graph, 9L, 4L)
  if (single) {
    eattrs[[name]][[index]] <- value
  } else {
    eattrs[[name]][index] <- value
  }
  length(eattrs[[name]]) <- ec

  .Call(C_R_igraph_mybracket2_set, graph, 9L, 4L, eattrs)
}

#' @export

edge.attributes <- function(graph, index = E(graph)) {
  if (!is_igraph(graph)) {
    stop("Not a graph object")
  }

  if (!missing(index)) {
    index <- as.igraph.es(graph, index)
  }

  res <- .Call(C_R_igraph_mybracket2_copy, graph, 9L, 4L)

  if (!missing(index) &&
      (length(index) != ecount(graph) || any(index != E(graph)))) {
    for (i in seq_along(res)) {
      res[[i]] <- res[[i]][index]
    }
  }
  res
}

#' @export

"edge.attributes<-" <- function(graph, index = E(graph), value) {
  if (!is_igraph(graph)) {
    stop("Not a graph object")
  }

  if (!is.list(value) || (length(value) > 0 && is.null(names(value))) ||
      any(names(value) == "") || any(duplicated(names(value)))) {
    stop("Value must be a named list with unique names")
  }
  if ( any(sapply(value, length) != length(index)) ) {
    stop("Invalid attribute value length, must match number of edges")
  }

  if (!missing(index)) {
    index <- as.igraph.es(graph, index)
    if (any(duplicated(index)) || any(is.na(index))) {
      stop("Invalid edges in index")
    }
  }

  if (!missing(index) &&
      (length(index) != ecount(graph) || any(index != E(graph)))) {
    es <- E(graph)
    for (i in seq_along(value)) {
      tmp <- value[[i]]
      length(tmp) <- 0
      length(tmp) <- length(es)
      tmp[index] <- value[[i]]
      value[[i]] <- tmp
    }
  }
  
  .Call(C_R_igraph_mybracket2_set, graph, 9L, 4L, value)
}

#' List names of graph attributes
#' 
#' @param graph The graph.
#' @return Character vector, the names of the graph attributes.
#'
#' @aliases list.graph.attributes attributes
#' @family graph attributes
#' 
#' @export
#' @examples
#' g <- make_ring(10)
#' graph_attr_names(g)

graph_attr_names <- function(graph) {
  if (!is_igraph(graph)) {
    stop("Not a graph object")
  }
  res <- .Call(C_R_igraph_mybracket2_names, graph, 9L, 2L)
  if (is.null(res)) { res <- character() }
  res
}

#' List names of vertex attributes
#'
#' @param graph The graph.
#' @return Character vector, the names of the vertex attributes.
#'
#' @aliases list.vertex.attributes
#' @family graph attributes
#'
#' @export
#' @examples
#' g <- make_ring(10) %>%
#'   set_vertex_attr("name", value = LETTERS[1:10]) %>%
#'   set_vertex_attr("color", value = rep("green", 10))
#' vertex_attr_names(g)
#' plot(g)

vertex_attr_names <- function(graph) {
  if (!is_igraph(graph)) {
    stop("Not a graph object")
  }
  res <- .Call(C_R_igraph_mybracket2_names, graph, 9L, 3L)
                     
  if (is.null(res)) { res <- character() }
  res
}

#' List names of edge attributes
#'
#' @param graph The graph.
#' @return Character vector, the names of the edge attributes.
#'
#' @aliases list.edge.attributes
#' @family graph attributes
#' 
#' @export
#' @examples
#' g <- make_ring(10) %>%
#'   set_edge_attr("label", value = letters[1:10])
#' edge_attr_names(g)
#' plot(g)

edge_attr_names <- function(graph) {
  if (!is_igraph(graph)) {
    stop("Not a graph object")
  }
  res <- .Call(C_R_igraph_mybracket2_names, graph, 9L, 4L)
  if (is.null(res)) { res <- character() }
  res
}

#' Delete a graph attribute
#'
#' @param graph The graph.
#' @param name Name of the attribute to delete.
#' @return The graph, with the specified attribute removed.
#'
#' @aliases remove.graph.attribute
#' @family graph attributes
#' 
#' @export
#' @examples
#' g <- make_ring(10)
#' graph_attr_names(g)
#' g2 <- delete_graph_attr(g, "name")
#' graph_attr_names(g2)

delete_graph_attr <- function(graph, name) {
  if (!is_igraph(graph)) {
    stop("Not a graph object")
  }
  name <- as.character(name)
  if (!name %in% graph_attr_names(graph)) {
    stop("No such graph attribute: ", name)
  }

  gattr <- .Call(C_R_igraph_mybracket2, graph, 9L, 2L)
  gattr[[name]] <- NULL
  
  .Call(C_R_igraph_mybracket2_set, graph, 9L, 2L, gattr)
}

#' Delete a vertex attribute
#'
#' @param graph The graph
#' @param name The name of the vertex attribute to delete.
#' @return The graph, with the specified vertex attribute removed.
#'
#' @aliases remove.vertex.attribute
#' @family graph attributes
#' 
#' @export
#' @examples
#' g <- make_ring(10) %>%
#'   set_vertex_attr("name", value = LETTERS[1:10])
#' vertex_attr_names(g)
#' g2 <- delete_vertex_attr(g, "name")
#' vertex_attr_names(g2)

delete_vertex_attr <- function(graph, name) {
  if (!is_igraph(graph)) {
    stop("Not a graph object")
  }
  name <- as.character(name)
  if (!name %in% vertex_attr_names(graph)) {
    stop("No such vertex attribute: ", name)
  }

  vattr <- .Call(C_R_igraph_mybracket2, graph, 9L, 3L)
  vattr[[name]] <- NULL
  
  .Call(C_R_igraph_mybracket2_set, graph, 9L, 3L, vattr)
}

#' Delete an edge attribute
#'
#' @param graph The graph
#' @param name The name of the edge attribute to delete.
#' @return The graph, with the specified edge attribute removed.
#'
#' @aliases remove.edge.attribute
#' @family graph attributes
#' 
#' @export
#' @examples
#' g <- make_ring(10) %>%
#'   set_edge_attr("name", value = LETTERS[1:10])
#' edge_attr_names(g)
#' g2 <- delete_edge_attr(g, "name")
#' edge_attr_names(g2)

delete_edge_attr <- function(graph, name) {
  if (!is_igraph(graph)) {
    stop("Not a graph object")
  }
  name <- as.character(name)
  if (!name %in% edge_attr_names(graph)) {
    stop("No such edge attribute: ", name)
  }

  eattr <- .Call(C_R_igraph_mybracket2, graph, 9L, 4L)
  eattr[[name]] <- NULL
  
  .Call(C_R_igraph_mybracket2_set, graph, 9L, 4L, eattr)
}

#############



#' Named graphs
#' 
#' An igraph graph is named, if there is a symbolic name associated with its
#' vertices.
#' 
#' In igraph vertices can always be identified and specified via their numeric
#' vertex ids. This is, however, not always convenient, and in many cases there
#' exist symbolic ids that correspond to the vertices. To allow this more
#' flexible identification of vertices, one can assign a vertex attribute
#' called \sQuote{name} to an igraph graph. After doing this, the symbolic
#' vertex names can be used in all igraph functions, instead of the numeric
#' ids.
#' 
#' Note that the uniqueness of vertex names are currently not enforced in
#' igraph, you have to check that for yourself, when assigning the vertex
#' names.
#'
#' @aliases is.named
#' @param graph The input graph.
#' @return A logical scalar.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @export
#' @keywords graphs
#' @examples
#' 
#' g <- make_ring(10)
#' is_named(g)
#' V(g)$name <- letters[1:10]
#' is_named(g)
#' neighbors(g, "a")
#' 
is_named <- function(graph) {
  if (!is_igraph(graph)) {
    stop("Not a graph object")
  }
  "name" %in% vertex_attr_names(graph)
}



#' Weighted graphs
#' 
#' In weighted graphs, a real number is assigned to each (directed or
#' undirected) edge.
#' 
#' In igraph edge weights are represented via an edge attribute, called
#' \sQuote{weight}. The \code{is_weighted} function only checks that such an
#' attribute exists. (It does not even checks that it is a numeric edge
#' attribute.)
#' 
#' Edge weights are used for different purposes by the different functions.
#' E.g. shortest path functions use it as the cost of the path; community
#' finding methods use it as the strength of the relationship between two
#' vertices, etc. Check the manual pages of the functions working with weighted
#' graphs for details.
#'
#' @aliases is.weighted
#' @param graph The input graph.
#' @return A logical scalar.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @export
#' @keywords graphs
#' @examples
#' 
#' g <- make_ring(10)
#' shortest_paths(g, 8, 2)
#' E(g)$weight <- seq_len(ecount(g))
#' shortest_paths(g, 8, 2)
#' 
is_weighted <- function(graph) {
  if (!is_igraph(graph)) {
    stop("Not a graph object")
  }
  "weight" %in% edge_attr_names(graph)
}

#' @rdname make_bipartite_graph
#' @export

is_bipartite <- function(graph) {
  if (!is_igraph(graph)) {
    stop("Not a graph object")
  }
  "type" %in% vertex_attr_names(graph)
}

#############

igraph.i.attribute.combination <- function(comb) {
  if (is.function(comb)) {
    comb <- list(comb)
  }
  comb <- as.list(comb)
  if (any(!sapply(comb, function(x)
                  is.function(x) || (is.character(x) && length(x)==1)))) {
    stop("Attribute combination element must be a function or character scalar")
  }
  if (is.null(names(comb))) {
    names(comb) <- rep("", length(comb))
  }
  if (any(duplicated(names(comb)))) {
    warning("Some attributes are duplicated")
  }
  comb <- lapply(comb, function(x) {
    if (!is.character(x)) {
      x
    } else {
      known <- data.frame(n=c("ignore", "sum", "prod", "min", "max", "random",
                            "first", "last", "mean", "median", "concat"),
                          i=c(0,3,4,5,6,7,8,9,10,11,12), stringsAsFactors=FALSE)
      x <- pmatch(tolower(x), known[,1])
      if (is.na(x)) {
        stop("Unknown/unambigous attribute combination specification")
      }
      known[,2][x]
    }
  })

  comb
}

#' How igraph functions handle attributes when the graph changes
#' 
#' Many times, when the structure of a graph is modified, vertices/edges map of
#' the original graph map to vertices/edges in the newly created (modified)
#' graph. For example \code{\link{simplify}} maps multiple edges to single
#' edges. igraph provides a flexible mechanism to specify what to do with the
#' vertex/edge attributes in these cases.
#' 
#' The functions that support the combination of attributes have one or two
#' extra arguments called \code{vertex.attr.comb} and/or \code{edge.attr.comb}
#' that specify how to perform the mapping of the attributes. E.g.
#' \code{\link{contract}} contracts many vertices into a single one, the
#' attributes of the vertices can be combined and stores as the vertex
#' attributes of the new graph.
#' 
#' The specification of the combination of (vertex or edge) attributes can be
#' given as \enumerate{
#'   \item a character scalar,
#'   \item a function object or
#'   \item a list of character scalars and/or function objects.
#' }
#' 
#' If it is a character scalar, then it refers to one of the predefined
#' combinations, see their list below.
#' 
#' If it is a function, then the given function is expected to perform the
#' combination. It will be called once for each new vertex/edge in the graph,
#' with a single argument: the attribute values of the vertices that map to
#' that single vertex.
#' 
#' The third option, a list can be used to specify different combination
#' methods for different attributes. A named entry of the list corresponds to
#' the attribute with the same name. An unnamed entry (i.e. if the name is the
#' empty string) of the list specifies the default combination method. I.e.
#' \preformatted{list(weight="sum", "ignore")} specifies that the weight of the
#' new edge should be sum of the weights of the corresponding edges in the old
#' graph; and that the rest of the attributes should be ignored (=dropped).
#'
#' @name igraph-attribute-combination
#' @aliases attribute.combination
#' @section Predefined combination functions: The following combination
#' behaviors are predefined: \describe{ \item{"ignore"}{The attribute is
#' ignored and dropped.} \item{"sum"}{The sum of the attributes is
#' calculated. This does not work for character attributes and works for
#' complex attributes only if they have a \code{sum} generic defined. (E.g. it
#' works for sparse matrices from the \code{Matrix} package, because they have
#' a \code{sum} method.)} \item{"prod"}{The product of the attributes is
#' calculated. This does not work for character attributes and works for
#' complex attributes only if they have a \code{prod} function defined.}
#' \item{"min"}{The minimum of the attributes is calculated and returned.
#' For character and complex attributes the standard R \code{min} function is
#' used.} \item{"max"}{The maximum of the attributes is calculated and
#' returned. For character and complex attributes the standard R \code{max}
#' function is used.} \item{"random"}{Chooses one of the supplied
#' attribute values, uniformly randomly. For character and complex attributes
#' this is implemented by calling \code{sample}.} \item{"first"}{Always
#' chooses the first attribute value. It is implemented by calling the
#' \code{head} function.} \item{"last"}{Always chooses the last attribute
#' value. It is implemented by calling the \code{tail} function.}
#' \item{"mean"}{The mean of the attributes is calculated and returned.
#' For character and complex attributes this simply calls the \code{mean}
#' function.} \item{"median"}{The median of the attributes is selected.
#' Calls the R \code{median} function for all attribute types.}
#' \item{"concat"}{Concatenate the attributes, using the \code{c}
#' function. This results almost always a complex attribute.} }
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @seealso \code{\link{graph_attr}}, \code{\link{vertex_attr}},
#'   \code{\link{edge_attr}} on how to use graph/vertex/edge attributes in
#'   general. \code{\link{igraph_options}} on igraph parameters.  
#' @keywords graphs
#' @examples
#' 
#' g <- graph( c(1,2, 1,2, 1,2, 2,3, 3,4) )
#' E(g)$weight <- 1:5
#' 
#' ## print attribute values with the graph
#' igraph_options(print.graph.attributes=TRUE)
#' igraph_options(print.vertex.attributes=TRUE)
#' igraph_options(print.edge.attributes=TRUE)
#' 
#' ## new attribute is the sum of the old ones
#' simplify(g, edge.attr.comb="sum")
#' 
#' ## collect attributes into a string
#' simplify(g, edge.attr.comb=toString)
#' 
#' ## concatenate them into a vector, this creates a complex
#' ## attribute
#' simplify(g, edge.attr.comb="concat")
#' 
#' E(g)$name <- letters[seq_len(ecount(g))]
#' 
#' ## both attributes are collected into strings
#' simplify(g, edge.attr.comb=toString)
#' 
#' ## harmonic average of weights, names are dropped
#' simplify(g, edge.attr.comb=list(weight=function(x) length(x)/sum(1/x),
#'                                 name="ignore"))

NULL

#' Getting and setting graph attributes, shortcut
#'
#' The \code{$} operator is a shortcut to get and and set
#' graph attributes. It is shorter and just as readable as
#' \code{\link{graph_attr}} and \code{\link{set_graph_attr}}.
#'
#' @param x An igraph graph
#' @param name Name of the attribute to get/set.
#'
#' @method $ igraph
#' @name igraph-dollar
#' @export
#' @family graph attributes
#' @examples
#' g <- make_ring(10)
#' g$name
#' g$name <- "10-ring"
#' g$name

`$.igraph` <- function(x, name) {
  graph_attr(x, name)
}

#' @param value New value of the graph attribute.
#'
#' @method $<- igraph
#' @name igraph-dollar
#' @export

`$<-.igraph` <- function(x, name, value) {
  set_graph_attr(x, name, value)
}
