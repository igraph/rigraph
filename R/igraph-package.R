
#' @useDynLib igraph, .registration = TRUE
#' @import methods
## usethis namespace: start
#' @importFrom lifecycle deprecated
#' @importFrom magrittr %>%
#' @importFrom rlang .data .env
#' @importFrom rlang check_dots_empty
#' @importFrom rlang check_installed
#' @importFrom rlang inject
#' @importFrom rlang warn
#' @importFrom rlang %||%
#' @importFrom rlang as_function
#' @importFrom rlang global_env
#' @importFrom rlang set_names
#' @importFrom rlang is_logical
#' @importFrom rlang is_true
## usethis namespace: end
NULL

#' Magrittr's pipes
#'
#' igraph re-exports the `%>%` operator of magrittr, because
#' we find it very useful. Please see the documentation in the
#' `magrittr` package.
#'
#' @param lhs Left hand side of the pipe.
#' @param rhs Right hand side of the pipe.
#' @return Result of applying the right hand side to the
#'   result of the left hand side.
#'
#' @export
#' @name %>%
#' @rdname pipe
#' @examples
#' make_ring(10) %>%
#'   add_edges(c(1, 6)) %>%
#'   plot()
NULL

#' The igraph package
#'
#' igraph is a library and R package for network analysis.
#'
#' @rdname aaa-igraph-package
#' @name igraph-package
#' @keywords internal
#' @aliases igraph-package igraph
#'
#' @section Introduction:
#' The main goals of the igraph library is to provide a set of data types
#' and functions for 1) pain-free implementation of graph algorithms, 2)
#' fast handling of large graphs, with millions of vertices and edges, 3)
#' allowing rapid prototyping via high level languages like R.
#'
#' @section igraph graphs:
#'   igraph graphs have a class \sQuote{`igraph`}. They are printed to
#'   the screen in a special format, here is an example, a ring graph
#'   created using [make_ring()]: \preformatted{
#'     IGRAPH U--- 10 10 -- Ring graph
#'     + attr: name (g/c), mutual (g/x), circular (g/x)  }
#'   \sQuote{`IGRAPH`} denotes that this is an igraph graph. Then
#'   come four bits that denote the kind of the graph: the first is
#'   \sQuote{`U`} for undirected and \sQuote{`D`} for directed
#'   graphs. The second is \sQuote{`N`} for named graph (i.e. if the
#'   graph has the \sQuote{`name`} vertex attribute set). The third is
#'   \sQuote{`W`} for weighted graphs (i.e. if the
#'   \sQuote{`weight`} edge attribute is set). The fourth is
#'   \sQuote{`B`} for bipartite graphs (i.e. if the
#'   \sQuote{`type`} vertex attribute is set).
#'
#'   Then come two numbers, the number of vertices and the number of edges
#'   in the graph, and after a double dash, the name of the graph (the
#'   \sQuote{`name`} graph attribute) is printed if present. The
#'   second line is optional and it contains all the attributes of the
#'   graph. This graph has a \sQuote{`name`} graph attribute, of type
#'   character, and two other graph attributes called
#'   \sQuote{`mutual`} and \sQuote{`circular`}, of a complex
#'   type. A complex type is simply anything that is not numeric or
#'   character. See the documentation of [print.igraph()] for
#'   details.
#'
#'   If you want to see the edges of the graph as well, then use the
#'   [print_all()] function: \preformatted{    > print_all(g)
#'     IGRAPH badcafe U--- 10 10 -- Ring graph
#'     + attr: name (g/c), mutual (g/x), circular (g/x)
#'     + edges:
#'      [1] 1-- 2 2-- 3 3-- 4 4-- 5 5-- 6 6-- 7 7-- 8 8-- 9 9--10 1--10 }
#'
#' @section Creating graphs:
#'   There are many functions in igraph for creating graphs, both
#'   deterministic and stochastic; stochastic graph constructors are called
#'   \sQuote{games}.
#'
#'   To create small graphs with a given structure probably the
#'   [graph_from_literal()] function is easiest. It uses R's formula
#'   interface, its manual page contains many examples. Another option is
#'   [make_graph()], which takes numeric vertex ids directly.
#'   [graph_from_atlas()] creates graph from the Graph Atlas,
#'   [make_graph()] can create some special graphs.
#'
#'   To create graphs from field data, [graph_from_edgelist()],
#'   [graph_from_data_frame()] and [graph_from_adjacency_matrix()] are
#'   probably the best choices.
#'
#'   The igraph package includes some classic random graphs like the
#'   Erdős-Rényi GNP and GNM graphs ([sample_gnp()], [sample_gnm()]) and
#'   some recent  popular models, like preferential attachment
#'   ([sample_pa()]) and the small-world model
#'   ([sample_smallworld()]).
#'
#' @section Vertex and edge IDs:
#'   Vertices and edges have numerical vertex ids in igraph. Vertex ids are
#'   always consecutive and they start with one. I.e. for a graph with
#'   \eqn{n} vertices the vertex ids are between \eqn{1} and
#'   \eqn{n}. If some operation changes the number of vertices in the
#'   graphs, e.g. a subgraph is created via [induced_subgraph()], then
#'   the vertices are renumbered to satisfy this criteria.
#'
#'   The same is true for the edges as well, edge ids are always between
#'   one and \eqn{m}, the total number of edges in the graph.
#'
#'   It is often desirable to follow vertices along a number of graph
#'   operations, and vertex ids don't allow this because of the
#'   renumbering. The solution is to assign attributes to the
#'   vertices. These are kept by all operations, if possible. See more
#'   about attributes in the next section.
#'
#' @section Attributes:
#'   In igraph it is possible to assign attributes to the vertices or edges
#'   of a graph, or to the graph itself. igraph provides flexible
#'   constructs for selecting a set of vertices or edges based on their
#'   attribute values, see [vertex_attr()],
#'   [V()] and [E()] for details.
#'
#'   Some vertex/edge/graph attributes are treated specially. One of them
#'   is the \sQuote{name} attribute. This is used for printing the graph
#'   instead of the numerical ids, if it exists. Vertex names can also be
#'   used to specify a vector or set of vertices, in all igraph
#'   functions. E.g. [degree()] has a `v` argument
#'   that gives the vertices for which the degree is calculated. This
#'   argument can be given as a character vector of vertex names.
#'
#'   Edges can also have a \sQuote{name} attribute, and this is treated
#'   specially as well. Just like for vertices, edges can also be selected
#'   based on their names, e.g. in the [delete_edges()] and
#'   other functions.
#'
#'   We note here, that vertex names can also be used to select edges.
#'   The form \sQuote{`from|to`}, where \sQuote{`from`} and
#'   \sQuote{`to`} are vertex names, select a single, possibly
#'   directed, edge going from \sQuote{`from`} to
#'   \sQuote{`to`}. The two forms can also be mixed in the same edge
#'   selector.
#'
#'   Other attributes define visualization parameters, see
#'   [igraph.plotting] for details.
#'
#'   Attribute values can be set to any R object, but note that storing the
#'   graph in some file formats might result the loss of complex attribute
#'   values. All attribute values are preserved if you use
#'   [base::save()] and [base::load()] to store/retrieve your
#'   graphs.
#'
#' @section Visualization:
#'   igraph provides three different ways for visualization. The first is
#'   the [plot.igraph()] function. (Actually you don't need to
#'   write `plot.igraph()`, [plot()] is enough. This function uses
#'   regular R graphics and can be used with any R device.
#'
#'   The second function is [tkplot()], which uses a Tk GUI for
#'   basic interactive graph manipulation. (Tk is quite resource hungry, so
#'   don't try this for very large graphs.)
#'
#'   The third way requires the `rgl` package and uses OpenGL. See the
#'   [rglplot()] function for the details.
#'
#'   Make sure you read [igraph.plotting] before you start
#'   plotting your graphs.
#'
#' @section File formats:
#'   igraph can handle various graph file formats, usually both for reading
#'   and writing. We suggest that you use the GraphML file format for your
#'   graphs, except if the graphs are too big. For big graphs a simpler
#'   format is recommended. See [read_graph()] and
#'   [write_graph()] for details.
#'
#' @section Further information:
#'   The igraph homepage is at <https://igraph.org>.
#'   See especially the documentation section. Join the discussion forum at
#'   <https://igraph.discourse.group> if you have questions or comments.
"_PACKAGE"
