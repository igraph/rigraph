# are_adjacent_impl basic

    Code
      are_adjacent_impl(graph = g, v1 = 1, v2 = 2)
    Output
      [1] TRUE

# are_adjacent_impl errors

    Code
      are_adjacent_impl(graph = NULL, v1 = 1, v2 = 2)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# spanner_impl basic

    Code
      spanner_impl(graph = g, stretch = 2)
    Output
      + 2/2 edges:
      [1] 1--2 2--3

---

    Code
      spanner_impl(graph = g, stretch = 2)
    Output
      + 5/5 edges:
      [1] 1--2 2--3 3--4 4--5 1--5

# spanner_impl errors

    Code
      spanner_impl(graph = NULL, stretch = 2)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# transitivity_undirected_impl basic

    Code
      transitivity_undirected_impl(graph = g)
    Output
      [1] 0

---

    Code
      transitivity_undirected_impl(graph = g, mode = "zero")
    Output
      [1] 0

# transitivity_undirected_impl errors

    Code
      transitivity_undirected_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# transitivity_local_undirected_impl basic

    Code
      transitivity_local_undirected_impl(graph = g)
    Output
      [1] NaN   0 NaN

---

    Code
      transitivity_local_undirected_impl(graph = g, mode = "zero")
    Output
      [1] 0 0 0

# transitivity_local_undirected_impl errors

    Code
      transitivity_local_undirected_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# transitivity_avglocal_undirected_impl basic

    Code
      transitivity_avglocal_undirected_impl(graph = g)
    Output
      [1] 0

---

    Code
      transitivity_avglocal_undirected_impl(graph = g, mode = "zero")
    Output
      [1] 0

# transitivity_avglocal_undirected_impl errors

    Code
      transitivity_avglocal_undirected_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# transitivity_barrat_impl basic

    Code
      transitivity_barrat_impl(graph = g)
    Condition
      Warning in `transitivity_barrat_impl()`:
      No weights given for Barrat's transitivity, unweighted version is used.
      Source: properties/triangles.c:913
    Output
      [1] NaN   0 NaN

---

    Code
      transitivity_barrat_impl(graph = g, mode = "zero")
    Condition
      Warning in `transitivity_barrat_impl()`:
      No weights given for Barrat's transitivity, unweighted version is used.
      Source: properties/triangles.c:913
    Output
      [1] 0 0 0

# transitivity_barrat_impl errors

    Code
      transitivity_barrat_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# ecc_impl basic

    Code
      ecc_impl(graph = g)
    Output
      [1] NaN   0 NaN

---

    Code
      ecc_impl(graph = g, k = 3, offset = TRUE, normalize = FALSE)
    Output
      [1] 1 1 1

# ecc_impl errors

    Code
      ecc_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# reciprocity_impl basic

    Code
      reciprocity_impl(graph = g)
    Output
      [1] 1

---

    Code
      reciprocity_impl(graph = g, ignore_loops = FALSE, mode = "ratio")
    Output
      [1] 1

# reciprocity_impl errors

    Code
      reciprocity_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# density_impl basic

    Code
      density_impl(graph = g)
    Output
      [1] 0.6666667

---

    Code
      density_impl(graph = g, loops = TRUE)
    Output
      [1] 0.3333333

# density_impl errors

    Code
      density_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# mean_degree_impl basic

    Code
      mean_degree_impl(graph = g)
    Output
      [1] 1.333333

---

    Code
      mean_degree_impl(graph = g, loops = FALSE)
    Output
      [1] 1.333333

# mean_degree_impl errors

    Code
      mean_degree_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# is_loop_impl basic

    Code
      is_loop_impl(graph = g)
    Output
      [1] FALSE FALSE

# is_loop_impl errors

    Code
      is_loop_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# is_simple_impl basic

    Code
      is_simple_impl(graph = g)
    Output
      [1] TRUE

# is_simple_impl errors

    Code
      is_simple_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# is_multiple_impl basic

    Code
      is_multiple_impl(graph = g)
    Output
      [1] FALSE FALSE

# is_multiple_impl errors

    Code
      is_multiple_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# has_loop_impl basic

    Code
      has_loop_impl(graph = g)
    Output
      [1] FALSE

# has_loop_impl errors

    Code
      has_loop_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# has_multiple_impl basic

    Code
      has_multiple_impl(graph = g)
    Output
      [1] FALSE

# has_multiple_impl errors

    Code
      has_multiple_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# count_loops_impl basic

    Code
      count_loops_impl(graph = g)
    Output
      [1] 0

# count_loops_impl errors

    Code
      count_loops_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# count_multiple_impl basic

    Code
      count_multiple_impl(graph = g)
    Output
      [1] 1 1

# count_multiple_impl errors

    Code
      count_multiple_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# is_mutual_impl basic

    Code
      is_mutual_impl(graph = g)
    Output
      [1] TRUE TRUE

---

    Code
      is_mutual_impl(graph = g, loops = FALSE)
    Output
      [1] TRUE TRUE

# is_mutual_impl errors

    Code
      is_mutual_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# has_mutual_impl basic

    Code
      has_mutual_impl(graph = g)
    Output
      [1] TRUE

---

    Code
      has_mutual_impl(graph = g, loops = FALSE)
    Output
      [1] TRUE

# has_mutual_impl errors

    Code
      has_mutual_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# maximum_cardinality_search_impl basic

    Code
      maximum_cardinality_search_impl(graph = g)
    Output
      $alpha
      [1] 3 2 1
      
      $alpham1
      + 3/3 vertices:
      [1] 3 2 1
      

# maximum_cardinality_search_impl errors

    Code
      maximum_cardinality_search_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# avg_nearest_neighbor_degree_impl basic

    Code
      avg_nearest_neighbor_degree_impl(graph = g)
    Output
      $knn
      [1] 2 1 2
      
      $knnk
      [1] 2 1
      

---

    Code
      avg_nearest_neighbor_degree_impl(graph = g, mode = "in", neighbor_degree_mode = "out")
    Output
      $knn
      [1] 2 1 2
      
      $knnk
      [1] 2 1
      

# avg_nearest_neighbor_degree_impl errors

    Code
      avg_nearest_neighbor_degree_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# degree_correlation_vector_impl basic

    Code
      degree_correlation_vector_impl(graph = g)
    Output
      [1] NaN   2   1

---

    Code
      degree_correlation_vector_impl(graph = g, from_mode = "in", to_mode = "out",
        directed_neighbors = FALSE)
    Output
      [1] NaN   2   1

# degree_correlation_vector_impl errors

    Code
      degree_correlation_vector_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# rich_club_sequence_impl basic

    Code
      rich_club_sequence_impl(graph = g, vertex_order = 1:3)
    Output
      [1] 0.6666667 1.0000000       NaN

---

    Code
      rich_club_sequence_impl(graph = g, vertex_order = 1:3, normalized = FALSE,
      loops = TRUE, directed = FALSE)
    Output
      [1] 2 1 0

# rich_club_sequence_impl errors

    Code
      rich_club_sequence_impl(graph = NULL, vertex_order = 1:3)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# assortativity_nominal_impl basic

    Code
      assortativity_nominal_impl(graph = g, types = c(1, 2, 1))
    Output
      [1] -1

---

    Code
      assortativity_nominal_impl(graph = g, types = c(1, 2, 1), directed = FALSE,
      normalized = FALSE)
    Output
      [1] -0.5

# assortativity_nominal_impl errors

    Code
      assortativity_nominal_impl(graph = NULL, types = c(1, 2, 1))
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# assortativity_impl basic

    Code
      assortativity_impl(graph = g, values = c(1, 2, 1))
    Output
      [1] -1

---

    Code
      assortativity_impl(graph = g, values = c(1, 2, 1), directed = FALSE,
      normalized = FALSE)
    Output
      [1] -0.25

# assortativity_impl errors

    Code
      assortativity_impl(graph = NULL, values = c(1, 2, 1))
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# assortativity_degree_impl basic

    Code
      assortativity_degree_impl(graph = g)
    Output
      [1] -1

---

    Code
      assortativity_degree_impl(graph = g, directed = FALSE)
    Output
      [1] -1

# assortativity_degree_impl errors

    Code
      assortativity_degree_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# joint_degree_matrix_impl basic

    Code
      joint_degree_matrix_impl(graph = g)
    Output
           [,1] [,2]
      [1,]    0    2
      [2,]    2    0

---

    Code
      joint_degree_matrix_impl(graph = g, max_out_degree = 2, max_in_degree = 2)
    Output
           [,1] [,2]
      [1,]    0    2
      [2,]    2    0

# joint_degree_matrix_impl errors

    Code
      joint_degree_matrix_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# joint_degree_distribution_impl basic

    Code
      joint_degree_distribution_impl(graph = g)
    Output
           [,1] [,2] [,3]
      [1,]    0  0.0  0.0
      [2,]    0  0.0  0.5
      [3,]    0  0.5  0.0

---

    Code
      joint_degree_distribution_impl(graph = g, from_mode = "in", to_mode = "out",
        directed_neighbors = FALSE, normalized = FALSE, max_from_degree = 2,
        max_to_degree = 2)
    Output
           [,1] [,2] [,3]
      [1,]    0    0    0
      [2,]    0    0    2
      [3,]    0    2    0

# joint_degree_distribution_impl errors

    Code
      joint_degree_distribution_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# joint_type_distribution_impl basic

    Code
      joint_type_distribution_impl(graph = g, from_types = c(1, 2, 1))
    Output
           [,1] [,2]
      [1,]  0.0  0.5
      [2,]  0.5  0.0

---

    Code
      joint_type_distribution_impl(graph = g, from_types = c(1, 2, 1), to_types = c(1,
        2, 1), directed = FALSE, normalized = FALSE)
    Output
           [,1] [,2]
      [1,]    0    2
      [2,]    2    0

# joint_type_distribution_impl errors

    Code
      joint_type_distribution_impl(graph = NULL, from_types = c(1, 2, 1))
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# diversity_impl basic

    Code
      diversity_impl(graph = g)
    Output
      [1] 0.0000000 0.9182958 0.0000000

# diversity_impl errors

    Code
      diversity_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# global_efficiency_impl basic

    Code
      global_efficiency_impl(graph = g)
    Output
      [1] 0.8333333

---

    Code
      global_efficiency_impl(graph = g, directed = FALSE)
    Output
      [1] 0.8333333

# global_efficiency_impl errors

    Code
      global_efficiency_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# local_efficiency_impl basic

    Code
      local_efficiency_impl(graph = g)
    Output
      [1] 0 0 0

---

    Code
      local_efficiency_impl(graph = g, directed = FALSE, mode = "in")
    Output
      [1] 0 0 0

# local_efficiency_impl errors

    Code
      local_efficiency_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# average_local_efficiency_impl basic

    Code
      average_local_efficiency_impl(graph = g)
    Output
      [1] 0

---

    Code
      average_local_efficiency_impl(graph = g, directed = FALSE, mode = "in")
    Output
      [1] 0

# average_local_efficiency_impl errors

    Code
      average_local_efficiency_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# trussness_impl basic

    Code
      trussness_impl(graph = g)
    Output
      [1] 2 2

# trussness_impl errors

    Code
      trussness_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# is_graphical_impl basic

    Code
      is_graphical_impl(out_deg = c(2, 2, 2))
    Output
      [1] TRUE

---

    Code
      is_graphical_impl(out_deg = c(2, 2, 2), in_deg = c(1, 1, 1),
      allowed_edge_types = "all")
    Output
      [1] FALSE

# is_graphical_impl errors

    Code
      is_graphical_impl(out_deg = "a")
    Condition
      Warning in `is_graphical_impl()`:
      NAs introduced by coercion
      Error in `is_graphical_impl()`:
      ! The value nan is not representable as an integer. Invalid value
      Source: <file>:<line>

# get_laplacian_impl basic

    Code
      get_laplacian_impl(graph = g)
    Output
           [,1] [,2] [,3]
      [1,]    1   -1    0
      [2,]   -1    2   -1
      [3,]    0   -1    1

---

    Code
      get_laplacian_impl(graph = g, mode = "in", normalization = "symmetric",
        weights = c(1, 2))
    Output
                 [,1]       [,2]       [,3]
      [1,]  1.0000000 -0.5773503  0.0000000
      [2,] -0.5773503  1.0000000 -0.8164966
      [3,]  0.0000000 -0.8164966  1.0000000

# get_laplacian_impl errors

    Code
      get_laplacian_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# get_laplacian_sparse_impl basic

    Code
      get_laplacian_sparse_impl(graph = g)
    Output
      $type
      [1] "triplet"
      
      $dim
      [1] 3 3
      
      $p
      [1] 0 1 2 0 1 1 2
      
      $i
      [1] 0 1 2 1 0 2 1
      
      $x
      [1]  1  2  1 -1 -1 -1 -1
      
      attr(,"class")
      [1] "igraph.tmp.sparse"

---

    Code
      get_laplacian_sparse_impl(graph = g, mode = "in", normalization = "symmetric",
        weights = c(1, 2))
    Output
      $type
      [1] "triplet"
      
      $dim
      [1] 3 3
      
      $p
      [1] 0 1 2 0 1 1 2
      
      $i
      [1] 0 1 2 1 0 2 1
      
      $x
      [1]  1.0000000  1.0000000  1.0000000 -0.5773503 -0.5773503 -0.8164966 -0.8164966
      
      attr(,"class")
      [1] "igraph.tmp.sparse"

# get_laplacian_sparse_impl errors

    Code
      get_laplacian_sparse_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# connected_components_impl basic

    Code
      connected_components_impl(graph = g)
    Output
      [1] 0 0 0

---

    Code
      connected_components_impl(graph = g, mode = "strong", details = TRUE)
    Output
      $membership
      [1] 0 0 0
      
      $csize
      [1] 3
      
      $no
      [1] 1
      

# connected_components_impl errors

    Code
      connected_components_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# is_connected_impl basic

    Code
      is_connected_impl(graph = g)
    Output
      [1] TRUE

---

    Code
      is_connected_impl(graph = g, mode = "strong")
    Output
      [1] TRUE

# is_connected_impl errors

    Code
      is_connected_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# articulation_points_impl basic

    Code
      articulation_points_impl(graph = g)
    Output
      + 1/3 vertex:
      [1] 2

# articulation_points_impl errors

    Code
      articulation_points_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# biconnected_components_impl basic

    Code
      biconnected_components_impl(graph = g)
    Output
      $no
      [1] 2
      
      $tree_edges
      $tree_edges[[1]]
      + 1/2 edge:
      [1] 2--3
      
      $tree_edges[[2]]
      + 1/2 edge:
      [1] 1--2
      
      
      $component_edges
      $component_edges[[1]]
      + 1/2 edge:
      [1] 2--3
      
      $component_edges[[2]]
      + 1/2 edge:
      [1] 1--2
      
      
      $components
      $components[[1]]
      + 2/3 vertices:
      [1] 3 2
      
      $components[[2]]
      + 2/3 vertices:
      [1] 2 1
      
      
      $articulation_points
      + 1/3 vertex:
      [1] 2
      

# biconnected_components_impl errors

    Code
      biconnected_components_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# bridges_impl basic

    Code
      bridges_impl(graph = g)
    Output
      + 2/2 edges:
      [1] 2--3 1--2

# bridges_impl errors

    Code
      bridges_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# is_biconnected_impl basic

    Code
      is_biconnected_impl(graph = g)
    Output
      [1] FALSE

# is_biconnected_impl errors

    Code
      is_biconnected_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# count_reachable_impl basic

    Code
      count_reachable_impl(graph = g, mode = "out")
    Output
      [1] 5 5 5 5 5

---

    Code
      count_reachable_impl(graph = g, mode = "in")
    Output
      [1] 5 5 5 5 5

# count_reachable_impl errors

    Code
      count_reachable_impl(graph = NULL, mode = "out")
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# bond_percolation_impl basic

    Code
      bond_percolation_impl(graph = g)
    Output
      $giant_size
      numeric(0)
      
      $vetex_count
      numeric(0)
      

# bond_percolation_impl errors

    Code
      bond_percolation_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# site_percolation_impl basic

    Code
      site_percolation_impl(graph = g)
    Output
      $giant_size
      [1] 1 2 3
      
      $edge_count
      [1] 0 1 2
      

# site_percolation_impl errors

    Code
      site_percolation_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# edgelist_percolation_impl basic

    Code
      edgelist_percolation_impl(edges = matrix(c(1, 2, 2, 3), ncol = 2))
    Output
      $giant_size
      [1] 2 3
      
      $vertex_count
      [1] 2 3
      

# edgelist_percolation_impl errors

    Code
      edgelist_percolation_impl(edges = "a")
    Condition
      Error in `edges - 1`:
      ! non-numeric argument to binary operator

# similarity_dice_impl basic

    Code
      similarity_dice_impl(graph = g)
    Output
           [,1] [,2] [,3]
      [1,]    1    0    1
      [2,]    0    1    0
      [3,]    1    0    1

---

    Code
      similarity_dice_impl(graph = g, vids = 1:2, mode = "in", loops = TRUE)
    Output
           [,1] [,2]
      [1,]  1.0  0.8
      [2,]  0.8  1.0

# similarity_dice_impl errors

    Code
      similarity_dice_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# similarity_dice_es_impl basic

    Code
      similarity_dice_es_impl(graph = g)
    Output
      [1] 0 0

---

    Code
      similarity_dice_es_impl(graph = g, es = 1:2, mode = "in", loops = TRUE)
    Output
      [1] 0.8 0.8

# similarity_dice_es_impl errors

    Code
      similarity_dice_es_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# similarity_dice_pairs_impl basic

    Code
      similarity_dice_pairs_impl(graph = g, pairs = matrix(c(1, 2, 2, 3), ncol = 2))
    Output
      [1] 0 0

---

    Code
      similarity_dice_pairs_impl(graph = g, pairs = matrix(c(1, 2, 2, 3), ncol = 2),
      mode = "in", loops = TRUE)
    Output
      [1] 0.8000000 0.6666667

# similarity_dice_pairs_impl errors

    Code
      similarity_dice_pairs_impl(graph = NULL, pairs = matrix(c(1, 2, 2, 3), ncol = 2))
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# similarity_inverse_log_weighted_impl basic

    Code
      similarity_inverse_log_weighted_impl(graph = g)
    Output
               [,1] [,2]     [,3]
      [1,] 0.000000    0 1.442695
      [2,] 0.000000    0 0.000000
      [3,] 1.442695    0 0.000000

---

    Code
      similarity_inverse_log_weighted_impl(graph = g, vids = 1:2, mode = "in")
    Output
           [,1] [,2]     [,3]
      [1,]    0    0 1.442695
      [2,]    0    0 0.000000

# similarity_inverse_log_weighted_impl errors

    Code
      similarity_inverse_log_weighted_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# similarity_jaccard_impl basic

    Code
      similarity_jaccard_impl(graph = g)
    Output
           [,1] [,2] [,3]
      [1,]    1    0    1
      [2,]    0    1    0
      [3,]    1    0    1

---

    Code
      similarity_jaccard_impl(graph = g, vids = 1:2, mode = "in", loops = TRUE)
    Output
                [,1]      [,2]
      [1,] 1.0000000 0.6666667
      [2,] 0.6666667 1.0000000

# similarity_jaccard_impl errors

    Code
      similarity_jaccard_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# similarity_jaccard_es_impl basic

    Code
      similarity_jaccard_es_impl(graph = g)
    Output
      [1] 0 0

---

    Code
      similarity_jaccard_es_impl(graph = g, es = 1:2, mode = "in", loops = TRUE)
    Output
      [1] 0.6666667 0.6666667

# similarity_jaccard_es_impl errors

    Code
      similarity_jaccard_es_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# similarity_jaccard_pairs_impl basic

    Code
      similarity_jaccard_pairs_impl(graph = g, pairs = matrix(c(1, 2, 2, 3), ncol = 2))
    Output
      [1] 0 0

---

    Code
      similarity_jaccard_pairs_impl(graph = g, pairs = matrix(c(1, 2, 2, 3), ncol = 2),
      mode = "in", loops = TRUE)
    Output
      [1] 0.6666667 0.5000000

# similarity_jaccard_pairs_impl errors

    Code
      similarity_jaccard_pairs_impl(graph = NULL, pairs = matrix(c(1, 2, 2, 3), ncol = 2))
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# get_adjacency_sparse_impl basic

    Code
      get_adjacency_sparse_impl(graph = g)
    Output
      $type
      [1] "triplet"
      
      $dim
      [1] 3 3
      
      $p
      [1] 0 1 1 2
      
      $i
      [1] 1 0 2 1
      
      $x
      [1] 1 1 1 1
      
      attr(,"class")
      [1] "igraph.tmp.sparse"

---

    Code
      get_adjacency_sparse_impl(graph = g, type = "upper", weights = c(1, 2), loops = "none")
    Output
      $type
      [1] "triplet"
      
      $dim
      [1] 3 3
      
      $p
      [1] 1 2
      
      $i
      [1] 0 1
      
      $x
      [1] 1 2
      
      attr(,"class")
      [1] "igraph.tmp.sparse"

# get_adjacency_sparse_impl errors

    Code
      get_adjacency_sparse_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# get_stochastic_impl basic

    Code
      get_stochastic_impl(graph = g)
    Output
           [,1] [,2] [,3]
      [1,]  0.0    1  0.0
      [2,]  0.5    0  0.5
      [3,]  0.0    1  0.0

---

    Code
      get_stochastic_impl(graph = g, column_wise = TRUE, weights = c(1, 2))
    Output
           [,1]      [,2] [,3]
      [1,]    0 0.3333333    0
      [2,]    1 0.0000000    1
      [3,]    0 0.6666667    0

# get_stochastic_impl errors

    Code
      get_stochastic_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# get_stochastic_sparse_impl basic

    Code
      get_stochastic_sparse_impl(graph = g)
    Output
      $type
      [1] "triplet"
      
      $dim
      [1] 3 3
      
      $p
      [1] 0 1 1 2
      
      $i
      [1] 1 0 2 1
      
      $x
      [1] 0.5 1.0 1.0 0.5
      
      attr(,"class")
      [1] "igraph.tmp.sparse"

---

    Code
      get_stochastic_sparse_impl(graph = g, column_wise = TRUE, weights = c(1, 2))
    Output
      $type
      [1] "triplet"
      
      $dim
      [1] 3 3
      
      $p
      [1] 0 1 1 2
      
      $i
      [1] 1 0 2 1
      
      $x
      [1] 1.0000000 0.3333333 0.6666667 1.0000000
      
      attr(,"class")
      [1] "igraph.tmp.sparse"

# get_stochastic_sparse_impl errors

    Code
      get_stochastic_sparse_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# to_directed_impl basic

    Code
      to_directed_impl(graph = g)
    Output
      IGRAPH D--- 3 4 -- 
      + edges:
      [1] 1->2 2->3 2->1 3->2

---

    Code
      to_directed_impl(graph = g, mode = "acyclic")
    Output
      IGRAPH D--- 3 2 -- 
      + edges:
      [1] 1->2 2->3

# to_directed_impl errors

    Code
      to_directed_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# to_undirected_impl basic

    Code
      to_undirected_impl(graph = g)
    Output
      IGRAPH U--- 3 2 -- 
      + edges:
      [1] 1--2 2--3

---

    Code
      to_undirected_impl(graph = g, mode = "mutual", edge_attr_comb = "sum")
    Output
      IGRAPH U--- 3 2 -- 
      + edges:
      [1] 1--2 2--3

# to_undirected_impl errors

    Code
      to_undirected_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# local_scan_0_impl basic

    Code
      local_scan_0_impl(graph = g)
    Output
      [1] 1 2 1

---

    Code
      local_scan_0_impl(graph = g, weights = c(1, 2), mode = "in")
    Output
      [1] 1 3 2

# local_scan_0_impl errors

    Code
      local_scan_0_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# local_scan_0_them_impl basic

    Code
      local_scan_0_them_impl(us = g1, them = g2)
    Output
      [1] 1 2 1

---

    Code
      local_scan_0_them_impl(us = g1, them = g2, weights_them = c(1, 2), mode = "in")
    Output
      [1] 1 3 2

# local_scan_0_them_impl errors

    Code
      local_scan_0_them_impl(us = NULL, them = them)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# local_scan_1_ecount_impl basic

    Code
      local_scan_1_ecount_impl(graph = g)
    Output
      [1] 1 2 1

---

    Code
      local_scan_1_ecount_impl(graph = g, weights = c(1, 2), mode = "in")
    Output
      [1] 1 3 2

# local_scan_1_ecount_impl errors

    Code
      local_scan_1_ecount_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# local_scan_1_ecount_them_impl basic

    Code
      local_scan_1_ecount_them_impl(us = g1, them = g2)
    Output
      [1] 1 2 1

---

    Code
      local_scan_1_ecount_them_impl(us = g1, them = g2, weights_them = c(1, 2), mode = "in")
    Output
      [1] 1 3 2

# local_scan_1_ecount_them_impl errors

    Code
      local_scan_1_ecount_them_impl(us = NULL, them = them)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# local_scan_k_ecount_impl basic

    Code
      local_scan_k_ecount_impl(graph = g, k = 1)
    Output
      [1] 1 2 1

---

    Code
      local_scan_k_ecount_impl(graph = g, k = 1, weights = c(1, 2), mode = "in")
    Output
      [1] 1 3 2

# local_scan_k_ecount_impl errors

    Code
      local_scan_k_ecount_impl(graph = NULL, k = 1)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# local_scan_k_ecount_them_impl basic

    Code
      local_scan_k_ecount_them_impl(us = g1, them = g2, k = 1)
    Output
      [1] 1 2 1

---

    Code
      local_scan_k_ecount_them_impl(us = g1, them = g2, k = 1, weights_them = c(1, 2),
      mode = "in")
    Output
      [1] 1 3 2

# local_scan_k_ecount_them_impl errors

    Code
      local_scan_k_ecount_them_impl(us = NULL, them = them, k = 1)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# local_scan_neighborhood_ecount_impl basic

    Code
      local_scan_neighborhood_ecount_impl(graph = g, neighborhoods = list(1:2, 2:3, 2:
        4, 2))
    Output
      [1] 1 1 2 0

---

    Code
      local_scan_neighborhood_ecount_impl(graph = g, weights = c(1, 2, 3),
      neighborhoods = list(1:2, 1:3, 2:4, 1))
    Output
      [1] 1 3 5 0

# local_scan_neighborhood_ecount_impl errors

    Code
      local_scan_neighborhood_ecount_impl(graph = NULL, neighborhoods = list(1:2, 2:3))
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# local_scan_subset_ecount_impl basic

    Code
      local_scan_subset_ecount_impl(graph = g, subsets = list(c(1, 2), c(2, 3)))
    Output
      [1] 1 1

---

    Code
      local_scan_subset_ecount_impl(graph = g, weights = c(1, 2, 3), subsets = list(c(
        1, 2), c(2, 3)))
    Output
      [1] 1 2

# local_scan_subset_ecount_impl errors

    Code
      local_scan_subset_ecount_impl(graph = g, subsets = list(1:2, letters[2:3]))
    Condition
      Error in `.x - 1`:
      ! non-numeric argument to binary operator

# is_matching_impl basic

    Code
      is_matching_impl(graph = g, matching = 1:2)
    Output
      [1] FALSE

---

    Code
      is_matching_impl(graph = g, types = c(TRUE, FALSE, TRUE), matching = 1:2)
    Output
      [1] FALSE

# is_matching_impl errors

    Code
      is_matching_impl(graph = NULL, matching = 1:2)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# is_maximal_matching_impl basic

    Code
      is_maximal_matching_impl(graph = g, matching = 1:2)
    Output
      [1] FALSE

---

    Code
      is_maximal_matching_impl(graph = g, types = c(TRUE, FALSE, TRUE), matching = 1:
      2)
    Output
      [1] FALSE

# is_maximal_matching_impl errors

    Code
      is_maximal_matching_impl(graph = NULL, matching = 1:2)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# maximum_bipartite_matching_impl basic

    Code
      maximum_bipartite_matching_impl(graph = g, types = c(TRUE, FALSE, TRUE))
    Output
      $matching_size
      [1] 1
      
      $matching_weight
      [1] 1
      
      $matching
      [1] 2 1 0
      

---

    Code
      maximum_bipartite_matching_impl(graph = g, types = c(TRUE, FALSE, TRUE),
      weights = c(1, 2), eps = 1e-05)
    Output
      $matching_size
      [1] 1
      
      $matching_weight
      [1] 2
      
      $matching
      [1] 0 3 2
      

# maximum_bipartite_matching_impl errors

    Code
      maximum_bipartite_matching_impl(graph = NULL, types = c(TRUE, FALSE, TRUE))
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# eigen_adjacency_impl basic

    Code
      eigen_adjacency_impl(graph = g)
    Output
      $options
      $options$bmat
      [1] "I"
      
      $options$n
      [1] 3
      
      $options$which
      [1] "LM"
      
      $options$nev
      [1] 1
      
      $options$tol
      [1] 0
      
      $options$ncv
      [1] 2
      
      $options$ldv
      [1] 0
      
      $options$ishift
      [1] 1
      
      $options$maxiter
      [1] 3000
      
      $options$nb
      [1] 1
      
      $options$mode
      [1] 1
      
      $options$start
      [1] 0
      
      $options$sigma
      [1] 0
      
      $options$sigmai
      [1] 0
      
      $options$info
      [1] 0
      
      $options$iter
      [1] 29
      
      $options$nconv
      [1] 1
      
      $options$numop
      [1] 30
      
      $options$numopb
      [1] 0
      
      $options$numreo
      [1] 16
      
      
      $values
      [1] -1.414214
      
      $vectors
                 [,1]
      [1,] -0.5000000
      [2,]  0.7071068
      [3,] -0.5000000
      
      $cmplxvalues
      complex(0)
      
      $cmplxvectors
      <0 x 0 matrix>
      

---

    Code
      eigen_adjacency_impl(graph = g, algorithm = "lapack", which = list(which = "LA"),
      options = list(maxiter = 10))
    Condition
      Error in `eigen_adjacency_impl()`:
      ! 'LAPACK' algorithm not implemented yet. Unimplemented function call
      Source: <file>:<line>

# eigen_adjacency_impl errors

    Code
      eigen_adjacency_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# cocitation_impl errors

    Code
      cocitation_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# bibcoupling_impl errors

    Code
      bibcoupling_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# coreness_impl basic

    Code
      coreness_impl(graph = g)
    Output
      [1] 2 2 2 1

# coreness_impl errors

    Code
      coreness_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# subcomponent_impl basic

    Code
      subcomponent_impl(graph = g, v = 1, mode = c("all", "out", "in"))
    Output
      + 3/6 vertices, named:
      [1] A B C

# decompose_impl basic

    Code
      decompose_impl(graph = g, mode = c("weak", "strong"))
    Output
      [[1]]
      IGRAPH UN-- 3 2 -- 
      + attr: name (v/c)
      + edges (vertex names):
      [1] A--B B--C
      
      [[2]]
      IGRAPH UN-- 2 1 -- 
      + attr: name (v/c)
      + edge (vertex names):
      [1] D--E
      

# neighborhood_impl basic

    Code
      neighborhood_impl(graph = g, order = 1, vids = V(g), mode = c("all", "out",
        "in"))
    Output
      [[1]]
      + 3/5 vertices:
      [1] 1 2 5
      
      [[2]]
      + 3/5 vertices:
      [1] 2 1 3
      
      [[3]]
      + 3/5 vertices:
      [1] 3 2 4
      
      [[4]]
      + 3/5 vertices:
      [1] 4 3 5
      
      [[5]]
      + 3/5 vertices:
      [1] 5 1 4
      

# neighborhood_size_impl basic

    Code
      neighborhood_size_impl(graph = g, order = 1, vids = V(g), mode = c("all", "out",
        "in"))
    Output
      [1] 3 3 3 3 3

# is_chordal_impl basic

    Code
      is_chordal_impl(graph = g, alpha = alpha_vec, alpham1 = alpham1_vec)
    Output
      $chordal
      [1] TRUE
      
      $fillin
      numeric(0)
      
      $newgraph
      IGRAPH U--- 4 6 -- Full graph
      + attr: name (g/c), loops (g/l)
      + edges:
      [1] 1--2 1--3 1--4 2--3 2--4 3--4
      

---

    Code
      is_chordal_impl(graph = g2, alpha = alpha_vec2, alpham1 = alpham1_vec2)
    Output
      $chordal
      [1] FALSE
      
      $fillin
      [1] 1 3
      
      $newgraph
      IGRAPH U--- 4 5 -- Ring graph
      + attr: name (g/c), mutual (g/l), circular (g/l)
      + edges:
      [1] 1--2 2--3 3--4 1--4 2--4
      

# get_adjacency_impl basic

    Code
      get_adjacency_impl(graph = g, type = c("both", "upper", "lower"))
    Output
           [,1] [,2] [,3]
      [1,]    0    1    1
      [2,]    1    0    1
      [3,]    1    1    0

