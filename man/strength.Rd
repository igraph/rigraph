% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/centrality.R
\name{strength}
\alias{strength}
\title{Strength or weighted vertex degree}
\usage{
strength(
  graph,
  vids = V(graph),
  mode = c("all", "out", "in", "total"),
  loops = TRUE,
  weights = NULL
)
}
\arguments{
\item{graph}{The input graph.}

\item{vids}{The vertices for which the strength will be calculated.}

\item{mode}{Character string, \dQuote{out} for out-degree, \dQuote{in} for
in-degree or \dQuote{all} for the sum of the two. For undirected graphs this
argument is ignored.}

\item{loops}{Logical; whether the loop edges are also counted.}

\item{weights}{Weight vector. If the graph has a \code{weight} edge
attribute, then this is used by default. If the graph does not have a
\code{weight} edge attribute and this argument is \code{NULL}, then a
\code{\link[=degree]{degree()}} is called. If this is \code{NA}, then no edge weights are used
(even if the graph has a \code{weight} edge attribute).}
}
\value{
A numeric vector giving the strength of the vertices.
}
\description{
Summing up the edge weights of the adjacent edges for each vertex.
}
\examples{

g <- make_star(10)
E(g)$weight <- seq(ecount(g))
strength(g)
strength(g, mode = "out")
strength(g, mode = "in")

# No weights
g <- make_ring(10)
strength(g)
}
\references{
Alain Barrat, Marc Barthelemy, Romualdo Pastor-Satorras,
Alessandro Vespignani: The architecture of complex weighted networks, Proc.
Natl. Acad. Sci. USA 101, 3747 (2004)
}
\seealso{
\code{\link[=degree]{degree()}} for the unweighted version.

Centrality measures
\code{\link{alpha_centrality}()},
\code{\link{authority_score}()},
\code{\link{betweenness}()},
\code{\link{closeness}()},
\code{\link{diversity}()},
\code{\link{eigen_centrality}()},
\code{\link{harmonic_centrality}()},
\code{\link{hits_scores}()},
\code{\link{page_rank}()},
\code{\link{power_centrality}()},
\code{\link{spectrum}()},
\code{\link{subgraph_centrality}()}
}
\author{
Gabor Csardi \email{csardi.gabor@gmail.com}
}
\concept{centrality}
\keyword{graphs}
\section{Related documentation in the C library}{\href{https://igraph.org/c/html/latest/igraph-Structural.html#igraph_strength}{\code{strength()}}.}

