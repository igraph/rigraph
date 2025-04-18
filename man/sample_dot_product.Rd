% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/games.R
\name{sample_dot_product}
\alias{sample_dot_product}
\alias{dot_product}
\title{Generate random graphs according to the random dot product graph model}
\usage{
sample_dot_product(vecs, directed = FALSE)

dot_product(...)
}
\arguments{
\item{vecs}{A numeric matrix in which each latent position vector is a
column.}

\item{directed}{A logical scalar, TRUE if the generated graph should be
directed.}

\item{...}{Passed to \code{sample_dot_product()}.}
}
\value{
An igraph graph object which is the generated random dot product
graph.
}
\description{
In this model, each vertex is represented by a latent position vector.
Probability of an edge between two vertices are given by the dot product of
their latent position vectors.
}
\details{
The dot product of the latent position vectors should be in the [0,1]
interval, otherwise a warning is given. For negative dot products, no edges
are added; dot products that are larger than one always add an edge.
}
\examples{

## A randomly generated  graph
lpvs <- matrix(rnorm(200), 20, 10)
lpvs <- apply(lpvs, 2, function(x) {
  return(abs(x) / sqrt(sum(x^2)))
})
g <- sample_dot_product(lpvs)
g

## Sample latent vectors from the surface of the unit sphere
lpvs2 <- sample_sphere_surface(dim = 5, n = 20)
g2 <- sample_dot_product(lpvs2)
g2
}
\references{
Christine Leigh Myers Nickel: Random dot product graphs, a model
for social networks. Dissertation, Johns Hopkins University, Maryland, USA,
2006.
}
\seealso{
\code{\link[=sample_dirichlet]{sample_dirichlet()}}, \code{\link[=sample_sphere_surface]{sample_sphere_surface()}}
and \code{\link[=sample_sphere_volume]{sample_sphere_volume()}} for sampling position vectors.

Random graph models (games)
\code{\link{bipartite_gnm}()},
\code{\link{erdos.renyi.game}()},
\code{\link{sample_}()},
\code{\link{sample_bipartite}()},
\code{\link{sample_chung_lu}()},
\code{\link{sample_correlated_gnp}()},
\code{\link{sample_correlated_gnp_pair}()},
\code{\link{sample_degseq}()},
\code{\link{sample_fitness}()},
\code{\link{sample_fitness_pl}()},
\code{\link{sample_forestfire}()},
\code{\link{sample_gnm}()},
\code{\link{sample_gnp}()},
\code{\link{sample_grg}()},
\code{\link{sample_growing}()},
\code{\link{sample_hierarchical_sbm}()},
\code{\link{sample_islands}()},
\code{\link{sample_k_regular}()},
\code{\link{sample_last_cit}()},
\code{\link{sample_pa}()},
\code{\link{sample_pa_age}()},
\code{\link{sample_pref}()},
\code{\link{sample_sbm}()},
\code{\link{sample_smallworld}()},
\code{\link{sample_traits_callaway}()},
\code{\link{sample_tree}()}
}
\author{
Gabor Csardi \email{csardi.gabor@gmail.com}
}
\concept{games}
\keyword{graphs}
\section{Related documentation in the C library}{\href{https://igraph.org/c/html/latest/igraph-Generators.html#igraph_dot_product_game}{\code{dot_product_game()}}.}

