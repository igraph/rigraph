
#' Triad census, subgraphs with three vertices
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `triad.census()` was renamed to `triad_census()` to create a more
#' consistent API.
#' @inheritParams triad_census
#' @keywords internal
#' @export
triad.census <- function(graph) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "triad.census()", "triad_census()")
  triad_census(graph = graph)
} # nocov end

#' Graph motifs
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `graph.motifs.no()` was renamed to `count_motifs()` to create a more
#' consistent API.
#' @inheritParams count_motifs
#' @keywords internal
#' @export
graph.motifs.no <- function(graph, size = 3, cut.prob = rep(0, size)) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "graph.motifs.no()", "count_motifs()")
  count_motifs(graph = graph, size = size, cut.prob = cut.prob)
} # nocov end

#' Graph motifs
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `graph.motifs.est()` was renamed to `sample_motifs()` to create a more
#' consistent API.
#' @inheritParams sample_motifs
#' @keywords internal
#' @export
graph.motifs.est <- function(graph, size = 3, cut.prob = rep(0, size), sample.size = vcount(graph) / 10, sample = NULL) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "graph.motifs.est()", "sample_motifs()")
  sample_motifs(graph = graph, size = size, cut.prob = cut.prob, sample.size = sample.size, sample = sample)
} # nocov end

#' Graph motifs
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `graph.motifs()` was renamed to `motifs()` to create a more
#' consistent API.
#' @inheritParams motifs
#' @keywords internal
#' @export
graph.motifs <- function(graph, size = 3, cut.prob = rep(0, size)) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "graph.motifs()", "motifs()")
  motifs(graph = graph, size = size, cut.prob = cut.prob)
} # nocov end

#' Dyad census of a graph
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `dyad.census()` was renamed to `dyad_census()` to create a more
#' consistent API.
#' @inheritParams dyad_census
#' @keywords internal
#' @export
dyad.census <- function(graph) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "dyad.census()", "dyad_census()")
  dyad_census(graph = graph)
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

#' Graph motifs
#'
#' Graph motifs are small connected induced subgraphs with a well-defined
#' structure.  These functions search a graph for various motifs.
#'
#' `motifs()` searches a graph for motifs of a given size and returns a
#' numeric vector containing the number of different motifs. The order of
#' the motifs is defined by their isomorphism class, see
#' [isomorphism_class()].
#'
#' @param graph Graph object, the input graph.
#' @param size The size of the motif, currently sizes 3 and 4 are supported in
#'   directed graphs and sizes 3-6 in undirected graphs.
#' @param cut.prob Numeric vector giving the probabilities that the search
#'   graph is cut at a certain level. Its length should be the same as the size
#'   of the motif (the `size` argument). By default no cuts are made.
#' @return `motifs()` returns a numeric vector, the number of occurrences of
#'   each motif in the graph. The motifs are ordered by their isomorphism
#'   classes. Note that for unconnected subgraphs, which are not considered to be
#'   motifs, the result will be `NA`.
#' @seealso [isomorphism_class()]
#'
#' @export
#' @family graph motifs
#'
#' @examples
#' g <- sample_pa(100)
#' motifs(g, 3)
#' count_motifs(g, 3)
#' sample_motifs(g, 3)
motifs <- function(graph, size = 3, cut.prob = rep(0, size)) {
  ensure_igraph(graph)
  cut.prob <- as.numeric(cut.prob)
  if (length(cut.prob) != size) {
    cut.prob <- c(
      cut.prob[-length(cut.prob)],
      rep(cut.prob[-length(cut.prob)], length(cut.prob) - 1)
    )
  }

  on.exit(.Call(R_igraph_finalizer))
  res <- .Call(
    R_igraph_motifs_randesu, graph, as.numeric(size),
    as.numeric(cut.prob)
  )
  res[is.nan(res)] <- NA
  res
}

#' Graph motifs
#'
#' Graph motifs are small connected induced subgraphs with a well-defined
#' structure.  These functions search a graph for various motifs.
#'
#' `count_motifs()` calculates the total number of motifs of a given
#' size in graph.
#'
#' @param graph Graph object, the input graph.
#' @param size The size of the motif.
#' @param cut.prob Numeric vector giving the probabilities that the search
#'   graph is cut at a certain level. Its length should be the same as the size
#'   of the motif (the `size` argument). By default no cuts are made.
#' @return `count_motifs()` returns  a numeric scalar.
#' @seealso [isomorphism_class()]
#'
#' @export
#' @family graph motifs
#'
#' @examples
#' g <- sample_pa(100)
#' motifs(g, 3)
#' count_motifs(g, 3)
#' sample_motifs(g, 3)
count_motifs <- function(graph, size = 3, cut.prob = rep(0, size)) {
  ensure_igraph(graph)
  cut.prob <- as.numeric(cut.prob)
  if (length(cut.prob) != size) {
    cut.prob <- c(
      cut.prob[-length(cut.prob)],
      rep(cut.prob[-length(cut.prob)], length(cut.prob) - 1)
    )
  }

  on.exit(.Call(R_igraph_finalizer))
  .Call(
    R_igraph_motifs_randesu_no, graph, as.numeric(size),
    as.numeric(cut.prob)
  )
}

#' Graph motifs
#'
#' Graph motifs are small connected induced subgraphs with a well-defined
#' structure.  These functions search a graph for various motifs.
#'
#' `sample_motifs()` estimates the total number of motifs of a given
#' size in a graph based on a sample.
#'
#' @param graph Graph object, the input graph.
#' @param size The size of the motif, currently size 3 and 4 are supported
#'   in directed graphs and sizes 3-6 in undirected graphs.
#' @param cut.prob Numeric vector giving the probabilities that the search
#'   graph is cut at a certain level. Its length should be the same as the size
#'   of the motif (the `size` argument). By default no cuts are made.
#' @param sample.size The number of vertices to use as a starting point for
#'   finding motifs. Only used if the `sample` argument is `NULL`.
#' @param sample If not `NULL` then it specifies the vertices to use as a
#'   starting point for finding motifs.
#' @return A numeric scalar, an estimate for the total number of motifs in
#'   the graph.
#' @seealso [isomorphism_class()]
#'
#' @export
#' @family graph motifs
#'
#' @examples
#' g <- sample_pa(100)
#' motifs(g, 3)
#' count_motifs(g, 3)
#' sample_motifs(g, 3)
sample_motifs <- function(graph, size = 3, cut.prob = rep(0, size),
                          sample.size = vcount(graph) / 10, sample = NULL) {
  ensure_igraph(graph)
  cut.prob <- as.numeric(cut.prob)
  if (length(cut.prob) != size) {
    cut.prob <- c(
      cut.prob[-length(cut.prob)],
      rep(cut.prob[-length(cut.prob)], length(cut.prob) - 1)
    )
  }

  on.exit(.Call(R_igraph_finalizer))
  .Call(
    R_igraph_motifs_randesu_estimate, graph, as.numeric(size),
    as.numeric(cut.prob), as.numeric(sample.size), as.numeric(sample)
  )
}


#' Dyad census of a graph
#'
#' Classify dyads in a directed graphs. The relationship between each pair of
#' vertices is measured. It can be in three states: mutual, asymmetric or
#' non-existent.
#'
#'
#' @param graph The input graph. A warning is given if it is not directed.
#' @return A named numeric vector with three elements: \item{mut}{The number of
#'   pairs with mutual connections.} \item{asym}{The number of pairs with
#'   non-mutual connections.} \item{null}{The number of pairs with no connection
#'   between them.}
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @seealso [triad_census()] for the same classification, but with
#' triples.
#' @references Holland, P.W. and Leinhardt, S. A Method for Detecting Structure
#' in Sociometric Data. *American Journal of Sociology*, 76, 492--513.
#' 1970.
#'
#' Wasserman, S., and Faust, K. *Social Network Analysis: Methods and
#' Applications.* Cambridge: Cambridge University Press. 1994.
#' @keywords graphs
#' @examples
#'
#' g <- sample_pa(100)
#' dyad_census(g)
#' @family graph motifs
#' @export
#' @cdocs igraph_dyad_census
dyad_census <- function(graph) {
  if (!is_directed(graph)) {
    warn("`dyad_census()` requires a directed graph.")
  }

  dyad_census_impl(graph)
}


#' Triad census, subgraphs with three vertices
#'
#' This function counts the different induced subgraphs of three vertices in
#' a graph.
#'
#' Triad census was defined by David and Leinhardt (see References below).
#' Every triple of vertices (A, B, C) are classified into the 16 possible
#' states: \describe{ \item{003}{A,B,C, the empty graph.} \item{012}{A->B, C,
#' the graph with a single directed edge.} \item{102}{A<->B, C, the graph with
#' a mutual connection between two vertices.} \item{021D}{A<-B->C, the
#' out-star.} \item{021U}{A->B<-C, the in-star.} \item{021C}{A->B->C, directed
#' line.} \item{111D}{A<->B<-C.} \item{111U}{A<->B->C.} \item{030T}{A->B<-C,
#' A->C.} \item{030C}{A<-B<-C, A->C.} \item{201}{A<->B<->C.}
#' \item{120D}{A<-B->C, A<->C.} \item{120U}{A->B<-C, A<->C.}
#' \item{120C}{A->B->C, A<->C.} \item{210}{A->B<->C, A<->C.}
#' \item{300}{A<->B<->C, A<->C, the complete graph.} }
#'
#' This functions uses the RANDESU motif finder algorithm to find and count the
#' subgraphs, see [motifs()].
#'
#' @param graph The input graph, it should be directed. An undirected graph
#'   results a warning, and undefined results.
#' @return A numeric vector, the subgraph counts, in the order given in the
#'   above description.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @seealso [dyad_census()] for classifying binary relationships,
#' [motifs()] for the underlying implementation.
#' @references See also Davis, J.A. and Leinhardt, S.  (1972).  The Structure
#' of Positive Interpersonal Relations in Small Groups.  In J. Berger (Ed.),
#' Sociological Theories in Progress, Volume 2, 218-251.  Boston: Houghton
#' Mifflin.
#' @keywords graphs
#' @examples
#'
#' g <- sample_gnm(15, 45, directed = TRUE)
#' triad_census(g)
#' @family motifs
#' @export
#' @cdocs igraph_triad_census
triad_census <- triad_census_impl
