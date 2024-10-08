% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/basic.R
\name{head_of}
\alias{head_of}
\title{Head of the edge(s) in a graph}
\usage{
head_of(graph, es)
}
\arguments{
\item{graph}{The input graph.}

\item{es}{The edges to query.}
}
\value{
A vertex sequence with the head(s) of the edge(s).
}
\description{
For undirected graphs, head and tail is not defined.  In this case
\code{head_of()} returns vertices incident to the supplied edges, and
\code{tail_of()} returns the other end(s) of the edge(s).
}
\seealso{
Other structural queries: 
\code{\link{[.igraph}()},
\code{\link{[[.igraph}()},
\code{\link{adjacent_vertices}()},
\code{\link{are_adjacent}()},
\code{\link{ends}()},
\code{\link{get_edge_ids}()},
\code{\link{gorder}()},
\code{\link{gsize}()},
\code{\link{incident}()},
\code{\link{incident_edges}()},
\code{\link{is_directed}()},
\code{\link{neighbors}()},
\code{\link{tail_of}()}
}
\concept{structural queries}
