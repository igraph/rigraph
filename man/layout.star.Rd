% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/layout.R
\name{layout.star}
\alias{layout.star}
\title{Generate coordinates to place the vertices of a graph in a star-shape}
\usage{
layout.star(graph, center = V(graph)[1], order = NULL)
}
\arguments{
\item{graph}{The graph to layout.}

\item{center}{The id of the vertex to put in the center. By default it is
the first vertex.}

\item{order}{Numeric vector, the order of the vertices along the perimeter.
The default ordering is given by the vertex ids.}
}
\description{
\ifelse{html}{\href{https://lifecycle.r-lib.org/articles/stages.html#deprecated}{\figure{lifecycle-deprecated.svg}{options: alt='[Deprecated]'}}}{\strong{[Deprecated]}}

\code{layout.star()} was renamed to \code{\link[=layout_as_star]{layout_as_star()}} to create a more
consistent API.
}
\keyword{internal}
