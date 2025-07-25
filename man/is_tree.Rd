% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/trees.R
\name{is_tree}
\alias{is_tree}
\title{Decide whether a graph is a tree.}
\usage{
is_tree(graph, mode = c("out", "in", "all", "total"), details = FALSE)
}
\arguments{
\item{graph}{An igraph graph object}

\item{mode}{Whether to consider edge directions in a directed graph.
\sQuote{all} ignores edge directions; \sQuote{out} requires edges to be
oriented outwards from the root, \sQuote{in} requires edges to be oriented
towards the root.}

\item{details}{Whether to return only whether the graph is a tree (\code{FALSE})
or also a possible root (\code{TRUE})}
}
\value{
When \code{details} is \code{FALSE}, a logical value that indicates
whether the graph is a tree. When \code{details} is \code{TRUE}, a named
list with two entries:
\describe{
\item{res}{
Logical value that indicates whether the graph is a tree.
}
\item{root}{
The root vertex of the tree; undefined if the graph is not a tree.
}
}
}
\description{
\code{is_tree()} decides whether a graph is a tree, and optionally returns a
possible root vertex if the graph is a tree.
}
\details{
An undirected graph is a tree if it is connected and has no cycles.
In the directed case, a possible additional requirement is that all edges
are oriented away from a root (out-tree or arborescence) or all edges are
oriented towards a root (in-tree or anti-arborescence). This test can be
controlled using the mode parameter.

By convention, the null graph (i.e. the graph with no vertices) is considered
not to be a tree.
}
\examples{

g <- make_tree(7, 2)
is_tree(g)
is_tree(g, details = TRUE)

}
\seealso{
Other trees: 
\code{\link{is_forest}()},
\code{\link{make_from_prufer}()},
\code{\link{sample_spanning_tree}()},
\code{\link{to_prufer}()}
}
\concept{trees}
\keyword{graphs}
\section{Related documentation in the C library}{\href{https://igraph.org/c/html/latest/igraph-Structural.html#igraph_is_tree}{\code{is_tree()}}.}

