#' Stochastic matrix of a graph
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `get.stochastic()` was renamed to [stochastic_matrix()] to create a more
#' consistent API.
#' @inheritParams stochastic_matrix
#' @keywords internal
#' @export
get.stochastic <- function(
  graph,
  column.wise = FALSE,
  sparse = igraph_opt("sparsematrices")
) {
  # nocov start
  lifecycle::deprecate_warn("2.0.0", "get.stochastic()", "stochastic_matrix()")
  stochastic_matrix(graph = graph, column.wise = column.wise, sparse = sparse)
} # nocov end
#   IGraph R package
#   Copyright (C) 2010-2012  Gabor Csardi <csardi.gabor@gmail.com>
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

#' Stochastic matrix of a graph
#'
#' Retrieves the stochastic matrix of a graph of class `igraph`.
#'
#' Let \eqn{M} be an \eqn{n \times n}{n x n} adjacency matrix with real
#' non-negative entries. Let us define \eqn{D = \textrm{diag}(\sum_{i}M_{1i},
#' \dots, \sum_{i}M_{ni})}{D=diag( sum(M[1,i], i), ..., sum(M[n,i], i) )}
#'
#' The (row) stochastic matrix is defined as \deqn{W = D^{-1}M,}{W = inv(D) M,}
#' where it is assumed that \eqn{D} is non-singular.  Column stochastic
#' matrices are defined in a symmetric way.
#'
#' @param graph The input graph. Must be of class `igraph`.
#' @inheritParams rlang::args_dots_empty
#' @param column.wise If `FALSE`, then the rows of the stochastic matrix
#'   sum up to one; otherwise it is the columns.
#' @param sparse Logical, whether to return a sparse matrix. The
#'   `Matrix` package is needed for sparse matrices. The default `NULL` uses
#'   the `sparsematrices` igraph option.
#' @return A regular matrix or a matrix of class `Matrix` if a
#'   `sparse` argument was `TRUE`.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @seealso [as_adjacency_matrix()]
#' @export
#' @keywords graphs
#' @examples
#'
#' library(Matrix)
#' ## g is a large sparse graph
#' g <- sample_pa(n = 10^5, power = 2, directed = FALSE)
#' W <- stochastic_matrix(g, sparse = TRUE)
#'
#' ## a dense matrix here would probably not fit in the memory
#' class(W)
#'
#' ## may not be exactly 1, due to numerical errors
#' max(abs(rowSums(W)) - 1)
#'
stochastic_matrix <- function(
  graph,
  ...,
  column.wise = FALSE,
  sparse = NULL
) {
  # BEGIN GENERATED ARG_HANDLE: stochastic_matrix, do not edit, see tools/generate-migrations.R
  if (...length() > 0L) {
    .arg_handle <- migrate_recover_args(
      list(...),
      current = list(column.wise = column.wise, sparse = sparse),
      recover_new = c("column.wise", "sparse"),
      recover_old = c("column.wise", "sparse"),
      match_names = c("column.wise", "sparse"),
      match_to = c("column.wise", "sparse"),
      defaults = list(column.wise = FALSE, sparse = NULL),
      head_args = c("graph"),
      fn_name = "stochastic_matrix"
    )
    list2env(.arg_handle$values, environment())
    lifecycle::deprecate_soft(
      "3.0.0",
      what = I(.arg_handle$what),
      details = .arg_handle$details
    )
  }
  # END GENERATED ARG_HANDLE

  ensure_igraph(graph)

  if (is.null(sparse)) {
    sparse <- igraph_opt("sparsematrices")
  }

  column.wise <- as.logical(column.wise)
  if (length(column.wise) != 1) {
    cli::cli_abort(
      "{.arg column.wise} must be a Logical, not {.obj_type_friendly {column.wise}}."
    )
  }

  sparse <- as.logical(sparse)
  if (length(sparse) != 1) {
    cli::cli_abort(
      "{.arg sparse} must be a Logical, not {.obj_type_friendly {sparse}}."
    )
  }

  if (sparse) {
    res <- get_stochastic_sparse_impl(
      graph = graph,
      column_wise = column.wise,
      weights = NULL
    )
    res <- igraph.i.spMatrix(res)
  } else {
    res <- get_stochastic_impl(
      graph = graph,
      column_wise = column.wise,
      weights = NULL
    )
  }

  if (igraph_opt("add.vertex.names") && is_named(graph)) {
    rownames(res) <- colnames(res) <- V(graph)$name
  }

  res
}
