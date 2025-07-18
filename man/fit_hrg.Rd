% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/hrg.R
\name{fit_hrg}
\alias{fit_hrg}
\title{Fit a hierarchical random graph model}
\usage{
fit_hrg(graph, hrg = NULL, start = FALSE, steps = 0)
}
\arguments{
\item{graph}{The graph to fit the model to. Edge directions are ignored in
directed graphs.}

\item{hrg}{A hierarchical random graph model, in the form of an
\code{igraphHRG} object. \code{fit_hrg()} allows this to be \code{NULL}, in
which case a random starting point is used for the fitting.}

\item{start}{Logical, whether to start the fitting/sampling from the
supplied \code{igraphHRG} object, or from a random starting point.}

\item{steps}{The number of MCMC steps to make. If this is zero, then the
MCMC procedure is performed until convergence.}
}
\value{
\code{fit_hrg()} returns an \code{igraphHRG} object. This is a list
with the following members:
\describe{
\item{left}{
Vector that contains the left children of the internal tree vertices.
The first vertex is always the root vertex,
so the first element of the vector is the left child of the root vertex.
Internal vertices are denoted with negative numbers,
starting from -1 and going down, i.e. the root vertex is -1.
Leaf vertices are denoted by non-negative number, starting from zero and up.
}
\item{right}{
Vector that contains the right children of the vertices,
with the same encoding as the \code{left} vector.
}
\item{prob}{
The connection probabilities attached to the internal vertices,
the first number belongs to the root vertex (i.e. internal vertex -1),
the second to internal vertex -2, etc.
}
\item{edges}{
The number of edges in the subtree below the given internal vertex.
}
\item{vertices}{
The number of vertices in the subtree below the given internal vertex, including itself.
}
}
}
\description{
\code{fit_hrg()} fits a HRG to a given graph. It takes the specified
\code{steps} number of MCMC steps to perform the fitting, or a convergence
criteria if the specified number of steps is zero. \code{fit_hrg()} can start
from a given HRG, if this is given in the \code{hrg()} argument and the
\code{start} argument is \code{TRUE}. It can be converted to the \code{hclust} class using
\code{as.hclust()} provided in this package.
}
\examples{
\dontshow{if (rlang::is_interactive()) withAutoprint(\{ # examplesIf}

## A graph with two dense groups
g <- sample_gnp(10, p = 1 / 2) + sample_gnp(10, p = 1 / 2)
hrg <- fit_hrg(g)
hrg
summary(as.hclust(hrg))

## The consensus tree for it
consensus_tree(g, hrg = hrg, start = TRUE)

## Prediction of missing edges
g2 <- make_full_graph(4) + (make_full_graph(4) - path(1, 2))
predict_edges(g2)
\dontshow{\}) # examplesIf}
}
\references{
A. Clauset, C. Moore, and M.E.J. Newman. Hierarchical structure
and the prediction of missing links in networks. \emph{Nature} 453, 98--101
(2008);

A. Clauset, C. Moore, and M.E.J. Newman. Structural Inference of Hierarchies
in Networks. In E. M. Airoldi et al. (Eds.): ICML 2006 Ws, \emph{Lecture
Notes in Computer Science} 4503, 1--13. Springer-Verlag, Berlin Heidelberg
(2007).
}
\seealso{
Other hierarchical random graph functions: 
\code{\link{consensus_tree}()},
\code{\link{hrg}()},
\code{\link{hrg-methods}},
\code{\link{hrg_tree}()},
\code{\link{predict_edges}()},
\code{\link{print.igraphHRG}()},
\code{\link{print.igraphHRGConsensus}()},
\code{\link{sample_hrg}()}
}
\concept{hierarchical random graph functions}
