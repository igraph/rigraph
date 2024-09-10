
#' Find subgraph centrality scores of network positions
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `subgraph.centrality()` was renamed to `subgraph_centrality()` to create a more
#' consistent API.
#' @inheritParams subgraph_centrality
#' @keywords internal
#' @export
subgraph.centrality <- function(graph, diag = FALSE) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "subgraph.centrality()", "subgraph_centrality()")
  subgraph_centrality(graph = graph, diag = diag)
} # nocov end

#' The Page Rank algorithm
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `page.rank()` was renamed to `page_rank()` to create a more
#' consistent API.
#' @inheritParams page_rank
#' @keywords internal
#' @export
page.rank <- function(graph, algo = c("prpack", "arpack"), vids = V(graph), directed = TRUE, damping = 0.85, personalized = NULL, weights = NULL, options = NULL) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "page.rank()", "page_rank()")
  page_rank(graph = graph, algo = algo, vids = vids, directed = directed, damping = damping, personalized = personalized, weights = weights, options = options)
} # nocov end

#' Kleinberg's hub and authority centrality scores.
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `hub.score()` was renamed to `hub_score()` to create a more
#' consistent API.
#' @inheritParams hub_score
#' @keywords internal
#' @export
hub.score <- function(graph, scale = TRUE, weights = NULL, options = arpack_defaults()) { # nocov start
  lifecycle::deprecate_warn("2.0.0", "hub.score()", "hits_score()")
  hub_score(graph = graph, scale = scale, weights = weights, options = options)
} # nocov end

#' Kleinberg's hub and authority centrality scores.
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `authority.score()` was renamed to `authority_score()` to create a more
#' consistent API.
#' @inheritParams authority_score
#' @keywords internal
#' @export
authority.score <- function(graph, scale = TRUE, weights = NULL, options = arpack_defaults()) { # nocov start
  lifecycle::deprecate_warn("2.0.0", "authority.score()", "hits_score()")
  authority_score(graph = graph, scale = scale, weights = weights, options = options)
} # nocov end

#' Strength or weighted vertex degree
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `graph.strength()` was renamed to `strength()` to create a more
#' consistent API.
#' @inheritParams strength
#' @keywords internal
#' @export
graph.strength <- function(graph, vids = V(graph), mode = c("all", "out", "in", "total"), loops = TRUE, weights = NULL) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "graph.strength()", "strength()")
  strength(graph = graph, vids = vids, mode = mode, loops = loops, weights = weights)
} # nocov end

#' Eigenvalues and eigenvectors of the adjacency matrix of a graph
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `graph.eigen()` was renamed to `spectrum()` to create a more
#' consistent API.
#' @inheritParams spectrum
#' @keywords internal
#' @export
graph.eigen <- function(graph, algorithm = c("arpack", "auto", "lapack", "comp_auto", "comp_lapack", "comp_arpack"), which = list(), options = arpack_defaults()) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "graph.eigen()", "spectrum()")
  spectrum(graph = graph, algorithm = algorithm, which = which, options = options)
} # nocov end

#' Graph diversity
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `graph.diversity()` was renamed to `diversity()` to create a more
#' consistent API.
#' @inheritParams diversity
#' @keywords internal
#' @export
graph.diversity <- function(graph, weights = NULL, vids = V(graph)) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "graph.diversity()", "diversity()")
  diversity(graph = graph, weights = weights, vids = vids)
} # nocov end

#' Find Eigenvector Centrality Scores of Network Positions
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `evcent()` was renamed to `eigen_centrality()` to create a more
#' consistent API.
#' @inheritParams eigen_centrality
#' @keywords internal
#' @export
evcent <- function(graph, directed = FALSE, scale = TRUE, weights = NULL, options = arpack_defaults()) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "evcent()", "eigen_centrality()")
  eigen_centrality(graph = graph, directed = directed, scale = scale, weights = weights, options = options)
} # nocov end

#' Vertex and edge betweenness centrality
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `edge.betweenness()` was renamed to `edge_betweenness()` to create a more
#' consistent API.
#' @inheritParams edge_betweenness
#' @keywords internal
#' @export
edge.betweenness <- function(graph, e = E(graph), directed = TRUE, weights = NULL, cutoff = -1) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "edge.betweenness()", "edge_betweenness()")
  edge_betweenness(graph = graph, e = e, directed = directed, weights = weights, cutoff = cutoff)
} # nocov end

#' Find Bonacich Power Centrality Scores of Network Positions
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `bonpow()` was renamed to `power_centrality()` to create a more
#' consistent API.
#' @inheritParams power_centrality
#' @keywords internal
#' @export
bonpow <- function(graph, nodes = V(graph), loops = FALSE, exponent = 1, rescale = FALSE, tol = 1e-7, sparse = TRUE) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "bonpow()", "power_centrality()")
  power_centrality(graph = graph, nodes = nodes, loops = loops, exponent = exponent, rescale = rescale, tol = tol, sparse = sparse)
} # nocov end

#' Find Bonacich alpha centrality scores of network positions
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `alpha.centrality()` was renamed to `alpha_centrality()` to create a more
#' consistent API.
#' @inheritParams alpha_centrality
#' @keywords internal
#' @export
alpha.centrality <- function(graph, nodes = V(graph), alpha = 1, loops = FALSE, exo = 1, weights = NULL, tol = 1e-7, sparse = TRUE) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "alpha.centrality()", "alpha_centrality()")
  alpha_centrality(graph = graph, nodes = nodes, alpha = alpha, loops = loops, exo = exo, weights = weights, tol = tol, sparse = sparse)
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

#' Deprecated version of `betweenness()`
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' Use [`betweenness()`] with the `cutoff` argument instead.
#' @param vids The vertices for which the vertex betweenness estimation will be
#'   calculated.
#' @inheritParams betweenness
#' @keywords internal
#' @export
estimate_betweenness <- function(graph, vids = V(graph), directed = TRUE, cutoff, weights = NULL) {
  lifecycle::deprecate_soft(
    "1.6.0",
    "estimate_betweenness()",
    "betweenness()",
    details = "with the cutoff argument."
  )

  betweenness(graph, v = vids, directed = directed, cutoff = cutoff, weights = weights)
}

#' @export
betweenness.estimate <- estimate_betweenness


#' Vertex and edge betweenness centrality
#'
#' The vertex and edge betweenness are (roughly) defined by the number of
#' geodesics (shortest paths) going through a vertex or an edge.
#'
#' The vertex betweenness of vertex `v` is defined by
#'
#' \deqn{\sum_{i\ne j, i\ne v, j\ne v} g_{ivj}/g_{ij}}{sum( g_ivj / g_ij,
#' i!=j,i!=v,j!=v)}
#'
#' The edge betweenness of edge `e` is defined by
#'
#' \deqn{\sum_{i\ne j} g_{iej}/g_{ij}.}{sum( g_iej / g_ij, i!=j).}
#'
#' `betweenness()` calculates vertex betweenness, `edge_betweenness()`
#' calculates edge betweenness.
#'
#' Here \eqn{g_{ij}}{g_ij} is the total number of shortest paths between vertices
#' \eqn{i} and \eqn{j} while \eqn{g_{ivj}} is the number of those shortest paths
#' which pass though vertex \eqn{v}.
#'
#' Both functions allow you to consider only paths of length `cutoff` or
#' smaller; this can be run for larger graphs, as the running time is not
#' quadratic (if `cutoff` is small). If `cutoff` is negative (the default),
#' then the function calculates the exact betweenness scores. Since igraph 1.6.0,
#' a `cutoff` value of zero is treated literally, i.e. paths of length larger
#' than zero are ignored.
#'
#' For calculating the betweenness a similar algorithm to the one proposed by
#' Brandes (see References) is used.
#'
#' @aliases betweenness.estimate
#' @aliases edge.betweenness.estimate
#' @param graph The graph to analyze.
#' @param v The vertices for which the vertex betweenness will be calculated.
#' @param directed Logical, whether directed paths should be considered while
#'   determining the shortest paths.
#' @param weights Optional positive weight vector for calculating weighted
#'   betweenness. If the graph has a `weight` edge attribute, then this is
#'   used by default. Weights are used to calculate weighted shortest paths,
#'   so they are interpreted as distances.
#' @param normalized Logical scalar, whether to normalize the betweenness
#'   scores. If `TRUE`, then the results are normalized by the number of ordered
#'   or unordered vertex pairs in directed and undirected graphs, respectively.
#'   In an undirected graph,
#'   \deqn{B^n=\frac{2B}{(n-1)(n-2)},}{Bnorm=2 B / ((n-1)(n-2)),}
#'   where
#'   \eqn{B^n}{Bnorm} is the normalized, \eqn{B} the raw betweenness, and
#'   \eqn{n} is the number of vertices in the graph. Note that the same
#'   normalization factor is used even when setting a `cutoff` on the considered
#'   shortest path lengths, even though the number of vertex pairs reachable
#'   from each other may be less than \eqn{(n-1)(n-2)/2}.
#' @param cutoff The maximum shortest path length to consider when calculating
#'   betweenness. If negative, then there is no such limit.
#' @return A numeric vector with the betweenness score for each vertex in
#'   `v` for `betweenness()`.
#'
#'   A numeric vector with the edge betweenness score for each edge in `e`
#'   for `edge_betweenness()`.
#'
#' @note `edge_betweenness()` might give false values for graphs with
#' multiple edges.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @seealso [closeness()], [degree()], [harmonic_centrality()]
#' @references Freeman, L.C. (1979). Centrality in Social Networks I:
#' Conceptual Clarification. *Social Networks*, 1, 215-239.
#' \doi{10.1016/0378-8733(78)90021-7}
#'
#' Ulrik Brandes, A Faster Algorithm for Betweenness Centrality. *Journal
#' of Mathematical Sociology* 25(2):163-177, 2001.
#' \doi{10.1080/0022250X.2001.9990249}
#' @family centrality
#' @export
#' @keywords graphs
#' @examples
#'
#' g <- sample_gnp(10, 3 / 10)
#' betweenness(g)
#' edge_betweenness(g)
#'
betweenness <- function(graph, v = V(graph), directed = TRUE, weights = NULL,
                        normalized = FALSE, cutoff = -1) {
  ensure_igraph(graph)

  v <- as_igraph_vs(graph, v)
  directed <- as.logical(directed)
  if (is.null(weights) && "weight" %in% edge_attr_names(graph)) {
    weights <- E(graph)$weight
  }
  if (!is.null(weights) && any(!is.na(weights))) {
    weights <- as.numeric(weights)
  } else {
    weights <- NULL
  }
  cutoff <- as.numeric(cutoff)
  on.exit(.Call(R_igraph_finalizer))
  res <- .Call(R_igraph_betweenness_cutoff, graph, v - 1, directed, weights, cutoff)
  if (normalized) {
    vc <- as.numeric(vcount(graph))
    if (is_directed(graph) && directed) {
      res <- res / (vc * vc - 3 * vc + 2)
    } else {
      res <- 2 * res / (vc * vc - 3 * vc + 2)
    }
  }
  if (igraph_opt("add.vertex.names") && is_named(graph)) {
    names(res) <- V(graph)$name[v]
  }
  res
}

#' @rdname betweenness
#' @param e The edges for which the edge betweenness will be calculated.
#' @export
edge_betweenness <- function(graph, e = E(graph),
                             directed = TRUE, weights = NULL, cutoff = -1) {
  # Argument checks
  ensure_igraph(graph)

  e <- as_igraph_es(graph, e)
  directed <- as.logical(directed)
  if (is.null(weights) && "weight" %in% edge_attr_names(graph)) {
    weights <- E(graph)$weight
  }
  if (!is.null(weights) && any(!is.na(weights))) {
    weights <- as.numeric(weights)
  } else {
    weights <- NULL
  }
  cutoff <- as.numeric(cutoff)

  on.exit(.Call(R_igraph_finalizer))
  # Function call
  res <- .Call(R_igraph_edge_betweenness_cutoff, graph, directed, weights, cutoff)
  res[as.numeric(e)]
}

#' Deprecated version of `edge_betweenness()`
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' Use [`edge_betweenness()`] with the `cutoff` argument instead.
#' @inheritParams edge_betweenness
#' @keywords internal
#' @export
estimate_edge_betweenness <- function(graph, e = E(graph),
                                      directed = TRUE, cutoff, weights = NULL) {
    lifecycle::deprecate_soft(
    "1.6.0",
    "estimate_edge_betweenness()",
    "edge_betweenness()",
    details = "with the cutoff argument."
  )
  edge_betweenness(graph, e, directed = directed, cutoff = cutoff, weights = weights)
}

#' @export
edge.betweenness.estimate <- estimate_edge_betweenness

#' Closeness centrality of vertices
#'
#' Closeness centrality measures how many steps is required to access every other
#' vertex from a given vertex.
#'
#' The closeness centrality of a vertex is defined as the inverse of the
#' sum of distances to all the other vertices in the graph:
#'
#' \deqn{\frac{1}{\sum_{i\ne v} d_{vi}}}{1/sum( d(v,i), i != v)}
#'
#' If there is no (directed) path between vertex `v` and `i`, then
#' `i` is omitted from the calculation. If no other vertices are reachable
#' from `v`, then its closeness is returned as NaN.
#'
# " You may use the \code{cutoff} argument to consider only paths of length
#' `cutoff` or smaller. This can be run for larger graphs, as the running
#' time is not quadratic (if `cutoff` is small). If `cutoff` is
#' negative (which is the default), then the function calculates the exact
#' closeness scores. Since igraph 1.6.0, a `cutoff` value of zero is treated
#' literally, i.e. path with a length greater than zero are ignored.
#'
#' Closeness centrality is meaningful only for connected graphs. In disconnected
#' graphs, consider using the harmonic centrality with
#' [harmonic_centrality()]
#'
#' @aliases closeness.estimate
#' @param graph The graph to analyze.
#' @param vids The vertices for which closeness will be calculated.
#' @param mode Character string, defined the types of the paths used for
#'   measuring the distance in directed graphs. \dQuote{in} measures the paths
#'   *to* a vertex, \dQuote{out} measures paths *from* a vertex,
#'   *all* uses undirected paths. This argument is ignored for undirected
#'   graphs.
#' @param normalized Logical scalar, whether to calculate the normalized
#'   closeness, i.e. the inverse average distance to all reachable vertices.
#'   The non-normalized closeness is the inverse of the sum of distances to
#'   all reachable vertices.
#' @param weights Optional positive weight vector for calculating weighted
#'   closeness. If the graph has a `weight` edge attribute, then this is
#'   used by default. Weights are used for calculating weighted shortest
#'   paths, so they are interpreted as distances.
#' @param cutoff The maximum path length to consider when calculating the
#'   closeness. If zero or negative then there is no such limit.
#' @return Numeric vector with the closeness values of all the vertices in
#'   `v`.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @references Freeman, L.C. (1979). Centrality in Social Networks I:
#' Conceptual Clarification. *Social Networks*, 1, 215-239.
#' @family centrality
#' @export
#' @keywords graphs
#' @examples
#'
#' g <- make_ring(10)
#' g2 <- make_star(10)
#' closeness(g)
#' closeness(g2, mode = "in")
#' closeness(g2, mode = "out")
#' closeness(g2, mode = "all")
#'
closeness <- function(graph, vids = V(graph),
                      mode = c("out", "in", "all", "total"), weights = NULL,
                      normalized = FALSE, cutoff = -1) {
  # Argument checks
  ensure_igraph(graph)

  vids <- as_igraph_vs(graph, vids)
  mode <- switch(igraph.match.arg(mode),
    "out" = 1,
    "in" = 2,
    "all" = 3,
    "total" = 3
  )
  if (is.null(weights) && "weight" %in% edge_attr_names(graph)) {
    weights <- E(graph)$weight
  }
  if (!is.null(weights) && any(!is.na(weights))) {
    weights <- as.numeric(weights)
  } else {
    weights <- NULL
  }
  normalized <- as.logical(normalized)
  cutoff <- as.numeric(cutoff)

  on.exit(.Call(R_igraph_finalizer))
  # Function call
  res <- .Call(R_igraph_closeness_cutoff, graph, vids - 1, mode, weights, normalized, cutoff)$res
  if (igraph_opt("add.vertex.names") && is_named(graph)) {
    names(res) <- V(graph)$name[vids]
  }
  res
}

#' Deprecated version of `closeness()`
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' Use [`closeness()`] with the `cutoff` argument instead.
#' @inheritParams closeness
#' @keywords internal
#' @export
estimate_closeness <- function(graph, vids = V(graph), mode = c("out", "in", "all", "total"), cutoff, weights = NULL, normalized = FALSE) {

  lifecycle::deprecate_soft(
    "1.6.0",
    "estimate_closeness()",
    "closeness()",
    details = "with the cutoff argument."
  )

  closeness(graph, vids, mode = mode, weights = weights, normalized = normalized, cutoff = cutoff)
}

#' @export
closeness.estimate <- estimate_closeness
#' @rdname arpack
#' @family arpack
#' @export
arpack_defaults <- function() {
  list(
    bmat = "I", n = 0, which = "XX", nev = 1, tol = 0.0,
    ncv = 3, ldv = 0, ishift = 1, maxiter = 3000, nb = 1,
    mode = 1, start = 0, sigma = 0.0, sigmai = 0.0
  )
}

#' ARPACK eigenvector calculation
#'
#' Interface to the ARPACK library for calculating eigenvectors of sparse
#' matrices
#'
#' ARPACK is a library for solving large scale eigenvalue problems.  The
#' package is designed to compute a few eigenvalues and corresponding
#' eigenvectors of a general \eqn{n} by \eqn{n} matrix \eqn{A}. It is most
#' appropriate for large sparse or structured matrices \eqn{A} where structured
#' means that a matrix-vector product `w <- Av` requires order \eqn{n}
#' rather than the usual order \eqn{n^2} floating point operations.
#'
#' This function is an interface to ARPACK. igraph does not contain all ARPACK
#' routines, only the ones dealing with symmetric and non-symmetric eigenvalue
#' problems using double precision real numbers.
#'
#' The eigenvalue calculation in ARPACK (in the simplest case) involves the
#' calculation of the \eqn{Av} product where \eqn{A} is the matrix we work with
#' and \eqn{v} is an arbitrary vector. The function supplied in the `fun`
#' argument is expected to perform this product. If the product can be done
#' efficiently, e.g. if the matrix is sparse, then `arpack()` is usually
#' able to calculate the eigenvalues very quickly.
#'
#' The `options` argument specifies what kind of calculation to perform.
#' It is a list with the following members, they correspond directly to ARPACK
#' parameters. On input it has the following fields: \describe{
#' \item{bmat}{Character constant, possible values: \sQuote{`I`}, standard
#' eigenvalue problem, \eqn{Ax=\lambda x}{A*x=lambda*x}; and \sQuote{`G`},
#' generalized eigenvalue problem, \eqn{Ax=\lambda B x}{A*x=lambda B*x}.
#' Currently only \sQuote{`I`} is supported.} \item{n}{Numeric scalar. The
#' dimension of the eigenproblem. You only need to set this if you call
#' [arpack()] directly. (I.e. not needed for
#' [eigen_centrality()], [page_rank()], etc.)}
#' \item{which}{Specify which eigenvalues/vectors to compute, character
#' constant with exactly two characters.
#'
#' Possible values for symmetric input matrices: \describe{
#' \item{"LA"}{Compute `nev` largest (algebraic) eigenvalues.}
#' \item{"SA"}{Compute `nev` smallest (algebraic)
#' eigenvalues.} \item{"LM"}{Compute `nev` largest (in
#' magnitude) eigenvalues.} \item{"SM"}{Compute `nev` smallest
#' (in magnitude) eigenvalues.} \item{"BE"}{Compute `nev`
#' eigenvalues, half from each end of the spectrum. When `nev` is odd,
#' compute one more from the high end than from the low end.} }
#'
#' Possible values for non-symmetric input matrices: \describe{
#' \item{"LM"}{Compute `nev` eigenvalues of largest
#' magnitude.} \item{"SM"}{Compute `nev` eigenvalues of
#' smallest magnitude.} \item{"LR"}{Compute `nev` eigenvalues
#' of largest real part.} \item{"SR"}{Compute `nev`
#' eigenvalues of smallest real part.} \item{"LI"}{Compute
#' `nev` eigenvalues of largest imaginary part.}
#' \item{"SI"}{Compute `nev` eigenvalues of smallest imaginary
#' part.} }
#'
#' This parameter is sometimes overwritten by the various functions, e.g.
#' [page_rank()] always sets \sQuote{`LM`}.  }
#' \item{nev}{Numeric scalar. The number of eigenvalues to be computed.}
#' \item{tol}{Numeric scalar. Stopping criterion: the relative accuracy of the
#' Ritz value is considered acceptable if its error is less than `tol`
#' times its estimated value. If this is set to zero then machine precision is
#' used.} \item{ncv}{Number of Lanczos vectors to be generated.}
#' \item{ldv}{Numberic scalar. It should be set to zero in the current
#' implementation.} \item{ishift}{Either zero or one. If zero then the shifts
#' are provided by the user via reverse communication. If one then exact shifts
#' with respect to the reduced tridiagonal matrix \eqn{T}.  Please always set
#' this to one.} \item{maxiter}{Maximum number of Arnoldi update iterations
#' allowed. } \item{nb}{Blocksize to be used in the recurrence. Please always
#' leave this on the default value, one.} \item{mode}{The type of the
#' eigenproblem to be solved.  Possible values if the input matrix is
#' symmetric: \describe{ \item{1}{\eqn{Ax=\lambda x}{A*x=lambda*x}, \eqn{A} is
#' symmetric.} \item{2}{\eqn{Ax=\lambda Mx}{A*x=lambda*M*x}, \eqn{A} is
#' symmetric, \eqn{M} is symmetric positive definite.} \item{3}{\eqn{Kx=\lambda
#' Mx}{K*x=lambda*M*x}, \eqn{K} is symmetric, \eqn{M} is symmetric positive
#' semi-definite.} \item{4}{\eqn{Kx=\lambda KGx}{K*x=lambda*KG*x}, \eqn{K} is
#' symmetric positive semi-definite, \eqn{KG} is symmetric indefinite.}
#' \item{5}{\eqn{Ax=\lambda Mx}{A*x=lambda*M*x}, \eqn{A} is symmetric, \eqn{M}
#' is symmetric positive semi-definite. (Cayley transformed mode.)} } Please
#' note that only `mode==1` was tested and other values might not work
#' properly.
#'
#' Possible values if the input matrix is not symmetric: \describe{
#' \item{1}{\eqn{Ax=\lambda x}{A*x=lambda*x}.} \item{2}{\eqn{Ax=\lambda
#' Mx}{A*x=lambda*M*x}, \eqn{M} is symmetric positive definite.}
#' \item{3}{\eqn{Ax=\lambda Mx}{A*x=lambda*M*x}, \eqn{M} is symmetric
#' semi-definite.} \item{4}{\eqn{Ax=\lambda Mx}{A*x=lambda*M*x}, \eqn{M} is
#' symmetric semi-definite.} } Please note that only `mode==1` was tested
#' and other values might not work properly.  } \item{start}{Not used
#' currently. Later it be used to set a starting vector.} \item{sigma}{Not used
#' currently.} \item{sigmai}{Not use currently.}
#'
#' On output the following additional fields are added: \describe{
#' \item{info}{Error flag of ARPACK. Possible values: \describe{
#' \item{0}{Normal exit.} \item{1}{Maximum number of iterations taken.}
#' \item{3}{No shifts could be applied during a cycle of the Implicitly
#' restarted Arnoldi iteration. One possibility is to increase the size of
#' `ncv` relative to `nev`.} }
#'
#' ARPACK can return more error conditions than these, but they are converted
#' to regular igraph errors.  } \item{iter}{Number of Arnoldi iterations
#' taken.} \item{nconv}{Number of \dQuote{converged} Ritz values. This
#' represents the number of Ritz values that satisfy the convergence critetion.
#' } \item{numop}{Total number of matrix-vector multiplications.}
#' \item{numopb}{Not used currently.} \item{numreo}{Total number of steps of
#' re-orthogonalization.} } } Please see the ARPACK documentation for
#' additional details.
#'
#' @aliases arpack arpack-options arpack.unpack.complex
#' @aliases arpack_defaults
#' @param func The function to perform the matrix-vector multiplication. ARPACK
#'   requires to perform these by the user. The function gets the vector \eqn{x}
#'   as the first argument, and it should return \eqn{Ax}, where \eqn{A} is the
#'   \dQuote{input matrix}. (The input matrix is never given explicitly.) The
#'   second argument is `extra`.
#' @param extra Extra argument to supply to `func`.
#' @param sym Logical scalar, whether the input matrix is symmetric. Always
#'   supply `TRUE` here if it is, since it can speed up the computation.
#' @param options Options to ARPACK, a named list to overwrite some of the
#'   default option values. See details below.
#' @param env The environment in which `func` will be evaluated.
#' @param complex Whether to convert the eigenvectors returned by ARPACK into R
#'   complex vectors. By default this is not done for symmetric problems (these
#'   only have real eigenvectors/values), but only non-symmetric ones. If you
#'   have a non-symmetric problem, but you're sure that the results will be real,
#'   then supply `FALSE` here.
#' @return A named list with the following members: \item{values}{Numeric
#'   vector, the desired eigenvalues.} \item{vectors}{Numeric matrix, the desired
#'   eigenvectors as columns. If `complex=TRUE` (the default for
#'   non-symmetric problems), then the matrix is complex.} \item{options}{A named
#'   list with the supplied `options` and some information about the
#'   performed calculation, including an ARPACK exit code. See the details above.
#'   }
#' @author Rich Lehoucq, Kristi Maschhoff, Danny Sorensen, Chao Yang for
#' ARPACK, Gabor Csardi \email{csardi.gabor@@gmail.com} for the R interface.
#' @seealso [eigen_centrality()], [page_rank()],
#' [hub_score()], [cluster_leading_eigen()] are some of the
#' functions in igraph that use ARPACK.
#' @references D.C. Sorensen, Implicit Application of Polynomial Filters in a
#' k-Step Arnoldi Method. *SIAM J. Matr. Anal. Apps.*, 13 (1992), pp
#' 357-385.
#'
#' R.B. Lehoucq, Analysis and Implementation of an Implicitly Restarted Arnoldi
#' Iteration. *Rice University Technical Report* TR95-13, Department of
#' Computational and Applied Mathematics.
#'
#' B.N. Parlett & Y. Saad, Complex Shift and Invert Strategies for Real
#' Matrices. *Linear Algebra and its Applications*, vol 88/89, pp 575-595,
#' (1987).
#' @keywords graphs
#' @examples
#'
#' # Identity matrix
#' f <- function(x, extra = NULL) x
#' arpack(f, options = list(n = 10, nev = 2, ncv = 4), sym = TRUE)
#'
#' # Graph laplacian of a star graph (undirected), n>=2
#' # Note that this is a linear operation
#' f <- function(x, extra = NULL) {
#'   y <- x
#'   y[1] <- (length(x) - 1) * x[1] - sum(x[-1])
#'   for (i in 2:length(x)) {
#'     y[i] <- x[i] - x[1]
#'   }
#'   y
#' }
#'
#' arpack(f, options = list(n = 10, nev = 1, ncv = 3), sym = TRUE)
#'
#' # double check
#' eigen(laplacian_matrix(make_star(10, mode = "undirected")))
#'
#' ## First three eigenvalues of the adjacency matrix of a graph
#' ## We need the 'Matrix' package for this
#' if (require(Matrix)) {
#'   set.seed(42)
#'   g <- sample_gnp(1000, 5 / 1000)
#'   M <- as_adj(g, sparse = TRUE)
#'   f2 <- function(x, extra = NULL) {
#'     cat(".")
#'     as.vector(M %*% x)
#'   }
#'   baev <- arpack(f2, sym = TRUE, options = list(
#'     n = vcount(g), nev = 3, ncv = 8,
#'     which = "LM", maxiter = 2000
#'   ))
#' }
#' @family arpack
#' @export
arpack <- function(func, extra = NULL, sym = FALSE, options = arpack_defaults(),
                   env = parent.frame(), complex = !sym) {

  if (is.function(options)) {
    lifecycle::deprecate_soft(
      "1.6.0",
      "arpack(options = 'must be a list')",
      details = c("`arpack_defaults()` is now a function, use `options = arpack_defaults()` instead of `options = arpack_defaults`.")
    )
    options <- options()
  }

  if (!is.list(options) ||
    (is.null(names(options)) && length(options) != 0)) {
    stop("options must be a named list")
  }
  if (any(names(options) == "")) {
    stop("all options must be named")
  }

  defaults <- arpack_defaults()
  if (any(!names(options) %in% names(defaults))) {
    stop(
      "unkown ARPACK option(s): ",
      paste(setdiff(names(options), names(defaults)),
        collapse = ", "
      )
    )
  }

  options <- modify_list(defaults, options)

  if (sym && complex) {
    complex <- FALSE
    warning("Symmetric matrix, setting `complex' to FALSE")
  }

  on.exit(.Call(R_igraph_finalizer))
  res <- .Call(R_igraph_arpack, func, extra, options, env, sym)

  if (complex) {
    rew <- arpack.unpack.complex(
      res$vectors, res$values,
      min(res$options$nev, res$options$nconv)
    )
    res$vectors <- rew$vectors
    res$values <- rew$values

    res$values <- apply(res$values, 1, function(x) x[1] + x[2] * 1i)
    dim(res$vectors) <- c(nrow(res$vectors) * 2, ncol(res$vectors) / 2)
    res$vectors <- apply(res$vectors, 2, function(x) {
      l <- length(x) / 2
      x[1:l] + x[(l + 1):length(x)] * 1i
    })
  } else {
    if (is.matrix(res$values)) {
      if (!all(res$values[, 2] == 0)) {
        warning("Dropping imaginary parts of eigenvalues")
      }
      res$values <- res$values[, 1]
    }
    res$vectors <- res$vectors[, 1:length(res$values)]
  }

  res
}

arpack.unpack.complex <- function(vectors, values, nev) {
  # Argument checks
  vectors[] <- as.numeric(vectors)
  values[] <- as.numeric(values)
  nev <- as.numeric(nev)

  on.exit(.Call(R_igraph_finalizer))
  # Function call
  res <- .Call(R_igraph_arpack_unpack_complex, vectors, values, nev)

  res
}



#' Find subgraph centrality scores of network positions
#'
#' Subgraph centrality of a vertex measures the number of subgraphs a vertex
#' participates in, weighting them according to their size.
#'
#' The subgraph centrality of a vertex is defined as the number of closed walks
#' originating at the vertex, where longer walks are downweighted by the
#' factorial of their length.
#'
#' Currently the calculation is performed by explicitly calculating all
#' eigenvalues and eigenvectors of the adjacency matrix of the graph. This
#' effectively means that the measure can only be calculated for small graphs.
#'
#' @param graph The input graph. It will be treated as undirected.
#' @param diag Boolean scalar, whether to include the diagonal of the adjacency
#'   matrix in the analysis. Giving `FALSE` here effectively eliminates the
#'   loops edges from the graph before the calculation.
#' @return A numeric vector, the subgraph centrality scores of the vertices.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com} based on the Matlab
#' code by Ernesto Estrada
#' @seealso [eigen_centrality()], [page_rank()]
#' @references Ernesto Estrada, Juan A. Rodriguez-Velazquez: Subgraph
#' centrality in Complex Networks. *Physical Review E* 71, 056103 (2005).
#' @family centrality
#' @export
#' @keywords graphs
#' @examples
#'
#' g <- sample_pa(100, m = 4, dir = FALSE)
#' sc <- subgraph_centrality(g)
#' cor(degree(g), sc)
#'
subgraph_centrality <- function(graph, diag = FALSE) {
  A <- as_adj(graph)
  if (!diag) {
    diag(A) <- 0
  }
  # Ignore edge directions in directed graphs
  if (is_directed(graph)) {
    A <- A + Matrix::t(A)
  }
  # This calls lapack and creates a dense matrix, but accepts the sparse matrix A
  # We can choose to convert A to a dense matrix right away, but it doesn't matter
  eig <- eigen(A, symmetric = TRUE)
  res <- as.vector(eig$vectors^2 %*% exp(eig$values))
  if (igraph_opt("add.vertex.names") && is_named(graph)) {
    names(res) <- vertex_attr(graph, "name")
  }
  res
}


#' Eigenvalues and eigenvectors of the adjacency matrix of a graph
#'
#' Calculate selected eigenvalues and eigenvectors of a (supposedly sparse)
#' graph.
#'
#' The `which` argument is a list and it specifies which eigenvalues and
#' corresponding eigenvectors to calculate: There are eight options:
#' \enumerate{ \item Eigenvalues with the largest magnitude. Set `pos` to
#' `LM`, and `howmany` to the number of eigenvalues you want.  \item
#' Eigenvalues with the smallest magnitude. Set `pos` to `SM` and
#' `howmany` to the number of eigenvalues you want.  \item Largest
#' eigenvalues. Set `pos` to `LA` and `howmany` to the number of
#' eigenvalues you want.  \item Smallest eigenvalues. Set `pos` to
#' `SA` and `howmany` to the number of eigenvalues you want.  \item
#' Eigenvalues from both ends of the spectrum. Set `pos` to `BE` and
#' `howmany` to the number of eigenvalues you want. If `howmany` is
#' odd, then one more eigenvalue is returned from the larger end.  \item
#' Selected eigenvalues. This is not (yet) implemented currently.  \item
#' Eigenvalues in an interval. This is not (yet) implemented.  \item All
#' eigenvalues. This is not implemented yet. The standard `eigen` function
#' does a better job at this, anyway.  }
#'
#' Note that ARPACK might be unstable for graphs with multiple components, e.g.
#' graphs with isolate vertices.
#'
#' @aliases spectrum igraph.eigen.default
#' @param graph The input graph, can be directed or undirected.
#' @param algorithm The algorithm to use. Currently only `arpack` is
#'   implemented, which uses the ARPACK solver. See also [arpack()].
#' @param which A list to specify which eigenvalues and eigenvectors to
#'   calculate. By default the leading (i.e. largest magnitude) eigenvalue and
#'   the corresponding eigenvector is calculated.
#' @param options Options for the ARPACK solver. See
#'   [arpack_defaults()].
#' @return Depends on the algorithm used.
#'
#'   For `arpack` a list with three entries is returned: \item{options}{See
#'   the return value for `arpack()` for a complete description.}
#'   \item{values}{Numeric vector, the eigenvalues.} \item{vectors}{Numeric
#'   matrix, with the eigenvectors as columns.}
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @seealso [as_adj()] to create a (sparse) adjacency matrix.
#' @keywords graphs
#' @examples
#'
#' ## Small example graph, leading eigenvector by default
#' kite <- make_graph("Krackhardt_kite")
#' spectrum(kite)[c("values", "vectors")]
#'
#' ## Double check
#' eigen(as_adj(kite, sparse = FALSE))$vectors[, 1]
#'
#' ## Should be the same as 'eigen_centrality' (but rescaled)
#' cor(eigen_centrality(kite)$vector, spectrum(kite)$vectors)
#'
#' ## Smallest eigenvalues
#' spectrum(kite, which = list(pos = "SM", howmany = 2))$values
#'
#' @family centrality
#' @export
spectrum <- function(graph, algorithm=c("arpack", "auto", "lapack", "comp_auto", "comp_lapack", "comp_arpack"), which=list(), options=arpack_defaults()) {
  if (is.function(options)) {
    lifecycle::deprecate_soft(
      "1.6.0",
      "spectrum(options = 'must be a list')",
      details = c("`arpack_defaults()` is now a function, use `options = arpack_defaults()` instead of `options = arpack_defaults`.")
    )
    options <- options()
  }

  eigen_adjacency_impl(graph,
                       algorithm = algorithm,
                       which = which,
                       options = options)
}

eigen_defaults <- function() {
  list(
    pos = "LM", howmany = 1L, il = -1L, iu = -1L,
    vl = -Inf, vu = Inf, vestimate = 0L,
    balance = "none"
  )
}

#' Eigenvector centrality of vertices
#'
#' `eigen_centrality()` takes a graph (`graph`) and returns the
#' eigenvector centralities of the vertices `v` within it.
#'
#' Eigenvector centrality scores correspond to the values of the principal
#' eigenvector of the graph's adjacency matrix; these scores may, in turn, be
#' interpreted as arising from a reciprocal process in which the centrality of
#' each actor is proportional to the sum of the centralities of those actors to
#' whom he or she is connected.  In general, vertices with high eigenvector
#' centralities are those which are connected to many other vertices which are,
#' in turn, connected to many others (and so on).  The perceptive may realize
#' that this implies that the largest values will be obtained by individuals in
#' large cliques (or high-density substructures).  This is also intelligible
#' from an algebraic point of view, with the first eigenvector being closely
#' related to the best rank-1 approximation of the adjacency matrix (a
#' relationship which is easy to see in the special case of a diagonalizable
#' symmetric real matrix via the \eqn{SLS^-1}{$S \Lambda S^{-1}$}
#' decomposition).
#'
#' The adjacency matrix used in the eigenvector centrality calculation assumes
#' that loop edges are counted *twice* in undirected graphs; this is because
#' each loop edge has *two* endpoints that are both connected to the same vertex,
#' and you could traverse the loop edge via either endpoint.
#'
#' In the directed case, the left eigenvector of the adjacency matrix is
#' calculated. In other words, the centrality of a vertex is proportional to
#' the sum of centralities of vertices pointing to it.
#'
#' Eigenvector centrality is meaningful only for (strongly) connected graphs.
#' Undirected graphs that are not connected should be decomposed into connected
#' components, and the eigenvector centrality calculated for each separately.
#' This function does not verify that the graph is connected. If it is not, in
#' the undirected case the scores of all but one component will be zeros.
#'
#' Also note that the adjacency matrix of a directed acyclic graph or the
#' adjacency matrix of an empty graph does not possess positive eigenvalues,
#' therefore the eigenvector centrality is not defined for these graphs.
#' igraph will return an eigenvalue of zero in such cases. The eigenvector
#' centralities will all be equal for an empty graph and will all be zeros for
#' a directed acyclic graph. Such pathological cases can be detected by checking
#' whether the eigenvalue is very close to zero.
#'
#' From igraph version 0.5 this function uses ARPACK for the underlying
#' computation, see [arpack()] for more about ARPACK in igraph.
#'
#' @param graph Graph to be analyzed.
#' @param directed Logical scalar, whether to consider direction of the edges
#'   in directed graphs. It is ignored for undirected graphs.
#' @param scale Logical scalar, whether to scale the result to have a maximum
#'   score of one. If no scaling is used then the result vector has unit length
#'   in the Euclidean norm.
#' @param weights A numerical vector or `NULL`. This argument can be used
#'   to give edge weights for calculating the weighted eigenvector centrality of
#'   vertices. If this is `NULL` and the graph has a `weight` edge
#'   attribute then that is used. If `weights` is a numerical vector then it is
#'   used, even if the graph has a `weight` edge attribute. If this is
#'   `NA`, then no edge weights are used (even if the graph has a
#'   `weight` edge attribute). Note that if there are negative edge weights
#'   and the direction of the edges is considered, then the eigenvector might be
#'   complex. In this case only the real part is reported.
#'   This function interprets weights as connection strength. Higher
#'   weights spread the centrality better.
#' @param options A named list, to override some ARPACK options. See
#'   [arpack()] for details.
#' @return A named list with components: \item{vector}{A vector containing the
#'   centrality scores.} \item{value}{The eigenvalue corresponding to the
#'   calculated eigenvector, i.e. the centrality scores.} \item{options}{A named
#'   list, information about the underlying ARPACK computation. See
#'   [arpack()] for the details.}
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com} and Carter T. Butts
#' (<http://www.faculty.uci.edu/profile.cfm?faculty_id=5057>) for the
#' manual page.
#' @references Bonacich, P.  (1987).  Power and Centrality: A Family of
#' Measures. *American Journal of Sociology*, 92, 1170-1182.
#' @keywords graphs
#' @examples
#'
#' # Generate some test data
#' g <- make_ring(10, directed = FALSE)
#' # Compute eigenvector centrality scores
#' eigen_centrality(g)
#' @family centrality
#' @export
#' @cdocs igraph_eigenvector_centrality
eigen_centrality <- function(graph,
                             directed = FALSE,
                             scale = TRUE,
                             weights = NULL,
                             options = arpack_defaults()) {

  if (is.function(options)) {
    lifecycle::deprecate_soft(
      "1.6.0",
      "eigen_centrality(options = 'must be a list')",
      details = c("`arpack_defaults()` is now a function, use `options = arpack_defaults()` instead of `options = arpack_defaults`.")
    )
    options <- options()
  }

  eigenvector_centrality_impl(graph = graph,
                              directed = directed,
                              scale = scale,
                              weights = weights,
                              options = options)
}

#' Strength or weighted vertex degree
#'
#' Summing up the edge weights of the adjacent edges for each vertex.
#'
#'
#' @param graph The input graph.
#' @param vids The vertices for which the strength will be calculated.
#' @param mode Character string, \dQuote{out} for out-degree, \dQuote{in} for
#'   in-degree or \dQuote{all} for the sum of the two. For undirected graphs this
#'   argument is ignored.
#' @param loops Logical; whether the loop edges are also counted.
#' @param weights Weight vector. If the graph has a `weight` edge
#'   attribute, then this is used by default. If the graph does not have a
#'   `weight` edge attribute and this argument is `NULL`, then a
#'   [degree()] is called. If this is `NA`, then no edge weights are used
#'   (even if the graph has a `weight` edge attribute).
#' @return A numeric vector giving the strength of the vertices.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @seealso [degree()] for the unweighted version.
#' @references Alain Barrat, Marc Barthelemy, Romualdo Pastor-Satorras,
#' Alessandro Vespignani: The architecture of complex weighted networks, Proc.
#' Natl. Acad. Sci. USA 101, 3747 (2004)
#' @keywords graphs
#' @examples
#'
#' g <- make_star(10)
#' E(g)$weight <- seq(ecount(g))
#' strength(g)
#' strength(g, mode = "out")
#' strength(g, mode = "in")
#'
#' # No weights
#' g <- make_ring(10)
#' strength(g)
#' @family centrality
#' @export
#' @cdocs igraph_strength
strength <- strength_impl


#' Graph diversity
#'
#' Calculates a measure of diversity for all vertices.
#'
#' The diversity of a vertex is defined as the (scaled) Shannon entropy of the
#' weights of its incident edges:
#' \deqn{D(i)=\frac{H(i)}{\log k_i}}{D(i)=H(i)/log(k[i])}
#' and
#' \deqn{H(i)=-\sum_{j=1}^{k_i} p_{ij}\log p_{ij},}{H(i) =
#'   -sum(p[i,j] log(p[i,j]), j=1..k[i]),} where
#' \deqn{p_{ij}=\frac{w_{ij}}{\sum_{l=1}^{k_i}}V_{il},}{p[i,j] = w[i,j] /
#' sum(w[i,l], l=1..k[i]),} and \eqn{k_i}{k[i]} is the (total) degree of vertex
#' \eqn{i}, \eqn{w_{ij}}{w[i,j]} is the weight of the edge(s) between vertices
#' \eqn{i} and \eqn{j}.
#'
#' For vertices with degree less than two the function returns `NaN`.
#'
#' @param graph The input graph. Edge directions are ignored.
#' @param weights `NULL`, or the vector of edge weights to use for the
#'   computation. If `NULL`, then the \sQuote{weight} attibute is used. Note
#'   that this measure is not defined for unweighted graphs.
#' @param vids The vertex ids for which to calculate the measure.
#' @return A numeric vector, its length is the number of vertices.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @references Nathan Eagle, Michael Macy and Rob Claxton: Network Diversity
#' and Economic Development, *Science* **328**, 1029--1031, 2010.
#' @keywords graphs
#' @examples
#'
#' g1 <- sample_gnp(20, 2 / 20)
#' g2 <- sample_gnp(20, 2 / 20)
#' g3 <- sample_gnp(20, 5 / 20)
#' E(g1)$weight <- 1
#' E(g2)$weight <- runif(ecount(g2))
#' E(g3)$weight <- runif(ecount(g3))
#' diversity(g1)
#' diversity(g2)
#' diversity(g3)
#' @family centrality
#' @export
#' @cdocs igraph_diversity
diversity <- diversity_impl


#' Kleinberg's hub and authority centrality scores.
#'
#' The hub scores of the vertices are defined as the principal eigenvector
#' of \eqn{A A^T}{A*t(A)}, where \eqn{A} is the adjacency matrix of the
#' graph.
#'
#' Similarly, the authority scores of the vertices are defined as the principal
#' eigenvector of \eqn{A^T A}{t(A)*A}, where \eqn{A} is the adjacency matrix of
#' the graph.
#'
#' For undirected matrices the adjacency matrix is symmetric and the hub
#' scores are the same as authority scores.
#'
#' @param graph The input graph.
#' @param scale Logical scalar, whether to scale the result to have a maximum
#'   score of one. If no scaling is used then the result vector has unit length
#'   in the Euclidean norm.
#' @param weights Optional positive weight vector for calculating weighted
#'   scores. If the graph has a `weight` edge attribute, then this is used
#'   by default.
#'   This function interprets edge weights as connection strengths. In the
#'   random surfer model, an edge with a larger weight is more likely to be
#'   selected by the surfer.
#' @param options A named list, to override some ARPACK options. See
#'   [arpack()] for details.
#' @inheritParams rlang::args_dots_empty
#' @return A named list with members:
#'   \item{hub}{The hub score of the vertices.}
#'   \item{authority}{The authority score of the vertices.}
#'   \item{value}{The corresponding eigenvalue of the calculated
#'     principal eigenvector.}
#'   \item{options}{Some information about the ARPACK computation, it has
#'     the same members as the `options` member returned
#'     by [arpack()], see that for documentation.}
#' @seealso [eigen_centrality()] for eigenvector centrality,
#' [page_rank()] for the Page Rank scores. [arpack()] for
#' the underlining machinery of the computation.
#' @references J. Kleinberg. Authoritative sources in a hyperlinked
#' environment. *Proc. 9th ACM-SIAM Symposium on Discrete Algorithms*,
#' 1998. Extended version in *Journal of the ACM* 46(1999). Also appears
#' as IBM Research Report RJ 10076, May 1997.
#'
#' @export
#' @examples
#' ## An in-star
#' g <- make_star(10)
#' hits_scores(g)
#'
#' ## A ring
#' g2 <- make_ring(10)
#' hits_scores(g2)
#' @family centrality
#' @cdocs igraph_hub_and_authority_scores
hits_scores <- function(graph, ..., scale=TRUE, weights=NULL, options=arpack_defaults()) {

  rlang::check_dots_empty()

  hub_and_authority_scores_impl(graph = graph,
    scale = scale,
    weights = weights,
    options = options)
}

#' @title Kleinberg's authority centrality scores.
#' @rdname hub_score
#' @param options A named list, to override some ARPACK options. See
#'   [arpack()] for details.
#' @export
authority_score <- function(graph, scale=TRUE, weights=NULL, options=arpack_defaults()) {
  lifecycle::deprecate_soft("2.0.4", "authority_score()", "hits_scores()")
  if (is.function(options)) {
    lifecycle::deprecate_soft(
      "1.6.0",
      I("arpack_defaults"),
      "arpack_defaults()",
      details = c("So the function arpack_defaults(), not an object called arpack_defaults.")
    )
    options <- arpack_defaults()
  }

  scores <- hits_scores(
    graph = graph,
    scale = scale,
    weights = weights,
    options = options)
  scores$hub <- NULL
  rlang::set_names(scores, c("vector", "value", "options"))
}

#' @title Kleinberg's hub centrality scores.
#' @rdname hub_score
#' @param graph The input graph.
#' @param scale Logical scalar, whether to scale the result to have a maximum
#'   score of one. If no scaling is used then the result vector has unit length
#'   in the Euclidean norm.
#' @param weights Optional positive weight vector for calculating weighted
#'   scores. If the graph has a `weight` edge attribute, then this is used
#'   by default.
#'   This function interprets edge weights as connection strengths. In the
#'   random surfer model, an edge with a larger weight is more likely to be
#'   selected by the surfer.
#' @param options A named list, to override some ARPACK options. See
#'   [arpack()] for details.
#' @family centrality
#' @export
hub_score <- function(graph, scale=TRUE, weights=NULL, options=arpack_defaults()) {
  lifecycle::deprecate_soft("2.0.3", "hub_score()", "hits_scores()")
  if (is.function(options)) {
    lifecycle::deprecate_soft(
      "1.6.0",
      I("arpack_defaults"),
      "arpack_defaults()",
      details = c("So the function arpack_defaults(), not an object called arpack_defaults.")
    )
    options <- arpack_defaults()
  }

  scores <- hits_scores(
    graph = graph,
    scale = scale,
    weights = weights,
    options = options)
  scores$authority <- NULL
  rlang::set_names(scores, c("vector", "value", "options"))
}

#' The Page Rank algorithm
#'
#' Calculates the Google PageRank for the specified vertices.
#'
#' For the explanation of the PageRank algorithm, see the following webpage:
#' <http://infolab.stanford.edu/~backrub/google.html>, or the following
#' reference:
#'
#' Sergey Brin and Larry Page: The Anatomy of a Large-Scale Hypertextual Web
#' Search Engine. Proceedings of the 7th World-Wide Web Conference, Brisbane,
#' Australia, April 1998.
#'
#' The `page_rank()` function can use either the PRPACK library or ARPACK
#' (see [arpack()]) to perform the calculation.
#'
#' Please note that the PageRank of a given vertex depends on the PageRank of
#' all other vertices, so even if you want to calculate the PageRank for only
#' some of the vertices, all of them must be calculated. Requesting the
#' PageRank for only some of the vertices does not result in any performance
#' increase at all.
#'
#' @param graph The graph object.
#' @param algo Character scalar, which implementation to use to carry out the
#'   calculation. The default is `"prpack"`, which uses the PRPACK library
#'   (<https://github.com/dgleich/prpack>) to calculate PageRank scores
#'   by solving a set of linear equations. This is a new implementation in igraph
#'   version 0.7, and the suggested one, as it is the most stable and the fastest
#'   for all but small graphs.  `"arpack"` uses the ARPACK library, the
#'   default implementation from igraph version 0.5 until version 0.7. It computes
#'   PageRank scores by solving an eingevalue problem.
#' @param vids The vertices of interest.
#' @param directed Logical, if true directed paths will be considered for
#'   directed graphs. It is ignored for undirected graphs.
#' @param damping The damping factor (\sQuote{d} in the original paper).
#' @param personalized Optional vector giving a probability distribution to
#'   calculate personalized PageRank. For personalized PageRank, the probability
#'   of jumping to a node when abandoning the random walk is not uniform, but it
#'   is given by this vector. The vector should contains an entry for each vertex
#'   and it will be rescaled to sum up to one.
#' @param weights A numerical vector or `NULL`. This argument can be used
#'   to give edge weights for calculating the weighted PageRank of vertices. If
#'   this is `NULL` and the graph has a `weight` edge attribute then
#'   that is used. If `weights` is a numerical vector then it used, even if
#'   the graph has a `weights` edge attribute. If this is `NA`, then no
#'   edge weights are used (even if the graph has a `weight` edge attribute.
#'   This function interprets edge weights as connection strengths. In the
#'   random surfer model, an edge with a larger weight is more likely to be
#'   selected by the surfer.
#' @param options A named list, to override some ARPACK options. See
#'   [arpack()] for details. This argument is ignored if the PRPACK
#'   implementation is used.
#' @return A named list with entries: \item{vector}{A
#'   numeric vector with the PageRank scores.} \item{value}{When using the ARPACK
#'   method, the eigenvalue corresponding to the eigenvector with the PageRank scores
#'   is returned here. It is expected to be exactly one, and can be used to check
#'   that ARPACK has successfully converged to the expected eingevector. When using
#'   the PRPACK method, it is always set to 1.0.} \item{options}{Some information
#'   about the underlying ARPACK calculation. See [arpack()] for details.
#'   This entry is `NULL` if not the ARPACK implementation was used.}
#'
#' @author Tamas Nepusz \email{ntamas@@gmail.com} and Gabor Csardi
#' \email{csardi.gabor@@gmail.com}
#' @seealso Other centrality scores: [closeness()],
#' [betweenness()], [degree()]
#' @references Sergey Brin and Larry Page: The Anatomy of a Large-Scale
#' Hypertextual Web Search Engine. Proceedings of the 7th World-Wide Web
#' Conference, Brisbane, Australia, April 1998.
#' @keywords graphs
#' @examples
#'
#' g <- sample_gnp(20, 5 / 20, directed = TRUE)
#' page_rank(g)$vector
#'
#' g2 <- make_star(10)
#' page_rank(g2)$vector
#'
#' # Personalized PageRank
#' g3 <- make_ring(10)
#' page_rank(g3)$vector
#' reset <- seq(vcount(g3))
#' page_rank(g3, personalized = reset)$vector
#' @family centrality
#' @export
#' @cdocs igraph_personalized_pagerank
page_rank <- personalized_pagerank_impl

#' Harmonic centrality of vertices
#'
#' The harmonic centrality of a vertex is the mean inverse distance to all other
#' vertices. The inverse distance to an unreachable vertex is considered to be zero.
#'
#' The `cutoff` argument can be used to restrict the calculation to paths
#' of length `cutoff` or smaller only; this can be used for larger graphs
#' to speed up the calculation. If `cutoff` is negative (which is the
#' default), then the function calculates the exact harmonic centrality scores.
#'
#' @param graph The graph to analyze.
#' @param vids The vertices for which harmonic centrality will be calculated.
#' @param mode Character string, defining the types of the paths used for
#'   measuring the distance in directed graphs. \dQuote{out} follows paths along
#'   the edge directions only, \dQuote{in} traverses the edges in reverse, while
#'   \dQuote{all} ignores edge directions. This argument is ignored for undirected
#'   graphs.
#' @param normalized Logical scalar, whether to calculate the normalized
#'   harmonic centrality. If true, the result is the mean inverse path length to
#'   other vertices, i.e. it is normalized by the number of vertices minus one.
#'   If false, the result is the sum of inverse path lengths to other vertices.
#' @param weights Optional positive weight vector for calculating weighted
#'   harmonic centrality. If the graph has a `weight` edge attribute, then
#'   this is used by default. Weights are used for calculating weighted shortest
#'   paths, so they are interpreted as distances.
#' @param cutoff The maximum path length to consider when calculating the
#'   harmonic centrality. There is no such limit when the cutoff is negative. Note that
#'   zero cutoff means that only paths of at most length 0 are considered.
#' @return Numeric vector with the harmonic centrality scores of all the vertices in
#'   `v`.
#' @seealso [betweenness()], [closeness()]
#' @references M. Marchiori and V. Latora, Harmony in the small-world,
#' *Physica A* 285, pp. 539-546 (2000).
#' @family centrality
#' @export
#' @keywords graphs
#' @examples
#'
#' g <- make_ring(10)
#' g2 <- make_star(10)
#' harmonic_centrality(g)
#' harmonic_centrality(g2, mode = "in")
#' harmonic_centrality(g2, mode = "out")
#' harmonic_centrality(g %du% make_full_graph(5), mode = "all")
#'
#' @cdocs igraph_harmonic_centrality_cutoff
harmonic_centrality <- harmonic_centrality_cutoff_impl



bonpow.dense <- function(graph, nodes = V(graph),
                         loops = FALSE, exponent = 1,
                         rescale = FALSE, tol = 1e-7) {
  ensure_igraph(graph)

  d <- as_adj(graph)
  if (!loops) {
    diag(d) <- 0
  }
  n <- vcount(graph)
  id <- matrix(0, nrow = n, ncol = n)
  diag(id) <- 1

  #  ev <- apply(solve(id-exponent*d,tol=tol)%*%d,1,sum)
  ev <- solve(id - exponent * d, tol = tol) %*% apply(d, 1, sum)
  if (rescale) {
    ev <- ev / sum(ev)
  } else {
    ev <- ev * sqrt(n / sum((ev)^2))
  }
  ev[as.numeric(nodes)]
}

bonpow.sparse <- function(graph, nodes = V(graph), loops = FALSE,
                          exponent = 1, rescale = FALSE, tol = 1e-07) {
  ## remove loops if requested
  if (!loops) {
    graph <- simplify(graph, remove.multiple = FALSE, remove.loops = TRUE)
  }

  vg <- vcount(graph)

  ## sparse adjacency matrix
  d <- as_adj(graph, sparse = TRUE)

  ## sparse identity matrix
  id <- as(Matrix::Matrix(diag(vg), doDiag = FALSE), "generalMatrix")

  ## solve it
  ev <- Matrix::solve(id - exponent * d, degree(graph, mode = "out"), tol = tol)

  if (rescale) {
    ev <- ev / sum(ev)
  } else {
    ev <- ev * sqrt(vcount(graph) / sum((ev)^2))
  }

  ev[as.numeric(nodes)]
}



#' Find Bonacich Power Centrality Scores of Network Positions
#'
#' `power_centrality()` takes a graph (`dat`) and returns the Boncich power
#' centralities of positions (selected by `nodes`).  The decay rate for
#' power contributions is specified by `exponent` (1 by default).
#'
#' Bonacich's power centrality measure is defined by
#' \eqn{C_{BP}\left(\alpha,\beta\right)=\alpha\left(\mathbf{I}-\beta\mathbf{A}\right)^{-1}\mathbf{A}\mathbf{1}}{C_BP(alpha,beta)=alpha
#' (I-beta A)^-1 A 1}, where \eqn{\beta}{beta} is an attenuation parameter (set
#' here by `exponent`) and \eqn{\mathbf{A}}{A} is the graph adjacency
#' matrix.  (The coefficient \eqn{\alpha}{alpha} acts as a scaling parameter,
#' and is set here (following Bonacich (1987)) such that the sum of squared
#' scores is equal to the number of vertices.  This allows 1 to be used as a
#' reference value for the ``middle'' of the centrality range.)  When
#' \eqn{\beta \rightarrow }{beta->1/lambda_A1}\eqn{
#' 1/\lambda_{\mathbf{A}1}}{beta->1/lambda_A1} (the reciprocal of the largest
#' eigenvalue of \eqn{\mathbf{A}}{A}), this is to within a constant multiple of
#' the familiar eigenvector centrality score; for other values of \eqn{\beta},
#' the behavior of the measure is quite different.  In particular, \eqn{\beta}
#' gives positive and negative weight to even and odd walks, respectively, as
#' can be seen from the series expansion
#' \eqn{C_{BP}\left(\alpha,\beta\right)=\alpha \sum_{k=0}^\infty \beta^k
#' }{C_BP(alpha,beta) = alpha sum( beta^k A^(k+1) 1, k in 0..infinity )}\eqn{
#' \mathbf{A}^{k+1} \mathbf{1}}{C_BP(alpha,beta) = alpha sum( beta^k A^(k+1) 1,
#' k in 0..infinity )} which converges so long as \eqn{|\beta|
#' }{|beta|<1/lambda_A1}\eqn{ < 1/\lambda_{\mathbf{A}1}}{|beta|<1/lambda_A1}.
#' The magnitude of \eqn{\beta}{beta} controls the influence of distant actors
#' on ego's centrality score, with larger magnitudes indicating slower rates of
#' decay.  (High rates, hence, imply a greater sensitivity to edge effects.)
#'
#' Interpretively, the Bonacich power measure corresponds to the notion that
#' the power of a vertex is recursively defined by the sum of the power of its
#' alters.  The nature of the recursion involved is then controlled by the
#' power exponent: positive values imply that vertices become more powerful as
#' their alters become more powerful (as occurs in cooperative relations),
#' while negative values imply that vertices become more powerful only as their
#' alters become *weaker* (as occurs in competitive or antagonistic
#' relations).  The magnitude of the exponent indicates the tendency of the
#' effect to decay across long walks; higher magnitudes imply slower decay.
#' One interesting feature of this measure is its relative instability to
#' changes in exponent magnitude (particularly in the negative case).  If your
#' theory motivates use of this measure, you should be very careful to choose a
#' decay parameter on a non-ad hoc basis.
#'
#' For directed networks, the Bonacich power measure can be understood as
#' similar to status in the network where higher status nodes have more edges
#' that point from them to others with status. Node A's centrality depends
#' on the centrality of all the nodes that A points toward, and their centrality
#' depends on the nodes they point toward, etc. Note, this means that a node
#' with an out-degree of 0 will have a Bonacich power centrality of 0 as they
#' do not point towards anyone. When using this with directed network it
#' is important to think about the edge direction and what it represents.
#'
#' @param graph the input graph.
#' @param nodes vertex sequence indicating which vertices are to be included in
#'   the calculation.  By default, all vertices are included.
#' @param loops boolean indicating whether or not the diagonal should be
#'   treated as valid data.  Set this true if and only if the data can contain
#'   loops.  `loops` is `FALSE` by default.
#' @param exponent exponent (decay rate) for the Bonacich power centrality
#'   score; can be negative
#' @param rescale if true, centrality scores are rescaled such that they sum to
#'   1.
#' @param tol tolerance for near-singularities during matrix inversion (see
#'   [solve()])
#' @param sparse Logical scalar, whether to use sparse matrices for the
#'   calculation. The \sQuote{Matrix} package is required for sparse matrix
#'   support
#' @return A vector, containing the centrality scores.
#' @note This function was ported (i.e. copied) from the SNA package.
#' @section Warning : Singular adjacency matrices cause no end of headaches for
#' this algorithm; thus, the routine may fail in certain cases.  This will be
#' fixed when we get a better algorithm.
#' @author Carter T. Butts
#' (<http://www.faculty.uci.edu/profile.cfm?faculty_id=5057>), ported to
#' igraph by Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @seealso [eigen_centrality()] and [alpha_centrality()]
#' @references Bonacich, P.  (1972).  ``Factoring and Weighting Approaches to
#' Status Scores and Clique Identification.'' *Journal of Mathematical
#' Sociology*, 2, 113-120.
#'
#' Bonacich, P.  (1987).  ``Power and Centrality: A Family of Measures.''
#' *American Journal of Sociology*, 92, 1170-1182.
#' @keywords graphs
#' @family centrality
#' @export
#' @examples
#'
#' # Generate some test data from Bonacich, 1987:
#' g.c <- make_graph(c(1, 2, 1, 3, 2, 4, 3, 5), dir = FALSE)
#' g.d <- make_graph(c(1, 2, 1, 3, 1, 4, 2, 5, 3, 6, 4, 7), dir = FALSE)
#' g.e <- make_graph(c(1, 2, 1, 3, 1, 4, 2, 5, 2, 6, 3, 7, 3, 8, 4, 9, 4, 10), dir = FALSE)
#' g.f <- make_graph(
#'   c(1, 2, 1, 3, 1, 4, 2, 5, 2, 6, 2, 7, 3, 8, 3, 9, 3, 10, 4, 11, 4, 12, 4, 13),
#'   dir = FALSE
#' )
#' # Compute power centrality scores
#' for (e in seq(-0.5, .5, by = 0.1)) {
#'   print(round(power_centrality(g.c, exp = e)[c(1, 2, 4)], 2))
#' }
#'
#' for (e in seq(-0.4, .4, by = 0.1)) {
#'   print(round(power_centrality(g.d, exp = e)[c(1, 2, 5)], 2))
#' }
#'
#' for (e in seq(-0.4, .4, by = 0.1)) {
#'   print(round(power_centrality(g.e, exp = e)[c(1, 2, 5)], 2))
#' }
#'
#' for (e in seq(-0.4, .4, by = 0.1)) {
#'   print(round(power_centrality(g.f, exp = e)[c(1, 2, 5)], 2))
#' }
#'
power_centrality <- function(graph, nodes = V(graph),
                             loops = FALSE, exponent = 1,
                             rescale = FALSE, tol = 1e-7, sparse = TRUE) {
  nodes <- as_igraph_vs(graph, nodes)
  if (sparse) {
    res <- bonpow.sparse(graph, nodes, loops, exponent, rescale, tol)
  } else {
    res <- bonpow.dense(graph, nodes, loops, exponent, rescale, tol)
  }

  if (igraph_opt("add.vertex.names") && is_named(graph)) {
    names(res) <- vertex_attr(graph, "name", nodes)
  }

  res
}

alpha.centrality.dense <- function(graph, nodes = V(graph), alpha = 1,
                                   loops = FALSE, exo = 1, weights = NULL,
                                   tol = 1e-7) {
  ensure_igraph(graph)

  exo <- rep(exo, length.out = vcount(graph))
  exo <- matrix(exo, ncol = 1)

  if (is.null(weights) && "weight" %in% edge_attr_names(graph)) {
    ## weights == NULL and there is a "weight" edge attribute
    attr <- "weight"
  } else if (is.null(weights)) {
    ## weights == NULL, but there is no "weight" edge attribute
    attr <- NULL
  } else if (is.character(weights) && length(weights) == 1) {
    ## name of an edge attribute, nothing to do
    attr <- "weight"
  } else if (any(!is.na(weights))) {
    ## weights != NULL and weights != rep(NA, x)
    graph <- set_edge_attr(graph, "weight", value = as.numeric(weights))
    attr <- "weight"
  } else {
    ## weights != NULL, but weights == rep(NA, x)
    attr <- NULL
  }

  d <- t(as_adj(graph, attr = attr, sparse = FALSE))
  if (!loops) {
    diag(d) <- 0
  }
  n <- vcount(graph)
  id <- matrix(0, nrow = n, ncol = n)
  diag(id) <- 1

  ev <- solve(id - alpha * d, tol = tol) %*% exo
  ev[as.numeric(nodes)]
}

alpha.centrality.sparse <- function(graph, nodes = V(graph), alpha = 1,
                                    loops = FALSE, exo = 1, weights = NULL,
                                    tol = 1e-7) {
  ensure_igraph(graph)

  vc <- vcount(graph)

  if (!loops) {
    graph <- simplify(graph, remove.multiple = FALSE, remove.loops = TRUE)
  }

  if (is.null(weights) && "weight" %in% edge_attr_names(graph)) {
    ## weights == NULL and there is a "weight" edge attribute
    attr <- "weight"
  } else if (is.null(weights)) {
    ## weights == NULL, but there is no "weight" edge attribute
    attr <- NULL
  } else if (is.character(weights) && length(weights) == 1) {
    ## name of an edge attribute, nothing to do
    attr <- "weight"
  } else if (any(!is.na(weights))) {
    ## weights != NULL and weights != rep(NA, x)
    graph <- set_edge_attr(graph, "weight", value = as.numeric(weights))
    attr <- "weight"
  } else {
    ## weights != NULL, but weights == rep(NA, x)
    attr <- NULL
  }

  M <- Matrix::t(as_adj(graph, attr = attr, sparse = TRUE))

  ## Create an identity matrix
  M2 <- Matrix::sparseMatrix(dims = c(vc, vc), i = 1:vc, j = 1:vc, x = rep(1, vc))

  ## exo
  exo <- cbind(rep(exo, length.out = vc))

  ## Solve the equation
  M3 <- M2 - alpha * M
  r <- Matrix::solve(M3, tol = tol, exo)

  r[as.numeric(nodes)]
}



#' Find Bonacich alpha centrality scores of network positions
#'
#' `alpha_centrality()` calculates the alpha centrality of some (or all)
#' vertices in a graph.
#'
#' The alpha centrality measure can be considered as a generalization of
#' eigenvector centrality to directed graphs. It was proposed by Bonacich in
#' 2001 (see reference below).
#'
#' The alpha centrality of the vertices in a graph is defined as the solution
#' of the following matrix equation: \deqn{x=\alpha A^T x+e,}{x=alpha t(A)x+e,}
#' where \eqn{A}{A} is the (not necessarily symmetric) adjacency matrix of the
#' graph, \eqn{e}{e} is the vector of exogenous sources of status of the
#' vertices and \eqn{\alpha}{alpha} is the relative importance of the
#' endogenous versus exogenous factors.
#'
#' @param graph The input graph, can be directed or undirected. In undirected
#'   graphs, edges are treated as if they were reciprocal directed ones.
#' @param nodes Vertex sequence, the vertices for which the alpha centrality
#'   values are returned. (For technical reasons they will be calculated for all
#'   vertices, anyway.)
#' @param alpha Parameter specifying the relative importance of endogenous
#'   versus exogenous factors in the determination of centrality. See details
#'   below.
#' @param loops Whether to eliminate loop edges from the graph before the
#'   calculation.
#' @param exo The exogenous factors, in most cases this is either a constant --
#'   the same factor for every node, or a vector giving the factor for every
#'   vertex. Note that too long vectors will be truncated and too short vectors
#'   will be replicated to match the number of vertices.
#' @param weights A character scalar that gives the name of the edge attribute
#'   to use in the adjacency matrix. If it is `NULL`, then the
#'   \sQuote{weight} edge attribute of the graph is used, if there is one.
#'   Otherwise, or if it is `NA`, then the calculation uses the standard
#'   adjacency matrix.
#' @param tol Tolerance for near-singularities during matrix inversion, see
#'   [solve()].
#' @param sparse Logical scalar, whether to use sparse matrices for the
#'   calculation. The \sQuote{Matrix} package is required for sparse matrix
#'   support
#' @return A numeric vector contaning the centrality scores for the selected
#'   vertices.
#' @section Warning: Singular adjacency matrices cause problems for this
#' algorithm, the routine may fail is certain cases.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @seealso [eigen_centrality()] and [power_centrality()]
#' @references Bonacich, P. and Lloyd, P. (2001). ``Eigenvector-like
#' measures of centrality for asymmetric relations'' *Social Networks*,
#' 23, 191-201.
#' @family centrality
#' @export
#' @keywords graphs
#' @examples
#'
#' # The examples from Bonacich's paper
#' g.1 <- make_graph(c(1, 3, 2, 3, 3, 4, 4, 5))
#' g.2 <- make_graph(c(2, 1, 3, 1, 4, 1, 5, 1))
#' g.3 <- make_graph(c(1, 2, 2, 3, 3, 4, 4, 1, 5, 1))
#' alpha_centrality(g.1)
#' alpha_centrality(g.2)
#' alpha_centrality(g.3, alpha = 0.5)
#'
alpha_centrality <- function(graph, nodes = V(graph), alpha = 1,
                             loops = FALSE, exo = 1, weights = NULL,
                             tol = 1e-7, sparse = TRUE) {
  nodes <- as_igraph_vs(graph, nodes)
  if (sparse) {
    res <- alpha.centrality.sparse(
      graph, nodes, alpha, loops,
      exo, weights, tol
    )
  } else {
    res <- alpha.centrality.dense(
      graph, nodes, alpha, loops,
      exo, weights, tol
    )
  }
  if (igraph_opt("add.vertex.names") && is_named(graph)) {
    names(res) <- vertex_attr(graph, "name", nodes)
  }
  res
}
