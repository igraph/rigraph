
#' Find triangles in graphs
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `adjacent.triangles()` was renamed to `adjacent_triangles()` to create a more
#' consistent API.

#' @keywords internal
#' @export
adjacent.triangles <- function(graph , vids = V(graph)) {
   lifecycle::deprecate_soft("1.5.0", "adjacent.triangles()", "adjacent_triangles()")
   adjacent_triangles(graph = graph, vids = vids)
}

#' Articulation points and bridges of a graph
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `articulation.points()` was renamed to `articulation_points()` to create a more
#' consistent API.
#' @inheritParams articulation_points
#' @keywords internal
#' @export
articulation.points <- function(graph) {
   lifecycle::deprecate_soft("1.5.0", "articulation.points()", "articulation_points()")
   articulation_points(graph = graph)
}

#' Assortativity coefficient
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `assortativity.degree()` was renamed to `assortativity()` to create a more
#' consistent API.
#' @inheritParams assortativity
#' @keywords internal
#' @export
assortativity.degree <- function(graph , directed = TRUE) {
   lifecycle::deprecate_soft("1.5.0", "assortativity.degree()", "assortativity()")
   assortativity(graph = graph, directed = directed)
}

#' Assortativity coefficient
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `assortativity.nominal()` was renamed to `assortativity()` to create a more
#' consistent API.
#' @inheritParams assortativity
#' @keywords internal
#' @export
assortativity.nominal <- function(graph , types , directed = TRUE) {
   lifecycle::deprecate_soft("1.5.0", "assortativity.nominal()", "assortativity()")
   assortativity(graph = graph, types = types, directed = directed)
}

#' Number of automorphisms
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `automorphisms()` was renamed to `count_automorphisms()` to create a more
#' consistent API.
#' @inheritParams count_automorphisms
#' @keywords internal
#' @export
automorphisms <- function(graph , colors , sh = c("fm","f","fs","fl","flm","fsm")) {
   lifecycle::deprecate_soft("1.5.0", "automorphisms()", "count_automorphisms()")
   count_automorphisms(graph = graph, colors = colors, sh = sh)
}

#' Shortest (directed or undirected) paths between vertices
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `average.path.length()` was renamed to `distance_table()` to create a more
#' consistent API.
#' @inheritParams distance_table
#' @keywords internal
#' @export
average.path.length <- function(graph , weights = NULL , directed = TRUE , unconnected = TRUE , details = FALSE) {
   lifecycle::deprecate_soft("1.5.0", "average.path.length()", "distance_table()")
   distance_table(graph = graph, weights = weights, directed = directed, unconnected = unconnected, details = details)
}

#' Biconnected components
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `biconnected.components()` was renamed to `biconnected_components()` to create a more
#' consistent API.
#' @inheritParams biconnected_components
#' @keywords internal
#' @export
biconnected.components <- function(graph) {
   lifecycle::deprecate_soft("1.5.0", "biconnected.components()", "biconnected_components()")
   biconnected_components(graph = graph)
}

#' Decide whether a graph is bipartite
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `bipartite.mapping()` was renamed to `bipartite_mapping()` to create a more
#' consistent API.
#' @inheritParams bipartite_mapping
#' @keywords internal
#' @export
bipartite.mapping <- function(graph) {
   lifecycle::deprecate_soft("1.5.0", "bipartite.mapping()", "bipartite_mapping()")
   bipartite_mapping(graph = graph)
}

#' Project a bipartite graph
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `bipartite.projection.size()` was renamed to `bipartite_projection()` to create a more
#' consistent API.
#' @inheritParams bipartite_projection
#' @keywords internal
#' @export
bipartite.projection.size <- function(graph , types = NULL) {
   lifecycle::deprecate_soft("1.5.0", "bipartite.projection.size()", "bipartite_projection()")
   bipartite_projection(graph = graph, types = types)
}

#' Canonical permutation of a graph
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `canonical.permutation()` was renamed to `canonical_permutation()` to create a more
#' consistent API.
#' @inheritParams canonical_permutation
#' @keywords internal
#' @export
canonical.permutation <- function(graph , colors , sh = c("fm","f","fs","fl","flm","fsm")) {
   lifecycle::deprecate_soft("1.5.0", "canonical.permutation()", "canonical_permutation()")
   canonical_permutation(graph = graph, colors = colors, sh = sh)
}

#' Theoretical maximum for betweenness centralization
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `centralization.betweenness.tmax()` was renamed to `centr_betw_tmax()` to create a more
#' consistent API.
#' @inheritParams centr_betw_tmax
#' @keywords internal
#' @export
centralization.betweenness.tmax <- function(graph = NULL , nodes = 0 , directed = TRUE) {
   lifecycle::deprecate_soft("1.5.0", "centralization.betweenness.tmax()", "centr_betw_tmax()")
   centr_betw_tmax(graph = graph, nodes = nodes, directed = directed)
}

#' Centralize a graph according to the closeness of vertices
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `centralization.closeness()` was renamed to `centr_clo()` to create a more
#' consistent API.
#' @inheritParams centr_clo
#' @keywords internal
#' @export
centralization.closeness <- function(graph , mode = c("out","in","all","total") , normalized = TRUE) {
   lifecycle::deprecate_soft("1.5.0", "centralization.closeness()", "centr_clo()")
   centr_clo(graph = graph, mode = mode, normalized = normalized)
}

#' Theoretical maximum for closeness centralization
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `centralization.closeness.tmax()` was renamed to `centr_clo_tmax()` to create a more
#' consistent API.
#' @inheritParams centr_clo_tmax
#' @keywords internal
#' @export
centralization.closeness.tmax <- function(graph = NULL , nodes = 0 , mode = c("out","in","all","total")) {
   lifecycle::deprecate_soft("1.5.0", "centralization.closeness.tmax()", "centr_clo_tmax()")
   centr_clo_tmax(graph = graph, nodes = nodes, mode = mode)
}

#' Centralize a graph according to the degrees of vertices
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `centralization.degree()` was renamed to `centr_degree()` to create a more
#' consistent API.
#' @inheritParams centr_degree
#' @keywords internal
#' @export
centralization.degree <- function(graph , mode = c("all","out","in","total") , loops = TRUE , normalized = TRUE) {
   lifecycle::deprecate_soft("1.5.0", "centralization.degree()", "centr_degree()")
   centr_degree(graph = graph, mode = mode, loops = loops, normalized = normalized)
}

#' Centralize a graph according to the eigenvector centrality of vertices
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `centralization.evcent()` was renamed to `centr_eigen()` to create a more
#' consistent API.
#' @inheritParams centr_eigen
#' @keywords internal
#' @export
centralization.evcent <- function(graph , directed = FALSE , scale = TRUE , options = arpack_defaults() , normalized = TRUE) {
   lifecycle::deprecate_soft("1.5.0", "centralization.evcent()", "centr_eigen()")
   centr_eigen(graph = graph, directed = directed, scale = scale, options = options, normalized = normalized)
}

#' Theoretical maximum for betweenness centralization
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `centralization.evcent.tmax()` was renamed to `centr_eigen_tmax()` to create a more
#' consistent API.
#' @inheritParams centr_eigen_tmax
#' @keywords internal
#' @export
centralization.evcent.tmax <- function(graph = NULL , nodes = 0 , directed = FALSE , scale = TRUE) {
   lifecycle::deprecate_soft("1.5.0", "centralization.evcent.tmax()", "centr_eigen_tmax()")
   centr_eigen_tmax(graph = graph, nodes = nodes, directed = directed, scale = scale)
}

#' Centralization of a graph
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `centralize.scores()` was renamed to `centralize()` to create a more
#' consistent API.
#' @inheritParams centralize
#' @keywords internal
#' @export
centralize.scores <- function(scores , theoretical.max = 0 , normalized = TRUE) {
   lifecycle::deprecate_soft("1.5.0", "centralize.scores()", "centralize()")
   centralize(scores = scores, theoretical.max = theoretical.max, normalized = normalized)
}

#' Functions to find cliques, i.e. complete subgraphs in a graph
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `clique.number()` was renamed to `cliques()` to create a more
#' consistent API.
#' @inheritParams cliques
#' @keywords internal
#' @export
clique.number <- function(graph) {
   lifecycle::deprecate_soft("1.5.0", "clique.number()", "cliques()")
   cliques(graph = graph)
}

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
contract.vertices <- function(graph , mapping , vertex.attr.comb = igraph_opt("vertex.attr.comb")) {
   lifecycle::deprecate_soft("1.5.0", "contract.vertices()", "contract()")
   contract(graph = graph, mapping = mapping, vertex.attr.comb = vertex.attr.comb)
}

#' Convex hull of a set of vertices
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `convex.hull()` was renamed to `convex_hull()` to create a more
#' consistent API.
#' @inheritParams convex_hull
#' @keywords internal
#' @export
convex.hull <- function(data) {
   lifecycle::deprecate_soft("1.5.0", "convex.hull()", "convex_hull()")
   convex_hull(data = data)
}

#' Find the multiple or loop edges in a graph
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `count.multiple()` was renamed to `which_multiple()` to create a more
#' consistent API.
#' @inheritParams which_multiple
#' @keywords internal
#' @export
count.multiple <- function(graph , eids = E(graph)) {
   lifecycle::deprecate_soft("1.5.0", "count.multiple()", "which_multiple()")
   which_multiple(graph = graph, eids = eids)
}

#' Forest Fire Network Model
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `forest.fire.game()` was renamed to `sample_forestfire()` to create a more
#' consistent API.
#' @inheritParams sample_forestfire
#' @keywords internal
#' @export
forest.fire.game <- function(nodes , fw.prob , bw.factor = 1 , ambs = 1 , directed = TRUE) {
   lifecycle::deprecate_soft("1.5.0", "forest.fire.game()", "sample_forestfire()")
   sample_forestfire(nodes = nodes, fw.prob = fw.prob, bw.factor = bw.factor, ambs = ambs, directed = directed)
}

#' Create graphs from adjacency lists
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `graph.adjlist()` was renamed to `graph_from_adj_list()` to create a more
#' consistent API.
#' @inheritParams graph_from_adj_list
#' @keywords internal
#' @export
graph.adjlist <- function(adjlist , mode = c("out","in","all","total") , duplicate = TRUE) {
   lifecycle::deprecate_soft("1.5.0", "graph.adjlist()", "graph_from_adj_list()")
   graph_from_adj_list(adjlist = adjlist, mode = mode, duplicate = duplicate, x = x)
}

#' Number of automorphisms
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `graph.automorphisms()` was renamed to `count_automorphisms()` to create a more
#' consistent API.
#' @inheritParams count_automorphisms
#' @keywords internal
#' @export
graph.automorphisms <- function(graph , colors , sh = c("fm","f","fs","fl","flm","fsm")) {
   lifecycle::deprecate_soft("1.5.0", "graph.automorphisms()", "count_automorphisms()")
   count_automorphisms(graph = graph, colors = colors, sh = sh)
}

#' Graph diversity
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `graph.diversity()` was renamed to `diversity()` to create a more
#' consistent API.
#' @inheritParams diversity
#' @keywords internal
#' @export
graph.diversity <- function(graph , weights = NULL , vids = V(graph)) {
   lifecycle::deprecate_soft("1.5.0", "graph.diversity()", "diversity()")
   diversity(graph = graph, weights = weights, vids = vids)
}

#' Create a graph from an isomorphism class
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `graph.isocreate()` was renamed to `graph_from_isomorphism_class()` to create a more
#' consistent API.
#' @inheritParams graph_from_isomorphism_class
#' @keywords internal
#' @export
graph.isocreate <- function(size , number , directed = TRUE) {
   lifecycle::deprecate_soft("1.5.0", "graph.isocreate()", "graph_from_isomorphism_class()")
   graph_from_isomorphism_class(size = size, number = number, directed = directed)
}

#' Average nearest neighbor degree
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `graph.knn()` was renamed to `knn()` to create a more
#' consistent API.
#' @inheritParams knn
#' @keywords internal
#' @export
graph.knn <- function(graph , vids = V(graph) , mode = c("all","out","in","total") , neighbor.degree.mode = c("all","out","in","total") , weights = NULL) {
   lifecycle::deprecate_soft("1.5.0", "graph.knn()", "knn()")
   knn(graph = graph, vids = vids, mode = mode, neighbor.degree.mode = neighbor.degree.mode, weights = weights)
}

#' Creating a graph from LCF notation
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `graph.lcf()` was renamed to `graph_from_lcf()` to create a more
#' consistent API.
#' @inheritParams graph_from_lcf
#' @keywords internal
#' @export
graph.lcf <- function(n , shifts , repeats = 1) {
   lifecycle::deprecate_soft("1.5.0", "graph.lcf()", "graph_from_lcf()")
   graph_from_lcf(n = n, shifts = shifts, repeats = repeats)
}

#' Maximum flow in a graph
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `graph.maxflow()` was renamed to `max_flow()` to create a more
#' consistent API.
#' @inheritParams max_flow
#' @keywords internal
#' @export
graph.maxflow <- function(graph , source , target , capacity = NULL) {
   lifecycle::deprecate_soft("1.5.0", "graph.maxflow()", "max_flow()")
   max_flow(graph = graph, source = source, target = target, capacity = capacity)
}

#' Strength or weighted vertex degree
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `graph.strength()` was renamed to `strength()` to create a more
#' consistent API.
#' @inheritParams strength
#' @keywords internal
#' @export
graph.strength <- function(graph , vids = V(graph) , mode = c("all","out","in","total") , loops = TRUE , weights = NULL) {
   lifecycle::deprecate_soft("1.5.0", "graph.strength()", "strength()")
   strength(graph = graph, vids = vids, mode = mode, loops = loops, weights = weights)
}

#' Find the multiple or loop edges in a graph
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `has.multiple()` was renamed to `which_multiple()` to create a more
#' consistent API.
#' @inheritParams which_multiple
#' @keywords internal
#' @export
has.multiple <- function(graph) {
   lifecycle::deprecate_soft("1.5.0", "has.multiple()", "which_multiple()")
   which_multiple(graph = graph)
}

#' Create a consensus tree from several hierarchical random graph models
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `hrg.consensus()` was renamed to `consensus_tree()` to create a more
#' consistent API.
#' @inheritParams consensus_tree
#' @keywords internal
#' @export
hrg.consensus <- function(graph , hrg = NULL , start = FALSE , num.samples = 10000) {
   lifecycle::deprecate_soft("1.5.0", "hrg.consensus()", "consensus_tree()")
   consensus_tree(graph = graph, hrg = hrg, start = start, num.samples = num.samples)
}

#' Create a hierarchical random graph from an igraph graph
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `hrg.create()` was renamed to `hrg()` to create a more
#' consistent API.
#' @inheritParams hrg
#' @keywords internal
#' @export
hrg.create <- function(graph , prob) {
   lifecycle::deprecate_soft("1.5.0", "hrg.create()", "hrg()")
   hrg(graph = graph, prob = prob)
}

#' Create an igraph graph from a hierarchical random graph model
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `hrg.dendrogram()` was renamed to `hrg_tree()` to create a more
#' consistent API.
#' @inheritParams hrg_tree
#' @keywords internal
#' @export
hrg.dendrogram <- function(hrg) {
   lifecycle::deprecate_soft("1.5.0", "hrg.dendrogram()", "hrg_tree()")
   hrg_tree(hrg = hrg)
}

#' Sample from a hierarchical random graph model
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `hrg.game()` was renamed to `sample_hrg()` to create a more
#' consistent API.
#' @inheritParams sample_hrg
#' @keywords internal
#' @export
hrg.game <- function(hrg) {
   lifecycle::deprecate_soft("1.5.0", "hrg.game()", "sample_hrg()")
   sample_hrg(hrg = hrg)
}

#' A graph with subgraphs that are each a random graph.
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `interconnected.islands.game()` was renamed to `sample_islands()` to create a more
#' consistent API.
#' @inheritParams sample_islands
#' @keywords internal
#' @export
interconnected.islands.game <- function(islands.n , islands.size , islands.pin , n.inter) {
   lifecycle::deprecate_soft("1.5.0", "interconnected.islands.game()", "sample_islands()")
   sample_islands(islands.n = islands.n, islands.size = islands.size, islands.pin = islands.pin, n.inter = n.inter)
}

#' Connected components of a graph
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `is.connected()` was renamed to `component_distribution()` to create a more
#' consistent API.
#' @inheritParams component_distribution
#' @keywords internal
#' @export
is.connected <- function(graph , mode = c("weak","strong")) {
   lifecycle::deprecate_soft("1.5.0", "is.connected()", "component_distribution()")
   component_distribution(graph = graph, mode = mode)
}

#' Directed acyclic graphs
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `is.dag()` was renamed to `is_dag()` to create a more
#' consistent API.
#' @inheritParams is_dag
#' @keywords internal
#' @export
is.dag <- function(graph) {
   lifecycle::deprecate_soft("1.5.0", "is.dag()", "is_dag()")
   is_dag(graph = graph)
}

#' Is a degree sequence graphical?
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `is.graphical.degree.sequence()` was renamed to `is_graphical()` to create a more
#' consistent API.
#' @inheritParams is_graphical
#' @keywords internal
#' @export
is.graphical.degree.sequence <- function(out.deg , in.deg = NULL , allowed.edge.types = c("simple","loops","multi","all")) {
   lifecycle::deprecate_soft("1.5.0", "is.graphical.degree.sequence()", "is_graphical()")
   is_graphical(out.deg = out.deg, in.deg = in.deg, allowed.edge.types = allowed.edge.types)
}

#' Find the multiple or loop edges in a graph
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `is.loop()` was renamed to `which_multiple()` to create a more
#' consistent API.
#' @inheritParams which_multiple
#' @keywords internal
#' @export
is.loop <- function(graph , eids = E(graph)) {
   lifecycle::deprecate_soft("1.5.0", "is.loop()", "which_multiple()")
   which_multiple(graph = graph, eids = eids)
}

#' Minimal vertex separators
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `is.minimal.separator()` was renamed to `is_min_separator()` to create a more
#' consistent API.
#' @inheritParams is_min_separator
#' @keywords internal
#' @export
is.minimal.separator <- function(graph , candidate) {
   lifecycle::deprecate_soft("1.5.0", "is.minimal.separator()", "is_min_separator()")
   is_min_separator(graph = graph, candidate = candidate)
}

#' Find the multiple or loop edges in a graph
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `is.multiple()` was renamed to `which_multiple()` to create a more
#' consistent API.
#' @inheritParams which_multiple
#' @keywords internal
#' @export
is.multiple <- function(graph , eids = E(graph)) {
   lifecycle::deprecate_soft("1.5.0", "is.multiple()", "which_multiple()")
   which_multiple(graph = graph, eids = eids)
}

#' Find mutual edges in a directed graph
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `is.mutual()` was renamed to `which_mutual()` to create a more
#' consistent API.
#' @inheritParams which_mutual
#' @keywords internal
#' @export
is.mutual <- function(graph , eids = E(graph)) {
   lifecycle::deprecate_soft("1.5.0", "is.mutual()", "which_mutual()")
   which_mutual(graph = graph, eids = eids)
}

#' Vertex separators
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `is.separator()` was renamed to `is_separator()` to create a more
#' consistent API.
#' @inheritParams is_separator
#' @keywords internal
#' @export
is.separator <- function(graph , candidate) {
   lifecycle::deprecate_soft("1.5.0", "is.separator()", "is_separator()")
   is_separator(graph = graph, candidate = candidate)
}

#' Simple graphs
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `is.simple()` was renamed to `simplify()` to create a more
#' consistent API.
#' @inheritParams simplify
#' @keywords internal
#' @export
is.simple <- function(graph) {
   lifecycle::deprecate_soft("1.5.0", "is.simple()", "simplify()")
   simplify(graph = graph)
}

#' Create a random regular graph
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `k.regular.game()` was renamed to `sample_k_regular()` to create a more
#' consistent API.
#' @inheritParams sample_k_regular
#' @keywords internal
#' @export
k.regular.game <- function(no.of.nodes , k , directed = FALSE , multiple = FALSE) {
   lifecycle::deprecate_soft("1.5.0", "k.regular.game()", "sample_k_regular()")
   sample_k_regular(no.of.nodes = no.of.nodes, k = k, directed = directed, multiple = multiple)
}

#' Functions to find cliques, i.e. complete subgraphs in a graph
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `largest.cliques()` was renamed to `cliques()` to create a more
#' consistent API.
#' @inheritParams cliques
#' @keywords internal
#' @export
largest.cliques <- function(graph) {
   lifecycle::deprecate_soft("1.5.0", "largest.cliques()", "cliques()")
   cliques(graph = graph)
}

#' Minimum size vertex separators
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `minimal.st.separators()` was renamed to `min_st_separators()` to create a more
#' consistent API.
#' @inheritParams min_st_separators
#' @keywords internal
#' @export
minimal.st.separators <- function(graph) {
   lifecycle::deprecate_soft("1.5.0", "minimal.st.separators()", "min_st_separators()")
   min_st_separators(graph = graph)
}

#' Maximum cardinality search
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `maximum.cardinality.search()` was renamed to `max_cardinality()` to create a more
#' consistent API.
#' @inheritParams max_cardinality
#' @keywords internal
#' @export
maximum.cardinality.search <- function(graph) {
   lifecycle::deprecate_soft("1.5.0", "maximum.cardinality.search()", "max_cardinality()")
   max_cardinality(graph = graph)
}

#' Minimum size vertex separators
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `minimum.size.separators()` was renamed to `min_separators()` to create a more
#' consistent API.
#' @inheritParams min_separators
#' @keywords internal
#' @export
minimum.size.separators <- function(graph) {
   lifecycle::deprecate_soft("1.5.0", "minimum.size.separators()", "min_separators()")
   min_separators(graph = graph)
}

#' The Page Rank algorithm
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `page.rank()` was renamed to `page_rank()` to create a more
#' consistent API.
#' @inheritParams page_rank
#' @keywords internal
#' @export
page.rank <- function(graph , algo = c("prpack","arpack") , vids = V(graph) , directed = TRUE , damping = 0.85 , personalized = NULL , weights = NULL , options = NULL) {
   lifecycle::deprecate_soft("1.5.0", "page.rank()", "page_rank()")
   page_rank(graph = graph, algo = algo, vids = vids, directed = directed, damping = damping, personalized = personalized, weights = weights, options = options)
}

#' Shortest (directed or undirected) paths between vertices
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `path.length.hist()` was renamed to `distance_table()` to create a more
#' consistent API.
#' @inheritParams distance_table
#' @keywords internal
#' @export
path.length.hist <- function(graph , directed = TRUE) {
   lifecycle::deprecate_soft("1.5.0", "path.length.hist()", "distance_table()")
   distance_table(graph = graph, directed = directed)
}

#' Permute the vertices of a graph
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `permute.vertices()` was renamed to `permute()` to create a more
#' consistent API.
#' @inheritParams permute
#' @keywords internal
#' @export
permute.vertices <- function(graph , permutation) {
   lifecycle::deprecate_soft("1.5.0", "permute.vertices()", "permute()")
   permute(graph = graph, permutation = permutation)
}

#' Sample stochastic block model
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `sbm.game()` was renamed to `sample_sbm()` to create a more
#' consistent API.
#' @inheritParams sample_sbm
#' @keywords internal
#' @export
sbm.game <- function(n , pref.matrix , block.sizes , directed = FALSE , loops = FALSE) {
   lifecycle::deprecate_soft("1.5.0", "sbm.game()", "sample_sbm()")
   sample_sbm(n = n, pref.matrix = pref.matrix, block.sizes = block.sizes, directed = directed, loops = loops)
}

#' List all (s,t)-cuts of a graph
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `stCuts()` was renamed to `st_cuts()` to create a more
#' consistent API.
#' @inheritParams st_cuts
#' @keywords internal
#' @export
stCuts <- function(graph , source , target) {
   lifecycle::deprecate_soft("1.5.0", "stCuts()", "st_cuts()")
   st_cuts(graph = graph, source = source, target = target)
}

#' List all minimum \((s,t)\)-cuts of a graph
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `stMincuts()` was renamed to `st_min_cuts()` to create a more
#' consistent API.
#' @inheritParams st_min_cuts
#' @keywords internal
#' @export
stMincuts <- function(graph , source , target , capacity = NULL) {
   lifecycle::deprecate_soft("1.5.0", "stMincuts()", "st_min_cuts()")
   st_min_cuts(graph = graph, source = source, target = target, capacity = capacity)
}

#' Random graphs from vertex fitness scores
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `static.fitness.game()` was renamed to `sample_fitness()` to create a more
#' consistent API.
#' @inheritParams sample_fitness
#' @keywords internal
#' @export
static.fitness.game <- function(no.of.edges , fitness.out , fitness.in = NULL , loops = FALSE , multiple = FALSE) {
   lifecycle::deprecate_soft("1.5.0", "static.fitness.game()", "sample_fitness()")
   sample_fitness(no.of.edges = no.of.edges, fitness.out = fitness.out, fitness.in = fitness.in, loops = loops, multiple = multiple)
}

#' Scale-free random graphs, from vertex fitness scores
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `static.power.law.game()` was renamed to `sample_fitness_pl()` to create a more
#' consistent API.
#' @inheritParams sample_fitness_pl
#' @keywords internal
#' @export
static.power.law.game <- function(no.of.nodes , no.of.edges , exponent.out , exponent.in = -1 , loops = FALSE , multiple = FALSE , finite.size.correction = TRUE) {
   lifecycle::deprecate_soft("1.5.0", "static.power.law.game()", "sample_fitness_pl()")
   sample_fitness_pl(no.of.nodes = no.of.nodes, no.of.edges = no.of.edges, exponent.out = exponent.out, exponent.in = exponent.in, loops = loops, multiple = multiple, finite.size.correction = finite.size.correction)
}

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
triad.census <- function(graph) {
   lifecycle::deprecate_soft("1.5.0", "triad.census()", "triad_census()")
   triad_census(graph = graph)
}
