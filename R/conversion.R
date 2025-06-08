#' Convert igraph graphs to graphNEL objects from the graph package
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `igraph.to.graphNEL()` was renamed to [as_graphnel()] to create a more
#' consistent API.
#' @inheritParams as_graphnel
#' @keywords internal
#' @export
igraph.to.graphNEL <- function(graph) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "igraph.to.graphNEL()", "as_graphnel()")
  as_graphnel(graph = graph)
} # nocov end

#' Convert graphNEL objects from the graph package to igraph
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `igraph.from.graphNEL()` was renamed to [graph_from_graphnel()] to create a more
#' consistent API.
#' @inheritParams graph_from_graphnel
#' @keywords internal
#' @export
igraph.from.graphNEL <- function(graphNEL, name = TRUE, weight = TRUE, unlist.attrs = TRUE) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "igraph.from.graphNEL()", "graph_from_graphnel()")
  graph_from_graphnel(graphNEL = graphNEL, name = name, weight = weight, unlist.attrs = unlist.attrs)
} # nocov end

#' Create graphs from adjacency lists
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `graph.adjlist()` was renamed to [graph_from_adj_list()] to create a more
#' consistent API.
#' @inheritParams graph_from_adj_list
#' @keywords internal
#' @export
graph.adjlist <- function(adjlist, mode = c("out", "in", "all", "total"), duplicate = TRUE) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "graph.adjlist()", "graph_from_adj_list()")
  graph_from_adj_list(adjlist = adjlist, mode = mode, duplicate = duplicate)
} # nocov end

#' Bipartite adjacency matrix of a bipartite graph
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `get.incidence()` was renamed to [as_biadjacency_matrix()] to create a more
#' consistent API.
#' @inheritParams as_biadjacency_matrix
#' @keywords internal
#' @export
get.incidence <- function(graph, types = NULL, attr = NULL, names = TRUE, sparse = FALSE) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "get.incidence()", "as_biadjacency_matrix()")
  as_biadjacency_matrix(graph = graph, types = types, attr = attr, names = names, sparse = sparse)
} # nocov end

#' Convert a graph to an edge list
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `get.edgelist()` was renamed to [as_edgelist()] to create a more
#' consistent API.
#' @inheritParams as_edgelist
#' @keywords internal
#' @export
get.edgelist <- function(graph, names = TRUE) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "get.edgelist()", "as_edgelist()")
  as_edgelist(graph = graph, names = names)
} # nocov end

#' Creating igraph graphs from data frames or vice-versa
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `get.data.frame()` was renamed to [as_data_frame()] to create a more
#' consistent API.
#' @inheritParams as_data_frame
#' @keywords internal
#' @export
get.data.frame <- function(x, what = c("edges", "vertices", "both")) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "get.data.frame()", "as_data_frame()")
  as_data_frame(x = x, what = what)
} # nocov end

#' Convert a graph to an adjacency matrix
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `get.adjacency()` was renamed to [as_adjacency_matrix()] to create a more
#' consistent API.
#' @inheritParams as_adjacency_matrix
#' @keywords internal
#' @export
get.adjacency <- function(graph, type = c("both", "upper", "lower"), attr = NULL, edges = FALSE, names = TRUE, sparse = igraph_opt("sparsematrices")) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "get.adjacency()", "as_adjacency_matrix()")
  as_adjacency_matrix(graph = graph, type = type, attr = attr, edges = edges, names = names, sparse = sparse)
} # nocov end

#' Adjacency lists
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `get.adjlist()` was renamed to [as_adj_list()] to create a more
#' consistent API.
#' @inheritParams as_adj_list
#' @keywords internal
#' @export
get.adjlist <- function(graph, mode = c("all", "out", "in", "total"), loops = c("twice", "once", "ignore"), multiple = TRUE) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "get.adjlist()", "as_adj_list()")
  as_adj_list(graph = graph, mode = mode, loops = loops, multiple = multiple)
} # nocov end

#' Adjacency lists
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `get.adjedgelist()` was renamed to [as_adj_edge_list()] to create a more
#' consistent API.
#' @inheritParams as_adj_edge_list
#' @keywords internal
#' @export
get.adjedgelist <- function(graph, mode = c("all", "out", "in", "total"), loops = c("twice", "once", "ignore")) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "get.adjedgelist()", "as_adj_edge_list()")
  as_adj_edge_list(graph = graph, mode = mode, loops = loops)
} # nocov end
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

get.adjacency.dense <- function(graph, type = c("both", "upper", "lower"),
                                attr = NULL, weights = NULL, loops = c("once", "twice", "ignore"), names = TRUE) {
  ensure_igraph(graph)

  type <- igraph.match.arg(type)

  if (is.logical(loops)) {
    loops <- ifelse(loops, "once", "ignore")
    lifecycle::deprecate_soft(
      "2.1.0", "get.adjacency.dense(loops = 'must be a character')",
      details = sprintf("Converting to get.adjacency.dense (loops = '%s')", loops)
    )
  }
  loops <- igraph.match.arg(loops)
  loops <- switch(loops,
    "ignore" = 0L,
    "twice" = 1L,
    "once" = 2L
  )

  if (!is.null(weights)) weights <- as.numeric(weights)

  if (is.null(attr)) {
    on.exit(.Call(R_igraph_finalizer))
    type <- switch(type,
      "upper" = 0,
      "lower" = 1,
      "both" = 2
    )
    res <- .Call(
      R_igraph_get_adjacency, graph, as.numeric(type), weights,
      loops
    )
  } else {
    # faster than a specialized implementation
    res <- as.matrix(get.adjacency.sparse(graph, type = type, attr = attr, names = names, call = rlang::caller_env()))
  }

  if (names && "name" %in% vertex_attr_names(graph)) {
    colnames(res) <- rownames(res) <- V(graph)$name
  }
  res
}

get.adjacency.sparse <- function(graph, type = c("both", "upper", "lower"),
                                 attr = NULL, names = TRUE, call = rlang::caller_env()) {
  ensure_igraph(graph)

  type <- igraph.match.arg(type)

  vc <- vcount(graph)

  el <- as_edgelist(graph, names = FALSE)
  use.last.ij <- FALSE

  if (!is.null(attr)) {
    attr <- as.character(attr)
    if (!attr %in% edge_attr_names(graph)) {
      cli::cli_abort("No such edge attribute", call = call)
    }
    value <- edge_attr(graph, name = attr)
    if (!is.numeric(value) && !is.logical(value)) {
      cli::cli_abort(
        "Matrices must be either numeric or logical, and the edge attribute is not",
        call = call
      )
    }
  } else {
    value <- rep(1, nrow(el))
  }

  if (is_directed(graph)) {
    res <- Matrix::sparseMatrix(dims = c(vc, vc), i = el[, 1], j = el[, 2], x = value, use.last.ij = use.last.ij)
  } else {
    if (type == "upper") {
      ## upper
      res <- Matrix::sparseMatrix(
        dims = c(vc, vc), i = pmin(el[, 1], el[, 2]),
        j = pmax(el[, 1], el[, 2]), x = value, use.last.ij = use.last.ij
      )
    } else if (type == "lower") {
      ## lower
      res <- Matrix::sparseMatrix(
        dims = c(vc, vc), i = pmax(el[, 1], el[, 2]),
        j = pmin(el[, 1], el[, 2]), x = value, use.last.ij = use.last.ij
      )
    } else if (type == "both") {
      ## both
      res <- Matrix::sparseMatrix(
        dims = c(vc, vc), i = pmin(el[, 1], el[, 2]),
        j = pmax(el[, 1], el[, 2]), x = value, symmetric = TRUE, use.last.ij = use.last.ij
      )
      res <- as(res, "generalMatrix")
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
#' `as_adjacency_matrix()` returns the adjacency matrix of a graph, a
#' regular matrix if `sparse` is `FALSE`, or a sparse matrix, as
#' defined in the \sQuote{`Matrix`} package, if `sparse` if
#' `TRUE`.
#'
#' @param graph The graph to convert.
#' @param type Gives how to create the adjacency matrix for undirected graphs.
#'   It is ignored for directed graphs. Possible values: `upper`: the upper
#'   right triangle of the matrix is used, `lower`: the lower left triangle
#'   of the matrix is used. `both`: the whole matrix is used, a symmetric
#'   matrix is returned.
#' @param attr Either `NULL` or a character string giving an edge
#'   attribute name. If `NULL` a traditional adjacency matrix is returned.
#'   If not `NULL` then the values of the given edge attribute are included
#'   in the adjacency matrix. If the graph has multiple edges, the edge attribute
#'   of an arbitrarily chosen edge (for the multiple edges) is included. This
#'   argument is ignored if `edges` is `TRUE`.
#'
#'   Note that this works only for certain attribute types. If the `sparse`
#'   argumen is `TRUE`, then the attribute must be either logical or
#'   numeric. If the `sparse` argument is `FALSE`, then character is
#'   also allowed. The reason for the difference is that the `Matrix`
#'   package does not support character sparse matrices yet.
#' @param edges `r lifecycle::badge("deprecated")` Logical scalar, whether to return the edge ids in the matrix.
#'   For non-existant edges zero is returned.
#' @param names Logical constant, whether to assign row and column names
#'   to the matrix. These are only assigned if the `name` vertex attribute
#'   is present in the graph.
#' @param sparse Logical scalar, whether to create a sparse matrix. The
#'   \sQuote{`Matrix`} package must be installed for creating sparse
#'   matrices.
#' @return A `vcount(graph)` by `vcount(graph)` (usually) numeric
#'   matrix.
#'
#' @seealso [graph_from_adjacency_matrix()], [read_graph()]
#' @examples
#'
#' g <- sample_gnp(10, 2 / 10)
#' as_adjacency_matrix(g)
#' V(g)$name <- letters[1:vcount(g)]
#' as_adjacency_matrix(g)
#' E(g)$weight <- runif(ecount(g))
#' as_adjacency_matrix(g, attr = "weight")
#' @family conversion
#' @export
as_adjacency_matrix <- function(graph, type = c("both", "upper", "lower"),
                                attr = NULL, edges = deprecated(), names = TRUE,
                                sparse = igraph_opt("sparsematrices")) {
  ensure_igraph(graph)

  if (lifecycle::is_present(edges) && isTRUE(edges)) {
    lifecycle::deprecate_stop("2.0.0", "as_adjacency_matrix(edges = )")
  }

  if (sparse) {
    get.adjacency.sparse(graph, type = type, attr = attr, names = names)
  } else {
    get.adjacency.dense(graph, type = type, attr = attr, weights = NULL, names = names, loops = "once")
  }
}

#' Convert a graph to an adjacency matrix
#'
#' `r lifecycle::badge("deprecated")`
#' We plan to remove `as_adj()` in favor of the more explicitly named
#' `as_adjacency_matrix()` so please use `as_adjacency_matrix()` instead.
#'
#' @export
#' @inheritParams as_adjacency_matrix
#' @keywords internal
as_adj <- function(graph, type = c("both", "upper", "lower"),
                   attr = NULL, edges = deprecated(), names = TRUE,
                   sparse = igraph_opt("sparsematrices")) {
  lifecycle::deprecate_soft("2.1.0", "as_adj()", "as_adjacency_matrix()")

  as_adjacency_matrix(
    graph = graph,
    type = type,
    attr = attr,
    edges = edges,
    names = names,
    sparse = sparse
  )
}
#' Convert a graph to an edge list
#'
#' Sometimes it is useful to work with a standard representation of a
#' graph, like an edge list.
#'
#' `as_edgelist()` returns the list of edges in a graph.
#'
#' @param graph The graph to convert.
#' @param names Whether to return a character matrix containing vertex
#'   names (i.e. the `name` vertex attribute) if they exist or numeric
#'   vertex ids.
#' @return A `ecount(graph)` by 2 numeric matrix.
#' @seealso [graph_from_adjacency_matrix()], [read_graph()]
#' @keywords graphs
#' @examples
#'
#' g <- sample_gnp(10, 2 / 10)
#' as_edgelist(g)
#'
#' V(g)$name <- LETTERS[seq_len(gorder(g))]
#' as_edgelist(g)
#'
#' @family conversion
#' @export
as_edgelist <- function(graph, names = TRUE) {
  ensure_igraph(graph)
  on.exit(.Call(R_igraph_finalizer))
  res <- matrix(.Call(R_igraph_get_edgelist, graph, TRUE),
    ncol = 2
  )
  res <- res + 1
  if (names && "name" %in% vertex_attr_names(graph)) {
    res <- matrix(V(graph)$name[res], ncol = 2)
  }

  res
}



#' Convert between directed and undirected graphs
#'
#' `as_directed()` converts an undirected graph to directed,
#' `as_undirected()` does the opposite, it converts a directed graph to
#' undirected.
#'
#' Conversion algorithms for `as_directed()`:
#'   \describe{
#'     \item{"arbitrary"}{
#'       The number of edges in the graph stays the same, an
#'       arbitrarily directed edge is created for each undirected edge, but the
#'       direction of the edge is deterministic (i.e. it always points the same
#'       way if you call the function multiple times).
#'     }
#'     \item{"mutual"}{
#'       Two directed edges are created for each undirected
#'       edge, one in each direction.
#'     }
#'     \item{"random"}{
#'       The number of edges in the graph stays the same, and
#'       a randomly directed edge is created for each undirected edge. You
#'       will get different results if you call the function multiple times
#'       with the same graph.
#'     }
#'     \item{"acyclic"}{
#'       The number of edges in the graph stays the same, and
#'       a directed edge is created for each undirected edge such that the
#'       resulting graph is guaranteed to be acyclic. This is achieved by ensuring
#'       that edges always point from a lower index vertex to a higher index.
#'       Note that the graph may include cycles of length 1 if the original
#'       graph contained loop edges.
#'     }
#'   }
#'
#' Conversion algorithms for `as_undirected()`:
#'   \describe{
#'     \item{"each"}{
#'       The number of edges remains constant, an undirected edge
#'       is created for each directed one, this version might create graphs with
#'       multiple edges.
#'     }
#'     \item{"collapse"}{
#'       One undirected edge will be created
#'       for each pair of vertices which are connected with at least one directed
#'       edge, no multiple edges will be created.
#'     }
#'     \item{"mutual"}{
#'       One
#'       undirected edge will be created for each pair of mutual edges. Non-mutual
#'       edges are ignored. This mode might create multiple edges if there are more
#'       than one mutual edge pairs between the same pair of vertices.
#'     }
#'   }
#'
#' @aliases as_directed as_undirected
#' @param graph The graph to convert.
#' @param mode Character constant, defines the conversion algorithm. For
#'   `as_directed()` it can be `mutual` or `arbitrary`. For
#'   `as_undirected()` it can be `each`, `collapse` or
#'   `mutual`. See details below.
#' @return A new graph object.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @seealso [simplify()] for removing multiple and/or loop edges from
#' a graph.
#' @family conversion
#' @export
#' @keywords graphs
#' @examples
#'
#' g <- make_ring(10)
#' as_directed(g, "mutual")
#' g2 <- make_star(10)
#' as_undirected(g)
#'
#' # Combining edge attributes
#' g3 <- make_ring(10, directed = TRUE, mutual = TRUE)
#' E(g3)$weight <- seq_len(ecount(g3))
#' ug3 <- as_undirected(g3)
#' print(ug3, e = TRUE)

#' @examplesIf rlang::is_interactive()
#' x11(width = 10, height = 5)
#' layout(rbind(1:2))
#' plot(g3, layout = layout_in_circle, edge.label = E(g3)$weight)
#' plot(ug3, layout = layout_in_circle, edge.label = E(ug3)$weight)

#' @examples
#'
#' g4 <- make_graph(c(
#'   1, 2, 3, 2, 3, 4, 3, 4, 5, 4, 5, 4,
#'   6, 7, 7, 6, 7, 8, 7, 8, 8, 7, 8, 9, 8, 9,
#'   9, 8, 9, 8, 9, 9, 10, 10, 10, 10
#' ))
#' E(g4)$weight <- seq_len(ecount(g4))
#' ug4 <- as_undirected(g4,
#'   mode = "mutual",
#'   edge.attr.comb = list(weight = length)
#' )
#' print(ug4, e = TRUE)
#'
#' @cdocs igraph_to_directed
as_directed <- to_directed_impl

#' @rdname as_directed
#' @param edge.attr.comb Specifies what to do with edge attributes, if
#'   `mode="collapse"` or `mode="mutual"`.  In these cases many edges
#'   might be mapped to a single one in the new graph, and their attributes are
#'   combined. Please see [attribute.combination()] for details on
#'   this.
#' @export
as_undirected <- function(graph, mode = c("collapse", "each", "mutual"), edge.attr.comb = igraph_opt("edge.attr.comb")) {
  # Argument checks
  ensure_igraph(graph)
  mode <- switch(igraph.match.arg(mode),
    "collapse" = 1L,
    "each" = 0L,
    "mutual" = 2L
  )
  edge.attr.comb <- igraph.i.attribute.combination(edge.attr.comb)

  on.exit(.Call(R_igraph_finalizer))
  # Function call
  res <- .Call(R_igraph_to_undirected, graph, mode, edge.attr.comb)

  res
}


#' Adjacency lists
#'
#' Create adjacency lists from a graph, either for adjacent edges or for
#' neighboring vertices
#'
#' `as_adj_list()` returns a list of numeric vectors, which include the ids
#' of neighbor vertices (according to the `mode` argument) of all
#' vertices.
#'
#' `as_adj_edge_list()` returns a list of numeric vectors, which include the
#' ids of adjacent edges (according to the `mode` argument) of all
#' vertices.
#'
#' @param graph The input graph.
#' @param mode Character scalar, it gives what kind of adjacent edges/vertices
#'   to include in the lists. \sQuote{`out`} is for outgoing edges/vertices,
#'   \sQuote{`in`} is for incoming edges/vertices, \sQuote{`all`} is
#'   for both. This argument is ignored for undirected graphs.
#' @param loops Character scalar, one of `"ignore"` (to omit loops), `"twice"`
#'   (to include loop edges twice) and `"once"` (to include them once). `"twice"`
#'   is not allowed for directed graphs and will be replaced with `"once"`.
#' @param multiple Logical scalar, set to `FALSE` to use only one representative
#'   of each set of parallel edges.
#' @return A list of `igraph.vs` or a list of numeric vectors depending on
#'   the value of `igraph_opt("return.vs.es")`, see details for performance
#'   characteristics.
#' @details If `igraph_opt("return.vs.es")` is true (default), the numeric
#' vectors of the adjacency lists are coerced to `igraph.vs`, this can be
#' a very expensive operation on large graphs.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @seealso [as_edgelist()], [as_adjacency_matrix()]
#' @family conversion
#' @export
#' @keywords graphs
#' @examples
#'
#' g <- make_ring(10)
#' as_adj_list(g)
#' as_adj_edge_list(g)
#'
as_adj_list <- function(graph,
                        mode = c("all", "out", "in", "total"),
                        loops = c("twice", "once", "ignore"),
                        multiple = TRUE) {
  ensure_igraph(graph)

  mode <- igraph.match.arg(mode)
  mode <- as.numeric(switch(mode,
    "out" = 1,
    "in" = 2,
    "all" = 3,
    "total" = 3
  ))
  loops <- igraph.match.arg(loops)
  loops <- as.numeric(switch(loops,
    "ignore" = 0,
    "twice" = 1,
    "once" = 2
  ))

  if (is_directed(graph) && loops == 1) {
    loops <- 2
  }

  multiple <- if (multiple) 1 else 0
  on.exit(.Call(R_igraph_finalizer))
  res <- .Call(R_igraph_get_adjlist, graph, mode, loops, multiple)
  res <- lapply(res, `+`, 1)
  if (igraph_opt("return.vs.es")) {
    res <- lapply(res, unsafe_create_vs, graph = graph, verts = V(graph))
  }
  if (is_named(graph)) names(res) <- V(graph)$name
  res
}

#' @rdname as_adj_list
#' @export
as_adj_edge_list <- function(graph,
                             mode = c("all", "out", "in", "total"),
                             loops = c("twice", "once", "ignore")) {
  ensure_igraph(graph)

  mode <- igraph.match.arg(mode)
  mode <- as.numeric(switch(mode,
    "out" = 1,
    "in" = 2,
    "all" = 3,
    "total" = 3
  ))
  loops <- igraph.match.arg(loops)
  loops <- as.numeric(switch(loops,
    "ignore" = 0,
    "twice" = 1,
    "once" = 2
  ))

  if (is_directed(graph) && loops == 1) {
    loops <- 2
  }

  on.exit(.Call(R_igraph_finalizer))
  res <- .Call(R_igraph_get_adjedgelist, graph, mode, loops)
  res <- lapply(res, function(.x) E(graph)[.x + 1])
  if (is_named(graph)) names(res) <- V(graph)$name
  res
}

#' Convert graphNEL objects from the graph package to igraph
#'
#' The graphNEL class is defined in the `graph` package, it is another
#' way to represent graphs. `graph_from_graphnel()` takes a graphNEL
#' graph and converts it to an igraph graph. It handles all
#' graph/vertex/edge attributes. If the graphNEL graph has a vertex
#' attribute called \sQuote{`name`} it will be used as igraph vertex
#' attribute \sQuote{`name`} and the graphNEL vertex names will be
#' ignored.
#'
#' Because graphNEL graphs poorly support multiple edges, the edge
#' attributes of the multiple edges are lost: they are all replaced by the
#' attributes of the first of the multiple edges.
#'
#' @param graphNEL The graphNEL graph.
#' @param name Logical scalar, whether to add graphNEL vertex names as an
#'   igraph vertex attribute called \sQuote{`name`}.
#' @param weight Logical scalar, whether to add graphNEL edge weights as an
#'   igraph edge attribute called \sQuote{`weight`}. (graphNEL graphs are
#'   always weighted.)
#' @param unlist.attrs Logical scalar. graphNEL attribute query functions
#'   return the values of the attributes in R lists, if this argument is
#'   `TRUE` (the default) these will be converted to atomic vectors,
#'   whenever possible, before adding them to the igraph graph.
#' @return `graph_from_graphnel()` returns an igraph graph object.
#' @seealso [as_graphnel()] for the other direction,
#' [as_adjacency_matrix()], [graph_from_adjacency_matrix()],
#' [as_adj_list()] and [graph_from_adj_list()] for other
#' graph representations.
#' @examplesIf rlang::is_installed("graph")
#' ## Undirected
#' g <- make_ring(10)
#' V(g)$name <- letters[1:10]
#' GNEL <- as_graphnel(g)
#' g2 <- graph_from_graphnel(GNEL)
#' g2
#'
#' ## Directed
#' g3 <- make_star(10, mode = "in")
#' V(g3)$name <- letters[1:10]
#' GNEL2 <- as_graphnel(g3)
#' g4 <- graph_from_graphnel(GNEL2)
#' g4
#' @family conversion
#' @export
graph_from_graphnel <- function(graphNEL, name = TRUE, weight = TRUE,
                                unlist.attrs = TRUE) {
  if (!inherits(graphNEL, "graphNEL")) {
    cli::cli_abort("{.arg graphNEL} is {.obj_type_friendly {graphNEL}} and not a graphNEL graph")
  }

  al <- lapply(graph::edgeL(graphNEL), "[[", "edges")
  if (graph::edgemode(graphNEL) == "undirected") {
    al <- mapply(SIMPLIFY = FALSE, seq_along(al), al, FUN = function(n, l) {
      c(l, rep(n, sum(l == n)))
    })
  }
  mode <- if (graph::edgemode(graphNEL) == "directed") "out" else "all"
  g <- graph_from_adj_list(al, mode = mode, duplicate = TRUE)
  if (name) {
    V(g)$name <- graph::nodes(graphNEL)
  }

  ## Graph attributes
  g.n <- names(graphNEL@graphData)
  g.n <- g.n[g.n != "edgemode"]
  for (n in g.n) {
    g <- set_graph_attr(g, n, graphNEL@graphData[[n]])
  }

  ## Vertex attributes
  v.n <- names(graph::nodeDataDefaults(graphNEL))
  for (n in v.n) {
    val <- unname(graph::nodeData(graphNEL, attr = n))
    if (unlist.attrs && all(sapply(val, length) == 1)) {
      val <- unlist(val)
    }
    g <- set_vertex_attr(g, n, value = val)
  }

  ## Edge attributes
  e.n <- names(graph::edgeDataDefaults(graphNEL))
  if (!weight) {
    e.n <- e.n[e.n != "weight"]
  }
  if (length(e.n) > 0) {
    el <- as_edgelist(g)
    el <- paste(sep = "|", el[, 1], el[, 2])
    for (n in e.n) {
      val <- unname(graph::edgeData(graphNEL, attr = n)[el])
      if (unlist.attrs && all(sapply(val, length) == 1)) {
        val <- unlist(val)
      }
      g <- set_edge_attr(g, n, value = val)
    }
  }

  g
}

#' Convert igraph graphs to graphNEL objects from the graph package
#'
#' The graphNEL class is defined in the `graph` package, it is another
#' way to represent graphs. These functions are provided to convert between
#' the igraph and the graphNEL objects.
#'
#' `as_graphnel()` converts an igraph graph to a graphNEL graph. It
#' converts all graph/vertex/edge attributes. If the igraph graph has a
#' vertex attribute \sQuote{`name`}, then it will be used to assign
#' vertex names in the graphNEL graph. Otherwise numeric igraph vertex ids
#' will be used for this purpose.
#'
#' @param graph An igraph graph object.
#' @return `as_graphnel()` returns a graphNEL graph object.
#' @seealso [graph_from_graphnel()] for the other direction,
#' [as_adjacency_matrix()], [graph_from_adjacency_matrix()],
#' [as_adj_list()] and [graph_from_adj_list()] for
#' other graph representations.
#'
#' @examplesIf rlang::is_installed("graph")
#' ## Undirected
#' g <- make_ring(10)
#' V(g)$name <- letters[1:10]
#' GNEL <- as_graphnel(g)
#' g2 <- graph_from_graphnel(GNEL)
#' g2
#'
#' ## Directed
#' g3 <- make_star(10, mode = "in")
#' V(g3)$name <- letters[1:10]
#' GNEL2 <- as_graphnel(g3)
#' g4 <- graph_from_graphnel(GNEL2)
#' g4
#' @family conversion
#' @export
as_graphnel <- function(graph) {
  ensure_igraph(graph)

  if (any_multiple(graph)) {
    cli::cli_abort("multiple edges are not supported in graphNEL graphs")
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
    al <- lapply(as_adj_edge_list(graph, "out", loops = "once"), as.vector)
    for (i in seq(along.with = al)) {
      edges <- ends(graph, al[[i]], names = FALSE)
      edges <- ifelse(edges[, 2] == i, edges[, 1], edges[, 2])
      weights <- E(graph)$weight[al[[i]]]
      al[[i]] <- list(edges = edges, weights = weights)
    }
  } else {
    al <- as_adj_list(graph, "out", loops = "once")
    al <- lapply(al, function(x) list(edges = as.vector(x)))
  }

  names(al) <- name
  res <- graph::graphNEL(nodes = name, edgeL = al, edgemode = edgemode)

  ## Add graph attributes (other than 'directed')
  ## Are this "officially" supported at all?

  g.n <- graph_attr_names(graph)
  if ("directed" %in% g.n) {
    cli::cli_warn("Cannot add graph attribute {.str directed}.")
    g.n <- g.n[g.n != "directed"]
  }
  for (n in g.n) {
    res@graphData[[n]] <- graph_attr(graph, n)
  }

  ## Add vertex attributes (other than 'name', that is already
  ## added as vertex names)

  v.n <- vertex_attr_names(graph)
  v.n <- v.n[v.n != "name"]
  for (n in v.n) {
    graph::nodeDataDefaults(res, attr = n) <- NA
    graph::nodeData(res, attr = n) <- vertex_attr(graph, n)
  }

  ## Add edge attributes (other than 'weight')

  e.n <- edge_attr_names(graph)
  e.n <- e.n[e.n != "weight"]
  if (length(e.n) > 0) {
    el <- as_edgelist(graph)
    el <- paste(sep = "|", el[, 1], el[, 2])
    for (n in e.n) {
      graph::edgeDataDefaults(res, attr = n) <- NA
      res@edgeData@data[el] <- mapply(
        function(x, y) {
          xx <- c(x, y)
          names(xx)[length(xx)] <- n
          xx
        },
        res@edgeData@data[el],
        edge_attr(graph, n),
        SIMPLIFY = FALSE
      )
    }
  }

  res
}

get.incidence.dense <- function(graph, types, names, attr, call = rlang::caller_env()) {
  if (is.null(attr)) {
    on.exit(.Call(R_igraph_finalizer))
    ## Function call
    res <- .Call(R_igraph_get_biadjacency, graph, types)

    if (names && "name" %in% vertex_attr_names(graph)) {
      rownames(res$res) <- V(graph)$name[res$row_ids]
      colnames(res$res) <- V(graph)$name[res$col_ids]
    } else {
      rownames(res$res) <- res$row_ids
      colnames(res$res) <- res$col_ids
    }
    res$res
  } else {
    attr <- as.character(attr)
    if (!attr %in% edge_attr_names(graph)) {
      cli::cli_abort("No such edge attribute", call = call)
    }

    vc <- vcount(graph)
    n1 <- sum(!types)
    n2 <- vc - n1
    res <- matrix(0, n1, n2)

    recode <- numeric(vc)
    # move from 1..n indexing to 1..n1 row indices for type == FALSE
    # and 1..n2 col indices for type == TRUE
    # recode holds the mapping [1..n] -> [1..n1,1..n2]
    recode[!types] <- seq_len(n1)
    recode[types] <- seq_len(n2)

    el <- as_edgelist(graph, names = FALSE)
    idx <- types[el[, 1]]
    el[] <- recode[el]

    # switch order of source/target such that nodes with
    # type == FALSE are in el[ ,1]
    el[idx, ] <- el[idx, 2:1]
    # el[ ,1] only holds values 1..n1 and el[ ,2] values 1..n2
    # and we can populate the matrix
    value <- edge_attr(graph, attr)
    if (!is.numeric(value) && !is.logical(value)) {
      cli::cli_abort(
        "Matrices must be either numeric or logical, and the edge attribute is not",
        call = call
      )
    }
    res[el] <- value

    if (names && "name" %in% vertex_attr_names(graph)) {
      rownames(res) <- V(graph)$name[which(!types)]
      colnames(res) <- V(graph)$name[which(types)]
    } else {
      rownames(res) <- which(!types)
      colnames(res) <- which(types)
    }

    res
  }
}

get.incidence.sparse <- function(graph, types, names, attr, call = rlang::caller_env()) {
  vc <- vcount(graph)
  if (length(types) != vc) {
    cli::cli_abort("Invalid types vector", call = call)
  }

  el <- as_edgelist(graph, names = FALSE)
  if (any(types[el[, 1]] == types[el[, 2]])) {
    cli::cli_abort("Invalid types vector, not a bipartite graph", call = call)
  }

  n1 <- sum(!types)
  n2 <- vc - n1

  recode <- numeric(vc)
  recode[!types] <- seq_len(n1)
  recode[types] <- seq_len(n2) + n1

  el[, 1] <- recode[el[, 1]]
  el[, 2] <- recode[el[, 2]]

  change <- el[, 1] > n1
  el[change, ] <- el[change, 2:1]
  el[, 2] <- el[, 2] - n1

  if (!is.null(attr)) {
    attr <- as.character(attr)
    if (!attr %in% edge_attr_names(graph)) {
      cli::cli_abort("No such edge attribute", call = call)
    }
    value <- edge_attr(graph, name = attr)
    if (!is.numeric(value) && !is.logical(value)) {
      cli::cli_abort(
        "Matrices must be either numeric or logical, and the edge attribute is not",
        call = call
      )
    }
  } else {
    value <- rep(1, nrow(el))
  }

  res <- Matrix::spMatrix(n1, n2, i = el[, 1], j = el[, 2], x = value)

  if (names && "name" %in% vertex_attr_names(graph)) {
    rownames(res) <- V(graph)$name[which(!types)]
    colnames(res) <- V(graph)$name[which(types)]
  } else {
    rownames(res) <- which(!types)
    colnames(res) <- which(types)
  }
  res
}



#' Bipartite adjacency matrix of a bipartite graph
#'
#' This function can return a sparse or dense bipartite adjacency matrix of a bipartite
#' network. The bipartite adjacency matrix is an \eqn{n} times \eqn{m} matrix, \eqn{n}
#' and \eqn{m} are the number of vertices of the two kinds.
#'
#' Bipartite graphs have a `type` vertex attribute in igraph, this is
#' boolean and `FALSE` for the vertices of the first kind and `TRUE`
#' for vertices of the second kind.
#'
#' @param graph The input graph. The direction of the edges is ignored in
#'   directed graphs.
#' @param types An optional vertex type vector to use instead of the
#'   `type` vertex attribute. You must supply this argument if the graph has
#'   no `type` vertex attribute.
#' @param attr Either `NULL` or a character string giving an edge
#'   attribute name. If `NULL`, then a traditional bipartite adjacency matrix is
#'   returned. If not `NULL` then the values of the given edge attribute are
#'   included in the bipartite adjacency matrix. If the graph has multiple edges, the edge
#'   attribute of an arbitrarily chosen edge (for the multiple edges) is
#'   included.
#' @param names Logical scalar, if `TRUE` and the vertices in the graph
#'   are named (i.e. the graph has a vertex attribute called `name`), then
#'   vertex names will be added to the result as row and column names. Otherwise
#'   the ids of the vertices are used as row and column names.
#' @param sparse Logical scalar, if it is `TRUE` then a sparse matrix is
#'   created, you will need the `Matrix` package for this.
#' @return A sparse or dense matrix.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @seealso [graph_from_biadjacency_matrix()] for the opposite operation.
#' @family conversion
#' @export
#' @keywords graphs
#' @details
#' Some authors refer to the bipartite adjacency matrix as the
#' "bipartite incidence matrix". igraph 1.6.0 and later does not use
#' this naming to avoid confusion with the edge-vertex incidence matrix.
#' @examples
#'
#' g <- make_bipartite_graph(c(0, 1, 0, 1, 0, 0), c(1, 2, 2, 3, 3, 4))
#' as_biadjacency_matrix(g)
#'
as_biadjacency_matrix <- function(graph, types = NULL, attr = NULL,
                                  names = TRUE, sparse = FALSE) {
  # Argument checks
  ensure_igraph(graph)
  types <- handle_vertex_type_arg(types, graph)

  names <- as.logical(names)
  sparse <- as.logical(sparse)

  if (sparse) {
    get.incidence.sparse(graph, types = types, names = names, attr = attr, call = rlang::caller_env())
  } else {
    get.incidence.dense(graph, types = types, names = names, attr = attr)
  }
}
#' As incidence matrix
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `as_incidence_matrix()` was renamed to [as_biadjacency_matrix()] to create a more
#' consistent API.
#' @inheritParams as_biadjacency_matrix
#' @keywords internal
#' @details
#' Some authors refer to the bipartite adjacency matrix as the
#' "bipartite incidence matrix". igraph 1.6.0 and later does not use
#' this naming to avoid confusion with the edge-vertex incidence matrix.
#' @export
as_incidence_matrix <- function(...) { # nocov start
  lifecycle::deprecate_soft("1.6.0", "as_incidence_matrix()", "as_biadjacency_matrix()")
  as_biadjacency_matrix(...)
} # nocov end
#' @rdname graph_from_data_frame
#' @param x An igraph object.
#' @param what Character constant, whether to return info about vertices,
#'   edges, or both. The default is \sQuote{edges}.
#' @family conversion
#' @family biadjacency
#' @export
as_data_frame <- function(x, what = c("edges", "vertices", "both")) {
  ensure_igraph(x)
  what <- igraph.match.arg(what)

  if (what %in% c("vertices", "both")) {
    ver <- .Call(R_igraph_mybracket2, x, igraph_t_idx_attr, igraph_attr_idx_vertex)
    class(ver) <- "data.frame"
    rn <- if (is_named(x)) {
      V(x)$name
    } else {
      seq_len(vcount(x))
    }
    rownames(ver) <- rn
  }

  if (what %in% c("edges", "both")) {
    el <- as_edgelist(x)
    edg <- c(
      list(from = el[, 1], to = el[, 2]),
      .Call(R_igraph_mybracket2, x, igraph_t_idx_attr, igraph_attr_idx_edge)
    )
    class(edg) <- "data.frame"
    rownames(edg) <- seq_len(ecount(x))
  }

  if (what == "both") {
    list(vertices = ver, edges = edg)
  } else if (what == "vertices") {
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
#' [as_adj_list()], do your modifications to the graphs and finally
#' create again an igraph graph by calling `graph_from_adj_list()`.
#'
#' @param adjlist The adjacency list. It should be consistent, i.e. the maximum
#'   throughout all vectors in the list must be less than the number of vectors
#'   (=the number of vertices in the graph).
#' @param mode Character scalar, it specifies whether the graph to create is
#'   undirected (\sQuote{all} or \sQuote{total}) or directed; and in the latter
#'   case, whether it contains the outgoing (\sQuote{out}) or the incoming
#'   (\sQuote{in}) neighbors of the vertices.
#' @param duplicate Logical scalar. For undirected graphs it gives whether
#'   edges are included in the list twice. E.g. if it is `TRUE` then for an
#'   undirected \code{{A,B}} edge `graph_from_adj_list()` expects `A`
#'   included in the neighbors of `B` and `B` to be included in the
#'   neighbors of `A`.
#'
#'   This argument is ignored if `mode` is `out` or `in`.
#' @return An igraph graph object.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @seealso [as_edgelist()]
#' @keywords graphs
#' @examples
#'
#' ## Directed
#' g <- make_ring(10, directed = TRUE)
#' al <- as_adj_list(g, mode = "out")
#' g2 <- graph_from_adj_list(al)
#' isomorphic(g, g2)
#'
#' ## Undirected
#' g <- make_ring(10)
#' al <- as_adj_list(g)
#' g2 <- graph_from_adj_list(al, mode = "all")
#' isomorphic(g, g2)
#' ecount(g2)
#' g3 <- graph_from_adj_list(al, mode = "all", duplicate = FALSE)
#' ecount(g3)
#' which_multiple(g3)
#' @family conversion
#' @export
#' @cdocs igraph_adjlist
graph_from_adj_list <- adjlist_impl


#' Convert a graph to a long data frame
#'
#' A long data frame contains all metadata about both the vertices
#' and edges of the graph. It contains one row for each edge, and
#' all metadata about that edge and its incident vertices are included
#' in that row. The names of the columns that contain the metadata
#' of the incident vertices are prefixed with `from_` and `to_`.
#' The first two columns are always named `from` and `to` and
#' they contain the numeric ids of the incident vertices. The rows are
#' listed in the order of numeric vertex ids.
#'
#' @param graph Input graph
#' @return A long data frame.
#'
#' @family conversion
#' @export
#' @examples
#' g <- make_(
#'   ring(10),
#'   with_vertex_(name = letters[1:10], color = "red"),
#'   with_edge_(weight = 1:10, color = "green")
#' )
#' as_long_data_frame(g)
as_long_data_frame <- function(graph) {
  ensure_igraph(graph)

  ver <- .Call(R_igraph_mybracket2, graph, igraph_t_idx_attr, igraph_attr_idx_vertex)
  class(ver) <- "data.frame"
  rn <- if (is_named(graph)) {
    V(graph)$name
  } else {
    seq_len(vcount(graph))
  }
  rownames(ver) <- rn

  el <- as_edgelist(graph, names = FALSE)
  edg <- c(
    list(from = el[, 1]), list(to = el[, 2]),
    .Call(R_igraph_mybracket2, graph, igraph_t_idx_attr, igraph_attr_idx_edge)
  )
  class(edg) <- "data.frame"
  rownames(edg) <- seq_len(ecount(graph))

  ver2 <- ver
  if (length(ver) > 0) {
    names(ver) <- paste0("from_", names(ver))
    names(ver2) <- paste0("to_", names(ver2))
    edg <- cbind(edg, ver[el[, 1], , drop = FALSE], ver2[el[, 2], , drop = FALSE])
  }

  edg
}

#' Convert igraph objects to adjacency or edge list matrices
#'
#' Get adjacency or edgelist representation of the network stored as an
#' `igraph` object.
#'
#' If `matrix.type` is `"edgelist"`, then a two-column numeric edge list
#' matrix is returned.  The value of `attrname` is ignored.
#'
#' If `matrix.type` is `"adjacency"`, then a square adjacency matrix is
#' returned. For adjacency matrices, you can use the `attr` keyword argument
#' to use the values of an edge attribute in the matrix cells. See the
#' documentation of [as_adjacency_matrix] for more details.
#'
#' Other arguments passed through `...` are passed to either
#' [as_adjacency_matrix()] or [as_edgelist()]
#' depending on the value of `matrix.type`.
#'
#' @param x object of class `igraph`, the network
#' @param matrix.type character, type of matrix to return, currently "adjacency"
#'   or "edgelist" are supported
#' @param \dots other arguments to/from other methods
#' @return Depending on the value of `matrix.type` either a square
#'   adjacency matrix or a two-column numeric matrix representing the edgelist.
#' @author Michal Bojanowski, originally from the `intergraph` package
#' @family conversion
#' @export
#' @examples
#'
#' g <- make_graph("zachary")
#' as.matrix(g, "adjacency")
#' as.matrix(g, "edgelist")
#' # use edge attribute "weight"
#' E(g)$weight <- rep(1:10, length.out = ecount(g))
#' as.matrix(g, "adjacency", sparse = FALSE, attr = "weight")
#'
as.matrix.igraph <- function(x, matrix.type = c("adjacency", "edgelist"), ...) {
  mt <- match.arg(matrix.type)
  switch(mt,
    adjacency = as_adjacency_matrix(graph = x, ...),
    edgelist = as_edgelist(graph = x, ...)
  )
}

#' Convert between directed and undirected graphs
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `as.directed()` was renamed to [as_directed()] to create a more
#' consistent API.
#' @inheritParams as_directed
#' @keywords internal
#' @export
as.directed <- function(graph, mode = c("mutual", "arbitrary", "random", "acyclic")) {
  lifecycle::deprecate_soft("2.1.0", "as.directed()", "as_directed()")
  as_directed(graph, mode = mode)
}

#' Convert between undirected and unundirected graphs
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `as.undirected()` was renamed to [as_undirected()] to create a more
#' consistent API.
#' @inheritParams as_undirected
#' @keywords internal
#' @export
as.undirected <- function(graph,
                          mode = c("collapse", "each", "mutual"),
                          edge.attr.comb = igraph_opt("edge.attr.comb")) {
  lifecycle::deprecate_soft("2.1.0", "as.undirected()", "as_undirected()")
  as_undirected(graph = graph, mode = mode, edge.attr.comb = edge.attr.comb)
}

#' Create a graph from an edge list matrix
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `graph.edgelist()` was renamed to [graph_from_edgelist()] to create a more
#' consistent API.
#' @inheritParams graph_from_edgelist
#' @keywords internal
#' @export
graph.edgelist <- function(el, directed = TRUE) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "graph.edgelist()", "graph_from_edgelist()")
  graph_from_edgelist(el = el, directed = directed)
} # nocov end

#' Creating igraph graphs from data frames or vice-versa
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `graph.data.frame()` was renamed to [graph_from_data_frame()] to create a more
#' consistent API.
#' @inheritParams graph_from_data_frame
#' @keywords internal
#' @export
graph.data.frame <- function(d, directed = TRUE, vertices = NULL) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "graph.data.frame()", "graph_from_data_frame()")
  graph_from_data_frame(d = d, directed = directed, vertices = vertices)
} # nocov end

## ----------------------------------------------------------------
##
##   IGraph R package
##   Copyright (C) 2005-2014  Gabor Csardi <csardi.gabor@gmail.com>
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
## -----------------------------------------------------------------

#' Creating igraph graphs from data frames or vice-versa
#'
#' This function creates an igraph graph from one or two data frames containing
#' the (symbolic) edge list and edge/vertex attributes.
#'
#' `graph_from_data_frame()` creates igraph graphs from one or two data frames.
#' It has two modes of operation, depending whether the `vertices`
#' argument is `NULL` or not.
#'
#' If `vertices` is `NULL`, then the first two columns of `d`
#' are used as a symbolic edge list and additional columns as edge attributes.
#' The names of the attributes are taken from the names of the columns.
#'
#' If `vertices` is not `NULL`, then it must be a data frame giving
#' vertex metadata. The first column of `vertices` is assumed to contain
#' symbolic vertex names, this will be added to the graphs as the
#' \sQuote{`name`} vertex attribute. Other columns will be added as
#' additional vertex attributes. If `vertices` is not `NULL` then the
#' symbolic edge list given in `d` is checked to contain only vertex names
#' listed in `vertices`.
#'
#' Typically, the data frames are exported from some spreadsheet software like
#' Excel and are imported into R via [read.table()],
#' [read.delim()] or [read.csv()].
#'
#' All edges in the data frame are included in the graph, which may include
#' multiple parallel edges and loops.
#'
#' `as_data_frame()` converts the igraph graph into one or more data
#' frames, depending on the `what` argument.
#'
#' If the `what` argument is `edges` (the default), then the edges of
#' the graph and also the edge attributes are returned. The edges will be in
#' the first two columns, named `from` and `to`. (This also denotes
#' edge direction for directed graphs.)  For named graphs, the vertex names
#' will be included in these columns, for other graphs, the numeric vertex ids.
#' The edge attributes will be in the other columns. It is not a good idea to
#' have an edge attribute named `from` or `to`, because then the
#' column named in the data frame will not be unique. The edges are listed in
#' the order of their numeric ids.
#'
#' If the `what` argument is `vertices`, then vertex attributes are
#' returned. Vertices are listed in the order of their numeric vertex ids.
#'
#' If the `what` argument is `both`, then both vertex and edge data
#' is returned, in a list with named entries `vertices` and `edges`.
#'
#' @param d A data frame containing a symbolic edge list in the first two
#'   columns. Additional columns are considered as edge attributes.  Since
#'   version 0.7 this argument is coerced to a data frame with
#'   `as.data.frame`.
#' @param directed Logical scalar, whether or not to create a directed graph.
#' @param vertices A data frame with vertex metadata, or `NULL`. See
#'   details below. Since version 0.7 this argument is coerced to a data frame
#'   with `as.data.frame`, if not `NULL`.
#' @return An igraph graph object for `graph_from_data_frame()`, and either a
#'   data frame or a list of two data frames named `edges` and
#'   `vertices` for `as.data.frame`.
#' @note For `graph_from_data_frame()` `NA` elements in the first two
#' columns \sQuote{d} are replaced by the string \dQuote{NA} before creating
#' the graph. This means that all `NA`s will correspond to a single
#' vertex.
#'
#' `NA` elements in the first column of \sQuote{vertices} are also
#' replaced by the string \dQuote{NA}, but the rest of \sQuote{vertices} is not
#' touched. In other words, vertex names (=the first column) cannot be
#' `NA`, but other vertex attributes can.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @seealso [graph_from_literal()]
#' for another way to create graphs, [read.table()] to read in tables
#' from files.
#' @keywords graphs
#' @examples
#'
#' ## A simple example with a couple of actors
#' ## The typical case is that these tables are read in from files....
#' actors <- data.frame(
#'   name = c(
#'     "Alice", "Bob", "Cecil", "David",
#'     "Esmeralda"
#'   ),
#'   age = c(48, 33, 45, 34, 21),
#'   gender = c("F", "M", "F", "M", "F")
#' )
#' relations <- data.frame(
#'   from = c(
#'     "Bob", "Cecil", "Cecil", "David",
#'     "David", "Esmeralda"
#'   ),
#'   to = c("Alice", "Bob", "Alice", "Alice", "Bob", "Alice"),
#'   same.dept = c(FALSE, FALSE, TRUE, FALSE, FALSE, TRUE),
#'   friendship = c(4, 5, 5, 2, 1, 1), advice = c(4, 5, 5, 4, 2, 3)
#' )
#' g <- graph_from_data_frame(relations, directed = TRUE, vertices = actors)
#' print(g, e = TRUE, v = TRUE)
#'
#' ## The opposite operation
#' as_data_frame(g, what = "vertices")
#' as_data_frame(g, what = "edges")
#'
#' @export
graph_from_data_frame <- function(d, directed = TRUE, vertices = NULL) {
  d <- as.data.frame(d)
  if (!is.null(vertices)) {
    vertices <- as.data.frame(vertices)
  }

  if (ncol(d) < 2) {
    cli::cli_abort("{.arg d} should contain at least two columns")
  }

  ## Handle if some elements are 'NA'
  ensure_no_na(d, "edge data frame")

  if (!is.null(vertices) && any(is.na(vertices[, 1]))) {
    cli::cli_warn("In {.code vertices[,1]}, {.code NA} elements were replaced with string {.str NA}.")
    vertices[, 1][is.na(vertices[, 1])] <- "NA"
  }

  names <- unique(c(as.character(d[, 1]), as.character(d[, 2])))
  if (!is.null(vertices)) {
    names2 <- names
    vertices <- as.data.frame(vertices)
    if (ncol(vertices) < 1) {
      cli::cli_abort("{.arg vertices} contains no rows")
    }
    names <- as.character(vertices[, 1])
    if (any(duplicated(names))) {
      cli::cli_abort("{.arg vertices} contains duplicated vertex names")
    }
    if (any(!names2 %in% names)) {
      cli::cli_abort("Some vertex names in {.arg d} are not listed in {.arg vertices}")
    }
  }

  # create graph
  g <- make_empty_graph(n = 0, directed = directed)

  # vertex attributes
  attrs <- list(name = names)
  if (!is.null(vertices)) {
    if (ncol(vertices) > 1) {
      for (i in 2:ncol(vertices)) {
        newval <- vertices[, i]
        attrs[[names(vertices)[i]]] <- newval
      }
    }
  }

  # add vertices
  g <- add_vertices(g, length(names), attr = attrs)

  # create edge list
  from <- as.character(d[, 1])
  to <- as.character(d[, 2])
  edges <- rbind(match(from, names), match(to, names))

  # edge attributes
  attrs <- list()
  if (ncol(d) > 2) {
    for (i in 3:ncol(d)) {
      newval <- d[, i]
      attrs[[names(d)[i]]] <- newval
    }
  }

  # add the edges
  g <- add_edges(g, edges, attr = attrs)
  g
}

#' @rdname graph_from_data_frame
#' @param ... Passed to `graph_from_data_frame()`.
#' @export
from_data_frame <- function(...) constructor_spec(graph_from_data_frame, ...)

## -----------------------------------------------------------------

#' Create a graph from an edge list matrix
#'
#' `graph_from_edgelist()` creates a graph from an edge list. Its argument
#' is a two-column matrix, each row defines one edge. If it is
#' a numeric matrix then its elements are interpreted as vertex ids. If
#' it is a character matrix then it is interpreted as symbolic vertex
#' names and a vertex id will be assigned to each name, and also a
#' `name` vertex attribute will be added.
#'
#' @concept Edge list
#' @param el The edge list, a two column matrix, character or numeric.
#' @param directed Whether to create a directed graph.
#' @return An igraph graph.
#'
#' @family deterministic constructors
#' @export
#' @examples
#' el <- matrix(c("foo", "bar", "bar", "foobar"), nc = 2, byrow = TRUE)
#' graph_from_edgelist(el)
#'
#' # Create a ring by hand
#' graph_from_edgelist(cbind(1:10, c(2:10, 1)))
graph_from_edgelist <- function(el, directed = TRUE) {
  if (!is.matrix(el) || ncol(el) != 2) {
    cli::cli_abort("graph_from_edgelist expects a matrix with two columns.")
  }
  ensure_no_na(el, "edgelist")

  if (nrow(el) == 0) {
    res <- make_empty_graph(directed = directed)
  } else {
    if (is.character(el)) {
      ## symbolic edge list
      names <- unique(as.character(t(el)))
      ids <- seq(names)
      names(ids) <- names
      res <- make_graph(unname(ids[t(el)]), directed = directed)
      rm(ids)
      V(res)$name <- names
    } else {
      ## normal edge list
      res <- make_graph(t(el), directed = directed)
    }
  }

  res
}

#' @rdname graph_from_edgelist
#' @param ... Passed to `graph_from_edgelist()`.
#' @export
from_edgelist <- function(...) constructor_spec(graph_from_edgelist, ...)
