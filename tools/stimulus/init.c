#include <R.h>
#include <Rinternals.h>
#include <stdlib.h> // for NULL
#include <R_ext/Rdynload.h>

/*
  The following symbols/expresssions for .NAME have been omitted

    call

  Most likely possible values need to be added below.
*/

/* FIXME:
   Check these declarations against the C/Fortran source code.
*/

/* .C calls */
extern void igraphhcass2(void *, void *, void *, void *, void *, void *);

/* .Call calls */
extern SEXP make_lazy(SEXP, SEXP, SEXP);
extern SEXP make_lazy_dots(SEXP, SEXP);
extern SEXP promise_env_(SEXP);
extern SEXP promise_expr_(SEXP);
extern SEXP R_igraph_add_edges(SEXP, SEXP);
extern SEXP R_igraph_add_env(SEXP);
extern SEXP R_igraph_add_version_to_env(SEXP);
extern SEXP R_igraph_add_vertices(SEXP, SEXP);
extern SEXP R_igraph_address(SEXP);
extern SEXP R_igraph_adhesion(SEXP, SEXP);
extern SEXP R_igraph_adjacency_spectral_embedding(SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_adjacent_triangles(SEXP, SEXP);
extern SEXP R_igraph_adjacent_vertices(SEXP, SEXP, SEXP);
extern SEXP R_igraph_adjlist(SEXP, SEXP, SEXP);
extern SEXP R_igraph_all_minimal_st_separators(SEXP);
extern SEXP R_igraph_all_st_cuts(SEXP, SEXP, SEXP);
extern SEXP R_igraph_all_st_mincuts(SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_are_connected(SEXP, SEXP, SEXP);
extern SEXP R_igraph_arpack(SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_arpack_unpack_complex(SEXP, SEXP, SEXP);
extern SEXP R_igraph_articulation_points(SEXP);
extern SEXP R_igraph_assortativity(SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_assortativity_degree(SEXP, SEXP);
extern SEXP R_igraph_assortativity_nominal(SEXP, SEXP, SEXP);
extern SEXP R_igraph_asymmetric_preference_game(SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_atlas(SEXP);
extern SEXP R_igraph_authority_score(SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_automorphisms(SEXP, SEXP);
extern SEXP R_igraph_average_path_length(SEXP, SEXP, SEXP);
extern SEXP R_igraph_avg_nearest_neighbor_degree(SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_barabasi_aging_game(SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_barabasi_game(SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_betweenness(SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_betweenness_estimate(SEXP, SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_bfs(SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_bibcoupling(SEXP, SEXP);
extern SEXP R_igraph_biconnected_components(SEXP);
extern SEXP R_igraph_bipartite_game_gnm(SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_bipartite_game_gnp(SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_bipartite_projection(SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_bipartite_projection_size(SEXP, SEXP);
extern SEXP R_igraph_callaway_traits_game(SEXP, SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_canonical_permutation(SEXP, SEXP);
extern SEXP R_igraph_centralization(SEXP, SEXP, SEXP);
extern SEXP R_igraph_centralization_betweenness(SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_centralization_betweenness_tmax(SEXP, SEXP, SEXP);
extern SEXP R_igraph_centralization_closeness(SEXP, SEXP, SEXP);
extern SEXP R_igraph_centralization_closeness_tmax(SEXP, SEXP, SEXP);
extern SEXP R_igraph_centralization_degree(SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_centralization_degree_tmax(SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_centralization_eigenvector_centrality(SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_centralization_eigenvector_centrality_tmax(SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_cited_type_game(SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_citing_cited_type_game(SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_clique_number(SEXP);
extern SEXP R_igraph_cliques(SEXP, SEXP, SEXP);
extern SEXP R_igraph_closeness(SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_closeness_estimate(SEXP, SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_clusters(SEXP, SEXP);
extern SEXP R_igraph_cocitation(SEXP, SEXP);
extern SEXP R_igraph_cohesion(SEXP, SEXP);
extern SEXP R_igraph_cohesive_blocks(SEXP);
extern SEXP R_igraph_community_edge_betweenness(SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_community_fastgreedy(SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_community_infomap(SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_community_label_propagation(SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_community_leading_eigenvector(SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_community_multilevel(SEXP, SEXP);
extern SEXP R_igraph_community_optimal_modularity(SEXP, SEXP);
extern SEXP R_igraph_community_leiden(SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_community_to_membership2(SEXP, SEXP, SEXP);
extern SEXP R_igraph_compare_communities(SEXP, SEXP, SEXP);
extern SEXP R_igraph_complementer(SEXP, SEXP);
extern SEXP R_igraph_compose(SEXP, SEXP, SEXP);
extern SEXP R_igraph_connect_neighborhood(SEXP, SEXP, SEXP);
extern SEXP R_igraph_constraint(SEXP, SEXP, SEXP);
extern SEXP R_igraph_contract_vertices(SEXP, SEXP, SEXP);
extern SEXP R_igraph_convex_hull(SEXP);
extern SEXP R_igraph_coreness(SEXP, SEXP);
extern SEXP R_igraph_correlated_game(SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_correlated_pair_game(SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_count_isomorphisms_vf2(SEXP, SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_count_multiple(SEXP, SEXP);
extern SEXP R_igraph_count_subisomorphisms_vf2(SEXP, SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_create(SEXP, SEXP, SEXP);
extern SEXP R_igraph_create_bipartite(SEXP, SEXP, SEXP);
extern SEXP R_igraph_de_bruijn(SEXP, SEXP);
extern SEXP R_igraph_decompose(SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_degree(SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_degree_sequence_game(SEXP, SEXP, SEXP);
extern SEXP R_igraph_delete_edges(SEXP, SEXP);
extern SEXP R_igraph_delete_vertices(SEXP, SEXP);
extern SEXP R_igraph_density(SEXP, SEXP);
extern SEXP R_igraph_dfs(SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_diameter(SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_difference(SEXP, SEXP);
extern SEXP R_igraph_dim_select(SEXP);
extern SEXP R_igraph_disjoint_union(SEXP);
extern SEXP R_igraph_diversity(SEXP, SEXP, SEXP);
extern SEXP R_igraph_dominator_tree(SEXP, SEXP, SEXP);
extern SEXP R_igraph_dot_product_game(SEXP, SEXP);
extern SEXP R_igraph_dyad_census(SEXP);
extern SEXP R_igraph_eccentricity(SEXP, SEXP, SEXP);
extern SEXP R_igraph_ecount(SEXP);
extern SEXP R_igraph_edge_betweenness(SEXP, SEXP, SEXP);
extern SEXP R_igraph_edge_betweenness_estimate(SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_edge_connectivity(SEXP, SEXP);
extern SEXP R_igraph_edge_disjoint_paths(SEXP, SEXP, SEXP);
extern SEXP R_igraph_edges(SEXP, SEXP);
extern SEXP R_igraph_eigen_adjacency(SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_eigenvector_centrality(SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_empty(SEXP, SEXP);
extern SEXP R_igraph_erdos_renyi_game(SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_es_adj(SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_es_pairs(SEXP, SEXP, SEXP);
extern SEXP R_igraph_es_path(SEXP, SEXP, SEXP);
extern SEXP R_igraph_establishment_game(SEXP, SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_extended_chordal_ring(SEXP, SEXP, SEXP);
extern SEXP R_igraph_famous(SEXP);
extern SEXP R_igraph_farthest_points(SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_finalizer();
extern SEXP R_igraph_forest_fire_game(SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_full(SEXP, SEXP, SEXP);
extern SEXP R_igraph_full_bipartite(SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_full_citation(SEXP, SEXP);
extern SEXP R_igraph_get_adjacency(SEXP, SEXP, SEXP);
extern SEXP R_igraph_get_adjedgelist(SEXP, SEXP);
extern SEXP R_igraph_get_adjlist(SEXP, SEXP);
extern SEXP R_igraph_get_all_shortest_paths(SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_get_all_shortest_paths_dijkstra(SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_get_all_simple_paths(SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_get_all_simple_paths_pp(SEXP);
extern SEXP R_igraph_get_attr_mode(SEXP, SEXP);
extern SEXP R_igraph_get_diameter(SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_get_edge(SEXP, SEXP);
extern SEXP R_igraph_get_edgelist(SEXP, SEXP);
extern SEXP R_igraph_get_eids(SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_get_graph_id(SEXP);
extern SEXP R_igraph_get_incidence(SEXP, SEXP);
extern SEXP R_igraph_get_isomorphisms_vf2(SEXP, SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_get_shortest_paths(SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_get_stochastic(SEXP, SEXP);
extern SEXP R_igraph_get_stochastic_sparsemat(SEXP, SEXP);
extern SEXP R_igraph_get_subisomorphisms_vf2(SEXP, SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_getsphere(SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_girth(SEXP, SEXP);
extern SEXP R_igraph_graph_adjacency(SEXP, SEXP);
extern SEXP R_igraph_graph_version(SEXP);
extern SEXP R_igraph_graphlets(SEXP, SEXP, SEXP);
extern SEXP R_igraph_graphlets_candidate_basis(SEXP, SEXP);
extern SEXP R_igraph_graphlets_project(SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_grg_game(SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_growing_random_game(SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_has_multiple(SEXP);
extern SEXP R_igraph_hrg_consensus(SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_hrg_create(SEXP, SEXP);
extern SEXP R_igraph_hrg_dendrogram(SEXP);
extern SEXP R_igraph_hrg_fit(SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_hrg_game(SEXP);
extern SEXP R_igraph_hrg_predict(SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_hsbm_game(SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_hsbm_list_game(SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_hub_score(SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_i_levc_arp(SEXP, SEXP, SEXP);
extern SEXP R_igraph_identical_graphs(SEXP, SEXP);
extern SEXP R_igraph_incidence(SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_incident(SEXP, SEXP, SEXP);
extern SEXP R_igraph_incident_edges(SEXP, SEXP, SEXP);
extern SEXP R_igraph_independence_number(SEXP);
extern SEXP R_igraph_independent_vertex_sets(SEXP, SEXP, SEXP);
extern SEXP R_igraph_induced_subgraph(SEXP, SEXP, SEXP);
extern SEXP R_igraph_intersection(SEXP, SEXP);
extern SEXP R_igraph_is_bipartite(SEXP);
extern SEXP R_igraph_is_chordal(SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_is_connected(SEXP, SEXP);
extern SEXP R_igraph_is_dag(SEXP);
extern SEXP R_igraph_is_degree_sequence(SEXP, SEXP);
extern SEXP R_igraph_is_directed(SEXP);
extern SEXP R_igraph_is_graphical_degree_sequence(SEXP, SEXP);
extern SEXP R_igraph_is_loop(SEXP, SEXP);
extern SEXP R_igraph_is_matching(SEXP, SEXP, SEXP);
extern SEXP R_igraph_is_maximal_matching(SEXP, SEXP, SEXP);
extern SEXP R_igraph_is_minimal_separator(SEXP, SEXP);
extern SEXP R_igraph_is_multiple(SEXP, SEXP);
extern SEXP R_igraph_is_mutual(SEXP, SEXP);
extern SEXP R_igraph_is_separator(SEXP, SEXP);
extern SEXP R_igraph_is_simple(SEXP);
extern SEXP R_igraph_isoclass(SEXP);
extern SEXP R_igraph_isoclass_create(SEXP, SEXP, SEXP);
extern SEXP R_igraph_isoclass_subgraph(SEXP, SEXP);
extern SEXP R_igraph_isomorphic(SEXP, SEXP);
extern SEXP R_igraph_isomorphic_34(SEXP, SEXP);
extern SEXP R_igraph_isomorphic_bliss(SEXP, SEXP, SEXP);
extern SEXP R_igraph_isomorphic_vf2(SEXP, SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_k_regular_game(SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_kautz(SEXP, SEXP);
extern SEXP R_igraph_laplacian(SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_laplacian_spectral_embedding(SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_largest_cliques(SEXP);
extern SEXP R_igraph_largest_independent_vertex_sets(SEXP);
extern SEXP R_igraph_lastcit_game(SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_lattice(SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_layout_bipartite(SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_layout_circle(SEXP, SEXP);
extern SEXP R_igraph_layout_davidson_harel(SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_layout_drl(SEXP, SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_layout_drl_3d(SEXP, SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_layout_fruchterman_reingold(SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_layout_fruchterman_reingold_3d(SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_layout_gem(SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_layout_graphopt(SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_layout_grid(SEXP, SEXP);
extern SEXP R_igraph_layout_grid_3d(SEXP, SEXP, SEXP);
extern SEXP R_igraph_layout_kamada_kawai(SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_layout_kamada_kawai_3d(SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_layout_lgl(SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_layout_mds(SEXP, SEXP, SEXP);
extern SEXP R_igraph_layout_merge_dla(SEXP, SEXP);
extern SEXP R_igraph_layout_random(SEXP);
extern SEXP R_igraph_layout_random_3d(SEXP);
extern SEXP R_igraph_layout_reingold_tilford(SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_layout_sphere(SEXP);
extern SEXP R_igraph_layout_star(SEXP, SEXP, SEXP);
extern SEXP R_igraph_layout_sugiyama(SEXP, SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_lcf_vector(SEXP, SEXP, SEXP);
extern SEXP R_igraph_line_graph(SEXP);
extern SEXP R_igraph_list_triangles(SEXP);
extern SEXP R_igraph_local_scan_0(SEXP, SEXP, SEXP);
extern SEXP R_igraph_local_scan_0_them(SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_local_scan_1_ecount(SEXP, SEXP, SEXP);
extern SEXP R_igraph_local_scan_1_ecount_them(SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_local_scan_k_ecount(SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_local_scan_k_ecount_them(SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_local_scan_neighborhood_ecount(SEXP, SEXP, SEXP);
extern SEXP R_igraph_make_weak_ref(SEXP, SEXP, SEXP);
extern SEXP R_igraph_maxflow(SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_maximal_cliques(SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_maximal_cliques_count(SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_maximal_cliques_file(SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_maximal_independent_vertex_sets(SEXP);
extern SEXP R_igraph_maximum_bipartite_matching(SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_maximum_cardinality_search(SEXP);
extern SEXP R_igraph_mincut(SEXP, SEXP);
extern SEXP R_igraph_mincut_value(SEXP, SEXP);
extern SEXP R_igraph_minimum_size_separators(SEXP);
extern SEXP R_igraph_minimum_spanning_tree_prim(SEXP, SEXP);
extern SEXP R_igraph_minimum_spanning_tree_unweighted(SEXP);
extern SEXP R_igraph_modularity(SEXP, SEXP, SEXP);
extern SEXP R_igraph_modularity_matrix(SEXP, SEXP);
extern SEXP R_igraph_motifs_randesu(SEXP, SEXP, SEXP);
extern SEXP R_igraph_motifs_randesu_estimate(SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_motifs_randesu_no(SEXP, SEXP, SEXP);
extern SEXP R_igraph_mybracket(SEXP, SEXP);
extern SEXP R_igraph_mybracket2(SEXP, SEXP, SEXP);
extern SEXP R_igraph_mybracket2_copy(SEXP, SEXP, SEXP);
extern SEXP R_igraph_mybracket2_names(SEXP, SEXP, SEXP);
extern SEXP R_igraph_mybracket2_set(SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_mybracket3_set(SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_neighborhood(SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_neighborhood_graphs(SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_neighborhood_size(SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_neighbors(SEXP, SEXP, SEXP);
extern SEXP R_igraph_no_clusters(SEXP, SEXP);
extern SEXP R_igraph_pagerank_old(SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_path_length_hist(SEXP, SEXP);
extern SEXP R_igraph_permute_vertices(SEXP, SEXP);
extern SEXP R_igraph_personalized_pagerank(SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_power_law_fit(SEXP, SEXP, SEXP);
extern SEXP R_igraph_preference_game(SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_psumtree_draw(SEXP, SEXP, SEXP);
extern SEXP R_igraph_radius(SEXP, SEXP);
extern SEXP R_igraph_random_sample(SEXP, SEXP, SEXP);
extern SEXP R_igraph_random_walk(SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_read_graph_dimacs(SEXP, SEXP);
extern SEXP R_igraph_read_graph_dl(SEXP, SEXP);
extern SEXP R_igraph_read_graph_edgelist(SEXP, SEXP, SEXP);
extern SEXP R_igraph_read_graph_gml(SEXP);
extern SEXP R_igraph_read_graph_graphdb(SEXP, SEXP);
extern SEXP R_igraph_read_graph_graphml(SEXP, SEXP);
extern SEXP R_igraph_read_graph_lgl(SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_read_graph_ncol(SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_read_graph_pajek(SEXP);
extern SEXP R_igraph_recent_degree_aging_game(SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_reciprocity(SEXP, SEXP, SEXP);
extern SEXP R_igraph_rewire(SEXP, SEXP, SEXP);
extern SEXP R_igraph_rewire_edges(SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_ring(SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_running_mean(SEXP, SEXP);
extern SEXP R_igraph_sample_dirichlet(SEXP, SEXP);
extern SEXP R_igraph_sample_sphere_surface(SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_sample_sphere_volume(SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_sbm_game(SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_scg_adjacency(SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_scg_grouping(SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_scg_laplacian(SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_scg_norm_eps(SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_scg_semiprojectors(SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_scg_stochastic(SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_set_verbose(SEXP);
extern SEXP R_igraph_shortest_paths(SEXP, SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_similarity_dice(SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_similarity_inverse_log_weighted(SEXP, SEXP, SEXP);
extern SEXP R_igraph_similarity_jaccard(SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_simple_interconnected_islands_game(SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_simplify(SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_sir(SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_solve_lsap(SEXP, SEXP);
extern SEXP R_igraph_spinglass_community(SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_spinglass_my_community(SEXP, SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_split_join_distance(SEXP, SEXP);
extern SEXP R_igraph_st_edge_connectivity(SEXP, SEXP, SEXP);
extern SEXP R_igraph_st_mincut_value(SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_st_vertex_connectivity(SEXP, SEXP, SEXP);
extern SEXP R_igraph_star(SEXP, SEXP, SEXP);
extern SEXP R_igraph_static_fitness_game(SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_static_power_law_game(SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_strength(SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_subcomponent(SEXP, SEXP, SEXP);
extern SEXP R_igraph_subgraph(SEXP, SEXP);
extern SEXP R_igraph_subgraph_edges(SEXP, SEXP, SEXP);
extern SEXP R_igraph_subisomorphic_lad(SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_subisomorphic_vf2(SEXP, SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_to_directed(SEXP, SEXP);
extern SEXP R_igraph_to_undirected(SEXP, SEXP, SEXP);
extern SEXP R_igraph_topological_sorting(SEXP, SEXP);
extern SEXP R_igraph_transitivity_avglocal_undirected(SEXP, SEXP);
extern SEXP R_igraph_transitivity_barrat(SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_transitivity_local_undirected(SEXP, SEXP, SEXP);
extern SEXP R_igraph_transitivity_local_undirected_all(SEXP, SEXP);
extern SEXP R_igraph_transitivity_undirected(SEXP, SEXP);
extern SEXP R_igraph_tree(SEXP, SEXP, SEXP);
extern SEXP R_igraph_triad_census(SEXP);
extern SEXP R_igraph_unfold_tree(SEXP, SEXP, SEXP);
extern SEXP R_igraph_union(SEXP, SEXP);
extern SEXP R_igraph_vcount(SEXP);
extern SEXP R_igraph_version();
extern SEXP R_igraph_vertex_connectivity(SEXP, SEXP);
extern SEXP R_igraph_vertex_disjoint_paths(SEXP, SEXP, SEXP);
extern SEXP R_igraph_vs_adj(SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_vs_nei(SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_walktrap_community(SEXP, SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_watts_strogatz_game(SEXP, SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_weak_ref_key(SEXP);
extern SEXP R_igraph_weak_ref_run_finalizer(SEXP);
extern SEXP R_igraph_weak_ref_value(SEXP);
extern SEXP R_igraph_weighted_adjacency(SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_write_graph_dimacs(SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_write_graph_dot(SEXP, SEXP);
extern SEXP R_igraph_write_graph_edgelist(SEXP, SEXP);
extern SEXP R_igraph_write_graph_gml(SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_write_graph_graphml(SEXP, SEXP, SEXP);
extern SEXP R_igraph_write_graph_leda(SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_write_graph_lgl(SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_write_graph_ncol(SEXP, SEXP, SEXP, SEXP);
extern SEXP R_igraph_write_graph_pajek(SEXP, SEXP);
extern SEXP UUID_gen(SEXP);

static const R_CMethodDef CEntries[] = {
    {"igraphhcass2", (DL_FUNC) &igraphhcass2, 6},
    {NULL, NULL, 0}
};

static const R_CallMethodDef CallEntries[] = {
    {"make_lazy",                                           (DL_FUNC) &make_lazy,                                            3},
    {"make_lazy_dots",                                      (DL_FUNC) &make_lazy_dots,                                       2},
    {"promise_env_",                                        (DL_FUNC) &promise_env_,                                         1},
    {"promise_expr_",                                       (DL_FUNC) &promise_expr_,                                        1},
    {"R_igraph_add_edges",                                  (DL_FUNC) &R_igraph_add_edges,                                   2},
    {"R_igraph_add_env",                                    (DL_FUNC) &R_igraph_add_env,                                     1},
    {"R_igraph_add_version_to_env",                         (DL_FUNC) &R_igraph_add_version_to_env,                          1},
    {"R_igraph_add_vertices",                               (DL_FUNC) &R_igraph_add_vertices,                                2},
    {"R_igraph_address",                                    (DL_FUNC) &R_igraph_address,                                     1},
    {"R_igraph_adhesion",                                   (DL_FUNC) &R_igraph_adhesion,                                    2},
    {"R_igraph_adjacency_spectral_embedding",               (DL_FUNC) &R_igraph_adjacency_spectral_embedding,                7},
    {"R_igraph_adjacent_triangles",                         (DL_FUNC) &R_igraph_adjacent_triangles,                          2},
    {"R_igraph_adjacent_vertices",                          (DL_FUNC) &R_igraph_adjacent_vertices,                           3},
    {"R_igraph_adjlist",                                    (DL_FUNC) &R_igraph_adjlist,                                     3},
    {"R_igraph_all_minimal_st_separators",                  (DL_FUNC) &R_igraph_all_minimal_st_separators,                   1},
    {"R_igraph_all_st_cuts",                                (DL_FUNC) &R_igraph_all_st_cuts,                                 3},
    {"R_igraph_all_st_mincuts",                             (DL_FUNC) &R_igraph_all_st_mincuts,                              4},
    {"R_igraph_are_connected",                              (DL_FUNC) &R_igraph_are_connected,                               3},
    {"R_igraph_arpack",                                     (DL_FUNC) &R_igraph_arpack,                                      5},
    {"R_igraph_arpack_unpack_complex",                      (DL_FUNC) &R_igraph_arpack_unpack_complex,                       3},
    {"R_igraph_articulation_points",                        (DL_FUNC) &R_igraph_articulation_points,                         1},
    {"R_igraph_assortativity",                              (DL_FUNC) &R_igraph_assortativity,                               4},
    {"R_igraph_assortativity_degree",                       (DL_FUNC) &R_igraph_assortativity_degree,                        2},
    {"R_igraph_assortativity_nominal",                      (DL_FUNC) &R_igraph_assortativity_nominal,                       3},
    {"R_igraph_asymmetric_preference_game",                 (DL_FUNC) &R_igraph_asymmetric_preference_game,                  5},
    {"R_igraph_atlas",                                      (DL_FUNC) &R_igraph_atlas,                                       1},
    {"R_igraph_authority_score",                            (DL_FUNC) &R_igraph_authority_score,                             4},
    {"R_igraph_automorphisms",                              (DL_FUNC) &R_igraph_automorphisms,                               2},
    {"R_igraph_average_path_length",                        (DL_FUNC) &R_igraph_average_path_length,                         3},
    {"R_igraph_avg_nearest_neighbor_degree",                (DL_FUNC) &R_igraph_avg_nearest_neighbor_degree,                 5},
    {"R_igraph_barabasi_aging_game",                        (DL_FUNC) &R_igraph_barabasi_aging_game,                        12},
    {"R_igraph_barabasi_game",                              (DL_FUNC) &R_igraph_barabasi_game,                               9},
    {"R_igraph_betweenness",                                (DL_FUNC) &R_igraph_betweenness,                                 5},
    {"R_igraph_betweenness_estimate",                       (DL_FUNC) &R_igraph_betweenness_estimate,                        6},
    {"R_igraph_bfs",                                        (DL_FUNC) &R_igraph_bfs,                                        15},
    {"R_igraph_bibcoupling",                                (DL_FUNC) &R_igraph_bibcoupling,                                 2},
    {"R_igraph_biconnected_components",                     (DL_FUNC) &R_igraph_biconnected_components,                      1},
    {"R_igraph_bipartite_game_gnm",                         (DL_FUNC) &R_igraph_bipartite_game_gnm,                          5},
    {"R_igraph_bipartite_game_gnp",                         (DL_FUNC) &R_igraph_bipartite_game_gnp,                          5},
    {"R_igraph_bipartite_projection",                       (DL_FUNC) &R_igraph_bipartite_projection,                        4},
    {"R_igraph_bipartite_projection_size",                  (DL_FUNC) &R_igraph_bipartite_projection_size,                   2},
    {"R_igraph_callaway_traits_game",                       (DL_FUNC) &R_igraph_callaway_traits_game,                        6},
    {"R_igraph_canonical_permutation",                      (DL_FUNC) &R_igraph_canonical_permutation,                       2},
    {"R_igraph_centralization",                             (DL_FUNC) &R_igraph_centralization,                              3},
    {"R_igraph_centralization_betweenness",                 (DL_FUNC) &R_igraph_centralization_betweenness,                  4},
    {"R_igraph_centralization_betweenness_tmax",            (DL_FUNC) &R_igraph_centralization_betweenness_tmax,             3},
    {"R_igraph_centralization_closeness",                   (DL_FUNC) &R_igraph_centralization_closeness,                    3},
    {"R_igraph_centralization_closeness_tmax",              (DL_FUNC) &R_igraph_centralization_closeness_tmax,               3},
    {"R_igraph_centralization_degree",                      (DL_FUNC) &R_igraph_centralization_degree,                       4},
    {"R_igraph_centralization_degree_tmax",                 (DL_FUNC) &R_igraph_centralization_degree_tmax,                  4},
    {"R_igraph_centralization_eigenvector_centrality",      (DL_FUNC) &R_igraph_centralization_eigenvector_centrality,       5},
    {"R_igraph_centralization_eigenvector_centrality_tmax", (DL_FUNC) &R_igraph_centralization_eigenvector_centrality_tmax,  4},
    {"R_igraph_cited_type_game",                            (DL_FUNC) &R_igraph_cited_type_game,                             5},
    {"R_igraph_citing_cited_type_game",                     (DL_FUNC) &R_igraph_citing_cited_type_game,                      5},
    {"R_igraph_clique_number",                              (DL_FUNC) &R_igraph_clique_number,                               1},
    {"R_igraph_cliques",                                    (DL_FUNC) &R_igraph_cliques,                                     3},
    {"R_igraph_closeness",                                  (DL_FUNC) &R_igraph_closeness,                                   5},
    {"R_igraph_closeness_estimate",                         (DL_FUNC) &R_igraph_closeness_estimate,                          6},
    {"R_igraph_clusters",                                   (DL_FUNC) &R_igraph_clusters,                                    2},
    {"R_igraph_cocitation",                                 (DL_FUNC) &R_igraph_cocitation,                                  2},
    {"R_igraph_cohesion",                                   (DL_FUNC) &R_igraph_cohesion,                                    2},
    {"R_igraph_cohesive_blocks",                            (DL_FUNC) &R_igraph_cohesive_blocks,                             1},
    {"R_igraph_community_edge_betweenness",                 (DL_FUNC) &R_igraph_community_edge_betweenness,                  8},
    {"R_igraph_community_fastgreedy",                       (DL_FUNC) &R_igraph_community_fastgreedy,                        5},
    {"R_igraph_community_infomap",                          (DL_FUNC) &R_igraph_community_infomap,                           4},
    {"R_igraph_community_label_propagation",                (DL_FUNC) &R_igraph_community_label_propagation,                 4},
    {"R_igraph_community_leading_eigenvector",              (DL_FUNC) &R_igraph_community_leading_eigenvector,               9},
    {"R_igraph_community_multilevel",                       (DL_FUNC) &R_igraph_community_multilevel,                        2},
    {"R_igraph_community_optimal_modularity",               (DL_FUNC) &R_igraph_community_optimal_modularity,                2},
    {"R_igraph_community_leiden",                           (DL_FUNC) &R_igraph_community_leiden,                            7},
    {"R_igraph_community_to_membership2",                   (DL_FUNC) &R_igraph_community_to_membership2,                    3},
    {"R_igraph_compare_communities",                        (DL_FUNC) &R_igraph_compare_communities,                         3},
    {"R_igraph_complementer",                               (DL_FUNC) &R_igraph_complementer,                                2},
    {"R_igraph_compose",                                    (DL_FUNC) &R_igraph_compose,                                     3},
    {"R_igraph_connect_neighborhood",                       (DL_FUNC) &R_igraph_connect_neighborhood,                        3},
    {"R_igraph_constraint",                                 (DL_FUNC) &R_igraph_constraint,                                  3},
    {"R_igraph_contract_vertices",                          (DL_FUNC) &R_igraph_contract_vertices,                           3},
    {"R_igraph_convex_hull",                                (DL_FUNC) &R_igraph_convex_hull,                                 1},
    {"R_igraph_coreness",                                   (DL_FUNC) &R_igraph_coreness,                                    2},
    {"R_igraph_correlated_game",                            (DL_FUNC) &R_igraph_correlated_game,                             4},
    {"R_igraph_correlated_pair_game",                       (DL_FUNC) &R_igraph_correlated_pair_game,                        5},
    {"R_igraph_count_isomorphisms_vf2",                     (DL_FUNC) &R_igraph_count_isomorphisms_vf2,                      6},
    {"R_igraph_count_multiple",                             (DL_FUNC) &R_igraph_count_multiple,                              2},
    {"R_igraph_count_subisomorphisms_vf2",                  (DL_FUNC) &R_igraph_count_subisomorphisms_vf2,                   6},
    {"R_igraph_create",                                     (DL_FUNC) &R_igraph_create,                                      3},
    {"R_igraph_create_bipartite",                           (DL_FUNC) &R_igraph_create_bipartite,                            3},
    {"R_igraph_de_bruijn",                                  (DL_FUNC) &R_igraph_de_bruijn,                                   2},
    {"R_igraph_decompose",                                  (DL_FUNC) &R_igraph_decompose,                                   4},
    {"R_igraph_degree",                                     (DL_FUNC) &R_igraph_degree,                                      4},
    {"R_igraph_degree_sequence_game",                       (DL_FUNC) &R_igraph_degree_sequence_game,                        3},
    {"R_igraph_delete_edges",                               (DL_FUNC) &R_igraph_delete_edges,                                2},
    {"R_igraph_delete_vertices",                            (DL_FUNC) &R_igraph_delete_vertices,                             2},
    {"R_igraph_density",                                    (DL_FUNC) &R_igraph_density,                                     2},
    {"R_igraph_dfs",                                        (DL_FUNC) &R_igraph_dfs,                                        12},
    {"R_igraph_diameter",                                   (DL_FUNC) &R_igraph_diameter,                                    4},
    {"R_igraph_difference",                                 (DL_FUNC) &R_igraph_difference,                                  2},
    {"R_igraph_dim_select",                                 (DL_FUNC) &R_igraph_dim_select,                                  1},
    {"R_igraph_disjoint_union",                             (DL_FUNC) &R_igraph_disjoint_union,                              1},
    {"R_igraph_diversity",                                  (DL_FUNC) &R_igraph_diversity,                                   3},
    {"R_igraph_dominator_tree",                             (DL_FUNC) &R_igraph_dominator_tree,                              3},
    {"R_igraph_dot_product_game",                           (DL_FUNC) &R_igraph_dot_product_game,                            2},
    {"R_igraph_dyad_census",                                (DL_FUNC) &R_igraph_dyad_census,                                 1},
    {"R_igraph_eccentricity",                               (DL_FUNC) &R_igraph_eccentricity,                                3},
    {"R_igraph_ecount",                                     (DL_FUNC) &R_igraph_ecount,                                      1},
    {"R_igraph_edge_betweenness",                           (DL_FUNC) &R_igraph_edge_betweenness,                            3},
    {"R_igraph_edge_betweenness_estimate",                  (DL_FUNC) &R_igraph_edge_betweenness_estimate,                   4},
    {"R_igraph_edge_connectivity",                          (DL_FUNC) &R_igraph_edge_connectivity,                           2},
    {"R_igraph_edge_disjoint_paths",                        (DL_FUNC) &R_igraph_edge_disjoint_paths,                         3},
    {"R_igraph_edges",                                      (DL_FUNC) &R_igraph_edges,                                       2},
    {"R_igraph_eigen_adjacency",                            (DL_FUNC) &R_igraph_eigen_adjacency,                             4},
    {"R_igraph_eigenvector_centrality",                     (DL_FUNC) &R_igraph_eigenvector_centrality,                      5},
    {"R_igraph_empty",                                      (DL_FUNC) &R_igraph_empty,                                       2},
    {"R_igraph_erdos_renyi_game",                           (DL_FUNC) &R_igraph_erdos_renyi_game,                            5},
    {"R_igraph_es_adj",                                     (DL_FUNC) &R_igraph_es_adj,                                      4},
    {"R_igraph_es_pairs",                                   (DL_FUNC) &R_igraph_es_pairs,                                    3},
    {"R_igraph_es_path",                                    (DL_FUNC) &R_igraph_es_path,                                     3},
    {"R_igraph_establishment_game",                         (DL_FUNC) &R_igraph_establishment_game,                          6},
    {"R_igraph_extended_chordal_ring",                      (DL_FUNC) &R_igraph_extended_chordal_ring,                       3},
    {"R_igraph_famous",                                     (DL_FUNC) &R_igraph_famous,                                      1},
    {"R_igraph_farthest_points",                            (DL_FUNC) &R_igraph_farthest_points,                             4},
    {"R_igraph_finalizer",                                  (DL_FUNC) &R_igraph_finalizer,                                   0},
    {"R_igraph_forest_fire_game",                           (DL_FUNC) &R_igraph_forest_fire_game,                            5},
    {"R_igraph_full",                                       (DL_FUNC) &R_igraph_full,                                        3},
    {"R_igraph_full_bipartite",                             (DL_FUNC) &R_igraph_full_bipartite,                              4},
    {"R_igraph_full_citation",                              (DL_FUNC) &R_igraph_full_citation,                               2},
    {"R_igraph_get_adjacency",                              (DL_FUNC) &R_igraph_get_adjacency,                               3},
    {"R_igraph_get_adjedgelist",                            (DL_FUNC) &R_igraph_get_adjedgelist,                             2},
    {"R_igraph_get_adjlist",                                (DL_FUNC) &R_igraph_get_adjlist,                                 2},
    {"R_igraph_get_all_shortest_paths",                     (DL_FUNC) &R_igraph_get_all_shortest_paths,                      4},
    {"R_igraph_get_all_shortest_paths_dijkstra",            (DL_FUNC) &R_igraph_get_all_shortest_paths_dijkstra,             5},
    {"R_igraph_get_all_simple_paths",                       (DL_FUNC) &R_igraph_get_all_simple_paths,                        5},
    {"R_igraph_get_all_simple_paths_pp",                    (DL_FUNC) &R_igraph_get_all_simple_paths_pp,                     1},
    {"R_igraph_get_attr_mode",                              (DL_FUNC) &R_igraph_get_attr_mode,                               2},
    {"R_igraph_get_diameter",                               (DL_FUNC) &R_igraph_get_diameter,                                4},
    {"R_igraph_get_edge",                                   (DL_FUNC) &R_igraph_get_edge,                                    2},
    {"R_igraph_get_edgelist",                               (DL_FUNC) &R_igraph_get_edgelist,                                2},
    {"R_igraph_get_eids",                                   (DL_FUNC) &R_igraph_get_eids,                                    5},
    {"R_igraph_get_graph_id",                               (DL_FUNC) &R_igraph_get_graph_id,                                1},
    {"R_igraph_get_incidence",                              (DL_FUNC) &R_igraph_get_incidence,                               2},
    {"R_igraph_get_isomorphisms_vf2",                       (DL_FUNC) &R_igraph_get_isomorphisms_vf2,                        6},
    {"R_igraph_get_shortest_paths",                         (DL_FUNC) &R_igraph_get_shortest_paths,                          9},
    {"R_igraph_get_stochastic",                             (DL_FUNC) &R_igraph_get_stochastic,                              2},
    {"R_igraph_get_stochastic_sparsemat",                   (DL_FUNC) &R_igraph_get_stochastic_sparsemat,                    2},
    {"R_igraph_get_subisomorphisms_vf2",                    (DL_FUNC) &R_igraph_get_subisomorphisms_vf2,                     6},
    {"R_igraph_getsphere",                                  (DL_FUNC) &R_igraph_getsphere,                                   8},
    {"R_igraph_girth",                                      (DL_FUNC) &R_igraph_girth,                                       2},
    {"R_igraph_graph_adjacency",                            (DL_FUNC) &R_igraph_graph_adjacency,                             2},
    {"R_igraph_graph_version",                              (DL_FUNC) &R_igraph_graph_version,                               1},
    {"R_igraph_graphlets",                                  (DL_FUNC) &R_igraph_graphlets,                                   3},
    {"R_igraph_graphlets_candidate_basis",                  (DL_FUNC) &R_igraph_graphlets_candidate_basis,                   2},
    {"R_igraph_graphlets_project",                          (DL_FUNC) &R_igraph_graphlets_project,                           5},
    {"R_igraph_grg_game",                                   (DL_FUNC) &R_igraph_grg_game,                                    4},
    {"R_igraph_growing_random_game",                        (DL_FUNC) &R_igraph_growing_random_game,                         4},
    {"R_igraph_has_multiple",                               (DL_FUNC) &R_igraph_has_multiple,                                1},
    {"R_igraph_hrg_consensus",                              (DL_FUNC) &R_igraph_hrg_consensus,                               4},
    {"R_igraph_hrg_create",                                 (DL_FUNC) &R_igraph_hrg_create,                                  2},
    {"R_igraph_hrg_dendrogram",                             (DL_FUNC) &R_igraph_hrg_dendrogram,                              1},
    {"R_igraph_hrg_fit",                                    (DL_FUNC) &R_igraph_hrg_fit,                                     4},
    {"R_igraph_hrg_game",                                   (DL_FUNC) &R_igraph_hrg_game,                                    1},
    {"R_igraph_hrg_predict",                                (DL_FUNC) &R_igraph_hrg_predict,                                 5},
    {"R_igraph_hsbm_game",                                  (DL_FUNC) &R_igraph_hsbm_game,                                   5},
    {"R_igraph_hsbm_list_game",                             (DL_FUNC) &R_igraph_hsbm_list_game,                              5},
    {"R_igraph_hub_score",                                  (DL_FUNC) &R_igraph_hub_score,                                   4},
    {"R_igraph_i_levc_arp",                                 (DL_FUNC) &R_igraph_i_levc_arp,                                  3},
    {"R_igraph_identical_graphs",                           (DL_FUNC) &R_igraph_identical_graphs,                            2},
    {"R_igraph_incidence",                                  (DL_FUNC) &R_igraph_incidence,                                   4},
    {"R_igraph_incident",                                   (DL_FUNC) &R_igraph_incident,                                    3},
    {"R_igraph_incident_edges",                             (DL_FUNC) &R_igraph_incident_edges,                              3},
    {"R_igraph_independence_number",                        (DL_FUNC) &R_igraph_independence_number,                         1},
    {"R_igraph_independent_vertex_sets",                    (DL_FUNC) &R_igraph_independent_vertex_sets,                     3},
    {"R_igraph_induced_subgraph",                           (DL_FUNC) &R_igraph_induced_subgraph,                            3},
    {"R_igraph_intersection",                               (DL_FUNC) &R_igraph_intersection,                                2},
    {"R_igraph_is_bipartite",                               (DL_FUNC) &R_igraph_is_bipartite,                                1},
    {"R_igraph_is_chordal",                                 (DL_FUNC) &R_igraph_is_chordal,                                  5},
    {"R_igraph_is_connected",                               (DL_FUNC) &R_igraph_is_connected,                                2},
    {"R_igraph_is_dag",                                     (DL_FUNC) &R_igraph_is_dag,                                      1},
    {"R_igraph_is_degree_sequence",                         (DL_FUNC) &R_igraph_is_degree_sequence,                          2},
    {"R_igraph_is_directed",                                (DL_FUNC) &R_igraph_is_directed,                                 1},
    {"R_igraph_is_graphical_degree_sequence",               (DL_FUNC) &R_igraph_is_graphical_degree_sequence,                2},
    {"R_igraph_is_loop",                                    (DL_FUNC) &R_igraph_is_loop,                                     2},
    {"R_igraph_is_matching",                                (DL_FUNC) &R_igraph_is_matching,                                 3},
    {"R_igraph_is_maximal_matching",                        (DL_FUNC) &R_igraph_is_maximal_matching,                         3},
    {"R_igraph_is_minimal_separator",                       (DL_FUNC) &R_igraph_is_minimal_separator,                        2},
    {"R_igraph_is_multiple",                                (DL_FUNC) &R_igraph_is_multiple,                                 2},
    {"R_igraph_is_mutual",                                  (DL_FUNC) &R_igraph_is_mutual,                                   2},
    {"R_igraph_is_separator",                               (DL_FUNC) &R_igraph_is_separator,                                2},
    {"R_igraph_is_simple",                                  (DL_FUNC) &R_igraph_is_simple,                                   1},
    {"R_igraph_isoclass",                                   (DL_FUNC) &R_igraph_isoclass,                                    1},
    {"R_igraph_isoclass_create",                            (DL_FUNC) &R_igraph_isoclass_create,                             3},
    {"R_igraph_isoclass_subgraph",                          (DL_FUNC) &R_igraph_isoclass_subgraph,                           2},
    {"R_igraph_isomorphic",                                 (DL_FUNC) &R_igraph_isomorphic,                                  2},
    {"R_igraph_isomorphic_34",                              (DL_FUNC) &R_igraph_isomorphic_34,                               2},
    {"R_igraph_isomorphic_bliss",                           (DL_FUNC) &R_igraph_isomorphic_bliss,                            3},
    {"R_igraph_isomorphic_vf2",                             (DL_FUNC) &R_igraph_isomorphic_vf2,                              6},
    {"R_igraph_k_regular_game",                             (DL_FUNC) &R_igraph_k_regular_game,                              4},
    {"R_igraph_kautz",                                      (DL_FUNC) &R_igraph_kautz,                                       2},
    {"R_igraph_laplacian",                                  (DL_FUNC) &R_igraph_laplacian,                                   4},
    {"R_igraph_laplacian_spectral_embedding",               (DL_FUNC) &R_igraph_laplacian_spectral_embedding,                8},
    {"R_igraph_largest_cliques",                            (DL_FUNC) &R_igraph_largest_cliques,                             1},
    {"R_igraph_largest_independent_vertex_sets",            (DL_FUNC) &R_igraph_largest_independent_vertex_sets,             1},
    {"R_igraph_lastcit_game",                               (DL_FUNC) &R_igraph_lastcit_game,                                5},
    {"R_igraph_lattice",                                    (DL_FUNC) &R_igraph_lattice,                                     5},
    {"R_igraph_layout_bipartite",                           (DL_FUNC) &R_igraph_layout_bipartite,                            5},
    {"R_igraph_layout_circle",                              (DL_FUNC) &R_igraph_layout_circle,                               2},
    {"R_igraph_layout_davidson_harel",                      (DL_FUNC) &R_igraph_layout_davidson_harel,                      11},
    {"R_igraph_layout_drl",                                 (DL_FUNC) &R_igraph_layout_drl,                                  6},
    {"R_igraph_layout_drl_3d",                              (DL_FUNC) &R_igraph_layout_drl_3d,                               6},
    {"R_igraph_layout_fruchterman_reingold",                (DL_FUNC) &R_igraph_layout_fruchterman_reingold,                10},
    {"R_igraph_layout_fruchterman_reingold_3d",             (DL_FUNC) &R_igraph_layout_fruchterman_reingold_3d,             11},
    {"R_igraph_layout_gem",                                 (DL_FUNC) &R_igraph_layout_gem,                                  7},
    {"R_igraph_layout_graphopt",                            (DL_FUNC) &R_igraph_layout_graphopt,                             8},
    {"R_igraph_layout_grid",                                (DL_FUNC) &R_igraph_layout_grid,                                 2},
    {"R_igraph_layout_grid_3d",                             (DL_FUNC) &R_igraph_layout_grid_3d,                              3},
    {"R_igraph_layout_kamada_kawai",                        (DL_FUNC) &R_igraph_layout_kamada_kawai,                        10},
    {"R_igraph_layout_kamada_kawai_3d",                     (DL_FUNC) &R_igraph_layout_kamada_kawai_3d,                     12},
    {"R_igraph_layout_lgl",                                 (DL_FUNC) &R_igraph_layout_lgl,                                  8},
    {"R_igraph_layout_mds",                                 (DL_FUNC) &R_igraph_layout_mds,                                  3},
    {"R_igraph_layout_merge_dla",                           (DL_FUNC) &R_igraph_layout_merge_dla,                            2},
    {"R_igraph_layout_random",                              (DL_FUNC) &R_igraph_layout_random,                               1},
    {"R_igraph_layout_random_3d",                           (DL_FUNC) &R_igraph_layout_random_3d,                            1},
    {"R_igraph_layout_reingold_tilford",                    (DL_FUNC) &R_igraph_layout_reingold_tilford,                     5},
    {"R_igraph_layout_sphere",                              (DL_FUNC) &R_igraph_layout_sphere,                               1},
    {"R_igraph_layout_star",                                (DL_FUNC) &R_igraph_layout_star,                                 3},
    {"R_igraph_layout_sugiyama",                            (DL_FUNC) &R_igraph_layout_sugiyama,                             6},
    {"R_igraph_lcf_vector",                                 (DL_FUNC) &R_igraph_lcf_vector,                                  3},
    {"R_igraph_line_graph",                                 (DL_FUNC) &R_igraph_line_graph,                                  1},
    {"R_igraph_list_triangles",                             (DL_FUNC) &R_igraph_list_triangles,                              1},
    {"R_igraph_local_scan_0",                               (DL_FUNC) &R_igraph_local_scan_0,                                3},
    {"R_igraph_local_scan_0_them",                          (DL_FUNC) &R_igraph_local_scan_0_them,                           4},
    {"R_igraph_local_scan_1_ecount",                        (DL_FUNC) &R_igraph_local_scan_1_ecount,                         3},
    {"R_igraph_local_scan_1_ecount_them",                   (DL_FUNC) &R_igraph_local_scan_1_ecount_them,                    4},
    {"R_igraph_local_scan_k_ecount",                        (DL_FUNC) &R_igraph_local_scan_k_ecount,                         4},
    {"R_igraph_local_scan_k_ecount_them",                   (DL_FUNC) &R_igraph_local_scan_k_ecount_them,                    5},
    {"R_igraph_local_scan_neighborhood_ecount",             (DL_FUNC) &R_igraph_local_scan_neighborhood_ecount,              3},
    {"R_igraph_make_weak_ref",                              (DL_FUNC) &R_igraph_make_weak_ref,                               3},
    {"R_igraph_maxflow",                                    (DL_FUNC) &R_igraph_maxflow,                                     4},
    {"R_igraph_maximal_cliques",                            (DL_FUNC) &R_igraph_maximal_cliques,                             4},
    {"R_igraph_maximal_cliques_count",                      (DL_FUNC) &R_igraph_maximal_cliques_count,                       4},
    {"R_igraph_maximal_cliques_file",                       (DL_FUNC) &R_igraph_maximal_cliques_file,                        5},
    {"R_igraph_maximal_independent_vertex_sets",            (DL_FUNC) &R_igraph_maximal_independent_vertex_sets,             1},
    {"R_igraph_maximum_bipartite_matching",                 (DL_FUNC) &R_igraph_maximum_bipartite_matching,                  4},
    {"R_igraph_maximum_cardinality_search",                 (DL_FUNC) &R_igraph_maximum_cardinality_search,                  1},
    {"R_igraph_mincut",                                     (DL_FUNC) &R_igraph_mincut,                                      2},
    {"R_igraph_mincut_value",                               (DL_FUNC) &R_igraph_mincut_value,                                2},
    {"R_igraph_minimum_size_separators",                    (DL_FUNC) &R_igraph_minimum_size_separators,                     1},
    {"R_igraph_minimum_spanning_tree_prim",                 (DL_FUNC) &R_igraph_minimum_spanning_tree_prim,                  2},
    {"R_igraph_minimum_spanning_tree_unweighted",           (DL_FUNC) &R_igraph_minimum_spanning_tree_unweighted,            1},
    {"R_igraph_modularity",                                 (DL_FUNC) &R_igraph_modularity,                                  3},
    {"R_igraph_modularity_matrix",                          (DL_FUNC) &R_igraph_modularity_matrix,                           2},
    {"R_igraph_motifs_randesu",                             (DL_FUNC) &R_igraph_motifs_randesu,                              3},
    {"R_igraph_motifs_randesu_estimate",                    (DL_FUNC) &R_igraph_motifs_randesu_estimate,                     5},
    {"R_igraph_motifs_randesu_no",                          (DL_FUNC) &R_igraph_motifs_randesu_no,                           3},
    {"R_igraph_mybracket",                                  (DL_FUNC) &R_igraph_mybracket,                                   2},
    {"R_igraph_mybracket2",                                 (DL_FUNC) &R_igraph_mybracket2,                                  3},
    {"R_igraph_mybracket2_copy",                            (DL_FUNC) &R_igraph_mybracket2_copy,                             3},
    {"R_igraph_mybracket2_names",                           (DL_FUNC) &R_igraph_mybracket2_names,                            3},
    {"R_igraph_mybracket2_set",                             (DL_FUNC) &R_igraph_mybracket2_set,                              4},
    {"R_igraph_mybracket3_set",                             (DL_FUNC) &R_igraph_mybracket3_set,                              5},
    {"R_igraph_neighborhood",                               (DL_FUNC) &R_igraph_neighborhood,                                5},
    {"R_igraph_neighborhood_graphs",                        (DL_FUNC) &R_igraph_neighborhood_graphs,                         5},
    {"R_igraph_neighborhood_size",                          (DL_FUNC) &R_igraph_neighborhood_size,                           5},
    {"R_igraph_neighbors",                                  (DL_FUNC) &R_igraph_neighbors,                                   3},
    {"R_igraph_no_clusters",                                (DL_FUNC) &R_igraph_no_clusters,                                 2},
    {"R_igraph_pagerank_old",                               (DL_FUNC) &R_igraph_pagerank_old,                                7},
    {"R_igraph_path_length_hist",                           (DL_FUNC) &R_igraph_path_length_hist,                            2},
    {"R_igraph_permute_vertices",                           (DL_FUNC) &R_igraph_permute_vertices,                            2},
    {"R_igraph_personalized_pagerank",                      (DL_FUNC) &R_igraph_personalized_pagerank,                       8},
    {"R_igraph_power_law_fit",                              (DL_FUNC) &R_igraph_power_law_fit,                               3},
    {"R_igraph_preference_game",                            (DL_FUNC) &R_igraph_preference_game,                             7},
    {"R_igraph_psumtree_draw",                              (DL_FUNC) &R_igraph_psumtree_draw,                               3},
    {"R_igraph_radius",                                     (DL_FUNC) &R_igraph_radius,                                      2},
    {"R_igraph_random_sample",                              (DL_FUNC) &R_igraph_random_sample,                               3},
    {"R_igraph_random_walk",                                (DL_FUNC) &R_igraph_random_walk,                                 5},
    {"R_igraph_read_graph_dimacs",                          (DL_FUNC) &R_igraph_read_graph_dimacs,                           2},
    {"R_igraph_read_graph_dl",                              (DL_FUNC) &R_igraph_read_graph_dl,                               2},
    {"R_igraph_read_graph_edgelist",                        (DL_FUNC) &R_igraph_read_graph_edgelist,                         3},
    {"R_igraph_read_graph_gml",                             (DL_FUNC) &R_igraph_read_graph_gml,                              1},
    {"R_igraph_read_graph_graphdb",                         (DL_FUNC) &R_igraph_read_graph_graphdb,                          2},
    {"R_igraph_read_graph_graphml",                         (DL_FUNC) &R_igraph_read_graph_graphml,                          2},
    {"R_igraph_read_graph_lgl",                             (DL_FUNC) &R_igraph_read_graph_lgl,                              4},
    {"R_igraph_read_graph_ncol",                            (DL_FUNC) &R_igraph_read_graph_ncol,                             5},
    {"R_igraph_read_graph_pajek",                           (DL_FUNC) &R_igraph_read_graph_pajek,                            1},
    {"R_igraph_recent_degree_aging_game",                   (DL_FUNC) &R_igraph_recent_degree_aging_game,                   10},
    {"R_igraph_reciprocity",                                (DL_FUNC) &R_igraph_reciprocity,                                 3},
    {"R_igraph_rewire",                                     (DL_FUNC) &R_igraph_rewire,                                      3},
    {"R_igraph_rewire_edges",                               (DL_FUNC) &R_igraph_rewire_edges,                                4},
    {"R_igraph_ring",                                       (DL_FUNC) &R_igraph_ring,                                        4},
    {"R_igraph_running_mean",                               (DL_FUNC) &R_igraph_running_mean,                                2},
    {"R_igraph_sample_dirichlet",                           (DL_FUNC) &R_igraph_sample_dirichlet,                            2},
    {"R_igraph_sample_sphere_surface",                      (DL_FUNC) &R_igraph_sample_sphere_surface,                       4},
    {"R_igraph_sample_sphere_volume",                       (DL_FUNC) &R_igraph_sample_sphere_volume,                        4},
    {"R_igraph_sbm_game",                                   (DL_FUNC) &R_igraph_sbm_game,                                    5},
    {"R_igraph_scg_adjacency",                              (DL_FUNC) &R_igraph_scg_adjacency,                              14},
    {"R_igraph_scg_grouping",                               (DL_FUNC) &R_igraph_scg_grouping,                                7},
    {"R_igraph_scg_laplacian",                              (DL_FUNC) &R_igraph_scg_laplacian,                              16},
    {"R_igraph_scg_norm_eps",                               (DL_FUNC) &R_igraph_scg_norm_eps,                                5},
    {"R_igraph_scg_semiprojectors",                         (DL_FUNC) &R_igraph_scg_semiprojectors,                          5},
    {"R_igraph_scg_stochastic",                             (DL_FUNC) &R_igraph_scg_stochastic,                             17},
    {"R_igraph_set_verbose",                                (DL_FUNC) &R_igraph_set_verbose,                                 1},
    {"R_igraph_shortest_paths",                             (DL_FUNC) &R_igraph_shortest_paths,                              6},
    {"R_igraph_similarity_dice",                            (DL_FUNC) &R_igraph_similarity_dice,                             4},
    {"R_igraph_similarity_inverse_log_weighted",            (DL_FUNC) &R_igraph_similarity_inverse_log_weighted,             3},
    {"R_igraph_similarity_jaccard",                         (DL_FUNC) &R_igraph_similarity_jaccard,                          4},
    {"R_igraph_simple_interconnected_islands_game",         (DL_FUNC) &R_igraph_simple_interconnected_islands_game,          4},
    {"R_igraph_simplify",                                   (DL_FUNC) &R_igraph_simplify,                                    4},
    {"R_igraph_sir",                                        (DL_FUNC) &R_igraph_sir,                                         4},
    {"R_igraph_solve_lsap",                                 (DL_FUNC) &R_igraph_solve_lsap,                                  2},
    {"R_igraph_spinglass_community",                        (DL_FUNC) &R_igraph_spinglass_community,                        11},
    {"R_igraph_spinglass_my_community",                     (DL_FUNC) &R_igraph_spinglass_my_community,                      6},
    {"R_igraph_split_join_distance",                        (DL_FUNC) &R_igraph_split_join_distance,                         2},
    {"R_igraph_st_edge_connectivity",                       (DL_FUNC) &R_igraph_st_edge_connectivity,                        3},
    {"R_igraph_st_mincut_value",                            (DL_FUNC) &R_igraph_st_mincut_value,                             4},
    {"R_igraph_st_vertex_connectivity",                     (DL_FUNC) &R_igraph_st_vertex_connectivity,                      3},
    {"R_igraph_star",                                       (DL_FUNC) &R_igraph_star,                                        3},
    {"R_igraph_static_fitness_game",                        (DL_FUNC) &R_igraph_static_fitness_game,                         5},
    {"R_igraph_static_power_law_game",                      (DL_FUNC) &R_igraph_static_power_law_game,                       7},
    {"R_igraph_strength",                                   (DL_FUNC) &R_igraph_strength,                                    5},
    {"R_igraph_subcomponent",                               (DL_FUNC) &R_igraph_subcomponent,                                3},
    {"R_igraph_subgraph",                                   (DL_FUNC) &R_igraph_subgraph,                                    2},
    {"R_igraph_subgraph_edges",                             (DL_FUNC) &R_igraph_subgraph_edges,                              3},
    {"R_igraph_subisomorphic_lad",                          (DL_FUNC) &R_igraph_subisomorphic_lad,                           7},
    {"R_igraph_subisomorphic_vf2",                          (DL_FUNC) &R_igraph_subisomorphic_vf2,                           6},
    {"R_igraph_to_directed",                                (DL_FUNC) &R_igraph_to_directed,                                 2},
    {"R_igraph_to_undirected",                              (DL_FUNC) &R_igraph_to_undirected,                               3},
    {"R_igraph_topological_sorting",                        (DL_FUNC) &R_igraph_topological_sorting,                         2},
    {"R_igraph_transitivity_avglocal_undirected",           (DL_FUNC) &R_igraph_transitivity_avglocal_undirected,            2},
    {"R_igraph_transitivity_barrat",                        (DL_FUNC) &R_igraph_transitivity_barrat,                         4},
    {"R_igraph_transitivity_local_undirected",              (DL_FUNC) &R_igraph_transitivity_local_undirected,               3},
    {"R_igraph_transitivity_local_undirected_all",          (DL_FUNC) &R_igraph_transitivity_local_undirected_all,           2},
    {"R_igraph_transitivity_undirected",                    (DL_FUNC) &R_igraph_transitivity_undirected,                     2},
    {"R_igraph_tree",                                       (DL_FUNC) &R_igraph_tree,                                        3},
    {"R_igraph_triad_census",                               (DL_FUNC) &R_igraph_triad_census,                                1},
    {"R_igraph_unfold_tree",                                (DL_FUNC) &R_igraph_unfold_tree,                                 3},
    {"R_igraph_union",                                      (DL_FUNC) &R_igraph_union,                                       2},
    {"R_igraph_vcount",                                     (DL_FUNC) &R_igraph_vcount,                                      1},
    {"R_igraph_version",                                    (DL_FUNC) &R_igraph_version,                                     0},
    {"R_igraph_vertex_connectivity",                        (DL_FUNC) &R_igraph_vertex_connectivity,                         2},
    {"R_igraph_vertex_disjoint_paths",                      (DL_FUNC) &R_igraph_vertex_disjoint_paths,                       3},
    {"R_igraph_vs_adj",                                     (DL_FUNC) &R_igraph_vs_adj,                                      4},
    {"R_igraph_vs_nei",                                     (DL_FUNC) &R_igraph_vs_nei,                                      4},
    {"R_igraph_walktrap_community",                         (DL_FUNC) &R_igraph_walktrap_community,                          6},
    {"R_igraph_watts_strogatz_game",                        (DL_FUNC) &R_igraph_watts_strogatz_game,                         6},
    {"R_igraph_weak_ref_key",                               (DL_FUNC) &R_igraph_weak_ref_key,                                1},
    {"R_igraph_weak_ref_run_finalizer",                     (DL_FUNC) &R_igraph_weak_ref_run_finalizer,                      1},
    {"R_igraph_weak_ref_value",                             (DL_FUNC) &R_igraph_weak_ref_value,                              1},
    {"R_igraph_weighted_adjacency",                         (DL_FUNC) &R_igraph_weighted_adjacency,                          4},
    {"R_igraph_write_graph_dimacs",                         (DL_FUNC) &R_igraph_write_graph_dimacs,                          5},
    {"R_igraph_write_graph_dot",                            (DL_FUNC) &R_igraph_write_graph_dot,                             2},
    {"R_igraph_write_graph_edgelist",                       (DL_FUNC) &R_igraph_write_graph_edgelist,                        2},
    {"R_igraph_write_graph_gml",                            (DL_FUNC) &R_igraph_write_graph_gml,                             4},
    {"R_igraph_write_graph_graphml",                        (DL_FUNC) &R_igraph_write_graph_graphml,                         3},
    {"R_igraph_write_graph_leda",                           (DL_FUNC) &R_igraph_write_graph_leda,                            4},
    {"R_igraph_write_graph_lgl",                            (DL_FUNC) &R_igraph_write_graph_lgl,                             5},
    {"R_igraph_write_graph_ncol",                           (DL_FUNC) &R_igraph_write_graph_ncol,                            4},
    {"R_igraph_write_graph_pajek",                          (DL_FUNC) &R_igraph_write_graph_pajek,                           2},
    {"UUID_gen",                                            (DL_FUNC) &UUID_gen,                                             1},
    {NULL, NULL, 0}
};
