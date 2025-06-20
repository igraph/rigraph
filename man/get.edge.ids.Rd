% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/interface.R
\name{get.edge.ids}
\alias{get.edge.ids}
\title{Find the edge ids based on the incident vertices of the edges}
\usage{
get.edge.ids(graph, vp, directed = TRUE, error = FALSE, multi = deprecated())
}
\arguments{
\item{graph}{The input graph.}

\item{vp}{The incident vertices, given as a two-column data frame, two-column matrix,
or vector of vertex ids or symbolic vertex names.
For a vector, the values are interpreted pairwise, i.e. the first and second are used for
the first edge, the third and fourth for the second, etc.}

\item{directed}{Logical scalar, whether to consider edge directions in
directed graphs. This argument is ignored for undirected graphs.}

\item{error}{Logical scalar, whether to report an error if an edge is not
found in the graph. If \code{FALSE}, then no error is reported, and zero is
returned for the non-existant edge(s).}

\item{multi}{\ifelse{html}{\href{https://lifecycle.r-lib.org/articles/stages.html#deprecated}{\figure{lifecycle-deprecated.svg}{options: alt='[Deprecated]'}}}{\strong{[Deprecated]}}}
}
\description{
\ifelse{html}{\href{https://lifecycle.r-lib.org/articles/stages.html#deprecated}{\figure{lifecycle-deprecated.svg}{options: alt='[Deprecated]'}}}{\strong{[Deprecated]}}

\code{get.edge.ids()} was renamed to \code{\link[=get_edge_ids]{get_edge_ids()}} to create a more
consistent API.
}
\keyword{internal}
