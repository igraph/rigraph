% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/structural-properties.R
\name{graph.density}
\alias{graph.density}
\title{Graph density}
\usage{
graph.density(graph, loops = FALSE)
}
\arguments{
\item{graph}{The input graph.}

\item{loops}{Logical constant, whether loop edges may exist in the graph.
This affects the calculation of the largest possible number of edges in the
graph. If this parameter is set to FALSE yet the graph contains self-loops,
the result will not be meaningful.}
}
\description{
\ifelse{html}{\href{https://lifecycle.r-lib.org/articles/stages.html#deprecated}{\figure{lifecycle-deprecated.svg}{options: alt='[Deprecated]'}}}{\strong{[Deprecated]}}

\code{graph.density()} was renamed to \code{\link[=edge_density]{edge_density()}} to create a more
consistent API.
}
\keyword{internal}
