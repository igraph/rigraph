% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/attributes.R
\name{delete_graph_attr}
\alias{delete_graph_attr}
\title{Delete a graph attribute}
\usage{
delete_graph_attr(graph, name)
}
\arguments{
\item{graph}{The graph.}

\item{name}{Name of the attribute to delete.}
}
\value{
The graph, with the specified attribute removed.
}
\description{
Delete a graph attribute
}
\examples{
g <- make_ring(10)
graph_attr_names(g)
g2 <- delete_graph_attr(g, "name")
graph_attr_names(g2)
}
\seealso{
Vertex, edge and graph attributes
\code{\link{delete_edge_attr}()},
\code{\link{delete_vertex_attr}()},
\code{\link{edge_attr}()},
\code{\link{edge_attr<-}()},
\code{\link{edge_attr_names}()},
\code{\link{graph_attr}()},
\code{\link{graph_attr<-}()},
\code{\link{graph_attr_names}()},
\code{\link{igraph-attribute-combination}},
\code{\link{igraph-dollar}},
\code{\link{igraph-vs-attributes}},
\code{\link{set_edge_attr}()},
\code{\link{set_graph_attr}()},
\code{\link{set_vertex_attr}()},
\code{\link{set_vertex_attrs}()},
\code{\link{vertex_attr}()},
\code{\link{vertex_attr<-}()},
\code{\link{vertex_attr_names}()}
}
\concept{attributes}
