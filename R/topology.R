
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

#' @export

graph.get.isomorphisms.vf2 <- function(graph1, graph2, vertex.color1,
                                       vertex.color2, edge.color1,
                                       edge.color2) {
  # Argument checks
  if (!is_igraph(graph1)) { stop("Not a graph object") }
  if (!is_igraph(graph2)) { stop("Not a graph object") }
  if (missing(vertex.color1)) {
    if ("color" %in% vertex_attr_names(graph1)) {
      vertex.color1 <- V(graph1)$color
    } else {
      vertex.color1 <- NULL
    }
  }
  if (!is.null(vertex.color1)) {
    vertex.color1 <- as.integer(vertex.color1)-1L
  }
  if (missing(vertex.color2)) {
    if ("color" %in% vertex_attr_names(graph2)) {
      vertex.color2 <- V(graph2)$color
    } else {
      vertex.color2 <- NULL
    }
  }
  if (!is.null(vertex.color2)) {
    vertex.color2 <- as.integer(vertex.color2)-1L
  }
  if (missing(edge.color1)) {
    if ("color" %in% edge_attr_names(graph1)) {
      edge.color1 <- E(graph1)$color
    } else {
      edge.color1 <- NULL
    }
  }
  if (!is.null(edge.color1)) {
    edge.color1 <- as.integer(edge.color1)-1L
  }
  if (missing(edge.color2)) {
    if ("color" %in% edge_attr_names(graph2)) {
      edge.color2 <- E(graph2)$color
    } else {
      edge.color2 <- NULL
    }
  }
  if (!is.null(edge.color2)) {
    edge.color2 <- as.integer(edge.color2)-1L
  }

  on.exit( .Call(C_R_igraph_finalizer) )
  # Function call
  res <- .Call(C_R_igraph_get_isomorphisms_vf2, graph1, graph2, vertex.color1,
               vertex.color2, edge.color1, edge.color2)

  lapply(res, function(x) V(graph2)[x + 1])
}

#' @export

graph.get.subisomorphisms.vf2 <- function(graph1, graph2, vertex.color1,
                                          vertex.color2, edge.color1,
                                          edge.color2) {
  # Argument checks
  if (!is_igraph(graph1)) { stop("Not a graph object") }
  if (!is_igraph(graph2)) { stop("Not a graph object") }
  if (missing(vertex.color1)) {
    if ("color" %in% vertex_attr_names(graph1)) {
      vertex.color1 <- V(graph1)$color
    } else {
      vertex.color1 <- NULL
    }
  }
  if (!is.null(vertex.color1)) {
    vertex.color1 <- as.integer(vertex.color1)-1L
  }
  if (missing(vertex.color2)) {
    if ("color" %in% vertex_attr_names(graph2)) {
      vertex.color2 <- V(graph2)$color
    } else {
      vertex.color2 <- NULL
    }
  }
  if (!is.null(vertex.color2)) {
    vertex.color2 <- as.integer(vertex.color2)-1L
  }
  if (missing(edge.color1)) {
    if ("color" %in% edge_attr_names(graph1)) {
      edge.color1 <- E(graph1)$color
    } else {
      edge.color1 <- NULL
    }
  }
  if (!is.null(edge.color1)) {
    edge.color1 <- as.integer(edge.color1)-1L
  }
  if (missing(edge.color2)) {
    if ("color" %in% edge_attr_names(graph2)) {
      edge.color2 <- E(graph2)$color
    } else {
      edge.color2 <- NULL
    }
  }
  if (!is.null(edge.color2)) {
    edge.color2 <- as.integer(edge.color2)-1L
  }

  on.exit( .Call(C_R_igraph_finalizer) )
  # Function call
  res <- .Call(C_R_igraph_get_subisomorphisms_vf2, graph1, graph2,
               vertex.color1, vertex.color2, edge.color1, edge.color2)

  lapply(res, function(x) V(graph1)[x + 1])
}

#' @export

graph.isoclass.subgraph <- function(graph, vids) {
  # Argument checks
  if (!is_igraph(graph)) { stop("Not a graph object") }
  vids <- as.igraph.vs(graph, vids)-1

  on.exit( .Call(C_R_igraph_finalizer) )
  # Function call
  res <- .Call(C_R_igraph_isoclass_subgraph, graph, vids)
  res
}

#' @export

graph.subisomorphic.lad <- function(pattern, target, domains=NULL,
                                    induced=FALSE, map=TRUE, all.maps=FALSE,
                                    time.limit=Inf) {
  # Argument checks
  if (!is_igraph(pattern)) { stop("Not a graph object") }
  if (!is_igraph(target)) { stop("Not a graph object") }
  induced <- as.logical(induced)
  if (time.limit==Inf) {
    time.limit <- 0L
  } else {
    time.limit <- as.integer(time.limit)
  }
  map <- as.logical(map)
  all.maps <- as.logical(all.maps)
  if (!is.null(domains)) {
    if (!is.list(domains)) {
      stop("`domains' must be a list of vertex vectors from `target'")
    }
    if (length(domains) != vcount(pattern)) {
      stop("`domains' length and `pattern' number of vertices must match")
    }
    domains <- lapply(domains, function(x) as.igraph.vs(target, x)-1)
  }

  on.exit( .Call(C_R_igraph_finalizer) )
  # Function call
  res <- .Call(C_R_igraph_subisomorphic_lad, pattern, target, domains,
               induced, time.limit, map, all.maps)

  if (map) {
    res$map <- res$map + 1
    if (igraph_opt("add.vertex.names") && is_named(target)) {
      names(res$map) <- V(target)$name[res$map]
    }
  }
  if (all.maps) res$maps <- lapply(res$maps, function(x) V(target)[x+1])

  res
}

## ----------------------------------------------------------------------
## NEW API

#' Decide if two graphs are isomorphic
#'
#' @section \sQuote{auto} method:
#' It tries to select the appropriate method based on the two graphs.
#' This is the algorithm it uses:
#' \enumerate{
#'   \item If the two graphs do not agree on their order and size
#'     (i.e. number of vertices and edges), then return \code{FALSE}.
#'   \item If the graphs have three or four vertices, then the
#'     \sQuote{direct} method is used.
#'   \item If the graphs are directed, then the \sQuote{vf2} method is
#'     used.
#'   \item Otherwise the \sQuote{bliss} method is used.
#' }
#'
#' @section \sQuote{direct} method:
#' This method only works on graphs with three or four vertices,
#' and it is based on a pre-calculated and stored table. It does not
#' have any extra arguments.
#'
#' @section \sQuote{vf2} method:
#' This method uses the VF2 algorithm by Cordella, Foggia et al., see
#' references below. It supports vertex and edge colors and have the
#' following extra arguments:
#' \describe{
#'   \item{vertex.color1, vertex.color2}{Optional integer vectors giving the
#'     colors of the vertices for colored graph isomorphism. If they
#'     are not given, but the graph has a \dQuote{color} vertex attribute,
#'     then it will be used. If you want to ignore these attributes, then
#'     supply \code{NULL} for both of these arguments. See also examples
#'     below.}
#'   \item{edge.color1, edge.color2}{Optional integer vectors giving the
#'     colors of the edges for edge-colored (sub)graph isomorphism. If they
#'     are not given, but the graph has a \dQuote{color} edge attribute,
#'     then it will be used. If you want to ignore these attributes, then
#'     supply \code{NULL} for both of these arguments.}
#' }
#'
#' @section \sQuote{bliss} method:
#' Uses the BLISS algorithm by Junttila and Kaski, and it works for
#' undirected graphs. For both graphs the
#' \code{\link{canonical_permutation}} and then the \code{\link{permute}}
#' function is called to transfer them into canonical form; finally the
#' canonical forms are compared.
#' Extra arguments:
#' \describe{
#'   \item{sh1}{Character constant, the heuristics to use in the BLISS
#'     algorithm, for \code{graph1}. See the \code{sh} argument of
#'     \code{\link{canonical_permutation}} for possible values.}
#'   \item{sh2}{Character constant, the heuristics to use in the BLISS
#'     algorithm, for \code{graph2}. See the \code{sh} argument of
#'     \code{\link{canonical_permutation}} for possible values.}
#' }
#' \code{sh1} and \code{sh2} default to \sQuote{fm}.
#'
#' @param graph1 The first graph.
#' @param graph2 The second graph.
#' @param method The method to use. Possible values: \sQuote{auto},
#'   \sQuote{direct}, \sQuote{vf2}, \sQuote{bliss}. See their details
#'   below.
#' @param ... Additional arguments, passed to the various methods.
#' @return Logical scalar, \code{TRUE} if the graphs are isomorphic.
#'
#' @aliases graph.isomorphic graph.isomorphic.34 graph.isomorphic.vf2
#'   graph.isomorphic.bliss
#'
#' @references
#'  Tommi Junttila and Petteri Kaski: Engineering an Efficient Canonical
#'  Labeling Tool for Large and Sparse Graphs, \emph{Proceedings of the
#'  Ninth Workshop on Algorithm Engineering and Experiments and the Fourth
#'  Workshop on Analytic Algorithms and Combinatorics.} 2007.
#'
#'  LP Cordella,  P Foggia, C Sansone, and M Vento: An improved algorithm
#'  for matching large graphs, \emph{Proc. of the 3rd IAPR TC-15 Workshop
#'  on Graphbased Representations in Pattern Recognition}, 149--159, 2001.
#'
#' @export
#' @family graph isomorphism
#' @examples
#' # create some non-isomorphic graphs
#' g1 <- graph_from_isomorphism_class(3, 10)
#' g2 <- graph_from_isomorphism_class(3, 11)
#' isomorphic(g1, g2)
#'
#' # create two isomorphic graphs, by permuting the vertices of the first
#' g1 <- barabasi.game(30, m=2, directed=FALSE)
#' g2 <- permute(g1, sample(vcount(g1)))
#' # should be TRUE
#' isomorphic(g1, g2)
#' isomorphic(g1, g2, method = "bliss")
#' isomorphic(g1, g2, method = "vf2")
#'
#' # colored graph isomorphism
#' g1 <- make_ring(10)
#' g2 <- make_ring(10)
#' isomorphic(g1, g2)
#'
#' V(g1)$color <- rep(1:2, length = vcount(g1))
#' V(g2)$color <- rep(2:1, length = vcount(g2))
#' # consider colors by default
#' count_isomorphisms(g1, g2)
#' # ignore colors
#' count_isomorphisms(g1, g2, vertex.color1 = NULL,
#'     vertex.color2 = NULL)

isomorphic <- function(graph1, graph2, method = c("auto", "direct",
                 "vf2", "bliss"), ...) {

  if (!is_igraph(graph1)) { stop("Not a graph object") }
  if (!is_igraph(graph2)) { stop("Not a graph object") }
  method <- igraph.match.arg(method)

  if (method == "auto") {
    on.exit( .Call(C_R_igraph_finalizer) )
    .Call(C_R_igraph_isomorphic, graph1, graph2)

  } else if (method == "direct") {
    on.exit(.Call(C_R_igraph_finalizer))
    .Call(C_R_igraph_isomorphic_34, graph1, graph2)

  } else if (method == "vf2") {
    graph.isomorphic.vf2(graph1, graph2, ...)$iso

  } else if (method == "bliss") {
    graph.isomorphic.bliss(graph1, graph2, ...)$iso

  }
}

#' @export
#' @rdname isomorphic

is_isomorphic_to <- isomorphic


#' Decide if a graph is subgraph isomorphic to another one
#'
#' @section \sQuote{auto} method:
#' This method currently selects \sQuote{lad}, always, as it seems
#' to be superior on most graphs.
#'
#' @section \sQuote{lad} method:
#' This is the LAD algorithm by Solnon, see the reference below. It has
#' the following extra arguments:
#' \describe{
#'   \item{domains}{If not \code{NULL}, then it specifies matching
#'     restrictions. It must be a list of \code{target} vertex sets, given
#'     as numeric vertex ids or symbolic vertex names. The length of the
#'     list must be \code{vcount(pattern)} and for each vertex in
#'     \code{pattern} it gives the allowed matching vertices in
#'     \code{target}. Defaults to \code{NULL}.}
#'   \item{induced}{Logical scalar, whether to search for an induced
#'     subgraph. It is \code{FALSE} by default.}
#'   \item{time.limit}{The processor time limit for the computation, in
#'     seconds. It defaults to \code{Inf}, which means no limit.}
#' }
#'
#' @section \sQuote{vf2} method:
#' This method uses the VF2 algorithm by Cordella, Foggia et al., see
#' references below. It supports vertex and edge colors and have the
#' following extra arguments:
#' \describe{
#'   \item{vertex.color1, vertex.color2}{Optional integer vectors giving the
#'     colors of the vertices for colored graph isomorphism. If they
#'     are not given, but the graph has a \dQuote{color} vertex attribute,
#'     then it will be used. If you want to ignore these attributes, then
#'     supply \code{NULL} for both of these arguments. See also examples
#'     below.}
#'   \item{edge.color1, edge.color2}{Optional integer vectors giving the
#'     colors of the edges for edge-colored (sub)graph isomorphism. If they
#'     are not given, but the graph has a \dQuote{color} edge attribute,
#'     then it will be used. If you want to ignore these attributes, then
#'     supply \code{NULL} for both of these arguments.}
#' }
#'
#' @param pattern The smaller graph, it might be directed or
#'   undirected. Undirected graphs are treated as directed graphs with
#'   mutual edges.
#' @param target The bigger graph, it might be directed or
#'   undirected. Undirected graphs are treated as directed graphs with
#'   mutual edges.
#' @param method The method to use. Possible values: \sQuote{auto},
#'   \sQuote{lad}, \sQuote{vf2}. See their details below.
#' @param ... Additional arguments, passed to the various methods.
#' @return Logical scalar, \code{TRUE} if the \code{pattern} is
#'   isomorphic to a (possibly induced) subgraph of \code{target}.
#'
#' @aliases graph.subisomorphic.vf2 graph.subisomorphic.lad
#'
#' @references
#'  LP Cordella,  P Foggia, C Sansone, and M Vento: An improved algorithm
#'  for matching large graphs, \emph{Proc. of the 3rd IAPR TC-15 Workshop
#'  on Graphbased Representations in Pattern Recognition}, 149--159, 2001.
#'
#'  C. Solnon: AllDifferent-based Filtering for Subgraph Isomorphism,
#'  \emph{Artificial Intelligence} 174(12-13):850--864, 2010.
#'
#' @export
#' @family graph isomorphism
#' @examples
#' # A LAD example
#' pattern <- make_graph(~ 1:2:3:4:5,
#'                       1 - 2:5, 2 - 1:5:3, 3 - 2:4, 4 - 3:5, 5 - 4:2:1)
#' target <- make_graph(~ 1:2:3:4:5:6:7:8:9,
#'                     1 - 2:5:7, 2 - 1:5:3, 3 - 2:4, 4 - 3:5:6:8:9,
#'                     5 - 1:2:4:6:7, 6 - 7:5:4:9, 7 - 1:5:6,
#'                     8 - 4:9, 9 - 6:4:8)
#' domains <- list(`1` = c(1,3,9), `2` = c(5,6,7,8), `3` = c(2,4,6,7,8,9),
#'                 `4` = c(1,3,9), `5` = c(2,4,8,9))
#' subgraph_isomorphisms(pattern, target)
#' subgraph_isomorphisms(pattern, target, induced = TRUE)
#' subgraph_isomorphisms(pattern, target, domains = domains)
#'
#' # Directed LAD example
#' pattern <- make_graph(~ 1:2:3, 1 -+ 2:3)
#' dring <- make_ring(10, directed = TRUE)
#' subgraph_isomorphic(pattern, dring)

subgraph_isomorphic <- function(pattern, target,
                                method = c("auto", "lad", "vf2"), ...) {

  method <- igraph.match.arg(method)

  if (method == "auto") method <- "lad"

  if (method == "lad") {
    graph.subisomorphic.lad(pattern, target, map = FALSE, all.maps = FALSE,
                            ...)$iso

  } else if (method == "vf2") {
    graph.subisomorphic.vf2(target, pattern, ...)$iso

  }
}


#' @export
#' @rdname subgraph_isomorphic

is_subgraph_isomorphic_to <- subgraph_isomorphic


#' Count the number of isomorphic mappings between two graphs
#'
#' @param graph1 The first graph.
#' @param graph2 The second graph.
#' @param method Currently only \sQuote{vf2} is supported, see
#'   \code{\link{isomorphic}} for details about it and extra arguments.
#' @param ... Passed to the individual methods.
#' @return Number of isomorphic mappings between the two graphs.
#'
#' @include auto.R
#' @aliases graph.count.isomorphisms.vf2
#'
#' @references
#'  LP Cordella,  P Foggia, C Sansone, and M Vento: An improved algorithm
#'  for matching large graphs, \emph{Proc. of the 3rd IAPR TC-15 Workshop
#'  on Graphbased Representations in Pattern Recognition}, 149--159, 2001.
#'
#' @export
#' @family graph isomorphism
#' @examples
#' # colored graph isomorphism
#' g1 <- make_ring(10)
#' g2 <- make_ring(10)
#' isomorphic(g1, g2)
#'
#' V(g1)$color <- rep(1:2, length = vcount(g1))
#' V(g2)$color <- rep(2:1, length = vcount(g2))
#' # consider colors by default
#' count_isomorphisms(g1, g2)
#' # ignore colors
#' count_isomorphisms(g1, g2, vertex.color1 = NULL,
#'     vertex.color2 = NULL)

count_isomorphisms <- function(graph1, graph2, method = "vf2", ...) {

  method <- igraph.match.arg(method)

  if (method == "vf2") {
    graph.count.isomorphisms.vf2(graph1, graph2, ...)
  }

}


#' Count the isomorphic mappings between a graph and the subgraphs of
#' another graph
#'
#' @section \sQuote{lad} method:
#' This is the LAD algorithm by Solnon, see the reference below. It has
#' the following extra arguments:
#' \describe{
#'   \item{domains}{If not \code{NULL}, then it specifies matching
#'     restrictions. It must be a list of \code{target} vertex sets, given
#'     as numeric vertex ids or symbolic vertex names. The length of the
#'     list must be \code{vcount(pattern)} and for each vertex in
#'     \code{pattern} it gives the allowed matching vertices in
#'     \code{target}. Defaults to \code{NULL}.}
#'   \item{induced}{Logical scalar, whether to search for an induced
#'     subgraph. It is \code{FALSE} by default.}
#'   \item{time.limit}{The processor time limit for the computation, in
#'     seconds. It defaults to \code{Inf}, which means no limit.}
#' }
#'
#' @section \sQuote{vf2} method:
#' This method uses the VF2 algorithm by Cordella, Foggia et al., see
#' references below. It supports vertex and edge colors and have the
#' following extra arguments:
#' \describe{
#'   \item{vertex.color1, vertex.color2}{Optional integer vectors giving the
#'     colors of the vertices for colored graph isomorphism. If they
#'     are not given, but the graph has a \dQuote{color} vertex attribute,
#'     then it will be used. If you want to ignore these attributes, then
#'     supply \code{NULL} for both of these arguments. See also examples
#'     below.}
#'   \item{edge.color1, edge.color2}{Optional integer vectors giving the
#'     colors of the edges for edge-colored (sub)graph isomorphism. If they
#'     are not given, but the graph has a \dQuote{color} edge attribute,
#'     then it will be used. If you want to ignore these attributes, then
#'     supply \code{NULL} for both of these arguments.}
#' }
#'
#' @param pattern The smaller graph, it might be directed or
#'   undirected. Undirected graphs are treated as directed graphs with
#'   mutual edges.
#' @param target The bigger graph, it might be directed or
#'   undirected. Undirected graphs are treated as directed graphs with
#'   mutual edges.
#' @param method The method to use. Possible values:
#'   \sQuote{lad}, \sQuote{vf2}. See their details below.
#' @param ... Additional arguments, passed to the various methods.
#' @return Logical scalar, \code{TRUE} if the \code{pattern} is
#'   isomorphic to a (possibly induced) subgraph of \code{target}.
#'
#' @aliases graph.count.subisomorphisms.vf2
#'
#' @references
#'  LP Cordella,  P Foggia, C Sansone, and M Vento: An improved algorithm
#'  for matching large graphs, \emph{Proc. of the 3rd IAPR TC-15 Workshop
#'  on Graphbased Representations in Pattern Recognition}, 149--159, 2001.
#'
#'  C. Solnon: AllDifferent-based Filtering for Subgraph Isomorphism,
#'  \emph{Artificial Intelligence} 174(12-13):850--864, 2010.
#'
#' @export
#' @family graph isomorphism

count_subgraph_isomorphisms <- function(pattern, target,
                                        method = c("lad", "vf2"), ...) {

  method <- igraph.match.arg(method)

  if (method == "lad") {
    length(graph.subisomorphic.lad(pattern, target, all.maps = TRUE, ...)$maps)

  } else if (method == "vf2") {
    graph.count.subisomorphisms.vf2(target, pattern, ...)
  }

}


#' Calculate all isomorphic mappings between the vertices of two graphs
#'
#' @param graph1 The first graph.
#' @param graph2 The second graph.
#' @param method Currently only \sQuote{vf2} is supported, see
#'   \code{\link{isomorphic}} for details about it and extra arguments.
#' @param ... Extra arguments, passed to the various methods.
#' @return A list of vertex sequences, corresponding to all
#'   mappings from the first graph to the second.
#'
#' @aliases graph.get.isomorphisms.vf2
#'
#' @export
#' @family graph isomorphism

isomorphisms <- function(graph1, graph2, method = "vf2", ...) {

  method <- igraph.match.arg(method)

  if (method == "vf2") {
    graph.get.isomorphisms.vf2(graph1, graph2, ...)
  }

}


#' All isomorphic mappings between a graph and subgraphs of another graph
#'
#' @section \sQuote{lad} method:
#' This is the LAD algorithm by Solnon, see the reference below. It has
#' the following extra arguments:
#' \describe{
#'   \item{domains}{If not \code{NULL}, then it specifies matching
#'     restrictions. It must be a list of \code{target} vertex sets, given
#'     as numeric vertex ids or symbolic vertex names. The length of the
#'     list must be \code{vcount(pattern)} and for each vertex in
#'     \code{pattern} it gives the allowed matching vertices in
#'     \code{target}. Defaults to \code{NULL}.}
#'   \item{induced}{Logical scalar, whether to search for an induced
#'     subgraph. It is \code{FALSE} by default.}
#'   \item{time.limit}{The processor time limit for the computation, in
#'     seconds. It defaults to \code{Inf}, which means no limit.}
#' }
#'
#' @section \sQuote{vf2} method:
#' This method uses the VF2 algorithm by Cordella, Foggia et al., see
#' references below. It supports vertex and edge colors and have the
#' following extra arguments:
#' \describe{
#'   \item{vertex.color1, vertex.color2}{Optional integer vectors giving the
#'     colors of the vertices for colored graph isomorphism. If they
#'     are not given, but the graph has a \dQuote{color} vertex attribute,
#'     then it will be used. If you want to ignore these attributes, then
#'     supply \code{NULL} for both of these arguments. See also examples
#'     below.}
#'   \item{edge.color1, edge.color2}{Optional integer vectors giving the
#'     colors of the edges for edge-colored (sub)graph isomorphism. If they
#'     are not given, but the graph has a \dQuote{color} edge attribute,
#'     then it will be used. If you want to ignore these attributes, then
#'     supply \code{NULL} for both of these arguments.}
#' }
#'
#' @param pattern The smaller graph, it might be directed or
#'   undirected. Undirected graphs are treated as directed graphs with
#'   mutual edges.
#' @param target The bigger graph, it might be directed or
#'   undirected. Undirected graphs are treated as directed graphs with
#'   mutual edges.
#' @param method The method to use. Possible values: \sQuote{auto},
#'   \sQuote{lad}, \sQuote{vf2}. See their details below.
#' @param ... Additional arguments, passed to the various methods.
#' @return A list of vertex sequences, corresponding to all
#'   mappings from the first graph to the second.
#'
#' @aliases graph.get.subisomorphisms.vf2
#'
#' @export
#' @family graph isomorphism

subgraph_isomorphisms <- function(pattern, target,
                                  method = c("lad", "vf2"), ...) {

  method <- igraph.match.arg(method)

  if (method == "lad") {
    graph.subisomorphic.lad(pattern, target, all.maps = TRUE, ...)$maps

  } else if (method == "vf2") {
    graph.get.subisomorphisms.vf2(target, pattern, ...)
  }

}


#' Isomorphism class of a graph
#'
#' The isomorphism class is a non-negative integer number.
#' Graphs (with the same number of vertices) having the same isomorphism
#' class are isomorphic and isomorphic graphs always have the same
#' isomorphism class. Currently it can handle only graphs with 3 or 4
#' vertices.
#'
#' @param graph The input graph.
#' @param v Optionally a vertex sequence. If not missing, then an induced
#'   subgraph of the input graph, consisting of this vertices, is used.
#' @return An integer number.
#'
#' @aliases graph.isoclass graph.isoclass.subgraph
#'
#' @export
#' @family graph isomorphism
#' @examples
#' # create some non-isomorphic graphs
#' g1 <- graph_from_isomorphism_class(3, 10)
#' g2 <- graph_from_isomorphism_class(3, 11)
#' isomorphism_class(g1)
#' isomorphism_class(g2)
#' isomorphic(g1, g2)

isomorphism_class <- function(graph, v) {

  if (missing(v)) {
    graph.isoclass(graph)

  } else {
    graph.isoclass.subgraph(graph, v)
  }

}


#' Create a graph from an isomorphism class
#'
#' The isomorphism class is a non-negative integer number.
#' Graphs (with the same number of vertices) having the same isomorphism
#' class are isomorphic and isomorphic graphs always have the same
#' isomorphism class. Currently it can handle only graphs with 3 or 4
#' vertices.
#'
#' @param size The number of vertices in the graph.
#' @param number The isomorphism class.
#' @param directed Whether to create a directed graph (the default).
#' @return An igraph object, the graph of the given size, directedness
#'   and isomorphism class.
#'
#' @aliases graph.isocreate
#' @include auto.R
#'
#' @family graph isomorphism

graph_from_isomorphism_class <- graph_from_isomorphism_class


#' Canonical permutation of a graph
#' 
#' The canonical permutation brings every isomorphic graphs into the same
#' (labeled) graph.
#' 
#' \code{canonical_permutation} computes a permutation which brings the graph
#' into canonical form, as defined by the BLISS algorithm.  All isomorphic
#' graphs have the same canonical form.
#' 
#' See the paper below for the details about BLISS. This and more information
#' is available at \url{http://www.tcs.hut.fi/Software/bliss/index.html}.
#' 
#' The possible values for the \code{sh} argument are: \describe{
#' \item{"f"}{First non-singleton cell.} \item{"fl"}{First largest
#' non-singleton cell.} \item{"fs"}{First smallest non-singleton cell.}
#' \item{"fm"}{First maximally non-trivially connectec non-singleton
#' cell.} \item{"flm"}{Largest maximally non-trivially connected
#' non-singleton cell.} \item{"fsm"}{Smallest maximally non-trivially
#' connected non-singleton cell.} } See the paper in references for details
#' about these.
#' 
#' @aliases canonical.permutation canonical_permutation
#' @param graph The input graph, treated as undirected.
#' @param sh Type of the heuristics to use for the BLISS algorithm. See details
#' for possible values.
#' @return A list with the following members: \item{labeling}{The canonical
#' permutation which takes the input graph into canonical form. A numeric
#' vector, the first element is the new label of vertex 0, the second element
#' for vertex 1, etc. } \item{info}{Some information about the BLISS
#' computation. A named list with the following members: \describe{
#' \item{"nof_nodes"}{The number of nodes in the search tree.}
#' \item{"nof_leaf_nodes"}{The number of leaf nodes in the search tree.}
#' \item{"nof_bad_nodes"}{Number of bad nodes.}
#' \item{"nof_canupdates"}{Number of canrep updates.}
#' \item{"max_level"}{Maximum level.} \item{"group_size"}{The size
#' of the automorphism group of the input graph, as a string. This number is
#' exact if igraph was compiled with the GMP library, and approximate
#' otherwise.} } }
#' @author Tommi Junttila for BLISS, Gabor Csardi
#' \email{csardi.gabor@@gmail.com} for the igraph and R interfaces.
#' @seealso \code{\link{permute}} to apply a permutation to a graph,
#' \code{\link{graph.isomorphic}} for deciding graph isomorphism, possibly
#' based on canonical labels.
#' @references Tommi Junttila and Petteri Kaski: Engineering an Efficient
#' Canonical Labeling Tool for Large and Sparse Graphs, \emph{Proceedings of
#' the Ninth Workshop on Algorithm Engineering and Experiments and the Fourth
#' Workshop on Analytic Algorithms and Combinatorics.} 2007.
#' @keywords graphs
#' @examples
#' 
#' ## Calculate the canonical form of a random graph
#' g1 <- sample_gnm(10, 20)
#' cp1 <- canonical_permutation(g1)
#' cf1 <- permute(g1, cp1$labeling)
#' 
#' ## Do the same with a random permutation of it
#' g2 <- permute(g1, sample(vcount(g1)))
#' cp2 <- canonical_permutation(g2)
#' cf2 <- permute(g2, cp2$labeling)
#' 
#' ## Check that they are the same
#' el1 <- as_edgelist(cf1)
#' el2 <- as_edgelist(cf2)
#' el1 <- el1[ order(el1[,1], el1[,2]), ]
#' el2 <- el2[ order(el2[,1], el2[,2]), ]
#' all(el1 == el2)
#' @export

canonical_permutation <- canonical_permutation


#' Permute the vertices of a graph
#' 
#' Create a new graph, by permuting vertex ids.
#' 
#' This function creates a new graph from the input graph by permuting its
#' vertices according to the specified mapping. Call this function with the
#' output of \code{\link{canonical_permutation}} to create the canonical form
#' of a graph.
#' 
#' \code{permute} keeps all graph, vertex and edge attributes of the graph.
#' 
#' @aliases permute.vertices permute
#' @param graph The input graph, it can directed or undirected.
#' @param permutation A numeric vector giving the permutation to apply. The
#' first element is the new id of vertex 1, etc. Every number between one and
#' \code{vcount(graph)} must appear exactly once.
#' @return A new graph object.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @seealso \code{\link{canonical_permutation}}
#' @keywords graphs
#' @examples
#' 
#' # Random permutation of a random graph
#' g <- sample_gnm(20, 50)
#' g2 <- permute(g, sample(vcount(g)))
#' graph.isomorphic(g, g2)
#' 
#' # Permutation keeps all attributes
#' g$name <- "Random graph, Gnm, 20, 50"
#' V(g)$name <- letters[1:vcount(g)]
#' E(g)$weight <- sample(1:5, ecount(g), replace=TRUE)
#' g2 <- permute(g, sample(vcount(g)))
#' graph.isomorphic(g, g2)
#' g2$name
#' V(g2)$name
#' E(g2)$weight
#' all(sort(E(g2)$weight) == sort(E(g)$weight))
#' @export

permute <- permute


#' Number of automorphisms
#' 
#' Calculate the number of automorphisms of a graph, i.e. the number of
#' isomorphisms to itself.
#' 
#' An automorphism of a graph is a permutation of its vertices which brings the
#' graph into itself.
#' 
#' This function calculates the number of automorphism of a graph using the
#' BLISS algorithm. See also the BLISS homepage at
#' \url{http://www.tcs.hut.fi/Software/bliss/index.html}.
#' 
#' @aliases graph.automorphisms automorphisms
#' @param graph The input graph, it is treated as undirected.
#' @param sh The splitting heuristics for the BLISS algorithm. Possible values
#' are: \sQuote{\code{f}}: first non-singleton cell, \sQuote{\code{fl}}: first
#' largest non-singleton cell, \sQuote{\code{fs}}: first smallest non-singleton
#' cell, \sQuote{\code{fm}}: first maximally non-trivially connected
#' non-singleton cell, \sQuote{\code{flm}}: first largest maximally
#' non-trivially connected non-singleton cell, \sQuote{\code{fsm}}: first
#' smallest maximally non-trivially connected non-singleton cell.
#' @return A named list with the following members: \item{group_size}{The size
#' of the automorphism group of the input graph, as a string. This number is
#' exact if igraph was compiled with the GMP library, and approximate
#' otherwise.} \item{nof_nodes}{The number of nodes in the search tree.}
#' \item{nof_leaf_nodes}{The number of leaf nodes in the search tree.}
#' \item{nof_bad_nodes}{Number of bad nodes.} \item{nof_canupdates}{Number of
#' canrep updates.} \item{max_level}{Maximum level.}
#' @author Tommi Junttila (\url{http://users.ics.aalto.fi/tjunttil/}) for BLISS
#' and Gabor Csardi \email{csardi.gabor@@gmail.com} for the igraph glue code
#' and this manual page.
#' @seealso \code{\link{canonical_permutation}}, \code{\link{permute}}
#' @references Tommi Junttila and Petteri Kaski: Engineering an Efficient
#' Canonical Labeling Tool for Large and Sparse Graphs, \emph{Proceedings of
#' the Ninth Workshop on Algorithm Engineering and Experiments and the Fourth
#' Workshop on Analytic Algorithms and Combinatorics.} 2007.
#' @keywords graphs
#' @examples
#' 
#' ## A ring has n*2 automorphisms, you can "turn" it by 0-9 vertices
#' ## and each of these graphs can be "flipped"
#' g <- make_ring(10)
#' automorphisms(g)
#' @export

automorphisms <- automorphisms
