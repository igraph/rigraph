% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/make.R
\name{make_ring}
\alias{make_ring}
\alias{ring}
\title{Create a ring graph}
\usage{
make_ring(n, directed = FALSE, mutual = FALSE, circular = TRUE)

ring(...)
}
\arguments{
\item{n}{Number of vertices.}

\item{directed}{Whether the graph is directed.}

\item{mutual}{Whether directed edges are mutual. It is ignored in
undirected graphs.}

\item{circular}{Whether to create a circular ring. A non-circular
ring is essentially a \dQuote{line}: a tree where every non-leaf
vertex has one child.}

\item{...}{Passed to \code{make_ring()}.}
}
\value{
An igraph graph.
}
\description{
A ring is a one-dimensional lattice and this function is a special case
of \code{\link[=make_lattice]{make_lattice()}}.
}
\examples{
print_all(make_ring(10))
print_all(make_ring(10, directed = TRUE, mutual = TRUE))
}
\seealso{
Other deterministic constructors: 
\code{\link{graph_from_atlas}()},
\code{\link{graph_from_edgelist}()},
\code{\link{graph_from_literal}()},
\code{\link{make_}()},
\code{\link{make_chordal_ring}()},
\code{\link{make_empty_graph}()},
\code{\link{make_full_citation_graph}()},
\code{\link{make_full_graph}()},
\code{\link{make_graph}()},
\code{\link{make_lattice}()},
\code{\link{make_star}()},
\code{\link{make_tree}()}
}
\concept{deterministic constructors}
