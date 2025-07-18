% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/topology.R
\name{automorphisms}
\alias{automorphisms}
\title{Number of automorphisms}
\usage{
automorphisms(
  graph,
  colors = NULL,
  sh = c("fm", "f", "fs", "fl", "flm", "fsm")
)
}
\arguments{
\item{graph}{The input graph, it is treated as undirected.}

\item{colors}{The colors of the individual vertices of the graph; only
vertices having the same color are allowed to match each other in an
automorphism. When omitted, igraph uses the \code{color} attribute of the
vertices, or, if there is no such vertex attribute, it simply assumes that
all vertices have the same color. Pass NULL explicitly if the graph has a
\code{color} vertex attribute but you do not want to use it.}

\item{sh}{The splitting heuristics for the BLISS algorithm. Possible values
are:
\sQuote{\code{f}}:
first non-singleton cell,
\sQuote{\code{fl}}:
first largest non-singleton cell,
\sQuote{\code{fs}}:
first smallest non-singleton cell,
\sQuote{\code{fm}}:
first maximally non-trivially connected
non-singleton cell,
\sQuote{\code{flm}}:
first largest maximally
non-trivially connected non-singleton cell,
\sQuote{\code{fsm}}:
first smallest maximally non-trivially connected non-singleton cell.}
}
\description{
\ifelse{html}{\href{https://lifecycle.r-lib.org/articles/stages.html#deprecated}{\figure{lifecycle-deprecated.svg}{options: alt='[Deprecated]'}}}{\strong{[Deprecated]}}

\code{automorphisms()} was renamed to \code{\link[=count_automorphisms]{count_automorphisms()}} to create a more
consistent API.
}
\keyword{internal}
