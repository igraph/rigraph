
#' Stochastic matrix of a graph
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `get.stochastic()` was renamed to `stochastic_matrix()` to create a more
#' consistent API.
#' @inheritParams stochastic_matrix
#' @keywords internal
#' @export
get.stochastic <- function(graph, column.wise = FALSE, sparse = igraph_opt("sparsematrices")) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "get.stochastic()", "stochastic_matrix()")
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


#' Spectral Coarse Graining
#'
#' Functions to perform the Spectral Coarse Graining (SCG) of matrices and
#' graphs.
#'
#' @name scg-method
#' @family scg
#' @section Introduction: The SCG functions provide a framework, called
#' Spectral Coarse Graining (SCG), for reducing large graphs while preserving
#' their *spectral-related features*, that is features closely related
#' with the eigenvalues and eigenvectors of a graph matrix (which for now can
#' be the adjacency, the stochastic, or the Laplacian matrix).
#'
#' Common examples of such features comprise the first-passage-time of random
#' walkers on Markovian graphs, thermodynamic properties of lattice models in
#' statistical physics (e.g. Ising model), and the epidemic threshold of
#' epidemic network models (SIR and SIS models).
#'
#' SCG differs from traditional clustering schemes by producing a
#' *coarse-grained graph* (not just a partition of the vertices),
#' representative of the original one. As shown in \[1\], Principal Component
#' Analysis can be viewed as a particular SCG, called *exact SCG*, where
#' the matrix to be coarse-grained is the covariance matrix of some data set.
#'
#' SCG should be of interest to practitioners of various fields dealing with
#' problems where matrix eigenpairs play an important role, as for instance is
#' the case of dynamical processes on networks.
#' @author David Morton de Lachapelle.
#' @references D. Morton de Lachapelle, D. Gfeller, and P. De Los Rios,
#' Shrinking Matrices while Preserving their Eigenpairs with Application to the
#' Spectral Coarse Graining of Graphs. Submitted to *SIAM Journal on
#' Matrix Analysis and Applications*, 2008.
#' <https://www.epfl.ch/labs/lbs/wp-content/uploads/2018/07/scg_math_paper_dml_dg_pdl.pdf>
#'
#' D. Gfeller, and P. De Los Rios, Spectral Coarse Graining and Synchronization
#' in Oscillator Networks. *Physical Review Letters*, **100**(17),
#' 2008.  <https://arxiv.org/abs/0708.2055>
#'
#' D. Gfeller, and P. De Los Rios, Spectral Coarse Graining of Complex
#' Networks, *Physical Review Letters*, **99**(3), 2007.
#' <https://arxiv.org/abs/0706.0812>
#' @keywords graphs
NULL

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
#' @param column.wise If `FALSE`, then the rows of the stochastic matrix
#'   sum up to one; otherwise it is the columns.
#' @param sparse Logical scalar, whether to return a sparse matrix. The
#'   `Matrix` package is needed for sparse matrices.
#' @return A regular matrix or a matrix of class `Matrix` if a
#'   `sparse` argument was `TRUE`.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @seealso [as_adj()]
#' @family scg
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
stochastic_matrix <- function(graph, column.wise = FALSE,
                              sparse = igraph_opt("sparsematrices")) {
  ensure_igraph(graph)

  column.wise <- as.logical(column.wise)
  if (length(column.wise) != 1) {
    stop("`column.wise' must be a logical scalar")
  }

  sparse <- as.logical(sparse)
  if (length(sparse) != 1) {
    stop("`sparse' must be a logical scalar")
  }

  on.exit(.Call(R_igraph_finalizer))
  if (sparse) {
    res <- .Call(R_igraph_get_stochastic_sparse, graph, column.wise, NULL)
    res <- igraph.i.spMatrix(res)
  } else {
    res <- .Call(R_igraph_get_stochastic, graph, column.wise)
  }

  if (igraph_opt("add.vertex.names") && is_named(graph)) {
    rownames(res) <- colnames(res) <- V(graph)$name
  }

  res
}
