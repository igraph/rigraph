# List of R Functions with Direct `_impl` Aliases

This document lists all instances in the R code where an `_impl` function is aliased directly to an exported function.

## Summary

Found **109** instances where an exported function is directly aliased to an `_impl` function.

These aliases follow the pattern:
```r
exported_function <- impl_function_impl
```

## Complete List

1. `assortativity_nominal <- assortativity_nominal_impl` in `R/assortativity.R` (line 233)
2. `assortativity_degree <- assortativity_degree_impl` in `R/assortativity.R` (line 238)
3. `bipartite_projection_size <- bipartite_projection_size_impl` in `R/bipartite.R` (line 230)
4. `bipartite_mapping <- is_bipartite_impl` in `R/bipartite.R` (line 282)
5. `strength <- strength_impl` in `R/centrality.R` (line 1439)
6. `diversity <- diversity_impl` in `R/centrality.R` (line 1483)
7. `page_rank <- personalized_pagerank_impl` in `R/centrality.R` (line 1729)
8. `harmonic_centrality <- harmonic_centrality_cutoff_impl` in `R/centrality.R` (line 1777)
9. `centralize <- centralization_impl` in `R/centralization.R` (line 318)
10. `centr_degree <- centralization_degree_impl` in `R/centralization.R` (line 360)
11. `centr_betw_tmax <- centralization_betweenness_tmax_impl` in `R/centralization.R` (line 496)
12. `centr_clo <- centralization_closeness_impl` in `R/centralization.R` (line 536)
13. `centr_clo_tmax <- centralization_closeness_tmax_impl` in `R/centralization.R` (line 563)
14. `cliques <- cliques_impl` in `R/cliques.R` (line 242)
15. `largest_cliques <- largest_cliques_impl` in `R/cliques.R` (line 247)
16. `clique_num <- clique_number_impl` in `R/cliques.R` (line 355)
17. `weighted_cliques <- weighted_cliques_impl` in `R/cliques.R` (line 408)
18. `largest_weighted_cliques <- largest_weighted_cliques_impl` in `R/cliques.R` (line 412)
19. `weighted_clique_num <- weighted_clique_number_impl` in `R/cliques.R` (line 416)
20. `is_complete <- is_complete_impl` in `R/cliques.R` (line 603)
21. `is_clique <- is_clique_impl` in `R/cliques.R` (line 619)
22. `is_ivs <- is_independent_vertex_set_impl` in `R/cliques.R` (line 630)
23. `greedy_vertex_coloring <- vertex_coloring_greedy_impl` in `R/coloring.R` (line 34)
24. `contract <- contract_vertices_impl` in `R/community.R` (line 3240)
25. `voronoi_cells <- voronoi_impl` in `R/community.R` (line 3286)
26. `articulation_points <- articulation_points_impl` in `R/components.R` (line 260)
27. `bridges <- bridges_impl` in `R/components.R` (line 265)
28. `is_biconnected <- is_biconnected_impl` in `R/components.R` (line 386)
29. `as_directed <- to_directed_impl` in `R/conversion.R` (line 603)
30. `graph_from_adj_list <- adjlist_impl` in `R/conversion.R` (line 1270)
31. `find_cycle <- find_cycle_impl` in `R/cycles.R` (line 53)
32. `is_graphical <- is_graphical_impl` in `R/degseq.R` (line 143)
33. `global_efficiency <- global_efficiency_impl` in `R/efficiency.R` (line 70)
34. `local_efficiency <- local_efficiency_impl` in `R/efficiency.R` (line 75)
35. `average_local_efficiency <- average_local_efficiency_impl` in `R/efficiency.R` (line 80)
36. `embed_adjacency_matrix <- adjacency_spectral_embedding_impl` in `R/embedding.R` (line 105)
37. `dim_select <- dim_select_impl` in `R/embedding.R` (line 167)
38. `embed_laplacian_matrix <- laplacian_spectral_embedding_impl` in `R/embedding.R` (line 259)
39. `eulerian_path <- eulerian_path_impl` in `R/eulerian.R` (line 84)
40. `eulerian_cycle <- eulerian_cycle_impl` in `R/eulerian.R` (line 89)
41. `st_cuts <- all_st_cuts_impl` in `R/flow.R` (line 764)
42. `st_min_cuts <- all_st_mincuts_impl` in `R/flow.R` (line 822)
43. `min_st_separators <- all_minimal_st_separators_impl` in `R/flow.R` (line 967)
44. `max_flow <- maxflow_impl` in `R/flow.R` (line 1035)
45. `is_separator <- is_separator_impl` in `R/flow.R` (line 1064)
46. `is_min_separator <- is_minimal_separator_impl` in `R/flow.R` (line 1113)
47. `min_separators <- minimum_size_separators_impl` in `R/flow.R` (line 1184)
48. `sample_growing <- growing_random_game_impl` in `R/games.R` (line 1468)
49. `sample_sbm <- sbm_game_impl` in `R/games.R` (line 2498)
50. `sample_dot_product <- dot_product_game_impl` in `R/games.R` (line 2627)
51. `sample_islands <- simple_interconnected_islands_game_impl` in `R/games.R` (line 2659)
52. `sample_k_regular <- k_regular_game_impl` in `R/games.R` (line 2698)
53. `sample_chung_lu <- chung_lu_game_impl` in `R/games.R` (line 2847)
54. `sample_fitness <- static_fitness_game_impl` in `R/games.R` (line 2929)
55. `sample_fitness_pl <- static_power_law_game_impl` in `R/games.R` (line 2996)
56. `sample_forestfire <- forest_fire_game_impl` in `R/games.R` (line 3059)
57. `sample_correlated_gnp <- correlated_game_impl` in `R/games.R` (line 3099)
58. `sample_correlated_gnp_pair <- correlated_pair_game_impl` in `R/games.R` (line 3137)
59. `graphlets <- graphlets_impl` in `R/glet.R` (line 243)
60. `consensus_tree <- hrg_consensus_impl` in `R/hrg.R` (line 304)
61. `hrg <- hrg_create_impl` in `R/hrg.R` (line 322)
62. `align_layout <- layout_align_impl` in `R/layout.R` (line 3017)
63. `sample_tree <- tree_game_impl` in `R/make.R` (line 2114)
64. `make_from_prufer <- from_prufer_impl` in `R/make.R` (line 2149)
65. `realize_degseq <- realize_degree_sequence_impl` in `R/make.R` (line 2724)
66. `triad_census <- triad_census_impl` in `R/motifs.R` (line 397)
67. `reverse_edges <- reverse_edges_impl` in `R/operators.R` (line 1337)
68. `convex_hull <- convex_hull_2d_impl` in `R/other.R` (line 226)
69. `is_dag <- is_dag_impl` in `R/paths.R` (line 163)
70. `is_acyclic <- is_acyclic_impl` in `R/paths.R` (line 186)
71. `max_cardinality <- maximum_cardinality_search_impl` in `R/paths.R` (line 243)
72. `graph_center <- graph_center_dijkstra_impl` in `R/paths.R` (line 381)
73. `distance_table <- path_length_hist_impl` in `R/paths.R` (line 388)
74. `simplify <- simplify_impl` in `R/simple.R` (line 92)
75. `is_simple <- is_simple_impl` in `R/simple.R` (line 97)
76. `sir <- sir_impl` in `R/sir.R` (line 112)
77. `mean_distance <- average_path_length_dijkstra_impl` in `R/structural-properties.R` (line 855)
78. `max_degree <- maxdegree_impl` in `R/structural-properties.R` (line 925)
79. `k_shortest_paths <- get_k_shortest_paths_impl` in `R/structural-properties.R` (line 1436)
80. `reciprocity <- reciprocity_impl` in `R/structural-properties.R` (line 1906)
81. `edge_density <- density_impl` in `R/structural-properties.R` (line 1947)
82. `feedback_arc_set <- feedback_arc_set_impl` in `R/structural-properties.R` (line 2260)
83. `feedback_vertex_set <- feedback_vertex_set_impl` in `R/structural-properties.R` (line 2291)
84. `which_multiple <- is_multiple_impl` in `R/structural-properties.R` (line 2418)
85. `any_multiple <- has_multiple_impl` in `R/structural-properties.R` (line 2422)
86. `count_multiple <- count_multiple_impl` in `R/structural-properties.R` (line 2426)
87. `which_loop <- is_loop_impl` in `R/structural-properties.R` (line 2430)
88. `any_loop <- has_loop_impl` in `R/structural-properties.R` (line 2434)
89. `is_connected <- is_connected_impl` in `R/structural-properties.R` (line 3021)
90. `which_mutual <- is_mutual_impl` in `R/structural-properties.R` (line 3396)
91. `knn <- avg_nearest_neighbor_degree_impl` in `R/structural-properties.R` (line 3474)
92. `are_adjacent <- are_adjacent_impl` in `R/structure.info.R` (line 62)
93. `graph.isomorphic.bliss <- isomorphic_bliss_impl` in `R/topology.R` (line 475)
94. `graph.isomorphic.vf2 <- isomorphic_vf2_impl` in `R/topology.R` (line 478)
95. `graph.subisomorphic.vf2 <- subisomorphic_vf2_impl` in `R/topology.R` (line 481)
96. `graph.count.isomorphisms.vf2 <- count_isomorphisms_vf2_impl` in `R/topology.R` (line 655)
97. `graph.count.subisomorphisms.vf2 <- count_subisomorphisms_vf2_impl` in `R/topology.R` (line 738)
98. `graph.isoclass <- isoclass_impl` in `R/topology.R` (line 870)
99. `graph_from_isomorphism_class <- isoclass_create_impl` in `R/topology.R` (line 889)
100. `canonical_permutation <- canonical_permutation_impl` in `R/topology.R` (line 1000)
101. `permute <- permute_vertices_impl` in `R/topology.R` (line 1042)
102. `graph.isomorphic <- isomorphic_impl` in `R/topology.R` (line 1046)
103. `count_automorphisms <- count_automorphisms_impl` in `R/topology.R` (line 1132)
104. `automorphism_group <- automorphism_group_impl` in `R/topology.R` (line 1207)
105. `is_forest <- is_forest_impl` in `R/trees.R` (line 99)
106. `to_prufer <- to_prufer_impl` in `R/trees.R` (line 126)
107. `sample_spanning_tree <- random_spanning_tree_impl` in `R/trees.R` (line 155)
108. `triangles <- list_triangles_impl` in `R/triangles.R` (line 92)
109. `count_triangles <- count_adjacent_triangles_impl` in `R/triangles.R` (line 97)

## Breakdown by File

- **R/assortativity.R**: 2 instances
- **R/bipartite.R**: 2 instances
- **R/centrality.R**: 4 instances
- **R/centralization.R**: 5 instances
- **R/cliques.R**: 9 instances
- **R/coloring.R**: 1 instance
- **R/community.R**: 2 instances
- **R/components.R**: 3 instances
- **R/conversion.R**: 2 instances
- **R/cycles.R**: 1 instance
- **R/degseq.R**: 1 instance
- **R/efficiency.R**: 3 instances
- **R/embedding.R**: 3 instances
- **R/eulerian.R**: 2 instances
- **R/flow.R**: 7 instances
- **R/games.R**: 11 instances
- **R/glet.R**: 1 instance
- **R/hrg.R**: 2 instances
- **R/layout.R**: 1 instance
- **R/make.R**: 3 instances
- **R/motifs.R**: 1 instance
- **R/operators.R**: 1 instance
- **R/other.R**: 1 instance
- **R/paths.R**: 4 instances
- **R/simple.R**: 2 instances
- **R/sir.R**: 1 instance
- **R/structural-properties.R**: 15 instances
- **R/structure.info.R**: 1 instance
- **R/topology.R**: 12 instances
- **R/trees.R**: 3 instances
- **R/triangles.R**: 2 instances

## Notes

- All these functions are exported in the `NAMESPACE` file
- The `_impl` suffix typically indicates an implementation function that's wrapped or aliased
- These direct aliases mean the exported function is exactly the same as the implementation function
