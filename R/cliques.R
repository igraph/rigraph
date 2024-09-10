
#' Independent vertex sets
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `maximal.independent.vertex.sets()` was renamed to `maximal_ivs()` to create a more
#' consistent API.
#' @inheritParams maximal_ivs
#' @keywords internal
#' @export
maximal.independent.vertex.sets <- function(graph) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "maximal.independent.vertex.sets()", "maximal_ivs()")
  maximal_ivs(graph = graph)
} # nocov end

#' Functions to find cliques, i.e. complete subgraphs in a graph
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `maximal.cliques.count()` was renamed to `count_max_cliques()` to create a more
#' consistent API.
#' @inheritParams count_max_cliques
#' @keywords internal
#' @export
maximal.cliques.count <- function(graph, min = NULL, max = NULL, subset = NULL) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "maximal.cliques.count()", "count_max_cliques()")
  count_max_cliques(graph = graph, min = min, max = max, subset = subset)
} # nocov end

#' Functions to find cliques, i.e. complete subgraphs in a graph
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `maximal.cliques()` was renamed to `max_cliques()` to create a more
#' consistent API.
#' @inheritParams max_cliques
#' @keywords internal
#' @export
maximal.cliques <- function(graph, min = NULL, max = NULL, subset = NULL, file = NULL) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "maximal.cliques()", "max_cliques()")
  max_cliques(graph = graph, min = min, max = max, subset = subset, file = file)
} # nocov end

#' Independent vertex sets
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `largest.independent.vertex.sets()` was renamed to `largest_ivs()` to create a more
#' consistent API.
#' @inheritParams largest_ivs
#' @keywords internal
#' @export
largest.independent.vertex.sets <- function(graph) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "largest.independent.vertex.sets()", "largest_ivs()")
  largest_ivs(graph = graph)
} # nocov end

#' Functions to find cliques, i.e. complete subgraphs in a graph
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `largest.cliques()` was renamed to `largest_cliques()` to create a more
#' consistent API.
#' @inheritParams largest_cliques
#' @keywords internal
#' @export
largest.cliques <- function(graph) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "largest.cliques()", "largest_cliques()")
  largest_cliques(graph = graph)
} # nocov end

#' Independent vertex sets
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `independent.vertex.sets()` was renamed to `ivs()` to create a more
#' consistent API.
#' @inheritParams ivs
#' @keywords internal
#' @export
independent.vertex.sets <- function(graph, min = NULL, max = NULL) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "independent.vertex.sets()", "ivs()")
  ivs(graph = graph, min = min, max = max)
} # nocov end

#' Independent vertex sets
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `independence.number()` was renamed to `ivs_size()` to create a more
#' consistent API.
#' @inheritParams ivs_size
#' @keywords internal
#' @export
independence.number <- function(graph) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "independence.number()", "ivs_size()")
  ivs_size(graph = graph)
} # nocov end

#' Functions to find cliques, i.e. complete subgraphs in a graph
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `clique.number()` was renamed to `clique_num()` to create a more
#' consistent API.
#' @inheritParams clique_num
#' @keywords internal
#' @export
clique.number <- function(graph) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "clique.number()", "clique_num()")
  clique_num(graph = graph)
} # nocov end
#   IGraph R package
#   Copyright (C) 2006-2012  Gabor Csardi <csardi.gabor@gmail.com>
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



#' Functions to find cliques, i.e. complete subgraphs in a graph
#'
#' These functions find all, the largest or all the maximal cliques in an
#' undirected graph. The size of the largest clique can also be calculated.
#'
#' `cliques()` find all complete subgraphs in the input graph, obeying the
#' size limitations given in the `min` and `max` arguments.
#'
#' `largest_cliques()` finds all largest cliques in the input graph. A
#' clique is largest if there is no other clique including more vertices.
#'
#' `max_cliques()` finds all maximal cliques in the input graph.  A
#' clique is maximal if it cannot be extended to a larger clique. The largest
#' cliques are always maximal, but a maximal clique is not necessarily the
#' largest.
#'
#' `count_max_cliques()` counts the maximal cliques.
#'
#' `clique_num()` calculates the size of the largest clique(s).
#'
#' `clique_size_counts()` returns a numeric vector representing a histogram
#' of clique sizes, between the given minimum and maximum clique size.
#'
#' @inheritParams weighted_cliques
#' @param graph The input graph, directed graphs will be considered as
#'   undirected ones, multiple edges and loops are ignored.
#' @param min Numeric constant, lower limit on the size of the cliques to find.
#'   `NULL` means no limit, i.e. it is the same as 0.
#' @param max Numeric constant, upper limit on the size of the cliques to find.
#'   `NULL` means no limit.
#' @return `cliques()`, `largest_cliques()` and `clique_num()`
#'   return a list containing numeric vectors of vertex ids. Each list element is
#'   a clique, i.e. a vertex sequence of class [`igraph.vs()`][V].
#'
#'   `max_cliques()` returns `NULL`, invisibly, if its `file`
#'   argument is not `NULL`. The output is written to the specified file in
#'   this case.
#'
#'   `clique_num()` and `count_max_cliques()` return an integer
#'   scalar.
#'
#'   `clique_size_counts()` returns a numeric vector with the clique sizes such that
#'   the i-th item belongs to cliques of size i. Trailing zeros are currently
#'   truncated, but this might change in future versions.
#'
#' @author Tamas Nepusz \email{ntamas@@gmail.com} and Gabor Csardi
#' \email{csardi.gabor@@gmail.com}
#' @references For maximal cliques the following algorithm is implemented:
#' David Eppstein, Maarten Loffler, Darren Strash: Listing All Maximal Cliques
#' in Sparse Graphs in Near-optimal Time.  <https://arxiv.org/abs/1006.5440>
#' @family cliques
#' @export
#' @keywords graphs
#' @examples
#'
#' # this usually contains cliques of size six
#' g <- sample_gnp(100, 0.3)
#' clique_num(g)
#' cliques(g, min = 6)
#' largest_cliques(g)
#'
#' # To have a bit less maximal cliques, about 100-200 usually
#' g <- sample_gnp(100, 0.03)
#' max_cliques(g)
#' @cdocs igraph_cliques
cliques <- cliques_impl

#' @rdname cliques
#' @export
#' @cdocs igraph_largest_cliques
largest_cliques <- largest_cliques_impl

#' @rdname cliques
#' @param subset If not `NULL`, then it must be a vector of vertex ids,
#'   numeric or symbolic if the graph is named. The algorithm is run from these
#'   vertices only, so only a subset of all maximal cliques is returned. See the
#'   Eppstein paper for details. This argument makes it possible to easily
#'   parallelize the finding of maximal cliques.
#' @param file If not `NULL`, then it must be a file name, i.e. a
#'   character scalar. The output of the algorithm is written to this file. (If
#'   it exists, then it will be overwritten.) Each clique will be a separate line
#'   in the file, given with the numeric ids of its vertices, separated by
#'   whitespace.
#' @export
max_cliques <- function(graph, min = NULL, max = NULL, subset = NULL, file = NULL) {
  ensure_igraph(graph)

  if (is.null(min)) {
    min <- 0
  }
  if (is.null(max)) {
    max <- 0
  }

  if (!is.null(subset)) {
    subset <- as.numeric(as_igraph_vs(graph, subset) - 1)
  }

  if (!is.null(file)) {
    if (!is.character(file) ||
      length(grep("://", file, fixed = TRUE)) > 0 ||
      length(grep("~", file, fixed = TRUE)) > 0) {
      tmpfile <- TRUE
      origfile <- file
      file <- tempfile()
    } else {
      tmpfile <- FALSE
    }
    on.exit(.Call(R_igraph_finalizer))
    res <- .Call(
      R_igraph_maximal_cliques_file, graph, subset, file,
      as.numeric(min), as.numeric(max)
    )
    if (tmpfile) {
      buffer <- read.graph.toraw(file)
      write.graph.fromraw(buffer, origfile)
    }
    invisible(NULL)
  } else {
    on.exit(.Call(R_igraph_finalizer))
    res <- .Call(
      R_igraph_maximal_cliques, graph, subset,
      as.numeric(min), as.numeric(max)
    )
    res <- lapply(res, function(x) x + 1)

    if (igraph_opt("return.vs.es")) {
      res <- lapply(res, unsafe_create_vs, graph = graph, verts = V(graph))
    }

    res
  }
}

#' @rdname cliques
#' @export
count_max_cliques <- function(graph, min = NULL, max = NULL,
                              subset = NULL) {
  # Argument checks
  ensure_igraph(graph)

  if (is.null(min)) {
    min <- 0
  }
  if (is.null(max)) {
    max <- 0
  }
  min <- as.numeric(min)
  max <- as.numeric(max)

  if (!is.null(subset)) {
    subset <- as.numeric(as_igraph_vs(graph, subset) - 1)
  }

  on.exit(.Call(R_igraph_finalizer))
  # Function call
  res <- .Call(R_igraph_maximal_cliques_count, graph, subset, min, max)

  res
}

#' @rdname cliques
#' @export
#' @cdocs igraph_clique_number
clique_num <- clique_number_impl


#' Functions to find weighted cliques, i.e. vertex-weighted complete subgraphs in a graph
#'
#' These functions find all, the largest or all the maximal weighted cliques in
#' an undirected graph. The weight of a clique is the sum of the weights of its
#' vertices.
#'
#' `weighted_cliques()` finds all complete subgraphs in the input graph,
#' obeying the weight limitations given in the `min` and `max`
#' arguments.
#'
#' `largest_weighted_cliques()` finds all largest weighted cliques in the
#' input graph. A clique is largest if there is no other clique whose total
#' weight is larger than the weight of this clique.
#'
#' `weighted_clique_num()` calculates the weight of the largest weighted clique(s).
#'
#' @param graph The input graph, directed graphs will be considered as
#'   undirected ones, multiple edges and loops are ignored.
#' @param min.weight Numeric constant, lower limit on the weight of the cliques to find.
#'   `NULL` means no limit, i.e. it is the same as 0.
#' @param max.weight Numeric constant, upper limit on the weight of the cliques to find.
#'   `NULL` means no limit.
#' @param vertex.weights Vertex weight vector. If the graph has a `weight`
#'   vertex attribute, then this is used by default. If the graph does not have a
#'   `weight` vertex attribute and this argument is `NULL`, then every
#'   vertex is assumed to have a weight of 1. Note that the current implementation
#'   of the weighted clique finder supports positive integer weights only.
#' @param maximal Specifies whether to look for all weighted cliques (`FALSE`)
#'   or only the maximal ones (`TRUE`).
#' @return `weighted_cliques()` and `largest_weighted_cliques()` return a
#'   list containing numeric vectors of vertex IDs. Each list element is a weighted
#'   clique, i.e. a vertex sequence of class [`igraph.vs()`][V].
#'
#'   `weighted_clique_num()` returns an integer scalar.
#'
#' @author Tamas Nepusz \email{ntamas@@gmail.com} and Gabor Csardi
#' \email{csardi.gabor@@gmail.com}
#' @family cliques
#' @export
#' @keywords graphs
#' @examples
#'
#' g <- make_graph("zachary")
#' V(g)$weight <- 1
#' V(g)[c(1, 2, 3, 4, 14)]$weight <- 3
#' weighted_cliques(g)
#' weighted_cliques(g, maximal = TRUE)
#' largest_weighted_cliques(g)
#' weighted_clique_num(g)
#' @cdocs igraph_weighted_cliques
weighted_cliques <- weighted_cliques_impl
#' @export
#' @rdname cliques
#' @cdocs igraph_largest_weighted_cliques
largest_weighted_cliques <- largest_weighted_cliques_impl
#' @export
#' @rdname cliques
#' @cdocs igraph_weighted_clique_number
weighted_clique_num <- weighted_clique_number_impl

#' Independent vertex sets
#'
#' A vertex set is called independent if there no edges between any two
#' vertices in it. These functions find independent vertex sets in undirected
#' graphs
#'
#' `ivs()` finds all independent vertex sets in the
#' network, obeying the size limitations given in the `min` and `max`
#' arguments.
#'
#' `largest_ivs()` finds the largest independent vertex
#' sets in the graph. An independent vertex set is largest if there is no
#' independent vertex set with more vertices.
#'
#' `maximal_ivs()` finds the maximal independent vertex
#' sets in the graph. An independent vertex set is maximal if it cannot be
#' extended to a larger independent vertex set. The largest independent vertex
#' sets are maximal, but the opposite is not always true.
#'
#' `ivs_size()` calculate the size of the largest independent
#' vertex set(s).
#'
#' These functions use the algorithm described by Tsukiyama et al., see
#' reference below.
#'
#' @param graph The input graph, directed graphs are considered as undirected,
#'   loop edges and multiple edges are ignored.
#' @param min Numeric constant, limit for the minimum size of the independent
#'   vertex sets to find. `NULL` means no limit.
#' @param max Numeric constant, limit for the maximum size of the independent
#'   vertex sets to find. `NULL` means no limit.
#' @return `ivs()`,
#'   `largest_ivs()` and
#'   `maximal_ivs()` return a list containing numeric
#'   vertex ids, each list element is an independent vertex set.
#'
#'   `ivs_size()` returns an integer constant.
#' @author Tamas Nepusz \email{ntamas@@gmail.com} ported it from the Very Nauty
#' Graph Library by Keith Briggs (<http://keithbriggs.info/>) and Gabor
#' Csardi \email{csardi.gabor@@gmail.com} wrote the R interface and this manual
#' page.
#' @references S. Tsukiyama, M. Ide, H. Ariyoshi and I. Shirawaka. A new
#' algorithm for generating all the maximal independent sets. *SIAM J
#' Computing*, 6:505--517, 1977.
#' @family cliques
#' @export
#' @keywords graphs
#' @examples
#'
#' # Do not run, takes a couple of seconds
#'
#' # A quite dense graph
#' set.seed(42)
#' g <- sample_gnp(100, 0.9)
#' ivs_size(g)
#' ivs(g, min = ivs_size(g))
#' largest_ivs(g)
#' # Empty graph
#' induced_subgraph(g, largest_ivs(g)[[1]])
#'
#' length(maximal_ivs(g))
ivs <- function(graph, min = NULL, max = NULL) {
  ensure_igraph(graph)

  if (is.null(min)) {
    min <- 0
  }

  if (is.null(max)) {
    max <- 0
  }

  on.exit(.Call(R_igraph_finalizer))
  res <- .Call(
    R_igraph_independent_vertex_sets, graph, as.numeric(min),
    as.numeric(max)
  )
  res <- lapply(res, `+`, 1)

  if (igraph_opt("return.vs.es")) {
    res <- lapply(res, unsafe_create_vs, graph = graph, verts = V(graph))
  }

  res
}

#' @rdname ivs
#' @export
largest_ivs <- function(graph) {
  ensure_igraph(graph)

  on.exit(.Call(R_igraph_finalizer))
  res <- .Call(R_igraph_largest_independent_vertex_sets, graph)
  res <- lapply(res, `+`, 1)

  if (igraph_opt("return.vs.es")) {
    res <- lapply(res, unsafe_create_vs, graph = graph, verts = V(graph))
  }

  res
}

#' @rdname ivs
#' @export
maximal_ivs <- function(graph) {
  ensure_igraph(graph)

  on.exit(.Call(R_igraph_finalizer))
  res <- .Call(R_igraph_maximal_independent_vertex_sets, graph)
  res <- lapply(res, `+`, 1)

  if (igraph_opt("return.vs.es")) {
    res <- lapply(res, unsafe_create_vs, graph = graph, verts = V(graph))
  }

  res
}

#' @rdname ivs
#' @export
ivs_size <- function(graph) {
  ensure_igraph(graph)

  on.exit(.Call(R_igraph_finalizer))
  .Call(R_igraph_independence_number, graph)
}

#' @rdname cliques
#' @export
#' @cdocs igraph_maximal_cliques_hist
#' @cdocs igraph_clique_size_hist
clique_size_counts <- function(graph, min = 0, max = 0, maximal = FALSE) {
  if (maximal) {
    maximal_cliques_hist_impl(graph, min, max)
  } else {
    clique_size_hist_impl(graph, min, max)
  }
}
