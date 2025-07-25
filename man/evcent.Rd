% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/centrality.R
\name{evcent}
\alias{evcent}
\title{Find Eigenvector Centrality Scores of Network Positions}
\usage{
evcent(
  graph,
  directed = FALSE,
  scale = TRUE,
  weights = NULL,
  options = arpack_defaults()
)
}
\arguments{
\item{graph}{Graph to be analyzed.}

\item{directed}{Logical scalar, whether to consider direction of the edges
in directed graphs. It is ignored for undirected graphs.}

\item{scale}{\ifelse{html}{\href{https://lifecycle.r-lib.org/articles/stages.html#deprecated}{\figure{lifecycle-deprecated.svg}{options: alt='[Deprecated]'}}}{\strong{[Deprecated]}} Normalization will always take
place.}

\item{weights}{A numerical vector or \code{NULL}. This argument can be used
to give edge weights for calculating the weighted eigenvector centrality of
vertices. If this is \code{NULL} and the graph has a \code{weight} edge
attribute then that is used. If \code{weights} is a numerical vector then it is
used, even if the graph has a \code{weight} edge attribute. If this is
\code{NA}, then no edge weights are used (even if the graph has a
\code{weight} edge attribute). Note that if there are negative edge weights
and the direction of the edges is considered, then the eigenvector might be
complex. In this case only the real part is reported.
This function interprets weights as connection strength. Higher
weights spread the centrality better.}

\item{options}{A named list, to override some ARPACK options. See
\code{\link[=arpack]{arpack()}} for details.}
}
\description{
\ifelse{html}{\href{https://lifecycle.r-lib.org/articles/stages.html#deprecated}{\figure{lifecycle-deprecated.svg}{options: alt='[Deprecated]'}}}{\strong{[Deprecated]}}

\code{evcent()} was renamed to \code{\link[=eigen_centrality]{eigen_centrality()}} to create a more
consistent API.
}
\keyword{internal}
