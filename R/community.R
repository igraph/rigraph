
#' Creates a communities object.
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `create.communities()` was renamed to `make_clusters()` to create a more
#' consistent API.
#' @inheritParams make_clusters
#' @keywords internal
#' @export
create.communities <- function(graph, membership = NULL, algorithm = NULL, merges = NULL, modularity = TRUE) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "create.communities()", "make_clusters()")
  make_clusters(graph = graph, membership = membership, algorithm = algorithm, merges = merges, modularity = modularity)
} # nocov end

#' Community structure via short random walks
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `walktrap.community()` was renamed to `cluster_walktrap()` to create a more
#' consistent API.
#' @inheritParams cluster_walktrap
#' @keywords internal
#' @export
walktrap.community <- function(graph, weights = NULL, steps = 4, merges = TRUE, modularity = TRUE, membership = TRUE) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "walktrap.community()", "cluster_walktrap()")
  cluster_walktrap(graph = graph, weights = weights, steps = steps, merges = merges, modularity = modularity, membership = membership)
} # nocov end

#' Finding communities in graphs based on statistical meachanics
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `spinglass.community()` was renamed to `cluster_spinglass()` to create a more
#' consistent API.
#' @inheritParams cluster_spinglass
#' @keywords internal
#' @export
spinglass.community <- function(graph, weights = NULL, vertex = NULL, spins = 25, parupdate = FALSE, start.temp = 1, stop.temp = 0.01, cool.fact = 0.99, update.rule = c("config", "random", "simple"), gamma = 1.0, implementation = c("orig", "neg"), gamma.minus = 1.0) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "spinglass.community()", "cluster_spinglass()")
  cluster_spinglass(graph = graph, weights = weights, vertex = vertex, spins = spins, parupdate = parupdate, start.temp = start.temp, stop.temp = stop.temp, cool.fact = cool.fact, update.rule = update.rule, gamma = gamma, implementation = implementation, gamma.minus = gamma.minus)
} # nocov end

#' Functions to deal with the result of network community detection
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `showtrace()` was renamed to `show_trace()` to create a more
#' consistent API.
#' @inheritParams show_trace
#' @keywords internal
#' @export
showtrace <- function(communities) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "showtrace()", "show_trace()")
  show_trace(communities = communities)
} # nocov end

#' Optimal community structure
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `optimal.community()` was renamed to `cluster_optimal()` to create a more
#' consistent API.
#' @inheritParams cluster_optimal
#' @keywords internal
#' @export
optimal.community <- function(graph, weights = NULL) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "optimal.community()", "cluster_optimal()")
  cluster_optimal(graph = graph, weights = weights)
} # nocov end

#' Finding community structure by multi-level optimization of modularity
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `multilevel.community()` was renamed to `cluster_louvain()` to create a more
#' consistent API.
#' @inheritParams cluster_louvain
#' @keywords internal
#' @export
multilevel.community <- function(graph, weights = NULL, resolution = 1) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "multilevel.community()", "cluster_louvain()")
  cluster_louvain(graph = graph, weights = weights, resolution = resolution)
} # nocov end

#' Modularity of a community structure of a graph
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `mod.matrix()` was renamed to `modularity_matrix()` to create a more
#' consistent API.
#' @inheritParams modularity_matrix
#' @keywords internal
#' @export
mod.matrix <- function(graph, membership, weights = NULL, resolution = 1, directed = TRUE) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "mod.matrix()", "modularity_matrix()")
  modularity_matrix(graph = graph, membership = membership, weights = weights, resolution = resolution, directed = directed)
} # nocov end

#' Community structure detecting based on the leading eigenvector of the community matrix
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `leading.eigenvector.community()` was renamed to `cluster_leading_eigen()` to create a more
#' consistent API.
#' @inheritParams cluster_leading_eigen
#' @keywords internal
#' @export
leading.eigenvector.community <- function(graph, steps = -1, weights = NULL, start = NULL, options = arpack_defaults(), callback = NULL, extra = NULL, env = parent.frame()) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "leading.eigenvector.community()", "cluster_leading_eigen()")
  cluster_leading_eigen(graph = graph, steps = steps, weights = weights, start = start, options = options, callback = callback, extra = extra, env = env)
} # nocov end

#' Finding communities based on propagating labels
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `label.propagation.community()` was renamed to `cluster_label_prop()` to create a more
#' consistent API.
#' @inheritParams cluster_label_prop
#' @keywords internal
#' @export
label.propagation.community <- function(graph, weights = NULL, ..., mode = c("out", "in", "all"), initial = NULL, fixed = NULL) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "label.propagation.community()", "cluster_label_prop()")
  cluster_label_prop(graph = graph, weights = weights, mode = mode, initial = initial, fixed = fixed, ...)
} # nocov end

#' Functions to deal with the result of network community detection
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `is.hierarchical()` was renamed to `is_hierarchical()` to create a more
#' consistent API.
#' @inheritParams is_hierarchical
#' @keywords internal
#' @export
is.hierarchical <- function(communities) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "is.hierarchical()", "is_hierarchical()")
  is_hierarchical(communities = communities)
} # nocov end

#' Infomap community finding
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `infomap.community()` was renamed to `cluster_infomap()` to create a more
#' consistent API.
#' @inheritParams cluster_infomap
#' @keywords internal
#' @export
infomap.community <- function(graph, e.weights = NULL, v.weights = NULL, nb.trials = 10, modularity = TRUE) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "infomap.community()", "cluster_infomap()")
  cluster_infomap(graph = graph, e.weights = e.weights, v.weights = v.weights, nb.trials = nb.trials, modularity = modularity)
} # nocov end

#' Community structure via greedy optimization of modularity
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `fastgreedy.community()` was renamed to `cluster_fast_greedy()` to create a more
#' consistent API.
#' @inheritParams cluster_fast_greedy
#' @keywords internal
#' @export
fastgreedy.community <- function(graph, merges = TRUE, modularity = TRUE, membership = TRUE, weights = NULL) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "fastgreedy.community()", "cluster_fast_greedy()")
  cluster_fast_greedy(graph = graph, merges = merges, modularity = modularity, membership = membership, weights = weights)
} # nocov end

#' Community structure detection based on edge betweenness
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `edge.betweenness.community()` was renamed to `cluster_edge_betweenness()` to create a more
#' consistent API.
#' @inheritParams cluster_edge_betweenness
#' @keywords internal
#' @export
edge.betweenness.community <- function(graph, weights = NULL, directed = TRUE, edge.betweenness = TRUE, merges = TRUE, bridges = TRUE, modularity = TRUE, membership = TRUE) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "edge.betweenness.community()", "cluster_edge_betweenness()")
  cluster_edge_betweenness(graph = graph, weights = weights, directed = directed, edge.betweenness = edge.betweenness, merges = merges, bridges = bridges, modularity = modularity, membership = membership)
} # nocov end

#' Community structure dendrogram plots
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `dendPlot()` was renamed to `plot_dendrogram()` to create a more
#' consistent API.
#' @inheritParams plot_dendrogram
#' @keywords internal
#' @export
dendPlot <- function(x, mode = igraph_opt("dend.plot.type"), ...) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "dendPlot()", "plot_dendrogram()")
  plot_dendrogram(x = x, mode = mode, ...)
} # nocov end

#' Functions to deal with the result of network community detection
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `cutat()` was renamed to `cut_at()` to create a more
#' consistent API.
#' @inheritParams cut_at
#' @keywords internal
#' @export
cutat <- function(communities, no, steps) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "cutat()", "cut_at()")
  cut_at(communities = communities, no = no, steps = steps)
} # nocov end

#' Contract several vertices into a single one
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `contract.vertices()` was renamed to `contract()` to create a more
#' consistent API.
#' @inheritParams contract
#' @keywords internal
#' @export
contract.vertices <- function(graph, mapping, vertex.attr.comb = igraph_opt("vertex.attr.comb")) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "contract.vertices()", "contract()")
  contract(graph = graph, mapping = mapping, vertex.attr.comb = vertex.attr.comb)
} # nocov end

#' Functions to deal with the result of network community detection
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `code.length()` was renamed to `code_len()` to create a more
#' consistent API.
#' @inheritParams code_len
#' @keywords internal
#' @export
code.length <- function(communities) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "code.length()", "code_len()")
  code_len(communities = communities)
} # nocov end
#   IGraph R package
#   Copyright (C) 2005-2012  Gabor Csardi <csardi.gabor@gmail.com>
#   334 Harvard street, Cambridge, MA 02139 USA
#
#   This program is free software; you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation; either version 2 of the License, or
#   (at your option) any later version.
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with this program; if not, write to the Free Software
#   Foundation, Inc.,  51 Franklin Street, Fifth Floor, Boston, MA
#   02110-1301 USA
#
###################################################################

###################################################################
# Community structure
###################################################################

#' Functions to deal with the result of network community detection
#'
#' igraph community detection functions return their results as an object from
#' the `communities` class. This manual page describes the operations of
#' this class.
#'
#' Community structure detection algorithms try to find dense subgraphs in
#' directed or undirected graphs, by optimizing some criteria, and usually
#' using heuristics.
#'
#' igraph implements a number of community detection methods (see them below),
#' all of which return an object of the class `communities`. Because the
#' community structure detection algorithms are different, `communities`
#' objects do not always have the same structure. Nevertheless, they have some
#' common operations, these are documented here.
#'
#' The [print()] generic function is defined for `communities`, it
#' prints a short summary.
#'
#' The `length` generic function call be called on `communities` and
#' returns the number of communities.
#'
#' The `sizes()` function returns the community sizes, in the order of their
#' ids.
#'
#' `membership()` gives the division of the vertices, into communities. It
#' returns a numeric vector, one value for each vertex, the id of its
#' community. Community ids start from one. Note that some algorithms calculate
#' the complete (or incomplete) hierarchical structure of the communities, and
#' not just a single partitioning. For these algorithms typically the
#' membership for the highest modularity value is returned, but see also the
#' manual pages of the individual algorithms.
#'
#' `communities()` is also the name of a function, that returns a list of
#' communities, each identified by their vertices. The vertices will have
#' symbolic names if the `add.vertex.names` igraph option is set, and the
#' graph itself was named. Otherwise numeric vertex ids are used.
#'
#' `modularity()` gives the modularity score of the partitioning. (See
#' [modularity.igraph()] for details. For algorithms that do not
#' result a single partitioning, the highest modularity value is returned.
#'
#' `algorithm()` gives the name of the algorithm that was used to calculate
#' the community structure.
#'
#' `crossing()` returns a logical vector, with one value for each edge,
#' ordered according to the edge ids. The value is `TRUE` iff the edge
#' connects two different communities, according to the (best) membership
#' vector, as returned by `membership()`.
#'
#' `is_hierarchical()` checks whether a hierarchical algorithm was used to
#' find the community structure. Some functions only make sense for
#' hierarchical methods (e.g. `merges()`, `cut_at()` and
#' [as.dendrogram()]).
#'
#' `merges()` returns the merge matrix for hierarchical methods. An error
#' message is given, if a non-hierarchical method was used to find the
#' community structure. You can check this by calling `is_hierarchical()` on
#' the `communities` object.
#'
#' `cut_at()` cuts the merge tree of a hierarchical community finding method,
#' at the desired place and returns a membership vector. The desired place can
#' be expressed as the desired number of communities or as the number of merge
#' steps to make. The function gives an error message, if called with a
#' non-hierarchical method.
#'
#' [as.dendrogram()] converts a hierarchical community structure to a
#' `dendrogram` object. It only works for hierarchical methods, and gives
#' an error message to others. See [stats::dendrogram()] for details.
#'
#' [stats::as.hclust()] is similar to [as.dendrogram()], but converts a
#' hierarchical community structure to a `hclust` object.
#'
#' [ape::as.phylo()] converts a hierarchical community structure to a `phylo`
#' object, you will need the `ape` package for this.
#'
#' `show_trace()` works (currently) only for communities found by the leading
#' eigenvector method ([cluster_leading_eigen()]), and
#' returns a character vector that gives the steps performed by the algorithm
#' while finding the communities.
#'
#' `code_len()` is defined for the InfoMAP method
#' ([cluster_infomap()] and returns the code length of the
#' partition.
#'
#' It is possibly to call the [plot()] function on `communities`
#' objects. This will plot the graph (and uses [plot.igraph()]
#' internally), with the communities shown. By default it colores the vertices
#' according to their communities, and also marks the vertex groups
#' corresponding to the communities. It passes additional arguments to
#' [plot.igraph()], please see that and also
#' [igraph.plotting] on how to change the plot.
#'
#' @rdname communities
#' @family community
#' @param communities,x,object A `communities` object, the result of an
#'   igraph community detection function.
#' @param graph An igraph graph object, corresponding to `communities`.
#' @param y An igraph graph object, corresponding to the communities in
#'   `x`.
#' @param no Integer scalar, the desired number of communities. If too low or
#'   two high, then an error message is given. Exactly one of `no` and
#'   `steps` must be supplied.
#' @param steps The number of merge operations to perform to produce the
#'   communities. Exactly one of `no` and `steps` must be supplied.
#' @param col A vector of colors, in any format that is accepted by the regular
#'   R plotting methods. This vector gives the colors of the vertices explicitly.
#' @param mark.groups A list of numeric vectors. The communities can be
#'   highlighted using colored polygons. The groups for which the polygons are
#'   drawn are given here. The default is to use the groups given by the
#'   communities. Supply `NULL` here if you do not want to highlight any
#'   groups.
#' @param edge.color The colors of the edges. By default the edges within
#'   communities are colored green and other edges are red.
#' @param hang Numeric scalar indicating how the height of leaves should be
#'   computed from the heights of their parents; see [plot.hclust()].
#' @param use.modularity Logical scalar, whether to use the modularity values
#'   to define the height of the branches.
#' @param \dots Additional arguments. `plot.communities` passes these to
#'   [plot.igraph()]. The other functions silently ignore
#'   them.
#' @param membership Numeric vector, one value for each vertex, the membership
#'   vector of the community structure. Might also be `NULL` if the
#'   community structure is given in another way, e.g. by a merge matrix.
#' @param algorithm If not `NULL` (meaning an unknown algorithm), then a
#'   character scalar, the name of the algorithm that produced the community
#'   structure.
#' @param merges If not `NULL`, then the merge matrix of the hierarchical
#'   community structure. See `merges()` below for more information on its
#'   format.
#' @param modularity Numeric scalar or vector, the modularity value of the
#'   community structure. It can also be `NULL`, if the modularity of the
#'   (best) split is not available.
#' @return [print()] returns the `communities` object itself,
#'   invisibly.
#'
#'   `length` returns an integer scalar.
#'
#'   `sizes()` returns a numeric vector.
#'
#'   `membership()` returns a numeric vector, one number for each vertex in
#'   the graph that was the input of the community detection.
#'
#'   `modularity()` returns a numeric scalar.
#'
#'   `algorithm()` returns a character scalar.
#'
#'   `crossing()` returns a logical vector.
#'
#'   `is_hierarchical()` returns a logical scalar.
#'
#'   `merges()` returns a two-column numeric matrix.
#'
#'   `cut_at()` returns a numeric vector, the membership vector of the
#'   vertices.
#'
#'   [as.dendrogram()] returns a [dendrogram] object.
#'
#'   `show_trace()` returns a character vector.
#'
#'   `code_len()` returns a numeric scalar for communities found with the
#'   InfoMAP method and `NULL` for other methods.
#'
#'   [plot()] for `communities` objects returns `NULL`, invisibly.
#'
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @seealso See [plot_dendrogram()] for plotting community structure
#' dendrograms.
#'
#' See [compare()] for comparing two community structures
#' on the same graph.
#' @keywords graphs
#' @export
#' @examples
#'
#' karate <- make_graph("Zachary")
#' wc <- cluster_walktrap(karate)
#' modularity(wc)
#' membership(wc)
#' plot(wc, karate)
#'
membership <- function(communities) {
  if (!is.null(communities$membership)) {
    res <- communities$membership
  } else if (!is.null(communities$merges) &&
    !is.null(communities$modularity)) {
    res <- community.to.membership2(
      communities$merges, communities$vcount,
      which.max(communities$modularity)
    )
  } else {
    stop("Cannot calculate community membership")
  }
  if (igraph_opt("add.vertex.names") && !is.null(communities$names)) {
    names(res) <- communities$names
  }
  class(res) <- "membership"
  res
}

#' @method print membership
#' @family community
#' @export
print.membership <- function(x, ...) print(unclass(x), ...)

#' Declare a numeric vector as a membership vector
#'
#' This is useful if you want to use functions defined on
#' membership vectors, but your membership vector does not
#' come from an igraph clustering method.
#'
#' @param x The input vector.
#' @return The input vector, with the `membership` class added.
#' @family community
#' @export
#' @examples
#' ## Compare to the correct clustering
#' g <- (make_full_graph(10) + make_full_graph(10)) %>%
#'   rewire(each_edge(p = 0.2))
#' correct <- rep(1:2, each = 10) %>% as_membership()
#' fc <- cluster_fast_greedy(g)
#' compare(correct, fc)
#' compare(correct, membership(fc))
as_membership <- function(x) add_class(x, "membership")

#' @rdname communities
#' @method print communities
#' @export
print.communities <- function(x, ...) {
  noc <- if (!is.null(x$membership)) max(membership(x), 0) else NA
  mod <- if (!is.null(x$modularity)) {
    modularity(x) %>% format(digits = 2)
  } else {
    NA_real_
  }
  alg <- x$algorithm %||% "unknown"

  cat("IGRAPH clustering ", alg, ", groups: ", noc, ", mod: ", mod, "\n", sep = "")

  if (!is.null(x$membership)) {
    grp <- groups(x)
    cat("+ groups:\n")
    hp <- function(o) {
      head_print(o,
        max_lines = igraph_opt("auto.print.lines"),
        omitted_footer = "+ ... omitted several groups/vertices\n",
      )
    }
    indent_print(grp, .printer = hp, .indent = "  ")
  } else {
    cat(" + groups not available\n")
  }

  invisible(x)
}

#' Creates a communities object.
#'
#' This is useful to integrate the results of community finding algorithms
#' that are not included in igraph.
#'
#' @param graph The graph of the community structure.
#' @param membership The membership vector of the community structure, a
#'   numeric vector denoting the id of the community for each vertex. It
#'   might be `NULL` for hierarchical community structures.
#' @param algorithm Character string, the algorithm that generated
#'   the community structure, it can be arbitrary.
#' @param merges A merge matrix, for hierarchical community structures (or
#'   `NULL` otherwise.
#' @param modularity Modularity value of the community structure. If this
#'   is `TRUE` and the membership vector is available, then it the
#'   modularity values is calculated automatically.
#' @return A `communities` object.
#'
#'
#' @family community
#' @export
make_clusters <- function(graph, membership = NULL, algorithm = NULL,
                          merges = NULL, modularity = TRUE) {
  stopifnot(is.null(membership) || is.numeric(membership))
  stopifnot(is.null(algorithm) ||
    (is.character(algorithm) && length(algorithm) == 1))
  stopifnot(is.null(merges) ||
    (is.matrix(merges) && is.numeric(merges) && ncol(merges) == 2))
  stopifnot(is.null(modularity) ||
    (is.logical(modularity) && length(modularity) == 1) ||
    (is.numeric(modularity) &&
      length(modularity) %in% c(1, length(membership))))

  if (is.logical(modularity)) {
    if (modularity && !is.null(membership)) {
      modularity <- modularity(graph, membership)
    } else {
      modularity <- NULL
    }
  }

  res <- list(
    membership = membership,
    algorithm = if (is.null(algorithm)) "unknown" else algorithm,
    modularity = modularity
  )
  if (!is.null(merges)) {
    res$merges <- merges
  }
  if (!is.null(membership)) {
    res$vcount <- length(membership)
  } else if (!is.null(merges)) {
    res$vcount <- nrow(merges) + 1
  }
  class(res) <- "communities"
  res
}

#' @family community
#' @export
modularity <- function(x, ...) {
  UseMethod("modularity")
}

#' Modularity of a community structure of a graph
#'
#' This function calculates how modular is a given division of a graph into
#' subgraphs.
#'
#' `modularity()` calculates the modularity of a graph with respect to the
#' given `membership` vector.
#'
#' The modularity of a graph with respect to some division (or vertex types)
#' measures how good the division is, or how separated are the different vertex
#' types from each other. It defined as \deqn{Q=\frac{1}{2m} \sum_{i,j}
#' (A_{ij}-\gamma\frac{k_i k_j}{2m})\delta(c_i,c_j),}{Q=1/(2m) * sum( (Aij-gamma*ki*kj/(2m)
#' ) delta(ci,cj),i,j),} here \eqn{m} is the number of edges, \eqn{A_{ij}}{Aij}
#' is the element of the \eqn{A} adjacency matrix in row \eqn{i} and column
#' \eqn{j}, \eqn{k_i}{ki} is the degree of \eqn{i}, \eqn{k_j}{kj} is the degree
#' of \eqn{j}, \eqn{c_i}{ci} is the type (or component) of \eqn{i},
#' \eqn{c_j}{cj} that of \eqn{j}, the sum goes over all \eqn{i} and \eqn{j}
#' pairs of vertices, and \eqn{\delta(x,y)}{delta(x,y)} is 1 if \eqn{x=y} and 0
#' otherwise. For directed graphs, it is defined as
#' \deqn{Q = \frac{1}{m} \sum_{i,j} (A_{ij}-\gamma
#' \frac{k_i^{out} k_j^{in}}{m})\delta(c_i,c_j).}{Q=1/(m) * sum(
#' (Aij-gamma*ki^out*kj^in/(m) ) delta(ci,cj),i,j).}
#'
#' The resolution parameter \eqn{\gamma}{gamma} allows weighting the random
#' null model, which might be useful when finding partitions with a high
#' modularity. Maximizing modularity with higher values of the resolution
#' parameter typically results in more, smaller clusters when finding
#' partitions with a high modularity. Lower values typically results in fewer,
#' larger clusters. The original definition of modularity is retrieved when
#' setting \eqn{\gamma}{gamma} to 1.
#'
#' If edge weights are given, then these are considered as the element of the
#' \eqn{A} adjacency matrix, and \eqn{k_i}{ki} is the sum of weights of
#' adjacent edges for vertex \eqn{i}.
#'
#' `modularity_matrix()` calculates the modularity matrix. This is a dense matrix,
#' and it is defined as the difference of the adjacency matrix and the
#' configuration model null model matrix. In other words element
#' \eqn{M_{ij}}{M[i,j]} is given as \eqn{A_{ij}-d_i
#' d_j/(2m)}{A[i,j]-d[i]d[j]/(2m)}, where \eqn{A_{ij}}{A[i,j]} is the (possibly
#' weighted) adjacency matrix, \eqn{d_i}{d[i]} is the degree of vertex \eqn{i},
#' and \eqn{m} is the number of edges (or the total weights in the graph, if it
#' is weighed).
#'
#' @aliases modularity
#' @param x,graph The input graph.
#' @param membership Numeric vector, one value for each vertex, the membership
#'   vector of the community structure.
#' @param weights If not `NULL` then a numeric vector giving edge weights.
#' @param resolution The resolution parameter. Must be greater than or equal to
#'   0. Set it to 1 to use the classical definition of modularity.
#' @param directed Whether to use the directed or undirected version of
#'   modularity. Ignored for undirected graphs.
#' @param \dots Additional arguments, none currently.
#' @return For `modularity()` a numeric scalar, the modularity score of the
#'   given configuration.
#'
#'   For `modularity_matrix()` a numeric square matrix, its order is the number of
#'   vertices in the graph.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @seealso [cluster_walktrap()],
#' [cluster_edge_betweenness()],
#' [cluster_fast_greedy()], [cluster_spinglass()],
#' [cluster_louvain()] and [cluster_leiden()] for
#' various community detection methods.
#' @references Clauset, A.; Newman, M. E. J. & Moore, C. Finding community
#' structure in very large networks, *Physical Review E* 2004, 70, 066111
#' @method modularity igraph
#' @family community
#' @export
#' @keywords graphs
#' @examples
#'
#' g <- make_full_graph(5) %du% make_full_graph(5) %du% make_full_graph(5)
#' g <- add_edges(g, c(1, 6, 1, 11, 6, 11))
#' wtc <- cluster_walktrap(g)
#' modularity(wtc)
#' modularity(g, membership(wtc))
#'
modularity.igraph <- function(x, membership, weights = NULL, resolution = 1, directed = TRUE, ...) {
  # Argument checks
  ensure_igraph(x)
  if (is.null(membership) || (!is.numeric(membership) && !is.factor(membership))) {
    stop("Membership is not a numerical vector")
  }
  membership <- as.numeric(membership)
  if (!is.null(weights)) weights <- as.numeric(weights)
  resolution <- as.numeric(resolution)
  directed <- as.logical(directed)

  on.exit(.Call(R_igraph_finalizer))
  # Function call
  res <- .Call(R_igraph_modularity, x, membership - 1, weights, resolution, directed)
  res
}

#' @rdname communities
#' @method modularity communities
#' @export
modularity.communities <- function(x, ...) {
  if (!is.null(x$modularity)) {
    max(x$modularity)
  } else {
    stop("Modularity was not calculated")
  }
}

#' @rdname modularity.igraph
#' @export
modularity_matrix <- function(graph, membership = lifecycle::deprecated(), weights = NULL, resolution = 1, directed = TRUE) {
  # Argument checks
  ensure_igraph(graph)

  if (!missing(membership)) {
    lifecycle::deprecate_warn("2.0.4", "modularity_matrix(membership = 'is no longer used')")
  }

  if (is.null(weights) && "weight" %in% edge_attr_names(graph)) {
    weights <- E(graph)$weight
  }
  if (!is.null(weights) && any(!is.na(weights))) {
    weights <- as.numeric(weights)
  } else {
    weights <- NULL
  }

  resolution <- as.numeric(resolution)
  directed <- as.logical(directed)

  on.exit(.Call(R_igraph_finalizer))
  # Function call
  res <- .Call(R_igraph_modularity_matrix, graph, weights, resolution, directed)

  res
}

#' @rdname communities
#' @method length communities
#' @export
length.communities <- function(x) {
  m <- membership(x)
  max(m, 0)
}

#' @rdname communities
#' @export
sizes <- function(communities) {
  m <- membership(communities)
  table(`Community sizes` = m)
}

#' @rdname communities
#' @export
algorithm <- function(communities) {
  communities$algorithm
}

#' @rdname communities
#' @export
merges <- function(communities) {
  if (!is.null(communities$merges)) {
    communities$merges
  } else {
    stop("Not a hierarchical community structure")
  }
}

#' @rdname communities
#' @export
crossing <- function(communities, graph) {
  m <- membership(communities)
  el <- as_edgelist(graph, names = FALSE)
  m1 <- m[el[, 1]]
  m2 <- m[el[, 2]]
  res <- m1 != m2
  if (!is.null(names(m1))) {
    names(res) <- paste(names(m1), names(m2), sep = "|")
  }
  res
}

#' @rdname communities
#' @export
code_len <- function(communities) {
  communities$codelength
}

#' @rdname communities
#' @export
is_hierarchical <- function(communities) {
  !is.null(communities$merges)
}

complete.dend <- function(comm, use.modularity) {
  merges <- comm$merges
  if (nrow(merges) < comm$vcount - 1) {
    if (use.modularity) {
      stop(paste(
        "`use.modularity' requires a full dendrogram,",
        "i.e. a connected graph"
      ))
    }
    miss <- seq_len(comm$vcount + nrow(merges))[-as.vector(merges)]
    miss <- c(miss, seq_len(length(miss) - 2) + comm$vcount + nrow(merges))
    miss <- matrix(miss, byrow = TRUE, ncol = 2)
    merges <- rbind(merges, miss)
  }
  storage.mode(merges) <- "integer"

  merges
}

# The following functions were adapted from the stats R package

#' @rdname communities
#' @importFrom stats as.dendrogram
#' @method as.dendrogram communities
#' @export
as.dendrogram.communities <- function(object, hang = -1, use.modularity = FALSE,
                                      ...) {
  if (!is_hierarchical(object)) {
    stop("Not a hierarchical community structure")
  }

  .memberDend <- function(x) {
    r <- attr(x, "x.member")
    if (is.null(r)) {
      r <- attr(x, "members")
      if (is.null(r)) r <- 1:1
    }
    r
  }

  ## If multiple components, then we merge them in arbitrary order
  merges <- complete.dend(object, use.modularity)

  storage.mode(merges) <- "integer"

  if (is.null(object$names)) {
    object$names <- 1:(nrow(merges) + 1)
  }
  z <- list()
  if (!use.modularity || is.null(object$modularity)) {
    object$height <- 1:nrow(merges)
  } else {
    object$height <- object$modularity[-1]
    object$height <- cumsum(object$height - min(object$height))
  }
  nMerge <- length(oHgt <- object$height)
  if (nMerge != nrow(merges)) {
    stop("'merge' and 'height' do not fit!")
  }
  hMax <- oHgt[nMerge]
  one <- 1L
  two <- 2L
  leafs <- nrow(merges) + 1
  for (k in 1:nMerge) {
    x <- merges[k, ] # no sort() anymore!
    if (any(neg <- x < leafs + 1)) {
      h0 <- if (hang < 0) 0 else max(0, oHgt[k] - hang * hMax)
    }
    if (all(neg)) { # two leaves
      zk <- as.list(x)
      attr(zk, "members") <- two
      attr(zk, "midpoint") <- 0.5 # mean( c(0,1) )
      objlabels <- object$names[x]
      attr(zk[[1]], "label") <- objlabels[1]
      attr(zk[[2]], "label") <- objlabels[2]
      attr(zk[[1]], "members") <- attr(zk[[2]], "members") <- one
      attr(zk[[1]], "height") <- attr(zk[[2]], "height") <- h0
      attr(zk[[1]], "leaf") <- attr(zk[[2]], "leaf") <- TRUE
    } else if (any(neg)) { # one leaf, one node
      # as.character(x) is not okay as it starts converting values >= 100000
      # to scientific notation
      X <- format(x, scientific = FALSE, trim = TRUE)
      ## Originally had "x <- sort(..) above => leaf always left, x[1];
      ## don't want to assume this
      isL <- x[1] < leafs + 1 ## is leaf left?
      zk <-
        if (isL) {
          list(x[1], z[[X[2]]])
        } else {
          list(z[[X[1]]], x[2])
        }
      attr(zk, "members") <- attr(z[[X[1 + isL]]], "members") + one
      attr(zk, "midpoint") <-
        (.memberDend(zk[[1]]) + attr(z[[X[1 + isL]]], "midpoint")) / 2
      attr(zk[[2 - isL]], "members") <- one
      attr(zk[[2 - isL]], "height") <- h0
      attr(zk[[2 - isL]], "label") <- object$names[x[2 - isL]]
      attr(zk[[2 - isL]], "leaf") <- TRUE
    } else { # two nodes
      # as.character(x) is not okay as it starts converting values >= 100000
      # to scientific notation
      x <- format(x, scientific = FALSE, trim = TRUE)
      zk <- list(z[[x[1]]], z[[x[2]]])
      attr(zk, "members") <- attr(z[[x[1]]], "members") +
        attr(z[[x[2]]], "members")
      attr(zk, "midpoint") <- (attr(z[[x[1]]], "members") +
        attr(z[[x[1]]], "midpoint") +
        attr(z[[x[2]]], "midpoint")) / 2
    }
    attr(zk, "height") <- oHgt[k]
    z[[k <- format(k + leafs, scientific = FALSE)]] <- zk
  }
  z <- z[[k]]
  class(z) <- "dendrogram"
  z
}

#' @rdname communities
#' @importFrom stats as.hclust
#' @method as.hclust communities
#' @export
as.hclust.communities <- function(x, hang = -1, use.modularity = FALSE,
                                  ...) {
  as.hclust(as.dendrogram(x, hang = hang, use.modularity = use.modularity))
}

as.phylo.communities <- function(x, use.modularity = FALSE, ...) {
  if (!is_hierarchical(x)) {
    stop("Not a hierarchical community structure")
  }

  ## If multiple components, then we merge them in arbitrary order
  merges <- complete.dend(x, use.modularity)

  if (!use.modularity || is.null(x$modularity)) {
    height <- 1:nrow(merges)
  } else {
    height <- x$modularity[-1]
    height <- cumsum(height - min(height))
  }

  if (is.null(x$names)) {
    labels <- 1:(nrow(merges) + 1)
  } else {
    labels <- x$names
  }

  N <- nrow(merges)
  edge <- matrix(0L, 2 * N, 2)
  edge.length <- numeric(2 * N)
  node <- integer(N)
  node[N] <- N + 2L
  cur.nod <- N + 3L
  j <- 1L
  for (i in N:1) {
    edge[j:(j + 1), 1] <- node[i]
    for (l in 1:2) {
      k <- j + l - 1L
      y <- merges[i, l]
      if (y > N + 1) {
        edge[k, 2] <- node[y - N - 1] <- cur.nod
        cur.nod <- cur.nod + 1L
        edge.length[k] <- height[i] - height[y - N - 1]
      } else {
        edge[k, 2] <- y
        edge.length[k] <- height[i]
      }
    }
    j <- j + 2L
  }

  obj <- list(
    edge = edge, edge.length = edge.length / 2, tip.label = labels,
    Nnode = N
  )
  class(obj) <- "phylo"
  ape::reorder.phylo(obj)
}
rlang::on_load(s3_register("ape::as.phylo", "communities"))
#' @rdname communities
#' @export
cut_at <- function(communities, no, steps) {
  if (!inherits(communities, "communities")) {
    stop("Not a community structure")
  }
  if (!is_hierarchical(communities)) {
    stop("Not a hierarchical communitity structure")
  }

  if ((!missing(no) && !missing(steps)) ||
    (missing(no) && missing(steps))) {
    stop("Please give either `no' or `steps' (but not both)")
  }

  if (!missing(steps)) {
    mm <- merges(communities)
    if (steps > nrow(mm)) {
      warning("Cannot make that many steps")
      steps <- nrow(mm)
    }
    community.to.membership2(mm, communities$vcount, steps)
  } else {
    mm <- merges(communities)
    noc <- communities$vcount - nrow(mm) # final number of communities
    if (no < noc) {
      warning("Cannot have that few communities")
      no <- noc
    }
    steps <- communities$vcount - no
    community.to.membership2(mm, communities$vcount, steps)
  }
}

#' @rdname communities
#' @export
show_trace <- function(communities) {
  if (!inherits(communities, "communities")) {
    stop("Not a community structure")
  }
  if (is.null(communities$history)) {
    stop("History was not recorded")
  }

  res <- character()
  i <- 1
  while (i <= length(communities$history)) {
    if (communities$history[i] == 2) { # IGRAPH_LEVC_HIST_SPLIT
      resnew <- paste(
        "Splitting community", communities$history[i + 1],
        "into two."
      )
      i <- i + 2
    } else if (communities$history[i] == 3) { # IGRAPH_LEVC_HIST_FAILED
      resnew <- paste(
        "Failed splitting community",
        communities$history[i + 1], "into two."
      )
      i <- i + 2
    } else if (communities$history[i] == 4) { # IGRAPH_LEVC_START_FULL
      resnew <- "Starting with the whole graph as a community."
      i <- i + 1
    } else if (communities$history[i] == 5) { # IGRAPH_LEVC_START_GIVEN
      resnew <- paste(
        "Starting from the", communities$history[i + 1],
        "given communities."
      )
      i <- i + 2
    }

    res <- c(res, resnew)
  }
  res
}

#####################################################################

community.to.membership2 <- function(merges, vcount, steps) {
  mode(merges) <- "numeric"
  mode(vcount) <- "numeric"
  mode(steps) <- "numeric"
  on.exit(.Call(R_igraph_finalizer))
  res <- .Call(R_igraph_community_to_membership2, merges - 1, vcount, steps)
  res + 1
}

#####################################################################



#' Finding communities in graphs based on statistical meachanics
#'
#' This function tries to find communities in graphs via a spin-glass model and
#' simulated annealing.
#'
#' This function tries to find communities in a graph. A community is a set of
#' nodes with many edges inside the community and few edges between outside it
#' (i.e. between the community itself and the rest of the graph.)
#'
#' This idea is reversed for edges having a negative weight, i.e. few negative
#' edges inside a community and many negative edges between communities. Note
#' that only the \sQuote{neg} implementation supports negative edge weights.
#'
#' The `spinglass.cummunity` function can solve two problems related to
#' community detection. If the `vertex` argument is not given (or it is
#' `NULL`), then the regular community detection problem is solved
#' (approximately), i.e. partitioning the vertices into communities, by
#' optimizing the an energy function.
#'
#' If the `vertex` argument is given and it is not `NULL`, then it
#' must be a vertex id, and the same energy function is used to find the
#' community of the the given vertex. See also the examples below.
#'
#' @param graph The input graph, can be directed but the direction of the edges
#'   is neglected.
#' @param weights The weights of the edges. It must be a positive numeric vector,
#'   `NULL` or `NA`. If it is `NULL` and the input graph has a
#'   \sQuote{weight} edge attribute, then that attribute will be used. If
#'   `NULL` and no such attribute is present, then the edges will have equal
#'   weights. Set this to `NA` if the graph was a \sQuote{weight} edge
#'   attribute, but you don't want to use it for community detection. A larger
#'   edge weight means a stronger connection for this function.
#' @param vertex This parameter can be used to calculate the community of a
#'   given vertex without calculating all communities. Note that if this argument
#'   is present then some other arguments are ignored.
#' @param spins Integer constant, the number of spins to use. This is the upper
#'   limit for the number of communities. It is not a problem to supply a
#'   (reasonably) big number here, in which case some spin states will be
#'   unpopulated.
#' @param parupdate Logical constant, whether to update the spins of the
#'   vertices in parallel (synchronously) or not. This argument is ignored if the
#'   second form of the function is used (i.e. the \sQuote{`vertex`} argument
#'   is present). It is also not implemented in the \dQuote{neg} implementation.
#' @param start.temp Real constant, the start temperature.  This argument is
#'   ignored if the second form of the function is used (i.e. the
#'   \sQuote{`vertex`} argument is present).
#' @param stop.temp Real constant, the stop temperature. The simulation
#'   terminates if the temperature lowers below this level.  This argument is
#'   ignored if the second form of the function is used (i.e. the
#'   \sQuote{`vertex`} argument is present).
#' @param cool.fact Cooling factor for the simulated annealing.  This argument
#'   is ignored if the second form of the function is used (i.e. the
#'   \sQuote{`vertex`} argument is present).
#' @param update.rule Character constant giving the \sQuote{null-model} of the
#'   simulation. Possible values: \dQuote{simple} and \dQuote{config}.
#'   \dQuote{simple} uses a random graph with the same number of edges as the
#'   baseline probability and \dQuote{config} uses a random graph with the same
#'   vertex degrees as the input graph.
#' @param gamma Real constant, the gamma argument of the algorithm. This
#'   specifies the balance between the importance of present and non-present
#'   edges in a community. Roughly, a comunity is a set of vertices having many
#'   edges inside the community and few edges outside the community. The default
#'   1.0 value makes existing and non-existing links equally important. Smaller
#'   values make the existing links, greater values the missing links more
#'   important.
#' @param implementation Character scalar. Currently igraph contains two
#'   implementations for the Spin-glass community finding algorithm. The faster
#'   original implementation is the default. The other implementation, that takes
#'   into account negative weights, can be chosen by supplying \sQuote{neg} here.
#' @param gamma.minus Real constant, the gamma.minus parameter of the
#'   algorithm. This specifies the balance between the importance of present and
#'   non-present negative weighted edges in a community. Smaller values of
#'   gamma.minus, leads to communities with lesser negative intra-connectivity.
#'   If this argument is set to zero, the algorithm reduces to a graph coloring
#'   algorithm, using the number of spins as the number of colors. This argument
#'   is ignored if the \sQuote{orig} implementation is chosen.
#' @return If the `vertex` argument is not given, i.e. the first form is
#'   used then a [cluster_spinglass()] returns a
#'   [communities()] object.
#'
#'   If the `vertex` argument is present, i.e. the second form is used then a
#'   named list is returned with the following components:
#'   \item{community}{Numeric vector giving the ids of the vertices in the same
#'   community as `vertex`.} \item{cohesion}{The cohesion score of the
#'   result, see references.} \item{adhesion}{The adhesion score of the result,
#'   see references.} \item{inner.links}{The number of edges within the community
#'   of `vertex`.} \item{outer.links}{The number of edges between the
#'   community of `vertex` and the rest of the graph. }
#' @author Jorg Reichardt for the original code and Gabor Csardi
#' \email{csardi.gabor@@gmail.com} for the igraph glue code.
#'
#' Changes to the original function for including the possibility of negative
#' ties were implemented by Vincent Traag (<https://www.traag.net/>).
#' @seealso [communities()], [components()]
#' @references J. Reichardt and S. Bornholdt: Statistical Mechanics of
#' Community Detection, *Phys. Rev. E*, 74, 016110 (2006),
#' <https://arxiv.org/abs/cond-mat/0603718>
#'
#' M. E. J. Newman and M. Girvan: Finding and evaluating community structure in
#' networks, *Phys. Rev. E* 69, 026113 (2004)
#'
#' V.A. Traag and Jeroen Bruggeman: Community detection in networks with
#' positive and negative links, <https://arxiv.org/abs/0811.2329> (2008).
#' @family community
#' @export
#' @keywords graphs
#' @examples
#'
#' g <- sample_gnp(10, 5 / 10) %du% sample_gnp(9, 5 / 9)
#' g <- add_edges(g, c(1, 12))
#' g <- induced_subgraph(g, subcomponent(g, 1))
#' cluster_spinglass(g, spins = 2)
#' cluster_spinglass(g, vertex = 1)
#'
cluster_spinglass <- function(graph, weights = NULL, vertex = NULL, spins = 25,
                              parupdate = FALSE, start.temp = 1,
                              stop.temp = 0.01, cool.fact = 0.99,
                              update.rule = c("config", "random", "simple"),
                              gamma = 1.0, implementation = c("orig", "neg"),
                              gamma.minus = 1.0) {
  ensure_igraph(graph)

  if (is.null(weights) && "weight" %in% edge_attr_names(graph)) {
    weights <- E(graph)$weight
  }
  if (!is.null(weights) && any(!is.na(weights))) {
    weights <- as.numeric(weights)
  } else {
    weights <- NULL
  }

  update.rule <- igraph.match.arg(update.rule)
  update.rule <- switch(update.rule,
    "simple" = 0,
    "random" = 0,
    "config" = 1
  )
  implementation <- switch(igraph.match.arg(implementation),
    "orig" = 0,
    "neg" = 1
  )

  on.exit(.Call(R_igraph_finalizer))
  if (is.null(vertex) || length(vertex) == 0) {
    res <- .Call(
      R_igraph_spinglass_community, graph, weights,
      as.numeric(spins), as.logical(parupdate),
      as.numeric(start.temp),
      as.numeric(stop.temp), as.numeric(cool.fact),
      as.numeric(update.rule), as.numeric(gamma),
      as.numeric(implementation), as.numeric(gamma.minus)
    )
    res$algorithm <- "spinglass"
    res$vcount <- vcount(graph)
    res$membership <- res$membership + 1
    if (igraph_opt("add.vertex.names") && is_named(graph)) {
      res$names <- vertex_attr(graph, "name")
    }
    class(res) <- "communities"
  } else {
    res <- .Call(
      R_igraph_spinglass_my_community, graph, weights,
      as_igraph_vs(graph, vertex) - 1, as.numeric(spins),
      as.numeric(update.rule), as.numeric(gamma)
    )
    res$community <- res$community + 1
  }
  res
}

#' Finding community structure of a graph using the Leiden algorithm of Traag,
#' van Eck & Waltman.
#'
#' The Leiden algorithm is similar to the Louvain algorithm,
#' [cluster_louvain()], but it is faster and yields higher quality
#' solutions. It can optimize both modularity and the Constant Potts Model,
#' which does not suffer from the resolution-limit (see preprint
#' http://arxiv.org/abs/1104.3083).
#'
#' The Leiden algorithm consists of three phases: (1) local moving of nodes,
#' (2) refinement of the partition and (3) aggregation of the network based on
#' the refined partition, using the non-refined partition to create an initial
#' partition for the aggregate network. In the local move procedure in the
#' Leiden algorithm, only nodes whose neighborhood has changed are visited. The
#' refinement is done by restarting from a singleton partition within each
#' cluster and gradually merging the subclusters. When aggregating, a single
#' cluster may then be represented by several nodes (which are the subclusters
#' identified in the refinement).
#'
#' The Leiden algorithm provides several guarantees. The Leiden algorithm is
#' typically iterated: the output of one iteration is used as the input for the
#' next iteration. At each iteration all clusters are guaranteed to be
#' connected and well-separated. After an iteration in which nothing has
#' changed, all nodes and some parts are guaranteed to be locally optimally
#' assigned. Finally, asymptotically, all subsets of all clusters are
#' guaranteed to be locally optimally assigned. For more details, please see
#' Traag, Waltman & van Eck (2019).
#'
#' The objective function being optimized is
#'
#' \deqn{\frac{1}{2m} \sum_{ij} (A_{ij} - \gamma n_i n_j)\delta(\sigma_i, \sigma_j)}{1 / 2m sum_ij (A_ij - gamma n_i n_j)d(s_i, s_j)}
#'
#' where \eqn{m}{m} is the total edge weight, \eqn{A_{ij}}{A_ij} is the weight
#' of edge \eqn{(i, j)}, \eqn{\gamma}{gamma} is the so-called resolution
#' parameter, \eqn{n_i} is the node weight of node \eqn{i}, \eqn{\sigma_i}{s_i}
#' is the cluster of node \eqn{i} and \eqn{\delta(x, y) = 1}{d(x, y) = 1} if and
#' only if \eqn{x = y} and \eqn{0} otherwise. By setting \eqn{n_i = k_i}, the
#' degree of node \eqn{i}, and dividing \eqn{\gamma}{gamma} by \eqn{2m}, you
#' effectively obtain an expression for modularity.
#'
#' Hence, the standard modularity will be optimized when you supply the degrees
#' as `vertex_weights` and by supplying as a resolution parameter
#' \eqn{\frac{1}{2m}}{1/(2m)}, with \eqn{m} the number of edges. If you do not
#' specify any `vertex_weights`, the correct vertex weights and scaling of
#' \eqn{\gamma}{gamma} is determined automatically by the
#' `objective_function` argument.
#'
#' @param graph The input graph, only undirected graphs are supported.
#' @param objective_function Whether to use the Constant Potts Model (CPM) or
#'   modularity. Must be either `"CPM"` or `"modularity"`.
#' @param weights The weights of the edges. It must be a positive numeric vector,
#'   `NULL` or `NA`. If it is `NULL` and the input graph has a
#'   \sQuote{weight} edge attribute, then that attribute will be used. If
#'   `NULL` and no such attribute is present, then the edges will have equal
#'   weights. Set this to `NA` if the graph was a \sQuote{weight} edge
#'   attribute, but you don't want to use it for community detection. A larger
#'   edge weight means a stronger connection for this function.
#' @param resolution The resolution parameter to use. Higher
#'   resolutions lead to more smaller communities, while lower resolutions lead
#'   to fewer larger communities.
#' @param resolution_parameter  `r lifecycle::badge("superseded")` Use `resolution` instead.
#' @param beta Parameter affecting the randomness in the Leiden algorithm.
#'   This affects only the refinement step of the algorithm.
#' @param initial_membership If provided, the Leiden algorithm
#'   will try to improve this provided membership. If no argument is
#'   provided, the aglorithm simply starts from the singleton partition.
#' @param n_iterations the number of iterations to iterate the Leiden
#'   algorithm. Each iteration may improve the partition further.
#' @param vertex_weights the vertex weights used in the Leiden algorithm.
#'   If this is not provided, it will be automatically determined on the basis
#'   of the `objective_function`. Please see the details of this function
#'   how to interpret the vertex weights.
#' @inheritParams rlang::args_dots_empty
#' @return `cluster_leiden()` returns a [communities()]
#'   object, please see the [communities()] manual page for details.
#' @author Vincent Traag
#' @seealso See [communities()] for extracting the membership,
#' modularity scores, etc. from the results.
#'
#' Other community detection algorithms: [cluster_walktrap()],
#' [cluster_spinglass()],
#' [cluster_leading_eigen()],
#' [cluster_edge_betweenness()],
#' [cluster_fast_greedy()],
#' [cluster_label_prop()]
#' [cluster_louvain()]
#' [cluster_fluid_communities()]
#' [cluster_infomap()]
#' [cluster_optimal()]
#' [cluster_walktrap()]
#' @references Traag, V. A., Waltman, L., & van Eck, N. J. (2019). From Louvain
#'   to Leiden: guaranteeing well-connected communities. Scientific
#'   reports, 9(1), 5233. doi: 10.1038/s41598-019-41695-z, arXiv:1810.08473v3 \[cs.SI\]
#' @family community
#' @export
#' @keywords graphs
#' @examples
#' g <- make_graph("Zachary")
#' # By default CPM is used
#' r <- quantile(strength(g))[2] / (gorder(g) - 1)
#' # Set seed for sake of reproducibility
#' set.seed(1)
#' ldc <- cluster_leiden(g, resolution = r)
#' print(ldc)
#' plot(ldc, g)
cluster_leiden <- function(graph, objective_function = c("CPM", "modularity"),
                           ...,
                           weights = NULL, resolution = 1,
                           resolution_parameter = deprecated(), beta = 0.01,
                           initial_membership = NULL,
                           n_iterations = 2, vertex_weights = NULL) {

  check_dots_empty()

  if (lifecycle::is_present(resolution_parameter)) {
    lifecycle::deprecate_soft("2.0.4",
                              "cluster_leiden(resolution_parameter)",
                              "cluster_leiden(resolution)")
    resolution <- resolution_parameter
  }

  ensure_igraph(graph)

  # Parse objective function argument
  objective_function <- igraph.match.arg(objective_function)
  objective_function <- switch(objective_function,
    "cpm" = 0,
    "modularity" = 1
  )

  # Parse edge weights argument
  if (is.null(weights) && "weight" %in% edge_attr_names(graph)) {
    weights <- E(graph)$weight
  }
  if (!is.null(weights) && !any(is.na(weights))) {
    weights <- as.numeric(weights)
  } else {
    weights <- NULL
  }

  # Parse initial_membership argument
  if (!is.null(initial_membership) && !any(is.na(initial_membership))) {
    initial_membership <- as.numeric(initial_membership)
  } else {
    initial_membership <- NULL
  }

  # Parse node weights argument
  if (!is.null(vertex_weights) && !any(is.na(vertex_weights))) {
    vertex_weights <- as.numeric(vertex_weights)
    if (objective_function == 1) { # Using modularity
      warning("Providing node weights contradicts using modularity")
    }
  } else {
    if (objective_function == 1) { # Using modularity
      # Set correct node weights
      vertex_weights <- strength(graph, weights = weights)
      # Also correct resolution parameter
      resolution <- resolution / sum(vertex_weights)
    }
  }

  on.exit(.Call(R_igraph_finalizer))
  membership <- initial_membership
  if (n_iterations > 0) {
    res <- .Call(
      R_igraph_community_leiden, graph, weights,
      vertex_weights, as.numeric(resolution),
      as.numeric(beta), !is.null(membership), as.numeric(n_iterations),
      membership
    )
    membership <- res$membership
  } else {
    prev_quality <- -Inf
    quality <- 0.0
    while (prev_quality < quality) {
      prev_quality <- quality
      res <- .Call(
        R_igraph_community_leiden, graph, weights,
        vertex_weights, as.numeric(resolution),
        as.numeric(beta), !is.null(membership), 1,
        membership
      )
      membership <- res$membership
      quality <- res$quality
    }
  }
  res$algorithm <- "leiden"
  res$vcount <- vcount(graph)
  res$membership <- res$membership + 1
  if (igraph_opt("add.vertex.names") && is_named(graph)) {
    res$names <- vertex_attr(graph, "name")
  }
  class(res) <- "communities"
  res
}

#' Community detection algorithm based on interacting fluids
#'
#' The algorithm detects communities based on the simple idea of
#' several fluids interacting in a non-homogeneous environment
#' (the graph topology), expanding and contracting based on their
#' interaction and density.
#'
#' @param graph The input graph. The graph must be simple and connected.
#'   Empty graphs are not supported as well as single vertex graphs.
#'   Edge directions are ignored. Weights are not considered.
#' @param no.of.communities The number of communities to be found. Must be
#'   greater than 0 and fewer than number of vertices in the graph.
#' @return `cluster_fluid_communities()` returns a [communities()]
#'   object, please see the [communities()] manual page for details.
#' @author Ferran Parés
#' @seealso See [communities()] for extracting the membership,
#' modularity scores, etc. from the results.
#'
#' Other community detection algorithms: [cluster_walktrap()],
#' [cluster_spinglass()],
#' [cluster_leading_eigen()],
#' [cluster_edge_betweenness()],
#' [cluster_fast_greedy()],
#' [cluster_label_prop()]
#' [cluster_louvain()],
#' [cluster_leiden()]
#' @references Parés F, Gasulla DG, et. al. (2018) Fluid Communities: A Competitive,
#' Scalable and Diverse Community Detection Algorithm. In: Complex Networks
#' &amp; Their Applications VI: Proceedings of Complex Networks 2017 (The Sixth
#' International Conference on Complex Networks and Their Applications),
#' Springer, vol 689, p 229, doi: 10.1007/978-3-319-72150-7_19
#' @family community
#' @export
#' @keywords graphs
#' @examples
#' g <- make_graph("Zachary")
#' comms <- cluster_fluid_communities(g, 2)
cluster_fluid_communities <- function(graph, no.of.communities) {
  # Argument checks
  ensure_igraph(graph)

  no.of.communities <- as.numeric(no.of.communities)

  on.exit(.Call(R_igraph_finalizer))
  # Function call
  membership <- .Call(R_igraph_community_fluid_communities, graph, no.of.communities)

  res <- list()
  res$membership <- membership + 1
  if (igraph_opt("add.vertex.names") && is_named(graph)) {
    res$names <- V(graph)$name
  }
  res$vcount <- vcount(graph)
  res$algorithm <- "fluid communities"
  class(res) <- "communities"
  res
}

#' Community structure via short random walks
#'
#' This function tries to find densely connected subgraphs, also called
#' communities in a graph via random walks. The idea is that short random walks
#' tend to stay in the same community.
#'
#' This function is the implementation of the Walktrap community finding
#' algorithm, see Pascal Pons, Matthieu Latapy: Computing communities in large
#' networks using random walks, https://arxiv.org/abs/physics/0512106
#'
#' @param graph The input graph, edge directions are ignored in directed
#'   graphs.
#' @param weights The weights of the edges. It must be a positive numeric vector,
#'   `NULL` or `NA`. If it is `NULL` and the input graph has a
#'   \sQuote{weight} edge attribute, then that attribute will be used. If
#'   `NULL` and no such attribute is present, then the edges will have equal
#'   weights. Set this to `NA` if the graph was a \sQuote{weight} edge
#'   attribute, but you don't want to use it for community detection. Larger edge
#'   weights increase the probability that an edge is selected by the random
#'   walker. In other words, larger edge weights correspond to stronger connections.
#' @param steps The length of the random walks to perform.
#' @param merges Logical scalar, whether to include the merge matrix in the
#'   result.
#' @param modularity Logical scalar, whether to include the vector of the
#'   modularity scores in the result. If the `membership` argument is true,
#'   then it will always be calculated.
#' @param membership Logical scalar, whether to calculate the membership vector
#'   for the split corresponding to the highest modularity value.
#' @return `cluster_walktrap()` returns a [communities()]
#'   object, please see the [communities()] manual page for details.
#' @author Pascal Pons (<http://psl.pons.free.fr/>) and Gabor Csardi
#' \email{csardi.gabor@@gmail.com} for the R and igraph interface
#' @seealso See [communities()] on getting the actual membership
#' vector, merge matrix, modularity score, etc.
#'
#' [modularity()] and [cluster_fast_greedy()],
#' [cluster_spinglass()],
#' [cluster_leading_eigen()],
#' [cluster_edge_betweenness()], [cluster_louvain()],
#' and [cluster_leiden()] for other community detection
#' methods.
#' @references Pascal Pons, Matthieu Latapy: Computing communities in large
#' networks using random walks, https://arxiv.org/abs/physics/0512106
#' @family community
#' @export
#' @keywords graphs
#' @examples
#'
#' g <- make_full_graph(5) %du% make_full_graph(5) %du% make_full_graph(5)
#' g <- add_edges(g, c(1, 6, 1, 11, 6, 11))
#' cluster_walktrap(g)
#'
cluster_walktrap <- function(graph, weights = NULL, steps = 4,
                             merges = TRUE, modularity = TRUE,
                             membership = TRUE) {
  ensure_igraph(graph)

  if (membership && !modularity) {
    modularity <- TRUE
  }

  if (is.null(weights) && "weight" %in% edge_attr_names(graph)) {
    weights <- E(graph)$weight
  }
  if (!is.null(weights) && !any(is.na(weights))) {
    weights <- as.numeric(weights)
  } else {
    weights <- NULL
  }

  on.exit(.Call(R_igraph_finalizer))
  res <- .Call(
    R_igraph_walktrap_community, graph, weights, as.numeric(steps),
    as.logical(merges), as.logical(modularity), as.logical(membership)
  )
  if (igraph_opt("add.vertex.names") && is_named(graph)) {
    res$names <- V(graph)$name
  }

  res$vcount <- vcount(graph)
  res$algorithm <- "walktrap"
  if (!is.null(res$membership)) {
    res$membership <- res$membership + 1
  }
  if (!is.null(res$merges)) {
    res$merges <- res$merges + 1
  }
  class(res) <- "communities"
  res
}



#' Community structure detection based on edge betweenness
#'
#' Community structure detection based on the betweenness of the edges
#' in the network. This method is also known as the Girvan-Newman
#' algorithm.
#'
#' The idea behind this method is that the betweenness of the edges connecting
#' two communities is typically high, as many of the shortest paths between
#' vertices in separate communities pass through them. The algorithm
#' successively removes edges with the highest betweenness, recalculating
#' betweenness values after each removal. This way eventually the network splits
#' into two components, then one of these components splits again, and so on,
#' until all edges are removed. The resulting hierarhical partitioning of the
#' vertices can be encoded as a dendrogram.
#'
#' `cluster_edge_betweenness()` returns various information collected
#' through the run of the algorithm. Specifically, `removed.edges` contains
#' the edge IDs in order of the edges' removal; `edge.betweenness` contains
#' the betweenness of each of these at the time of their removal; and
#' `bridges` contains the IDs of edges whose removal caused a split.
#'
#' @param graph The graph to analyze.
#' @param weights The weights of the edges. It must be a positive numeric vector,
#'   `NULL` or `NA`. If it is `NULL` and the input graph has a
#'   \sQuote{weight} edge attribute, then that attribute will be used. If
#'   `NULL` and no such attribute is present, then the edges will have equal
#'   weights. Set this to `NA` if the graph was a \sQuote{weight} edge
#'   attribute, but you don't want to use it for community detection. Edge weights
#'   are used to calculate weighted edge betweenness. This means that edges are
#'   interpreted as distances, not as connection strengths.
#' @param directed Logical constant, whether to calculate directed edge
#'   betweenness for directed graphs. It is ignored for undirected graphs.
#' @param edge.betweenness Logical constant, whether to return the edge
#'   betweenness of the edges at the time of their removal.
#' @param merges Logical constant, whether to return the merge matrix
#'   representing the hierarchical community structure of the network.  This
#'   argument is called `merges`, even if the community structure algorithm
#'   itself is divisive and not agglomerative: it builds the tree from top to
#'   bottom. There is one line for each merge (i.e. split) in matrix, the first
#'   line is the first merge (last split). The communities are identified by
#'   integer number starting from one. Community ids smaller than or equal to
#'   \eqn{N}, the number of vertices in the graph, belong to singleton
#'   communities, i.e. individual vertices. Before the first merge we have \eqn{N}
#'   communities numbered from one to \eqn{N}. The first merge, the first line of
#'   the matrix creates community \eqn{N+1}, the second merge creates community
#'   \eqn{N+2}, etc.
#' @param bridges Logical constant, whether to return a list the edge removals
#'   which actually splitted a component of the graph.
#' @param modularity Logical constant, whether to calculate the maximum
#'   modularity score, considering all possibly community structures along the
#'   edge-betweenness based edge removals.
#' @param membership Logical constant, whether to calculate the membership
#'   vector corresponding to the highest possible modularity score.
#' @return `cluster_edge_betweenness()` returns a
#'   [communities()] object, please see the [communities()]
#'   manual page for details.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @seealso [edge_betweenness()] for the definition and calculation
#' of the edge betweenness, [cluster_walktrap()],
#' [cluster_fast_greedy()],
#' [cluster_leading_eigen()] for other community detection
#' methods.
#'
#' See [communities()] for extracting the results of the community
#' detection.
#' @references M Newman and M Girvan: Finding and evaluating community
#' structure in networks, *Physical Review E* 69, 026113 (2004)
#' @family community
#' @export
#' @keywords graphs
#' @examples
#'
#' g <- sample_pa(100, m = 2, directed = FALSE)
#' eb <- cluster_edge_betweenness(g)
#'
#' g <- make_full_graph(10) %du% make_full_graph(10)
#' g <- add_edges(g, c(1, 11))
#' eb <- cluster_edge_betweenness(g)
#' eb
#'
cluster_edge_betweenness <- function(graph, weights = NULL,
                                     directed = TRUE,
                                     edge.betweenness = TRUE,
                                     merges = TRUE, bridges = TRUE,
                                     modularity = TRUE,
                                     membership = TRUE) {
  ensure_igraph(graph)

  if (is.null(weights) && "weight" %in% edge_attr_names(graph)) {
    weights <- E(graph)$weight
  }
  if (!is.null(weights) && any(!is.na(weights))) {
    weights <- as.numeric(weights)
  } else {
    weights <- NULL
  }

  on.exit(.Call(R_igraph_finalizer))
  res <- .Call(
    R_igraph_community_edge_betweenness, graph, weights,
    as.logical(directed),
    as.logical(edge.betweenness),
    as.logical(merges), as.logical(bridges),
    as.logical(modularity), as.logical(membership)
  )
  if (igraph_opt("add.vertex.names") && is_named(graph)) {
    res$names <- V(graph)$name
  }
  res$vcount <- vcount(graph)
  res$algorithm <- "edge betweenness"
  res$membership <- res$membership + 1
  res$merges <- res$merges + 1
  res$removed.edges <- res$removed.edges + 1
  res$bridges <- res$bridges + 1
  class(res) <- "communities"
  res
}

#' Community structure via greedy optimization of modularity
#'
#' This function tries to find dense subgraph, also called communities in
#' graphs via directly optimizing a modularity score.
#'
#' This function implements the fast greedy modularity optimization algorithm
#' for finding community structure, see A Clauset, MEJ Newman, C Moore: Finding
#' community structure in very large networks,
#' http://www.arxiv.org/abs/cond-mat/0408187 for the details.
#'
#' @param graph The input graph
#' @param merges Logical scalar, whether to return the merge matrix.
#' @param modularity Logical scalar, whether to return a vector containing the
#'   modularity after each merge.
#' @param membership Logical scalar, whether to calculate the membership vector
#'   corresponding to the maximum modularity score, considering all possible
#'   community structures along the merges.
#' @param weights The weights of the edges. It must be a positive numeric vector,
#'   `NULL` or `NA`. If it is `NULL` and the input graph has a
#'   \sQuote{weight} edge attribute, then that attribute will be used. If
#'   `NULL` and no such attribute is present, then the edges will have equal
#'   weights. Set this to `NA` if the graph was a \sQuote{weight} edge
#'   attribute, but you don't want to use it for community detection. A larger
#'   edge weight means a stronger connection for this function.
#' @return `cluster_fast_greedy()` returns a [communities()]
#'   object, please see the [communities()] manual page for details.
#' @author Tamas Nepusz \email{ntamas@@gmail.com} and Gabor Csardi
#' \email{csardi.gabor@@gmail.com} for the R interface.
#' @seealso [communities()] for extracting the results.
#'
#' See also [cluster_walktrap()],
#' [cluster_spinglass()],
#' [cluster_leading_eigen()] and
#' [cluster_edge_betweenness()], [cluster_louvain()]
#' [cluster_leiden()] for other methods.
#' @references A Clauset, MEJ Newman, C Moore: Finding community structure in
#' very large networks, http://www.arxiv.org/abs/cond-mat/0408187
#' @family community
#' @export
#' @keywords graphs
#' @examples
#'
#' g <- make_full_graph(5) %du% make_full_graph(5) %du% make_full_graph(5)
#' g <- add_edges(g, c(1, 6, 1, 11, 6, 11))
#' fc <- cluster_fast_greedy(g)
#' membership(fc)
#' sizes(fc)
#'
cluster_fast_greedy <- function(graph, merges = TRUE, modularity = TRUE,
                                membership = TRUE, weights = NULL) {
  ensure_igraph(graph)

  if (is.null(weights) && "weight" %in% edge_attr_names(graph)) {
    weights <- E(graph)$weight
  }
  if (!is.null(weights) && any(!is.na(weights))) {
    weights <- as.numeric(weights)
  } else {
    weights <- NULL
  }

  on.exit(.Call(R_igraph_finalizer))
  res <- .Call(
    R_igraph_community_fastgreedy, graph, as.logical(merges),
    as.logical(modularity), as.logical(membership), weights
  )
  if (igraph_opt("add.vertex.names") && is_named(graph)) {
    res$names <- V(graph)$name
  }
  res$algorithm <- "fast greedy"
  res$vcount <- vcount(graph)
  res$membership <- res$membership + 1
  res$merges <- res$merges + 1
  class(res) <- "communities"
  res
}

igraph.i.levc.arp <- function(externalP, externalE) {
  f <- function(v) {
    v <- as.numeric(v)
    .Call(R_igraph_i_levc_arp, externalP, externalE, v)
  }
  f
}



#' Community structure detecting based on the leading eigenvector of the
#' community matrix
#'
#' This function tries to find densely connected subgraphs in a graph by
#' calculating the leading non-negative eigenvector of the modularity matrix of
#' the graph.
#'
#' The function documented in these section implements the \sQuote{leading
#' eigenvector} method developed by Mark Newman, see the reference below.
#'
#' The heart of the method is the definition of the modularity matrix,
#' `B`, which is `B=A-P`, `A` being the adjacency matrix of the
#' (undirected) network, and `P` contains the probability that certain
#' edges are present according to the \sQuote{configuration model}. In other
#' words, a `P[i,j]` element of `P` is the probability that there is
#' an edge between vertices `i` and `j` in a random network in which
#' the degrees of all vertices are the same as in the input graph.
#'
#' The leading eigenvector method works by calculating the eigenvector of the
#' modularity matrix for the largest positive eigenvalue and then separating
#' vertices into two community based on the sign of the corresponding element
#' in the eigenvector. If all elements in the eigenvector are of the same sign
#' that means that the network has no underlying comuunity structure.  Check
#' Newman's paper to understand why this is a good method for detecting
#' community structure.
#'
#' @param graph The input graph. Should be undirected as the method needs a
#'   symmetric matrix.
#' @param steps The number of steps to take, this is actually the number of
#'   tries to make a step. It is not a particularly useful parameter.
#' @param weights The weights of the edges. It must be a positive numeric vector,
#'   `NULL` or `NA`. If it is `NULL` and the input graph has a
#'   \sQuote{weight} edge attribute, then that attribute will be used. If
#'   `NULL` and no such attribute is present, then the edges will have equal
#'   weights. Set this to `NA` if the graph was a \sQuote{weight} edge
#'   attribute, but you don't want to use it for community detection. A larger
#'   edge weight means a stronger connection for this function.
#' @param start `NULL`, or a numeric membership vector, giving the start
#'   configuration of the algorithm.
#' @param options A named list to override some ARPACK options.
#' @param callback If not `NULL`, then it must be callback function. This
#'   is called after each iteration, after calculating the leading eigenvector of
#'   the modularity matrix. See details below.
#' @param extra Additional argument to supply to the callback function.
#' @param env The environment in which the callback function is evaluated.
#' @return `cluster_leading_eigen()` returns a named list with the
#'   following members: \item{membership}{The membership vector at the end of the
#'   algorithm, when no more splits are possible.} \item{merges}{The merges
#'   matrix starting from the state described by the `membership` member.
#'   This is a two-column matrix and each line describes a merge of two
#'   communities, the first line is the first merge and it creates community
#'   \sQuote{`N`}, `N` is the number of initial communities in the
#'   graph, the second line creates community `N+1`, etc.  }
#'   \item{options}{Information about the underlying ARPACK computation, see
#'   [arpack()] for details.  }
#' @section Callback functions: The `callback` argument can be used to
#' supply a function that is called after each eigenvector calculation. The
#' following arguments are supplied to this function: \describe{
#'   \item{membership}{The actual membership vector, with zero-based indexing.}
#'   \item{community}{The community that the algorithm just tried to split,
#'     community numbering starts with zero here.}
#'   \item{value}{The eigenvalue belonging to the leading eigenvector the
#'     algorithm just found.}
#'   \item{vector}{The leading eigenvector the algorithm just found.}
#'   \item{multiplier}{An R function that can be used to multiple the actual
#'     modularity matrix with an arbitrary vector. Supply the vector as an
#'     argument to perform this multiplication. This function can be used
#'     with ARPACK.}
#'   \item{extra}{The `extra` argument that was passed to
#'     `cluster_leading_eigen()`. }
#'   The callback function should return a scalar number. If this number
#'   is non-zero, then the clustering is terminated.
#' }
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @seealso [modularity()], [cluster_walktrap()],
#' [cluster_edge_betweenness()],
#' [cluster_fast_greedy()], [as.dendrogram()]
#' @references MEJ Newman: Finding community structure using the eigenvectors
#' of matrices, Physical Review E 74 036104, 2006.
#' @family community
#' @export
#' @keywords graphs
#' @examples
#'
#' g <- make_full_graph(5) %du% make_full_graph(5) %du% make_full_graph(5)
#' g <- add_edges(g, c(1, 6, 1, 11, 6, 11))
#' lec <- cluster_leading_eigen(g)
#' lec
#'
#' cluster_leading_eigen(g, start = membership(lec))
#'
cluster_leading_eigen <- function(graph, steps = -1, weights = NULL,
                                  start = NULL,
                                  options = arpack_defaults(),
                                  callback = NULL, extra = NULL,
                                  env = parent.frame()) {

  if (is.function(options)) {
    lifecycle::deprecate_soft(
      "1.6.0",
      "cluster_leading_eigen(options = 'must be a list')",
      details = c("`arpack_defaults()` is now a function, use `options = arpack_defaults()` instead of `options = arpack_defaults`.")
    )
    options <- options()
  }

  # Argument checks
  ensure_igraph(graph)

  steps <- as.numeric(steps)
  if (is.null(weights) && "weight" %in% edge_attr_names(graph)) {
    weights <- E(graph)$weight
  }
  if (!is.null(weights) && any(!is.na(weights))) {
    weights <- as.numeric(weights)
  } else {
    weights <- NULL
  }
  if (!is.null(start)) {
    start <- as.numeric(start) - 1
  }

  options <- modify_list(arpack_defaults(), options)

  on.exit(.Call(R_igraph_finalizer))
  # Function call
  res <- .Call(
    R_igraph_community_leading_eigenvector, graph, steps,
    weights, options, start, callback, extra, env,
    environment(igraph.i.levc.arp)
  )
  if (igraph_opt("add.vertex.names") && is_named(graph)) {
    res$names <- V(graph)$name
  }
  res$algorithm <- "leading eigenvector"
  res$vcount <- vcount(graph)
  res$membership <- res$membership + 1
  res$merges <- res$merges + 1
  res$history <- res$history + 1
  class(res) <- "communities"
  res
}

#' Finding communities based on propagating labels
#'
#' This is a fast, nearly linear time algorithm for detecting community
#' structure in networks. In works by labeling the vertices with unique labels
#' and then updating the labels by majority voting in the neighborhood of the
#' vertex.
#'
#' This function implements the community detection method described in:
#' Raghavan, U.N. and Albert, R. and Kumara, S.: Near linear time algorithm to
#' detect community structures in large-scale networks. Phys Rev E 76, 036106.
#' (2007). This version extends the original method by the ability to take edge
#' weights into consideration and also by allowing some labels to be fixed.
#'
#' From the abstract of the paper: \dQuote{In our algorithm every node is
#' initialized with a unique label and at every step each node adopts the label
#' that most of its neighbors currently have. In this iterative process densely
#' connected groups of nodes form a consensus on a unique label to form
#' communities.}
#'
#' @param graph The input graph. Note that the algorithm wsa originally
#'   defined for undirected graphs. You are advised to set \sQuote{mode} to
#'   `all` if you pass a directed graph here to treat it as
#'   undirected.
#' @param weights The weights of the edges. It must be a positive numeric vector,
#'   `NULL` or `NA`. If it is `NULL` and the input graph has a
#'   \sQuote{weight} edge attribute, then that attribute will be used. If
#'   `NULL` and no such attribute is present, then the edges will have equal
#'   weights. Set this to `NA` if the graph was a \sQuote{weight} edge
#'   attribute, but you don't want to use it for community detection. A larger
#'   edge weight means a stronger connection for this function.
#' @inheritParams rlang::args_dots_empty
#' @param mode Logical, whether to consider edge directions for the label propagation,
#' and if so, in which direction the labels should propagate. Ignored for undirected graphs.
#' "all" means to ignore edge directions (even in directed graphs).
#' "out" means to propagate labels along the natural direction of the edges.
#' "in" means to propagate labels backwards (i.e. from head to tail).
#' @param initial The initial state. If `NULL`, every vertex will have a
#'   different label at the beginning. Otherwise it must be a vector with an
#'   entry for each vertex. Non-negative values denote different labels, negative
#'   entries denote vertices without labels.
#' @param fixed Logical vector denoting which labels are fixed. Of course this
#'   makes sense only if you provided an initial state, otherwise this element
#'   will be ignored. Also note that vertices without labels cannot be fixed.
#' @return `cluster_label_prop()` returns a
#'   [communities()] object, please see the [communities()]
#'   manual page for details.
#' @author Tamas Nepusz \email{ntamas@@gmail.com} for the C implementation,
#' Gabor Csardi \email{csardi.gabor@@gmail.com} for this manual page.
#' @seealso [communities()] for extracting the actual results.
#'
#' [cluster_fast_greedy()], [cluster_walktrap()],
#' [cluster_spinglass()], [cluster_louvain()] and
#' [cluster_leiden()] for other community detection methods.
#' @references Raghavan, U.N. and Albert, R. and Kumara, S.: Near linear time
#' algorithm to detect community structures in large-scale networks. *Phys
#' Rev E* 76, 036106. (2007)
#' @family community
#' @export
#' @keywords graphs
#' @examples
#'
#' g <- sample_gnp(10, 5 / 10) %du% sample_gnp(9, 5 / 9)
#' g <- add_edges(g, c(1, 12))
#' cluster_label_prop(g)
#'
cluster_label_prop <- function(
    graph,
    weights = NULL,
    ...,
    mode = c("out", "in", "all"),
    initial = NULL,
    fixed = NULL) {
  if (...length() > 0) {
    lifecycle::deprecate_soft(
      "1.6.0",
      "cluster_label_prop(... = )",
      details = "Arguments `initial` and `fixed` must be named."
    )

    dots <- list(...)
    dots[["graph"]] <- graph
    dots[["weights"]] <- weights
    if (!is.null(initial)) {
      dots[["initial"]] <- initial
    }
    if (!is.null(fixed)) {
      dots[["fixed"]] <- fixed
    }

    return(inject(cluster_label_prop0(!!!dots)))
  }

  cluster_label_prop0(graph, weights, mode, initial, fixed)
}

cluster_label_prop0 <- function(
    graph,
    weights = NULL,
    mode = c("out", "in", "all"),
    initial = NULL,
    fixed = NULL) {
  # Argument checks
  ensure_igraph(graph)

  if (is.null(weights) && "weight" %in% edge_attr_names(graph)) {
    weights <- E(graph)$weight
  }
  if (!is.null(weights) && any(!is.na(weights))) {
    weights <- as.numeric(weights)
  } else {
    weights <- NULL
  }
  if (!is.null(initial)) initial <- as.numeric(initial)
  if (!is.null(fixed)) fixed <- as.logical(fixed)

  directed <- switch(igraph.match.arg(mode), "out" = TRUE, "in" = TRUE, "all" = FALSE)
  mode <- switch(igraph.match.arg(mode), "out" = 1L, "in" = 2L, "all" = 3L)

  on.exit(.Call(R_igraph_finalizer))
  # Function call
  membership <- .Call(R_igraph_community_label_propagation, graph, mode, weights, initial, fixed)
  res <- list()
  if (igraph_opt("add.vertex.names") && is_named(graph)) {
    res$names <- V(graph)$name
  }
  res$vcount <- vcount(graph)
  res$algorithm <- "label propagation"
  res$membership <- membership + 1
  res$modularity <- modularity(graph, res$membership, weights, directed)
  class(res) <- "communities"
  res
}



#' Finding community structure by multi-level optimization of modularity
#'
#' This function implements the multi-level modularity optimization algorithm
#' for finding community structure, see references below. It is based on the
#' modularity measure and a hierarchical approach.
#'
#' This function implements the multi-level modularity optimization algorithm
#' for finding community structure, see VD Blondel, J-L Guillaume, R Lambiotte
#' and E Lefebvre: Fast unfolding of community hierarchies in large networks,
#' <https://arxiv.org/abs/0803.0476> for the details.
#'
#' It is based on the modularity measure and a hierarchical approach.
#' Initially, each vertex is assigned to a community on its own. In every step,
#' vertices are re-assigned to communities in a local, greedy way: each vertex
#' is moved to the community with which it achieves the highest contribution to
#' modularity. When no vertices can be reassigned, each community is considered
#' a vertex on its own, and the process starts again with the merged
#' communities. The process stops when there is only a single vertex left or
#' when the modularity cannot be increased any more in a step. Since igraph 1.3,
#' vertices are processed in a random order.
#'
#' This function was contributed by Tom Gregorovic.
#'
#' @param graph The input graph.
#' @param weights The weights of the edges. It must be a positive numeric vector,
#'   `NULL` or `NA`. If it is `NULL` and the input graph has a
#'   \sQuote{weight} edge attribute, then that attribute will be used. If
#'   `NULL` and no such attribute is present, then the edges will have equal
#'   weights. Set this to `NA` if the graph was a \sQuote{weight} edge
#'   attribute, but you don't want to use it for community detection. A larger
#'   edge weight means a stronger connection for this function.
#' @param resolution Optional resolution parameter that allows the user to
#'   adjust the resolution parameter of the modularity function that the algorithm
#'   uses internally. Lower values typically yield fewer, larger clusters. The
#'   original definition of modularity is recovered when the resolution parameter
#'   is set to 1.
#' @return `cluster_louvain()` returns a [communities()]
#'   object, please see the [communities()] manual page for details.
#' @author Tom Gregorovic, Tamas Nepusz \email{ntamas@@gmail.com}
#' @seealso See [communities()] for extracting the membership,
#' modularity scores, etc. from the results.
#'
#' Other community detection algorithms: [cluster_walktrap()],
#' [cluster_spinglass()],
#' [cluster_leading_eigen()],
#' [cluster_edge_betweenness()],
#' [cluster_fast_greedy()],
#' [cluster_label_prop()]
#' [cluster_leiden()]
#' @references Vincent D. Blondel, Jean-Loup Guillaume, Renaud Lambiotte,
#' Etienne Lefebvre: Fast unfolding of communities in large networks. J. Stat.
#' Mech. (2008) P10008
#' @family community
#' @export
#' @keywords graphs
#' @examples
#'
#' # This is so simple that we will have only one level
#' g <- make_full_graph(5) %du% make_full_graph(5) %du% make_full_graph(5)
#' g <- add_edges(g, c(1, 6, 1, 11, 6, 11))
#' cluster_louvain(g)
#'
cluster_louvain <- function(graph, weights = NULL, resolution = 1) {
  # Argument checks
  ensure_igraph(graph)

  if (is.null(weights) && "weight" %in% edge_attr_names(graph)) {
    weights <- E(graph)$weight
  }
  if (!is.null(weights) && any(!is.na(weights))) {
    weights <- as.numeric(weights)
  } else {
    weights <- NULL
  }
  resolution <- as.numeric(resolution)

  on.exit(.Call(R_igraph_finalizer))
  # Function call
  res <- .Call(R_igraph_community_multilevel, graph, weights, resolution)
  if (igraph_opt("add.vertex.names") && is_named(graph)) {
    res$names <- V(graph)$name
  }
  res$vcount <- vcount(graph)
  res$algorithm <- "multi level"
  res$membership <- res$membership + 1
  res$memberships <- res$memberships + 1
  class(res) <- "communities"
  res
}



#' Optimal community structure
#'
#' This function calculates the optimal community structure of a graph, by
#' maximizing the modularity measure over all possible partitions.
#'
#' This function calculates the optimal community structure for a graph, in
#' terms of maximal modularity score.
#'
#' The calculation is done by transforming the modularity maximization into an
#' integer programming problem, and then calling the GLPK library to solve
#' that. Please the reference below for details.
#'
#' Note that modularity optimization is an NP-complete problem, and all known
#' algorithms for it have exponential time complexity. This means that you
#' probably don't want to run this function on larger graphs. Graphs with up to
#' fifty vertices should be fine, graphs with a couple of hundred vertices
#' might be possible.
#'
#' @section Examples:
#' \preformatted{
#'
#' ## Zachary's karate club
#' g <- make_graph("Zachary")
#'
#' ## We put everything into a big 'try' block, in case
#' ## igraph was compiled without GLPK support
#'
#' ## The calculation only takes a couple of seconds
#' oc <- cluster_optimal(g)
#'
#' ## Double check the result
#' print(modularity(oc))
#' print(modularity(g, membership(oc)))
#'
#' ## Compare to the greedy optimizer
#' fc <- cluster_fast_greedy(g)
#' print(modularity(fc))
#' }
#'
#' @param graph The input graph. Edge directions are ignored for directed
#'   graphs.
#' @param weights The weights of the edges. It must be a positive numeric vector,
#'   `NULL` or `NA`. If it is `NULL` and the input graph has a
#'   \sQuote{weight} edge attribute, then that attribute will be used. If
#'   `NULL` and no such attribute is present, then the edges will have equal
#'   weights. Set this to `NA` if the graph was a \sQuote{weight} edge
#'   attribute, but you don't want to use it for community detection. A larger
#'   edge weight means a stronger connection for this function.
#' @return `cluster_optimal()` returns a [communities()] object,
#'   please see the [communities()] manual page for details.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @seealso [communities()] for the documentation of the result,
#' [modularity()]. See also [cluster_fast_greedy()] for a
#' fast greedy optimizer.
#' @references Ulrik Brandes, Daniel Delling, Marco Gaertler, Robert Gorke,
#' Martin Hoefer, Zoran Nikoloski, Dorothea Wagner: On Modularity Clustering,
#' *IEEE Transactions on Knowledge and Data Engineering* 20(2):172-188,
#' 2008.
#' @family community
#' @export
#' @keywords graphs
cluster_optimal <- function(graph, weights = NULL) {
  # Argument checks
  ensure_igraph(graph)

  if (is.null(weights) && "weight" %in% edge_attr_names(graph)) {
    weights <- E(graph)$weight
  }
  if (!is.null(weights) && any(!is.na(weights))) {
    weights <- as.numeric(weights)
  } else {
    weights <- NULL
  }

  on.exit(.Call(R_igraph_finalizer))
  # Function call
  res <- .Call(R_igraph_community_optimal_modularity, graph, weights)
  if (igraph_opt("add.vertex.names") && is_named(graph)) {
    res$names <- V(graph)$name
  }
  res$vcount <- vcount(graph)
  res$algorithm <- "optimal"
  res$membership <- res$membership + 1
  class(res) <- "communities"
  res
}



#' Infomap community finding
#'
#' Find community structure that minimizes the expected description length of a
#' random walker trajectory. If the graph is directed, edge directions will
#' be taken into account.
#'
#' Please see the details of this method in the references given below.
#'
#' @param graph The input graph. Edge directions will be taken into account.
#' @param e.weights If not `NULL`, then a numeric vector of edge weights.
#'   The length must match the number of edges in the graph.  By default the
#'   \sQuote{`weight`} edge attribute is used as weights. If it is not
#'   present, then all edges are considered to have the same weight.
#'   Larger edge weights correspond to stronger connections.
#' @param v.weights If not `NULL`, then a numeric vector of vertex
#'   weights. The length must match the number of vertices in the graph.  By
#'   default the \sQuote{`weight`} vertex attribute is used as weights. If
#'   it is not present, then all vertices are considered to have the same weight.
#'   A larger vertex weight means a larger probability that the random surfer
#'   jumps to that vertex.
#' @param nb.trials The number of attempts to partition the network (can be any
#'   integer value equal or larger than 1).
#' @param modularity Logical scalar, whether to calculate the modularity score
#'   of the detected community structure.
#' @return `cluster_infomap()` returns a [communities()] object,
#'   please see the [communities()] manual page for details.
#' @author Martin Rosvall wrote the original C++ code. This was ported to
#' be more igraph-like by Emmanuel Navarro.  The R interface and
#' some cosmetics was done by Gabor Csardi \email{csardi.gabor@@gmail.com}.
#' @seealso Other community finding methods and [communities()].
#' @references The original paper: M. Rosvall and C. T. Bergstrom, Maps of
#' information flow reveal community structure in complex networks, *PNAS*
#' 105, 1118 (2008) \doi{10.1073/pnas.0706851105}, <https://arxiv.org/abs/0707.0609>
#'
#' A more detailed paper: M. Rosvall, D. Axelsson, and C. T. Bergstrom, The map
#' equation, *Eur. Phys. J. Special Topics* 178, 13 (2009).
#' \doi{10.1140/epjst/e2010-01179-1}, <https://arxiv.org/abs/0906.1405>.
#' @family community
#' @export
#' @keywords graphs
#' @examples
#'
#' ## Zachary's karate club
#' g <- make_graph("Zachary")
#'
#' imc <- cluster_infomap(g)
#' membership(imc)
#' communities(imc)
#'
cluster_infomap <- function(graph, e.weights = NULL, v.weights = NULL,
                            nb.trials = 10, modularity = TRUE) {
  # Argument checks
  ensure_igraph(graph)

  if (is.null(e.weights) && "weight" %in% edge_attr_names(graph)) {
    e.weights <- E(graph)$weight
  }
  if (!is.null(e.weights) && any(!is.na(e.weights))) {
    e.weights <- as.numeric(e.weights)
  } else {
    e.weights <- NULL
  }
  if (is.null(v.weights) && "weight" %in% vertex_attr_names(graph)) {
    v.weights <- V(graph)$weight
  }
  if (!is.null(v.weights) && any(!is.na(v.weights))) {
    v.weights <- as.numeric(v.weights)
  } else {
    v.weights <- NULL
  }
  nb.trials <- as.numeric(nb.trials)

  on.exit(.Call(R_igraph_finalizer))
  # Function call
  res <- .Call(
    R_igraph_community_infomap, graph, e.weights,
    v.weights, nb.trials
  )

  if (igraph_opt("add.vertex.names") && is_named(graph)) {
    res$names <- V(graph)$name
  }
  res$vcount <- vcount(graph)
  res$algorithm <- "infomap"
  res$membership <- res$membership + 1
  if (modularity) {
    res$modularity <- modularity(graph, res$membership, weights = e.weights)
  }
  class(res) <- "communities"
  res
}

#' @rdname communities
#' @method plot communities
#' @export
#' @importFrom graphics plot
plot.communities <- function(x, y,
                             col = membership(x),
                             mark.groups = communities(x),
                             edge.color = c("black", "red")[crossing(x, y) + 1],
                             ...) {
  plot(y,
    vertex.color = col, mark.groups = mark.groups,
    edge.color = edge.color,
    ...
  )
}



#' @rdname plot_dendrogram.communities
#' @export
plot_dendrogram <- function(x, mode = igraph_opt("dend.plot.type"), ...) {
  UseMethod("plot_dendrogram")
}



#' Community structure dendrogram plots
#'
#' Plot a hierarchical community structure as a dendrogram.
#'
#' `plot_dendrogram()` supports three different plotting functions, selected via
#' the `mode` argument. By default the plotting function is taken from the
#' `dend.plot.type` igraph option, and it has for possible values:
#' \itemize{ \item `auto` Choose automatically between the plotting
#' functions. As `plot.phylo` is the most sophisticated, that is choosen,
#' whenever the `ape` package is available. Otherwise `plot.hclust`
#' is used.  \item `phylo` Use `plot.phylo` from the `ape`
#' package.  \item `hclust` Use `plot.hclust` from the `stats`
#' package.  \item `dendrogram` Use `plot.dendrogram` from the
#' `stats` package.  }
#'
#' The different plotting functions take different sets of arguments. When
#' using `plot.phylo` (`mode="phylo"`), we have the following syntax:
#' \preformatted{
#'     plot_dendrogram(x, mode="phylo", colbar = palette(),
#'             edge.color = NULL, use.edge.length = FALSE, \dots)
#' } The extra arguments not documented above: \itemize{
#'   \item `colbar` Color bar for the edges.
#'   \item `edge.color` Edge colors. If `NULL`, then the
#'     `colbar` argument is used.
#'   \item `use.edge.length` Passed to `plot.phylo`.
#'   \item `dots` Attitional arguments to pass to `plot.phylo`.
#' }
#'
#' The syntax for `plot.hclust` (`mode="hclust"`): \preformatted{
#'     plot_dendrogram(x, mode="hclust", rect = 0, colbar = palette(),
#'             hang = 0.01, ann = FALSE, main = "", sub = "", xlab = "",
#'             ylab = "", \dots)
#' } The extra arguments not documented above: \itemize{
#'   \item `rect` A numeric scalar, the number of groups to mark on
#'     the dendrogram. The dendrogram is cut into exactly `rect`
#'     groups and they are marked via the `rect.hclust` command. Set
#'     this to zero if you don't want to mark any groups.
#'   \item `colbar` The colors of the rectangles that mark the
#'     vertex groups via the `rect` argument.
#'   \item `hang` Where to put the leaf nodes, this corresponds to the
#'     `hang` argument of `plot.hclust`.
#'   \item `ann`  Whether to annotate the plot, the `ann`
#'     argument of `plot.hclust`.
#'   \item `main` The main title of the plot, the `main` argument
#'     of `plot.hclust`.
#'   \item `sub` The sub-title of the plot, the `sub` argument of
#'     `plot.hclust`.
#'   \item `xlab` The label on the horizontal axis, passed to
#'     `plot.hclust`.
#'   \item `ylab` The label on the vertical axis, passed to
#'     `plot.hclust`.
#'   \item `dots` Attitional arguments to pass to `plot.hclust`.
#' }
#'
#' The syntax for `plot.dendrogram` (`mode="dendrogram"`):
#' \preformatted{
#'     plot_dendrogram(x, \dots)
#' } The extra arguments are simply passed to [as.dendrogram()].
#'
#' @param x An object containing the community structure of a graph. See
#'   [communities()] for details.
#' @param mode Which dendrogram plotting function to use. See details below.
#' @param \dots Additional arguments to supply to the dendrogram plotting
#'   function.
#' @param use.modularity Logical scalar, whether to use the modularity values
#'   to define the height of the branches.
#' @param palette The color palette to use for colored plots.
#' @return Returns whatever the return value was from the plotting function,
#'   `plot.phylo`, `plot.dendrogram` or `plot.hclust`.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @method plot_dendrogram communities
#' @family community
#' @export
#' @keywords graphs
#' @examples
#'
#' karate <- make_graph("Zachary")
#' fc <- cluster_fast_greedy(karate)
#' plot_dendrogram(fc)
#'
plot_dendrogram.communities <- function(x,
                                        mode = igraph_opt("dend.plot.type"), ...,
                                        use.modularity = FALSE,
                                        palette = categorical_pal(8)) {
  mode <- igraph.match.arg(mode, c("auto", "phylo", "hclust", "dendrogram"))

  old_palette <- palette(palette)
  on.exit(palette(old_palette), add = TRUE)

  if (mode == "auto") {
    have_ape <- requireNamespace("ape", quietly = TRUE)
    mode <- if (have_ape) "phylo" else "hclust"
  }

  if (mode == "hclust") {
    dendPlotHclust(x, use.modularity = use.modularity, ...)
  } else if (mode == "dendrogram") {
    dendPlotDendrogram(x, use.modularity = use.modularity, ...)
  } else if (mode == "phylo") {
    dendPlotPhylo(x, use.modularity = use.modularity, ...)
  }
}

#' @importFrom grDevices palette
#' @importFrom graphics plot
#' @importFrom stats rect.hclust
dendPlotHclust <- function(communities, rect = length(communities),
                           colbar = palette(), hang = -1, ann = FALSE,
                           main = "", sub = "", xlab = "", ylab = "", ...,
                           use.modularity = FALSE) {
  hc <- as.hclust(communities, hang = hang, use.modularity = use.modularity)
  ret <- plot(hc,
    hang = hang, ann = ann, main = main, sub = sub, xlab = xlab,
    ylab = ylab, ...
  )
  if (rect > 0) {
    rect.hclust(hc, k = rect, border = colbar)
  }
  invisible(ret)
}

#' @importFrom graphics plot
dendPlotDendrogram <- function(communities, hang = -1, ...,
                               use.modularity = FALSE) {
  plot(
    as.dendrogram(communities, hang = hang, use.modularity = use.modularity),
    ...
  )
}

#' @importFrom grDevices palette
#' @importFrom graphics plot
dendPlotPhylo <- function(communities, colbar = palette(),
                          col = colbar[membership(communities)],
                          mark.groups = communities(communities),
                          use.modularity = FALSE,
                          edge.color = "#AAAAAAFF",
                          edge.lty = c(1, 2), ...) {
  phy <- ape::as.phylo(communities, use.modularity = use.modularity)

  getedges <- function(tip) {
    repeat {
      ee <- which(!phy$edge[, 1] %in% tip & phy$edge[, 2] %in% tip)
      if (length(ee) <= 1) {
        break
      }
      tip <- c(tip, unique(phy$edge[ee, 1]))
    }
    ed <- which(phy$edge[, 1] %in% tip & phy$edge[, 2] %in% tip)
    eds <- phy$edge[ed, 1]
    good <- which(phy$edge[ed, 1] %in% which(tabulate(eds) != 1))
    ed[good]
  }
  gredges <- lapply(mark.groups, getedges)

  if (length(mark.groups) > 0) {
    ecol <- rep(edge.color, nrow(phy$edge))
    for (gr in seq_along(gredges)) {
      ecol[gredges[[gr]]] <- colbar[gr]
    }
  } else {
    ecol <- edge.color
  }

  elty <- rep(edge.lty[2], nrow(phy$edge))
  elty[unlist(gredges)] <- edge.lty[1]

  plot(phy, edge.color = ecol, edge.lty = elty, tip.color = col, ...)
}

#' Compares community structures using various metrics
#'
#' This function assesses the distance between two community structures.
#'
#'
#' @aliases compare.communities compare.membership
#' @param comm1 A [communities()] object containing a community
#'   structure; or a numeric vector, the membership vector of the first community
#'   structure. The membership vector should contain the community id of each
#'   vertex, the numbering of the communities starts with one.
#' @param comm2 A [communities()] object containing a community
#'   structure; or a numeric vector, the membership vector of the second
#'   community structure, in the same format as for the previous argument.
#' @param method Character scalar, the comparison method to use. Possible
#'   values: \sQuote{vi} is the variation of information (VI) metric of Meila
#'   (2003), \sQuote{nmi} is the normalized mutual information measure proposed
#'   by Danon et al. (2005), \sQuote{split.join} is the split-join distance of
#'   can Dongen (2000), \sQuote{rand} is the Rand index of Rand (1971),
#'   \sQuote{adjusted.rand} is the adjusted Rand index by Hubert and Arabie
#'   (1985).
#' @return A real number.
#' @author Tamas Nepusz \email{ntamas@@gmail.com}
#' @references Meila M: Comparing clusterings by the variation of information.
#' In: Scholkopf B, Warmuth MK (eds.). *Learning Theory and Kernel
#' Machines: 16th Annual Conference on Computational Learning Theory and 7th
#' Kernel Workshop*, COLT/Kernel 2003, Washington, DC, USA. Lecture Notes in
#' Computer Science, vol. 2777, Springer, 2003. ISBN: 978-3-540-40720-1.
#'
#' Danon L, Diaz-Guilera A, Duch J, Arenas A: Comparing community structure
#' identification. *J Stat Mech* P09008, 2005.
#'
#' van Dongen S: Performance criteria for graph clustering and Markov cluster
#' experiments. Technical Report INS-R0012, National Research Institute for
#' Mathematics and Computer Science in the Netherlands, Amsterdam, May 2000.
#'
#' Rand WM: Objective criteria for the evaluation of clustering methods.
#' *J Am Stat Assoc* 66(336):846-850, 1971.
#'
#' Hubert L and Arabie P: Comparing partitions. *Journal of
#' Classification* 2:193-218, 1985.
#' @family community
#' @export
#' @keywords graphs
#' @examples
#'
#' g <- make_graph("Zachary")
#' sg <- cluster_spinglass(g)
#' le <- cluster_leading_eigen(g)
#' compare(sg, le, method = "rand")
#' compare(membership(sg), membership(le))
#'
compare <- function(comm1, comm2, method = c(
                      "vi", "nmi",
                      "split.join", "rand",
                      "adjusted.rand"
                    )) {
  UseMethod("compare")
}

#' @method compare communities
#' @family community
#' @export
compare.communities <- function(comm1, comm2,
                                method = c(
                                  "vi", "nmi", "split.join", "rand",
                                  "adjusted.rand"
                                )) {
  i_compare(comm1, comm2, method)
}

#' @method compare membership
#' @family community
#' @export
compare.membership <- function(comm1, comm2,
                               method = c(
                                 "vi", "nmi", "split.join", "rand",
                                 "adjusted.rand"
                               )) {
  i_compare(comm1, comm2, method)
}

#' @method compare default
#' @family community
#' @export
compare.default <- compare.membership

i_compare <- function(comm1, comm2, method = c(
                        "vi", "nmi", "split.join",
                        "rand", "adjusted.rand"
                      )) {
  comm1 <- if (inherits(comm1, "communities")) {
    as.numeric(membership(comm1))
  } else {
    as.numeric(as.factor(comm1))
  }
  comm2 <- if (inherits(comm2, "communities")) {
    as.numeric(membership(comm2))
  } else {
    as.numeric(as.factor(comm2))
  }
  method <- switch(igraph.match.arg(method),
    vi = 0L,
    nmi = 1L,
    split.join = 2L,
    rand = 3L,
    adjusted.rand = 4L
  )
  on.exit(.Call(R_igraph_finalizer))
  res <- .Call(R_igraph_compare_communities, comm1, comm2, method)
  res
}

#' Split-join distance of two community structures
#'
#' The split-join distance between partitions A and B is the sum of the
#' projection distance of A from B and the projection distance of B from
#' A. The projection distance is an asymmetric measure and it is defined as
#' follows:
#'
#' First, each set in partition A is evaluated against all sets in
#' partition B. For each set in partition A, the best matching set in
#' partition B is found and the overlap size is calculated. (Matching is
#' quantified by the size of the overlap between the two sets). Then, the
#' maximal overlap sizes for each set in A are summed together and
#' subtracted from the number of elements in A.
#'
#' The split-join distance will be returned as two numbers, the first is
#' the projection distance of the first partition from the
#' second, while the second number is the projection distance of the second
#' partition from the first. This makes it easier to detect whether a
#' partition is a subpartition of the other, since in this case, the
#' corresponding distance will be zero.
#'
#' @param comm1 The first community structure.
#' @param comm2 The second community structure.
#' @return Two integer numbers, see details below.
#'
#' @references
#' van Dongen S: Performance criteria for graph clustering and Markov
#' cluster experiments. Technical Report INS-R0012, National Research
#' Institute for Mathematics and Computer Science in the Netherlands,
#' Amsterdam, May 2000.
#'
#' @family community
#' @export
split_join_distance <- function(comm1, comm2) {
  comm1 <- if (inherits(comm1, "communities")) {
    as.numeric(membership(comm1))
  } else {
    as.numeric(comm1)
  }
  comm2 <- if (inherits(comm2, "communities")) {
    as.numeric(membership(comm2))
  } else {
    as.numeric(comm2)
  }
  on.exit(.Call(R_igraph_finalizer))
  res <- .Call(R_igraph_split_join_distance, comm1, comm2)
  unlist(res)
}

#' Groups of a vertex partitioning
#'
#' Create a list of vertex groups from some graph clustering or community
#' structure.
#'
#' Currently two methods are defined for this function. The default method
#' works on the output of [components()]. (In fact it works on any
#' object that is a list with an entry called `membership`.)
#'
#' The second method works on [communities()] objects.
#'
#' @aliases groups.default groups.communities
#' @param x Some object that represents a grouping of the vertices. See details
#'   below.
#' @return A named list of numeric or character vectors. The names are just
#'   numbers that refer to the groups. The vectors themselves are numeric or
#'   symbolic vertex ids.
#' @seealso [components()] and the various community finding
#' functions.
#' @examples
#' g <- make_graph("Zachary")
#' fgc <- cluster_fast_greedy(g)
#' groups(fgc)
#'
#' g2 <- make_ring(10) + make_full_graph(5)
#' groups(components(g2))
#' @family community
#' @export
groups <- function(x) {
  UseMethod("groups")
}

#' @method groups default
#' @family community
#' @export
groups.default <- function(x) {
  vids <- names(x$membership)
  if (is.null(vids)) vids <- seq_along(x$membership)
  tapply(vids, x$membership, simplify = FALSE, function(x) x)
}

#' @method groups communities
#' @family community
#' @export
groups.communities <- function(x) {
  m <- membership(x)
  groups.default(list(membership = m))
}

#' @rdname communities
#' @export
communities <- groups.communities

#' @method "[" communities
#' @family community
#' @export
`[.communities` <- function(x, i) {
  groups(x)[i]
}

#' @method "[[" communities
#' @family community
#' @export
`[[.communities` <- function(x, i) {
  groups(x)[[i]]
}


#' Contract several vertices into a single one
#'
#' This function creates a new graph, by merging several vertices into one. The
#' vertices in the new graph correspond to sets of vertices in the input graph.
#'
#' The attributes of the graph are kept. Graph and edge attributes are
#' unchanged, vertex attributes are combined, according to the
#' `vertex.attr.comb` parameter.
#'
#' @param graph The input graph, it can be directed or undirected.
#' @param mapping A numeric vector that specifies the mapping. Its elements
#'   correspond to the vertices, and for each element the id in the new graph is
#'   given.
#' @param vertex.attr.comb Specifies how to combine the vertex attributes in
#'   the new graph. Please see [attribute.combination()] for details.
#' @return A new graph object.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @keywords graphs
#' @examples
#'
#' g <- make_ring(10)
#' g$name <- "Ring"
#' V(g)$name <- letters[1:vcount(g)]
#' E(g)$weight <- runif(ecount(g))
#'
#' g2 <- contract(g, rep(1:5, each = 2),
#'   vertex.attr.comb = toString
#' )
#'
#' ## graph and edge attributes are kept, vertex attributes are
#' ## combined using the 'toString' function.
#' print(g2, g = TRUE, v = TRUE, e = TRUE)
#'
#' @export
#' @family functions for manipulating graph structure
#' @cdocs igraph_contract_vertices
contract <- contract_vertices_impl


#' Voronoi partitioning of a graph
#'
#' @description
#' `r lifecycle::badge("experimental")`
#'
#' This function partitions the vertices of a graph based on a set of generator
#' vertices. Each vertex is assigned to the generator vertex from (or to) which
#' it is closest.
#'
#' [groups()] may be used on the output of this function.
#'
#' @param graph The graph to partition into Voronoi cells.
#' @param generators The generator vertices of the Voronoi cells.
#' @param mode Character string. In directed graphs, whether to compute
#'   distances from generator vertices to other vertices (`"out"`), to
#'   generator vertices from other vertices (`"in"`), or ignore edge
#'   directions entirely (`"all"`). Ignored in undirected graphs.
#' @param tiebreaker Character string that specifies what to do when a vertex
#'   is at the same distance from multiple generators. `"random"` assigns
#'   a minimal-distance generator randomly, `"first"` takes the first one,
#'   and `"last"` takes the last one.
#' @inheritParams distances
#' @inheritParams rlang::args_dots_empty
#' @return A named list with two components:
#'   \item{membership}{numeric vector giving the cluster id to which each vertex
#'   belongs.}
#'   \item{distances}{numeric vector giving the distance of each vertex from its
#'   generator}
#' @seealso [distances()]
#' @examples
#'
#' g <- make_lattice(c(10,10))
#' clu <- voronoi_cells(g, c(25, 43, 67))
#' groups(clu)
#' plot(g, vertex.color=clu$membership)
#'
#' @export
#' @family community
#' @cdocs igraph_voronoi
voronoi_cells <- voronoi_impl
