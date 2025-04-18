% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/motifs.R
\name{sample_motifs}
\alias{sample_motifs}
\title{Graph motifs}
\usage{
sample_motifs(
  graph,
  size = 3,
  cut.prob = rep(0, size),
  sample.size = NULL,
  sample = NULL
)
}
\arguments{
\item{graph}{Graph object, the input graph.}

\item{size}{The size of the motif, currently size 3 and 4 are supported
in directed graphs and sizes 3-6 in undirected graphs.}

\item{cut.prob}{Numeric vector giving the probabilities that the search
graph is cut at a certain level. Its length should be the same as the size
of the motif (the \code{size} argument).
If \code{NULL}, the default, no cuts are made.}

\item{sample.size}{The number of vertices to use as a starting point for
finding motifs. Only used if the \code{sample} argument is \code{NULL}.
The default is \code{ceiling(vcount(graph) / 10)} .}

\item{sample}{If not \code{NULL} then it specifies the vertices to use as a
starting point for finding motifs.}
}
\value{
A numeric scalar, an estimate for the total number of motifs in
the graph.
}
\description{
Graph motifs are small connected induced subgraphs with a well-defined
structure.  These functions search a graph for various motifs.
}
\details{
\code{sample_motifs()} estimates the total number of motifs of a given
size in a graph based on a sample.
}
\examples{
g <- sample_pa(100)
motifs(g, 3)
count_motifs(g, 3)
sample_motifs(g, 3)
}
\seealso{
\code{\link[=isomorphism_class]{isomorphism_class()}}

Other graph motifs: 
\code{\link{count_motifs}()},
\code{\link{dyad_census}()},
\code{\link{motifs}()}
}
\concept{graph motifs}
