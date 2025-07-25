% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/topology.R
\name{isomorphic}
\alias{isomorphic}
\alias{graph.isomorphic}
\alias{graph.isomorphic.34}
\alias{graph.isomorphic.vf2}
\alias{graph.isomorphic.bliss}
\alias{is_isomorphic_to}
\title{Decide if two graphs are isomorphic}
\usage{
isomorphic(graph1, graph2, method = c("auto", "direct", "vf2", "bliss"), ...)

is_isomorphic_to(
  graph1,
  graph2,
  method = c("auto", "direct", "vf2", "bliss"),
  ...
)
}
\arguments{
\item{graph1}{The first graph.}

\item{graph2}{The second graph.}

\item{method}{The method to use. Possible values: \sQuote{auto},
\sQuote{direct}, \sQuote{vf2}, \sQuote{bliss}. See their details
below.}

\item{...}{Additional arguments, passed to the various methods.}
}
\value{
Logical scalar, \code{TRUE} if the graphs are isomorphic.
}
\description{
Decide if two graphs are isomorphic
}
\section{\sQuote{auto} method}{

It tries to select the appropriate method based on the two graphs.
This is the algorithm it uses:
\enumerate{
\item If the two graphs do not agree on their order and size
(i.e. number of vertices and edges), then return \code{FALSE}.
\item If the graphs have three or four vertices, then the
\sQuote{direct} method is used.
\item If the graphs are directed, then the \sQuote{vf2} method is
used.
\item Otherwise the \sQuote{bliss} method is used.
}
}

\section{\sQuote{direct} method}{

This method only works on graphs with three or four vertices,
and it is based on a pre-calculated and stored table. It does not
have any extra arguments.
}

\section{\sQuote{vf2} method}{

This method uses the VF2 algorithm by Cordella, Foggia et al., see
references below. It supports vertex and edge colors and have the
following extra arguments:
\describe{
\item{vertex.color1, vertex.color2}{
Optional integer vectors giving the colors of the vertices for colored graph isomorphism.
If they are not given, but the graph has a \dQuote{color} vertex attribute, then it will be used.
If you want to ignore these attributes, then supply \code{NULL} for both of these arguments.
See also examples below.
}
\item{edge.color1, edge.color2}{
Optional integer vectors giving the colors of the edges for edge-colored (sub)graph isomorphism.
If they are not given, but the graph has a \dQuote{color} edge attribute, then it will be used.
If you want to ignore these attributes, then supply \code{NULL} for both of these arguments.
}
}
}

\section{\sQuote{bliss} method}{

Uses the BLISS algorithm by Junttila and Kaski, and it works for
undirected graphs. For both graphs the
\code{\link[=canonical_permutation]{canonical_permutation()}} and then the \code{\link[=permute]{permute()}}
function is called to transfer them into canonical form; finally the
canonical forms are compared.
Extra arguments:
\describe{
\item{sh}{
Character constant, the heuristics to use in the BLISS algorithm for \code{graph1} and \code{graph2}. See the \code{sh} argument of \code{\link[=canonical_permutation]{canonical_permutation()}} for possible values.
}
}
\code{sh} defaults to \sQuote{fm}.
}

\examples{
# create some non-isomorphic graphs
g1 <- graph_from_isomorphism_class(3, 10)
g2 <- graph_from_isomorphism_class(3, 11)
isomorphic(g1, g2)

# create two isomorphic graphs, by permuting the vertices of the first
g1 <- sample_pa(30, m = 2, directed = FALSE)
g2 <- permute(g1, sample(vcount(g1)))
# should be TRUE
isomorphic(g1, g2)
isomorphic(g1, g2, method = "bliss")
isomorphic(g1, g2, method = "vf2")

# colored graph isomorphism
g1 <- make_ring(10)
g2 <- make_ring(10)
isomorphic(g1, g2)

V(g1)$color <- rep(1:2, length = vcount(g1))
V(g2)$color <- rep(2:1, length = vcount(g2))
# consider colors by default
count_isomorphisms(g1, g2)
# ignore colors
count_isomorphisms(g1, g2,
  vertex.color1 = NULL,
  vertex.color2 = NULL
)
}
\references{
Tommi Junttila and Petteri Kaski: Engineering an Efficient Canonical
Labeling Tool for Large and Sparse Graphs, \emph{Proceedings of the
Ninth Workshop on Algorithm Engineering and Experiments and the Fourth
Workshop on Analytic Algorithms and Combinatorics.} 2007.

LP Cordella,  P Foggia, C Sansone, and M Vento: An improved algorithm
for matching large graphs, \emph{Proc. of the 3rd IAPR TC-15 Workshop
on Graphbased Representations in Pattern Recognition}, 149--159, 2001.
}
\seealso{
Other graph isomorphism: 
\code{\link{canonical_permutation}()},
\code{\link{count_isomorphisms}()},
\code{\link{count_subgraph_isomorphisms}()},
\code{\link{graph_from_isomorphism_class}()},
\code{\link{isomorphism_class}()},
\code{\link{isomorphisms}()},
\code{\link{subgraph_isomorphic}()},
\code{\link{subgraph_isomorphisms}()}
}
\concept{graph isomorphism}
