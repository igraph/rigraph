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

#' Minimum cut in a graph
#' 
#' \code{min_cut} calculates the minimum st-cut between two vertices in a graph
#' (if the \code{source} and \code{target} arguments are given) or the minimum
#' cut of the graph (if both \code{source} and \code{target} are \code{NULL}).
#' 
#' The minimum st-cut between \code{source} and \code{target} is the minimum
#' total weight of edges needed to remove to eliminate all paths from
#' \code{source} to \code{target}.
#' 
#' The minimum cut of a graph is the minimum total weight of the edges needed
#' to remove to separate the graph into (at least) two components. (Which is to
#' make the graph \emph{not} strongly connected in the directed case.)
#' 
#' The maximum flow between two vertices in a graph is the same as the minimum
#' st-cut, so \code{max_flow} and \code{min_cut} essentially calculate the same
#' quantity, the only difference is that \code{min_cut} can be invoked without
#' giving the \code{source} and \code{target} arguments and then minimum of all
#' possible minimum cuts is calculated.
#' 
#' For undirected graphs the Stoer-Wagner algorithm (see reference below) is
#' used to calculate the minimum cut.
#' 
#' @aliases graph.mincut
#' @param graph The input graph.
#' @param source The id of the source vertex.
#' @param target The id of the target vertex (sometimes also called sink).
#' @param capacity Vector giving the capacity of the edges. If this is
#' \code{NULL} (the default) then the \code{capacity} edge attribute is used.
#' @param value.only Logical scalar, if \code{TRUE} only the minimum cut value
#' is returned, if \code{FALSE} the edges in the cut and a the two (or more)
#' partitions are also returned.
#' @return For \code{min_cut} a nuieric constant, the value of the minimum
#' cut, except if \code{value.only = FALSE}. In this case a named list with
#' components:
#'   \item{value}{Numeric scalar, the cut value.}
#'   \item{cut}{Numeric vector, the edges in the cut.}
#'   \item{partition1}{The vertices in the first partition after the cut
#'     edges are removed. Note that these vertices might be actually in
#'     different components (after the cut edges are removed), as the graph
#'     may fall apart into more than two components.}
#'   \item{partition2}{The vertices in the second partition
#'     after the cut edges are removed. Note that these vertices might be
#'     actually in different components (after the cut edges are removed), as
#'     the graph may fall apart into more than two components.}
#' @seealso \code{\link{max_flow}} for the related maximum flow
#'   problem, \code{\link{distances}}, \code{\link{edge_connectivity}},
#'   \code{\link{vertex_connectivity}}
#' @references M. Stoer and F. Wagner: A simple min-cut algorithm,
#' \emph{Journal of the ACM}, 44 585-591, 1997.
#' @examples
#' g <- make_ring(100)
#' min_cut(g, capacity=rep(1,vcount(g)))
#' min_cut(g, value.only=FALSE, capacity=rep(1,vcount(g)))
#' 
#' g2 <- graph( c(1,2,2,3,3,4, 1,6,6,5,5,4, 4,1) )
#' E(g2)$capacity <- c(3,1,2, 10,1,3, 2)
#' min_cut(g2, value.only=FALSE)
#' @export
#' @include auto.R

min_cut <- function(graph, source=NULL, target=NULL, capacity=NULL,
                         value.only=TRUE) {

  if (!is_igraph(graph)) {
    stop("Not a graph object")
  }
  if (is.null(capacity)) {
    if ("capacity" %in% edge_attr_names(graph)) {
      capacity <- E(graph)$capacity
    }
  }
  if (is.null(source) && !is.null(target) ||
      is.null(target) && !is.null(source)) {
    stop("Please give both source and target or neither")
  }
  if (!is.null(capacity)) {
    capacity <- as.numeric(capacity)
  }

  value.only <- as.logical(value.only)
  on.exit( .Call(C_R_igraph_finalizer) )
  if (is.null(target) && is.null(source)) {
    if (value.only) {
      res <- .Call(C_R_igraph_mincut_value, graph, capacity)
    } else {
      res <- .Call(C_R_igraph_mincut, graph, capacity)
      res$cut <- res$cut + 1
      res$partition1 <- res$partition1 + 1
      res$partition2 <- res$partition2 + 1

      if (igraph_opt("return.vs.es")) {
        res$cut <- create_es(graph, res$cut)
        res$partition1 <- create_vs(graph, res$partition1)
        res$partition2 <- create_vs(graph, res$partition2)
      }

      res
    }
  } else {
    if (value.only) {
      res <- .Call(C_R_igraph_st_mincut_value, graph,
                   as.igraph.vs(graph, source)-1,
                   as.igraph.vs(graph, target)-1, capacity)
    } else {
      stop("Calculating minimum s-t cuts is not implemented yet")
    }
  }
  res
}



#' Vertex connectivity.
#' 
#' The vertex connectivity of a graph or two vertices, this is recently also
#' called group cohesion.
#' 
#' The vertex connectivity of two vertices (\code{source} and \code{target}) in
#' a directed graph is the minimum number of vertices needed to remove from the
#' graph to eliminate all (directed) paths from \code{source} to \code{target}.
#' \code{vertex_connectivity} calculates this quantity if both the
#' \code{source} and \code{target} arguments are given and they're not
#' \code{NULL}.
#' 
#' The vertex connectivity of a graph is the minimum vertex connectivity of all
#' (ordered) pairs of vertices in the graph. In other words this is the minimum
#' number of vertices needed to remove to make the graph not strongly
#' connected. (If the graph is not strongly connected then this is zero.)
#' \code{vertex_connectivity} calculates this quantity if neither the
#' \code{source} nor \code{target} arguments are given. (Ie. they are both
#' \code{NULL}.)
#' 
#' A set of vertex disjoint directed paths from \code{source} to \code{vertex}
#' is a set of directed paths between them whose vertices do not contain common
#' vertices (apart from \code{source} and \code{target}). The maximum number of
#' vertex disjoint paths between two vertices is the same as their vertex
#' connectivity in most cases (if the two vertices are not connected by an
#' edge).
#' 
#' The cohesion of a graph (as defined by White and Harary, see references), is
#' the vertex connectivity of the graph. This is calculated by
#' \code{cohesion}.
#' 
#' These three functions essentially calculate the same measure(s), more
#' precisely \code{vertex_connectivity} is the most general, the other two are
#' included only for the ease of using more descriptive function names.
#' 
#' @aliases vertex.connectivity vertex.disjoint.paths cohesion vertex_connectivity
#'   vertex_disjoint_paths graph.cohesion
#' @param graph,x The input graph.
#' @param source The id of the source vertex, for \code{vertex_connectivity} it
#' can be \code{NULL}, see details below.
#' @param target The id of the target vertex, for \code{vertex_connectivity} it
#' can be \code{NULL}, see details below.
#' @param checks Logical constant. Whether to check that the graph is connected
#' and also the degree of the vertices. If the graph is not (strongly)
#' connected then the connectivity is obviously zero. Otherwise if the minimum
#' degree is one then the vertex connectivity is also one. It is a good idea to
#' perform these checks, as they can be done quickly compared to the
#' connectivity calculation itself.  They were suggested by Peter McMahan,
#' thanks Peter.
#' @param ... Ignored.
#' @return A scalar real value.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @seealso \code{\link{max_flow}}, \code{\link{edge_connectivity}},
#' \code{\link{edge_disjoint_paths}}, \code{\link{adhesion}}
#' @references White, Douglas R and Frank Harary 2001. The Cohesiveness of
#' Blocks In Social Networks: Node Connectivity and Conditional Density.
#' \emph{Sociological Methodology} 31 (1) : 305-359.
#' @export
#' @keywords graphs
#' @examples
#' 
#' g <- barabasi.game(100, m=1)
#' g <- delete_edges(g, E(g)[ 100 %--% 1 ])
#' g2 <- barabasi.game(100, m=5)
#' g2 <- delete_edges(g2, E(g2)[ 100 %--% 1])
#' vertex_connectivity(g, 100, 1)
#' vertex_connectivity(g2, 100, 1)
#' vertex_disjoint_paths(g2, 100, 1)
#' 
#' g <- sample_gnp(50, 5/50)
#' g <- as.directed(g)
#' g <- induced_subgraph(g, subcomponent(g, 1))
#' cohesion(g)
#' 
vertex_connectivity <- function(graph, source=NULL, target=NULL, checks=TRUE) {

  if (!is_igraph(graph)) {
    stop("Not a graph object")
  }

  if (is.null(source) && is.null(target)) {
    on.exit( .Call(C_R_igraph_finalizer) )
    .Call(C_R_igraph_vertex_connectivity, graph, as.logical(checks))
  } else if (!is.null(source) && !is.null(target)) {
    on.exit( .Call(C_R_igraph_finalizer) )
    .Call(C_R_igraph_st_vertex_connectivity, graph, as.igraph.vs(graph, source)-1,
          as.igraph.vs(graph, target)-1)
  } else {
    stop("either give both source and target or neither")
  }
}



#' Edge connectivity.
#' 
#' The edge connectivity of a graph or two vertices, this is recently also
#' called group adhesion.
#' 
#' The edge connectivity of a pair of vertices (\code{source} and
#' \code{target}) is the minimum number of edges needed to remove to eliminate
#' all (directed) paths from \code{source} to \code{target}.
#' \code{edge_connectivity} calculates this quantity if both the \code{source}
#' and \code{target} arguments are given (and not \code{NULL}).
#' 
#' The edge connectivity of a graph is the minimum of the edge connectivity of
#' every (ordered) pair of vertices in the graph.  \code{edge_connectivity}
#' calculates this quantity if neither the \code{source} nor the \code{target}
#' arguments are given (ie. they are both \code{NULL}).
#' 
#' A set of edge disjoint paths between two vertices is a set of paths between
#' them containing no common edges. The maximum number of edge disjoint paths
#' between two vertices is the same as their edge connectivity.
#' 
#' The adhesion of a graph is the minimum number of edges needed to remove to
#' obtain a graph which is not strongly connected. This is the same as the edge
#' connectivity of the graph.
#' 
#' The three functions documented on this page calculate similar properties,
#' more precisely the most general is \code{edge_connectivity}, the others are
#' included only for having more descriptive function names.
#' 
#' @aliases edge.connectivity edge_disjoint_paths graph.adhesion adhesion
#'   edge_connectivity edge.disjoint.paths
#' @param graph The input graph.
#' @param source The id of the source vertex, for \code{edge_connectivity} it
#' can be \code{NULL}, see details below.
#' @param target The id of the target vertex, for \code{edge_connectivity} it
#' can be \code{NULL}, see details below.
#' @param checks Logical constant. Whether to check that the graph is connected
#' and also the degree of the vertices. If the graph is not (strongly)
#' connected then the connectivity is obviously zero. Otherwise if the minimum
#' degree is one then the edge connectivity is also one. It is a good idea to
#' perform these checks, as they can be done quickly compared to the
#' connectivity calculation itself.  They were suggested by Peter McMahan,
#' thanks Peter.
#' @return A scalar real value.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @seealso \code{\link{max_flow}}, \code{\link{vertex_connectivity}},
#' \code{\link{vertex_disjoint_paths}}, \code{\link{cohesion}}
#' @references Douglas R. White and Frank Harary: The cohesiveness of blocks in
#' social networks: node connectivity and conditional density, TODO: citation
#' @export
#' @keywords graphs
#' @examples
#' 
#' g <- barabasi.game(100, m=1)
#' g2 <- barabasi.game(100, m=5)
#' edge_connectivity(g, 100, 1)
#' edge_connectivity(g2, 100, 1)
#' edge_disjoint_paths(g2, 100, 1)
#' 
#' g <- sample_gnp(50, 5/50)
#' g <- as.directed(g)
#' g <- induced_subgraph(g, subcomponent(g, 1))
#' adhesion(g)
#' 
edge_connectivity <- function(graph, source=NULL, target=NULL, checks=TRUE) {

  if (!is_igraph(graph)) {
    stop("Not a graph object")
  }

  if (is.null(source) && is.null(target)) {    
    on.exit( .Call(C_R_igraph_finalizer) )
    .Call(C_R_igraph_edge_connectivity, graph, as.logical(checks))
  } else if (!is.null(source) && !is.null(target)) {
    on.exit( .Call(C_R_igraph_finalizer) )
    .Call(C_R_igraph_st_edge_connectivity, graph,
          as.igraph.vs(graph, source)-1, as.igraph.vs(graph, target)-1)
  } else {
    stop("either give both source and target or neither")
  }
}

#' @export

edge_disjoint_paths <- function(graph, source, target) {

  if (!is_igraph(graph)) {
    stop("Not a graph object")
  }

  on.exit( .Call(C_R_igraph_finalizer) )
  .Call(C_R_igraph_edge_disjoint_paths, graph,
        as.igraph.vs(graph, source)-1, as.igraph.vs(graph, target)-1)
}

#' @export

vertex_disjoint_paths <- function(graph, source=NULL, target=NULL) {

  if (!is_igraph(graph)) {
    stop("Not a graph object")
  }

  on.exit( .Call(C_R_igraph_finalizer) )
  .Call(C_R_igraph_vertex_disjoint_paths, graph, as.igraph.vs(graph, source)-1,
        as.igraph.vs(graph, target)-1)
}

#' @export

adhesion <- function(graph, checks=TRUE) {

  if (!is_igraph(graph)) {
    stop("Not a graph object")
  }
  
  on.exit( .Call(C_R_igraph_finalizer) )
  .Call(C_R_igraph_adhesion, graph, as.logical(checks))
}

#' @rdname vertex_connectivity
#' @method cohesion igraph
#' @export

cohesion.igraph <- function(x, checks=TRUE, ...) {

  if (!is_igraph(x)) {
    stop("Not a graph object")
  }

  on.exit( .Call(C_R_igraph_finalizer) )
  .Call(C_R_igraph_cohesion, x, as.logical(checks))
}

#' List all (s,t)-cuts of a graph
#' 
#' List all (s,t)-cuts in a directed graph.
#' 
#' Given a \eqn{G} directed graph and two, different and non-ajacent vertices,
#' \eqn{s} and \eqn{t}, an \eqn{(s,t)}-cut is a set of edges, such that after
#' removing these edges from \eqn{G} there is no directed path from \eqn{s} to
#' \eqn{t}.
#' 
#' @aliases stCuts st_cuts
#' @param graph The input graph. It must be directed.
#' @param source The source vertex.
#' @param target The target vertex.
#' @return A list with entries: \item{cuts}{A list of numeric vectors
#' containing edge ids. Each vector is an \eqn{(s,t)}-cut.}
#' \item{partition1s}{A list of numeric vectors containing vertex ids, they
#' correspond to the edge cuts. Each vertex set is a generator of the
#' corresponding cut, i.e. in the graph \eqn{G=(V,E)}, the vertex set \eqn{X}
#' and its complementer \eqn{V-X}, generates the cut that contains exactly the
#' edges that go from \eqn{X} to \eqn{V-X}.}
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @seealso \code{\link{st_min_cuts}} to list all minimum cuts.
#' @references JS Provan and DR Shier: A Paradigm for listing (s,t)-cuts in
#' graphs, \emph{Algorithmica} 15, 351--372, 1996.
#' @keywords graphs
#' @examples
#' 
#' # A very simple graph
#' g <- graph_from_literal(a -+ b -+ c -+ d -+ e)
#' st_cuts(g, source="a", target="e")
#' 
#' # A somewhat more difficult graph
#' g2 <- graph_from_literal(s --+ a:b, a:b --+ t,
#'                    a --+ 1:2:3, 1:2:3 --+ b)
#' st_cuts(g2, source="s", target="t")
#' @export
#' @include auto.R

st_cuts <- st_cuts


#' List all minimum \eqn{(s,t)}-cuts of a graph
#' 
#' Listing all minimum \eqn{(s,t)}-cuts of a directed graph, for given \eqn{s}
#' and \eqn{t}.
#' 
#' Given a \eqn{G} directed graph and two, different and non-ajacent vertices,
#' \eqn{s} and \eqn{t}, an \eqn{(s,t)}-cut is a set of edges, such that after
#' removing these edges from \eqn{G} there is no directed path from \eqn{s} to
#' \eqn{t}.
#' 
#' The size of an \eqn{(s,t)}-cut is defined as the sum of the capacities (or
#' weights) in the cut. For unweighted (=equally weighted) graphs, this is
#' simply the number of edges.
#' 
#' An \eqn{(s,t)}-cut is minimum if it is of the smallest possible size.
#' 
#' @aliases st_min_cuts stMincuts
#' @param graph The input graph. It must be directed.
#' @param source The id of the source vertex.
#' @param target The id of the target vertex.
#' @param capacity Numeric vector giving the edge capacities. If this is
#' \code{NULL} and the graph has a \code{weight} edge attribute, then this
#' attribute defines the edge capacities. For forcing unit edge capacities,
#' even for graphs that have a \code{weight} edge attribute, supply \code{NA}
#' here.
#' @return A list with entries: \item{value}{Numeric scalar, the size of the
#' minimum cut(s).} \item{cuts}{A list of numeric vectors containing edge ids.
#' Each vector is a minimum \eqn{(s,t)}-cut.} \item{partition1s}{A list of
#' numeric vectors containing vertex ids, they correspond to the edge cuts.
#' Each vertex set is a generator of the corresponding cut, i.e. in the graph
#' \eqn{G=(V,E)}, the vertex set \eqn{X} and its complementer \eqn{V-X},
#' generates the cut that contains exactly the edges that go from \eqn{X} to
#' \eqn{V-X}.}
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @seealso \code{\link{st_cuts}}, \code{\link{min_separators}}
#' @references JS Provan and DR Shier: A Paradigm for listing (s,t)-cuts in
#' graphs, \emph{Algorithmica} 15, 351--372, 1996.
#' @keywords graphs
#' @examples
#' 
#' # A difficult graph, from the Provan-Shier paper
#' g <- graph_from_literal(s --+ a:b, a:b --+ t,
#'                a --+ 1:2:3:4:5, 1:2:3:4:5 --+ b)
#' st_min_cuts(g, source="s", target="t")
#' @export
#' @include auto.R

st_min_cuts <- st_min_cuts


#' Dominator tree
#' 
#' Dominator tree of a directed graph.
#' 
#' A flowgraph is a directed graph with a distinguished start (or root) vertex
#' \eqn{r}, such that for any vertex \eqn{v}, there is a path from \eqn{r} to
#' \eqn{v}. A vertex \eqn{v} dominates another vertex \eqn{w} (not equal to
#' \eqn{v}), if every path from \eqn{r} to \eqn{w} contains \eqn{v}. Vertex
#' \eqn{v} is the immediate dominator or \eqn{w},
#' \eqn{v=\textrm{idom}(w)}{v=idom(w)}, if \eqn{v} dominates \eqn{w} and every
#' other dominator of \eqn{w} dominates \eqn{v}. The edges
#' \eqn{{(\textrm{idom}(w), w)| w \ne r}}{{(idom(w),w)| w is not r}} form a
#' directed tree, rooted at \eqn{r}, called the dominator tree of the graph.
#' Vertex \eqn{v} dominates vertex \eqn{w} if and only if \eqn{v} is an
#' ancestor of \eqn{w} in the dominator tree.
#' 
#' This function implements the Lengauer-Tarjan algorithm to construct the
#' dominator tree of a directed graph. For details see the reference below.
#' 
#' @aliases dominator.tree dominator_tree
#' @param graph A directed graph. If it is not a flowgraph, and it contains
#' some vertices not reachable from the root vertex, then these vertices will
#' be collected and returned as part of the result.
#' @param root The id of the root (or source) vertex, this will be the root of
#' the tree.
#' @param mode Constant, must be \sQuote{\code{in}} or \sQuote{\code{out}}. If
#' it is \sQuote{\code{in}}, then all directions are considered as opposite to
#' the original one in the input graph.
#' @return A list with components: \item{dom}{ A numeric vector giving the
#' immediate dominators for each vertex. For vertices that are unreachable from
#' the root, it contains \code{NaN}. For the root vertex itself it contains
#' minus one.  } \item{domtree}{ A graph object, the dominator tree. Its vertex
#' ids are the as the vertex ids of the input graph. Isolate vertices are the
#' ones that are unreachable from the root.  } \item{leftout}{ A numeric vector
#' containing the vertex ids that are unreachable from the root.  }
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @references Thomas Lengauer, Robert Endre Tarjan: A fast algorithm for
#' finding dominators in a flowgraph, \emph{ACM Transactions on Programming
#' Languages and Systems (TOPLAS)} I/1, 121--141, 1979.
#' @keywords graphs
#' @examples
#' 
#' ## The example from the paper
#' g <- graph_from_literal(R-+A:B:C, A-+D, B-+A:D:E, C-+F:G, D-+L,
#'                E-+H, F-+I, G-+I:J, H-+E:K, I-+K, J-+I,
#'                K-+I:R, L-+H)
#' dtree <- dominator_tree(g, root="R")
#' layout <- layout_as_tree(dtree$domtree, root="R")
#' layout[,2] <- -layout[,2]
#' plot(dtree$domtree, layout=layout, vertex.label=V(dtree$domtree)$name)
#' @export

dominator_tree <- dominator_tree


#' Minimum size vertex separators
#' 
#' List all vertex sets that are minimal (s,t) separators for some s and t, in
#' an undirected graph.
#' 
#' A \eqn{(s,t)} vertex separator is a set of vertices, such that after their
#' removal from the graph, there is no path between \eqn{s} and \eqn{t} in the
#' graph.
#' 
#' A \eqn{(s,t)} vertex separator is minimal if none of its subsets is an
#' \eqn{(s,t)} vertex separator.
#' 
#' @aliases minimal.st.separators min_st_separators
#' @param graph The input graph. It may be directed, but edge directions are
#' ignored.
#' @return A list of numeric vectors. Each vector contains a vertex set
#' (defined by vertex ids), each vector is an (s,t) separator of the input
#' graph, for some \eqn{s} and \eqn{t}.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @references Anne Berry, Jean-Paul Bordat and Olivier Cogis: Generating All
#' the Minimal Separators of a Graph, In: Peter Widmayer, Gabriele Neyer and
#' Stephan Eidenbenz (editors): \emph{Graph-theoretic concepts in computer
#' science}, 1665, 167--172, 1999. Springer.
#' @keywords graphs
#' @examples
#' 
#' ring <- make_ring(4)
#' min_st_separators(ring)
#' 
#' chvatal <- make_graph("chvatal")
#' min_st_separators(chvatal)

min_st_separators <- min_st_separators


#' Maximum flow in a graph
#' 
#' In a graph where each edge has a given flow capacity the maximal flow
#' between two vertices is calculated.
#' 
#' \code{max_flow} calculates the maximum flow between two vertices in a
#' weighted (ie. valued) graph. A flow from \code{source} to \code{target} is
#' an assignment of non-negative real numbers to the edges of the graph,
#' satisfying two properties: (1) for each edge the flow (ie. the assigned
#' number) is not more than the capacity of the edge (the \code{capacity}
#' parameter or edge attribute), (2) for every vertex, except the source and
#' the target the incoming flow is the same as the outgoing flow. The value of
#' the flow is the incoming flow of the \code{target} vertex. The maximum flow
#' is the flow of maximum value.
#' 
#' @aliases graph.maxflow
#' @param graph The input graph.
#' @param source The id of the source vertex.
#' @param target The id of the target vertex (sometimes also called sink).
#' @param capacity Vector giving the capacity of the edges. If this is
#' \code{NULL} (the default) then the \code{capacity} edge attribute is used.
#' Note that the \code{weight} edge attribute is not used by this function.
#' @return A named list with components:
#'   \item{value}{A numeric scalar, the value of the maximum flow.}
#'   \item{flow}{A numeric vector, the flow itself, one entry for each
#'     edge. For undirected graphs this entry is bit trickier, since for
#'     these the flow direction is not predetermined by the edge
#'     direction. For these graphs the elements of the this vector can be
#'     negative, this means that the flow goes from the bigger vertex id to
#'     the smaller one. Positive values mean that the flow goes from 
#'     the smaller vertex id to the bigger one.}
#'   \item{cut}{A numeric vector of edge ids, the minimum cut corresponding
#'     to the maximum flow.} 
#'   \item{partition1}{A numeric vector of vertex ids, the vertices in the
#'     first partition of the minimum cut corresponding to the maximum
#'     flow.} 
#'   \item{partition2}{A numeric vector of vertex ids, the vertices in the
#'     second partition of the minimum cut corresponding to the maximum
#'     flow.}
#'   \item{stats}{A list with some statistics from the push-relabel
#'     algorithm. Five integer values currently: \code{nopush} is the
#'     number of push operations, \code{norelabel} the number of
#'     relabelings, \code{nogap} is the number of times the gap heuristics
#'     was used, \code{nogapnodes} is the total number of gap nodes omitted
#'     because of the gap heuristics and \code{nobfs} is the number of
#'     times a global breadth-first-search update was performed to assign
#'     better height (=distance) values to the vertices.}
#' @seealso \code{\link{min_cut}} for minimum cut calculations,
#'   \code{\link{distances}}, \code{\link{edge_connectivity}},
#'   \code{\link{vertex_connectivity}}
#' @references A. V. Goldberg and R. E. Tarjan: A New Approach to the Maximum
#' Flow Problem \emph{Journal of the ACM} 35:921-940, 1988.
#' @examples
#' 
#' E <- rbind( c(1,3,3), c(3,4,1), c(4,2,2), c(1,5,1), c(5,6,2), c(6,2,10))
#' colnames(E) <- c("from", "to", "capacity")
#' g1 <- graph_from_data_frame(as.data.frame(E))
#' max_flow(g1, source=V(g1)["1"], target=V(g1)["2"])
#' @export
#' @include auto.R

max_flow <- max_flow


#' Vertex separators
#' 
#' Check whether a given set of vertices is a vertex separator.
#' 
#' \code{is_separator} decides whether the supplied vertex set is a vertex
#' separator. A vertex set is a vertex separator if its removal results a
#' disconnected graph.
#' 
#' In the special case of a fully connected graph with \eqn{n} vertices, each
#' set of \eqn{n-1} vertices is considered to be a vertex separator.
#' 
#' @aliases is.separator
#' @param graph The input graph. It may be directed, but edge directions are
#'   ignored.
#' @param candidate A numeric vector giving the vertex ids of the candidate
#'   separator.
#' @return A logical scalar, whether the supplied vertex set is a (minimal)
#'   vertex separator or not.
#' @seealso \code{\link{is_min_separator}}, \code{\link{min_separators}}
#'   lists all vertex separator of minimum size.
#' @export

is_separator <- is_separator


#' Minimal vertex separators
#' 
#' Check whether a given set of vertices is a minimal vertex separator.
#' 
#' \code{is_min_separator} decides whether the supplied vertex set is a minimal
#' vertex separator. A minimal vertex separator is a vertex separator, such
#' that none of its subsets is a vertex separator.
#' 
#' In the special case of a fully connected graph with \eqn{n} vertices, each
#' set of \eqn{n-1} vertices is considered to be a vertex separator.
#' 
#' @aliases is.minimal.separator
#' @param graph The input graph. It may be directed, but edge directions are
#' ignored.
#' @param candidate A numeric vector giving the vertex ids of the candidate
#' separator.
#' @return A logical scalar, whether the supplied vertex set is a (minimal)
#' vertex separator or not.
#' @seealso \code{\link{min_separators}} lists all vertex separator of minimum
#' size.
#' @examples
#' # The graph from the Moody-White paper
#' mw <- graph_from_literal(1-2:3:4:5:6, 2-3:4:5:7, 3-4:6:7, 4-5:6:7,
#'                 5-6:7:21, 6-7, 7-8:11:14:19, 8-9:11:14, 9-10,
#'                 10-12:13, 11-12:14, 12-16, 13-16, 14-15, 15-16,
#'                 17-18:19:20, 18-20:21, 19-20:22:23, 20-21,
#'                 21-22:23, 22-23)
#' 
#' # Cohesive subgraphs
#' mw1 <- induced_subgraph(mw, as.character(c(1:7, 17:23)))
#' mw2 <- induced_subgraph(mw, as.character(7:16))
#' mw3 <- induced_subgraph(mw, as.character(17:23))
#' mw4 <- induced_subgraph(mw, as.character(c(7,8,11,14)))
#' mw5 <- induced_subgraph(mw, as.character(1:7))
#' 
#' check.sep <- function(G) {
#'   sep <- min_separators(G)
#'   sapply(sep, is_min_separator, graph=G)
#' }
#' 
#' check.sep(mw)
#' check.sep(mw1)
#' check.sep(mw2)
#' check.sep(mw3)
#' check.sep(mw4)
#' check.sep(mw5)
#'
#' @export

is_min_separator <- is_min_separator


#' Minimum size vertex separators
#' 
#' Find all vertex sets of minimal size whose removal separates the graph into
#' more components
#' 
#' This function implements the Kanevsky algorithm for finding all minimal-size
#' vertex separators in an undirected graph. See the reference below for the
#' details.
#' 
#' In the special case of a fully connected input graph with \eqn{n} vertices,
#' all subsets of size \eqn{n-1} are listed as the result.
#'
#' @aliases minimum.size.separators
#' @param graph The input graph. It may be directed, but edge directions are
#' ignored.
#' @return A list of numeric vectors. Each numeric vector is a vertex
#' separator.
#' @seealso \code{\link{is.separator}}
#' @references Arkady Kanevsky: Finding all minimum-size separating vertex sets
#' in a graph. \emph{Networks} 23 533--541, 1993.
#' 
#' JS Provan and DR Shier: A Paradigm for listing (s,t)-cuts in graphs,
#' \emph{Algorithmica} 15, 351--372, 1996.
#' 
#' J. Moody and D. R. White. Structural cohesion and embeddedness: A
#' hierarchical concept of social groups. \emph{American Sociological Review},
#' 68 103--127, Feb 2003.
#' @export
#' @examples
#' # The graph from the Moody-White paper
#' mw <- graph.formula(1-2:3:4:5:6, 2-3:4:5:7, 3-4:6:7, 4-5:6:7,
#'                     5-6:7:21, 6-7, 7-8:11:14:19, 8-9:11:14, 9-10,
#'                     10-12:13, 11-12:14, 12-16, 13-16, 14-15, 15-16,
#'                     17-18:19:20, 18-20:21, 19-20:22:23, 20-21,
#'                     21-22:23, 22-23)
#' 
#' # Cohesive subgraphs
#' mw1 <- induced.subgraph(mw, as.character(c(1:7, 17:23)))
#' mw2 <- induced.subgraph(mw, as.character(7:16))
#' mw3 <- induced.subgraph(mw, as.character(17:23))
#' mw4 <- induced.subgraph(mw, as.character(c(7,8,11,14)))
#' mw5 <- induced.subgraph(mw, as.character(1:7))
#' 
#' min_separators(mw)
#' min_separators(mw1)
#' min_separators(mw2)
#' min_separators(mw3)
#' min_separators(mw4)
#' min_separators(mw5)
#' 
#' # Another example, the science camp network
#' camp <- graph.formula(Harry:Steve:Don:Bert - Harry:Steve:Don:Bert,
#'                       Pam:Brazey:Carol:Pat - Pam:Brazey:Carol:Pat,
#'                       Holly   - Carol:Pat:Pam:Jennie:Bill,
#'                       Bill    - Pauline:Michael:Lee:Holly,
#'                       Pauline - Bill:Jennie:Ann,
#'                       Jennie  - Holly:Michael:Lee:Ann:Pauline,
#'                       Michael - Bill:Jennie:Ann:Lee:John,
#'                       Ann     - Michael:Jennie:Pauline,
#'                       Lee     - Michael:Bill:Jennie,
#'                       Gery    - Pat:Steve:Russ:John,
#'                       Russ    - Steve:Bert:Gery:John,
#'                       John    - Gery:Russ:Michael)
#' min_separators(camp)

min_separators <- min_separators
