% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/cliques.R
\name{maximal.cliques}
\alias{maximal.cliques}
\title{Functions to find cliques, i.e. complete subgraphs in a graph}
\usage{
maximal.cliques(graph, min = NULL, max = NULL, subset = NULL, file = NULL)
}
\arguments{
\item{graph}{The input graph.}

\item{min}{Numeric constant, lower limit on the size of the cliques to find.
\code{NULL} means no limit, i.e. it is the same as 0.}

\item{max}{Numeric constant, upper limit on the size of the cliques to find.
\code{NULL} means no limit.}

\item{subset}{If not \code{NULL}, then it must be a vector of vertex ids,
numeric or symbolic if the graph is named. The algorithm is run from these
vertices only, so only a subset of all maximal cliques is returned. See the
Eppstein paper for details. This argument makes it possible to easily
parallelize the finding of maximal cliques.}

\item{file}{If not \code{NULL}, then it must be a file name, i.e. a
character scalar. The output of the algorithm is written to this file. (If
it exists, then it will be overwritten.) Each clique will be a separate line
in the file, given with the numeric ids of its vertices, separated by
whitespace.}
}
\description{
\ifelse{html}{\href{https://lifecycle.r-lib.org/articles/stages.html#deprecated}{\figure{lifecycle-deprecated.svg}{options: alt='[Deprecated]'}}}{\strong{[Deprecated]}}

\code{maximal.cliques()} was renamed to \code{\link[=max_cliques]{max_cliques()}} to create a more
consistent API.
}
\keyword{internal}
