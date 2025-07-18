% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/conversion.R
\name{as.undirected}
\alias{as.undirected}
\title{Convert between undirected and unundirected graphs}
\usage{
as.undirected(
  graph,
  mode = c("collapse", "each", "mutual"),
  edge.attr.comb = igraph_opt("edge.attr.comb")
)
}
\arguments{
\item{graph}{The graph to convert.}

\item{mode}{Character constant, defines the conversion algorithm. For
\code{as_directed()} it can be \code{mutual} or \code{arbitrary}. For
\code{as_undirected()} it can be \code{each}, \code{collapse} or
\code{mutual}. See details below.}

\item{edge.attr.comb}{Specifies what to do with edge attributes, if
\code{mode="collapse"} or \code{mode="mutual"}.  In these cases many edges
might be mapped to a single one in the new graph, and their attributes are
combined. Please see \code{\link[=attribute.combination]{attribute.combination()}} for details on
this.}
}
\description{
\ifelse{html}{\href{https://lifecycle.r-lib.org/articles/stages.html#deprecated}{\figure{lifecycle-deprecated.svg}{options: alt='[Deprecated]'}}}{\strong{[Deprecated]}}

\code{as.undirected()} was renamed to \code{\link[=as_undirected]{as_undirected()}} to create a more
consistent API.
}
\keyword{internal}
