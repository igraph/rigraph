% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tkplot.R
\name{tkplot.reshape}
\alias{tkplot.reshape}
\title{Interactive plotting of graphs}
\usage{
tkplot.reshape(tkp.id, newlayout, ..., params)
}
\arguments{
\item{tkp.id}{The id of the tkplot window to close/reshape/etc.}

\item{newlayout}{The new layout, see the \code{layout} parameter of tkplot.}

\item{...}{Additional plotting parameters. See \link{igraph.plotting} for
the complete list.}

\item{params}{Extra parameters in a list, to pass to the layout function.}
}
\description{
\ifelse{html}{\href{https://lifecycle.r-lib.org/articles/stages.html#deprecated}{\figure{lifecycle-deprecated.svg}{options: alt='[Deprecated]'}}}{\strong{[Deprecated]}}

\code{tkplot.reshape()} was renamed to \code{\link[=tk_reshape]{tk_reshape()}} to create a more
consistent API.
}
\keyword{internal}
