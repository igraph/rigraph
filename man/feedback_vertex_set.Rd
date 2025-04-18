% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/structural-properties.R
\name{feedback_vertex_set}
\alias{feedback_vertex_set}
\title{Finding a feedback vertex set in a graph}
\usage{
feedback_vertex_set(graph, weights = NULL, algo = c("exact_ip"))
}
\arguments{
\item{graph}{The input graph}

\item{weights}{Potential vertex weights. If the graph has a vertex
attribute called \sQuote{\code{weight}}, and this argument is
\code{NULL}, then the vertex attribute is used automatically. The goal of
the feedback vertex set problem is to find a feedback vertex set with
the smallest total weight.}

\item{algo}{Specifies the algorithm to use. Currently, \dQuote{\code{exact_ip}},
which solves the feedback vertex set problem with an exact integer
programming approach, is the only option.}
}
\value{
A vertex sequence (by default, but see the \code{return.vs.es} option
of \code{\link[=igraph_options]{igraph_options()}}) containing the feedback vertex set.
}
\description{
\ifelse{html}{\href{https://lifecycle.r-lib.org/articles/stages.html#experimental}{\figure{lifecycle-experimental.svg}{options: alt='[Experimental]'}}}{\strong{[Experimental]}}

A feedback vertex set of a graph is a subset of vertices whose removal breaks
all cycles in the graph. Finding a \emph{minimum} feedback vertex set is an
NP-complete problem, both on directed and undirected graphs.
}
\examples{

g <- make_lattice(c(3,3))
feedback_vertex_set(g)
}
\seealso{
Other structural.properties: 
\code{\link{bfs}()},
\code{\link{component_distribution}()},
\code{\link{connect}()},
\code{\link{constraint}()},
\code{\link{coreness}()},
\code{\link{degree}()},
\code{\link{dfs}()},
\code{\link{distance_table}()},
\code{\link{edge_density}()},
\code{\link{feedback_arc_set}()},
\code{\link{girth}()},
\code{\link{is_acyclic}()},
\code{\link{is_dag}()},
\code{\link{is_matching}()},
\code{\link{k_shortest_paths}()},
\code{\link{knn}()},
\code{\link{reciprocity}()},
\code{\link{subcomponent}()},
\code{\link{subgraph}()},
\code{\link{topo_sort}()},
\code{\link{transitivity}()},
\code{\link{unfold_tree}()},
\code{\link{which_multiple}()},
\code{\link{which_mutual}()}

Graph cycles
\code{\link{feedback_arc_set}()},
\code{\link{find_cycle}()},
\code{\link{girth}()},
\code{\link{has_eulerian_path}()},
\code{\link{is_acyclic}()},
\code{\link{is_dag}()},
\code{\link{simple_cycles}()}
}
\concept{cycles}
\concept{structural.properties}
\keyword{graphs}
\section{Related documentation in the C library}{\href{https://igraph.org/c/html/latest/igraph-Structural.html#igraph_feedback_vertex_set}{\code{feedback_vertex_set()}}.}

