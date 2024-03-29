% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/igraph-package.R
\name{\%>\%}
\alias{\%>\%}
\title{Magrittr's pipes}
\arguments{
\item{lhs}{Left hand side of the pipe.}

\item{rhs}{Right hand side of the pipe.}
}
\value{
Result of applying the right hand side to the
result of the left hand side.
}
\description{
igraph re-exports the \verb{\%>\%} operator of magrittr, because
we find it very useful. Please see the documentation in the
\code{magrittr} package.
}
\examples{
make_ring(10) \%>\%
  add_edges(c(1, 6)) \%>\%
  plot()
}
