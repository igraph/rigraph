% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/foreign.R
\name{read_graph}
\alias{read_graph}
\alias{LGL}
\alias{Pajek}
\alias{GraphML}
\alias{GML}
\alias{DL}
\alias{UCINET}
\title{Reading foreign file formats}
\usage{
read_graph(
  file,
  format = c("edgelist", "pajek", "ncol", "lgl", "graphml", "dimacs", "graphdb", "gml",
    "dl"),
  ...
)
}
\arguments{
\item{file}{The connection to read from. This can be a local file, or a
\code{http} or \code{ftp} connection. It can also be a character string with
the file name or URI.}

\item{format}{Character constant giving the file format. Right now
\code{edgelist}, \code{pajek}, \code{ncol}, \code{lgl}, \code{graphml},
\code{dimacs}, \code{graphdb}, \code{gml} and \code{dl} are supported,
the default is \code{edgelist}. As of igraph 0.4 this argument is case
insensitive.}

\item{\dots}{Additional arguments, see below.}
}
\value{
A graph object.
}
\description{
The \code{read_graph()} function is able to read graphs in various
representations from a file, or from a http connection. Various formats
are supported.
}
\details{
The \code{read_graph()} function may have additional arguments depending on
the file format (the \code{format} argument). See the details separately for
each file format, below.
}
\section{Edge list format}{

This format is a simple text file with numeric
vertex IDs defining the edges. There is no need to have newline characters
between the edges, a simple space will also do. Vertex IDs contained in
the file are assumed to start at zero.

Additional arguments:
\describe{
\item{n}{
The number of vertices in the
graph. If it is smaller than or equal to the largest integer in the file,
then it is ignored; so it is safe to set it to zero (the default).
}
\item{directed}{
Logical scalar, whether to create a directed graph. The
default value is \code{TRUE}.
}
}
}

\section{Pajek format}{

Currently igraph only supports Pajek network
files, with a \code{.net} extension, but not Pajek project files with
a \code{.paj} extension. Only network data is supported; permutations,
hierarchies, clusters and vectors are not.
}

\section{NCOL format}{

Additional arguments:
\describe{
\item{predef}{
Names of the vertices in the file.
If \code{character(0)} (the default) is given here
then vertex IDs will be assigned to vertex names in the order of
their appearance in the .ncol file.
If it is not \code{character(0)} and some unknown vertex names are found
in the .ncol file then new vertex ids will be assigned to them.
}
\item{names}{
Logical value, if \code{TRUE} (the default)
the symbolic names of the vertices will be added to the graph
as a vertex attribute called “name”.
}
\item{weights}{
Whether to add the weights of the edges to the graph
as an edge attribute called “weight”.
\code{"yes"} adds the weights (even if they are not present in the file,
in this case they are assumed to be zero).
\code{"no"} does not add any edge attribute.
\code{"auto"} (the default) adds the attribute if and only
if there is at least one explicit edge weight in the input file.
}
\item{directed}{
Whether to create a directed graph (default: \code{FALSE}).
As this format was originally used only for undirected graphs
there is no information in the file about the directedness of the graph.
}
}
}

\seealso{
\code{\link[=write_graph]{write_graph()}}

Foreign format readers
\code{\link{graph_from_graphdb}()},
\code{\link{write_graph}()}
}
\author{
Gabor Csardi \email{csardi.gabor@gmail.com}
}
\concept{foreign}
\keyword{graphs}
\section{Related documentation in the C library}{\href{https://igraph.org/c/html/latest/igraph-Foreign.html#igraph_read_graph_dimacs_flow}{\code{read_graph_dimacs_flow()}}, \href{https://igraph.org/c/html/latest/igraph-Foreign.html#igraph_read_graph_dl}{\code{read_graph_dl()}}, \href{https://igraph.org/c/html/latest/igraph-Foreign.html#igraph_read_graph_edgelist}{\code{read_graph_edgelist()}}, \href{https://igraph.org/c/html/latest/igraph-Foreign.html#igraph_read_graph_gml}{\code{read_graph_gml()}}, \href{https://igraph.org/c/html/latest/igraph-Foreign.html#igraph_read_graph_graphdb}{\code{read_graph_graphdb()}}, \href{https://igraph.org/c/html/latest/igraph-Foreign.html#igraph_read_graph_graphml}{\code{read_graph_graphml()}}, \href{https://igraph.org/c/html/latest/igraph-Foreign.html#igraph_read_graph_lgl}{\code{read_graph_lgl()}}, \href{https://igraph.org/c/html/latest/igraph-Foreign.html#igraph_read_graph_ncol}{\code{read_graph_ncol()}}, \href{https://igraph.org/c/html/latest/igraph-Foreign.html#igraph_read_graph_pajek}{\code{read_graph_pajek()}}.}

