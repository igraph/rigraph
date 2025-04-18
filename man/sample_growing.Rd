% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/games.R
\name{sample_growing}
\alias{sample_growing}
\alias{growing}
\title{Growing random graph generation}
\usage{
sample_growing(n, m = 1, ..., directed = TRUE, citation = FALSE)

growing(...)
}
\arguments{
\item{n}{Numeric constant, number of vertices in the graph.}

\item{m}{Numeric constant, number of edges added in each time step.}

\item{...}{Passed to \code{sample_growing()}.}

\item{directed}{Logical, whether to create a directed graph.}

\item{citation}{Logical. If \code{TRUE} a citation graph is created, i.e. in
each time step the added edges are originating from the new vertex.}
}
\value{
A new graph object.
}
\description{
This function creates a random graph by simulating its stochastic evolution.
}
\details{
This is discrete time step model, in each time step a new vertex is added to
the graph and \code{m} new edges are created. If \code{citation} is
\code{FALSE} these edges are connecting two uniformly randomly chosen
vertices, otherwise the edges are connecting new vertex to uniformly
randomly chosen old vertices.
}
\examples{

g <- sample_growing(500, citation = FALSE)
g2 <- sample_growing(500, citation = TRUE)

}
\seealso{
Random graph models (games)
\code{\link{bipartite_gnm}()},
\code{\link{erdos.renyi.game}()},
\code{\link{sample_}()},
\code{\link{sample_bipartite}()},
\code{\link{sample_chung_lu}()},
\code{\link{sample_correlated_gnp}()},
\code{\link{sample_correlated_gnp_pair}()},
\code{\link{sample_degseq}()},
\code{\link{sample_dot_product}()},
\code{\link{sample_fitness}()},
\code{\link{sample_fitness_pl}()},
\code{\link{sample_forestfire}()},
\code{\link{sample_gnm}()},
\code{\link{sample_gnp}()},
\code{\link{sample_grg}()},
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
\section{Related documentation in the C library}{\href{https://igraph.org/c/html/latest/igraph-Generators.html#igraph_growing_random_game}{\code{growing_random_game()}}.}

