
#' Create graphs from adjacency matrices
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `graph.adjacency()` was renamed to `graph_from_adjacency_matrix()` to create a more
#' consistent API.
#' @inheritParams graph_from_adjacency_matrix
#' @keywords internal
#' @export
graph.adjacency <- function(adjmatrix, mode = c("directed", "undirected", "max", "min", "upper", "lower", "plus"), weighted = NULL, diag = TRUE, add.colnames = NULL, add.rownames = NA) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "graph.adjacency()", "graph_from_adjacency_matrix()")
  graph_from_adjacency_matrix(adjmatrix = adjmatrix, mode = mode, weighted = weighted, diag = diag, add.colnames = add.colnames, add.rownames = add.rownames)
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

#' Create graphs from adjacency matrices
#'
#' `graph_from_adjacency_matrix()` is a flexible function for creating `igraph`
#' graphs from adjacency matrices.
#'
#' The order of the vertices are preserved, i.e. the vertex corresponding to
#' the first row will be vertex 0 in the graph, etc.
#'
#' `graph_from_adjacency_matrix()` operates in two main modes, depending on the
#' `weighted` argument.
#'
#' If this argument is `NULL` then an unweighted graph is created and an
#' element of the adjacency matrix gives the number of edges to create between
#' the two corresponding vertices.  The details depend on the value of the
#' `mode` argument: \describe{ \item{"directed"}{The graph will be
#' directed and a matrix element gives the number of edges between two
#' vertices.} \item{"undirected"}{This is exactly the same as `max`,
#' for convenience. Note that it is *not* checked whether the matrix is
#' symmetric.} \item{"max"}{An undirected graph will be created and
#' `max(A(i,j), A(j,i))` gives the number of edges.}
#' \item{"upper"}{An undirected graph will be created, only the upper
#' right triangle (including the diagonal) is used for the number of edges.}
#' \item{"lower"}{An undirected graph will be created, only the lower
#' left triangle (including the diagonal) is used for creating the edges.}
#' \item{"min"}{undirected graph will be created with `min(A(i,j),
#' A(j,i))` edges between vertex `i` and `j`.} \item{"plus"}{
#' undirected graph will be created with `A(i,j)+A(j,i)` edges between
#' vertex `i` and `j`.} }
#'
#' If the `weighted` argument is not `NULL` then the elements of the
#' matrix give the weights of the edges (if they are not zero).  The details
#' depend on the value of the `mode` argument: \describe{
#' \item{"directed"}{The graph will be directed and a matrix element
#' gives the edge weights.} \item{"undirected"}{First we check that the
#' matrix is symmetric. It is an error if not. Then only the upper triangle is
#' used to create a weighted undirected graph.} \item{"max"}{An
#' undirected graph will be created and `max(A(i,j), A(j,i))` gives the
#' edge weights.} \item{"upper"}{An undirected graph will be created,
#' only the upper right triangle (including the diagonal) is used (for the edge
#' weights).} \item{"lower"}{An undirected graph will be created, only
#' the lower left triangle (including the diagonal) is used for creating the
#' edges.} \item{"min"}{An undirected graph will be created,
#' `min(A(i,j), A(j,i))` gives the edge weights.} \item{"plus"}{An
#' undirected graph will be created, `A(i,j)+A(j,i)` gives the edge
#' weights.} }
#'
#' @param adjmatrix A square adjacency matrix. From igraph version 0.5.1 this
#'   can be a sparse matrix created with the `Matrix` package.
#' @param mode Character scalar, specifies how igraph should interpret the
#'   supplied matrix. See also the `weighted` argument, the interpretation
#'   depends on that too. Possible values are: `directed`,
#'   `undirected`, `upper`, `lower`, `max`, `min`,
#'   `plus`. See details below.
#' @param weighted This argument specifies whether to create a weighted graph
#'   from an adjacency matrix. If it is `NULL` then an unweighted graph is
#'   created and the elements of the adjacency matrix gives the number of edges
#'   between the vertices. If it is a character constant then for every non-zero
#'   matrix entry an edge is created and the value of the entry is added as an
#'   edge attribute named by the `weighted` argument. If it is `TRUE`
#'   then a weighted graph is created and the name of the edge attribute will be
#'   `weight`. See also details below.
#' @param diag Logical scalar, whether to include the diagonal of the matrix in
#'   the calculation. If this is `FALSE` then the diagonal is zerod out
#'   first.
#' @param add.colnames Character scalar, whether to add the column names as
#'   vertex attributes. If it is \sQuote{`NULL`} (the default) then, if
#'   present, column names are added as vertex attribute \sQuote{name}. If
#'   \sQuote{`NA`} then they will not be added.  If a character constant,
#'   then it gives the name of the vertex attribute to add.
#' @param add.rownames Character scalar, whether to add the row names as vertex
#'   attributes. Possible values the same as the previous argument. By default
#'   row names are not added. If \sQuote{`add.rownames`} and
#'   \sQuote{`add.colnames`} specify the same vertex attribute, then the
#'   former is ignored.
#' @return An igraph graph object.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @seealso [make_graph()] and [graph_from_literal()] for other ways to
#' create graphs.
#' @keywords graphs
#' @examples
#'
#' g1 <- sample(
#'     x = 0:1, size = 100, replace = TRUE,
#'     prob = c(0.9, 0.1)
#'   ) %>%
#'   matrix(ncol = 10) %>%
#'   graph_from_adjacency_matrix()
#'
#' g2 <- sample(
#'     x = 0:5, size = 100, replace = TRUE,
#'     prob = c(0.9, 0.02, 0.02, 0.02, 0.02, 0.02)
#' ) %>%
#'   matrix(ncol = 10) %>%
#'   graph_from_adjacency_matrix(weighted = TRUE)
#' E(g2)$weight
#'
#' ## various modes for weighted graphs, with some tests
#' non_zero_sort <- function(x) sort(x[x != 0])
#' adj_matrix <- matrix(runif(100), 10)
#' adj_matrix[adj_matrix < 0.5] <- 0
#' g3 <- graph_from_adjacency_matrix(
#'   (adj_matrix + t(adj_matrix)) / 2,
#'   weighted = TRUE,
#'   mode = "undirected"
#' )
#'
#' g4 <- graph_from_adjacency_matrix(
#'   adj_matrix,
#'   weighted = TRUE,
#'   mode = "max"
#' )
#' expected_g4_weights <- non_zero_sort(
#'   pmax(adj_matrix, t(adj_matrix))[upper.tri(adj_matrix, diag = TRUE)]
#' )
#' actual_g4_weights <- sort(E(g4)$weight)
#' all(expected_g4_weights == actual_g4_weights)
#'
#' g5 <- graph_from_adjacency_matrix(
#'   adj_matrix,
#'   weighted = TRUE,
#'   mode = "min"
#' )
#' expected_g5_weights <- non_zero_sort(
#'   pmin(adj_matrix, t(adj_matrix))[upper.tri(adj_matrix, diag = TRUE)]
#' )
#' actual_g5_weights <- sort(E(g5)$weight)
#' all(expected_g5_weights == actual_g5_weights)
#'
#' g6 <- graph_from_adjacency_matrix(
#'   adj_matrix,
#'   weighted = TRUE,
#'   mode = "upper"
#' )
#' expected_g6_weights <- non_zero_sort(adj_matrix[upper.tri(adj_matrix, diag = TRUE)])
#' actual_g6_weights <- sort(E(g6)$weight)
#' all(expected_g6_weights == actual_g6_weights)
#'
#' g7 <- graph_from_adjacency_matrix(
#'   adj_matrix,
#'   weighted = TRUE,
#'   mode = "lower"
#' )
#' expected_g7_weights <- non_zero_sort(adj_matrix[lower.tri(adj_matrix, diag = TRUE)])
#' actual_g7_weights <- sort(E(g7)$weight)
#' all(expected_g7_weights == actual_g7_weights)
#'
#' g8 <- graph_from_adjacency_matrix(
#'   adj_matrix,
#'   weighted = TRUE,
#'   mode = "plus"
#' )
#' halve_diag <- function(x) {
#'   diag(x) <- diag(x) / 2
#'   x
#' }
#' expected_g8_weights <- non_zero_sort(
#'   halve_diag(adj_matrix + t(adj_matrix)
#' )[lower.tri(adj_matrix, diag = TRUE)])
#' actual_g8_weights <- sort(E(g8)$weight)
#' all(expected_g8_weights == actual_g8_weights)
#'
#' g9 <- graph_from_adjacency_matrix(
#'   adj_matrix,
#'   weighted = TRUE,
#'   mode = "plus",
#'   diag = FALSE
#' )
#' zero_diag <- function(x) {
#'   diag(x) <- 0
#' }
#' expected_g9_weights <- non_zero_sort((zero_diag(adj_matrix + t(adj_matrix)))[lower.tri(adj_matrix)])
#' actual_g9_weights <- sort(E(g9)$weight)
#' all(expected_g9_weights == actual_g9_weights)
#'
#' ## row/column names
#' rownames(adj_matrix) <- sample(letters, nrow(adj_matrix))
#' colnames(adj_matrix) <- seq(ncol(adj_matrix))
#' g10 <- graph_from_adjacency_matrix(
#'   adj_matrix,
#'   weighted = TRUE,
#'   add.rownames = "code"
#' )
#' summary(g10)
#'
#' @export
graph_from_adjacency_matrix <- function(adjmatrix,
                                        mode = c(
                                          "directed", "undirected", "max",
                                          "min", "upper", "lower", "plus"
                                        ),
                                        weighted = NULL, diag = TRUE,
                                        add.colnames = NULL, add.rownames = NA) {

  mode <- igraph.match.arg(mode)

  if (!is.matrix(adjmatrix) && !inherits(adjmatrix, "Matrix")) {
    lifecycle::deprecate_soft(
      "1.6.0",
      "graph_from_adjacency_matrix(adjmatrix = 'must be a matrix')"
    )
    adjmatrix <- as.matrix(1)
  }

  if (mode == "undirected") {
    if (!is_symmetric(adjmatrix)) {
      lifecycle::deprecate_soft(
        "1.6.0",
        "graph_from_adjacency_matrix(adjmatrix = 'must be symmetric with mode = \"undirected\"')",
        details = 'Use mode = "max" to achieve the original behavior.'
      )
      mode <- "max"
    }
  }

  if (inherits(adjmatrix, "Matrix")) {
    res <- graph.adjacency.sparse(adjmatrix, mode = mode, weighted = weighted, diag = diag)
  } else {
    res <- graph.adjacency.dense(adjmatrix, mode = mode, weighted = weighted, diag = diag)
  }

  ## Add columns and row names as attributes
  if (is.null(add.colnames)) {
    if (!is.null(colnames(adjmatrix))) {
      add.colnames <- "name"
    } else {
      add.colnames <- NA
    }
  } else if (!is.na(add.colnames)) {
    if (is.null(colnames(adjmatrix))) {
      warning("No column names to add")
      add.colnames <- NA
    }
  }

  if (is.null(add.rownames)) {
    if (!is.null(rownames(adjmatrix))) {
      add.rownames <- "name"
    } else {
      add.colnames <- NA
    }
  } else if (!is.na(add.rownames)) {
    if (is.null(rownames(adjmatrix))) {
      warning("No row names to add")
      add.rownames <- NA
    }
  }

  if (!is.na(add.rownames) && !is.na(add.colnames) &&
    add.rownames == add.colnames) {
    warning("Same attribute for columns and rows, row names are ignored")
    add.rownames <- NA
  }

  if (!is.na(add.colnames)) {
    res <- set_vertex_attr(res, add.colnames, value = colnames(adjmatrix))
  }
  if (!is.na(add.rownames)) {
    res <- set_vertex_attr(res, add.rownames, value = rownames(adjmatrix))
  }

  res
}

is_symmetric <- function(x) {
  if (inherits(x, "Matrix")) {
    return(Matrix::isSymmetric(x, tol = 0, tol1 = 0))
  }

  if (is.matrix(x)) {
    return(isSymmetric.matrix(x, tol = 0, tol1 = 0))
  }

  return(isSymmetric(x, tol = 0, tol1 = 0))
}

#' @rdname graph_from_adjacency_matrix
#' @param ... Passed to `graph_from_adjacency_matrix()`.
#' @family adjacency
#' @export
from_adjacency <- function(...) constructor_spec(graph_from_adjacency_matrix, ...)

graph.adjacency.dense <- function(
    adjmatrix,
    mode,
    weighted = NULL,
    diag = c("once", "twice", "ignore")) {
  mode <- switch(mode,
    "directed" = 0L,
    "undirected" = 1L,
    "upper" = 2L,
    "lower" = 3L,
    "min" = 4L,
    "plus" = 5L,
    "max" = 6L
  )

  if (is.logical(diag)) {
    diag <- ifelse(diag, "once", "ignore")
  }
  diag <- igraph.match.arg(diag)
  diag <- switch(diag,
    "ignore" = 0L,
    "twice" = 1L,
    "once" = 2L
  )

  if (nrow(adjmatrix) != ncol(adjmatrix)) {
    stop("Adjacency matrices must be square.")
  }

  mode(adjmatrix) <- "double"

  if (isTRUE(weighted)) {
    weighted <- "weight"
  } else if (!is.character(weighted)) {
    weighted <- NULL
  }

  on.exit(.Call(R_igraph_finalizer))
  if (is.null(weighted)) {
    res <- .Call(R_igraph_adjacency, adjmatrix, mode, diag)
  } else {
    res <- .Call(R_igraph_weighted_adjacency, adjmatrix, mode, diag)
    res <- set_edge_attr(res$graph, weighted, value = res$weights)
  }

  res
}

## helper function to replace Matrix::summary() in a way that ensures that we
## have a third column even when Matrix::summary() returned the non-zero
## cell coordinates only
mysummary <- function(x) {
  result <- Matrix::summary(x)
  if (ncol(result) < 3) {
    result <- cbind(result, 1)
  }
  result
}


graph.adjacency.sparse <- function(adjmatrix, mode, weighted = NULL, diag = TRUE) {
  if (!is.null(weighted)) {
    if (is.logical(weighted) && weighted) {
      weighted <- "weight"
    }
    if (!is.character(weighted)) {
      stop("invalid value supplied for `weighted' argument, please see docs.")
    }
  }

  if (nrow(adjmatrix) != ncol(adjmatrix)) {
    stop("not a square matrix")
  }

  vc <- nrow(adjmatrix)

  ## to remove non-redundancies that can persist in a dgtMatrix
  if (inherits(adjmatrix, "dgTMatrix")) {
    adjmatrix <- as(adjmatrix, "CsparseMatrix")
  } else if (inherits(adjmatrix, "ddiMatrix")) {
    adjmatrix <- as(adjmatrix, "CsparseMatrix")
  }

  if (mode == "directed") {
    ## DIRECTED
    el <- mysummary(adjmatrix)
    if (!diag) {
      el <- el[el[, 1] != el[, 2], ]
    }
  } else if (mode == "undirected") {
    ## UNDIRECTED, must be symmetric if weighted
    if (!is.null(weighted) && !Matrix::isSymmetric(adjmatrix)) {
      stop("Please supply a symmetric matrix if you want to create a weighted graph with mode=UNDIRECTED.")
    }
    if (diag) {
      adjmatrix <- Matrix::tril(adjmatrix)
    } else {
      if (vc == 1) {
        # Work around Matrix glitch
        adjmatrix <- as(matrix(0), "dgCMatrix")
      } else {
        adjmatrix <- Matrix::tril(adjmatrix, -1)
      }
    }
    el <- mysummary(adjmatrix)
    rm(adjmatrix)
  } else if (mode == "max") {
    ## MAXIMUM
    el <- mysummary(adjmatrix)
    rm(adjmatrix)
    if (!diag) {
      el <- el[el[, 1] != el[, 2], ]
    }
    el <- el[el[, 3] != 0, ]
    w <- el[, 3]
    el <- el[, 1:2]
    el <- cbind(pmin(el[, 1], el[, 2]), pmax(el[, 1], el[, 2]))
    o <- order(el[, 1], el[, 2])
    el <- el[o, , drop = FALSE]
    w <- w[o]
    if (nrow(el) > 1) {
      dd <- el[2:nrow(el), 1] == el[1:(nrow(el) - 1), 1] &
        el[2:nrow(el), 2] == el[1:(nrow(el) - 1), 2]
      dd <- which(dd)
      if (length(dd) > 0) {
        mw <- pmax(w[dd], w[dd + 1])
        w[dd] <- mw
        w[dd + 1] <- mw
        el <- el[-dd, , drop = FALSE]
        w <- w[-dd]
      }
    }
    el <- cbind(el, w)
  } else if (mode == "upper") {
    ## UPPER
    if (diag) {
      adjmatrix <- Matrix::triu(adjmatrix)
    } else {
      adjmatrix <- Matrix::triu(adjmatrix, 1)
    }
    el <- mysummary(adjmatrix)
    rm(adjmatrix)
    if (!diag) {
      el <- el[el[, 1] != el[, 2], ]
    }
  } else if (mode == "lower") {
    ## LOWER
    if (diag) {
      adjmatrix <- Matrix::tril(adjmatrix)
    } else {
      if (vc == 1) {
        # Work around Matrix glitch
        adjmatrix <- as(matrix(0), "dgCMatrix")
      } else {
        adjmatrix <- Matrix::tril(adjmatrix, -1)
      }
    }
    el <- mysummary(adjmatrix)
    rm(adjmatrix)
    if (!diag) {
      el <- el[el[, 1] != el[, 2], ]
    }
  } else if (mode == "min") {
    ## MINIMUM
    adjmatrix <- sign(adjmatrix) * sign(Matrix::t(adjmatrix)) * adjmatrix
    el <- mysummary(adjmatrix)
    rm(adjmatrix)
    if (!diag) {
      el <- el[el[, 1] != el[, 2], ]
    }
    el <- el[el[, 3] != 0, ]
    w <- el[, 3]
    el <- el[, 1:2]
    el <- cbind(pmin(el[, 1], el[, 2]), pmax(el[, 1], el[, 2]))
    o <- order(el[, 1], el[, 2])
    el <- el[o, ]
    w <- w[o]
    if (nrow(el) > 1) {
      dd <- el[2:nrow(el), 1] == el[1:(nrow(el) - 1), 1] &
        el[2:nrow(el), 2] == el[1:(nrow(el) - 1), 2]
      dd <- which(dd)
      if (length(dd) > 0) {
        mw <- pmin(w[dd], w[dd + 1])
        w[dd] <- mw
        w[dd + 1] <- mw
        el <- el[-dd, ]
        w <- w[-dd]
      }
    }
    el <- cbind(el, w)
  } else if (mode == "plus") {
    ## PLUS
    adjmatrix <- adjmatrix + Matrix::t(adjmatrix)
    if (diag) {
      adjmatrix <- Matrix::tril(adjmatrix)
    } else {
      if (vc == 1) {
        # Work around Matrix glitch
        adjmatrix <- as(matrix(0), "dgCMatrix")
      } else {
        adjmatrix <- Matrix::tril(adjmatrix, -1)
      }
    }
    el <- mysummary(adjmatrix)
    rm(adjmatrix)
    if (diag) {
      loop <- el[, 1] == el[, 2]
      el[loop, 3] <- el[loop, 3] / 2
    }
    el <- el[el[, 3] != 0, ]
  }

  if (!is.null(weighted)) {
    res <- make_empty_graph(n = vc, directed = (mode == "directed"))
    weight <- list(el[, 3])
    names(weight) <- weighted
    res <- add_edges(res, edges = t(as.matrix(el[, 1:2])), attr = weight)
  } else {
    edges <- unlist(apply(el, 1, function(x) rep(unname(x[1:2]), x[3])))
    res <- make_graph(n = vc, edges, directed = (mode == "directed"))
  }
  res
}
