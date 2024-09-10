#' Decide whether a graph is a tree.
#'
#' `is_tree()` decides whether a graph is a tree, and optionally returns a
#' possible root vertex if the graph is a tree.
#'
#' An undirected graph is a tree if it is connected and has no cycles.
#' In the directed case, a possible additional requirement is that all edges
#' are oriented away from a root (out-tree or arborescence) or all edges are
#' oriented towards a root (in-tree or anti-arborescence). This test can be
#' controlled using the mode parameter.
#'
#' By convention, the null graph (i.e. the graph with no vertices) is considered
#' not to be a tree.
#'
#' @param graph An igraph graph object
#' @param mode Whether to consider edge directions in a directed graph.
#'   \sQuote{all} ignores edge directions; \sQuote{out} requires edges to be
#'   oriented outwards from the root, \sQuote{in} requires edges to be oriented
#'   towards the root.
#' @param details Whether to return only whether the graph is a tree (`FALSE`)
#'   or also a possible root (`TRUE`)
#' @return When `details` is `FALSE`, a logical value that indicates
#'   whether the graph is a tree. When `details` is `TRUE`, a named
#'   list with two entries:
#'   \item{res}{Logical value that indicates whether the
#'   graph is a tree.}
#'   \item{root}{The root vertex of the tree; undefined if
#'   the graph is not a tree.}
#'
#' @keywords graphs
#' @examples
#'
#' g <- make_tree(7, 2)
#' is_tree(g)
#' is_tree(g, details = TRUE)
#'
#' @family trees
#' @export
#' @cdocs igraph_is_tree
is_tree <- function(graph, mode = c("out", "in", "all", "total"), details = FALSE) {
  out <- is_tree_impl(graph, mode, details)
  if (isTRUE(details) && !out$res && vcount(graph) > 0) {
    out$root <- V(graph)[1]
  }
  out
}

#' Decide whether a graph is a forest.
#'
#' `is_forest()` decides whether a graph is a forest, and optionally returns a
#' set of possible root vertices for its components.
#'
#' An undirected graph is a forest if it has no cycles. In the directed case,
#' a possible additional requirement is that edges in each tree are oriented
#' away from the root (out-trees or arborescences) or all edges are oriented
#' towards the root (in-trees or anti-arborescences). This test can be
#' controlled using the mode parameter.
#'
#' By convention, the null graph (i.e. the graph with no vertices) is considered
#' to be a forest.
#'
#' @param graph An igraph graph object
#' @param mode Whether to consider edge directions in a directed graph.
#'   \sQuote{all} ignores edge directions; \sQuote{out} requires edges to be
#'   oriented outwards from the root, \sQuote{in} requires edges to be oriented
#'   towards the root.
#' @param details Whether to return only whether the graph is a tree (`FALSE`)
#'   or also a possible root (`TRUE`)
#' @return When `details` is `FALSE`, a logical value that indicates
#'   whether the graph is a tree. When `details` is `TRUE`, a named
#'   list with two entries: \item{res}{Logical value that indicates whether the
#'   graph is a tree.} \item{root}{The root vertex of the tree; undefined if
#'   the graph is not a tree.}
#'
#' @keywords graphs
#' @examples
#'
#' g <- make_tree(3) + make_tree(5,3)
#' is_forest(g)
#' is_forest(g, details = TRUE)
#'
#' @family trees
#' @export
#' @cdocs igraph_is_forest
is_forest <- is_forest_impl

#' Convert a tree graph to its Prüfer sequence
#'
#' `to_prufer()` converts a tree graph into its Prüfer sequence.
#'
#' The Prüfer sequence of a tree graph with n labeled vertices is a sequence of
#' n-2 numbers, constructed as follows. If the graph has more than two vertices,
#' find a vertex with degree one, remove it from the tree and add the label of
#' the vertex that it was connected to to the sequence. Repeat until there are
#' only two vertices in the remaining graph.
#'
#' @param graph The graph to convert to a Prüfer sequence
#' @return The Prüfer sequence of the graph, represented as a numeric vector of
#'   vertex IDs in the sequence.
#'
#' @seealso [make_from_prufer()] to construct a graph from its
#' Prüfer sequence
#' @keywords graphs
#' @examples
#'
#' g <- make_tree(13, 3)
#' to_prufer(g)
#'
#' @family trees
#' @export
#' @cdocs igraph_to_prufer
to_prufer <- to_prufer_impl

#' Samples from the spanning trees of a graph randomly and uniformly
#'
#' `sample_spanning_tree()` picks a spanning tree of an undirected graph
#' randomly and uniformly, using loop-erased random walks.
#'
#' @param graph The input graph to sample from. Edge directions are ignored if
#'   the graph is directed.
#' @param vid When the graph is disconnected, this argument specifies how to
#'   handle the situation. When the argument is zero (the default), the sampling
#'   will be performed component-wise, and the result will be a spanning forest.
#'   When the argument contains a vertex ID, only the component containing the
#'   given vertex will be processed, and the result will be a spanning tree of the
#'   component of the graph.
#' @return An edge sequence containing the edges of the spanning tree. Use
#'   [subgraph.edges()] to extract the corresponding subgraph.
#'
#' @keywords graph
#' @seealso [subgraph.edges()] to extract the tree itself
#' @examples
#'
#' g <- make_full_graph(10) %du% make_full_graph(5)
#' edges <- sample_spanning_tree(g)
#' forest <- subgraph.edges(g, edges)
#'
#' @family trees
#' @export
#' @cdocs igraph_random_spanning_tree
sample_spanning_tree <- random_spanning_tree_impl
