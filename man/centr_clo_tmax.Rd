% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/centralization.R
\name{centr_clo_tmax}
\alias{centr_clo_tmax}
\title{Theoretical maximum for closeness centralization}
\usage{
centr_clo_tmax(graph = NULL, nodes = 0, mode = c("out", "in", "all", "total"))
}
\arguments{
\item{graph}{The input graph. It can also be \code{NULL} if
\code{nodes} is given.}

\item{nodes}{The number of vertices. This is ignored if the graph is
given.}

\item{mode}{This is the same as the \code{mode} argument of
\code{closeness()}. Ignored if an undirected graph is given.}
}
\value{
Real scalar, the theoretical maximum (unnormalized) graph
closeness centrality score for graphs with given order and other
parameters.
}
\description{
See \code{\link[=centralize]{centralize()}} for a summary of graph centralization.
}
\examples{
# A BA graph is quite centralized
g <- sample_pa(1000, m = 4)
centr_clo(g, normalized = FALSE)$centralization \%>\%
  `/`(centr_clo_tmax(g))
centr_clo(g, normalized = TRUE)$centralization
}
\seealso{
Other centralization related: 
\code{\link{centr_betw}()},
\code{\link{centr_betw_tmax}()},
\code{\link{centr_clo}()},
\code{\link{centr_degree}()},
\code{\link{centr_degree_tmax}()},
\code{\link{centr_eigen}()},
\code{\link{centr_eigen_tmax}()},
\code{\link{centralize}()}
}
\concept{centralization related}
\section{Related documentation in the C library}{\href{https://igraph.org/c/html/latest/igraph-Structural.html#igraph_centralization_closeness_tmax}{\code{centralization_closeness_tmax()}}.}

