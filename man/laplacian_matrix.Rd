% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/structural-properties.R
\name{laplacian_matrix}
\alias{laplacian_matrix}
\title{Graph Laplacian}
\usage{
laplacian_matrix(
  graph,
  weights = NULL,
  sparse = igraph_opt("sparsematrices"),
  normalization = c("unnormalized", "symmetric", "left", "right"),
  normalized
)
}
\arguments{
\item{graph}{The input graph.}

\item{weights}{An optional vector giving edge weights for weighted Laplacian
matrix. If this is \code{NULL} and the graph has an edge attribute called
\code{weight}, then it will be used automatically. Set this to \code{NA} if
you want the unweighted Laplacian on a graph that has a \code{weight} edge
attribute.}

\item{sparse}{Logical scalar, whether to return the result as a sparse
matrix. The \code{Matrix} package is required for sparse matrices.}

\item{normalization}{The normalization method to use when calculating the
Laplacian matrix. See the "Normalization methods" section on this page.}

\item{normalized}{Deprecated, use \code{normalization} instead.}
}
\value{
A numeric matrix.
}
\description{
The Laplacian of a graph.
}
\details{
The Laplacian Matrix of a graph is a symmetric matrix having the same number
of rows and columns as the number of vertices in the graph and element (i,j)
is d[i], the degree of vertex i if if i==j, -1 if i!=j and there is an edge
between vertices i and j and 0 otherwise.

The Laplacian matrix can also be normalized, with several
conventional normalization methods.
See the "Normalization methods" section on this page.

The weighted version of the Laplacian simply works with the weighted degree
instead of the plain degree. I.e. (i,j) is d[i], the weighted degree of
vertex i if if i==j, -w if i!=j and there is an edge between vertices i and
j with weight w, and 0 otherwise. The weighted degree of a vertex is the sum
of the weights of its adjacent edges.
}
\section{Normalization methods}{


The Laplacian matrix \eqn{L} is defined in terms of the adjacency matrix
\eqn{A} and a diagonal matrix \eqn{D} containing the degrees as follows:
\itemize{
\item "unnormalized": Unnormalized Laplacian, \eqn{L = D - A}.
\item "symmetric": Symmetrically normalized Laplacian,
\eqn{L = I - D^{-\frac{1}{2}} A D^{-\frac{1}{2}}}{L = I - D^(-1/2) A D^(-1/2)}.
\item "left": Left-stochastic normalized Laplacian, \eqn{{L = I - D^{-1} A}}{L = I - D^-1 A}.
\item "right": Right-stochastic normalized Laplacian, \eqn{L = I - A D^{-1}}{L = I - A D^-1}.
}
}

\examples{

g <- make_ring(10)
laplacian_matrix(g)
laplacian_matrix(g, normalization = "unnormalized")
laplacian_matrix(g, normalization = "unnormalized", sparse = FALSE)

}
\author{
Gabor Csardi \email{csardi.gabor@gmail.com}
}
\keyword{graphs}
\section{Related documentation in the C library}{\href{https://igraph.org/c/html/latest/igraph-Structural.html#igraph_get_laplacian}{\code{get_laplacian()}}, \href{https://igraph.org/c/html/latest/igraph-Structural.html#igraph_get_laplacian_sparse}{\code{get_laplacian_sparse()}}.}

