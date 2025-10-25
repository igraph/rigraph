#!/bin/bash
# Script to create GitHub issues for replacing _impl function aliases with explicit wrappers

create_issue() {
  local file="$1"
  local functions="$2"
  
  gh issue create --title "Replace \`_impl\` aliases in \`${file}\`" --body "**Goal**
Review the code in \`${file}\` and replace all direct \`_impl\` function aliases with explicit wrapper functions.

**Functions to update:**
${functions}

**Instructions**
1. Review the code to understand the function signatures
2. Create explicit wrapper functions that forward to the \`_impl\` functions
3. Forward each argument individually and explicitly using \`arg = arg\` notation
4. Do not use \`...\` unless the \`_impl\` function itself uses \`...\`

**Pattern**
Replace direct aliasing like:
\`\`\`r
func_name <- func_name_impl
\`\`\`

With an explicit wrapper:
\`\`\`r
func_name <- function(arg1, arg2, ...) {
  func_name_impl(
    arg1 = arg1,
    arg2 = arg2,
    ...
  )
}
\`\`\`

**File**
\`${file}\`"
}

create_issue "R/assortativity.R" "- \`assortativity_nominal <- assortativity_nominal_impl\`
- \`assortativity_degree <- assortativity_degree_impl\`"

create_issue "R/bipartite.R" "- \`bipartite_projection_size <- bipartite_projection_size_impl\`
- \`bipartite_mapping <- is_bipartite_impl\`"

create_issue "R/centrality.R" "- \`strength <- strength_impl\`
- \`diversity <- diversity_impl\`
- \`page_rank <- personalized_pagerank_impl\`
- \`harmonic_centrality <- harmonic_centrality_cutoff_impl\`"

create_issue "R/centralization.R" "- \`centralize <- centralization_impl\`
- \`centr_degree <- centralization_degree_impl\`
- \`centr_betw_tmax <- centralization_betweenness_tmax_impl\`
- \`centr_clo <- centralization_closeness_impl\`
- \`centr_clo_tmax <- centralization_closeness_tmax_impl\`"

create_issue "R/cliques.R" "- \`cliques <- cliques_impl\`
- \`largest_cliques <- largest_cliques_impl\`
- \`clique_num <- clique_number_impl\`
- \`weighted_cliques <- weighted_cliques_impl\`
- \`largest_weighted_cliques <- largest_weighted_cliques_impl\`
- \`weighted_clique_num <- weighted_clique_number_impl\`
- \`is_complete <- is_complete_impl\`
- \`is_clique <- is_clique_impl\`
- \`is_ivs <- is_independent_vertex_set_impl\`"

create_issue "R/coloring.R" "- \`greedy_vertex_coloring <- vertex_coloring_greedy_impl\`"

create_issue "R/community.R" "- \`contract <- contract_vertices_impl\`
- \`voronoi_cells <- voronoi_impl\`"

create_issue "R/components.R" "- \`articulation_points <- articulation_points_impl\`
- \`bridges <- bridges_impl\`
- \`is_biconnected <- is_biconnected_impl\`"

create_issue "R/conversion.R" "- \`as_directed <- to_directed_impl\`
- \`graph_from_adj_list <- adjlist_impl\`"

create_issue "R/cycles.R" "- \`find_cycle <- find_cycle_impl\`"

create_issue "R/degseq.R" "- \`is_graphical <- is_graphical_impl\`"

create_issue "R/efficiency.R" "- \`global_efficiency <- global_efficiency_impl\`
- \`local_efficiency <- local_efficiency_impl\`
- \`average_local_efficiency <- average_local_efficiency_impl\`"

create_issue "R/embedding.R" "- \`embed_adjacency_matrix <- adjacency_spectral_embedding_impl\`
- \`dim_select <- dim_select_impl\`
- \`embed_laplacian_matrix <- laplacian_spectral_embedding_impl\`"

create_issue "R/eulerian.R" "- \`eulerian_path <- eulerian_path_impl\`
- \`eulerian_cycle <- eulerian_cycle_impl\`"

create_issue "R/flow.R" "- \`st_cuts <- all_st_cuts_impl\`
- \`st_min_cuts <- all_st_mincuts_impl\`
- \`min_st_separators <- all_minimal_st_separators_impl\`
- \`max_flow <- maxflow_impl\`
- \`is_separator <- is_separator_impl\`
- \`is_min_separator <- is_minimal_separator_impl\`
- \`min_separators <- minimum_size_separators_impl\`"

create_issue "R/games.R" "- \`sample_growing <- growing_random_game_impl\`
- \`sample_sbm <- sbm_game_impl\`
- \`sample_dot_product <- dot_product_game_impl\`
- \`sample_islands <- simple_interconnected_islands_game_impl\`
- \`sample_k_regular <- k_regular_game_impl\`
- \`sample_chung_lu <- chung_lu_game_impl\`
- \`sample_fitness <- static_fitness_game_impl\`
- \`sample_fitness_pl <- static_power_law_game_impl\`
- \`sample_forestfire <- forest_fire_game_impl\`
- \`sample_correlated_gnp <- correlated_game_impl\`
- \`sample_correlated_gnp_pair <- correlated_pair_game_impl\`"

create_issue "R/glet.R" "- \`graphlets <- graphlets_impl\`"

create_issue "R/hrg.R" "- \`consensus_tree <- hrg_consensus_impl\`
- \`hrg <- hrg_create_impl\`"

create_issue "R/layout.R" "- \`align_layout <- layout_align_impl\`"

create_issue "R/make.R" "- \`sample_tree <- tree_game_impl\`
- \`make_from_prufer <- from_prufer_impl\`
- \`realize_degseq <- realize_degree_sequence_impl\`"

create_issue "R/motifs.R" "- \`triad_census <- triad_census_impl\`"

create_issue "R/operators.R" "- \`reverse_edges <- reverse_edges_impl\`"

create_issue "R/other.R" "- \`convex_hull <- convex_hull_2d_impl\`"

create_issue "R/paths.R" "- \`is_dag <- is_dag_impl\`
- \`is_acyclic <- is_acyclic_impl\`
- \`max_cardinality <- maximum_cardinality_search_impl\`
- \`graph_center <- graph_center_impl\`
- \`distance_table <- path_length_hist_impl\`"

create_issue "R/simple.R" "- \`simplify <- simplify_impl\`
- \`is_simple <- is_simple_impl\`"

create_issue "R/sir.R" "- \`sir <- sir_impl\`"

create_issue "R/structural-properties.R" "- \`k_shortest_paths <- get_k_shortest_paths_impl\`
- \`reciprocity <- reciprocity_impl\`
- \`edge_density <- density_impl\`
- \`feedback_arc_set <- feedback_arc_set_impl\`
- \`feedback_vertex_set <- feedback_vertex_set_impl\`
- \`which_multiple <- is_multiple_impl\`
- \`any_multiple <- has_multiple_impl\`
- \`count_multiple <- count_multiple_impl\`
- \`which_loop <- is_loop_impl\`
- \`any_loop <- has_loop_impl\`
- \`is_connected <- is_connected_impl\`
- \`which_mutual <- is_mutual_impl\`
- \`knn <- avg_nearest_neighbor_degree_impl\`"

create_issue "R/structure.info.R" "- \`are_adjacent <- are_adjacent_impl\`"

create_issue "R/topology.R" "- \`graph.isomorphic.bliss <- isomorphic_bliss_impl\`
- \`graph.isomorphic.vf2 <- isomorphic_vf2_impl\`
- \`graph.subisomorphic.vf2 <- subisomorphic_vf2_impl\`
- \`graph.count.isomorphisms.vf2 <- count_isomorphisms_vf2_impl\`
- \`graph.count.subisomorphisms.vf2 <- count_subisomorphisms_vf2_impl\`
- \`graph.isoclass <- isoclass_impl\`
- \`graph_from_isomorphism_class <- isoclass_create_impl\`
- \`canonical_permutation <- canonical_permutation_bliss_impl\`
- \`permute <- permute_vertices_impl\`
- \`graph.isomorphic <- isomorphic_impl\`
- \`count_automorphisms <- count_automorphisms_bliss_impl\`
- \`automorphism_group <- automorphism_group_impl\`"

create_issue "R/trees.R" "- \`is_forest <- is_forest_impl\`
- \`to_prufer <- to_prufer_impl\`"

create_issue "R/triangles.R" "- \`triangles <- list_triangles_impl\`
- \`count_triangles <- count_adjacent_triangles_impl\`"

echo ""
echo "Script complete! Created issues for 31 files."
