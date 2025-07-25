% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/attributes.R
\name{igraph-dollar}
\alias{igraph-dollar}
\alias{$.igraph}
\alias{$<-.igraph}
\title{Getting and setting graph attributes, shortcut}
\usage{
\method{$}{igraph}(x, name)

\method{$}{igraph}(x, name) <- value
}
\arguments{
\item{x}{An igraph graph}

\item{name}{Name of the attribute to get/set.}

\item{value}{New value of the graph attribute.}
}
\description{
The \code{$} operator is a shortcut to get and and set
graph attributes. It is shorter and just as readable as
\code{\link[=graph_attr]{graph_attr()}} and \code{\link[=set_graph_attr]{set_graph_attr()}}.
}
\examples{
g <- make_ring(10)
g$name
g$name <- "10-ring"
g$name
}
\seealso{
Vertex, edge and graph attributes
\code{\link{delete_edge_attr}()},
\code{\link{delete_graph_attr}()},
\code{\link{delete_vertex_attr}()},
\code{\link{edge_attr}()},
\code{\link{edge_attr<-}()},
\code{\link{edge_attr_names}()},
\code{\link{graph_attr}()},
\code{\link{graph_attr<-}()},
\code{\link{graph_attr_names}()},
\code{\link{igraph-attribute-combination}},
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
