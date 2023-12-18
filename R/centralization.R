
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

NULL

#' Centralization of a graph
#'
#' Centralization is a method for creating a graph level centralization
#' measure from the centrality scores of the vertices.
#'
#' Centralization is a general method for calculating a graph-level
#' centrality score based on node-level centrality measure. The formula for
#' this is
#' \deqn{C(G)=\sum_v (\max_w c_w - c_v),}{ C(G)=sum(max(c(w), w) - c(v), v),}
#' where \eqn{c_v}{c(v)} is the centrality of vertex \eqn{v}.
#'
#' The graph-level centralization measure can be normalized by dividing by the
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
#' `centralize()` implements general centralization formula to calculate
#' a graph-level score from vertex-level scores.
#'
#' @param scores The vertex level centrality scores.
#' @param theoretical.max Real scalar. The graph-level centralization measure of
#'   the most centralized graph with the same number of vertices as the graph
#'   under study. This is only used if the `normalized` argument is set
#'   to `TRUE`.
#' @param normalized Logical scalar. Whether to normalize the graph level
#'   centrality score by dividing by the supplied theoretical maximum.
#' @return A real scalar, the centralization of the graph from which
#'   `scores` were derived.
#'
#' @aliases centralization centralize.scores
#' @family centralization related
#'
#' @export
#' @references Freeman, L.C.  (1979).  Centrality in Social Networks I:
#' Conceptual Clarification. *Social Networks* 1, 215--239.
#'
#' Wasserman, S., and Faust, K.  (1994).  *Social Network Analysis:
#' Methods and Applications.* Cambridge University Press.
#'
#' @examples
#' # A BA graph is quite centralized
#' g <- sample_pa(1000, m = 4)
#' centr_degree(g)$centralization
#' centr_clo(g, mode = "all")$centralization
#' centr_eigen(g, directed = FALSE)$centralization
#'
#' # Calculate centralization from pre-computed scores
#' deg <- degree(g)
#' tmax <- centr_degree_tmax(g, loops = FALSE)
#' centralize(deg, tmax)
#'
#' # The most centralized graph according to eigenvector centrality
#' g0 <- make_graph(c(2, 1), n = 10, dir = FALSE)
#' g1 <- make_star(10, mode = "undirected")
#' centr_eigen(g0)$centralization
#' centr_eigen(g1)$centralization
centralize <- centralization_impl

#' Centralize a graph according to the degrees of vertices
#'
#' See [centralize()] for a summary of graph centralization.
#'
#' @param graph The input graph.
#' @param mode This is the same as the `mode` argument of
#'   `degree()`.
#' @param loops Logical scalar, whether to consider loops edges when
#'   calculating the degree.
#' @param normalized Logical scalar. Whether to normalize the graph level
#'   centrality score by dividing by the theoretical maximum.
#' @return A named list with the following components:
#'   \item{res}{The node-level centrality scores.}
#'   \item{centralization}{The graph level centrality index.}
#'   \item{theoretical_max}{The maximum theoretical graph level
#'     centralization score for a graph with the given number of vertices,
#'     using the same parameters. If the `normalized` argument was
#'     `TRUE`, then the result was divided by this number.}
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
centr_degree <- centralization_degree_impl

#' Theoretical maximum for degree centralization
#'
#' See [centralize()] for a summary of graph centralization.
#'
#' @param graph The input graph. It can also be `NULL`, if
#'   `nodes`, `mode` and `loops` are all given.
#' @param nodes The number of vertices. This is ignored if the graph is given.
#' @param mode This is the same as the `mode` argument of
#'   `degree()`.
#' @param loops Logical scalar, whether to consider loops edges when
#'   calculating the degree. Currently the default value is `FALSE`,
#'   but this argument will be required from igraph 1.4.0.
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
#'   `/`(centr_degree_tmax(g, loops = FALSE))
#' centr_degree(g, normalized = TRUE)$centralization
centr_degree_tmax <- function(graph = NULL, nodes = 0, mode = c("all", "out", "in", "total"), loops = FALSE) {
  # Compatibility check with pre-igraph 1.3.0
  if (missing(loops)) {
    warning("centr_degree_tmax() will require an explicit value for its 'loops' argument from igraph 1.4.0. Assuming FALSE now.")
  }
  # Argument checks
  ensure_igraph(graph, optional = TRUE)

  nodes <- as.numeric(nodes)
  mode <- switch(igraph.match.arg(mode),
    "out" = 1,
    "in" = 2,
    "all" = 3,
    "total" = 3
  )
  loops <- as.logical(loops)

  on.exit(.Call(R_igraph_finalizer))
  # Function call
  res <- .Call(R_igraph_centralization_degree_tmax, graph, nodes, mode, loops)

  res
}


#' Centralize a graph according to the betweenness of vertices
#'
#' See [centralize()] for a summary of graph centralization.
#'
#' @param graph The input graph.
#' @param directed logical scalar, whether to use directed shortest paths for
#'   calculating betweenness.
#' @param normalized Logical scalar. Whether to normalize the graph level
#'   centrality score by dividing by the theoretical maximum.
#' @return A named list with the following components:
#'   \item{res}{The node-level centrality scores.}
#'   \item{centralization}{The graph level centrality index.}
#'   \item{theoretical_max}{The maximum theoretical graph level
#'     centralization score for a graph with the given number of vertices,
#'     using the same parameters. If the `normalized` argument was
#'     `TRUE`, then the result was divided by this number.}
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
centr_betw <- function(graph, directed = TRUE, normalized = TRUE) {
  # Argument checks
  ensure_igraph(graph)

  directed <- as.logical(directed)
  normalized <- as.logical(normalized)

  on.exit(.Call(R_igraph_finalizer))
  # Function call
  res <- .Call(R_igraph_centralization_betweenness, graph, directed, normalized)

  res
}

#' Theoretical maximum for betweenness centralization
#'
#' See [centralize()] for a summary of graph centralization.
#'
#' @param graph The input graph. It can also be `NULL`, if
#'   `nodes` is given.
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
#'   `/`(centr_betw_tmax(g))
#' centr_betw(g, normalized = TRUE)$centralization
centr_betw_tmax <- centralization_betweenness_tmax_impl

#' Centralize a graph according to the closeness of vertices
#'
#' See [centralize()] for a summary of graph centralization.
#'
#' @param graph The input graph.
#' @param mode This is the same as the `mode` argument of
#'   `closeness()`.
#' @param normalized Logical scalar. Whether to normalize the graph level
#'   centrality score by dividing by the theoretical maximum.
#' @return A named list with the following components:
#'   \item{res}{The node-level centrality scores.}
#'   \item{centralization}{The graph level centrality index.}
#'   \item{theoretical_max}{The maximum theoretical graph level
#'     centralization score for a graph with the given number of vertices,
#'     using the same parameters. If the `normalized` argument was
#'     `TRUE`, then the result was divided by this number.}
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
centr_clo <- centralization_closeness_impl

#' Theoretical maximum for closeness centralization
#'
#' See [centralize()] for a summary of graph centralization.
#'
#' @param graph The input graph. It can also be `NULL`, if
#'   `nodes` is given.
#' @param nodes The number of vertices. This is ignored if the graph is
#'   given.
#' @param mode This is the same as the `mode` argument of
#'   `closeness()`.
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
#'   `/`(centr_clo_tmax(g))
#' centr_clo(g, normalized = TRUE)$centralization
centr_clo_tmax <- centralization_closeness_tmax_impl

#' Centralize a graph according to the eigenvector centrality of vertices
#'
#' See [centralize()] for a summary of graph centralization.
#'
#' @param graph The input graph.
#' @param directed logical scalar, whether to use directed shortest paths for
#'   calculating eigenvector centrality.
#' @param scale Whether to rescale the eigenvector centrality scores, such that
#'   the maximum score is one.
#' @param options This is passed to [eigen_centrality()], the options
#'   for the ARPACK eigensolver.
#' @param normalized Logical scalar. Whether to normalize the graph level
#'   centrality score by dividing by the theoretical maximum.
#' @return A named list with the following components:
#'   \item{vector}{The node-level centrality scores.}
#'   \item{value}{The corresponding eigenvalue.}
#'   \item{options}{ARPACK options, see the return value of
#'     [eigen_centrality()] for details.}
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
#' g0 <- make_graph(c(2, 1), n = 10, dir = FALSE)
#' g1 <- make_star(10, mode = "undirected")
#' centr_eigen(g0)$centralization
#' centr_eigen(g1)$centralization
centr_eigen <- centralization_eigenvector_centrality_impl

#' Theoretical maximum for betweenness centralization
#'
#' See [centralize()] for a summary of graph centralization.
#'
#' @param graph The input graph. It can also be `NULL`, if
#'   `nodes` is given.
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
#'   `/`(centr_eigen_tmax(g))
#' centr_eigen(g, normalized = TRUE)$centralization
centr_eigen_tmax <- centralization_eigenvector_centrality_tmax_impl
#' @export centralization.betweenness
deprecated("centralization.betweenness", centr_betw)
#' @export centralization.betweenness.tmax
deprecated("centralization.betweenness.tmax", centr_betw_tmax)
#' @export centralization.closeness
deprecated("centralization.closeness", centr_clo)
#' @export centralization.closeness.tmax
deprecated("centralization.closeness.tmax", centr_clo_tmax)
#' @export centralization.degree
deprecated("centralization.degree", centr_degree)
#' @export centralization.degree.tmax
deprecated("centralization.degree.tmax", centr_degree_tmax)
#' @export centralization.evcent
deprecated("centralization.evcent", centr_eigen)
#' @export centralization.evcent.tmax
deprecated("centralization.evcent.tmax", centr_eigen_tmax)
#' @export centralize.scores
deprecated("centralize.scores", centralize)
