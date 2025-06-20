% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/embedding.R
\name{embed_adjacency_matrix}
\alias{embed_adjacency_matrix}
\title{Spectral Embedding of Adjacency Matrices}
\usage{
embed_adjacency_matrix(
  graph,
  no,
  weights = NULL,
  which = c("lm", "la", "sa"),
  scaled = TRUE,
  cvec = strength(graph, weights = weights)/(vcount(graph) - 1),
  options = arpack_defaults()
)
}
\arguments{
\item{graph}{The input graph, directed or undirected.}

\item{no}{An integer scalar. This value is the embedding dimension of the
spectral embedding. Should be smaller than the number of vertices. The
largest \code{no}-dimensional non-zero singular values are used for the
spectral embedding.}

\item{weights}{Optional positive weight vector for calculating a weighted
embedding. If the graph has a \code{weight} edge attribute, then this is
used by default. In a weighted embedding, the edge weights are used instead
of the binary adjacencny matrix.}

\item{which}{Which eigenvalues (or singular values, for directed graphs) to
use. \sQuote{lm} means the ones with the largest magnitude, \sQuote{la} is
the ones (algebraic) largest, and \sQuote{sa} is the (algebraic) smallest
eigenvalues. The default is \sQuote{lm}. Note that for directed graphs
\sQuote{la} and \sQuote{lm} are the equivalent, because the singular values
are used for the ordering.}

\item{scaled}{Logical scalar, if \code{FALSE}, then \eqn{U} and \eqn{V} are
returned instead of \eqn{X} and \eqn{Y}.}

\item{cvec}{A numeric vector, its length is the number vertices in the
graph. This vector is added to the diagonal of the adjacency matrix.}

\item{options}{A named list containing the parameters for the SVD
computation algorithm in ARPACK. By default, the list of values is assigned
the values given by \code{\link[=arpack_defaults]{arpack_defaults()}}.}
}
\value{
A list containing with entries:
\describe{
\item{X}{
Estimated latent positions,
an \code{n} times \code{no} matrix, \code{n} is the number of vertices.
}
\item{Y}{
\code{NULL} for undirected graphs, the second half of the latent
positions for directed graphs, an \code{n} times \code{no} matrix, \code{n}
is the number of vertices.
}
\item{D}{
The eigenvalues (for undirected graphs)
or the singular values (for directed graphs) calculated by the algorithm.
}
\item{options}{
A named list, information about the underlying ARPACK
computation. See \code{\link[=arpack]{arpack()}} for the details.
}
}
}
\description{
Spectral decomposition of the adjacency matrices of graphs.
}
\details{
This function computes a \code{no}-dimensional Euclidean representation of
the graph based on its adjacency matrix, \eqn{A}. This representation is
computed via the singular value decomposition of the adjacency matrix,
\eqn{A=UDV^T}.In the case, where the graph is a random dot product graph
generated using latent position vectors in \eqn{R^{no}} for each vertex, the
embedding will provide an estimate of these latent vectors.

For undirected graphs the latent positions are calculated as
\eqn{X=U^{no}D^{1/2}}{U[no] sqrt(D[no])}, where \eqn{U^{no}}{U[no]} equals
to the first \code{no} columns of \eqn{U}, and \eqn{D^{1/2}}{sqrt(D[no])} is
a diagonal matrix containing the top \code{no} singular values on the
diagonal.

For directed graphs the embedding is defined as the pair
\eqn{X=U^{no}D^{1/2}}{U[no] sqrt(D[no])} and \eqn{Y=V^{no}D^{1/2}}{V[no]
sqrt(D[no])}. (For undirected graphs \eqn{U=V}, so it is enough to keep one
of them.)
}
\examples{

## A small graph
lpvs <- matrix(rnorm(200), 20, 10)
lpvs <- apply(lpvs, 2, function(x) {
  return(abs(x) / sqrt(sum(x^2)))
})
RDP <- sample_dot_product(lpvs)
embed <- embed_adjacency_matrix(RDP, 5)
}
\references{
Sussman, D.L., Tang, M., Fishkind, D.E., Priebe, C.E.  A
Consistent Adjacency Spectral Embedding for Stochastic Blockmodel Graphs,
\emph{Journal of the American Statistical Association}, Vol. 107(499), 2012
}
\seealso{
\code{\link[=sample_dot_product]{sample_dot_product()}}

Other embedding: 
\code{\link{dim_select}()},
\code{\link{embed_laplacian_matrix}()}
}
\concept{embedding}
\keyword{graphs}
\section{Related documentation in the C library}{\href{https://igraph.org/c/html/latest/igraph-Embedding.html#igraph_adjacency_spectral_embedding}{\code{adjacency_spectral_embedding()}}.}

