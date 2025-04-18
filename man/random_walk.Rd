% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/random_walk.R
\name{random_walk}
\alias{random_walk}
\alias{random_edge_walk}
\title{Random walk on a graph}
\usage{
random_walk(
  graph,
  start,
  steps,
  weights = NULL,
  mode = c("out", "in", "all", "total"),
  stuck = c("return", "error")
)

random_edge_walk(
  graph,
  start,
  steps,
  weights = NULL,
  mode = c("out", "in", "all", "total"),
  stuck = c("return", "error")
)
}
\arguments{
\item{graph}{The input graph, might be undirected or directed.}

\item{start}{The start vertex.}

\item{steps}{The number of steps to make.}

\item{weights}{The edge weights. Larger edge weights increase the
probability that an edge is selected by the random walker. In other
words, larger edge weights correspond to stronger connections. The
\sQuote{weight} edge attribute is used if present. Supply
\sQuote{\code{NA}} here if you want to ignore the \sQuote{weight} edge
attribute.}

\item{mode}{How to follow directed edges. \code{"out"} steps along the
edge direction, \code{"in"} is opposite to that. \code{"all"} ignores
edge directions. This argument is ignored for undirected graphs.}

\item{stuck}{What to do if the random walk gets stuck. \code{"return"}
returns the partial walk, \code{"error"} raises an error.}
}
\value{
For \code{random_walk()}, a vertex sequence of length \code{steps + 1}
containing the vertices along the walk, starting with \code{start}.
For \code{random_edge_walk()}, an edge sequence of length \code{steps} containing
the edges along the walk.
}
\description{
\code{random_walk()} performs a random walk on the graph and returns the
vertices that the random walk passed through. \code{random_edge_walk()}
is the same but returns the edges that that random walk passed through.
}
\details{
Do a random walk. From the given start vertex, take the given number of
steps, choosing an edge from the actual vertex uniformly randomly. Edge
directions are observed in directed graphs (see the \code{mode} argument
as well). Multiple and loop edges are also observed.

For igraph < 1.6.0, \code{random_walk()} counted steps differently,
and returned a sequence of length \code{steps} instead of \code{steps + 1}.
This has changed to improve consistency with the underlying C library.
}
\examples{
## Stationary distribution of a Markov chain
g <- make_ring(10, directed = TRUE) \%u\%
  make_star(11, center = 11) + edge(11, 1)

ec <- eigen_centrality(g, directed = TRUE)$vector
pg <- page_rank(g, damping = 0.999)$vector
w <- random_walk(g, start = 1, steps = 10000)

## These are similar, but not exactly the same
cor(table(w), ec)

## But these are (almost) the same
cor(table(w), pg)
}
\concept{random_walk}
\section{Related documentation in the C library}{\href{https://igraph.org/c/html/latest/igraph-Visitors.html#igraph_random_walk}{\code{random_walk()}}.}

