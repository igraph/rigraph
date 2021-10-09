
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
# Constructors
###################################################################

update_es_ref <- update_vs_ref <- function(graph) {
  env <- get_vs_ref(graph)
  if (!is.null(env)) assign("me", graph, envir = env)
}

get_es_ref <- get_vs_ref <- function(graph) {
  if (is_igraph(graph) && !warn_version(graph)) {
    .Call(C_R_igraph_mybracket, graph, 10L)
  } else {
    NULL
  }
}

get_es_graph <- get_vs_graph <- function(seq) {
  at <- attr(seq, "env")
  if (class(at) == "weakref") {
    weak_ref_key(at)$me
  } else if (class(at) == "environment") {
    get("graph", envir = at)
  } else {
    NULL
  }
}

has_es_graph <- has_vs_graph <- function(seq) {
  !is.null(weak_ref_key(attr(seq, "env")))
}

get_es_graph_id <- get_vs_graph_id <- function(seq) {
  new_g <- attr(seq, "graph")
  if (!is.null(new_g)) {
    new_g
  } else if (!is.null(attr(seq, "env"))) {
    get("graph", envir = attr(seq, "env"))
  } else {
    NULL
  }
}

#' Decide if two graphs are identical
#'
#' This is similar to \code{identical} in the \code{base} package,
#' but ignores the mutable piece of igraph objects, that might be
#' different, even if the two graphs are identical.
#' 
#' @param g1,g2 The two graphs
#' @return Logical scalar
#' @export

identical_graphs <- function(g1, g2) {
  stopifnot(is_igraph(g1), is_igraph(g2))
  .Call(C_R_igraph_identical_graphs, g1, g2)
}

add_vses_graph_ref <- function(vses, graph) {
  ref <- get_vs_ref(graph)
  if (!is.null(ref)) {
    attr(vses, "env") <- make_weak_ref(ref, NULL)
    attr(vses, "graph") <- get_graph_id(graph)
  } else {
    ne <- new.env()
    assign("graph", graph, envir = ne)
    attr(vses, "env") <- ne
  }

  vses
}

#' Get the id of a graph
#'
#' Graph ids are used to check that a vertex or edge sequence
#' belongs to a graph. If you create a new graph by changing the
#' structure of a graph, the new graph will have a new id.
#' Changing the attributes will not change the id.
#'
#' @param x A graph or a vertex sequence or an edge sequence.
#' @param ... Not used currently.
#' @return The id of the graph, a character scalar. For
#' vertex and edge sequences the id of the graph they were created from.
#'
#' @export
#' @examples
#' g <- make_ring(10)
#' graph_id(g)
#' graph_id(V(g))
#' graph_id(E(g))
#'
#' g2 <- g + 1
#' graph_id(g2)

graph_id <- function(x, ...)
  UseMethod("graph_id")

#' @method graph_id igraph
#' @export

graph_id.igraph <- function(x, ...) {
  get_graph_id(x)
}

#' @method graph_id igraph.vs
#' @export

graph_id.igraph.vs <- function(x, ...) {
  get_vs_graph_id(x) %||% NA_character_
}

#' @method graph_id igraph.es
#' @export

graph_id.igraph.es <- function(x, ...) {
  get_es_graph_id(x) %||% NA_character_
}

#' Vertices of a graph
#'
#' Create a vertex sequence (vs) containing all vertices of a graph.
#'
#' @details
#' A vertex sequence is just what the name says it is: a sequence of
#' vertices. Vertex sequences are usually used as igraph function arguments
#' that refer to vertices of a graph.
#' 
#' A vertex sequence is tied to the graph it refers to: it really denoted
#' the specific vertices of that graph, and cannot be used together with
#' another graph.
#' 
#' At the implementation level, a vertex sequence is simply a vector
#' containing numeric vertex ids, but it has a special class attribute
#' which makes it possible to perform graph specific operations on it, like
#' selecting a subset of the vertices based on graph structure, or vertex
#' attributes.
#'
#' A vertex sequence is most often created by the \code{V()} function. The
#' result of this includes all vertices in increasing vertex id order. A
#' vertex sequence can be indexed by a numeric vector, just like a regular
#' R vector. See \code{\link{[.igraph.vs}} and additional links to other
#' vertex sequence operations below.
#'
#' @section Indexing vertex sequences:
#' Vertex sequences mostly behave like regular vectors, but there are some
#' additional indexing operations that are specific for them;
#' e.g. selecting vertices based on graph structure, or based on vertex
#' attributes. See \code{\link{[.igraph.vs}} for details.
#'  
#' @section Querying or setting attributes:
#' Vertex sequences can be used to query or set attributes for the
#' vertices in the sequence. See \code{\link{$.igraph.vs}} for details.
#'
#' @param graph The graph
#' @return A vertex sequence containing all vertices, in the order
#'   of their numeric vertex ids.
#'
#' @family vertex and edge sequences
#' @export
#' @examples
#' # Vertex ids of an unnamed graph
#' g <- make_ring(10)
#' V(g)
#'
#' # Vertex ids of a named graph
#' g2 <- make_ring(10) %>%
#'   set_vertex_attr("name", value = letters[1:10])
#' V(g2)

V <- function(graph) {
  if (!is_igraph(graph)) {
    stop("Not a graph object")
  }

  update_vs_ref(graph)

  res <- seq_len(vcount(graph))
  if (is_named(graph)) names(res) <- vertex_attr(graph)$name
  class(res) <- "igraph.vs"
  add_vses_graph_ref(res, graph)
}

create_vs <- function(graph, idx, na_ok = FALSE) {
  if (na_ok) idx <- ifelse(idx < 1 | idx > gorder(graph), NA, idx)
  res <- simple_vs_index(V(graph), idx, na_ok = na_ok)
  add_vses_graph_ref(res, graph)
}

#' Edges of a graph
#'
#' An edge sequence is a vector containing numeric edge ids, with a special
#' class attribute that allows custom operations: selecting subsets of
#' edges based on attributes, or graph structure, creating the
#' intersection, union of edges, etc.
#'
#' @details
#' Edge sequences are usually used as igraph function arguments that 
#' refer to edges of a graph.
#'
#' An edge sequence is tied to the graph it refers to: it really denoted
#' the specific edges of that graph, and cannot be used together with
#' another graph.
#'
#' An edge sequence is most often created by the \code{E()} function. The
#' result includes edges in increasing edge id order by default (if. none
#' of the \code{P} and \code{path} arguments are used). An edge
#' sequence can be indexed by a numeric vector, just like a regular R
#' vector. See links to other edge sequence operations below.
#'
#' @section Indexing edge sequences:
#' Edge sequences mostly behave like regular vectors, but there are some
#' additional indexing operations that are specific for them;
#' e.g. selecting edges based on graph structure, or based on edge
#' attributes. See \code{\link{[.igraph.es}} for details.
#'
#' @section Querying or setting attributes:
#' Edge sequences can be used to query or set attributes for the
#' edges in the sequence. See \code{\link{$.igraph.es}} for details.
#'
#' @param graph The graph.
#' @param P A list of vertices to select edges via pairs of vertices.
#'   The first and second vertices select the first edge, the third
#'   and fourth the second, etc.
#' @param path A list of vertices, to select edges along a path.
#'   Note that this only works reliable for simple graphs. If the graph
#'   has multiple edges, one of them will be chosen arbitrarily to
#'   be included in the edge sequence.
#' @param directed Whether to consider edge directions in the \code{P}
#'   argument, for directed graphs.
#' @return An edge sequence of the graph.
#'
#' @export
#' @family vertex and edge sequences
#' @examples
#' # Edges of an unnamed graph
#' g <- make_ring(10)
#' E(g)
#'
#' # Edges of a named graph
#' g2 <- make_ring(10) %>%
#'   set_vertex_attr("name", value = letters[1:10])
#' E(g2)

E <- function(graph, P=NULL, path=NULL, directed=TRUE) {
  if (!is_igraph(graph)) {
    stop("Not a graph object")
  }

  update_es_ref(graph)

  if (!is.null(P) && !is.null(path)) {
    stop("Cannot give both `P' and `path' at the same time")
  }
  
  if (is.null(P) && is.null(path)) {  
    ec <- ecount(graph)
    res <- seq_len(ec)
  } else if (!is.null(P)) {
    on.exit( .Call(C_R_igraph_finalizer) )
    res <- .Call(C_R_igraph_es_pairs, graph, as.igraph.vs(graph, P)-1,
                 as.logical(directed)) + 1
  } else {
    on.exit(.Call(C_R_igraph_finalizer) )
    res <- .Call(C_R_igraph_es_path, graph, as.igraph.vs(graph, path)-1,
                 as.logical(directed)) + 1
  }

  if ("name" %in% edge_attr_names(graph)) {
    names(res) <- edge_attr(graph)$name[res]
  }
  if (is.named(graph)) {
    el <- ends(graph, es = res)
    attr(res, "vnames") <- paste(el[,1], el[,2], sep = "|")
  }
  
  class(res) <- "igraph.es"
  add_vses_graph_ref(res, graph)
}

create_es <- function(graph, idx, na_ok = FALSE) {
  if (na_ok) idx <- ifelse(idx < 1 | idx > gsize(graph), NA, idx)
  simple_es_index(E(graph), idx)
}

simple_vs_index <- function(x, i, na_ok = FALSE) {
  res <- unclass(x)[i]
  if (!na_ok && any(is.na(res))) stop('Unknown vertex selected')
  class(res) <- "igraph.vs"
  res
}

#' Indexing vertex sequences
#'
#' Vertex sequences can be indexed very much like a plain numeric R vector,
#' with some extras.
#'
#' @details
#' Vertex sequences can be indexed using both the single bracket and
#' the double bracket operators, and they both work the same way.
#' The only difference between them is that the double bracket operator
#' marks the result for printing vertex attributes.
#'
#' @section Multiple indices:
#' When using multiple indices within the bracket, all of them
#' are evaluated independently, and then the results are concatenated
#' using the \code{c()} function (except for the \code{na_ok} argument,
#' which is special an must be named. E.g. \code{V(g)[1, 2, .nei(1)]}
#' is equivalent to \code{c(V(g)[1], V(g)[2], V(g)[.nei(1)])}.
#'
#' @section Index types:
#' Vertex sequences can be indexed with positive numeric vectors,
#' negative numeric vectors, logical vectors, character vectors:
#' \itemize{
#'   \item When indexed with positive numeric vectors, the vertices at the
#'     given positions in the sequence are selected. This is the same as
#'     indexing a regular R atomic vector with positive numeric vectors.
#'   \item When indexed with negative numeric vectors, the vertices at the
#'     given positions in the sequence are omitted. Again, this is the same
#'     as indexing a regular R atomic vector.
#'   \item When indexed with a logical vector, the lengths of the vertex
#'     sequence and the index must match, and the vertices for which the
#'     index is \code{TRUE} are selected.
#'   \item Named graphs can be indexed with character vectors,
#'     to select vertices with the given names.
#' }
#' 
#' @section Vertex attributes:
#' When indexing vertex sequences, vertex attributes can be referred
#' to simply by using their names. E.g. if a graph has a \code{name} vertex
#' attribute, then \code{V(g)[name == "foo"]} is equivalent to
#' \code{V(g)[V(g)$name == "foo"]}. See examples below.
#'
#' @section Special functions:
#' There are some special igraph functions that can be used only
#' in expressions indexing vertex sequences: \describe{
#'   \item{\code{.nei}}{takes a vertex sequence as its argument
#'     and selects neighbors of these vertices. An optional \code{mode}
#'     argument can be used to select successors (\code{mode="out"}), or
#'     predecessors (\code{mode="in"}) in directed graphs.}
#'   \item{\code{.inc}}{Takes an edge sequence as an argument, and
#'     selects vertices that have at least one incident edge in this
#'     edge sequence.}
#'   \item{\code{.from}}{Similar to \code{.inc}, but only considers the
#'     tails of the edges.}
#'   \item{\code{.to}}{Similar to \code{.inc}, but only considers the
#'     heads of the edges.}
#'   \item{\code{.innei}, \code{.outnei}}{\code{.innei(v)} is a shorthand for
#'     \code{.nei(v, mode = "in")}, and \code{.outnei(v)} is a shorthand for
#'     \code{.nei(v, mode = "out")}.
#'   }
#' }
#' Note that multiple special functions can be used together, or with
#' regular indices, and then their results are concatenated. See more
#' examples below.
#'
#' @param x A vertex sequence.
#' @param ... Indices, see details below.
#' @param na_ok Whether it is OK to have \code{NA}s in the vertex
#'   sequence.
#' @return Another vertex sequence, referring to the same graph.
#' 
#' @method [ igraph.vs
#' @name igraph-vs-indexing
#' @export
#' @family vertex and edge sequences
#' @family vertex and edge sequence operations
#' 
#' @examples
#' # -----------------------------------------------------------------
#' # Setting attributes for subsets of vertices
#' largest_comp <- function(graph) {
#'   cl <- components(graph)
#'   V(graph)[which.max(cl$csize) == cl$membership]
#' }
#' g <- sample_(gnp(100, 2/100),
#'   with_vertex_(size = 3, label = ""),
#'   with_graph_(layout = layout_with_fr)
#' )
#' giant_v <- largest_comp(g)
#' V(g)$color <- "green"
#' V(g)[giant_v]$color <- "red"
#' plot(g)
#'
#' # -----------------------------------------------------------------
#' # nei() special function
#' g <- graph( c(1,2, 2,3, 2,4, 4,2) )
#' V(g)[ .nei( c(2,4) ) ]
#' V(g)[ .nei( c(2,4), "in") ]
#' V(g)[ .nei( c(2,4), "out") ]
#'
#' # -----------------------------------------------------------------
#' # The same with vertex names
#' g <- graph(~ A -+ B, B -+ C:D, D -+ B)
#' V(g)[ .nei( c('B', 'D') ) ]
#' V(g)[ .nei( c('B', 'D'), "in" ) ]
#' V(g)[ .nei( c('B', 'D'), "out" ) ]

`[.igraph.vs` <- function(x, ..., na_ok = FALSE) {

  args <- lazy_dots(..., .follow_symbols = FALSE)

  ## If indexing has no argument at all, then we still get one,
  ## but it is "empty", a name that is  ""

  ## Special case, no argument (but we might get an artificial
  ## empty one
  if (length(args) < 1 ||
      (length(args) == 1 && class(args[[1]]$expr) == "name" &&
         as.character(args[[1]]$expr) == "")) {
    return(x)
  }

  ## Special case: single numeric argument
  if (length(args) == 1 && class(args[[1]]$expr) == "numeric") {
    res <- simple_vs_index(x, args[[1]]$expr)
    return (add_vses_graph_ref(res, get_vs_graph(x)))
  }

  ## Special case: single symbol argument, no such attribute
  if (length(args) == 1 && class(args[[1]]$expr) == "name") {
    graph <- get_vs_graph(x)
    if (! (as.character(args[[1]]$expr) %in% vertex_attr_names(graph))) {
      res <- simple_vs_index(x, lazy_eval(args[[1]]))
      return (add_vses_graph_ref(res, graph))
    }
  }

  .nei <- function(v, mode=c("all", "in", "out", "total")) {
    ## TRUE iff the vertex is a neighbor (any type)
    ## of at least one vertex in v
    mode <- igraph.match.arg(mode)
    mode <- switch(mode, "out"=1, "in"=2, "all"=3, "total"=3)

    if (is.logical(v)) {
      v <- which(v)
    }
    on.exit(.Call(C_R_igraph_finalizer) )
    tmp <- .Call(C_R_igraph_vs_nei, graph, x, as.igraph.vs(graph, v)-1,
                 as.numeric(mode))
    tmp[as.numeric(x)]
  }
  nei <- function(...) { .nei(...) }
  .innei <- function(v, mode=c("in", "all", "out", "total")) {
    .nei(v, mode = mode[1])
  }
  innei <- function(...) { .innei(...) }
  .outnei <- function(v, mode=c("out", "all", "in", "total")) {
    .nei(v, mode = mode[1])
  }
  outnei <- function(...) { .outnei(...) }
  .inc <- function(e) {
    ## TRUE iff the vertex (in the vs) is incident
    ## to at least one edge in e
    if (is.logical(e)) {
      e <- which(e)
    }
    on.exit(.Call(C_R_igraph_finalizer) )
    tmp <- .Call(C_R_igraph_vs_adj, graph, x, as.igraph.es(graph, e)-1,
                 as.numeric(3))
    tmp[as.numeric(x)]
  }
  inc <- function(...) { .inc(...) }
  adj <- function(...) { .inc(...) }
  .from <- function(e) {
    ## TRUE iff the vertex is the source of at least one edge in e
    if (is.logical(e)) {
      e <- which(e)
    }
    on.exit(.Call(C_R_igraph_finalizer) )
    tmp <- .Call(C_R_igraph_vs_adj, graph, x, as.igraph.es(graph, e)-1,
                 as.numeric(1))
    tmp[as.numeric(x)]
  }
  from <- function(...) { .from(...) }
  .to <- function(e) {
    ## TRUE iff the vertex is the target of at least one edge in e
    if (is.logical(e)) {
      e <- which(e)
    }
    on.exit(.Call(C_R_igraph_finalizer) )
    tmp <- .Call(C_R_igraph_vs_adj, graph, x, as.igraph.es(graph, e)-1,
                 as.numeric(2))
    tmp[as.numeric(x)]
  }
  to <- function(...) { .to(...) }

  graph <- get_vs_graph(x)

  if (is.null(graph)) {
    res <- lapply(lazy_eval(args), simple_vs_index, x = x, na_ok = na_ok)

  } else {

    attrs <- vertex_attr(graph)
    xvec <- as.vector(x)
    for (i in seq_along(attrs)) attrs[[i]] <- attrs[[i]][xvec]

    res <- lazy_eval(
      args,
      data =  c(attrs, .nei = .nei, nei = nei, .innei = .innei,
        innei = innei, .outnei = .outnei,  outnei = outnei, adj = adj,
        .inc = .inc, inc = inc, .from = .from, from = from, .to = .to,
        to = to)
    )
    res <- lapply(res, function(ii) {
      if (is.null(ii)) return(NULL)
      ii <- simple_vs_index(x, ii, na_ok)
      attr(ii, "env") <- attr(x, "env")
      attr(ii, "graph") <- attr(x, "graph")
      class(ii) <- class(x)
      ii
    })
  }

  res <- drop_null(res)
  if (length(res)) {
    do_call(c, res)
  } else {
    x[FALSE]
  }
}

#' Select vertices and show their metadata
#'
#' The double bracket operator can be used on vertex sequences, to print
#' the meta-data (vertex attributes) of the vertices in the sequence.
#'
#' @details
#' Technically, when used with vertex sequences, the double bracket
#' operator does exactly the same as the single bracket operator,
#' but the resulting vertex sequence is printed differently: all
#' attributes of the vertices in the sequence are printed as well.
#'
#' See \code{\link{[.igraph.vs}} for more about indexing vertex sequences.
#' 
#' @param x A vertex sequence.
#' @param ... Additional arguments, passed to \code{[}.
#' @return The double bracket operator returns another vertex sequence,
#'   with meta-data (attribute) printing turned on. See details below.
#' 
#' @method [[ igraph.vs
#' @name igraph-vs-indexing2
#' @family vertex and edge sequences
#' @family vertex and edge sequence operations
#' @export
#' @examples
#' g <- make_ring(10) %>%
#'   set_vertex_attr("color", value = "red") %>%
#'   set_vertex_attr("name", value = LETTERS[1:10])
#' V(g)
#' V(g)[[]]
#' V(g)[1:5]
#' V(g)[[1:5]]

`[[.igraph.vs` <- function(x, ...) {
  res <- x[...]
  attr(res, "single") <- TRUE
  res
}

#' Select edges and show their metadata
#'
#' The double bracket operator can be used on edge sequences, to print
#' the meta-data (edge attributes) of the edges in the sequence.
#'
#' @details
#' Technically, when used with edge sequences, the double bracket
#' operator does exactly the same as the single bracket operator,
#' but the resulting edge sequence is printed differently: all
#' attributes of the edges in the sequence are printed as well.
#'
#' See \code{\link{[.igraph.es}} for more about indexing edge sequences.
#' 
#' @param x An edge sequence.
#' @param ... Additional arguments, passed to \code{[}.
#' @return Another edge sequence, with metadata printing turned on.
#' See details below.
#'
#' @method [[ igraph.es
#' @name igraph-es-indexing2
#' @family vertex and edge sequences
#' @family vertex and edge sequence operations
#' @export
#' @examples
#' g <- make_(ring(10),
#'   with_vertex_(name = LETTERS[1:10]),
#'   with_edge_(weight = 1:10, color = "green"))
#' E(g)
#' E(g)[[]]
#' E(g)[[.inc('A')]]

`[[.igraph.es` <- function(x, ...) {
  res <- x[...]
  attr(res, "single") <- TRUE
  res
}

simple_es_index <- function(x, i) {
  if (!is.null(attr(x, "vnames"))) {
    wh1 <- structure(seq_along(x), names = names(x))[i]
    wh2 <- structure(seq_along(x), names = attr(x, "vnames"))[i]
    wh <- ifelse(is.na(wh1), wh2, wh1)
    res <- unclass(x)[wh]
    names(res) <- names(x)[wh]
    attr(res, "vnames") <- attr(x, "vnames")[wh]
  } else {
    res <- unclass(x)[i]
  }
  if (any(is.na(res))) stop('Unknown edge selected')

  attr(res, "env") <- attr(x, "env")
  attr(res, "graph") <- attr(x, "graph")
  class(res) <- "igraph.es"
  res
}

#' Indexing edge sequences
#'
#' Edge sequences can be indexed very much like a plain numeric R vector,
#' with some extras.
#'
#' @section Multiple indices:
#' When using multiple indices within the bracket, all of them
#' are evaluated independently, and then the results are concatenated
#' using the \code{c()} function. E.g. \code{E(g)[1, 2, .inc(1)]}
#' is equivalent to \code{c(E(g)[1], E(g)[2], E(g)[.inc(1)])}.
#'
#' @section Index types:
#' Edge sequences can be indexed with positive numeric vectors,
#' negative numeric vectors, logical vectors, character vectors:
#' \itemize{
#'   \item When indexed with positive numeric vectors, the edges at the
#'     given positions in the sequence are selected. This is the same as
#'     indexing a regular R atomic vector with positive numeric vectors.
#'   \item When indexed with negative numeric vectors, the edges at the
#'     given positions in the sequence are omitted. Again, this is the same
#'     as indexing a regular R atomic vector.
#'   \item When indexed with a logical vector, the lengths of the edge
#'     sequence and the index must match, and the edges for which the
#'     index is \code{TRUE} are selected.
#'   \item Named graphs can be indexed with character vectors,
#'     to select edges with the given names. Note that a graph may
#'     have edge names and vertex names, and both can be used to select
#'     edges. Edge names are simply used as names of the numeric
#'     edge id vector. Vertex names effectively only work in graphs without
#'     multiple edges, and must be separated with a \code{|} bar character
#'     to select an edges that incident to the two given vertices. See
#'     examples below.
#' }
#'
#' @section Edge attributes:
#' When indexing edge sequences, edge attributes can be referred
#' to simply by using their names. E.g. if a graph has a \code{weight} edge
#' attribute, then \code{E(G)[weight > 1]} selects all edges with a larger
#' than one weight. See more examples below.
#'
#' @section Special functions:
#' There are some special igraph functions that can be used
#' only in expressions indexing edge sequences: \describe{
#'   \item{\code{.inc}}{takes a vertex sequence, and selects
#'     all edges that have at least one incident vertex in the vertex
#'     sequence.}
#'   \item{\code{.from}}{similar to \code{.inc()}, but only
#'     the tails of the edges are considered.}
#'   \item{\code{.to}}{is similar to \code{.inc()}, but only
#'     the heads of the edges are considered.}
#'   \item{\code{\%--\%}}{a special operator that can be
#'     used to select all edges between two sets of vertices. It ignores
#'     the edge directions in directed graphs.}
#'   \item{\code{\%->\%}}{similar to \code{\%--\%},
#'     but edges \emph{from} the left hand side argument, pointing
#'     \emph{to} the right hand side argument, are selected, in directed
#'     graphs.}
#'   \item{\code{\%<-\%}}{similar to \code{\%--\%},
#'     but edges \emph{to} the left hand side argument, pointing
#'     \emph{from} the right hand side argument, are selected, in directed
#'     graphs.}
#' }
#' Note that multiple special functions can be used together, or with
#' regular indices, and then their results are concatenated. See more
#' examples below.
#'
#' @aliases %--% %<-% %->%
#' @param x An edge sequence
#' @param ... Indices, see details below.
#' @return Another edge sequence, referring to the same graph.
#' 
#' @method [ igraph.es
#' @name igraph-es-indexing
#'
#' @export
#' @family vertex and edge sequences
#' @family vertex and edge sequence operations
#' @examples
#' # special operators for indexing based on graph structure
#' g <- sample_pa(100, power = 0.3)
#' E(g) [ 1:3 %--% 2:6 ]
#' E(g) [ 1:5 %->% 1:6 ]
#' E(g) [ 1:3 %<-% 2:6 ]
#'
#' # the edges along the diameter
#' g <- sample_pa(100, directed = FALSE)
#' d <- get_diameter(g)
#' E(g, path = d)
#'
#' # select edges based on attributes
#' g <- sample_gnp(20, 3/20) %>%
#'   set_edge_attr("weight", value = rnorm(gsize(.)))
#' E(g)[[ weight < 0 ]]

`[.igraph.es` <- function(x, ...) {

  args <- lazy_dots(..., .follow_symbols = TRUE)

  ## If indexing has no argument at all, then we still get one,
  ## but it is "empty", a name that is ""

  if (length(args) < 1 ||
      (length(args) == 1 && class(args[[1]]$expr) == "name" &&
         as.character(args[[1]]$expr) == "")) {
    return(x)
  }

  .inc <- function(v) {
    ## TRUE iff the edge is incident to at least one vertex in v
    on.exit(.Call(C_R_igraph_finalizer) )
    tmp <- .Call(C_R_igraph_es_adj, graph, x, as.igraph.vs(graph, v)-1,
                 as.numeric(3))
    tmp[ as.numeric(x) ]
  }
  adj <- function(...) { .inc(...) }
  inc <- function(...) { .inc(...) }
  .from <- function(v) {
    ## TRUE iff the edge originates from at least one vertex in v
    on.exit(.Call(C_R_igraph_finalizer) )
    tmp <- .Call(C_R_igraph_es_adj, graph, x, as.igraph.vs(graph, v)-1,
                 as.numeric(1))
    tmp[ as.numeric(x) ]
  }
  from <- function(...) { .from(...) }
  .to <- function(v) {
    ## TRUE iff the edge points to at least one vertex in v
    on.exit(.Call(C_R_igraph_finalizer) )
    tmp <- .Call(C_R_igraph_es_adj, graph, x, as.igraph.vs(graph, v)-1,
                 as.numeric(2))
    tmp[ as.numeric(x) ]
  }
  to <- function(...) { .to(...) }

  graph <- get_es_graph(x)

  if (is.null(graph)) {
    res <- lapply(lazy_eval(args), simple_es_index, x = x)

  } else {

    attrs <- edge_attr(graph)
    xvec <- as.vector(x)
    for (i in seq_along(attrs)) attrs[[i]] <- attrs[[i]][xvec]

    res <- lazy_eval(
        args,
      data = c(attrs, .inc = .inc, inc = inc, adj = adj, .from = .from,
        from = from, .to = .to, to = to,
        .igraph.from = list(.Call(C_R_igraph_mybracket,
          graph, 3L)[ as.numeric(x) ]),
        .igraph.to = list(.Call(C_R_igraph_mybracket,
          graph, 4L)[as.numeric(x)]),
        .igraph.graph = list(graph),
        `%--%`=`%--%`, `%->%`=`%->%`, `%<-%`=`%<-%`)
    )
    res <- lapply(res, function(ii) {
      if (is.null(ii)) return(NULL)
      ii <- simple_es_index(x, ii)
      attr(ii, "env") <- attr(x, "env")
      attr(ii, "graph") <- attr(x, "graph")
      class(ii) <- class(x)
      ii
    })
  }

  res <- drop_null(res)
  if (length(res) == 1) {
    res[[1]]
  } else if (length(res)) {
    do_call(c, res)
  } else {
    x[FALSE]
  }
} 

#' @export

`%--%` <- function(f, t) {
  from <- get(".igraph.from", parent.frame())
  to <- get(".igraph.to", parent.frame())
  graph <- get(".igraph.graph", parent.frame())
  f <- as.igraph.vs(graph, f)-1
  t <- as.igraph.vs(graph, t)-1
  (from %in% f & to %in% t) | (to %in% f & from %in% t)
}

#' @export

`%->%` <- function(f, t) {
  from <- get(".igraph.from", parent.frame())
  to <- get(".igraph.to", parent.frame())
  graph <- get(".igraph.graph", parent.frame())
  f <- as.igraph.vs(graph, f)-1
  t <- as.igraph.vs(graph, t)-1
  if (is_directed(graph)) {
    from %in% f & to %in% t
  } else {
    (from %in% f & to %in% t) | (to %in% f & from %in% t)
  }
}

#' @export

`%<-%` <- function(t, value) {
  from <- get(".igraph.from", parent.frame())
  to <- get(".igraph.to", parent.frame())
  graph <- get(".igraph.graph", parent.frame())
  value <- as.igraph.vs(graph, value)-1
  t <- as.igraph.vs(graph, t)-1
  if (is_directed(graph)) {
    from %in% value & to %in% t
  } else {
    (from %in% value & to %in% t) | (to %in% value & from %in% t)
  }
}

#' @param i Index.
#' @method [[<- igraph.vs
#' @name igraph-vs-attributes
#' @export

`[[<-.igraph.vs` <- function(x, i, value) {
  if (! "name"  %in% names(attributes(value)) ||
      ! "value" %in% names(attributes(value))) {
    stop("invalid indexing")
  }
  if (is.null(get_vs_graph(x))) stop("Graph is unknown")
  value
}

#' @method [<- igraph.vs
#' @name igraph-vs-attributes
#' @export

`[<-.igraph.vs` <-  `[[<-.igraph.vs`

#' @param i Index.
#' @method [[<- igraph.es
#' @name igraph-es-attributes
#' @export

`[[<-.igraph.es` <- function(x, i, value) {
  if (! "name"  %in% names(attributes(value)) ||
      ! "value" %in% names(attributes(value))) {
    stop("invalid indexing")
  }
  if (is.null(get_es_graph(x))) stop("Graph is unknown")
  value
}  

#' @method [<- igraph.es
#' @name igraph-es-attributes
#' @export

`[<-.igraph.es` <-  `[[<-.igraph.es`

#' Query or set attributes of the vertices in a vertex sequence
#'
#' The \code{$} operator is a syntactic sugar to query and set the
#' attributes of the vertices in a vertex sequence.
#'
#' @details
#' The query form of \code{$} is a shortcut for
#' \code{\link{vertex_attr}}, e.g. \code{V(g)[idx]$attr} is equivalent
#' to \code{vertex_attr(g, attr, V(g)[idx])}.
#'
#' The assignment form of \code{$} is a shortcut for
#' \code{\link{set_vertex_attr}}, e.g. \code{V(g)[idx]$attr <- value} is
#' equivalent to \code{g <- set_vertex_attr(g, attr, V(g)[idx], value)}.
#' 
#' @param x A vertex sequence. For \code{V<-} it is a graph.
#' @param name Name of the vertex attribute to query or set.
#' @return A vector or list, containing the values of
#'   attribute \code{name} for the vertices in the vertex sequence.
#'   For numeric, character or logical attributes, it is a vector of the
#'   appropriate type, otherwise it is a list.
#' 
#' @method $ igraph.vs
#' @name igraph-vs-attributes
#'
#' @export
#' @family vertex and edge sequences
#' @family graph attributes
#' @examples
#' g <- make_(ring(10),
#'   with_vertex_(
#'     name = LETTERS[1:10],
#'     color = sample(1:2, 10, replace=TRUE)
#'   )
#' )
#' V(g)$name
#' V(g)$color
#' V(g)$frame.color <- V(g)$color
#'
#' # color vertices of the largest component
#' largest_comp <- function(graph) {
#'   cl <- components(graph)
#'   V(graph)[which.max(cl$csize) == cl$membership]
#' }
#' g <- sample_(gnp(100, 2/100),
#'   with_vertex_(size = 3, label = ""),
#'   with_graph_(layout = layout_with_fr)
#' )
#' giant_v <- largest_comp(g)
#' V(g)$color <- "blue"
#' V(g)[giant_v]$color <- "orange"
#' plot(g)

`$.igraph.vs` <- function(x, name) {
  graph <- get_vs_graph(x)
  if (is.null(graph)) stop("Graph is unknown")
  res <- vertex_attr(graph, name, x)
  if ("single" %in% names(attributes(x)) && attr(x, "single")) {
    res[[1]]
  } else {
    res
  }
}

#' Query or set attributes of the edges in an edge sequence
#'
#' The \code{$} operator is a syntactic sugar to query and set
#' edge attributes, for edges in an edge sequence.
#'
#' @details
#' The query form of \code{$} is a shortcut for \code{\link{edge_attr}},
#' e.g. \code{E(g)[idx]$attr} is equivalent to \code{edge_attr(g, attr,
#' E(g)[idx])}.
#'
#' The assignment form of \code{$} is a shortcut for
#' \code{\link{set_edge_attr}}, e.g. \code{E(g)[idx]$attr <- value} is
#' equivalent to \code{g <- set_edge_attr(g, attr, E(g)[idx], value)}.
#'
#' @param x An edge sequence. For \code{E<-} it is a graph.
#' @param name Name of the edge attribute to query or set.
#' @return A vector or list, containing the values of the attribute
#'   \code{name} for the edges in the sequence. For numeric, character or
#'   logical attributes, it is a vector of the appropriate type, otherwise
#'   it is a list. 
#' 
#' @method $ igraph.es
#' @name igraph-es-attributes
#'
#' @export
#' @family vertex and edge sequences
#' @examples
#' # color edges of the largest component
#' largest_comp <- function(graph) {
#'   cl <- components(graph)
#'   V(graph)[which.max(cl$csize) == cl$membership]
#' }
#' g <- sample_(gnp(100, 1/100),
#'   with_vertex_(size = 3, label = ""),
#'   with_graph_(layout = layout_with_fr)
#' )
#' giant_v <- largest_comp(g)
#' E(g)$color <- "orange"
#' E(g)[giant_v %--% giant_v]$color <- "blue"
#' plot(g)

`$.igraph.es` <- function(x, name) {
  graph <- get_es_graph(x)
  if (is.null(graph)) stop("Graph is unknown")
  res <- edge_attr(graph, name, x)
  if ("single" %in% names(attributes(x)) && attr(x, "single")) {
    res[[1]]
  } else {
    res
  }
}

#' @param value New value of the attribute, for the vertices in the
#'   vertex sequence.
#'
#' @method $<- igraph.vs
#' @name igraph-vs-attributes
#' @export

`$<-.igraph.vs` <- function(x, name, value) {
  if (is.null(get_vs_graph(x))) stop("Graph is unknown")
  attr(x, "name") <- name
  attr(x, "value") <- value
  x
}

#' @param value New value of the attribute, for the edges in the edge
#'   sequence.
#' @method $<- igraph.es
#' @name igraph-es-attributes
#' @export
#' @family vertex and edge sequences

`$<-.igraph.es` <- function(x, name, value) {
  if (is.null(get_es_graph(x))) stop("Graph is unknown")
  attr(x, "name") <- name
  attr(x, "value") <- value
  x
}

#' @name igraph-vs-attributes
#' @export

`V<-` <- function(x, value) {
  if (!is_igraph(x)) {
    stop("Not a graph object")
  }
  if (! "name"  %in% names(attributes(value)) ||
      ! "value" %in% names(attributes(value))) {
    stop("invalid indexing")
  }
  i_set_vertex_attr(x, attr(value, "name"), index=value,
                    value=attr(value, "value"), check = FALSE)
}

#' @param path Select edges along a path, given by a vertex sequence See
#'   \code{\link{E}}.
#' @param P Select edges via pairs of vertices. See \code{\link{E}}.
#' @param directed Whether to use edge directions for the \code{path} or
#'   \code{P} arguments.
#' @name igraph-es-attributes
#' @export

`E<-` <- function(x, path=NULL, P=NULL, directed=NULL, value) {
  if (!is_igraph(x)) {
    stop("Not a graph object")
  }
  if (! "name"  %in% names(attributes(value)) ||
      ! "value" %in% names(attributes(value))) {
    stop("invalid indexing")
  }
  i_set_edge_attr(x, attr(value, "name"), index=value,
                  value=attr(value, "value"), check = FALSE)
}

#' Show a vertex sequence on the screen
#'
#' For long vertex sequences, the printing is truncated to fit to the 
#' screen. Use \code{print} explicitly and the \code{full} argument to
#' see the full sequence.
#'
#' Vertex sequence created with the double bracket operator are
#' printed differently, together with all attributes of the vertices
#' in the sequence, as a table.
#' 
#' @param x A vertex sequence.
#' @param full Whether to show the full sequence, or truncate the output
#'   to the screen size.
#' @param ... These arguments are currently ignored.
#' @return The vertex sequence, invisibly.
#' 
#' @method print igraph.vs
#' @export
#' @family vertex and edge sequences
#' @examples
#' # Unnamed graphs
#' g <- make_ring(10)
#' V(g)
#'
#' # Named graphs
#' g2 <- make_ring(10) %>%
#'   set_vertex_attr("name", value = LETTERS[1:10])
#' V(g2)
#'
#' # All vertices in the sequence
#' g3 <- make_ring(1000)
#' V(g3)
#' print(V(g3), full = TRUE)
#'
#' # Metadata
#' g4 <- make_ring(10) %>%
#'   set_vertex_attr("name", value = LETTERS[1:10]) %>%
#'   set_vertex_attr("color", value = "red")
#' V(g4)[[]]
#' V(g4)[[2:5, 7:8]]

print.igraph.vs <- function(x, full = igraph_opt("print.full"), ...) {

  graph <- get_vs_graph(x)
  len <- length(x)
  id <- graph_id(x)

  title <- "+ " %+% chr(len) %+% "/" %+%
    (if (is.null(graph)) "?" else chr(vcount(graph))) %+%
    (if (len == 1) " vertex" else " vertices") %+%
    (if (!is.null(names(x))) ", named" else "") %+%
    (if (!is.na(id)) paste(", from", substr(id, 1, 7)) else "") %+%
    (if (is.null(graph)) " (deleted)" else "") %+%
    ":\n"
  cat(title)

  if (!is.null(attr(x, "single")) && attr(x, "single") &&
      !is.null(graph) && length(vertex_attr_names(graph) > 0)) {
    ## Double bracket
    va <- vertex_attr(graph)
    if (all(sapply(va, is.atomic))) {
      print(as.data.frame(va, stringsAsFactors =
                            FALSE)[as.vector(x),, drop = FALSE])
    } else {
      print(lapply(va, "[", as.vector(x)))
    }

  } else {
    ## Single bracket

    x2 <- if (!is.null(names(x))) names(x) else as.vector(x)
    if (length(x2)) {
      if (is.logical(full) && full) {
        print(x2, quote = FALSE)
      }  else {
        head_print(x2, omitted_footer = "+ ... omitted several vertices\n",
                   quote = FALSE, max_lines = igraph_opt("auto.print.lines"))
      }
    }
  }

  invisible(x)
}

#' Print an edge sequence to the screen
#'
#' For long edge sequences, the printing is truncated to fit to the
#' screen. Use \code{print} explicitly and the code{full} argument to
#' see the full sequence.
#'
#' Edge sequences created with the double bracket operator are printed
#' differently, together with all attributes of the edges in the sequence,
#' as a table.
#' 
#' @param x An edge sequence.
#' @param full Whether to show the full sequence, or truncate the output
#'   to the screen size.
#' @param ... Currently ignored.
#' @return The edge sequence, invisibly.
#' 
#' @method print igraph.es
#' @export
#' @family vertex and edge sequences
#' @examples
#' # Unnamed graphs
#' g <- make_ring(10)
#' E(g)
#'
#' # Named graphs
#' g2 <- make_ring(10) %>%
#'   set_vertex_attr("name", value = LETTERS[1:10])
#' E(g2)
#'
#' # All edges in a long sequence
#' g3 <- make_ring(200)
#' E(g3)
#' E(g3) %>% print(full = TRUE)
#'
#' # Metadata
#' g4 <- make_ring(10) %>%
#'   set_vertex_attr("name", value = LETTERS[1:10]) %>%
#'   set_edge_attr("weight", value = 1:10) %>%
#'   set_edge_attr("color", value = "green")
#' E(g4)
#' E(g4)[[]]
#' E(g4)[[1:5]]

print.igraph.es <- function(x, full = igraph_opt("print.full"), ...) {
  graph <- get_es_graph(x)
  ml <- if (identical(full, TRUE)) NULL else igraph_opt("auto.print.lines")
  .print.edges.compressed(x = graph, edges = x, max.lines = ml, names = TRUE,
                          num = TRUE)
  invisible(x)
}

# these are internal

as.igraph.vs <- function(graph, v, na.ok=FALSE) {
  if (inherits(v, "igraph.vs") && !is.null(graph) &&
      !warn_version(graph)) {
    if (get_graph_id(graph) != get_vs_graph_id(v)) {
      stop("Cannot use a vertex sequence from another graph.")
    }
  }
  if (is.character(v) && "name" %in% vertex_attr_names(graph)) {
    v <- as.numeric(match(v, V(graph)$name))
    if (!na.ok && any(is.na(v))) {
      stop("Invalid vertex names")
    }
    v
  } else {
    if (is.logical(v)) {
      res <- as.vector(V(graph))[v]
    } else if (is.numeric(v) && any(v<0)){
      res <- as.vector(V(graph))[v]
    } else {
      res <- as.numeric(v)
    }
    if (!na.ok && any(is.na(res))) {
      stop("Invalid vertex name(s)")
    }
    res
  }
}

as.igraph.es <- function(graph, e) {
  if (inherits(e, "igraph.es") && !is.null(graph)
      && !warn_version(graph)) {
    if (get_graph_id(graph) != get_es_graph_id(e)) {
      stop("Cannot use an edge sequence from another graph.")
    }
  }
  if (is.character(e)) {
    Pairs <- grep("|", e, fixed=TRUE)
    Names <- if (length(Pairs)==0) seq_along(e) else -Pairs
    res <- numeric(length(e))

    ## Based on vertex ids/names
    if (length(Pairs)!=0) {
      vv <- strsplit(e[Pairs], "|", fixed=TRUE)
      vl <- sapply(vv, length)
      if (any(vl != 2)) {
        stop("Invalid edge name: ", e[Pairs][vl!=2][1])
      }
      vp <- unlist(vv)
      if (! "name" %in% vertex_attr_names(graph)) {
        vp <- as.numeric(vp)
      }
      res[Pairs] <- get.edge.ids(graph, vp)
    }

    ## Based on edge ids/names
    if (length(Names) != 0) {
      if ("name" %in% edge_attr_names(graph)) {
        res[Names] <- as.numeric(match(e[Names], E(graph)$name))
      } else {
        res[Names] <- as.numeric(e[Names])
      }
    }
    
  } else {
    res <- as.numeric(e)
  }
  if (any(is.na(res))) {
    stop("Invalid edge names")
  }
  res
}


is_igraph_vs <- function(x) {
  inherits(x, "igraph.vs")
}


is_igraph_es <- function(x) {
  inherits(x, "igraph.es")
}


parse_op_args <- function(..., what, is_fun, as_fun, check_graph = TRUE) {

  args <- list(...)

  if (any(! sapply(args, is_fun))) stop("Not ", what, " sequence")

  ## get the ids of all graphs
  graph_id <- sapply(args, get_vs_graph_id) %>%
    unique()

  if (length(graph_id) != 1) {
    warning("Combining vertex/edge sequences from different graphs.\n",
            "This will not work in future igraph versions")
  }

  graphs <- args %>%
    lapply(get_vs_graph) %>%
    drop_null()

  addresses <- graphs %>%
    sapply(function(x) x %&&% address(x)) %>%
    unique()

  if (check_graph && length(addresses) >= 2) {
    warning("Combining vertex/edge sequences from different graphs.\n",
            "This will not work in future igraph versions")
  }

  graph <- if (length(graphs)) graphs[[1]] else NULL

  args <- lapply(args, unclass)

  list(graph = graph, args = args, id = graph_id)
}


parse_vs_op_args <- function(...) {
  parse_op_args(..., what = "a vertex", is_fun = is_igraph_vs,
                as_fun = as.igraph.vs)
}


parse_es_op_args <- function(...) {
  parse_op_args(..., what = "an edge", is_fun = is_igraph_es,
                as_fun = as.igraph.es)
}


create_op_result <- function(parsed, result, class, args) {
  result <- add_vses_graph_ref(result, parsed$graph)
  class(result) <- class
  ## c() drops names for zero length vectors. Why???
  if (! length(result) &&
      any(sapply(args, function(x) !is.null(names(x))))) {
    names(result) <- character()
  }
  result
}


#' Remove duplicate vertices from a vertex sequence
#' 
#' @param x A vertex sequence.
#' @param incomparables a vector of values that cannot be compared.
#'   Passed to base function \code{duplicated}. See details there.
#' @param ... Passed to base function \code{duplicated()}.
#' @return A vertex sequence with the duplicate vertices removed.
#' 
#' @method unique igraph.vs
#' @family vertex and edge sequence operations
#' @export
#' @examples
#' g <- make_(ring(10), with_vertex_(name = LETTERS[1:10]))
#' V(g)[1, 1:5, 1:10, 5:10]
#' V(g)[1, 1:5, 1:10, 5:10] %>% unique()

unique.igraph.vs <- function(x, incomparables = FALSE, ...) {
  x[!duplicated(x, incomparables = incomparables, ...)]
}


#' Remove duplicate edges from an edge sequence
#' 
#' @param x An edge sequence.
#' @param incomparables a vector of values that cannot be compared.
#'   Passed to base function \code{duplicated}. See details there.
#' @param ... Passed to base function \code{duplicated()}.
#' @return An edge sequence with the duplicate vertices removed.
#' 
#' @method unique igraph.es
#' @family vertex and edge sequence operations
#' @export
#' @examples
#' g <- make_(ring(10), with_vertex_(name = LETTERS[1:10]))
#' E(g)[1, 1:5, 1:10, 5:10]
#' E(g)[1, 1:5, 1:10, 5:10] %>% unique()

unique.igraph.es <- function(x, incomparables = FALSE, ...) {
  x[!duplicated(x, incomparables = incomparables, ...)]
}


#' Concatenate vertex sequences
#'
#' @param ... The vertex sequences to concatenate. They must
#'   refer to the same graph.
#' @param recursive Ignored, included for S3 compatibility with
#'   the base \code{c} function.
#' @return A vertex sequence, the input sequences concatenated.
#'
#' @method c igraph.vs
#' @family vertex and edge sequence operations
#' @export
#' @examples
#' g <- make_(ring(10), with_vertex_(name = LETTERS[1:10]))
#' c(V(g)[1], V(g)['A'], V(g)[1:4])

c.igraph.vs <- function(..., recursive = FALSE) {
  parsed <- parse_vs_op_args(...)
  res <- do_call(c, .args = parsed$args)
  create_op_result(parsed, res, "igraph.vs", list(...))
}


#' Concatenate edge sequences
#'
#' @param ... The edge sequences to concatenate. They must
#'   all refer to the same graph.
#' @param recursive Ignored, included for S3 compatibility with the
#'   base \code{c} function.
#' @return An edge sequence, the input sequences concatenated.
#' 
#' @method c igraph.es
#' @family vertex and edge sequence operations
#' @export
#' @examples
#' g <- make_(ring(10), with_vertex_(name = LETTERS[1:10]))
#' c(E(g)[1], E(g)['A|B'], E(g)[1:4])

c.igraph.es <- function(..., recursive = FALSE) {
  parsed <- parse_es_op_args(...)
  res <- do_call(c, .args = parsed$args)
  res <- create_op_result(parsed, res, "igraph.es", list(...))
  attr(res, "vnames") <- do_call(c, .args = lapply(list(...), attr, "vnames"))
  res
}


#' Union of vertex sequences
#'
#' @details
#' They must belong to the same graph. Note that this function has
#' \sQuote{set} semantics and the multiplicity of vertices is lost in the
#' result. (This is to match the behavior of the based \code{unique}
#' function.)
#'
#' @param ... The vertex sequences to take the union of.
#' @return A vertex sequence that contains all vertices in the given
#' sequences, exactly once.
#'
#' @method union igraph.vs
#' @family vertex and edge sequence operations
#' @export
#' @examples
#' g <- make_(ring(10), with_vertex_(name = LETTERS[1:10]))
#' union(V(g)[1:6], V(g)[5:10])

union.igraph.vs <- function(...) {
  unique(c(...))
}


#' Union of edge sequences
#'
#' @details
#' They must belong to the same graph. Note that this function has
#' \sQuote{set} semantics and the multiplicity of edges is lost in the
#' result. (This is to match the behavior of the based \code{unique}
#' function.)
#'
#' @param ... The edge sequences to take the union of.
#' @return An edge sequence that contains all edges in the given
#' sequences, exactly once.
#'
#' @method union igraph.es
#' @family vertex and edge sequence operations
#' @export
#' @examples
#' g <- make_(ring(10), with_vertex_(name = LETTERS[1:10]))
#' union(E(g)[1:6], E(g)[5:9], E(g)['A|J'])

union.igraph.es <- union.igraph.vs


#' Intersection of vertex sequences
#'
#' @details
#' They must belong to the same graph. Note that this function has
#' \sQuote{set} semantics and the multiplicity of vertices is lost in the
#' result.
#'
#' @param ... The vertex sequences to take the intersection of.
#' @return A vertex sequence that contains vertices that appear in all
#' given sequences, each vertex exactly once.
#'
#' @method intersection igraph.vs
#' @family vertex and edge sequence operations
#' @export
#' @examples
#' g <- make_(ring(10), with_vertex_(name = LETTERS[1:10]))
#' intersection(E(g)[1:6], E(g)[5:9])

intersection.igraph.vs <- function(...) {
  ifun <- function(x, y) {
    unique(y[match(as.vector(x), y, 0L)])
  }
  Reduce(ifun, list(...))
}


#' Intersection of edge sequences
#'
#' @details
#' They must belong to the same graph. Note that this function has
#' \sQuote{set} semantics and the multiplicity of edges is lost in the
#' result.
#'
#' @param ... The edge sequences to take the intersection of.
#' @return An edge sequence that contains edges that appear in all
#' given sequences, each edge exactly once.
#'
#' @method intersection igraph.es
#' @family vertex and edge sequence operations
#' @export
#' @examples
#' g <- make_(ring(10), with_vertex_(name = LETTERS[1:10]))
#' intersection(E(g)[1:6], E(g)[5:9])

intersection.igraph.es <- intersection.igraph.vs


#' Difference of vertex sequences
#'
#' @details
#' They must belong to the same graph. Note that this function has
#' \sQuote{set} semantics and the multiplicity of vertices is lost in the
#' result.
#'
#' @param big The \sQuote{big} vertex sequence.
#' @param small The \sQuote{small} vertex sequence.
#' @param ... Ignored, included for S3 signature compatibility.
#' @return A vertex sequence that contains only vertices that are part of
#' \code{big}, but not part of \code{small}.
#'
#' @method difference igraph.vs
#' @family vertex and edge sequence operations
#' @export
#' @examples
#' g <- make_(ring(10), with_vertex_(name = LETTERS[1:10]))
#' difference(V(g), V(g)[6:10])

difference.igraph.vs <- function(big, small, ...) {
  if (!length(big)) {
    big
  } else {
    big[ match(big, small, 0L) == 0L ]
  }
}


#' Difference of edge sequences
#'
#' @details
#' They must belong to the same graph. Note that this function has
#' \sQuote{set} semantics and the multiplicity of edges is lost in the
#' result.
#'
#' @param big The \sQuote{big} edge sequence.
#' @param small The \sQuote{small} edge sequence.
#' @param ... Ignored, included for S3 signature compatibility.
#' @return An edge sequence that contains only edges that are part of
#' \code{big}, but not part of \code{small}.
#'
#' @method difference igraph.es
#' @family vertex and edge sequence operations
#' @export
#' @examples
#' g <- make_(ring(10), with_vertex_(name = LETTERS[1:10]))
#' difference(V(g), V(g)[6:10])

difference.igraph.es <- difference.igraph.vs


#' Reverse the order in a vertex sequence
#'
#' @param x The vertex sequence to reverse.
#' @return The reversed vertex sequence.
#' 
#' @method rev igraph.vs
#' @family vertex and edge sequence operations
#' @export
#' @examples
#' g <- make_(ring(10), with_vertex_(name = LETTERS[1:10]))
#' V(g) %>% rev()

rev.igraph.vs <- function(x) {
  x[rev(seq_along(x))]
}


#' Reverse the order in an edge sequence
#'
#' @param x The edge sequence to reverse.
#' @return The reversed edge sequence.
#' 
#' @method rev igraph.es
#' @family vertex and edge sequence operations
#' @export
#' @examples
#' g <- make_(ring(10), with_vertex_(name = LETTERS[1:10]))
#' E(g)
#' E(g) %>% rev()

rev.igraph.es <- rev.igraph.vs

#' Convert a vertex or edge sequence to an ordinary vector
#'
#' @details
#' For graphs without names, a numeric vector is returned, containing the
#' internal numeric vertex or edge ids.
#'
#' For graphs with names, and vertex sequences, the vertex names are
#' returned in a character vector.
#'
#' For graphs with names and edge sequences, a character vector is
#' returned, with the \sQuote{bar} notation: \code{a|b} means an edge from
#' vertex \code{a} to vertex \code{b}.
#'
#' @param seq The vertex or edge sequence.
#' @return A character or numeric vector, see details below.
#'
#' @export
#' @examples
#' g <- make_ring(10)
#' as_ids(V(g))
#' as_ids(E(g))
#'
#' V(g)$name <- letters[1:10]
#' as_ids(V(g))
#' as_ids(E(g))

as_ids <- function(seq)
  UseMethod("as_ids")

#' @method as_ids igraph.vs
#' @rdname as_ids
#' @export

as_ids.igraph.vs <- function(seq) {
  names(seq) %||% as.vector(seq)
}

#' @method as_ids igraph.es
#' @rdname as_ids
#' @export

as_ids.igraph.es <- function(seq) {
  attr(seq, "vnames") %||% as.vector(seq)
}
