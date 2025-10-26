# Package index

## igraph options

- [`igraph_options()`](https://r.igraph.org/reference/igraph_options.md)
  [`igraph_opt()`](https://r.igraph.org/reference/igraph_options.md) :
  Parameters for the igraph package
- [`with_igraph_opt()`](https://r.igraph.org/reference/with_igraph_opt.md)
  : Run code with a temporary igraph options setting

## Construction

### Deterministic constructors

- [`connect()`](https://r.igraph.org/reference/ego.md)
  [`ego_size()`](https://r.igraph.org/reference/ego.md)
  [`neighborhood_size()`](https://r.igraph.org/reference/ego.md)
  [`ego()`](https://r.igraph.org/reference/ego.md)
  [`neighborhood()`](https://r.igraph.org/reference/ego.md)
  [`make_ego_graph()`](https://r.igraph.org/reference/ego.md)
  [`make_neighborhood_graph()`](https://r.igraph.org/reference/ego.md) :
  Neighborhood of graph vertices
- [`make_()`](https://r.igraph.org/reference/make_.md) : Make a new
  graph
- [`make_bipartite_graph()`](https://r.igraph.org/reference/make_bipartite_graph.md)
  [`bipartite_graph()`](https://r.igraph.org/reference/make_bipartite_graph.md)
  : Create a bipartite graph
- [`make_chordal_ring()`](https://r.igraph.org/reference/make_chordal_ring.md)
  [`chordal_ring()`](https://r.igraph.org/reference/make_chordal_ring.md)
  : Create an extended chordal ring graph
- [`make_clusters()`](https://r.igraph.org/reference/make_clusters.md) :
  Creates a communities object.
- [`make_de_bruijn_graph()`](https://r.igraph.org/reference/make_de_bruijn_graph.md)
  [`de_bruijn_graph()`](https://r.igraph.org/reference/make_de_bruijn_graph.md)
  : De Bruijn graphs
- [`make_empty_graph()`](https://r.igraph.org/reference/make_empty_graph.md)
  [`empty_graph()`](https://r.igraph.org/reference/make_empty_graph.md)
  : A graph with no edges
- [`make_from_prufer()`](https://r.igraph.org/reference/make_from_prufer.md)
  [`from_prufer()`](https://r.igraph.org/reference/make_from_prufer.md)
  : Create an undirected tree graph from its Prüfer sequence
- [`make_full_bipartite_graph()`](https://r.igraph.org/reference/make_full_bipartite_graph.md)
  [`full_bipartite_graph()`](https://r.igraph.org/reference/make_full_bipartite_graph.md)
  : Create a full bipartite graph
- [`make_full_citation_graph()`](https://r.igraph.org/reference/make_full_citation_graph.md)
  [`full_citation_graph()`](https://r.igraph.org/reference/make_full_citation_graph.md)
  : Create a complete (full) citation graph
- [`make_full_graph()`](https://r.igraph.org/reference/make_full_graph.md)
  [`full_graph()`](https://r.igraph.org/reference/make_full_graph.md) :
  Create a full graph
- [`make_graph()`](https://r.igraph.org/reference/make_graph.md)
  [`make_directed_graph()`](https://r.igraph.org/reference/make_graph.md)
  [`make_undirected_graph()`](https://r.igraph.org/reference/make_graph.md)
  [`directed_graph()`](https://r.igraph.org/reference/make_graph.md)
  [`undirected_graph()`](https://r.igraph.org/reference/make_graph.md) :
  Create an igraph graph from a list of edges, or a notable graph
- [`make_kautz_graph()`](https://r.igraph.org/reference/make_kautz_graph.md)
  [`kautz_graph()`](https://r.igraph.org/reference/make_kautz_graph.md)
  : Kautz graphs
- [`make_lattice()`](https://r.igraph.org/reference/make_lattice.md)
  [`lattice()`](https://r.igraph.org/reference/make_lattice.md) : Create
  a lattice graph
- [`make_line_graph()`](https://r.igraph.org/reference/make_line_graph.md)
  [`line_graph()`](https://r.igraph.org/reference/make_line_graph.md) :
  Line graph of a graph
- [`make_ring()`](https://r.igraph.org/reference/make_ring.md)
  [`ring()`](https://r.igraph.org/reference/make_ring.md) : Create a
  ring graph
- [`make_star()`](https://r.igraph.org/reference/make_star.md)
  [`star()`](https://r.igraph.org/reference/make_star.md) : Create a
  star graph, a tree with n vertices and n - 1 leaves
- [`make_tree()`](https://r.igraph.org/reference/make_tree.md)
  [`tree()`](https://r.igraph.org/reference/make_tree.md) : Create tree
  graphs
- [`realize_degseq()`](https://r.igraph.org/reference/realize_degseq.md)
  : Creating a graph from a given degree sequence, deterministically
- [`realize_bipartite_degseq()`](https://r.igraph.org/reference/realize_bipartite_degseq.md)
  **\[experimental\]** : Creating a bipartite graph from two degree
  sequences, deterministically
- [`graph_from_atlas()`](https://r.igraph.org/reference/graph_from_atlas.md)
  [`atlas()`](https://r.igraph.org/reference/graph_from_atlas.md) :
  Create a graph from the Graph Atlas
- [`graph_from_edgelist()`](https://r.igraph.org/reference/graph_from_edgelist.md)
  [`from_edgelist()`](https://r.igraph.org/reference/graph_from_edgelist.md)
  : Create a graph from an edge list matrix
- [`graph_from_literal()`](https://r.igraph.org/reference/graph_from_literal.md)
  [`from_literal()`](https://r.igraph.org/reference/graph_from_literal.md)
  : Creating (small) graphs via a simple interface
- [`graph_()`](https://r.igraph.org/reference/graph_.md) : Convert
  object to a graph
- [`graph_from_lcf()`](https://r.igraph.org/reference/graph_from_lcf.md)
  : Creating a graph from LCF notation
- [`as_data_frame()`](https://r.igraph.org/reference/graph_from_data_frame.md)
  [`graph_from_data_frame()`](https://r.igraph.org/reference/graph_from_data_frame.md)
  [`from_data_frame()`](https://r.igraph.org/reference/graph_from_data_frame.md)
  : Creating igraph graphs from data frames or vice-versa

### Stochastic constructors (random graph models)

- [`sample_()`](https://r.igraph.org/reference/sample_.md) : Sample from
  a random graph model
- [`sample_bipartite()`](https://r.igraph.org/reference/sample_bipartite.md)
  [`bipartite()`](https://r.igraph.org/reference/sample_bipartite.md)
  **\[deprecated\]** : Bipartite random graphs
- [`bipartite_gnm()`](https://r.igraph.org/reference/sample_bipartite_gnm.md)
  [`bipartite_gnp()`](https://r.igraph.org/reference/sample_bipartite_gnm.md)
  [`sample_bipartite_gnm()`](https://r.igraph.org/reference/sample_bipartite_gnm.md)
  [`sample_bipartite_gnp()`](https://r.igraph.org/reference/sample_bipartite_gnm.md)
  : Bipartite random graphs
- [`sample_chung_lu()`](https://r.igraph.org/reference/sample_chung_lu.md)
  [`chung_lu()`](https://r.igraph.org/reference/sample_chung_lu.md)
  **\[experimental\]** : Random graph with given expected degrees
- [`sample_correlated_gnp()`](https://r.igraph.org/reference/sample_correlated_gnp.md)
  : Generate a new random graph from a given graph by randomly
  adding/removing edges
- [`sample_correlated_gnp_pair()`](https://r.igraph.org/reference/sample_correlated_gnp_pair.md)
  : Sample a pair of correlated \\G(n,p)\\ random graphs
- [`sample_degseq()`](https://r.igraph.org/reference/sample_degseq.md)
  [`degseq()`](https://r.igraph.org/reference/sample_degseq.md) :
  Generate random graphs with a given degree sequence
- [`sample_dot_product()`](https://r.igraph.org/reference/sample_dot_product.md)
  [`dot_product()`](https://r.igraph.org/reference/sample_dot_product.md)
  : Generate random graphs according to the random dot product graph
  model
- [`sample_fitness()`](https://r.igraph.org/reference/sample_fitness.md)
  : Random graphs from vertex fitness scores
- [`sample_fitness_pl()`](https://r.igraph.org/reference/sample_fitness_pl.md)
  : Scale-free random graphs, from vertex fitness scores
- [`sample_forestfire()`](https://r.igraph.org/reference/sample_forestfire.md)
  : Forest Fire Network Model
- [`sample_gnm()`](https://r.igraph.org/reference/sample_gnm.md)
  [`gnm()`](https://r.igraph.org/reference/sample_gnm.md) : Generate
  random graphs according to the \\G(n,m)\\ Erdős-Rényi model
- [`sample_gnp()`](https://r.igraph.org/reference/sample_gnp.md)
  [`gnp()`](https://r.igraph.org/reference/sample_gnp.md) : Generate
  random graphs according to the \\G(n,p)\\ Erdős-Rényi model
- [`sample_grg()`](https://r.igraph.org/reference/sample_grg.md)
  [`grg()`](https://r.igraph.org/reference/sample_grg.md) : Geometric
  random graphs
- [`sample_growing()`](https://r.igraph.org/reference/sample_growing.md)
  [`growing()`](https://r.igraph.org/reference/sample_growing.md) :
  Growing random graph generation
- [`sample_hierarchical_sbm()`](https://r.igraph.org/reference/sample_hierarchical_sbm.md)
  [`hierarchical_sbm()`](https://r.igraph.org/reference/sample_hierarchical_sbm.md)
  : Sample the hierarchical stochastic block model
- [`sample_islands()`](https://r.igraph.org/reference/sample_islands.md)
  : A graph with subgraphs that are each a random graph.
- [`sample_k_regular()`](https://r.igraph.org/reference/sample_k_regular.md)
  : Create a random regular graph
- [`sample_last_cit()`](https://r.igraph.org/reference/sample_last_cit.md)
  [`last_cit()`](https://r.igraph.org/reference/sample_last_cit.md)
  [`sample_cit_types()`](https://r.igraph.org/reference/sample_last_cit.md)
  [`cit_types()`](https://r.igraph.org/reference/sample_last_cit.md)
  [`sample_cit_cit_types()`](https://r.igraph.org/reference/sample_last_cit.md)
  [`cit_cit_types()`](https://r.igraph.org/reference/sample_last_cit.md)
  : Random citation graphs
- [`sample_pa()`](https://r.igraph.org/reference/sample_pa.md)
  [`pa()`](https://r.igraph.org/reference/sample_pa.md) : Generate
  random graphs using preferential attachment
- [`sample_pa_age()`](https://r.igraph.org/reference/sample_pa_age.md)
  [`pa_age()`](https://r.igraph.org/reference/sample_pa_age.md) :
  Generate an evolving random graph with preferential attachment and
  aging
- [`sample_pref()`](https://r.igraph.org/reference/sample_pref.md)
  [`pref()`](https://r.igraph.org/reference/sample_pref.md)
  [`sample_asym_pref()`](https://r.igraph.org/reference/sample_pref.md)
  [`asym_pref()`](https://r.igraph.org/reference/sample_pref.md) :
  Trait-based random generation
- [`sample_sbm()`](https://r.igraph.org/reference/sample_sbm.md)
  [`sbm()`](https://r.igraph.org/reference/sample_sbm.md) : Sample
  stochastic block model
- [`sample_smallworld()`](https://r.igraph.org/reference/sample_smallworld.md)
  [`smallworld()`](https://r.igraph.org/reference/sample_smallworld.md)
  : The Watts-Strogatz small-world model
- [`sample_traits_callaway()`](https://r.igraph.org/reference/sample_traits_callaway.md)
  [`traits_callaway()`](https://r.igraph.org/reference/sample_traits_callaway.md)
  [`sample_traits()`](https://r.igraph.org/reference/sample_traits_callaway.md)
  [`traits()`](https://r.igraph.org/reference/sample_traits_callaway.md)
  : Graph generation based on different vertex types
- [`sample_tree()`](https://r.igraph.org/reference/sample_tree.md) :
  Sample trees randomly and uniformly

### Constructor modifiers

- [`make_()`](https://r.igraph.org/reference/make_.md) : Make a new
  graph
- [`sample_()`](https://r.igraph.org/reference/sample_.md) : Sample from
  a random graph model
- [`simplified()`](https://r.igraph.org/reference/simplified.md) :
  Constructor modifier to drop multiple and loop edges
- [`with_edge_()`](https://r.igraph.org/reference/with_edge_.md) :
  Constructor modifier to add edge attributes
- [`with_graph_()`](https://r.igraph.org/reference/with_graph_.md) :
  Constructor modifier to add graph attributes
- [`with_vertex_()`](https://r.igraph.org/reference/with_vertex_.md) :
  Constructor modifier to add vertex attributes
- [`without_attr()`](https://r.igraph.org/reference/without_attr.md) :
  Construtor modifier to remove all attributes from a graph
- [`without_loops()`](https://r.igraph.org/reference/without_loops.md) :
  Constructor modifier to drop loop edges
- [`without_multiples()`](https://r.igraph.org/reference/without_multiples.md)
  : Constructor modifier to drop multiple edges

### Convert to igraph

- [`as.igraph()`](https://r.igraph.org/reference/as.igraph.md) :
  Conversion to igraph

### Adjacency matrices

- [`graph_from_adjacency_matrix()`](https://r.igraph.org/reference/graph_from_adjacency_matrix.md)
  [`from_adjacency()`](https://r.igraph.org/reference/graph_from_adjacency_matrix.md)
  : Create graphs from adjacency matrices

## Visualization

- [`add_layout_()`](https://r.igraph.org/reference/add_layout_.md) : Add
  layout to graph

- [`component_wise()`](https://r.igraph.org/reference/component_wise.md)
  : Component-wise layout

- [`layout_()`](https://r.igraph.org/reference/layout_.md)
  [`print(`*`<igraph_layout_spec>`*`)`](https://r.igraph.org/reference/layout_.md)
  [`print(`*`<igraph_layout_modifier>`*`)`](https://r.igraph.org/reference/layout_.md)
  : Graph layouts

- [`layout_as_bipartite()`](https://r.igraph.org/reference/layout_as_bipartite.md)
  [`as_bipartite()`](https://r.igraph.org/reference/layout_as_bipartite.md)
  : Simple two-row layout for bipartite graphs

- [`layout_as_star()`](https://r.igraph.org/reference/layout_as_star.md)
  [`as_star()`](https://r.igraph.org/reference/layout_as_star.md) :
  Generate coordinates to place the vertices of a graph in a star-shape

- [`layout_as_tree()`](https://r.igraph.org/reference/layout_as_tree.md)
  [`as_tree()`](https://r.igraph.org/reference/layout_as_tree.md) : The
  Reingold-Tilford graph layout algorithm

- [`layout_in_circle()`](https://r.igraph.org/reference/layout_in_circle.md)
  [`in_circle()`](https://r.igraph.org/reference/layout_in_circle.md) :
  Graph layout with vertices on a circle.

- [`layout_nicely()`](https://r.igraph.org/reference/layout_nicely.md)
  [`nicely()`](https://r.igraph.org/reference/layout_nicely.md) : Choose
  an appropriate graph layout algorithm automatically

- [`layout_on_grid()`](https://r.igraph.org/reference/layout_on_grid.md)
  [`on_grid()`](https://r.igraph.org/reference/layout_on_grid.md) :
  Simple grid layout

- [`layout_on_sphere()`](https://r.igraph.org/reference/layout_on_sphere.md)
  [`on_sphere()`](https://r.igraph.org/reference/layout_on_sphere.md) :
  Graph layout with vertices on the surface of a sphere

- [`layout_randomly()`](https://r.igraph.org/reference/layout_randomly.md)
  [`randomly()`](https://r.igraph.org/reference/layout_randomly.md) :
  Randomly place vertices on a plane or in 3d space

- [`layout_with_dh()`](https://r.igraph.org/reference/layout_with_dh.md)
  [`with_dh()`](https://r.igraph.org/reference/layout_with_dh.md) : The
  Davidson-Harel layout algorithm

- [`layout_with_fr()`](https://r.igraph.org/reference/layout_with_fr.md)
  [`with_fr()`](https://r.igraph.org/reference/layout_with_fr.md) : The
  Fruchterman-Reingold layout algorithm

- [`layout_with_gem()`](https://r.igraph.org/reference/layout_with_gem.md)
  [`with_gem()`](https://r.igraph.org/reference/layout_with_gem.md) :
  The GEM layout algorithm

- [`layout_with_graphopt()`](https://r.igraph.org/reference/layout_with_graphopt.md)
  [`with_graphopt()`](https://r.igraph.org/reference/layout_with_graphopt.md)
  : The graphopt layout algorithm

- [`layout_with_kk()`](https://r.igraph.org/reference/layout_with_kk.md)
  [`with_kk()`](https://r.igraph.org/reference/layout_with_kk.md) : The
  Kamada-Kawai layout algorithm

- [`layout_with_lgl()`](https://r.igraph.org/reference/layout_with_lgl.md)
  [`with_lgl()`](https://r.igraph.org/reference/layout_with_lgl.md) :
  Large Graph Layout

- [`layout_with_mds()`](https://r.igraph.org/reference/layout_with_mds.md)
  [`with_mds()`](https://r.igraph.org/reference/layout_with_mds.md) :
  Graph layout by multidimensional scaling

- [`layout_with_sugiyama()`](https://r.igraph.org/reference/layout_with_sugiyama.md)
  [`with_sugiyama()`](https://r.igraph.org/reference/layout_with_sugiyama.md)
  : The Sugiyama graph layout generator

- [`merge_coords()`](https://r.igraph.org/reference/merge_coords.md)
  [`layout_components()`](https://r.igraph.org/reference/merge_coords.md)
  : Merging graph layouts

- [`norm_coords()`](https://r.igraph.org/reference/norm_coords.md) :
  Normalize coordinates for plotting graphs

- [`normalize()`](https://r.igraph.org/reference/normalize.md) :
  Normalize layout

- [`layout_with_drl()`](https://r.igraph.org/reference/layout_with_drl.md)
  [`with_drl()`](https://r.igraph.org/reference/layout_with_drl.md) :
  The DrL graph layout generator

- [`categorical_pal()`](https://r.igraph.org/reference/categorical_pal.md)
  : Palette for categories

- [`diverging_pal()`](https://r.igraph.org/reference/diverging_pal.md) :
  Diverging palette

- [`r_pal()`](https://r.igraph.org/reference/r_pal.md) : The default R
  palette

- [`sequential_pal()`](https://r.igraph.org/reference/sequential_pal.md)
  : Sequential palette

- [`plot(`*`<igraph>`*`)`](https://r.igraph.org/reference/plot.igraph.md)
  : Plotting of graphs

- [`rglplot()`](https://r.igraph.org/reference/rglplot.md) : 3D plotting
  of graphs with OpenGL

- [`plot.common`](https://r.igraph.org/reference/plot.common.md)
  [`igraph.plotting`](https://r.igraph.org/reference/plot.common.md) :
  Drawing graphs

- [`plot_dendrogram(`*`<igraphHRG>`*`)`](https://r.igraph.org/reference/plot_dendrogram.igraphHRG.md)
  : HRG dendrogram plot

- [`plot_dendrogram()`](https://r.igraph.org/reference/plot_dendrogram.communities.md)
  : Community structure dendrogram plots

- [`curve_multiple()`](https://r.igraph.org/reference/curve_multiple.md)
  : Optimal edge curvature when plotting graphs

- [`shapes()`](https://r.igraph.org/reference/shapes.md)
  [`shape_noclip()`](https://r.igraph.org/reference/shapes.md)
  [`shape_noplot()`](https://r.igraph.org/reference/shapes.md)
  [`add_shape()`](https://r.igraph.org/reference/shapes.md) : Various
  vertex shapes when plotting igraph graphs

- [`vertex.shape.pie`](https://r.igraph.org/reference/vertex.shape.pie.md)
  : Using pie charts as vertices in graph plots

- [`align_layout()`](https://r.igraph.org/reference/align_layout.md) :

  Align a vertex layout This function centers a vertex layout on the
  coordinate system origin and rotates the layout to achieve a visually
  pleasing alignment with the coordinate axes. Doing this is
  particularly useful with force-directed layouts such as
  [`layout_with_fr()`](https://r.igraph.org/reference/layout_with_fr.md).

### Graph coloring

- [`greedy_vertex_coloring()`](https://r.igraph.org/reference/greedy_vertex_coloring.md)
  : Greedy vertex coloring

## Functions for manipulating graphs

- [`add_edges()`](https://r.igraph.org/reference/add_edges.md) : Add
  edges to a graph
- [`add_vertices()`](https://r.igraph.org/reference/add_vertices.md) :
  Add vertices to a graph
- [`complementer()`](https://r.igraph.org/reference/complementer.md) :
  Complementer of a graph
- [`compose()`](https://r.igraph.org/reference/compose.md) : Compose two
  graphs as binary relations
- [`contract()`](https://r.igraph.org/reference/contract.md) : Contract
  several vertices into a single one
- [`delete_edges()`](https://r.igraph.org/reference/delete_edges.md) :
  Delete edges from a graph
- [`delete_vertices()`](https://r.igraph.org/reference/delete_vertices.md)
  : Delete vertices from a graph
- [`difference()`](https://r.igraph.org/reference/difference.md) :
  Difference of two sets
- [`difference(`*`<igraph>`*`)`](https://r.igraph.org/reference/difference.igraph.md)
  : Difference of graphs
- [`disjoint_union()`](https://r.igraph.org/reference/disjoint_union.md)
  [`` `%du%` ``](https://r.igraph.org/reference/disjoint_union.md) :
  Disjoint union of graphs
- [`edge()`](https://r.igraph.org/reference/edge.md)
  [`edges()`](https://r.igraph.org/reference/edge.md) : Helper function
  for adding and deleting edges
- [`connect()`](https://r.igraph.org/reference/ego.md)
  [`ego_size()`](https://r.igraph.org/reference/ego.md)
  [`neighborhood_size()`](https://r.igraph.org/reference/ego.md)
  [`ego()`](https://r.igraph.org/reference/ego.md)
  [`neighborhood()`](https://r.igraph.org/reference/ego.md)
  [`make_ego_graph()`](https://r.igraph.org/reference/ego.md)
  [`make_neighborhood_graph()`](https://r.igraph.org/reference/ego.md) :
  Neighborhood of graph vertices
- [`` `-`( ``*`<igraph>`*`)`](https://r.igraph.org/reference/igraph-minus.md)
  : Delete vertices or edges from a graph
- [`intersection()`](https://r.igraph.org/reference/intersection.md) :
  Intersection of two or more sets
- [`intersection(`*`<igraph>`*`)`](https://r.igraph.org/reference/intersection.igraph.md)
  : Intersection of graphs
- [`path()`](https://r.igraph.org/reference/path.md) : Helper function
  to add or delete edges along a path
- [`permute()`](https://r.igraph.org/reference/permute.md) : Permute the
  vertices of a graph
- [`` `+`( ``*`<igraph>`*`)`](https://r.igraph.org/reference/plus-.igraph.md)
  : Add vertices, edges or another graph to a graph
- [`rep(`*`<igraph>`*`)`](https://r.igraph.org/reference/rep.igraph.md)
  [`` `*`( ``*`<igraph>`*`)`](https://r.igraph.org/reference/rep.igraph.md)
  : Replicate a graph multiple times
- [`reverse_edges()`](https://r.igraph.org/reference/reverse_edges.md)
  [`t(`*`<igraph>`*`)`](https://r.igraph.org/reference/reverse_edges.md)
  : Reverse edges in a graph
- [`simplify()`](https://r.igraph.org/reference/simplify.md)
  [`is_simple()`](https://r.igraph.org/reference/simplify.md)
  [`simplify_and_colorize()`](https://r.igraph.org/reference/simplify.md)
  : Simple graphs
- [`union()`](https://r.igraph.org/reference/union.md) : Union of two or
  more sets
- [`union(`*`<igraph>`*`)`](https://r.igraph.org/reference/union.igraph.md)
  : Union of graphs
- [`vertex()`](https://r.igraph.org/reference/vertex.md)
  [`vertices()`](https://r.igraph.org/reference/vertex.md) : Helper
  function for adding and deleting vertices

### Rewiring functions

- [`each_edge()`](https://r.igraph.org/reference/each_edge.md) : Rewires
  the endpoints of the edges of a graph to a random vertex
- [`keeping_degseq()`](https://r.igraph.org/reference/keeping_degseq.md)
  : Graph rewiring while preserving the degree distribution
- [`rewire()`](https://r.igraph.org/reference/rewire.md) : Rewiring
  edges of a graph

## Vertex, edge and graph attributes

- [`delete_edge_attr()`](https://r.igraph.org/reference/delete_edge_attr.md)
  : Delete an edge attribute
- [`delete_graph_attr()`](https://r.igraph.org/reference/delete_graph_attr.md)
  : Delete a graph attribute
- [`delete_vertex_attr()`](https://r.igraph.org/reference/delete_vertex_attr.md)
  : Delete a vertex attribute
- [`` `edge_attr<-`() ``](https://r.igraph.org/reference/edge_attr-set.md)
  : Set one or more edge attributes
- [`edge_attr()`](https://r.igraph.org/reference/edge_attr.md) : Query
  edge attributes of a graph
- [`edge_attr_names()`](https://r.igraph.org/reference/edge_attr_names.md)
  : List names of edge attributes
- [`` `graph_attr<-`() ``](https://r.igraph.org/reference/graph_attr-set.md)
  : Set all or some graph attributes
- [`graph_attr()`](https://r.igraph.org/reference/graph_attr.md) : Graph
  attributes of a graph
- [`graph_attr_names()`](https://r.igraph.org/reference/graph_attr_names.md)
  : List names of graph attributes
- [`igraph-attribute-combination`](https://r.igraph.org/reference/igraph-attribute-combination.md)
  [`attribute.combination`](https://r.igraph.org/reference/igraph-attribute-combination.md)
  : How igraph functions handle attributes when the graph changes
- [`` `$`( ``*`<igraph>`*`)`](https://r.igraph.org/reference/igraph-dollar.md)
  [`` `$<-`( ``*`<igraph>`*`)`](https://r.igraph.org/reference/igraph-dollar.md)
  : Getting and setting graph attributes, shortcut
- [`` `[[<-`( ``*`<igraph.vs>`*`)`](https://r.igraph.org/reference/igraph-vs-attributes.md)
  [`` `[<-`( ``*`<igraph.vs>`*`)`](https://r.igraph.org/reference/igraph-vs-attributes.md)
  [`` `$`( ``*`<igraph.vs>`*`)`](https://r.igraph.org/reference/igraph-vs-attributes.md)
  [`` `$<-`( ``*`<igraph.vs>`*`)`](https://r.igraph.org/reference/igraph-vs-attributes.md)
  [`` `V<-`() ``](https://r.igraph.org/reference/igraph-vs-attributes.md)
  : Query or set attributes of the vertices in a vertex sequence
- [`set_edge_attr()`](https://r.igraph.org/reference/set_edge_attr.md) :
  Set edge attributes
- [`set_graph_attr()`](https://r.igraph.org/reference/set_graph_attr.md)
  : Set a graph attribute
- [`set_vertex_attr()`](https://r.igraph.org/reference/set_vertex_attr.md)
  : Set vertex attributes
- [`set_vertex_attrs()`](https://r.igraph.org/reference/set_vertex_attrs.md)
  : Set multiple vertex attributes
- [`` `vertex_attr<-`() ``](https://r.igraph.org/reference/vertex_attr-set.md)
  : Set one or more vertex attributes
- [`vertex_attr()`](https://r.igraph.org/reference/vertex_attr.md) :
  Query vertex attributes of a graph
- [`vertex_attr_names()`](https://r.igraph.org/reference/vertex_attr_names.md)
  : List names of vertex attributes

## Vertex and edge sequences

- [`E()`](https://r.igraph.org/reference/E.md) : Edges of a graph
- [`V()`](https://r.igraph.org/reference/V.md) : Vertices of a graph
- [`as_ids()`](https://r.igraph.org/reference/as_ids.md) : Convert a
  vertex or edge sequence to an ordinary vector
- [`` `[[<-`( ``*`<igraph.es>`*`)`](https://r.igraph.org/reference/igraph-es-attributes.md)
  [`` `[<-`( ``*`<igraph.es>`*`)`](https://r.igraph.org/reference/igraph-es-attributes.md)
  [`` `$`( ``*`<igraph.es>`*`)`](https://r.igraph.org/reference/igraph-es-attributes.md)
  [`` `$<-`( ``*`<igraph.es>`*`)`](https://r.igraph.org/reference/igraph-es-attributes.md)
  [`` `E<-`() ``](https://r.igraph.org/reference/igraph-es-attributes.md)
  : Query or set attributes of the edges in an edge sequence
- [`` `[`( ``*`<igraph.es>`*`)`](https://r.igraph.org/reference/igraph-es-indexing.md)
  : Indexing edge sequences
- [`` `[[`( ``*`<igraph.es>`*`)`](https://r.igraph.org/reference/igraph-es-indexing2.md)
  : Select edges and show their metadata
- [`` `[[<-`( ``*`<igraph.vs>`*`)`](https://r.igraph.org/reference/igraph-vs-attributes.md)
  [`` `[<-`( ``*`<igraph.vs>`*`)`](https://r.igraph.org/reference/igraph-vs-attributes.md)
  [`` `$`( ``*`<igraph.vs>`*`)`](https://r.igraph.org/reference/igraph-vs-attributes.md)
  [`` `$<-`( ``*`<igraph.vs>`*`)`](https://r.igraph.org/reference/igraph-vs-attributes.md)
  [`` `V<-`() ``](https://r.igraph.org/reference/igraph-vs-attributes.md)
  : Query or set attributes of the vertices in a vertex sequence
- [`` `[`( ``*`<igraph.vs>`*`)`](https://r.igraph.org/reference/igraph-vs-indexing.md)
  : Indexing vertex sequences
- [`` `[[`( ``*`<igraph.vs>`*`)`](https://r.igraph.org/reference/igraph-vs-indexing2.md)
  : Select vertices and show their metadata
- [`print(`*`<igraph.es>`*`)`](https://r.igraph.org/reference/print.igraph.es.md)
  : Print an edge sequence to the screen
- [`print(`*`<igraph.vs>`*`)`](https://r.igraph.org/reference/print.igraph.vs.md)
  : Show a vertex sequence on the screen
- [`c(`*`<igraph.es>`*`)`](https://r.igraph.org/reference/c.igraph.es.md)
  : Concatenate edge sequences
- [`c(`*`<igraph.vs>`*`)`](https://r.igraph.org/reference/c.igraph.vs.md)
  : Concatenate vertex sequences
- [`difference(`*`<igraph.es>`*`)`](https://r.igraph.org/reference/difference.igraph.es.md)
  : Difference of edge sequences
- [`difference(`*`<igraph.vs>`*`)`](https://r.igraph.org/reference/difference.igraph.vs.md)
  : Difference of vertex sequences
- [`intersection(`*`<igraph.es>`*`)`](https://r.igraph.org/reference/intersection.igraph.es.md)
  : Intersection of edge sequences
- [`intersection(`*`<igraph.vs>`*`)`](https://r.igraph.org/reference/intersection.igraph.vs.md)
  : Intersection of vertex sequences
- [`rev(`*`<igraph.es>`*`)`](https://r.igraph.org/reference/rev.igraph.es.md)
  : Reverse the order in an edge sequence
- [`rev(`*`<igraph.vs>`*`)`](https://r.igraph.org/reference/rev.igraph.vs.md)
  : Reverse the order in a vertex sequence
- [`union(`*`<igraph.es>`*`)`](https://r.igraph.org/reference/union.igraph.es.md)
  : Union of edge sequences
- [`union(`*`<igraph.vs>`*`)`](https://r.igraph.org/reference/union.igraph.vs.md)
  : Union of vertex sequences
- [`unique(`*`<igraph.es>`*`)`](https://r.igraph.org/reference/unique.igraph.es.md)
  : Remove duplicate edges from an edge sequence
- [`unique(`*`<igraph.vs>`*`)`](https://r.igraph.org/reference/unique.igraph.vs.md)
  : Remove duplicate vertices from a vertex sequence

## Utilities

### Graph ID, comparison, name, weight

- [`graph_id()`](https://r.igraph.org/reference/graph_id.md) : Get the
  id of a graph
- [`identical_graphs()`](https://r.igraph.org/reference/identical_graphs.md)
  : Decide if two graphs are identical
- [`is_igraph()`](https://r.igraph.org/reference/is_igraph.md) : Is this
  object an igraph graph?
- [`is_named()`](https://r.igraph.org/reference/is_named.md) : Named
  graphs
- [`is_weighted()`](https://r.igraph.org/reference/is_weighted.md) :
  Weighted graphs
- [`is_chordal()`](https://r.igraph.org/reference/is_chordal.md) :
  Chordality of a graph

### Conversion

- [`as.matrix(`*`<igraph>`*`)`](https://r.igraph.org/reference/as.matrix.igraph.md)
  : Convert igraph objects to adjacency or edge list matrices
- [`as_adj_list()`](https://r.igraph.org/reference/as_adj_list.md)
  [`as_adj_edge_list()`](https://r.igraph.org/reference/as_adj_list.md)
  : Adjacency lists
- [`as_adjacency_matrix()`](https://r.igraph.org/reference/as_adjacency_matrix.md)
  : Convert a graph to an adjacency matrix
- [`as_biadjacency_matrix()`](https://r.igraph.org/reference/as_biadjacency_matrix.md)
  : Bipartite adjacency matrix of a bipartite graph
- [`as_directed()`](https://r.igraph.org/reference/as_directed.md)
  [`as_undirected()`](https://r.igraph.org/reference/as_directed.md) :
  Convert between directed and undirected graphs
- [`as_edgelist()`](https://r.igraph.org/reference/as_edgelist.md) :
  Convert a graph to an edge list
- [`as_graphnel()`](https://r.igraph.org/reference/as_graphnel.md) :
  Convert igraph graphs to graphNEL objects from the graph package
- [`as_long_data_frame()`](https://r.igraph.org/reference/as_long_data_frame.md)
  : Convert a graph to a long data frame
- [`graph_from_adj_list()`](https://r.igraph.org/reference/graph_from_adj_list.md)
  : Create graphs from adjacency lists
- [`as_data_frame()`](https://r.igraph.org/reference/graph_from_data_frame.md)
  [`graph_from_data_frame()`](https://r.igraph.org/reference/graph_from_data_frame.md)
  [`from_data_frame()`](https://r.igraph.org/reference/graph_from_data_frame.md)
  : Creating igraph graphs from data frames or vice-versa
- [`graph_from_graphnel()`](https://r.igraph.org/reference/graph_from_graphnel.md)
  : Convert graphNEL objects from the graph package to igraph

### Env and data

- [`dot-data`](https://r.igraph.org/reference/dot-data.md)
  [`.data`](https://r.igraph.org/reference/dot-data.md)
  [`dot-env`](https://r.igraph.org/reference/dot-data.md)
  [`.env`](https://r.igraph.org/reference/dot-data.md) :

  `.data` and `.env` pronouns

### Printing

- [`head_print()`](https://r.igraph.org/reference/head_print.md) : Print
  the only the head of an R object
- [`indent_print()`](https://r.igraph.org/reference/indent_print.md) :
  Indent a printout
- [`print(`*`<igraph>`*`)`](https://r.igraph.org/reference/print.igraph.md)
  [`summary(`*`<igraph>`*`)`](https://r.igraph.org/reference/print.igraph.md)
  : Print graphs to the terminal
- [`is_printer_callback()`](https://r.igraph.org/reference/is_printer_callback.md)
  : Is this a printer callback?
- [`printer_callback()`](https://r.igraph.org/reference/printer_callback.md)
  : Create a printer callback function

### Latent position vector samplers

- [`sample_dirichlet()`](https://r.igraph.org/reference/sample_dirichlet.md)
  : Sample from a Dirichlet distribution
- [`sample_sphere_surface()`](https://r.igraph.org/reference/sample_sphere_surface.md)
  : Sample vectors uniformly from the surface of a sphere
- [`sample_sphere_volume()`](https://r.igraph.org/reference/sample_sphere_volume.md)
  : Sample vectors uniformly from the volume of a sphere

### Miscellaneous

- [`convex_hull()`](https://r.igraph.org/reference/convex_hull.md) :
  Convex hull of a set of vertices
- [`running_mean()`](https://r.igraph.org/reference/running_mean.md) :
  Running mean of a time series
- [`sample_seq()`](https://r.igraph.org/reference/sample_seq.md) :
  Sampling a random integer sequence
- [`fit_power_law()`](https://r.igraph.org/reference/fit_power_law.md) :
  Fitting a power-law distribution function to discrete data

### Low-level operations

- [`invalidate_cache()`](https://r.igraph.org/reference/invalidate_cache.md)
  : Invalidate the cache of a graph

## Structural properties

- [`bfs()`](https://r.igraph.org/reference/bfs.md) : Breadth-first
  search
- [`component_distribution()`](https://r.igraph.org/reference/components.md)
  [`largest_component()`](https://r.igraph.org/reference/components.md)
  [`components()`](https://r.igraph.org/reference/components.md)
  [`is_connected()`](https://r.igraph.org/reference/components.md)
  [`count_components()`](https://r.igraph.org/reference/components.md) :
  Connected components of a graph
- [`constraint()`](https://r.igraph.org/reference/constraint.md) :
  Burt's constraint
- [`coreness()`](https://r.igraph.org/reference/coreness.md) : K-core
  decomposition of graphs
- [`degree()`](https://r.igraph.org/reference/degree.md)
  [`max_degree()`](https://r.igraph.org/reference/degree.md)
  [`degree_distribution()`](https://r.igraph.org/reference/degree.md) :
  Degree and degree distribution of the vertices
- [`dfs()`](https://r.igraph.org/reference/dfs.md) : Depth-first search
- [`distance_table()`](https://r.igraph.org/reference/distances.md)
  [`mean_distance()`](https://r.igraph.org/reference/distances.md)
  [`distances()`](https://r.igraph.org/reference/distances.md)
  [`shortest_paths()`](https://r.igraph.org/reference/distances.md)
  [`all_shortest_paths()`](https://r.igraph.org/reference/distances.md)
  : Shortest (directed or undirected) paths between vertices
- [`edge_density()`](https://r.igraph.org/reference/edge_density.md) :
  Graph density
- [`connect()`](https://r.igraph.org/reference/ego.md)
  [`ego_size()`](https://r.igraph.org/reference/ego.md)
  [`neighborhood_size()`](https://r.igraph.org/reference/ego.md)
  [`ego()`](https://r.igraph.org/reference/ego.md)
  [`neighborhood()`](https://r.igraph.org/reference/ego.md)
  [`make_ego_graph()`](https://r.igraph.org/reference/ego.md)
  [`make_neighborhood_graph()`](https://r.igraph.org/reference/ego.md) :
  Neighborhood of graph vertices
- [`feedback_arc_set()`](https://r.igraph.org/reference/feedback_arc_set.md)
  : Finding a feedback arc set in a graph
- [`feedback_vertex_set()`](https://r.igraph.org/reference/feedback_vertex_set.md)
  **\[experimental\]** : Finding a feedback vertex set in a graph
- [`girth()`](https://r.igraph.org/reference/girth.md) : Girth of a
  graph
- [`is_acyclic()`](https://r.igraph.org/reference/is_acyclic.md) :
  Acyclic graphs
- [`is_dag()`](https://r.igraph.org/reference/is_dag.md) : Directed
  acyclic graphs
- [`k_shortest_paths()`](https://r.igraph.org/reference/k_shortest_paths.md)
  : Find the \\k\\ shortest paths between two vertices
- [`knn()`](https://r.igraph.org/reference/knn.md) : Average nearest
  neighbor degree
- [`is_matching()`](https://r.igraph.org/reference/matching.md)
  [`is_max_matching()`](https://r.igraph.org/reference/matching.md)
  [`max_bipartite_match()`](https://r.igraph.org/reference/matching.md)
  : Matching
- [`reciprocity()`](https://r.igraph.org/reference/reciprocity.md) :
  Reciprocity of graphs
- [`subcomponent()`](https://r.igraph.org/reference/subcomponent.md) :
  In- or out- component of a vertex
- [`subgraph()`](https://r.igraph.org/reference/subgraph.md)
  [`induced_subgraph()`](https://r.igraph.org/reference/subgraph.md)
  [`subgraph_from_edges()`](https://r.igraph.org/reference/subgraph.md)
  : Subgraph of a graph
- [`topo_sort()`](https://r.igraph.org/reference/topo_sort.md) :
  Topological sorting of vertices in a graph
- [`transitivity()`](https://r.igraph.org/reference/transitivity.md) :
  Transitivity of a graph
- [`unfold_tree()`](https://r.igraph.org/reference/unfold_tree.md) :
  Convert a general graph into a forest
- [`which_multiple()`](https://r.igraph.org/reference/which_multiple.md)
  [`any_multiple()`](https://r.igraph.org/reference/which_multiple.md)
  [`count_multiple()`](https://r.igraph.org/reference/which_multiple.md)
  [`which_loop()`](https://r.igraph.org/reference/which_multiple.md)
  [`any_loop()`](https://r.igraph.org/reference/which_multiple.md) :
  Find the multiple or loop edges in a graph
- [`which_mutual()`](https://r.igraph.org/reference/which_mutual.md) :
  Find mutual edges in a directed graph
- [`cocitation()`](https://r.igraph.org/reference/cocitation.md)
  [`bibcoupling()`](https://r.igraph.org/reference/cocitation.md) :
  Cocitation coupling
- [`similarity()`](https://r.igraph.org/reference/similarity.md) :
  Similarity measures of two vertices
- [`cohesive_blocks()`](https://r.igraph.org/reference/cohesive_blocks.md)
  [`length(`*`<cohesiveBlocks>`*`)`](https://r.igraph.org/reference/cohesive_blocks.md)
  [`blocks()`](https://r.igraph.org/reference/cohesive_blocks.md)
  [`graphs_from_cohesive_blocks()`](https://r.igraph.org/reference/cohesive_blocks.md)
  [`cohesion(`*`<cohesiveBlocks>`*`)`](https://r.igraph.org/reference/cohesive_blocks.md)
  [`hierarchy()`](https://r.igraph.org/reference/cohesive_blocks.md)
  [`parent()`](https://r.igraph.org/reference/cohesive_blocks.md)
  [`print(`*`<cohesiveBlocks>`*`)`](https://r.igraph.org/reference/cohesive_blocks.md)
  [`summary(`*`<cohesiveBlocks>`*`)`](https://r.igraph.org/reference/cohesive_blocks.md)
  [`plot(`*`<cohesiveBlocks>`*`)`](https://r.igraph.org/reference/cohesive_blocks.md)
  [`plot_hierarchy()`](https://r.igraph.org/reference/cohesive_blocks.md)
  [`export_pajek()`](https://r.igraph.org/reference/cohesive_blocks.md)
  [`max_cohesion()`](https://r.igraph.org/reference/cohesive_blocks.md)
  : Calculate Cohesive Blocks
- [`triangles()`](https://r.igraph.org/reference/count_triangles.md)
  [`count_triangles()`](https://r.igraph.org/reference/count_triangles.md)
  : Find triangles in graphs
- [`assortativity()`](https://r.igraph.org/reference/assortativity.md)
  [`assortativity_nominal()`](https://r.igraph.org/reference/assortativity.md)
  [`assortativity_degree()`](https://r.igraph.org/reference/assortativity.md)
  : Assortativity coefficient
- [`spectrum()`](https://r.igraph.org/reference/spectrum.md) :
  Eigenvalues and eigenvectors of the adjacency matrix of a graph

### Matrices

- [`laplacian_matrix()`](https://r.igraph.org/reference/laplacian_matrix.md)
  : Graph Laplacian
- [`as_adjacency_matrix()`](https://r.igraph.org/reference/as_adjacency_matrix.md)
  : Convert a graph to an adjacency matrix
- [`stochastic_matrix()`](https://r.igraph.org/reference/stochastic_matrix.md)
  : Stochastic matrix of a graph

### Chordal graphs

- [`is_chordal()`](https://r.igraph.org/reference/is_chordal.md) :
  Chordality of a graph
- [`max_cardinality()`](https://r.igraph.org/reference/max_cardinality.md)
  : Maximum cardinality search

### Triangles and transitivity

- [`triangles()`](https://r.igraph.org/reference/count_triangles.md)
  [`count_triangles()`](https://r.igraph.org/reference/count_triangles.md)
  : Find triangles in graphs
- [`transitivity()`](https://r.igraph.org/reference/transitivity.md) :
  Transitivity of a graph

### Paths

- [`all_simple_paths()`](https://r.igraph.org/reference/all_simple_paths.md)
  : List all simple paths from one source
- [`diameter()`](https://r.igraph.org/reference/diameter.md)
  [`get_diameter()`](https://r.igraph.org/reference/diameter.md)
  [`farthest_vertices()`](https://r.igraph.org/reference/diameter.md) :
  Diameter of a graph
- [`distance_table()`](https://r.igraph.org/reference/distances.md)
  [`mean_distance()`](https://r.igraph.org/reference/distances.md)
  [`distances()`](https://r.igraph.org/reference/distances.md)
  [`shortest_paths()`](https://r.igraph.org/reference/distances.md)
  [`all_shortest_paths()`](https://r.igraph.org/reference/distances.md)
  : Shortest (directed or undirected) paths between vertices
- [`eccentricity()`](https://r.igraph.org/reference/eccentricity.md) :
  Eccentricity of the vertices in a graph
- [`graph_center()`](https://r.igraph.org/reference/graph_center.md)
  **\[experimental\]** : Central vertices of a graph
- [`radius()`](https://r.igraph.org/reference/radius.md) : Radius of a
  graph

### Bipartite graphs

- [`bipartite_mapping()`](https://r.igraph.org/reference/bipartite_mapping.md)
  : Decide whether a graph is bipartite

- [`bipartite_projection()`](https://r.igraph.org/reference/bipartite_projection.md)
  [`bipartite_projection_size()`](https://r.igraph.org/reference/bipartite_projection.md)
  : Project a bipartite graph

- [`is_bipartite()`](https://r.igraph.org/reference/is_bipartite.md) :

  Checks whether the graph has a vertex attribute called `type`.

- [`make_bipartite_graph()`](https://r.igraph.org/reference/make_bipartite_graph.md)
  [`bipartite_graph()`](https://r.igraph.org/reference/make_bipartite_graph.md)
  : Create a bipartite graph

- [`graph_from_biadjacency_matrix()`](https://r.igraph.org/reference/graph_from_biadjacency_matrix.md)
  : Create graphs from a bipartite adjacency matrix

- [`as_data_frame()`](https://r.igraph.org/reference/graph_from_data_frame.md)
  [`graph_from_data_frame()`](https://r.igraph.org/reference/graph_from_data_frame.md)
  [`from_data_frame()`](https://r.igraph.org/reference/graph_from_data_frame.md)
  : Creating igraph graphs from data frames or vice-versa

### Efficiency

- [`global_efficiency()`](https://r.igraph.org/reference/global_efficiency.md)
  [`local_efficiency()`](https://r.igraph.org/reference/global_efficiency.md)
  [`average_local_efficiency()`](https://r.igraph.org/reference/global_efficiency.md)
  : Efficiency of a graph

### Similarity

- [`similarity()`](https://r.igraph.org/reference/similarity.md) :
  Similarity measures of two vertices

### Trees

- [`is_forest()`](https://r.igraph.org/reference/is_forest.md) : Decide
  whether a graph is a forest.
- [`is_tree()`](https://r.igraph.org/reference/is_tree.md) : Decide
  whether a graph is a tree.
- [`make_from_prufer()`](https://r.igraph.org/reference/make_from_prufer.md)
  [`from_prufer()`](https://r.igraph.org/reference/make_from_prufer.md)
  : Create an undirected tree graph from its Prüfer sequence
- [`sample_spanning_tree()`](https://r.igraph.org/reference/sample_spanning_tree.md)
  : Samples from the spanning trees of a graph randomly and uniformly
- [`to_prufer()`](https://r.igraph.org/reference/to_prufer.md) : Convert
  a tree graph to its Prüfer sequence
- [`mst()`](https://r.igraph.org/reference/mst.md) : Minimum spanning
  tree

### Structural queries

- [`adjacent_vertices()`](https://r.igraph.org/reference/adjacent_vertices.md)
  : Adjacent vertices of multiple vertices in a graph
- [`are_adjacent()`](https://r.igraph.org/reference/are_adjacent.md) :
  Are two vertices adjacent?
- [`ends()`](https://r.igraph.org/reference/ends.md) : Incident vertices
  of some graph edges
- [`get_edge_ids()`](https://r.igraph.org/reference/get_edge_ids.md) :
  Find the edge ids based on the incident vertices of the edges
- [`vcount()`](https://r.igraph.org/reference/gorder.md)
  [`gorder()`](https://r.igraph.org/reference/gorder.md) : Order (number
  of vertices) of a graph
- [`gsize()`](https://r.igraph.org/reference/gsize.md)
  [`ecount()`](https://r.igraph.org/reference/gsize.md) : The size of
  the graph (number of edges)
- [`head_of()`](https://r.igraph.org/reference/head_of.md) : Head of the
  edge(s) in a graph
- [`incident()`](https://r.igraph.org/reference/incident.md) : Incident
  edges of a vertex in a graph
- [`incident_edges()`](https://r.igraph.org/reference/incident_edges.md)
  : Incident edges of multiple vertices in a graph
- [`is_directed()`](https://r.igraph.org/reference/is_directed.md) :
  Check whether a graph is directed
- [`neighbors()`](https://r.igraph.org/reference/neighbors.md) :
  Neighboring (adjacent) vertices in a graph
- [`` `[`( ``*`<igraph>`*`)`](https://r.igraph.org/reference/sub-.igraph.md)
  : Query and manipulate a graph as it were an adjacency matrix
- [`` `[[`( ``*`<igraph>`*`)`](https://r.igraph.org/reference/sub-sub-.igraph.md)
  : Query and manipulate a graph as it were an adjacency list
- [`tail_of()`](https://r.igraph.org/reference/tail_of.md) : Tails of
  the edge(s) in a graph

### ARPACK eigenvector calculation

- [`arpack_defaults()`](https://r.igraph.org/reference/arpack.md)
  [`arpack()`](https://r.igraph.org/reference/arpack.md) : ARPACK
  eigenvector calculation

### Centrality measures

- [`alpha_centrality()`](https://r.igraph.org/reference/alpha_centrality.md)
  : Find Bonacich alpha centrality scores of network positions
- [`betweenness()`](https://r.igraph.org/reference/betweenness.md)
  [`edge_betweenness()`](https://r.igraph.org/reference/betweenness.md)
  : Vertex and edge betweenness centrality
- [`closeness()`](https://r.igraph.org/reference/closeness.md) :
  Closeness centrality of vertices
- [`diversity()`](https://r.igraph.org/reference/diversity.md) : Graph
  diversity
- [`eigen_centrality()`](https://r.igraph.org/reference/eigen_centrality.md)
  : Eigenvector centrality of vertices
- [`harmonic_centrality()`](https://r.igraph.org/reference/harmonic_centrality.md)
  : Harmonic centrality of vertices
- [`hits_scores()`](https://r.igraph.org/reference/hits_scores.md) :
  Kleinberg's hub and authority centrality scores.
- [`authority_score()`](https://r.igraph.org/reference/hub_score.md)
  [`hub_score()`](https://r.igraph.org/reference/hub_score.md) :
  Kleinberg's authority centrality scores.
- [`page_rank()`](https://r.igraph.org/reference/page_rank.md) : The
  Page Rank algorithm
- [`power_centrality()`](https://r.igraph.org/reference/power_centrality.md)
  : Find Bonacich Power Centrality Scores of Network Positions
- [`spectrum()`](https://r.igraph.org/reference/spectrum.md) :
  Eigenvalues and eigenvectors of the adjacency matrix of a graph
- [`strength()`](https://r.igraph.org/reference/strength.md) : Strength
  or weighted vertex degree
- [`subgraph_centrality()`](https://r.igraph.org/reference/subgraph_centrality.md)
  : Find subgraph centrality scores of network positions

### Centralization

- [`centr_betw()`](https://r.igraph.org/reference/centr_betw.md) :
  Centralize a graph according to the betweenness of vertices
- [`centr_betw_tmax()`](https://r.igraph.org/reference/centr_betw_tmax.md)
  : Theoretical maximum for betweenness centralization
- [`centr_clo()`](https://r.igraph.org/reference/centr_clo.md) :
  Centralize a graph according to the closeness of vertices
- [`centr_clo_tmax()`](https://r.igraph.org/reference/centr_clo_tmax.md)
  : Theoretical maximum for closeness centralization
- [`centr_degree()`](https://r.igraph.org/reference/centr_degree.md) :
  Centralize a graph according to the degrees of vertices
- [`centr_degree_tmax()`](https://r.igraph.org/reference/centr_degree_tmax.md)
  : Theoretical maximum for degree centralization
- [`centr_eigen()`](https://r.igraph.org/reference/centr_eigen.md) :
  Centralize a graph according to the eigenvector centrality of vertices
- [`centr_eigen_tmax()`](https://r.igraph.org/reference/centr_eigen_tmax.md)
  : Theoretical maximum for eigenvector centralization
- [`centralize()`](https://r.igraph.org/reference/centralize.md) :
  Centralization of a graph

### Scan statistics

- [`local_scan()`](https://r.igraph.org/reference/local_scan.md) :
  Compute local scan statistics on graphs
- [`scan_stat()`](https://r.igraph.org/reference/scan_stat.md) : Scan
  statistics on a time series of graphs

## Graph motifs and subgraphs

- [`count_motifs()`](https://r.igraph.org/reference/count_motifs.md) :
  Graph motifs
- [`dyad_census()`](https://r.igraph.org/reference/dyad_census.md) :
  Dyad census of a graph
- [`motifs()`](https://r.igraph.org/reference/motifs.md) : Graph motifs
- [`sample_motifs()`](https://r.igraph.org/reference/sample_motifs.md) :
  Graph motifs
- [`triad_census()`](https://r.igraph.org/reference/triad_census.md) :
  Triad census, subgraphs with three vertices

## Graph isomorphism

- [`canonical_permutation()`](https://r.igraph.org/reference/canonical_permutation.md)
  : Canonical permutation of a graph
- [`count_isomorphisms()`](https://r.igraph.org/reference/count_isomorphisms.md)
  : Count the number of isomorphic mappings between two graphs
- [`count_subgraph_isomorphisms()`](https://r.igraph.org/reference/count_subgraph_isomorphisms.md)
  : Count the isomorphic mappings between a graph and the subgraphs of
  another graph
- [`graph_from_isomorphism_class()`](https://r.igraph.org/reference/graph_from_isomorphism_class.md)
  : Create a graph from an isomorphism class
- [`isomorphic()`](https://r.igraph.org/reference/isomorphic.md)
  [`is_isomorphic_to()`](https://r.igraph.org/reference/isomorphic.md) :
  Decide if two graphs are isomorphic
- [`isomorphism_class()`](https://r.igraph.org/reference/isomorphism_class.md)
  : Isomorphism class of a graph
- [`isomorphisms()`](https://r.igraph.org/reference/isomorphisms.md) :
  Calculate all isomorphic mappings between the vertices of two graphs
- [`subgraph_isomorphic()`](https://r.igraph.org/reference/subgraph_isomorphic.md)
  [`is_subgraph_isomorphic_to()`](https://r.igraph.org/reference/subgraph_isomorphic.md)
  : Decide if a graph is subgraph isomorphic to another one
- [`subgraph_isomorphisms()`](https://r.igraph.org/reference/subgraph_isomorphisms.md)
  : All isomorphic mappings between a graph and subgraphs of another
  graph
- [`simplify()`](https://r.igraph.org/reference/simplify.md)
  [`is_simple()`](https://r.igraph.org/reference/simplify.md)
  [`simplify_and_colorize()`](https://r.igraph.org/reference/simplify.md)
  : Simple graphs
- [`automorphism_group()`](https://r.igraph.org/reference/automorphism_group.md)
  : Generating set of the automorphism group of a graph
- [`count_automorphisms()`](https://r.igraph.org/reference/count_automorphisms.md)
  : Number of automorphisms
- [`permute()`](https://r.igraph.org/reference/permute.md) : Permute the
  vertices of a graph

## Graph matching

- [`match_vertices()`](https://r.igraph.org/reference/match_vertices.md)
  : Match Graphs given a seeding of vertex correspondences

## Maximum flow and connectivity

- [`dominator_tree()`](https://r.igraph.org/reference/dominator_tree.md)
  : Dominator tree
- [`edge_connectivity()`](https://r.igraph.org/reference/edge_connectivity.md)
  [`edge_disjoint_paths()`](https://r.igraph.org/reference/edge_connectivity.md)
  [`adhesion()`](https://r.igraph.org/reference/edge_connectivity.md) :
  Edge connectivity
- [`is_min_separator()`](https://r.igraph.org/reference/is_min_separator.md)
  : Minimal vertex separators
- [`is_separator()`](https://r.igraph.org/reference/is_separator.md) :
  Check whether removing this set of vertices would disconnect the
  graph.
- [`max_flow()`](https://r.igraph.org/reference/max_flow.md) : Maximum
  flow in a graph
- [`min_cut()`](https://r.igraph.org/reference/min_cut.md) : Minimum cut
  in a graph
- [`min_separators()`](https://r.igraph.org/reference/min_separators.md)
  : Minimum size vertex separators
- [`min_st_separators()`](https://r.igraph.org/reference/min_st_separators.md)
  : Minimum size vertex separators
- [`st_cuts()`](https://r.igraph.org/reference/st_cuts.md) : List all
  (s,t)-cuts of a graph
- [`st_min_cuts()`](https://r.igraph.org/reference/st_min_cuts.md) :
  List all minimum \\(s,t)\\-cuts of a graph
- [`vertex_connectivity()`](https://r.igraph.org/reference/vertex_connectivity.md)
  [`vertex_disjoint_paths()`](https://r.igraph.org/reference/vertex_connectivity.md)
  [`cohesion(`*`<igraph>`*`)`](https://r.igraph.org/reference/vertex_connectivity.md)
  : Vertex connectivity

## Cliques

- [`cliques()`](https://r.igraph.org/reference/cliques.md)
  [`largest_cliques()`](https://r.igraph.org/reference/cliques.md)
  [`max_cliques()`](https://r.igraph.org/reference/cliques.md)
  [`count_max_cliques()`](https://r.igraph.org/reference/cliques.md)
  [`clique_num()`](https://r.igraph.org/reference/cliques.md)
  [`largest_weighted_cliques()`](https://r.igraph.org/reference/cliques.md)
  [`weighted_clique_num()`](https://r.igraph.org/reference/cliques.md)
  [`clique_size_counts()`](https://r.igraph.org/reference/cliques.md)
  [`is_clique()`](https://r.igraph.org/reference/cliques.md) : Functions
  to find cliques, i.e. complete subgraphs in a graph
- [`is_complete()`](https://r.igraph.org/reference/is_complete.md) : Is
  this a complete graph?
- [`ivs()`](https://r.igraph.org/reference/ivs.md)
  [`largest_ivs()`](https://r.igraph.org/reference/ivs.md)
  [`max_ivs()`](https://r.igraph.org/reference/ivs.md)
  [`ivs_size()`](https://r.igraph.org/reference/ivs.md)
  [`independence_number()`](https://r.igraph.org/reference/ivs.md)
  [`is_ivs()`](https://r.igraph.org/reference/ivs.md) : Independent
  vertex sets
- [`weighted_cliques()`](https://r.igraph.org/reference/weighted_cliques.md)
  : Functions to find weighted cliques, i.e. vertex-weighted complete
  subgraphs in a graph
- [`graphlet_basis()`](https://r.igraph.org/reference/graphlet_basis.md)
  [`graphlet_proj()`](https://r.igraph.org/reference/graphlet_basis.md)
  [`graphlets()`](https://r.igraph.org/reference/graphlet_basis.md) :
  Graphlet decomposition of a graph

## Community detection

- [`as_membership()`](https://r.igraph.org/reference/as_membership.md) :
  Declare a numeric vector as a membership vector
- [`cluster_edge_betweenness()`](https://r.igraph.org/reference/cluster_edge_betweenness.md)
  : Community structure detection based on edge betweenness
- [`cluster_fast_greedy()`](https://r.igraph.org/reference/cluster_fast_greedy.md)
  : Community structure via greedy optimization of modularity
- [`cluster_fluid_communities()`](https://r.igraph.org/reference/cluster_fluid_communities.md)
  : Community detection algorithm based on interacting fluids
- [`cluster_infomap()`](https://r.igraph.org/reference/cluster_infomap.md)
  : Infomap community finding
- [`cluster_label_prop()`](https://r.igraph.org/reference/cluster_label_prop.md)
  : Finding communities based on propagating labels
- [`cluster_leading_eigen()`](https://r.igraph.org/reference/cluster_leading_eigen.md)
  : Community structure detecting based on the leading eigenvector of
  the community matrix
- [`cluster_leiden()`](https://r.igraph.org/reference/cluster_leiden.md)
  : Finding community structure of a graph using the Leiden algorithm of
  Traag, van Eck & Waltman.
- [`cluster_louvain()`](https://r.igraph.org/reference/cluster_louvain.md)
  : Finding community structure by multi-level optimization of
  modularity
- [`cluster_optimal()`](https://r.igraph.org/reference/cluster_optimal.md)
  : Optimal community structure
- [`cluster_spinglass()`](https://r.igraph.org/reference/cluster_spinglass.md)
  : Finding communities in graphs based on statistical meachanics
- [`cluster_walktrap()`](https://r.igraph.org/reference/cluster_walktrap.md)
  : Community structure via short random walks
- [`membership()`](https://r.igraph.org/reference/communities.md)
  [`print(`*`<communities>`*`)`](https://r.igraph.org/reference/communities.md)
  [`modularity(`*`<communities>`*`)`](https://r.igraph.org/reference/communities.md)
  [`length(`*`<communities>`*`)`](https://r.igraph.org/reference/communities.md)
  [`sizes()`](https://r.igraph.org/reference/communities.md)
  [`algorithm()`](https://r.igraph.org/reference/communities.md)
  [`merges()`](https://r.igraph.org/reference/communities.md)
  [`crossing()`](https://r.igraph.org/reference/communities.md)
  [`code_len()`](https://r.igraph.org/reference/communities.md)
  [`is_hierarchical()`](https://r.igraph.org/reference/communities.md)
  [`as.dendrogram(`*`<communities>`*`)`](https://r.igraph.org/reference/communities.md)
  [`as.hclust(`*`<communities>`*`)`](https://r.igraph.org/reference/communities.md)
  [`cut_at()`](https://r.igraph.org/reference/communities.md)
  [`show_trace()`](https://r.igraph.org/reference/communities.md)
  [`plot(`*`<communities>`*`)`](https://r.igraph.org/reference/communities.md)
  [`communities()`](https://r.igraph.org/reference/communities.md) :
  Functions to deal with the result of network community detection
- [`compare()`](https://r.igraph.org/reference/compare.md) : Compares
  community structures using various metrics
- [`groups()`](https://r.igraph.org/reference/groups.md) : Groups of a
  vertex partitioning
- [`make_clusters()`](https://r.igraph.org/reference/make_clusters.md) :
  Creates a communities object.
- [`modularity(`*`<igraph>`*`)`](https://r.igraph.org/reference/modularity.igraph.md)
  [`modularity_matrix()`](https://r.igraph.org/reference/modularity.igraph.md)
  : Modularity of a community structure of a graph
- [`plot_dendrogram()`](https://r.igraph.org/reference/plot_dendrogram.communities.md)
  : Community structure dendrogram plots
- [`split_join_distance()`](https://r.igraph.org/reference/split_join_distance.md)
  : Split-join distance of two community structures
- [`voronoi_cells()`](https://r.igraph.org/reference/voronoi_cells.md)
  **\[experimental\]** : Voronoi partitioning of a graph

## Graph cycles

- [`feedback_arc_set()`](https://r.igraph.org/reference/feedback_arc_set.md)
  : Finding a feedback arc set in a graph
- [`feedback_vertex_set()`](https://r.igraph.org/reference/feedback_vertex_set.md)
  **\[experimental\]** : Finding a feedback vertex set in a graph
- [`find_cycle()`](https://r.igraph.org/reference/find_cycle.md)
  **\[experimental\]** : Finds a cycle in a graph, if there is one
- [`girth()`](https://r.igraph.org/reference/girth.md) : Girth of a
  graph
- [`has_eulerian_path()`](https://r.igraph.org/reference/has_eulerian_path.md)
  [`has_eulerian_cycle()`](https://r.igraph.org/reference/has_eulerian_path.md)
  [`eulerian_path()`](https://r.igraph.org/reference/has_eulerian_path.md)
  [`eulerian_cycle()`](https://r.igraph.org/reference/has_eulerian_path.md)
  : Find Eulerian paths or cycles in a graph
- [`is_acyclic()`](https://r.igraph.org/reference/is_acyclic.md) :
  Acyclic graphs
- [`is_dag()`](https://r.igraph.org/reference/is_dag.md) : Directed
  acyclic graphs
- [`simple_cycles()`](https://r.igraph.org/reference/simple_cycles.md)
  **\[experimental\]** : Finds all simple cycles in a graph.

## Connected components

- [`articulation_points()`](https://r.igraph.org/reference/articulation_points.md)
  [`bridges()`](https://r.igraph.org/reference/articulation_points.md) :
  Articulation points and bridges of a graph
- [`biconnected_components()`](https://r.igraph.org/reference/biconnected_components.md)
  : Biconnected components
- [`component_distribution()`](https://r.igraph.org/reference/components.md)
  [`largest_component()`](https://r.igraph.org/reference/components.md)
  [`components()`](https://r.igraph.org/reference/components.md)
  [`is_connected()`](https://r.igraph.org/reference/components.md)
  [`count_components()`](https://r.igraph.org/reference/components.md) :
  Connected components of a graph
- [`decompose()`](https://r.igraph.org/reference/decompose.md) :
  Decompose a graph into components
- [`is_biconnected()`](https://r.igraph.org/reference/is_biconnected.md)
  **\[experimental\]** : Check biconnectedness

## Spectral embedding

- [`dim_select()`](https://r.igraph.org/reference/dim_select.md) :
  Dimensionality selection for singular values using profile likelihood.
- [`embed_adjacency_matrix()`](https://r.igraph.org/reference/embed_adjacency_matrix.md)
  : Spectral Embedding of Adjacency Matrices
- [`embed_laplacian_matrix()`](https://r.igraph.org/reference/embed_laplacian_matrix.md)
  : Spectral Embedding of the Laplacian of a Graph

## Hierarchical random graphs

- [`consensus_tree()`](https://r.igraph.org/reference/consensus_tree.md)
  : Create a consensus tree from several hierarchical random graph
  models
- [`fit_hrg()`](https://r.igraph.org/reference/fit_hrg.md) : Fit a
  hierarchical random graph model
- [`hrg-methods`](https://r.igraph.org/reference/hrg-methods.md) :
  Hierarchical random graphs
- [`hrg()`](https://r.igraph.org/reference/hrg.md) : Create a
  hierarchical random graph from an igraph graph
- [`hrg_tree()`](https://r.igraph.org/reference/hrg_tree.md) : Create an
  igraph graph from a hierarchical random graph model
- [`predict_edges()`](https://r.igraph.org/reference/predict_edges.md) :
  Predict edges based on a hierarchical random graph model
- [`print(`*`<igraphHRG>`*`)`](https://r.igraph.org/reference/print.igraphHRG.md)
  : Print a hierarchical random graph model to the screen
- [`print(`*`<igraphHRGConsensus>`*`)`](https://r.igraph.org/reference/print.igraphHRGConsensus.md)
  : Print a hierarchical random graph consensus tree to the screen
- [`sample_hrg()`](https://r.igraph.org/reference/sample_hrg.md) :
  Sample from a hierarchical random graph model

## Graphical degree sequences

- [`is_degseq()`](https://r.igraph.org/reference/is_degseq.md) : Check
  if a degree sequence is valid for a multi-graph
- [`is_graphical()`](https://r.igraph.org/reference/is_graphical.md) :
  Is a degree sequence graphical?

## Processes on graphs

- [`plot(`*`<sir>`*`)`](https://r.igraph.org/reference/plot.sir.md) :
  Plotting the results on multiple SIR model runs
- [`time_bins()`](https://r.igraph.org/reference/sir.md)
  [`median(`*`<sir>`*`)`](https://r.igraph.org/reference/sir.md)
  [`quantile(`*`<sir>`*`)`](https://r.igraph.org/reference/sir.md)
  [`sir()`](https://r.igraph.org/reference/sir.md) : SIR model on graphs
- [`random_walk()`](https://r.igraph.org/reference/random_walk.md)
  [`random_edge_walk()`](https://r.igraph.org/reference/random_walk.md)
  : Random walk on a graph

## I/O read/write files

- [`graph_from_graphdb()`](https://r.igraph.org/reference/graph_from_graphdb.md)
  : Load a graph from the graph database for testing graph isomorphism.
- [`read_graph()`](https://r.igraph.org/reference/read_graph.md) :
  Reading foreign file formats
- [`write_graph()`](https://r.igraph.org/reference/write_graph.md) :
  Writing the graph to a file in some format

## Interactive functions

- [`tkplot()`](https://r.igraph.org/reference/tkplot.md)
  [`tk_close()`](https://r.igraph.org/reference/tkplot.md)
  [`tk_off()`](https://r.igraph.org/reference/tkplot.md)
  [`tk_fit()`](https://r.igraph.org/reference/tkplot.md)
  [`tk_center()`](https://r.igraph.org/reference/tkplot.md)
  [`tk_reshape()`](https://r.igraph.org/reference/tkplot.md)
  [`tk_postscript()`](https://r.igraph.org/reference/tkplot.md)
  [`tk_coords()`](https://r.igraph.org/reference/tkplot.md)
  [`tk_set_coords()`](https://r.igraph.org/reference/tkplot.md)
  [`tk_rotate()`](https://r.igraph.org/reference/tkplot.md)
  [`tk_canvas()`](https://r.igraph.org/reference/tkplot.md) :
  Interactive plotting of graphs
- [`console()`](https://r.igraph.org/reference/console.md) : The igraph
  console

## Versions

- [`graph_version()`](https://r.igraph.org/reference/graph_version.md) :
  igraph data structure versions
- [`upgrade_graph()`](https://r.igraph.org/reference/upgrade_graph.md) :
  igraph data structure versions

## Experimental functions

- [`feedback_vertex_set()`](https://r.igraph.org/reference/feedback_vertex_set.md)
  **\[experimental\]** : Finding a feedback vertex set in a graph
- [`find_cycle()`](https://r.igraph.org/reference/find_cycle.md)
  **\[experimental\]** : Finds a cycle in a graph, if there is one
- [`graph_center()`](https://r.igraph.org/reference/graph_center.md)
  **\[experimental\]** : Central vertices of a graph
- [`is_biconnected()`](https://r.igraph.org/reference/is_biconnected.md)
  **\[experimental\]** : Check biconnectedness
- [`realize_bipartite_degseq()`](https://r.igraph.org/reference/realize_bipartite_degseq.md)
  **\[experimental\]** : Creating a bipartite graph from two degree
  sequences, deterministically
- [`sample_chung_lu()`](https://r.igraph.org/reference/sample_chung_lu.md)
  [`chung_lu()`](https://r.igraph.org/reference/sample_chung_lu.md)
  **\[experimental\]** : Random graph with given expected degrees
- [`simple_cycles()`](https://r.igraph.org/reference/simple_cycles.md)
  **\[experimental\]** : Finds all simple cycles in a graph.
- [`voronoi_cells()`](https://r.igraph.org/reference/voronoi_cells.md)
  **\[experimental\]** : Voronoi partitioning of a graph
