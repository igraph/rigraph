
## -----------------------------------------------------------------------
##
##   IGraph R package
##   Copyright (C) 2015  Gabor Csardi <csardi.gabor@gmail.com>
##   334 Harvard street, Cambridge, MA 02139 USA
##   
##   This program is free software; you can redistribute it and/or modify
##   it under the terms of the GNU General Public License as published by
##   the Free Software Foundation; either version 2 of the License, or
##   (at your option) any later version.
##
##   This program is distributed in the hope that it will be useful,
##   but WITHOUT ANY WARRANTY; without even the implied warranty of
##   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
##   GNU General Public License for more details.
##   
##   You should have received a copy of the GNU General Public License
##   along with this program; if not, write to the Free Software
##   Foundation, Inc.,  51 Franklin Street, Fifth Floor, Boston, MA
##   02110-1301 USA
##
## -----------------------------------------------------------------------

#' @include auto.R
NULL

#' Centralization of a graph
#' 
#' Centralization is a method for creating a graph level centralization
#' measure from the centrality scores of the vertices.
#' 
#' Centralization is a general method for calculating a graph-level
#' centrality score based on node-level centrality measure. The formula for
#' this is
#' \deqn{C(G)=\sum_v (\max_w c_w - c_v),}{ C(G)=sum( max(c(w), w) - c(v),v),}
#' where \eqn{c_v}{c(v)} is the centrality of vertex \eqn{v}.
#' 
#' The graph-level centrality score can be normalized by dividing by the
#' maximum theoretical score for a graph with the same number of vertices,
#' using the same parameters, e.g. directedness, whether we consider loop
#' edges, etc.
#' 
#' For degree, closeness and betweenness the most centralized structure is
#' some version of the star graph, in-star, out-star or undirected star.
#' 
#' For eigenvector centrality the most centralized structure is the graph
#' with a single edge (and potentially many isolates).
#' 
#' \code{centralize} implements general centralization formula to calculate
#' a graph-level score from vertex-level scores.
#' 
#' @param scores The vertex level centrality scores.
#' @param theoretical.max Real scalar. The graph level centrality score of
#'   the most centralized graph with the same number of vertices as the graph
#'   under study. This is only used if the \code{normalized} argument is set
#'   to \code{TRUE}.
#' @param normalized Logical scalar. Whether to normalize the graph level
#'   centrality score by dividing by the supplied theoretical maximum.
#' @return A real scalar, the centralization of the graph from which
#'   \code{scores} were derived.
#'
#' @aliases centralization centralize.scores
#' @family centralization related
#' 
#' @export
#' @references Freeman, L.C.  (1979).  Centrality in Social Networks I:
#' Conceptual Clarification. \emph{Social Networks} 1, 215--239.
#' 
#' Wasserman, S., and Faust, K.  (1994).  \emph{Social Network Analysis:
#' Methods and Applications.} Cambridge University Press.
#'
#' @examples
#' # A BA graph is quite centralized
#' g <- sample_pa(1000, m=4)
#' centr_degree(g)$centralization
#' centr_clo(g, mode="all")$centralization
#' centr_eigen(g, directed=FALSE)$centralization
#' 
#' # The most centralized graph according to eigenvector centrality
#' g0 <- graph( c(2,1), n=10, dir=FALSE )
#' g1 <- make_star(10, mode="undirected")
#' centr_eigen(g0)$centralization
#' centr_eigen(g1)$centralization

centralize <- centralize

#' Centralize a graph according to the degrees of vertices
#'
#' See \code{\link{centralize}} for a summary of graph centralization.
#' 
#' @param graph The input graph.
#' @param mode This is the same as the \code{mode} argument of
#'   \code{degree}.
#' @param loops Logical scalar, whether to consider loops edges when
#'   calculating the degree.
#' @param normalized Logical scalar. Whether to normalize the graph level
#'   centrality score by dividing by the theoretical maximum.
#' @return A named list with the following components:
#'   \item{res}{The node-level centrality scores.}
#'   \item{centralization}{The graph level centrality index.}
#'   \item{theoretical_max}{The maximum theoretical graph level
#'     centralization score for a graph with the given number of vertices,
#'     using the same parameters. If the \code{normalized} argument was
#'     \code{TRUE}, then the result was divided by this number.}
#'
#' @aliases centralization.degree
#' @family centralization related
#' 
#' @export
#' 
#' @examples
#' # A BA graph is quite centralized
#' g <- sample_pa(1000, m = 4)
#' centr_degree(g)$centralization
#' centr_clo(g, mode = "all")$centralization
#' centr_betw(g, directed = FALSE)$centralization
#' centr_eigen(g, directed = FALSE)$centralization

centr_degree <- centr_degree

#' Theoretical maximum for degree centralization
#'
#' See \code{\link{centralize}} for a summary of graph centralization.
#' 
#' @param graph The input graph. It can also be \code{NULL}, if
#'   \code{nodes}, \code{mode} and \code{loops} are all given.
#' @param nodes The number of vertices. This is ignored if the graph is given.
#' @param mode This is the same as the \code{mode} argument of
#'   \code{degree}.
#' @param loops Logical scalar, whether to consider loops edges when
#'   calculating the degree.
#' @return Real scalar, the theoretical maximum (unnormalized) graph degree
#'   centrality score for graphs with given order and other parameters.
#'
#' @aliases centralization.degree.tmax
#' @family centralization related
#' 
#' @export
#' 
#' @examples
#' # A BA graph is quite centralized
#' g <- sample_pa(1000, m = 4)
#' centr_degree(g, normalized = FALSE)$centralization %>%
#'  `/`(centr_degree_tmax(g))
#' centr_degree(g, normalized = TRUE)$centralization

centr_degree_tmax <- centr_degree_tmax


#' Centralize a graph according to the betweenness of vertices
#'
#' See \code{\link{centralize}} for a summary of graph centralization.
#' 
#' @param graph The input graph.
#' @param directed logical scalar, whether to use directed shortest paths for
#'   calculating betweenness.
#' @param nobigint Logical scalar, whether to use big integers for the
#' betweenness calculation. This argument is passed to the
#' \code{\link{betweenness}} function.
#' @param normalized Logical scalar. Whether to normalize the graph level
#'   centrality score by dividing by the theoretical maximum.
#' @return A named list with the following components:
#'   \item{res}{The node-level centrality scores.}
#'   \item{centralization}{The graph level centrality index.}
#'   \item{theoretical_max}{The maximum theoretical graph level
#'     centralization score for a graph with the given number of vertices,
#'     using the same parameters. If the \code{normalized} argument was
#'     \code{TRUE}, then the result was divided by this number.}
#'
#' @aliases centralization.betweenness
#' @family centralization related
#' 
#' @export
#' 
#' @examples
#' # A BA graph is quite centralized
#' g <- sample_pa(1000, m = 4)
#' centr_degree(g)$centralization
#' centr_clo(g, mode = "all")$centralization
#' centr_betw(g, directed = FALSE)$centralization
#' centr_eigen(g, directed = FALSE)$centralization

centr_betw <- centr_betw

#' Theoretical maximum for betweenness centralization
#'
#' See \code{\link{centralize}} for a summary of graph centralization.
#' 
#' @param graph The input graph. It can also be \code{NULL}, if
#'   \code{nodes} is given.
#' @param nodes The number of vertices. This is ignored if the graph is
#'   given.
#' @param directed logical scalar, whether to use directed shortest paths
#'   for calculating betweenness.
#' @return Real scalar, the theoretical maximum (unnormalized) graph
#'   betweenness centrality score for graphs with given order and other
#'   parameters.
#'
#' @aliases centralization.betweenness.tmax
#' @family centralization related
#' 
#' @export
#' 
#' @examples
#' # A BA graph is quite centralized
#' g <- sample_pa(1000, m = 4)
#' centr_betw(g, normalized = FALSE)$centralization %>%
#'  `/`(centr_betw_tmax(g))
#' centr_betw(g, normalized = TRUE)$centralization

centr_betw_tmax <- centr_betw_tmax

#' Centralize a graph according to the closeness of vertices
#'
#' See \code{\link{centralize}} for a summary of graph centralization.
#' 
#' @param graph The input graph.
#' @param mode This is the same as the \code{mode} argument of 
#'   \code{closeness}.
#' @param normalized Logical scalar. Whether to normalize the graph level
#'   centrality score by dividing by the theoretical maximum.
#' @return A named list with the following components:
#'   \item{res}{The node-level centrality scores.}
#'   \item{centralization}{The graph level centrality index.}
#'   \item{theoretical_max}{The maximum theoretical graph level
#'     centralization score for a graph with the given number of vertices,
#'     using the same parameters. If the \code{normalized} argument was
#'     \code{TRUE}, then the result was divided by this number.}
#'
#' @aliases centralization.closeness
#' @family centralization related
#' 
#' @export
#' 
#' @examples
#' # A BA graph is quite centralized
#' g <- sample_pa(1000, m = 4)
#' centr_degree(g)$centralization
#' centr_clo(g, mode = "all")$centralization
#' centr_betw(g, directed = FALSE)$centralization
#' centr_eigen(g, directed = FALSE)$centralization

centr_clo <- centr_clo

#' Theoretical maximum for closeness centralization
#'
#' See \code{\link{centralize}} for a summary of graph centralization.
#' 
#' @param graph The input graph. It can also be \code{NULL}, if
#'   \code{nodes} is given.
#' @param nodes The number of vertices. This is ignored if the graph is
#'   given.
#' @param mode This is the same as the \code{mode} argument of 
#'   \code{closeness}.
#' @return Real scalar, the theoretical maximum (unnormalized) graph
#'   closeness centrality score for graphs with given order and other
#'   parameters.
#'
#' @aliases centralization.closeness.tmax
#' @family centralization related
#' 
#' @export
#' 
#' @examples
#' # A BA graph is quite centralized
#' g <- sample_pa(1000, m = 4)
#' centr_clo(g, normalized = FALSE)$centralization %>%
#'  `/`(centr_clo_tmax(g))
#' centr_clo(g, normalized = TRUE)$centralization

centr_clo_tmax <- centr_clo_tmax

#' Centralize a graph according to the eigenvector centrality of vertices
#'
#' See \code{\link{centralize}} for a summary of graph centralization.
#' 
#' @param graph The input graph.
#' @param directed logical scalar, whether to use directed shortest paths for
#'   calculating eigenvector centrality.
#' @param scale Whether to rescale the eigenvector centrality scores, such that
#'   the maximum score is one.
#' @param options This is passed to \code{\link{eigen_centrality}}, the options
#'   for the ARPACK eigensolver.
#' @param normalized Logical scalar. Whether to normalize the graph level
#'   centrality score by dividing by the theoretical maximum.
#' @return A named list with the following components:
#'   \item{vector}{The node-level centrality scores.}
#'   \item{value}{The corresponding eigenvalue.}
#'   \item{options}{ARPACK options, see the return value of
#'     \code{\link{eigen_centrality}} for details.} 
#'   \item{centralization}{The graph level centrality index.}
#'   \item{theoretical_max}{The same as above, the theoretical maximum
#'     centralization score for a graph with the same number of vertices.}
#'
#' @aliases centralization.evcent
#' @family centralization related
#' 
#' @export
#' 
#' @examples
#' # A BA graph is quite centralized
#' g <- sample_pa(1000, m = 4)
#' centr_degree(g)$centralization
#' centr_clo(g, mode = "all")$centralization
#' centr_betw(g, directed = FALSE)$centralization
#' centr_eigen(g, directed = FALSE)$centralization
#'
#' # The most centralized graph according to eigenvector centrality
#' g0 <- make_graph(c(2,1), n = 10, dir = FALSE)
#' g1 <- make_star(10, mode = "undirected")
#' centr_eigen(g0)$centralization
#' centr_eigen(g1)$centralization

centr_eigen <- centr_eigen

#' Theoretical maximum for betweenness centralization
#'
#' See \code{\link{centralize}} for a summary of graph centralization.
#' 
#' @param graph The input graph. It can also be \code{NULL}, if
#'   \code{nodes} is given.
#' @param nodes The number of vertices. This is ignored if the graph is
#'   given.
#' @param directed logical scalar, whether to use directed shortest paths
#'   for calculating betweenness.
#' @param scale Whether to rescale the eigenvector centrality scores,
#'   such that the maximum score is one.
#' @return Real scalar, the theoretical maximum (unnormalized) graph
#'   betweenness centrality score for graphs with given order and other
#'   parameters.
#'
#' @aliases centralization.evcent.tmax
#' @family centralization related
#' 
#' @export
#' 
#' @examples
#' # A BA graph is quite centralized
#' g <- sample_pa(1000, m = 4)
#' centr_eigen(g, normalized = FALSE)$centralization %>%
#'  `/`(centr_eigen_tmax(g))
#' centr_eigen(g, normalized = TRUE)$centralization

centr_eigen_tmax <- centr_eigen_tmax
