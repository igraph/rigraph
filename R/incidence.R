#' Create graphs from a bipartite adjacency matrix
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `graph.incidence()` was renamed to `graph_from_biadjacency_matrix()` to create a more
#' consistent API.
#' @inheritParams graph_from_biadjacency_matrix
#' @keywords internal
#' @export
graph.incidence <- function(incidence, directed = FALSE, mode = c("all", "out", "in", "total"), multiple = FALSE, weighted = NULL, add.names = NULL) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "graph.incidence()", "graph_from_biadjacency_matrix()")
  graph_from_biadjacency_matrix(incidence = incidence, directed = directed, mode = mode, multiple = multiple, weighted = weighted, add.names = add.names)
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


# adjust edgelist according to directionality of edges
modify_edgelist <- function(el, mode, directed) {
  if (!directed || mode == "out") {
    # No adjustment needed
    return(el)
  }
  reversed_edges <- el[, c(2, 1, 3)]
  if (mode == "in") {
    return(reversed_edges)
  }
  rbind(el, reversed_edges)
}

graph_incidence_build <- function(incidence, directed = FALSE, mode = "out",
                                  multiple = FALSE, weighted = NULL) {
  num_rows <- nrow(incidence)
  num_cols <- ncol(incidence)

  # Handle dense unweighted matrices first
  if (!inherits(incidence, "Matrix") && is.null(weighted)) {
    mode(incidence) <- "double"
    on.exit(.Call(R_igraph_finalizer))

    mode_num <- switch(mode,
      "out" = 1,
      "in" = 2,
      "all" = 3,
      "total" = 3
    )
    res <- .Call(R_igraph_biadjacency, incidence, directed, mode_num, multiple)
    return(set_vertex_attr(res$graph, "type", value = res$types))
  }

  # Convert to sparse matrix if not already sparse
  if (!inherits(incidence, "Matrix")) {
    requireNamespace("Matrix", quietly = TRUE)
    incidence <- as(incidence, "dgCMatrix")
  }

  el <- mysummary(incidence)
  el[, 2] <- el[, 2] + num_rows
  el <- as.matrix(el)

  el <- modify_edgelist(el, mode, directed)

  # Construct the graph object from processed edgelist
  if (!is.null(weighted)) {
    # Handle weighted edges
    res <- make_empty_graph(n = num_rows + num_cols, directed = directed)
    weight_attr <- list(el[, 3])
    names(weight_attr) <- weighted
    res <- add_edges(res, edges = t(el[, 1:2]), attr = weight_attr)
  } else {
    # Handle unweighted edges, replicating rows for multiple edges
    el <- el[rep(seq_len(nrow(el)), times = el[, 3]), 1:2]
    res <- make_graph(n = num_rows + num_cols, c(t(el)), directed = directed)
  }

  set_vertex_attr(res, "type", value = c(rep(FALSE, num_rows), rep(TRUE, num_cols)))
}




#' Create graphs from a bipartite adjacency matrix
#'
#' `graph_from_biadjacency_matrix()` creates a bipartite igraph graph from an incidence
#' matrix.
#'
#' Bipartite graphs have a \sQuote{`type`} vertex attribute in igraph,
#' this is boolean and `FALSE` for the vertices of the first kind and
#' `TRUE` for vertices of the second kind.
#'
#' `graph_from_biadjacency_matrix()` can operate in two modes, depending on the
#' `multiple` argument. If it is `FALSE` then a single edge is
#' created for every non-zero element in the bipartite adjacency matrix. If
#' `multiple` is `TRUE`, then the matrix elements are rounded up to
#' the closest non-negative integer to get the number of edges to create
#' between a pair of vertices.
#'
#' @param incidence The input bipartite adjacency matrix. It can also be a sparse matrix
#'   from the `Matrix` package.
#' @param directed Logical scalar, whether to create a directed graph.
#' @param mode A character constant, defines the direction of the edges in
#'   directed graphs, ignored for undirected graphs. If \sQuote{`out`}, then
#'   edges go from vertices of the first kind (corresponding to rows in the
#'   bipartite adjacency matrix) to vertices of the second kind (columns in the incidence
#'   matrix). If \sQuote{`in`}, then the opposite direction is used. If
#'   \sQuote{`all`} or \sQuote{`total`}, then mutual edges are created.
#' @param multiple Logical scalar, specifies how to interpret the matrix
#'   elements. See details below.
#' @param weighted This argument specifies whether to create a weighted graph
#'   from the bipartite adjacency matrix. If it is `NULL` then an unweighted graph is
#'   created and the `multiple` argument is used to determine the edges of
#'   the graph. If it is a character constant then for every non-zero matrix
#'   entry an edge is created and the value of the entry is added as an edge
#'   attribute named by the `weighted` argument. If it is `TRUE` then a
#'   weighted graph is created and the name of the edge attribute will be
#'   \sQuote{`weight`}.
#' @param add.names A character constant, `NA` or `NULL`.
#'   `graph_from_biadjacency_matrix()` can add the row and column names of the incidence
#'   matrix as vertex attributes. If this argument is `NULL` (the default)
#'   and the bipartite adjacency matrix has both row and column names, then these are added
#'   as the \sQuote{`name`} vertex attribute. If you want a different vertex
#'   attribute for this, then give the name of the attributes as a character
#'   string. If this argument is `NA`, then no vertex attributes (other than
#'   type) will be added.
#' @return A bipartite igraph graph. In other words, an igraph graph that has a
#'   vertex attribute `type`.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @seealso [make_bipartite_graph()] for another way to create bipartite
#' graphs
#' @keywords graphs
#' @examples
#'
#' inc <- matrix(sample(0:1, 15, repl = TRUE), 3, 5)
#' colnames(inc) <- letters[1:5]
#' rownames(inc) <- LETTERS[1:3]
#' graph_from_biadjacency_matrix(inc)
#'
#' @details
#' Some authors refer to the bipartite adjacency matrix as the
#' "bipartite incidence matrix". igraph 1.6.0 and later does not use
#' this naming to avoid confusion with the edge-vertex incidence matrix.
#' @family biadjacency
#' @export
graph_from_biadjacency_matrix <- function(incidence, directed = FALSE,
                                          mode = c("all", "out", "in", "total"),
                                          multiple = FALSE, weighted = NULL,
                                          add.names = NULL) {
  # Argument checks
  ensure_no_na(incidence, "biadjacency matrix")
  directed <- as.logical(directed)
  mode <- igraph.match.arg(mode)

  multiple <- as.logical(multiple)

  if (!is.null(weighted)) {
    if (is.logical(weighted) && weighted) {
      if (multiple) {
        cli::cli_abort(c(
          "{.arg multiple} and {.arg weighted} cannot be both {.code TRUE}.",
          "igraph either interprets numbers larger than 1 as weights or as multiplicities, but it cannot be both."
        ))
      }
      weighted <- "weight"
    }
    if (is.logical(weighted) && !weighted) {
      cli::cli_abort(c(
        "{.arg weighted} can't be {.code FALSE}.",
        i = "See {.help graph_from_biadjacency_matrix}'s manual page."
      ))
    }
    if (!is.character(weighted)) {
      cli::cli_abort(c(
        "{.arg weighted} can't be {.obj_type_friendly {weighted}}.",
        i = "See {.help graph_from_biadjacency_matrix}'s manual page."
      ))
    }
  }

  res <- graph_incidence_build(incidence,
    directed = directed,
    mode = mode, multiple = multiple,
    weighted = weighted
  )

  ## Add names
  if (is.null(add.names)) {
    if (!is.null(rownames(incidence)) && !is.null(colnames(incidence))) {
      add.names <- "name"
    } else {
      add.names <- NA
    }
  } else if (!is.na(add.names)) {
    if (is.null(rownames(incidence)) || is.null(colnames(incidence))) {
      cli::cli_warn("Cannot add row- and column names, at least one of them is missing.")
      add.names <- NA
    }
  }
  if (!is.na(add.names)) {
    res <- set_vertex_attr(res, add.names,
      value = c(rownames(incidence), colnames(incidence))
    )
  }
  res
}
#' Graph from incidence matrix
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `graph_from_incidence_matrix()` was renamed to `graph_from_biadjacency_matrix()` to create a more
#' consistent API.
#' @inheritParams graph_from_biadjacency_matrix
#' @keywords internal
#' @details
#' Some authors refer to the bipartite adjacency matrix as the
#' "bipartite incidence matrix". igraph 1.6.0 and later does not use
#' this naming to avoid confusion with the edge-vertex incidence matrix.
#' @export
from_incidence_matrix <- function(...) { # nocov start
  lifecycle::deprecate_soft("1.6.0", "graph_from_incidence_matrix()", "graph_from_biadjacency_matrix()")
  graph_from_biadjacency_matrix(...)
} # nocov end
#' From incidence matrix
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `graph_from_incidence_matrix()` was renamed to `graph_from_biadjacency_matrix()` to create a more
#' consistent API.
#' @inheritParams graph_from_biadjacency_matrix
#' @keywords internal
#' @details
#' Some authors refer to the bipartite adjacency matrix as the
#' "bipartite incidence matrix". igraph 1.6.0 and later does not use
#' this naming to avoid confusion with the edge-vertex incidence matrix.
#' @export
graph_from_incidence_matrix <- function(...) { # nocov start
  lifecycle::deprecate_soft("1.6.0", "graph_from_incidence_matrix()", "graph_from_biadjacency_matrix()")
  graph_from_biadjacency_matrix(...)
} # nocov end
