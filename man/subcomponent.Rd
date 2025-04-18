% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/structural-properties.R
\name{subcomponent}
\alias{subcomponent}
\title{In- or out- component of a vertex}
\usage{
subcomponent(graph, v, mode = c("all", "out", "in"))
}
\arguments{
\item{graph}{The graph to analyze.}

\item{v}{The vertex to start the search from.}

\item{mode}{Character string, either \dQuote{in}, \dQuote{out} or
\dQuote{all}. If \dQuote{in} all vertices from which \code{v} is reachable
are listed. If \dQuote{out} all vertices reachable from \code{v} are
returned. If \dQuote{all} returns the union of these. It is ignored for
undirected graphs.}
}
\value{
Numeric vector, the ids of the vertices in the same component as
\code{v}.
}
\description{
Finds all vertices reachable from a given vertex, or the opposite: all
vertices from which a given vertex is reachable via a directed path.
}
\details{
A breadth-first search is conducted starting from vertex \code{v}.
}
\examples{

g <- sample_gnp(100, 1 / 200)
subcomponent(g, 1, "in")
subcomponent(g, 1, "out")
subcomponent(g, 1, "all")
}
\seealso{
\code{\link[=components]{components()}}

Other structural.properties: 
\code{\link{bfs}()},
\code{\link{component_distribution}()},
\code{\link{connect}()},
\code{\link{constraint}()},
\code{\link{coreness}()},
\code{\link{degree}()},
\code{\link{dfs}()},
\code{\link{distance_table}()},
\code{\link{edge_density}()},
\code{\link{feedback_arc_set}()},
\code{\link{feedback_vertex_set}()},
\code{\link{girth}()},
\code{\link{is_acyclic}()},
\code{\link{is_dag}()},
\code{\link{is_matching}()},
\code{\link{k_shortest_paths}()},
\code{\link{knn}()},
\code{\link{reciprocity}()},
\code{\link{subgraph}()},
\code{\link{topo_sort}()},
\code{\link{transitivity}()},
\code{\link{unfold_tree}()},
\code{\link{which_multiple}()},
\code{\link{which_mutual}()}
}
\author{
Gabor Csardi \email{csardi.gabor@gmail.com}
}
\concept{structural.properties}
\keyword{graphs}
