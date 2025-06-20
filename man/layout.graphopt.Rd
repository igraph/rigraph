% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/layout.R
\name{layout.graphopt}
\alias{layout.graphopt}
\title{The graphopt layout algorithm}
\usage{
layout.graphopt(
  graph,
  start = NULL,
  niter = 500,
  charge = 0.001,
  mass = 30,
  spring.length = 0,
  spring.constant = 1,
  max.sa.movement = 5
)
}
\arguments{
\item{graph}{The input graph.}

\item{start}{If given, then it should be a matrix with two columns and one
line for each vertex. This matrix will be used as starting positions for the
algorithm. If not given, then a random starting matrix is used.}

\item{niter}{Integer scalar, the number of iterations to perform.  Should be
a couple of hundred in general. If you have a large graph then you might
want to only do a few iterations and then check the result. If it is not
good enough you can feed it in again in the \code{start} argument. The
default value is 500.}

\item{charge}{The charge of the vertices, used to calculate electric
repulsion. The default is 0.001.}

\item{mass}{The mass of the vertices, used for the spring forces. The
default is 30.}

\item{spring.length}{The length of the springs, an integer number. The
default value is zero.}

\item{spring.constant}{The spring constant, the default value is one.}

\item{max.sa.movement}{Real constant, it gives the maximum amount of
movement allowed in a single step along a single axis. The default value is
5.}
}
\description{
\ifelse{html}{\href{https://lifecycle.r-lib.org/articles/stages.html#deprecated}{\figure{lifecycle-deprecated.svg}{options: alt='[Deprecated]'}}}{\strong{[Deprecated]}}

\code{layout.graphopt()} was renamed to \code{\link[=layout_with_graphopt]{layout_with_graphopt()}} to create a more
consistent API.
}
\keyword{internal}
