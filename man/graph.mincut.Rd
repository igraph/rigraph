% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/flow.R
\name{graph.mincut}
\alias{graph.mincut}
\title{Minimum cut in a graph}
\usage{
graph.mincut(
  graph,
  source = NULL,
  target = NULL,
  capacity = NULL,
  value.only = TRUE
)
}
\arguments{
\item{graph}{The input graph.}

\item{source}{The id of the source vertex.}

\item{target}{The id of the target vertex (sometimes also called sink).}

\item{capacity}{Vector giving the capacity of the edges. If this is
\code{NULL} (the default) then the \code{capacity} edge attribute is used.}

\item{value.only}{Logical scalar, if \code{TRUE} only the minimum cut value
is returned, if \code{FALSE} the edges in the cut and a the two (or more)
partitions are also returned.}
}
\description{
\ifelse{html}{\href{https://lifecycle.r-lib.org/articles/stages.html#deprecated}{\figure{lifecycle-deprecated.svg}{options: alt='[Deprecated]'}}}{\strong{[Deprecated]}}

\code{graph.mincut()} was renamed to \code{\link[=min_cut]{min_cut()}} to create a more
consistent API.
}
\keyword{internal}
