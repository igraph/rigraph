% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/assortativity.R
\name{assortativity.nominal}
\alias{assortativity.nominal}
\title{Assortativity coefficient}
\usage{
assortativity.nominal(graph, types, directed = TRUE, normalized = TRUE)
}
\arguments{
\item{graph}{The input graph, it can be directed or undirected.}

\item{types}{Vector giving the vertex types. They as assumed to be integer
numbers, starting with one. Non-integer values are converted to integers
with \code{\link[=as.integer]{as.integer()}}.}

\item{directed}{Logical scalar, whether to consider edge directions for
directed graphs.
This argument is ignored for undirected graphs.
Supply
\code{TRUE} here to do the natural thing, i.e. use directed version of the
measure for directed graphs and the undirected version for undirected
graphs.}

\item{normalized}{Boolean, whether to compute the normalized assortativity.
The non-normalized nominal assortativity is identical to modularity.
The non-normalized value-based assortativity is simply the covariance of the
values at the two ends of edges.}
}
\description{
\ifelse{html}{\href{https://lifecycle.r-lib.org/articles/stages.html#deprecated}{\figure{lifecycle-deprecated.svg}{options: alt='[Deprecated]'}}}{\strong{[Deprecated]}}

\code{assortativity.nominal()} was renamed to \code{\link[=assortativity_nominal]{assortativity_nominal()}} to create a more
consistent API.
}
\keyword{internal}
