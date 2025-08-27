# igraph C library changelog

## [develop]

### Breaking changes

This section gives detailed on breaking changes you need to consider when updating code written for igraph 0.10.x.

#### General changes

 - igraph now requires a C++ compiler that supports the C++14 standard.
 - `igraph_setup()` is now recommended to be called before using the library. This function may gain essential functions in the future. See below for details.
 - `igraph_rng_set_default()` now returns a pointer to the previous RNG. Furthermore, this function now only stores a pointer to the `igraph_rng_t` struct passed to it, instead of copying the struct. Thus the `igraph_rng_t` must continue to exist for as long as it is used as the default RNG.
 - Interruption handlers do not take a `void*` argument any more; this is relevant to maintainers of higher-level interfaces only.
 - Interruption handlers now return an `igraph_bool_t` instead of an `igraph_error_t`; the returned value must be true if the calculation has to be interrupted and false otherwise.
 - `igraph_status()`, `igraph_statusf()` and their macro versions (`IGRAPH_STATUS()` and `IGRAPH_STATUSF()`) do not convert error codes to `IGRAPH_INTERRUPTED` any more. Any error code returned from the status handler function is forwarded intact to the caller. If you want to trigger the interruption of the current calculation from the status handler without reporting an error, report `IGRAPH_INTERRUPTED` explicitly. It is the responsibility of higher-level interfaces to handle this error code appropriately.
 - The `RNG_BEGIN()` and `RNG_END()` macros were removed. You are now responsible for seeding the RNG before using any igraph function that may use random numbers by calling `igraph_rng_seed(igraph_rng_default(), ...)`, or by simply ensuring that `igraph_setup()` was called before the first use of the library.

#### Error codes

 - The `IGRAPH_EINVEVECTOR` error code was removed; `igraph_create()` and `igraph_add_edges()` that used to return this error code for invalid edge vectors will now return `IGRAPH_EINVAL` instead.
 - The `IGRAPH_NONSQUARE` error code was removed; functions that used this error code now return `IGRAPH_EINVAL` instead when encountering a non-square matrix.
 - The `IGRAPH_EGLP` error code and all other GLP-specific error codes (starting with `IGRAPH_GLP_`) were removed; functions that used this error code now return `IGRAPH_FAILURE` instead, providing more details in the message associated to the error code.
 - The `IGRAPH_ELAPACK` error code was removed; functions that used this error code now return `IGRAPH_FAILURE` instead, providing more details in the message associated to the error code.
 - The `IGRAPH_CPUTIME` error code was removed in favour of the interruption mechanism built into igraph.
 - The unused `IGRAPH_EDIVZERO` and `IGRAPH_EATTRIBUTES` error codes were removed with no replacement.
 - The deprecated error code `IGRAPH_ENEGLOOP` was removed. Use `IGRAPH_ENEGCYCLE` instead. The underlying numerical value is the same as it was for `IGRAPH_ENEGLOOP`.
 - ARPACK-specific error codes (starting with `IGRAPH_ARPACK_...`) were replaced with a single `IGRAPH_EARPACK` error code. Details about the underlying ARPACK failure are provided in the error message.
 - A new error code called `IGRAPH_EINVEID` was added for cases when an invalid edge ID was encountered in an edge ID vector.

#### Core data structures

 - `igraph_strvector_push_back_len()` now takes a length parameter of `size_t` instead of `igraph_integer_t`.
 - `igraph_strvector_print()` no longer takes a file parameter. Use `igraph_strvector_fprint()` to print to a file.
 - `igraph_vector_reverse()` no longer returns an error code.
 - `igraph_vector_shuffle()` no longer returns an error code.
 - `igraph_vector_swap()` and `igraph_matrix_swap()` no longer return an error code.
 - `igraph_vector_list_swap()` and `igraph_graph_list_swap()` no longer return an error code.
 - `igraph_vector_swap_elements()` no longer returns an error code.
 - `igraph_vector_list_swap_elements()` and `igraph_graph_list_swap_elements()` no longer return an error code.
 - `igraph_matrix_copy_to()` gained an `igraph_matrix_storage_t storage` parameter that specifies whether the data should be written in column-major or row-major format.

#### Attribute handling

 - `igraph_attribute_handler_t` members that formerly took an untyped `igraph_vector_ptr_t` argument are now taking a typed `igraph_attribute_record_list_t` argument instead.
 - The deprecated `IGRAPH_ATTRIBUTE_DEFAULT` value of the `igraph_attribute_type_t` enum was removed.
 - The `gettype` member of `igraph_attribute_table_t` was renamed to `get_type` for sake of consistency with the naming scheme of other struct members.
 - Attribute table members that retrieve graph, vertex or edge attributes must not clear the incoming result vector any more; results must be appended to the end of the provided result vector instead.
 - The `value` member of `igraph_attribute_record_t` is now a union that can be used to formally treat the associated pointer as an `igraph_vector_t *`, `igraph_strvector_t *` or `igraph_vector_bool_t *`.

#### Core graph manipulation

 - `igraph_delete_vertices_map()` (formerly called `igraph_delete_vertices_idx()`) and `igraph_induced_subgraph_map()` now use `-1` to represent unmapped vertices in the returned forward mapping vector and they do not offset vertex indices by 1 any more. (Note that the inverse map always behaved this way, this change makes the two mappings consistent).
 - `igraph_edges()` gained a new `bycol` argument that determines the order in which the edges are returned. `bycol = false` reproduces the existing behaviour, while `bycol = true` returns the edges suitable for a matrix stored in column-wise order.
 - `igraph_neighbors()` and `igraph_vs_adj()` gained two extra arguments to specify what to do with loop and multiple edges. This makes their interfaces consistent with `igraph_adjlist_init()`.
 - `igraph_incident()` and `igraph_es_incident()` gained an extra arguments to specify what to do with loop edges. This makes their interfaces consistent with `igraph_inclist_init()`.
 - `igraph_multiple_t` was removed from the public API as it is essentially a boolean. The symbolic constants `IGRAPH_MULTIPLE` and `IGRAPH_NO_MULTIPLE` were kept to improve readability of code written directly in C.

#### Basic graph properties

 - `igraph_density()` now takes an optional `weights` parameter.
 - `igraph_is_simple()` gained an extra `igraph_bool_t` argument that decides whether edge directions should be considered. Directed graphs with a mutual edge pair are treated as non-simple if this argument is set to `IGRAPH_UNDIRECTED` (which treats the graph as if it was undirected).
 - The type of the `loops` argument of `igraph_adjlist_init_complementer()`, `igraph_centralization_degree()`, `igraph_centralization_degree_tmax()`, `igraph_degree()`, `igraph_maxdegree()`, `igraph_sort_vertex_ids_by_degree()` and `igraph_strength()` was changed to `igraph_loops_t` from `igraph_bool_t`, allowing finer-grained control about how loop edges are treated.
 - `igraph_get_biadjacency()` now takes a `weights` parameter, and can optionally create weighted biadjacency matrices.
 - `igraph_adjacency()` now treats `IGRAPH_LOOPS_TWICE` as `IGRAPH_LOOPS_ONCE` when the mode is `IGRAPH_ADJ_DIRECTED`, `IGRAPH_ADJ_UPPER` or `IGRAPH_ADJ_LOWER`. For directed graphs, this is for the sake of consistency with the rest of the library where `IGRAPH_LOOPS_TWICE` is considered for undirected graphs only. For the "upper" and "lower" modes, double-counting the diagonal makes no sense because the double-counting artifact appears when you add the _transpose_ of an upper (or lower) diagonal matrix on top of the matrix itself. See Github issue #2501 for more context.

#### Graph generators

 - `igraph_barabasi_game()`, `igraph_barabasi_aging_game()`, `igraph_recent_degree_game()` and `igraph_recent_degree_aging_game()` no longer interprets an empty `outseq` vector as a missing out-degree sequence. Pass `NULL` if you don't wish to specify an out-degree sequence.
 - `igraph_degree_sequence_game()` no longer interprets an empty in-degree vector as a request for generating undirected graphs. To generate undirected graphs, pass `NULL` for in-degrees.
 - `igraph_lcf()` was renamed to `igraph_lcf_small()` and `igraph_lcf_vector()` was renamed to `igraph_lcf()`. Now `igraph_lcf()` takes shifts as a vector input, while `igraph_lcf_small()` accepts a shorthand notation where shifts are given as a variable number of function arguments.
 - `igraph_sbm_game()` gained a `multiple` parameter and now supports generating multigraph with prescribed expected edge multiplicities. The parameter determining the total number of vertices (`n`) was removed as it was redundant.

#### Shortest paths

 - `igraph_distances()`, `igraph_distances_cutoff()`, `igraph_get_shortest_path()`, `igraph_get_shortest_paths()` and `igraph_get_all_shortest_paths()` gained a `weights` argument. The functions now automatically select the appropriate implementation (unweighted, Dijkstra, Bellman-Ford or Johnson) algorithm based on whether weights are present and whether there are negative weights or not. You can still call the individual methods by their more specific names.
 - `igraph_distances_johnson()` now takes a mode parameter to determine in which direction paths should be followed.
 - `igraph_similarity_jaccard()` and `igraph_similarity_dice()` now take two sets of vertices to create vertex pairs of, instead of one.
 - The weighted variants of `igraph_diameter()`, `igraph_pseudo_diameter()`, `igraph_radius()`, `igraph_graph_center()`, `igraph_eccentricity()` and `igraph_average_path_length()` were merged into the undirected ones by adding a new argument named `weights` in the second position.
 - The `weights` parameter of `igraph_average_path_length()`, `igraph_global_efficiency()`, `igraph_local_efficiency()` and `igraph_average_local_efficiency()` were moved to the second position, after the `graph` itself, for sake of consistency with other functions.
 - `igraph_get_all_simple_paths()` returns its results in an integer vector list (`igraph_vector_int_list_t`) instead of a single integer vector.
 - `igraph_get_all_simple_paths()` now has an additional parameter that allows restricting paths by minimum length as well.

#### Community detection

 - `igraph_community_edge_betweenness()` now takes both a `weights` and a `lengths` parameter. Egde weights (interpreted as connection strengths) are used to divide betweenness scores before selecting them for removal as well as for the modularity computation. Edge lengths are used for defining shortest path lengths during the betweenness computation. This fixes issues #2229 and #1040.
 - `igraph_community_infomap()` now supports regularization and gained the `is_regularized` and `regularization_strength` parameters.
 - `igraph_community_label_propagation()` changed signature to allow specification of label propagation algorithm (LPA) variants. A new fast label propagation variant was added.
 - `igraph_community_leiden()` now takes two `vertex_out_weights` and `vertex_in_weights` parameters in order to support directed graphs, instead of the previous single `node_weights` parameter. To obtain the old behavior for undirected graphs, pass the vertex weights as `vertex_out_weights` and set `vertex_in_weights` to `NULL`.
 - The `history` parameter of `igraph_community_leading_eigenvector()` is now a pointer to an `igraph_vector_int_t` instead of an `igraph_vector_t`.
 - `igraph_community_optimal_modularity()` now takes a `resolution` parameter and its `weight` parameter was moved to the second place.
 - `igraph_community_spinglass_single()` now uses `igraph_real_t` for its `inner_links` and `outer_links` output parameters, as these return not simply edge counts, but the sum of the weights of some edges.

#### Isomorphism functions and permutations

 - `igraph_count_automorphisms()` has been renamed to `igraph_count_automorphisms_bliss()` because it has a BLISS-specific interface. A new `igraph_count_automorphisms()` function was added with a simplified interface that does not depend on BLISS.
 - `igraph_automorphism_group()` has been renamed to `igraph_automorphism_group_bliss()` because it has a BLISS-specific interface. A new `igraph_automorphism_group()` function was added with a simplified interface that does not depend on BLISS.
 - `igraph_canonical_permutation()` has been renamed to `igraph_canonical_permutation_bliss()` because it has a BLISS-specific interface. A new `igraph_canonical_permutation()` function was added with a simplified interface that does not depend on BLISS.
 - `igraph_subisomorphic_lad()` does not have a CPU time limit parameter any more. If you wish to stop the calculation from another thread or a higher level interface, use igraph's interruption mechanism.
 - The semantics of the `igraph_permute_vertices()` permutation argument has changed: the i-th element of the vector now contains the index of the _original_ vertex that will be mapped to the i-th vertex in the new graph. This is now consistent with how other igraph functions treat permutations and vertex index vectors; for instance, you can now pass the result of `igraph_topological_sorting()` directly to `igraph_permute_vertices()` to obtain a new graph where the vertices are sorted topologically.
 - As a consequence to the change in the semantics of the `igraph_permute_vertices()` permutation argument, the semantics of the permutations returned from `igraph_canonical_permutation()` and `igraph_canonical_permutation_bliss()` have also been inverted to maintain the invariant that the output of these functions can be fed into `igraph_permute_vertices()` directly.

#### Centralities

 - All betweenness functions got `normalized` parameter to support normalizing the result by the number of vertex pairs in the graph. At the same time, parameter ordering was standardized. The following functions are affected: `igraph_betweenness()`, `igraph_betweenness_cutoff()`, `igraph_edge_betweenness()`, `igraph_edge_betweenness_cutoff()`, `igraph_betweenness_subset()`, `igraph_edge_betweenness_subset()`.
 - `igraph_edge_betweenness()` and `igraph_edge_betweenness_cutoff()` now have an `eids` parameter to return only a subset of results. This makes their interface consistent with other betweenness functions.
 - `igraph_eigenvector_centrality()`, `igraph_centralization_eigenvector_centrality()` and `igraph_centralization_eigenvector_centrality_tmax()` now use a `mode` parameter with possible values `IGRAPH_OUT`, `IGRAPH_IN` or `IGRAPH_ALL` to control how edge directions are considered. Previously they used a boolean `directed` parameter.
 - `igraph_eigenvector_centrality()`, `igraph_centralization_eigenvector_centrality()` and `igraph_centralization_eigenvector_centrality_tmax()` no longer have a `scale` parameter. The result is now always scaled so that the largest centrality value is 1.
 - `igraph_hub_and_authority_scores()` no longer has a `scale` parameter. The result is now always scaled so that the largest hub and authority scores are each 1.
 - `igraph_pagerank()`, `igraph_personalized_pagerank()` and `igraph_personalized_pagerank_vs()` had their parameter ordering standardized.

#### Other network analysis

 - `igraph_minimum_spanning_tree()` takes a new `method` parameter that controls the algorithm used for finding the spanning tree. Kruskal's algorithm was added.
 - The deprecated `igraph_rng_get_dirichlet()` function was removed.
 - `igraph_motifs_randesu_no()` and `igraph_motifs_randesu_estimate()` now take an `igraph_real_t` as their `result` argument to prevent overflows when igraph is compiled with 32-bit integers.
 - The experimental functions `igraph_fundamental_cycles()` and `igraph_minimum_cycle_basis()` now use the type `igraph_real_t` for their `bfs_cutoff` parameter, and had their `weights` parameter moved to the 2nd position.
 - `igraph_rewire()` now takes an `igraph_edge_type_sw_t` parameter to specify whether to create self-loops. The `igraph_rewiring_t` enum type was removed. Instead of the old `IGRAPH_REWIRING_SIMPLE`, use `IGRAPH_SIMPLE_SW`. Instead of the old `IGRAPH_REWIRING_SIMPLE_LOOPS`, use `IGRAPH_LOOPS_SW`.

#### Foreign formats

 - `igraph_read_graph_ncol()` and `igraph_read_graph_lgl()` now uses a default edge weight of 1 instead of 0 for files that do not contain edge weights for at least some of the edges.

### Added

 - `igraph_setup()` performs all initialization tasks that are recommended before using the igraph library. Right now this function only initializes igraph's internal random number generator with a practically random seed, but it may also perform other tasks in the future. It is recommended to call this function before using any other function from the library (although most of the functions will work fine now even if this function is not called).
 - `igraph_int_t` may now be used as an alias to `igraph_integer_t`.
 - `igraph_erdos_renyi_game_gnm()` gained a `multiple` Boolean argument to uniformly sample G(n,m) graphs with multi-edges.
 - `igraph_bipartite_game_gnm()` gained a `multiple` Boolean argument to uniformly sample bipartite G(n,m) graphs with multi-edges.
 - `igraph_iea_game()` samples random multigraphs through independent edge assignment.
 - `igraph_bipartite_iea_game()` samples random bipartite multigraph through independent edge assignment.
 - `igraph_weighted_biadjacency()` creates a weighted graph from a bipartite adjacency matrix.
 - `igraph_vector_ptr_capacity()` returns the allocated capacity of a pointer vector.
 - `igraph_vector_ptr_resize_min()` deallocates unused capacity of a pointer vector.
 - `igraph_strvector_fprint()` prints a string vector to a file.
 - `igraph_rng_sample_dirichlet()`, `igraph_rng_sample_sphere_volume()` and `igraph_rng_sample_sphere_surface()` samples vectors from a Dirichlet distribution or from the volume or surface of a sphere while allowing the user to specify the random number generator to use.
 - `igraph_nearest_neighbor_graph()` computes a neighborhood graph of spatial points based on a neighbor count, cutoff distance, and chosen metric (experimental function). Thanks to Arnór Friðriksson @Zepeacedust for implementing this in #2788!
 - `igraph_delaunay_graph()` computes a Delaunay graph of a spatial point set (experimental function). Thanks to Arnór Friðriksson @Zepeacedust for implementing this in #2806!
 - `igraph_spatial_edge_lengths()` computes edges lengths based on spatial vertex coordinates (experimental function).
 - `igraph_community_leiden_simple()` is a simplified interface to `igraph_community_leiden()` that allows selecting the objective function to maximize directly.
 - `igraph_vector_difference_and_intersection_sorted()` calculates the intersection and the differences of two vectors simultaneously.

### Changed

 - The Pajek format reader and writer now map vertex labels to the `name` vertex attribute in igraph. The `id` attribute is no longer used.
 - `igraph_minimum_size_separators()` no longer returns any separating vertex sets for complete graphs. Prior to igraph 1.0, it would return all `n - 1` size vertex subsets where `n` is the vertex count.
 - `igraph_community_edge_betweenness()` now treats edges with large weights as strong connections.
 - `igraph_biadjacency()` now truncates non-integer matrix entries to their integer part instead of rounding them up. This brings consistency with related functions such as `igraph_adjacency()`.
 - The order of edges in the graph returned by `igraph_(weighted_)adjacency()` and `igraph_biadjacency()` has changed. Note that these functions do not guarantee any specific edge order.
 - `igraph_eigenvector_centrality()` now warns about eigenvector centralities equal to zero, as these indicate a disconnected graph, for which eigenvector centrality is not meaningful.
 - `igraph_hub_and_authority_scores()` now warns when a large fraction of centrality scores are zero, as this indicates a non-unique solution, and thus the returned result may not be meaningful.
 - `igraph_hub_and_authority_scores()` now warns when providing an undirected graph as input, and falls back to the equivalent eigenvector centrality computation.
 - `igraph_get_stochastic_sparse()` no longer throws an error when some row or column sums are zero. This brings its behaviour in line with `igraph_get_stochastic()`.
 - `igraph_vector_append()`, `igraph_strvector_append()` and `igraph_vector_ptr_append()` now use a different allocation strategy: if the `to` vector has insufficient capacity, they double its capacity. Previously they reserved precisely as much capacity as needed for appending the `from` vector.
 - The implementation of the Infomap algorithm behind `igraph_community_infomap()` has been updated with a more recent version (2.8.0). Isolated vertices are now supported.
 - `igraph_vector_difference_sorted()` now handles multisets properly (and documents how the multiplicities are handled).

### Finalized experimental functions

 - The following functions are not experimental any more: `igraph_count_loops()`, `igraph_count_reachable()`, `igraph_distances_cutoff()`, `igraph_distances_floyd_warshall()`, `igraph_distances_dijkstra_cutoff()`, `igraph_ecc()`, `igraph_enter_safelocale()`, `igraph_exit_safelocale()`, `igraph_feedback_vertex_set()`, `igraph_find_cycle()`, `igraph_get_shortest_path_astar()`, `igraph_graph_power()`,  `igraph_hexagonal_lattice()`,  `igraph_hypercube()`, `igraph_is_clique()`, `igraph_is_complete()`, `igraph_is_edge_coloring()`, `igraph_is_vertex_coloring()`,  `igraph_is_independent_vertex_set()`, `igraph_join()`,`igraph_joint_degree_distribution()`, `igraph_joint_degree_matrix()`, `igraph_joint_type_distribution()`, `igraph_layout_align()`, `igraph_layout_merge_dla()`, `igraph_mean_degree()`, `igraph_radius()`, `igraph_realize_bipartite_degree_sequence()`, `igraph_reachability()`, `igraph_transitive_closure()`, `igraph_tree_from_parent_vector()`, `igraph_triangular_lattice()`, `igraph_vector_intersection_size_sorted()`, `igraph_voronoi()`.

### Fixed

 - `igraph_community_spinglass_single()` now uses `igraph_real_t` for its `inner_links` and `outer_links` output parameters, as these return not simply edge counts, but the sum of the weights of some edges. Thus these results are no longer incorrectly rounded.

### Removed

 - Removed `igraph_Calloc()`, `igraph_Realloc()` and `igraph_Free()`. Use `IGRAPH_CALLOC()`, `IGRAPH_REALLOC()` and `IGRAPH_FREE()` instead.
 - The deprecated `igraph_adjacent_triangles()` was removed. Use `igraph_count_adjacent_triangles()` instead.
 - The deprecated `igraph_are_connected()` was removed. Use `igraph_are_adjacent()` instead.
 - The deprecated `igraph_automorphisms()` was removed. Use `igraph_count_automorphisms()` or `igraph_count_automorphisms_bliss()` instead.
 - The deprecated `igraph_convex_hull()` was removed. Use `igraph_convex_hull_2d()` instead.
 - The deprecated `igraph_decompose_destroy()` was removed.
 - The deprecated `igraph_hub_score()` and `igraph_authority_score()` were removed.
 - The deprecated `igraph_vs_seq()`, `igraph_vss_seq()`, `igraph_es_seq()`, `igraph_ess_range()`, and `igraph_vector_init_seq()` were removed. Use the `range` alternatives instead of the old `seq` ones.
 - The deprecated `igraph_erdos_renyi_game()` and `igraph_bipartite_game()` were removed. Use the corresponding functions with `_gnm()` and `_gnp()` in the name instead.
 - The deprecated `igraph_tree()` was removed. Use `igraph_kary_tree()` instead.
 - The deprecated `igraph_lattice()` was removed. Use `igraph_square_lattice()` instead.
 - The deprecated `igraph_minimum_spanning_tree_prim()` was removed. Use `igraph_minimum_spanning_tree()` in conjunction with `igraph_subgraph_from_edges()` instead.
 - The deprecated `igraph_minimum_spanning_tree_unweighted()` was removed. Use `igraph_minimum_spanning_tree()` in conjunction with `igraph_subgraph_from_edges()` instead.
 - The deprecated `igraph_get_sparsemat()` was removed. Use `igraph_get_adjacency_sparse()` instead.
 - The deprecated `igraph_get_stochastic_sparsemat()` was removed. Use `igraph_get_stochastic_sparse()` instead.
 - The deprecated `igraph_laplacian()` was removed. Use `igraph_get_laplacian()` or `igraph_get_laplacian_sparse()` instead.
 - The deprecated `igraph_subgraph_edges()` was removed. Use `igraph_subgraph_from_edges()` instead.
 - The deprecated `igraph_read_graph_dimacs()` and `igraph_write_graph_dimacs()` were removed. These names may be re-used in the future. Use `igraph_read_graph_dimacs_flow()` and `igraph_write_graph_dimacs_flow()` instead.
 - The deprecated `igraph_isomorphic_function_vf2()` was removed. Use `igraph_get_isomorphisms_vf2_callback()` instead.
 - The deprecated `igraph_subisomorphic_function_vf2()` was removed. Use `igraph_get_subisomorphisms_vf2_callback()` instead.
 - The deprecated `igraph_isomorphic_34()` was removed. Its functionality is accessible through `igraph_isomorphic()`.
 - The deprecated `igraph_transitive_closure_dag()` was removed. Use `igraph_transitive_closure()` instead, which works for all graphs, not just DAGs.
 - The deprecated `igraph_sparsemat_copy()` was removed. Use `igraph_sparsemat_init_copy()` instead.
 - The deprecated `igraph_sparsemat_eye()` was removed. Use `igraph_sparsemat_init_eye()` instead.
 - The deprecated `igraph_sparsemat_diag()` was removed. Use `igraph_sparsemat_init_diag()` instead.
 - The deprecated `igraph_sparsemat()` and `igraph_weighted_sparsemat()` functions were removed; use `igraph_get_adjacency_sparse()` instead.
 - The deprecated `igraph_random_edge_walk()` was removed. Its functionality is incorporated in `igraph_random_walk()`.
 - The deprecated `igraph_vector_qsort_ind()` was removed. Use `igraph_vector_sort_ind()` instead.
 - The deprecated `igraph_vector_binsearch2()` was removed. Use `igraph_vector_contains_sorted()` instead.
 - The deprecated `igraph_vector_copy()` and `igraph_matrix_copy()` were removed. Use `igraph_vector_init_copy()` and `igraph_matrix_init_copy()` instead.
 - The deprecated `igraph_vector_e()`, `igraph_vector_e_ptr()`, `igraph_matrix_e()` and `igraph_matrix_e_ptr()` were removed. Use the alternatives ending in `_get()` and `_get_ptr()` instead.
 - The deprecated `igraph_vector_move_interval2()` was removed.
 - The deprecated `igraph_zeroin()` was removed.
 - The deprecated `igraph_deterministic_optimal_imitation()`, `igraph_moran_process()`, `igraph_roulette_wheel_imitation()` and `igraph_stochastic_imitation()` functions were removed.
 - `igraph_sample_dirichlet()`, `igraph_sample_sphere_surface()` and `igraph_sample_sphere_volume()` were removed in favour of `igraph_rng_sample_dirichlet()`, `igraph_rng_sample_sphere_surface()` and `igraph_rng_sample_sphere_volume()`, which allow the user to specify the random number generator to use.
 - The unused enum type `igraph_fileformat_type_t` was removed.
 - The macros `IGRAPH_POSINFINITY` and `IGRAPH_NEGINFINITY` were removed. Use `IGRAPH_INFINITY` and `-IGRAPH_INFINITY` instead.

### Deprecated

- `igraph_delete_vertices_idx()` is now deprecated in favour of `igraph_delete_vertices_map()`, which is functionally equivalent but has a name that is consistent with `igraph_induced_subgraph_map()`.

### Other

 - Documentation improvements.
 - Improved performance when creating graphs from dense adjacency matrices (`igraph_adjacency()` and `igraph_weighted_adjacency()`).