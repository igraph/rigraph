% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/interface.R
\name{add_edges}
\alias{add_edges}
\title{Add edges to a graph}
\usage{
add_edges(graph, edges, ..., attr = list())
}
\arguments{
\item{graph}{The input graph}

\item{edges}{The edges to add, a vertex sequence with even number
of vertices.}

\item{...}{Additional arguments, they must be named,
and they will be added as edge attributes, for the newly added
edges. See also details below.}

\item{attr}{A named list, its elements will be added
as edge attributes, for the newly added edges. See also details
below.}
}
\value{
The graph, with the edges (and attributes) added.
}
\description{
The new edges are given as a vertex sequence, e.g. internal
numeric vertex ids, or vertex names. The first edge points from
\code{edges[1]} to \code{edges[2]}, the second from \code{edges[3]}
to \code{edges[4]}, etc.
}
\details{
If attributes are supplied, and they are not present in the graph,
their values for the original edges of the graph are set to \code{NA}.
}
\examples{
g <- make_empty_graph(n = 5) \%>\%
  add_edges(c(
    1, 2,
    2, 3,
    3, 4,
    4, 5
  )) \%>\%
  set_edge_attr("color", value = "red") \%>\%
  add_edges(c(5, 1), color = "green")
E(g)[[]]
plot(g)
}
\seealso{
Other functions for manipulating graph structure: 
\code{\link{+.igraph}()},
\code{\link{add_vertices}()},
\code{\link{complementer}()},
\code{\link{compose}()},
\code{\link{connect}()},
\code{\link{contract}()},
\code{\link{delete_edges}()},
\code{\link{delete_vertices}()},
\code{\link{difference}()},
\code{\link{difference.igraph}()},
\code{\link{disjoint_union}()},
\code{\link{edge}()},
\code{\link{igraph-minus}},
\code{\link{intersection}()},
\code{\link{intersection.igraph}()},
\code{\link{path}()},
\code{\link{permute}()},
\code{\link{rep.igraph}()},
\code{\link{reverse_edges}()},
\code{\link{simplify}()},
\code{\link{union}()},
\code{\link{union.igraph}()},
\code{\link{vertex}()}
}
\concept{functions for manipulating graph structure}
