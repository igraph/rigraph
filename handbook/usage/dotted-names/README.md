# Dotted function names

The deprecated function names with dots, such as `graph.adjacency()`, and the snake_case names to call instead.

**The table is the code's.**
Each row comes from the `lifecycle::deprecate_*()` call through which a function in `R/` deprecates itself,
or from a dotted alias bound to such a function.
After a deprecation changes, `Rscript tools/dotted-names.R`, run from the package root, rewrites the table.
In the State column, a deprecated function still works and warns.
A soft-deprecated one warns only when called from the global environment or a test,
and a defunct one throws an error that names the replacement.
"Deprecated in" is the version the call stamps into that message.

**Not listed.**
Exported dotted names missing from the table, such as the S3 method `print.igraph()`, call no deprecation and keep working.
A name removed from `R/`, such as `get.edge()`, leaves the table with it, and `NEWS.md` records the removal.

<!-- BEGIN GENERATED: tools/dotted-names.R -->

| Dotted name | Use instead | State | Deprecated in |
|---|---|---|---|
| `add.edges()` | `add_edges()` | deprecated | 2.0.0 |
| `add.vertex.shape()` | `add_shape()` | deprecated | 2.0.0 |
| `add.vertices()` | `add_vertices()` | deprecated | 2.0.0 |
| `adjacent.triangles()` | `count_triangles()` | deprecated | 2.0.0 |
| `aging.ba.game()` | `sample_pa_age()` | deprecated | 2.0.0 |
| `aging.barabasi.game()` | `sample_pa_age()` | deprecated | 2.0.0 |
| `aging.prefatt.game()` | `sample_pa_age()` | deprecated | 2.0.0 |
| `alpha.centrality()` | `alpha_centrality()` | deprecated | 2.0.0 |
| `are.connected()` | `are_adjacent()` | deprecated | 2.0.0 |
| `articulation.points()` | `articulation_points()` | deprecated | 2.0.0 |
| `as.directed()` | `as_directed()` | deprecated | 2.1.0 |
| `as.undirected()` | `as_undirected()` | deprecated | 2.1.0 |
| `assortativity.degree()` | `assortativity_degree()` | deprecated | 2.0.0 |
| `assortativity.nominal()` | `assortativity_nominal()` | deprecated | 2.0.0 |
| `asymmetric.preference.game()` | `sample_asym_pref()` | deprecated | 2.0.0 |
| `authority.score()` | `hits_scores()` | defunct | 2.0.0 |
| `autocurve.edges()` | `curve_multiple()` | deprecated | 2.0.0 |
| `average.path.length()` | `mean_distance()` | deprecated | 2.0.0 |
| `ba.game()` | `sample_pa()` | deprecated | 2.0.0 |
| `barabasi.game()` | `sample_pa()` | deprecated | 2.0.0 |
| `betweenness.estimate()` | `betweenness()` with the cutoff argument | deprecated | 1.6.0 |
| `biconnected.components()` | `biconnected_components()` | deprecated | 2.0.0 |
| `bipartite.mapping()` | `bipartite_mapping()` | deprecated | 2.0.0 |
| `bipartite.projection()` | `bipartite_projection()` | deprecated | 2.0.0 |
| `bipartite.projection.size()` | `bipartite_projection_size()` | deprecated | 2.0.0 |
| `bipartite.random.game()` | `sample_bipartite_gnp()` or `sample_bipartite_gnm()` | defunct | 2.0.0 |
| `callaway.traits.game()` | `sample_traits_callaway()` | deprecated | 2.0.0 |
| `canonical.permutation()` | `canonical_permutation()` | deprecated | 2.0.0 |
| `centralization.betweenness()` | `centr_betw()` | deprecated | 2.0.0 |
| `centralization.betweenness.tmax()` | `centr_betw_tmax()` | deprecated | 2.0.0 |
| `centralization.closeness()` | `centr_clo()` | deprecated | 2.0.0 |
| `centralization.closeness.tmax()` | `centr_clo_tmax()` | deprecated | 2.0.0 |
| `centralization.degree()` | `centr_degree()` | deprecated | 2.0.0 |
| `centralization.degree.tmax()` | `centr_degree_tmax()` | deprecated | 2.0.0 |
| `centralization.evcent()` | `centr_eigen()` | deprecated | 2.0.0 |
| `centralization.evcent.tmax()` | `centr_eigen_tmax()` | deprecated | 2.0.0 |
| `centralize.scores()` | `centralize()` | deprecated | 2.0.0 |
| `cited.type.game()` | `sample_cit_types()` | deprecated | 2.0.0 |
| `citing.cited.type.game()` | `sample_cit_cit_types()` | deprecated | 2.0.0 |
| `clique.number()` | `clique_num()` | deprecated | 2.0.0 |
| `closeness.estimate()` | `closeness()` with the cutoff argument | deprecated | 1.6.0 |
| `cluster.distribution()` | `component_distribution()` | deprecated | 2.0.0 |
| `code.length()` | `code_len()` | deprecated | 2.0.0 |
| `cohesive.blocks()` | `cohesive_blocks()` | deprecated | 2.0.0 |
| `connect.neighborhood()` | `connect()` | deprecated | 2.0.0 |
| `contract.vertices()` | `contract()` | deprecated | 2.0.0 |
| `convex.hull()` | `convex_hull()` | deprecated | 2.0.0 |
| `count.multiple()` | `count_multiple()` | deprecated | 2.0.0 |
| `create.communities()` | `make_clusters()` | deprecated | 2.0.0 |
| `decompose.graph()` | `decompose()` | deprecated | 2.0.0 |
| `degree.distribution()` | `degree_distribution()` | deprecated | 2.0.0 |
| `degree.sequence.game()` | `sample_degseq()` | deprecated | 2.0.0 |
| `delete.edges()` | `delete_edges()` | deprecated | 2.0.0 |
| `delete.vertices()` | `delete_vertices()` | deprecated | 2.0.0 |
| `dominator.tree()` | `dominator_tree()` | deprecated | 2.0.0 |
| `dyad.census()` | `dyad_census()` | deprecated | 2.0.0 |
| `edge.betweenness()` | `edge_betweenness()` | deprecated | 2.0.0 |
| `edge.betweenness.community()` | `cluster_edge_betweenness()` | deprecated | 2.0.0 |
| `edge.betweenness.estimate()` | `edge_betweenness()` with the cutoff argument | deprecated | 1.6.0 |
| `edge.connectivity()` | `edge_connectivity()` | deprecated | 2.0.0 |
| `edge.disjoint.paths()` | `edge_connectivity()` | deprecated | 2.0.0 |
| `erdos.renyi.game()` | `sample_gnp()` or `sample_gnm()` | deprecated | 0.8.0 |
| `establishment.game()` | `sample_traits()` | deprecated | 2.0.0 |
| `farthest.nodes()` | `farthest_vertices()` | deprecated | 2.0.0 |
| `fastgreedy.community()` | `cluster_fast_greedy()` | deprecated | 2.0.0 |
| `forest.fire.game()` | `sample_forestfire()` | deprecated | 2.0.0 |
| `get.adjacency()` | `as_adjacency_matrix()` | deprecated | 2.0.0 |
| `get.adjedgelist()` | `as_adj_edge_list()` | deprecated | 2.0.0 |
| `get.adjlist()` | `as_adj_list()` | deprecated | 2.0.0 |
| `get.all.shortest.paths()` | `all_shortest_paths()` | deprecated | 2.0.0 |
| `get.data.frame()` | `as_data_frame()` | deprecated | 2.0.0 |
| `get.diameter()` | `get_diameter()` | deprecated | 2.0.0 |
| `get.edge.attribute()` | `edge_attr()` | deprecated | 2.0.0 |
| `get.edge.ids()` | `get_edge_ids()` | deprecated | 2.1.0 |
| `get.edgelist()` | `as_edgelist()` | deprecated | 2.0.0 |
| `get.graph.attribute()` | `graph_attr()` | deprecated | 2.0.0 |
| `get.incidence()` | `as_biadjacency_matrix()` | deprecated | 2.0.0 |
| `get.shortest.paths()` | `shortest_paths()` | deprecated | 2.0.0 |
| `get.stochastic()` | `stochastic_matrix()` | deprecated | 2.0.0 |
| `get.vertex.attribute()` | `vertex_attr()` | deprecated | 2.0.0 |
| `graph.adhesion()` | `adhesion()` | deprecated | 2.0.0 |
| `graph.adjacency()` | `graph_from_adjacency_matrix()` | deprecated | 2.0.0 |
| `graph.adjlist()` | `graph_from_adj_list()` | deprecated | 2.0.0 |
| `graph.atlas()` | `graph_from_atlas()` | deprecated | 2.1.0 |
| `graph.automorphisms()` | `count_automorphisms()` | deprecated | 2.0.0 |
| `graph.bfs()` | `bfs()` | deprecated | 2.0.0 |
| `graph.bipartite()` | `make_bipartite_graph()` | deprecated | 2.1.0 |
| `graph.cohesion()` | `cohesion()` | deprecated | 2.0.0 |
| `graph.complementer()` | `complementer()` | deprecated | 2.0.0 |
| `graph.compose()` | `compose()` | deprecated | 2.0.0 |
| `graph.coreness()` | `coreness()` | deprecated | 2.0.0 |
| `graph.data.frame()` | `graph_from_data_frame()` | deprecated | 2.0.0 |
| `graph.de.bruijn()` | `make_de_bruijn_graph()` | deprecated | 2.1.0 |
| `graph.density()` | `edge_density()` | deprecated | 2.0.0 |
| `graph.dfs()` | `dfs()` | deprecated | 2.0.0 |
| `graph.difference()` | `difference()` | deprecated | 2.0.0 |
| `graph.disjoint.union()` | `disjoint_union()` | deprecated | 2.0.0 |
| `graph.diversity()` | `diversity()` | deprecated | 2.0.0 |
| `graph.edgelist()` | `graph_from_edgelist()` | deprecated | 2.0.0 |
| `graph.eigen()` | `spectrum()` | deprecated | 2.0.0 |
| `graph.empty()` | `make_empty_graph()` | deprecated | 2.1.0 |
| `graph.extended.chordal.ring()` | `make_chordal_ring()` | deprecated | 2.1.0 |
| `graph.famous()` | `make_graph()` | deprecated | 2.1.0 |
| `graph.formula()` | `graph_from_literal()` | deprecated | 2.1.0 |
| `graph.full()` | `make_full_graph()` | deprecated | 2.1.0 |
| `graph.full.bipartite()` | `make_full_bipartite_graph()` | deprecated | 2.1.0 |
| `graph.full.citation()` | `make_full_citation_graph()` | deprecated | 2.1.0 |
| `graph.graphdb()` | `graph_from_graphdb()` | deprecated | 2.0.0 |
| `graph.incidence()` | `graph_from_biadjacency_matrix()` | deprecated | 2.0.0 |
| `graph.intersection()` | `intersection()` | deprecated | 2.0.0 |
| `graph.isocreate()` | `graph_from_isomorphism_class()` | deprecated | 2.0.0 |
| `graph.kautz()` | `make_kautz_graph()` | deprecated | 2.1.0 |
| `graph.knn()` | `knn()` | deprecated | 2.0.0 |
| `graph.laplacian()` | `laplacian_matrix()` | deprecated | 2.0.0 |
| `graph.lattice()` | `make_lattice()` | deprecated | 2.1.0 |
| `graph.lcf()` | `graph_from_lcf()` | deprecated | 2.1.0 |
| `graph.maxflow()` | `max_flow()` | deprecated | 2.0.0 |
| `graph.mincut()` | `min_cut()` | deprecated | 2.0.0 |
| `graph.motifs()` | `motifs()` | deprecated | 2.0.0 |
| `graph.motifs.est()` | `sample_motifs()` | deprecated | 2.0.0 |
| `graph.motifs.no()` | `count_motifs()` | deprecated | 2.0.0 |
| `graph.neighborhood()` | `make_ego_graph()` | deprecated | 2.0.0 |
| `graph.ring()` | `make_ring()` | deprecated | 2.1.0 |
| `graph.star()` | `make_star()` | deprecated | 2.1.0 |
| `graph.strength()` | `strength()` | deprecated | 2.0.0 |
| `graph.tree()` | `make_tree()` | deprecated | 2.1.0 |
| `graph.union()` | `union.igraph()` | deprecated | 2.0.0 |
| `graphlets.candidate.basis()` | `graphlet_basis()` | deprecated | 2.0.0 |
| `graphlets.project()` | `graphlet_proj()` | deprecated | 2.0.0 |
| `grg.game()` | `sample_grg()` | deprecated | 2.0.0 |
| `growing.random.game()` | `sample_growing()` | deprecated | 2.0.0 |
| `has.multiple()` | `any_multiple()` | deprecated | 2.0.0 |
| `hrg.consensus()` | `consensus_tree()` | deprecated | 2.0.0 |
| `hrg.create()` | `hrg()` | deprecated | 2.0.0 |
| `hrg.dendrogram()` | `hrg_tree()` | deprecated | 2.0.0 |
| `hrg.fit()` | `fit_hrg()` | deprecated | 2.0.0 |
| `hrg.game()` | `sample_hrg()` | deprecated | 2.0.0 |
| `hrg.predict()` | `predict_edges()` | deprecated | 2.0.0 |
| `hub.score()` | `hits_scores()` | defunct | 2.0.0 |
| `igraph.console()` | `console()` | deprecated | 2.0.0 |
| `igraph.from.graphNEL()` | `graph_from_graphnel()` | deprecated | 2.0.0 |
| `igraph.options()` | `igraph_options()` | deprecated | 2.0.0 |
| `igraph.sample()` | `sample_seq()` | deprecated | 2.0.0 |
| `igraph.shape.noclip()` | `shape_noclip()` | deprecated | 2.0.0 |
| `igraph.shape.noplot()` | `shape_noplot()` | deprecated | 2.0.0 |
| `igraph.to.graphNEL()` | `as_graphnel()` | deprecated | 2.0.0 |
| `igraph.version()` | `igraph_version()` | deprecated | 2.0.0 |
| `independence.number()` | `ivs_size()` | deprecated | 2.0.0 |
| `independent.vertex.sets()` | `ivs()` | deprecated | 2.0.0 |
| `induced.subgraph()` | `induced_subgraph()` | deprecated | 2.0.0 |
| `infomap.community()` | `cluster_infomap()` | deprecated | 2.0.0 |
| `interconnected.islands.game()` | `sample_islands()` | deprecated | 2.0.0 |
| `is.bipartite()` | `is_bipartite()` | deprecated | 2.0.0 |
| `is.chordal()` | `is_chordal()` | deprecated | 2.0.0 |
| `is.connected()` | `is_connected()` | deprecated | 2.0.0 |
| `is.dag()` | `is_dag()` | deprecated | 2.0.0 |
| `is.degree.sequence()` | `is_degseq()` | deprecated | 2.0.0 |
| `is.directed()` | `is_directed()` | deprecated | 2.0.0 |
| `is.graphical.degree.sequence()` | `is_graphical()` | deprecated | 2.0.0 |
| `is.hierarchical()` | `is_hierarchical()` | deprecated | 2.0.0 |
| `is.igraph()` | `is_igraph()` | deprecated | 2.0.0 |
| `is.loop()` | `which_loop()` | deprecated | 2.0.0 |
| `is.matching()` | `is_matching()` | deprecated | 2.0.0 |
| `is.maximal.matching()` | `is_max_matching()` | deprecated | 2.0.0 |
| `is.minimal.separator()` | `is_min_separator()` | deprecated | 2.0.0 |
| `is.multiple()` | `which_multiple()` | deprecated | 2.0.0 |
| `is.mutual()` | `which_mutual()` | deprecated | 2.0.0 |
| `is.named()` | `is_named()` | deprecated | 2.0.0 |
| `is.separator()` | `is_separator()` | deprecated | 2.0.0 |
| `is.simple()` | `is_simple()` | deprecated | 2.0.0 |
| `is.weighted()` | `is_weighted()` | deprecated | 2.0.0 |
| `k.regular.game()` | `sample_k_regular()` | deprecated | 2.0.0 |
| `label.propagation.community()` | `cluster_label_prop()` | deprecated | 2.0.0 |
| `largest.cliques()` | `largest_cliques()` | deprecated | 2.0.0 |
| `largest.independent.vertex.sets()` | `largest_ivs()` | deprecated | 2.0.0 |
| `lastcit.game()` | `sample_last_cit()` | deprecated | 2.0.0 |
| `layout.auto()` | `layout_nicely()` | deprecated | 2.0.0 |
| `layout.bipartite()` | `layout_as_bipartite()` | deprecated | 2.0.0 |
| `layout.circle()` | `layout_in_circle()` | deprecated | 2.1.0 |
| `layout.davidson.harel()` | `layout_with_dh()` | deprecated | 2.0.0 |
| `layout.drl()` | `layout_with_drl()` | deprecated | 2.0.0 |
| `layout.fruchterman.reingold()` | `layout_with_fr()` | deprecated | 2.1.0 |
| `layout.fruchterman.reingold.grid()` | `layout_with_fr()` | defunct | 2.1.0 |
| `layout.gem()` | `layout_with_gem()` | deprecated | 2.0.0 |
| `layout.graphopt()` | `layout_with_graphopt()` | deprecated | 2.0.0 |
| `layout.grid()` | `layout_on_grid()` | deprecated | 2.0.0 |
| `layout.kamada.kawai()` | `layout_with_kk()` | deprecated | 2.1.0 |
| `layout.lgl()` | `layout_with_lgl()` | deprecated | 2.1.0 |
| `layout.mds()` | `layout_with_mds()` | deprecated | 2.0.0 |
| `layout.merge()` | `merge_coords()` | deprecated | 2.0.0 |
| `layout.norm()` | `norm_coords()` | deprecated | 2.0.0 |
| `layout.random()` | `layout_randomly()` | deprecated | 2.1.0 |
| `layout.reingold.tilford()` | `layout_as_tree()` | deprecated | 2.1.0 |
| `layout.sphere()` | `layout_on_sphere()` | deprecated | 2.1.0 |
| `layout.spring()` | `layout_with_fr()` | defunct | 2.1.0 |
| `layout.star()` | `layout_as_star()` | deprecated | 2.0.0 |
| `layout.sugiyama()` | `layout_with_sugiyama()` | deprecated | 2.0.0 |
| `layout.svd()` | `layout_with_fr()` | defunct | 2.1.0 |
| `leading.eigenvector.community()` | `cluster_leading_eigen()` | deprecated | 2.0.0 |
| `line.graph()` | `make_line_graph()` | deprecated | 2.1.0 |
| `list.edge.attributes()` | `edge_attr_names()` | deprecated | 2.0.0 |
| `list.graph.attributes()` | `graph_attr_names()` | deprecated | 2.0.0 |
| `list.vertex.attributes()` | `vertex_attr_names()` | deprecated | 2.0.0 |
| `maximal.cliques()` | `max_cliques()` | deprecated | 2.0.0 |
| `maximal.cliques.count()` | `count_max_cliques()` | deprecated | 2.0.0 |
| `maximal.independent.vertex.sets()` | `max_ivs()` | deprecated | 2.0.0 |
| `maximum.bipartite.matching()` | `max_bipartite_match()` | deprecated | 2.0.0 |
| `maximum.cardinality.search()` | `max_cardinality()` | deprecated | 2.0.0 |
| `minimal.st.separators()` | `min_st_separators()` | deprecated | 2.0.0 |
| `minimum.size.separators()` | `min_separators()` | deprecated | 2.0.0 |
| `minimum.spanning.tree()` | `mst()` | deprecated | 2.0.0 |
| `mod.matrix()` | `modularity_matrix()` | deprecated | 2.0.0 |
| `multilevel.community()` | `cluster_louvain()` | deprecated | 2.0.0 |
| `neighborhood.size()` | `ego_size()` | deprecated | 2.0.0 |
| `no.clusters()` | `count_components()` | deprecated | 2.0.0 |
| `optimal.community()` | `cluster_optimal()` | deprecated | 2.0.0 |
| `page.rank()` | `page_rank()` | deprecated | 2.0.0 |
| `path.length.hist()` | `distance_table()` | deprecated | 2.0.0 |
| `permute.vertices()` | `permute()` | deprecated | 2.0.0 |
| `piecewise.layout()` | `layout_components()` | deprecated | 2.0.0 |
| `power.law.fit()` | `fit_power_law()` | deprecated | 2.0.0 |
| `preference.game()` | `sample_pref()` | deprecated | 2.0.0 |
| `random.graph.game()` | `sample_gnp()` or `sample_gnm()` | deprecated | 0.8.0 |
| `read.graph()` | `read_graph()` | deprecated | 2.0.0 |
| `remove.edge.attribute()` | `delete_edge_attr()` | deprecated | 2.0.0 |
| `remove.graph.attribute()` | `delete_graph_attr()` | deprecated | 2.0.0 |
| `remove.vertex.attribute()` | `delete_vertex_attr()` | deprecated | 2.0.0 |
| `running.mean()` | `running_mean()` | deprecated | 2.0.0 |
| `sbm.game()` | `sample_sbm()` | deprecated | 2.0.0 |
| `set.edge.attribute()` | `set_edge_attr()` | deprecated | 2.0.0 |
| `set.graph.attribute()` | `set_graph_attr()` | deprecated | 2.0.0 |
| `set.vertex.attribute()` | `set_vertex_attr()` | deprecated | 2.0.0 |
| `shortest.paths()` | `distances()` | deprecated | 2.0.0 |
| `similarity.dice()` | `similarity(method = "dice")` | deprecated | 2.1.0 |
| `similarity.invlogweighted()` | `similarity(method = "invlogweighted")` | deprecated | 2.1.0 |
| `similarity.jaccard()` | `similarity(method = "jaccard")` | deprecated | 2.1.0 |
| `spinglass.community()` | `cluster_spinglass()` | deprecated | 2.0.0 |
| `static.fitness.game()` | `sample_fitness()` | deprecated | 2.0.0 |
| `static.power.law.game()` | `sample_fitness_pl()` | deprecated | 2.0.0 |
| `subgraph.centrality()` | `subgraph_centrality()` | deprecated | 2.0.0 |
| `subgraph.edges()` | `subgraph_from_edges()` | deprecated | 2.1.0 |
| `tkplot.canvas()` | `tk_canvas()` | deprecated | 2.0.0 |
| `tkplot.center()` | `tk_center()` | deprecated | 2.0.0 |
| `tkplot.close()` | `tk_close()` | deprecated | 2.0.0 |
| `tkplot.export.postscript()` | `tk_postscript()` | deprecated | 2.0.0 |
| `tkplot.fit.to.screen()` | `tk_fit()` | deprecated | 2.0.0 |
| `tkplot.getcoords()` | `tk_coords()` | deprecated | 2.0.0 |
| `tkplot.off()` | `tk_off()` | deprecated | 2.0.0 |
| `tkplot.reshape()` | `tk_reshape()` | deprecated | 2.0.0 |
| `tkplot.rotate()` | `tk_rotate()` | deprecated | 2.0.0 |
| `tkplot.setcoords()` | `tk_set_coords()` | deprecated | 2.0.0 |
| `topological.sort()` | `topo_sort()` | deprecated | 2.0.0 |
| `triad.census()` | `triad_census()` | deprecated | 2.0.0 |
| `unfold.tree()` | `unfold_tree()` | deprecated | 2.0.0 |
| `vertex.connectivity()` | `vertex_connectivity()` | deprecated | 2.0.0 |
| `vertex.disjoint.paths()` | `vertex_disjoint_paths()` | deprecated | 2.0.0 |
| `vertex.shapes()` | `shapes()` | deprecated | 2.0.0 |
| `walktrap.community()` | `cluster_walktrap()` | deprecated | 2.0.0 |
| `watts.strogatz.game()` | `sample_smallworld()` | deprecated | 2.0.0 |
| `write.graph()` | `write_graph()` | deprecated | 2.0.0 |

<!-- END GENERATED: tools/dotted-names.R -->

*To deepen: a check that fails when the table no longer matches the code.*
