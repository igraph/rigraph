
## -----------------------------------------------------------------------
##
##   IGraph R package
##   Copyright (C) 2015  Gabor Csardi <csardi.gabor@gmail.com>
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
## -----------------------------------------------------------------------

#' Spectral Embedding of Adjacency Matrices
#'
#' Spectral decomposition of the adjacency matrices of graphs.
#'
#' This function computes a `no`-dimensional Euclidean representation of
#' the graph based on its adjacency matrix, \eqn{A}. This representation is
#' computed via the singular value decomposition of the adjacency matrix,
#' \eqn{A=UDV^T}.In the case, where the graph is a random dot product graph
#' generated using latent position vectors in \eqn{R^{no}} for each vertex, the
#' embedding will provide an estimate of these latent vectors.
#'
#' For undirected graphs the latent positions are calculated as
#' \eqn{X=U^{no}D^{1/2}}{U[no] sqrt(D[no])}, where \eqn{U^{no}}{U[no]} equals
#' to the first `no` columns of \eqn{U}, and \eqn{D^{1/2}}{sqrt(D[no])} is
#' a diagonal matrix containing the top `no` singular values on the
#' diagonal.
#'
#' For directed graphs the embedding is defined as the pair
#' \eqn{X=U^{no}D^{1/2}}{U[no] sqrt(D[no])} and \eqn{Y=V^{no}D^{1/2}}{V[no]
#' sqrt(D[no])}. (For undirected graphs \eqn{U=V}, so it is enough to keep one
#' of them.)
#'
#' @param graph The input graph, directed or undirected.
#' @param no An integer scalar. This value is the embedding dimension of the
#'   spectral embedding. Should be smaller than the number of vertices. The
#'   largest `no`-dimensional non-zero singular values are used for the
#'   spectral embedding.
#' @param weights Optional positive weight vector for calculating a weighted
#'   embedding. If the graph has a `weight` edge attribute, then this is
#'   used by default. In a weighted embedding, the edge weights are used instead
#'   of the binary adjacencny matrix.
#' @param which Which eigenvalues (or singular values, for directed graphs) to
#'   use. \sQuote{lm} means the ones with the largest magnitude, \sQuote{la} is
#'   the ones (algebraic) largest, and \sQuote{sa} is the (algebraic) smallest
#'   eigenvalues. The default is \sQuote{lm}. Note that for directed graphs
#'   \sQuote{la} and \sQuote{lm} are the equivalent, because the singular values
#'   are used for the ordering.
#' @param scaled Logical scalar, if `FALSE`, then \eqn{U} and \eqn{V} are
#'   returned instead of \eqn{X} and \eqn{Y}.
#' @param cvec A numeric vector, its length is the number vertices in the
#'   graph. This vector is added to the diagonal of the adjacency matrix.
#' @param options A named list containing the parameters for the SVD
#'   computation algorithm in ARPACK. By default, the list of values is assigned
#'   the values given by [arpack_defaults()].
#' @return A list containing with entries: \item{X}{Estimated latent positions,
#'   an `n` times `no` matrix, `n` is the number of vertices.}
#'   \item{Y}{`NULL` for undirected graphs, the second half of the latent
#'   positions for directed graphs, an `n` times `no` matrix, `n`
#'   is the number of vertices.} \item{D}{The eigenvalues (for undirected graphs)
#'   or the singular values (for directed graphs) calculated by the algorithm.}
#'   \item{options}{A named list, information about the underlying ARPACK
#'   computation. See [arpack()] for the details.}
#' @seealso [sample_dot_product()]
#' @references Sussman, D.L., Tang, M., Fishkind, D.E., Priebe, C.E.  A
#' Consistent Adjacency Spectral Embedding for Stochastic Blockmodel Graphs,
#' *Journal of the American Statistical Association*, Vol. 107(499), 2012
#' @keywords graphs
#' @examples
#'
#' ## A small graph
#' lpvs <- matrix(rnorm(200), 20, 10)
#' lpvs <- apply(lpvs, 2, function(x) {
#'   return(abs(x) / sqrt(sum(x^2)))
#' })
#' RDP <- sample_dot_product(lpvs)
#' embed <- embed_adjacency_matrix(RDP, 5)
#' @family embedding
#' @export
#' @cdocs igraph_adjacency_spectral_embedding
embed_adjacency_matrix <- adjacency_spectral_embedding_impl


#' Dimensionality selection for singular values using profile likelihood.
#'
#' Select the number of significant singular values, by finding the
#' \sQuote{elbow} of the scree plot, in a principled way.
#'
#' The input of the function is a numeric vector which contains the measure of
#' \sQuote{importance} for each dimension.
#'
#' For spectral embedding, these are the singular values of the adjacency
#' matrix. The singular values are assumed to be generated from a Gaussian
#' mixture distribution with two components that have different means and same
#' variance. The dimensionality \eqn{d} is chosen to maximize the likelihood
#' when the \eqn{d} largest singular values are assigned to one component of
#' the mixture and the rest of the singular values assigned to the other
#' component.
#'
#' This function can also be used for the general separation problem, where we
#' assume that the left and the right of the vector are coming from two Normal
#' distributions, with different means, and we want to know their border. See
#' examples below.
#'
#' @param sv A numeric vector, the ordered singular values.
#' @return A numeric scalar, the estimate of \eqn{d}.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @seealso [embed_adjacency_matrix()]
#' @references M. Zhu, and A. Ghodsi (2006). Automatic dimensionality selection
#' from the scree plot via the use of profile likelihood. *Computational
#' Statistics and Data Analysis*, Vol. 51, 918--930.
#' @keywords graphs
#' @examples
#'
#' # Generate the two groups of singular values with
#' # Gaussian mixture of two components that have different means
#' sing.vals <- c(rnorm(10, mean = 1, sd = 1), rnorm(10, mean = 3, sd = 1))
#' dim.chosen <- dim_select(sing.vals)
#' dim.chosen
#'
#' # Sample random vectors with multivariate normal distribution
#' # and normalize to unit length
#' lpvs <- matrix(rnorm(200), 10, 20)
#' lpvs <- apply(lpvs, 2, function(x) {
#'   (abs(x) / sqrt(sum(x^2)))
#' })
#' RDP.graph <- sample_dot_product(lpvs)
#' dim_select(embed_adjacency_matrix(RDP.graph, 10)$D)
#'
#' # Sample random vectors with the Dirichlet distribution
#' lpvs.dir <- sample_dirichlet(n = 20, rep(1, 10))
#' RDP.graph.2 <- sample_dot_product(lpvs.dir)
#' dim_select(embed_adjacency_matrix(RDP.graph.2, 10)$D)
#'
#' # Sample random vectors from hypersphere with radius 1.
#' lpvs.sph <- sample_sphere_surface(dim = 10, n = 20, radius = 1)
#' RDP.graph.3 <- sample_dot_product(lpvs.sph)
#' dim_select(embed_adjacency_matrix(RDP.graph.3, 10)$D)
#'
#' @family embedding
#' @export
#' @cdocs igraph_dim_select
dim_select <- dim_select_impl


#' Spectral Embedding of the Laplacian of a Graph
#'
#' Spectral decomposition of Laplacian matrices of graphs.
#'
#' This function computes a `no`-dimensional Euclidean representation of
#' the graph based on its Laplacian matrix, \eqn{L}. This representation is
#' computed via the singular value decomposition of the Laplacian matrix.
#'
#' They are essentially doing the same as [embed_adjacency_matrix()],
#' but work on the Laplacian matrix, instead of the adjacency matrix.
#'
#' @param graph The input graph, directed or undirected.
#' @param no An integer scalar. This value is the embedding dimension of the
#'   spectral embedding. Should be smaller than the number of vertices. The
#'   largest `no`-dimensional non-zero singular values are used for the
#'   spectral embedding.
#' @param weights Optional positive weight vector for calculating a weighted
#'   embedding. If the graph has a `weight` edge attribute, then this is
#'   used by default. For weighted embedding, edge weights are used instead
#'   of the binary adjacency matrix, and vertex strength (see
#'   [strength()]) is used instead of the degrees.
#' @param which Which eigenvalues (or singular values, for directed graphs) to
#'   use. \sQuote{lm} means the ones with the largest magnitude, \sQuote{la} is
#'   the ones (algebraic) largest, and \sQuote{sa} is the (algebraic) smallest
#'   eigenvalues. The default is \sQuote{lm}. Note that for directed graphs
#'   \sQuote{la} and \sQuote{lm} are the equivalent, because the singular values
#'   are used for the ordering.
#' @param type The type of the Laplacian to use. Various definitions exist for
#'   the Laplacian of a graph, and one can choose between them with this
#'   argument.
#'
#'   Possible values: `D-A` means \eqn{D-A} where \eqn{D} is the degree
#'   matrix and \eqn{A} is the adjacency matrix; `DAD` means
#'   \eqn{D^{1/2}}{D^1/2} times \eqn{A} times \eqn{D^{1/2}{D^1/2}},
#'   \eqn{D^{1/2}}{D^1/2} is the inverse of the square root of the degree matrix;
#'   `I-DAD` means \eqn{I-D^{1/2}}{I-D^1/2}, where \eqn{I} is the identity
#'   matrix.  `OAP` is \eqn{O^{1/2}AP^{1/2}}{O^1/2 A P^1/2}, where
#'   \eqn{O^{1/2}}{O^1/2} is the inverse of the square root of the out-degree
#'   matrix and \eqn{P^{1/2}}{P^1/2} is the same for the in-degree matrix.
#'
#'   `OAP` is not defined for undirected graphs, and is the only defined type
#'   for directed graphs.
#'
#'   The default (i.e. type `default`) is to use `D-A` for undirected
#'   graphs and `OAP` for directed graphs.
#' @param scaled Logical scalar, if `FALSE`, then \eqn{U} and \eqn{V} are
#'   returned instead of \eqn{X} and \eqn{Y}.
#' @param options A named list containing the parameters for the SVD
#'   computation algorithm in ARPACK. By default, the list of values is assigned
#'   the values given by [arpack_defaults()].
#' @return A list containing with entries: \item{X}{Estimated latent positions,
#'   an `n` times `no` matrix, `n` is the number of vertices.}
#'   \item{Y}{`NULL` for undirected graphs, the second half of the latent
#'   positions for directed graphs, an `n` times `no` matrix, `n`
#'   is the number of vertices.} \item{D}{The eigenvalues (for undirected graphs)
#'   or the singular values (for directed graphs) calculated by the algorithm.}
#'   \item{options}{A named list, information about the underlying ARPACK
#'   computation. See [arpack()] for the details.}
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @seealso [embed_adjacency_matrix()],
#' [sample_dot_product()]
#' @references Sussman, D.L., Tang, M., Fishkind, D.E., Priebe, C.E.  A
#' Consistent Adjacency Spectral Embedding for Stochastic Blockmodel Graphs,
#' *Journal of the American Statistical Association*, Vol. 107(499), 2012
#' @keywords graphs
#' @export
#' @examples
#'
#' ## A small graph
#' lpvs <- matrix(rnorm(200), 20, 10)
#' lpvs <- apply(lpvs, 2, function(x) {
#'   return(abs(x) / sqrt(sum(x^2)))
#' })
#' RDP <- sample_dot_product(lpvs)
#' embed <- embed_laplacian_matrix(RDP, 5)
#' @family embedding
#' @cdocs igraph_laplacian_spectral_embedding
embed_laplacian_matrix <- laplacian_spectral_embedding_impl


#' Sample vectors uniformly from the surface of a sphere
#'
#' Sample finite-dimensional vectors to use as latent position vectors in
#' random dot product graphs
#'
#' `sample_sphere_surface()` generates uniform samples from \eqn{S^{dim-1}}
#' (the `(dim-1)`-sphere) with radius `radius`, i.e. the Euclidean
#' norm of the samples equal `radius`.
#'
#' @param dim Integer scalar, the dimension of the random vectors.
#' @param n Integer scalar, the sample size.
#' @param radius Numeric scalar, the radius of the sphere to sample.
#' @param positive Logical scalar, whether to sample from the positive orthant
#'   of the sphere.
#' @return A `dim` (length of the `alpha` vector for
#'   `sample_dirichlet()`) times `n` matrix, whose columns are the sample
#'   vectors.
#'
#' @family latent position vector samplers
#'
#' @export
#' @examples
#' lpvs.sph <- sample_sphere_surface(dim = 10, n = 20, radius = 1)
#' RDP.graph.3 <- sample_dot_product(lpvs.sph)
#' vec.norm <- apply(lpvs.sph, 2, function(x) {
#'   sum(x^2)
#' })
#' vec.norm
sample_sphere_surface <- function(dim, n = 1, radius = 1, positive = TRUE) {
  # Argument checks
  dim <- as.numeric(dim)
  n <- as.numeric(n)
  radius <- as.numeric(radius)
  positive <- as.logical(positive)

  on.exit(.Call(R_igraph_finalizer))
  # Function call
  res <- .Call(R_igraph_sample_sphere_surface, dim, n, radius, positive)

  res
}

#' Sample vectors uniformly from the volume of a sphere
#'
#' Sample finite-dimensional vectors to use as latent position vectors in
#' random dot product graphs
#'
#' `sample_sphere_volume()` generates uniform samples from \eqn{S^{dim-1}}
#' (the `(dim-1)`-sphere) i.e. the Euclidean norm of the samples is
#' smaller or equal to `radius`.
#'
#' @param dim Integer scalar, the dimension of the random vectors.
#' @param n Integer scalar, the sample size.
#' @param radius Numeric scalar, the radius of the sphere to sample.
#' @param positive Logical scalar, whether to sample from the positive orthant
#'   of the sphere.
#' @return A `dim` (length of the `alpha` vector for
#'   `sample_dirichlet()`) times `n` matrix, whose columns are the sample
#'   vectors.
#'
#' @family latent position vector samplers
#'
#' @export
#' @examples
#' lpvs.sph.vol <- sample_sphere_volume(dim = 10, n = 20, radius = 1)
#' RDP.graph.4 <- sample_dot_product(lpvs.sph.vol)
#' vec.norm <- apply(lpvs.sph.vol, 2, function(x) {
#'   sum(x^2)
#' })
#' vec.norm
sample_sphere_volume <- function(dim, n = 1, radius = 1, positive = TRUE) {
  # Argument checks
  dim <- as.numeric(dim)
  n <- as.numeric(n)
  radius <- as.numeric(radius)
  positive <- as.logical(positive)

  on.exit(.Call(R_igraph_finalizer))
  # Function call
  res <- .Call(R_igraph_sample_sphere_volume, dim, n, radius, positive)

  res
}

#' Sample from a Dirichlet distribution
#'
#' Sample finite-dimensional vectors to use as latent position vectors in
#' random dot product graphs
#'
#' `sample_dirichlet()` generates samples from the Dirichlet distribution
#' with given \eqn{\alpha}{alpha} parameter. The sample is drawn from
#' `length(alpha)-1`-simplex.
#'
#' @param n Integer scalar, the sample size.
#' @param alpha Numeric vector, the vector of \eqn{\alpha}{alpha} parameter for
#'   the Dirichlet distribution.
#' @return A `dim` (length of the `alpha` vector for
#'   `sample_dirichlet()`) times `n` matrix, whose columns are the sample
#'   vectors.
#'
#' @family latent position vector samplers
#'
#' @export
#' @examples
#' lpvs.dir <- sample_dirichlet(n = 20, alpha = rep(1, 10))
#' RDP.graph.2 <- sample_dot_product(lpvs.dir)
#' colSums(lpvs.dir)
sample_dirichlet <- function(n, alpha) {
  # Argument checks
  n <- as.numeric(n)
  alpha <- as.numeric(alpha)

  on.exit(.Call(R_igraph_finalizer))
  # Function call
  res <- .Call(R_igraph_sample_dirichlet, n, alpha)

  res
}
