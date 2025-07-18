% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/conversion.R
\name{as.matrix.igraph}
\alias{as.matrix.igraph}
\title{Convert igraph objects to adjacency or edge list matrices}
\usage{
\method{as.matrix}{igraph}(x, matrix.type = c("adjacency", "edgelist"), ...)
}
\arguments{
\item{x}{object of class \code{igraph}, the network}

\item{matrix.type}{character, type of matrix to return, currently "adjacency"
or "edgelist" are supported}

\item{\dots}{other arguments to/from other methods}
}
\value{
Depending on the value of \code{matrix.type} either a square
adjacency matrix or a two-column numeric matrix representing the edgelist.
}
\description{
Get adjacency or edgelist representation of the network stored as an
\code{igraph} object.
}
\details{
If \code{matrix.type} is \code{"edgelist"}, then a two-column numeric edge list
matrix is returned.  The value of \code{attrname} is ignored.

If \code{matrix.type} is \code{"adjacency"}, then a square adjacency matrix is
returned. For adjacency matrices, you can use the \code{attr} keyword argument
to use the values of an edge attribute in the matrix cells. See the
documentation of \link{as_adjacency_matrix} for more details.

Other arguments passed through \code{...} are passed to either
\code{\link[=as_adjacency_matrix]{as_adjacency_matrix()}} or \code{\link[=as_edgelist]{as_edgelist()}}
depending on the value of \code{matrix.type}.
}
\examples{

g <- make_graph("zachary")
as.matrix(g, "adjacency")
as.matrix(g, "edgelist")
# use edge attribute "weight"
E(g)$weight <- rep(1:10, length.out = ecount(g))
as.matrix(g, "adjacency", sparse = FALSE, attr = "weight")

}
\seealso{
Other conversion: 
\code{\link{as_adj_list}()},
\code{\link{as_adjacency_matrix}()},
\code{\link{as_biadjacency_matrix}()},
\code{\link{as_data_frame}()},
\code{\link{as_directed}()},
\code{\link{as_edgelist}()},
\code{\link{as_graphnel}()},
\code{\link{as_long_data_frame}()},
\code{\link{graph_from_adj_list}()},
\code{\link{graph_from_graphnel}()}
}
\author{
Michal Bojanowski, originally from the \code{intergraph} package
}
\concept{conversion}
