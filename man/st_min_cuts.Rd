% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/flow.R
\name{st_min_cuts}
\alias{st_min_cuts}
\title{List all minimum \eqn{(s,t)}-cuts of a graph}
\usage{
st_min_cuts(graph, source, target, capacity = NULL)
}
\arguments{
\item{graph}{The input graph. It must be directed.}

\item{source}{The id of the source vertex.}

\item{target}{The id of the target vertex.}

\item{capacity}{Numeric vector giving the edge capacities. If this is
\code{NULL} and the graph has a \code{weight} edge attribute, then this
attribute defines the edge capacities. For forcing unit edge capacities,
even for graphs that have a \code{weight} edge attribute, supply \code{NA}
here.}
}
\value{
A list with entries:
\describe{
\item{value}{
Numeric scalar, the size of the minimum cut(s).
}
\item{cuts}{
A list of numeric vectors containing edge ids. Each vector is a minimum \eqn{(s,t)}-cut.
}
\item{partition1s}{
A list of numeric vectors containing vertex ids,
they correspond to the edge cuts.
Each vertex set is a generator of the corresponding cut, i.e. in the graph \eqn{G=(V,E)},
the vertex set \eqn{X} and its complementer \eqn{V-X},
generates the cut that contains exactly the edges that go from \eqn{X} to \eqn{V-X}.
}
}
}
\description{
Listing all minimum \eqn{(s,t)}-cuts of a directed graph, for given \eqn{s}
and \eqn{t}.
}
\details{
Given a \eqn{G} directed graph and two, different and non-ajacent vertices,
\eqn{s} and \eqn{t}, an \eqn{(s,t)}-cut is a set of edges, such that after
removing these edges from \eqn{G} there is no directed path from \eqn{s} to
\eqn{t}.

The size of an \eqn{(s,t)}-cut is defined as the sum of the capacities (or
weights) in the cut. For unweighted (=equally weighted) graphs, this is
simply the number of edges.

An \eqn{(s,t)}-cut is minimum if it is of the smallest possible size.
}
\examples{

# A difficult graph, from the Provan-Shier paper
g <- graph_from_literal(
  s --+ a:b, a:b --+ t,
  a --+ 1:2:3:4:5, 1:2:3:4:5 --+ b
)
st_min_cuts(g, source = "s", target = "t")
}
\references{
JS Provan and DR Shier: A Paradigm for listing (s,t)-cuts in
graphs, \emph{Algorithmica} 15, 351--372, 1996.
}
\seealso{
Other flow: 
\code{\link{dominator_tree}()},
\code{\link{edge_connectivity}()},
\code{\link{is_min_separator}()},
\code{\link{is_separator}()},
\code{\link{max_flow}()},
\code{\link{min_cut}()},
\code{\link{min_separators}()},
\code{\link{min_st_separators}()},
\code{\link{st_cuts}()},
\code{\link{vertex_connectivity}()}
}
\author{
Gabor Csardi \email{csardi.gabor@gmail.com}
}
\concept{flow}
\keyword{graphs}
\section{Related documentation in the C library}{\href{https://igraph.org/c/html/latest/igraph-Flows.html#igraph_all_st_mincuts}{\code{all_st_mincuts()}}.}

