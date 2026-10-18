# FIXME: ASAN tests for this file are crashing on CRAN, can we replicate?
skip_on_cran()

# 55. are_adjacent_impl

test_that("are_adjacent_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(are_adjacent_impl(
    graph = g,
    v1 = 1,
    v2 = 2
  ))

  # Structured tests
  result <- are_adjacent_impl(
    graph = g,
    v1 = 1,
    v2 = 2
  )
  expect_true(is.numeric(result) || is.logical(result))
})

test_that("are_adjacent_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(are_adjacent_impl(
    graph = NULL,
    v1 = 1,
    v2 = 2
  ))
})

# 70. spanner_impl

test_that("spanner_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(spanner_impl(
    graph = g,
    stretch = 2
  ))

  # Structured tests
  result <- spanner_impl(
    graph = g,
    stretch = 2
  )
  expect_s3_class(result, "igraph.es")
})

test_that("spanner_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(spanner_impl(
    graph = NULL,
    stretch = 2
  ))
})

# 103. transitivity_undirected_impl

test_that("transitivity_undirected_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(transitivity_undirected_impl(
    graph = g
  ))
  expect_snapshot(transitivity_undirected_impl(
    graph = g,
    mode = "zero"
  ))

  # Structured tests
  result <- transitivity_undirected_impl(
    graph = g
  )
  expect_true(is.numeric(result) || is.logical(result))
})

test_that("transitivity_undirected_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(transitivity_undirected_impl(
    graph = NULL
  ))
})

# 104. transitivity_local_undirected_impl

test_that("transitivity_local_undirected_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(transitivity_local_undirected_impl(
    graph = g
  ))
  expect_snapshot(transitivity_local_undirected_impl(
    graph = g,
    mode = "zero"
  ))

  # Structured tests
  result <- transitivity_local_undirected_impl(
    graph = g
  )
  expect_true(is.numeric(result) || is.logical(result))
})

test_that("transitivity_local_undirected_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(transitivity_local_undirected_impl(
    graph = NULL
  ))
})

# 105. transitivity_avglocal_undirected_impl

test_that("transitivity_avglocal_undirected_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(transitivity_avglocal_undirected_impl(
    graph = g
  ))
  expect_snapshot(transitivity_avglocal_undirected_impl(
    graph = g,
    mode = "zero"
  ))

  # Structured tests
  result <- transitivity_avglocal_undirected_impl(
    graph = g
  )
  expect_true(is.numeric(result) || is.logical(result))
})

test_that("transitivity_avglocal_undirected_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(transitivity_avglocal_undirected_impl(
    graph = NULL
  ))
})

# 106. transitivity_barrat_impl

test_that("transitivity_barrat_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(transitivity_barrat_impl(
    graph = g
  ))
  expect_snapshot(transitivity_barrat_impl(
    graph = g,
    mode = "zero"
  ))

  # Structured tests
  expect_warning(
    result <- transitivity_barrat_impl(
      graph = g
    )
  )
  expect_true(is.numeric(result) || is.logical(result))
})

test_that("transitivity_barrat_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(transitivity_barrat_impl(
    graph = NULL
  ))
})

# 107. ecc_impl

test_that("ecc_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 4
  )

  expect_snapshot(ecc_impl(
    graph = g
  ))
  expect_snapshot(ecc_impl(
    graph = g,
    k = 3,
    offset = TRUE,
    normalize = FALSE
  ))

  # Structured tests
  result <- ecc_impl(
    graph = g
  )
  expect_true(is.numeric(result) || is.logical(result))
})

test_that("ecc_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(ecc_impl(
    graph = NULL
  ))
})

# 108. reciprocity_impl

test_that("reciprocity_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(reciprocity_impl(
    graph = g
  ))
  expect_snapshot(reciprocity_impl(
    graph = g,
    ignore_loops = FALSE,
    mode = "ratio"
  ))

  # Structured tests
  result <- reciprocity_impl(
    graph = g
  )
  expect_true(is.numeric(result) || is.logical(result))
})

test_that("reciprocity_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(reciprocity_impl(
    graph = NULL
  ))
})

# 110. density_impl

test_that("density_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(density_impl(
    graph = g
  ))
  expect_snapshot(density_impl(
    graph = g,
    loops = TRUE
  ))

  # Structured tests
  result <- density_impl(
    graph = g
  )
  expect_true(is.numeric(result) || is.logical(result))
})

test_that("density_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(density_impl(
    graph = NULL
  ))
})

# 111. mean_degree_impl

test_that("mean_degree_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(mean_degree_impl(
    graph = g
  ))
  expect_snapshot(mean_degree_impl(
    graph = g,
    loops = FALSE
  ))

  # Structured tests
  result <- mean_degree_impl(
    graph = g
  )
  expect_true(is.numeric(result) || is.logical(result))
})

test_that("mean_degree_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(mean_degree_impl(
    graph = NULL
  ))
})

# 114. is_loop_impl

test_that("is_loop_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(is_loop_impl(
    graph = g
  ))

  # Structured tests
  result <- is_loop_impl(
    graph = g
  )
  expect_true(is.numeric(result) || is.logical(result))
})

test_that("is_loop_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(is_loop_impl(
    graph = NULL
  ))
})

# 117. is_simple_impl

test_that("is_simple_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(is_simple_impl(
    graph = g
  ))

  # Structured tests
  result <- is_simple_impl(
    graph = g
  )
  expect_true(is.numeric(result) || is.logical(result))
})

test_that("is_simple_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(is_simple_impl(
    graph = NULL
  ))
})

# 118. is_multiple_impl

test_that("is_multiple_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(is_multiple_impl(
    graph = g
  ))

  # Structured tests
  result <- is_multiple_impl(
    graph = g
  )
  expect_true(is.numeric(result) || is.logical(result))
})

test_that("is_multiple_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(is_multiple_impl(
    graph = NULL
  ))
})

# 119. has_loop_impl

test_that("has_loop_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(has_loop_impl(
    graph = g
  ))

  # Structured tests
  result <- has_loop_impl(
    graph = g
  )
  expect_true(is.numeric(result) || is.logical(result))
})

test_that("has_loop_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(has_loop_impl(
    graph = NULL
  ))
})

# 120. has_multiple_impl

test_that("has_multiple_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(has_multiple_impl(
    graph = g
  ))

  # Structured tests
  result <- has_multiple_impl(
    graph = g
  )
  expect_true(is.numeric(result) || is.logical(result))
})

test_that("has_multiple_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(has_multiple_impl(
    graph = NULL
  ))
})

# 121. count_loops_impl

test_that("count_loops_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(count_loops_impl(
    graph = g
  ))

  # Structured tests
  result <- count_loops_impl(
    graph = g
  )
  expect_true(is.numeric(result) || is.logical(result))
})

test_that("count_loops_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(count_loops_impl(
    graph = NULL
  ))
})

# 122. count_multiple_impl

test_that("count_multiple_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(count_multiple_impl(
    graph = g
  ))

  # Structured tests
  result <- count_multiple_impl(
    graph = g
  )
  expect_true(is.numeric(result) || is.logical(result))
})

test_that("count_multiple_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(count_multiple_impl(
    graph = NULL
  ))
})

# 127. is_mutual_impl

test_that("is_mutual_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(is_mutual_impl(
    graph = g
  ))
  expect_snapshot(is_mutual_impl(
    graph = g,
    loops = FALSE
  ))

  # Structured tests
  result <- is_mutual_impl(
    graph = g
  )
  expect_true(is.numeric(result) || is.logical(result))
})

test_that("is_mutual_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(is_mutual_impl(
    graph = NULL
  ))
})

# 128. has_mutual_impl

test_that("has_mutual_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(has_mutual_impl(
    graph = g
  ))
  expect_snapshot(has_mutual_impl(
    graph = g,
    loops = FALSE
  ))

  # Structured tests
  result <- has_mutual_impl(
    graph = g
  )
  expect_type(result, "logical")
})

test_that("has_mutual_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(has_mutual_impl(
    graph = NULL
  ))
})

# 129. maximum_cardinality_search_impl

test_that("maximum_cardinality_search_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(maximum_cardinality_search_impl(
    graph = g
  ))

  # Structured tests
  result <- maximum_cardinality_search_impl(
    graph = g
  )
  expect_type(result, "list")
})

test_that("maximum_cardinality_search_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(maximum_cardinality_search_impl(
    graph = NULL
  ))
})

# 130. avg_nearest_neighbor_degree_impl

test_that("avg_nearest_neighbor_degree_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(avg_nearest_neighbor_degree_impl(
    graph = g
  ))
  expect_snapshot(avg_nearest_neighbor_degree_impl(
    graph = g,
    mode = "in",
    neighbor_degree_mode = "out"
  ))

  # Structured tests
  result <- avg_nearest_neighbor_degree_impl(
    graph = g
  )
  expect_type(result, "list")
})

test_that("avg_nearest_neighbor_degree_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(avg_nearest_neighbor_degree_impl(
    graph = NULL
  ))
})

# 131. degree_correlation_vector_impl

test_that("degree_correlation_vector_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(degree_correlation_vector_impl(
    graph = g
  ))
  expect_snapshot(degree_correlation_vector_impl(
    graph = g,
    from_mode = "in",
    to_mode = "out",
    directed_neighbors = FALSE
  ))

  # Structured tests
  result <- degree_correlation_vector_impl(
    graph = g
  )
  expect_true(is.numeric(result))
})

test_that("degree_correlation_vector_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(degree_correlation_vector_impl(
    graph = NULL
  ))
})

# 132. rich_club_sequence_impl

test_that("rich_club_sequence_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(rich_club_sequence_impl(
    graph = g,
    vertex_order = 1:3
  ))
  expect_snapshot(rich_club_sequence_impl(
    graph = g,
    vertex_order = 1:3,
    normalized = FALSE,
    loops = TRUE,
    directed = FALSE
  ))

  # Structured tests
  result <- rich_club_sequence_impl(
    graph = g,
    vertex_order = 1:3
  )
  expect_true(is.numeric(result))
})

test_that("rich_club_sequence_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(
    rich_club_sequence_impl(
      graph = NULL,
      vertex_order = 1:3
    )
  )
})

# 143. assortativity_nominal_impl

test_that("assortativity_nominal_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(assortativity_nominal_impl(
    graph = g,
    types = c(1, 2, 1)
  ))
  expect_snapshot(assortativity_nominal_impl(
    graph = g,
    types = c(1, 2, 1),
    directed = FALSE,
    normalized = FALSE
  ))

  # Structured tests
  result <- assortativity_nominal_impl(
    graph = g,
    types = c(1, 2, 1)
  )
  expect_true(is.numeric(result))
})

test_that("assortativity_nominal_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(assortativity_nominal_impl(
    graph = NULL,
    types = c(1, 2, 1)
  ))
})

# 144. assortativity_impl

test_that("assortativity_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(assortativity_impl(
    graph = g,
    values = c(1, 2, 1)
  ))
  expect_snapshot(assortativity_impl(
    graph = g,
    values = c(1, 2, 1),
    directed = FALSE,
    normalized = FALSE
  ))

  # Structured tests
  result <- assortativity_impl(
    graph = g,
    values = c(1, 2, 1)
  )
  expect_true(is.numeric(result))
})

test_that("assortativity_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(assortativity_impl(
    graph = NULL,
    values = c(1, 2, 1)
  ))
})

# 145. assortativity_degree_impl

test_that("assortativity_degree_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(assortativity_degree_impl(
    graph = g
  ))
  expect_snapshot(assortativity_degree_impl(
    graph = g,
    directed = FALSE
  ))

  # Structured tests
  result <- assortativity_degree_impl(
    graph = g
  )
  expect_true(is.numeric(result))
})

test_that("assortativity_degree_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(assortativity_degree_impl(
    graph = NULL
  ))
})

# 146. joint_degree_matrix_impl

test_that("joint_degree_matrix_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(joint_degree_matrix_impl(
    graph = g
  ))
  expect_snapshot(joint_degree_matrix_impl(
    graph = g,
    max_out_degree = 2,
    max_in_degree = 2
  ))

  # Structured tests
  result <- joint_degree_matrix_impl(
    graph = g
  )
  expect_true(is.numeric(result))
})

test_that("joint_degree_matrix_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(joint_degree_matrix_impl(
    graph = NULL
  ))
})

# 147. joint_degree_distribution_impl

test_that("joint_degree_distribution_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(joint_degree_distribution_impl(
    graph = g
  ))
  expect_snapshot(joint_degree_distribution_impl(
    graph = g,
    from_mode = "in",
    to_mode = "out",
    directed_neighbors = FALSE,
    normalized = FALSE,
    max_from_degree = 2,
    max_to_degree = 2
  ))

  # Structured tests
  result <- joint_degree_distribution_impl(
    graph = g
  )
  expect_true(is.numeric(result))
})

test_that("joint_degree_distribution_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(joint_degree_distribution_impl(
    graph = NULL
  ))
})

# 148. joint_type_distribution_impl

test_that("joint_type_distribution_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(joint_type_distribution_impl(
    graph = g,
    from_types = c(1, 2, 1)
  ))
  expect_snapshot(joint_type_distribution_impl(
    graph = g,
    from_types = c(1, 2, 1),
    to_types = c(1, 2, 1),
    directed = FALSE,
    normalized = FALSE
  ))

  # Structured tests
  result <- joint_type_distribution_impl(
    graph = g,
    from_types = c(1, 2, 1)
  )
  expect_true(is.numeric(result))
})

test_that("joint_type_distribution_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(
    joint_type_distribution_impl(
      graph = NULL,
      from_types = c(1, 2, 1)
    )
  )
})

# 155. diversity_impl

test_that("diversity_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  E(g)$weight <- c(1, 2)
  expect_snapshot(diversity_impl(
    graph = g
  ))

  # Structured tests
  result <- diversity_impl(
    graph = g
  )
  expect_true(is.numeric(result))
})

test_that("diversity_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(diversity_impl(
    graph = NULL
  ))
})

# 157. global_efficiency_impl

test_that("global_efficiency_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(global_efficiency_impl(
    graph = g
  ))
  expect_snapshot(global_efficiency_impl(
    graph = g,
    directed = FALSE
  ))

  # Structured tests
  result <- global_efficiency_impl(
    graph = g
  )
  expect_true(is.numeric(result))
})

test_that("global_efficiency_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(global_efficiency_impl(
    graph = NULL
  ))
})

# 158. local_efficiency_impl

test_that("local_efficiency_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(local_efficiency_impl(
    graph = g
  ))
  expect_snapshot(local_efficiency_impl(
    graph = g,
    directed = FALSE,
    mode = "in"
  ))

  # Structured tests
  result <- local_efficiency_impl(
    graph = g
  )
  expect_true(is.numeric(result))
})

test_that("local_efficiency_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(local_efficiency_impl(
    graph = NULL
  ))
})

# 159. average_local_efficiency_impl

test_that("average_local_efficiency_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(average_local_efficiency_impl(
    graph = g
  ))
  expect_snapshot(average_local_efficiency_impl(
    graph = g,
    directed = FALSE,
    mode = "in"
  ))

  # Structured tests
  result <- average_local_efficiency_impl(
    graph = g
  )
  expect_true(is.numeric(result))
})

test_that("average_local_efficiency_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(average_local_efficiency_impl(
    graph = NULL
  ))
})

# 162. trussness_impl

test_that("trussness_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(trussness_impl(
    graph = g
  ))

  # Structured tests
  result <- trussness_impl(
    graph = g
  )
  expect_true(is.numeric(result))
})

test_that("trussness_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(trussness_impl(
    graph = NULL
  ))
})

# 163. is_graphical_impl

test_that("is_graphical_impl basic", {
  igraph_local_seed(20250909)
  expect_snapshot(is_graphical_impl(
    out_deg = c(2, 2, 2)
  ))
  expect_snapshot(is_graphical_impl(
    out_deg = c(2, 2, 2),
    in_deg = c(1, 1, 1),
    allowed_edge_types = "all"
  ))

  # Structured tests
  result <- is_graphical_impl(
    out_deg = c(2, 2, 2)
  )
  expect_type(result, "logical")
})

test_that("is_graphical_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(is_graphical_impl(
    out_deg = "a"
  ))
})

# 171. get_laplacian_impl

test_that("get_laplacian_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(get_laplacian_impl(
    graph = g
  ))
  expect_snapshot(get_laplacian_impl(
    graph = g,
    mode = "in",
    normalization = "symmetric",
    weights = c(1, 2)
  ))

  # Structured tests
  result <- get_laplacian_impl(
    graph = g
  )
  expect_true(is.numeric(result) || is.matrix(result))
})

test_that("get_laplacian_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(get_laplacian_impl(
    graph = NULL
  ))
})

# 172. get_laplacian_sparse_impl

test_that("get_laplacian_sparse_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(get_laplacian_sparse_impl(
    graph = g
  ))
  expect_snapshot(get_laplacian_sparse_impl(
    graph = g,
    mode = "in",
    normalization = "symmetric",
    weights = c(1, 2)
  ))

  # Structured tests
  result <- get_laplacian_sparse_impl(
    graph = g
  )
  expect_s3_class(result, "igraph.tmp.sparse")
})

test_that("get_laplacian_sparse_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(get_laplacian_sparse_impl(
    graph = NULL
  ))
})

# 173. connected_components_impl

test_that("connected_components_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(connected_components_impl(
    graph = g
  ))
  expect_snapshot(connected_components_impl(
    graph = g,
    mode = "strong",
    details = TRUE
  ))

  # Structured tests
  result <- connected_components_impl(
    graph = g
  )
  expect_true(is.numeric(result))
})

test_that("connected_components_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(connected_components_impl(
    graph = NULL
  ))
})

# 174. is_connected_impl

test_that("is_connected_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(is_connected_impl(
    graph = g
  ))
  expect_snapshot(is_connected_impl(
    graph = g,
    mode = "strong"
  ))

  # Structured tests
  result <- is_connected_impl(
    graph = g
  )
  expect_type(result, "logical")
})

test_that("is_connected_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(is_connected_impl(
    graph = NULL
  ))
})

# 175. articulation_points_impl

test_that("articulation_points_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(articulation_points_impl(
    graph = g
  ))

  # Structured tests
  result <- articulation_points_impl(
    graph = g
  )
  expect_true(is.numeric(result))
})

test_that("articulation_points_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(articulation_points_impl(
    graph = NULL
  ))
})

# 176. biconnected_components_impl

test_that("biconnected_components_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(biconnected_components_impl(
    graph = g
  ))

  # Structured tests
  result <- biconnected_components_impl(
    graph = g
  )
  expect_type(result, "list")
})

test_that("biconnected_components_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(biconnected_components_impl(
    graph = NULL
  ))
})

# 177. bridges_impl

test_that("bridges_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(bridges_impl(
    graph = g
  ))

  # Structured tests
  result <- bridges_impl(
    graph = g
  )
  expect_true(is.numeric(result))
})

test_that("bridges_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(bridges_impl(
    graph = NULL
  ))
})

# 178. is_biconnected_impl

test_that("is_biconnected_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(is_biconnected_impl(
    graph = g
  ))

  # Structured tests
  result <- is_biconnected_impl(
    graph = g
  )
  expect_type(result, "logical")
})

test_that("is_biconnected_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(is_biconnected_impl(
    graph = NULL
  ))
})

# 179. count_reachable_impl

test_that("count_reachable_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 5
  )

  expect_snapshot(count_reachable_impl(
    graph = g,
    mode = "out"
  ))
  expect_snapshot(count_reachable_impl(
    graph = g,
    mode = "in"
  ))

  # Structured tests
  result <- count_reachable_impl(
    graph = g,
    mode = "out"
  )
  expect_true(is.numeric(result))
})

test_that("count_reachable_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(count_reachable_impl(
    graph = NULL,
    mode = "out"
  ))
})

# 180. bond_percolation_impl

test_that("bond_percolation_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(bond_percolation_impl(
    graph = g
  ))

  # Structured tests
  result <- bond_percolation_impl(
    graph = g
  )
  expect_type(result, "list")
})

test_that("bond_percolation_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(bond_percolation_impl(
    graph = NULL
  ))
})

# 181. site_percolation_impl

test_that("site_percolation_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(site_percolation_impl(
    graph = g
  ))

  # Structured tests
  result <- site_percolation_impl(
    graph = g
  )
  expect_type(result, "list")
})

test_that("site_percolation_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(site_percolation_impl(
    graph = NULL
  ))
})

# 182. edgelist_percolation_impl

test_that("edgelist_percolation_impl basic", {
  igraph_local_seed(20250909)
  expect_snapshot(edgelist_percolation_impl(
    edges = matrix(c(1, 2, 2, 3), ncol = 2)
  ))

  # Structured tests
  result <- edgelist_percolation_impl(
    edges = matrix(c(1, 2, 2, 3), ncol = 2)
  )
  expect_type(result, "list")
})

test_that("edgelist_percolation_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(edgelist_percolation_impl(
    edges = "a"
  ))
})

# 210. similarity_dice_impl

test_that("similarity_dice_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(similarity_dice_impl(
    graph = g
  ))
  expect_snapshot(similarity_dice_impl(
    graph = g,
    vids = 1:2,
    mode = "in",
    loops = TRUE
  ))

  # Structured tests
  result <- similarity_dice_impl(
    graph = g
  )
  expect_true(is.numeric(result))
})

test_that("similarity_dice_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(similarity_dice_impl(
    graph = NULL
  ))
})

# 211. similarity_dice_es_impl

test_that("similarity_dice_es_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(similarity_dice_es_impl(
    graph = g
  ))
  expect_snapshot(similarity_dice_es_impl(
    graph = g,
    es = 1:2,
    mode = "in",
    loops = TRUE
  ))

  # Structured tests
  result <- similarity_dice_es_impl(
    graph = g
  )
  expect_true(is.numeric(result))
})

test_that("similarity_dice_es_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(similarity_dice_es_impl(
    graph = NULL
  ))
})

# 212. similarity_dice_pairs_impl

test_that("similarity_dice_pairs_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 4
  )

  expect_snapshot(similarity_dice_pairs_impl(
    graph = g,
    pairs = matrix(c(1, 2, 2, 3), ncol = 2)
  ))
  expect_snapshot(similarity_dice_pairs_impl(
    graph = g,
    pairs = matrix(c(1, 2, 2, 3), ncol = 2),
    mode = "in",
    loops = TRUE
  ))

  # Structured tests
  result <- similarity_dice_pairs_impl(
    graph = g,
    pairs = matrix(c(1, 2, 2, 3), ncol = 2)
  )
  expect_true(is.numeric(result))
})

test_that("similarity_dice_pairs_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(
    similarity_dice_pairs_impl(
      graph = NULL,
      pairs = matrix(c(1, 2, 2, 3), ncol = 2)
    )
  )
})

# 213. similarity_inverse_log_weighted_impl

test_that("similarity_inverse_log_weighted_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(similarity_inverse_log_weighted_impl(
    graph = g
  ))
  expect_snapshot(similarity_inverse_log_weighted_impl(
    graph = g,
    vids = 1:2,
    mode = "in"
  ))

  # Structured tests
  result <- similarity_inverse_log_weighted_impl(
    graph = g
  )
  expect_true(is.numeric(result))
})

test_that("similarity_inverse_log_weighted_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(similarity_inverse_log_weighted_impl(
    graph = NULL
  ))
})

# 214. similarity_jaccard_impl

test_that("similarity_jaccard_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(similarity_jaccard_impl(
    graph = g
  ))
  expect_snapshot(similarity_jaccard_impl(
    graph = g,
    vids = 1:2,
    mode = "in",
    loops = TRUE
  ))

  # Structured tests
  result <- similarity_jaccard_impl(
    graph = g
  )
  expect_true(is.numeric(result))
})

test_that("similarity_jaccard_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(similarity_jaccard_impl(
    graph = NULL
  ))
})

# 215. similarity_jaccard_es_impl

test_that("similarity_jaccard_es_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(similarity_jaccard_es_impl(
    graph = g
  ))
  expect_snapshot(similarity_jaccard_es_impl(
    graph = g,
    es = 1:2,
    mode = "in",
    loops = TRUE
  ))

  # Structured tests
  result <- similarity_jaccard_es_impl(
    graph = g
  )
  expect_true(is.numeric(result))
})

test_that("similarity_jaccard_es_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(similarity_jaccard_es_impl(
    graph = NULL
  ))
})

# 216. similarity_jaccard_pairs_impl

test_that("similarity_jaccard_pairs_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 4
  )

  expect_snapshot(similarity_jaccard_pairs_impl(
    graph = g,
    pairs = matrix(c(1, 2, 2, 3), ncol = 2)
  ))
  expect_snapshot(similarity_jaccard_pairs_impl(
    graph = g,
    pairs = matrix(c(1, 2, 2, 3), ncol = 2),
    mode = "in",
    loops = TRUE
  ))

  # Structured tests
  result <- similarity_jaccard_pairs_impl(
    graph = g,
    pairs = matrix(c(1, 2, 2, 3), ncol = 2)
  )
  expect_true(is.numeric(result))
})

test_that("similarity_jaccard_pairs_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(
    similarity_jaccard_pairs_impl(
      graph = NULL,
      pairs = matrix(c(1, 2, 2, 3), ncol = 2)
    )
  )
})

# 238. get_adjacency_sparse_impl

test_that("get_adjacency_sparse_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(get_adjacency_sparse_impl(
    graph = g
  ))
  expect_snapshot(get_adjacency_sparse_impl(
    graph = g,
    type = "upper",
    weights = c(1, 2),
    loops = "none"
  ))

  # Structured tests
  result <- get_adjacency_sparse_impl(
    graph = g
  )
  expect_s3_class(result, "igraph.tmp.sparse")
})

test_that("get_adjacency_sparse_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(get_adjacency_sparse_impl(
    graph = NULL
  ))
})

# 239. get_stochastic_impl

test_that("get_stochastic_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(get_stochastic_impl(
    graph = g
  ))
  expect_snapshot(get_stochastic_impl(
    graph = g,
    column_wise = TRUE,
    weights = c(1, 2)
  ))

  # Structured tests
  result <- get_stochastic_impl(
    graph = g
  )
  expect_true(is.numeric(result))
})

test_that("get_stochastic_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(get_stochastic_impl(
    graph = NULL
  ))
})

# 240. get_stochastic_sparse_impl

test_that("get_stochastic_sparse_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(get_stochastic_sparse_impl(
    graph = g
  ))
  expect_snapshot(get_stochastic_sparse_impl(
    graph = g,
    column_wise = TRUE,
    weights = c(1, 2)
  ))

  # Structured tests
  result <- get_stochastic_sparse_impl(
    graph = g
  )
  expect_s3_class(result, "igraph.tmp.sparse")
})

test_that("get_stochastic_sparse_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(get_stochastic_sparse_impl(
    graph = NULL
  ))
})

# 241. to_directed_impl

test_that("to_directed_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(to_directed_impl(
    graph = g
  ))
  expect_snapshot(to_directed_impl(
    graph = g,
    mode = "acyclic"
  ))

  # Structured tests
  result <- to_directed_impl(
    graph = g
  )
  expect_s3_class(result, "igraph")
})

test_that("to_directed_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(to_directed_impl(
    graph = NULL
  ))
})

# 242. to_undirected_impl

test_that("to_undirected_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(to_undirected_impl(
    graph = g
  ))
  expect_snapshot(to_undirected_impl(
    graph = g,
    mode = "mutual",
    edge_attr_comb = "sum"
  ))

  # Structured tests
  result <- to_undirected_impl(
    graph = g
  )
  expect_s3_class(result, "igraph")
})

test_that("to_undirected_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(to_undirected_impl(
    graph = NULL
  ))
})

# 250. local_scan_0_impl

test_that("local_scan_0_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(local_scan_0_impl(
    graph = g
  ))
  expect_snapshot(local_scan_0_impl(
    graph = g,
    weights = c(1, 2),
    mode = "in"
  ))

  # Structured tests
  result <- local_scan_0_impl(
    graph = g
  )
  expect_true(is.numeric(result))
})

test_that("local_scan_0_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(local_scan_0_impl(
    graph = NULL
  ))
})

# 251. local_scan_0_them_impl

test_that("local_scan_0_them_impl basic", {
  igraph_local_seed(20250909)
  g1 <- path_graph_impl(
    n = 3
  )

  g2 <- path_graph_impl(
    n = 3
  )

  expect_snapshot(local_scan_0_them_impl(
    us = g1,
    them = g2
  ))
  expect_snapshot(local_scan_0_them_impl(
    us = g1,
    them = g2,
    weights_them = c(1, 2),
    mode = "in"
  ))

  # Structured tests
  result <- local_scan_0_them_impl(
    us = g1,
    them = g2
  )
  expect_true(is.numeric(result))
})

test_that("local_scan_0_them_impl errors", {
  igraph_local_seed(20250909)
  them <- path_graph_impl(
    n = 3
  )
  expect_snapshot_igraph_error(
    local_scan_0_them_impl(
      us = NULL,
      them = them
    )
  )
})

# 252. local_scan_1_ecount_impl

test_that("local_scan_1_ecount_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(local_scan_1_ecount_impl(
    graph = g
  ))
  expect_snapshot(local_scan_1_ecount_impl(
    graph = g,
    weights = c(1, 2),
    mode = "in"
  ))

  # Structured tests
  result <- local_scan_1_ecount_impl(
    graph = g
  )
  expect_true(is.numeric(result))
})

test_that("local_scan_1_ecount_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(local_scan_1_ecount_impl(
    graph = NULL
  ))
})

# 253. local_scan_1_ecount_them_impl

test_that("local_scan_1_ecount_them_impl basic", {
  igraph_local_seed(20250909)
  g1 <- path_graph_impl(
    n = 3
  )

  g2 <- path_graph_impl(
    n = 3
  )

  expect_snapshot(local_scan_1_ecount_them_impl(
    us = g1,
    them = g2
  ))
  expect_snapshot(local_scan_1_ecount_them_impl(
    us = g1,
    them = g2,
    weights_them = c(1, 2),
    mode = "in"
  ))

  # Structured tests
  result <- local_scan_1_ecount_them_impl(
    us = g1,
    them = g2
  )
  expect_true(is.numeric(result))
})

test_that("local_scan_1_ecount_them_impl errors", {
  igraph_local_seed(20250909)
  them <- path_graph_impl(
    n = 3
  )
  expect_snapshot_igraph_error(
    local_scan_1_ecount_them_impl(
      us = NULL,
      them = them
    )
  )
})

# 254. local_scan_k_ecount_impl

test_that("local_scan_k_ecount_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(local_scan_k_ecount_impl(
    graph = g,
    k = 1
  ))
  expect_snapshot(local_scan_k_ecount_impl(
    graph = g,
    k = 1,
    weights = c(1, 2),
    mode = "in"
  ))

  # Structured tests
  result <- local_scan_k_ecount_impl(
    graph = g,
    k = 1
  )
  expect_true(is.numeric(result))
})

test_that("local_scan_k_ecount_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(local_scan_k_ecount_impl(
    graph = NULL,
    k = 1
  ))
})

# 255. local_scan_k_ecount_them_impl

test_that("local_scan_k_ecount_them_impl basic", {
  igraph_local_seed(20250909)
  g1 <- path_graph_impl(
    n = 3
  )

  g2 <- path_graph_impl(
    n = 3
  )

  expect_snapshot(local_scan_k_ecount_them_impl(
    us = g1,
    them = g2,
    k = 1
  ))
  expect_snapshot(local_scan_k_ecount_them_impl(
    us = g1,
    them = g2,
    k = 1,
    weights_them = c(1, 2),
    mode = "in"
  ))

  # Structured tests
  result <- local_scan_k_ecount_them_impl(
    us = g1,
    them = g2,
    k = 1
  )
  expect_true(is.numeric(result))
})

test_that("local_scan_k_ecount_them_impl errors", {
  igraph_local_seed(20250909)
  them <- path_graph_impl(
    n = 3
  )
  expect_snapshot_igraph_error(
    local_scan_k_ecount_them_impl(
      us = NULL,
      them = them,
      k = 1
    )
  )
})

# 256. local_scan_neighborhood_ecount_impl

test_that("local_scan_neighborhood_ecount_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 4
  )

  expect_snapshot(local_scan_neighborhood_ecount_impl(
    graph = g,
    neighborhoods = list(1:2, 2:3, 2:4, 2)
  ))
  expect_snapshot(local_scan_neighborhood_ecount_impl(
    graph = g,
    weights = c(1, 2, 3),
    neighborhoods = list(1:2, 1:3, 2:4, 1)
  ))

  # Structured tests
  result <- local_scan_neighborhood_ecount_impl(
    graph = g,
    neighborhoods = list(1:2, 2:3, 2:4, 2)
  )
  expect_true(is.numeric(result))
})

test_that("local_scan_neighborhood_ecount_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(
    local_scan_neighborhood_ecount_impl(
      graph = NULL,
      neighborhoods = list(1:2, 2:3)
    )
  )
})

# 257. local_scan_subset_ecount_impl

test_that("local_scan_subset_ecount_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 4
  )

  expect_snapshot(local_scan_subset_ecount_impl(
    graph = g,
    subsets = list(c(1, 2), c(2, 3))
  ))
  expect_snapshot(local_scan_subset_ecount_impl(
    graph = g,
    weights = c(1, 2, 3),
    subsets = list(c(1, 2), c(2, 3))
  ))

  # Structured tests
  result <- local_scan_subset_ecount_impl(
    graph = g,
    subsets = list(c(1, 2), c(2, 3))
  )
  expect_true(is.numeric(result))
})

test_that("local_scan_subset_ecount_impl errors", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 4
  )

  expect_snapshot_igraph_error(
    local_scan_subset_ecount_impl(
      graph = g,
      subsets = list(1:2, letters[2:3])
    )
  )
})

# 296. is_matching_impl

test_that("is_matching_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(is_matching_impl(
    graph = g,
    matching = 1:2
  ))
  expect_snapshot(is_matching_impl(
    graph = g,
    types = c(TRUE, FALSE, TRUE),
    matching = 1:2
  ))

  # Structured tests
  result <- is_matching_impl(
    graph = g,
    matching = 1:2
  )
  expect_true(is.numeric(result) || is.logical(result))
})

test_that("is_matching_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(is_matching_impl(
    graph = NULL,
    matching = 1:2
  ))
})

# 297. is_maximal_matching_impl

test_that("is_maximal_matching_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(is_maximal_matching_impl(
    graph = g,
    matching = 1:2
  ))
  expect_snapshot(is_maximal_matching_impl(
    graph = g,
    types = c(TRUE, FALSE, TRUE),
    matching = 1:2
  ))

  # Structured tests
  result <- is_maximal_matching_impl(
    graph = g,
    matching = 1:2
  )
  expect_true(is.numeric(result) || is.logical(result))
})

test_that("is_maximal_matching_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(is_maximal_matching_impl(
    graph = NULL,
    matching = 1:2
  ))
})

# 298. maximum_bipartite_matching_impl

test_that("maximum_bipartite_matching_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(maximum_bipartite_matching_impl(
    graph = g,
    types = c(TRUE, FALSE, TRUE)
  ))
  expect_snapshot(maximum_bipartite_matching_impl(
    graph = g,
    types = c(TRUE, FALSE, TRUE),
    weights = c(1, 2),
    eps = 1e-05
  ))

  # Structured tests
  result <- maximum_bipartite_matching_impl(
    graph = g,
    types = c(TRUE, FALSE, TRUE)
  )
  expect_type(result, "list")
})

test_that("maximum_bipartite_matching_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(
    maximum_bipartite_matching_impl(
      graph = NULL,
      types = c(TRUE, FALSE, TRUE)
    )
  )
})

# 301. eigen_adjacency_impl

test_that("eigen_adjacency_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(eigen_adjacency_impl(
    graph = g
  ))
  expect_snapshot_igraph_error(
    eigen_adjacency_impl(
      graph = g,
      algorithm = "lapack",
      which = list(which = "LA"),
      options = list(maxiter = 10)
    )
  )

  # Structured tests
  result <- eigen_adjacency_impl(
    graph = g
  )
  expect_type(result, "list")
})

test_that("eigen_adjacency_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(eigen_adjacency_impl(
    graph = NULL
  ))
})

# 343. cocitation_impl

test_that("cocitation_impl basic", {
  igraph_local_seed(20250909)
  g <- make_graph(c(1, 2, 1, 3, 2, 4, 3, 4), n = 4, directed = TRUE)
  result <- cocitation_impl(
    graph = g
  )
  expect_true(is.matrix(result))
})

test_that("cocitation_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(cocitation_impl(
    graph = NULL
  ))
})

# 344. bibcoupling_impl

test_that("bibcoupling_impl basic", {
  igraph_local_seed(20250909)
  g <- make_graph(c(1, 2, 1, 3, 2, 4, 3, 4), n = 4, directed = TRUE)
  result <- bibcoupling_impl(
    graph = g
  )
  expect_true(is.matrix(result))
})

test_that("bibcoupling_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(bibcoupling_impl(
    graph = NULL
  ))
})

# 346. coreness_impl

test_that("coreness_impl basic", {
  igraph_local_seed(20250909)
  g <- make_graph(c(1, 2, 2, 3, 3, 1, 3, 4), n = 4, directed = FALSE)
  expect_snapshot(coreness_impl(
    graph = g
  ))
})

test_that("coreness_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(coreness_impl(
    graph = NULL
  ))
})

test_that("subcomponent_impl basic", {
  igraph_local_seed(20250909)
  g <- make_graph(~ A-B-C, D-E-F)
  expect_snapshot(subcomponent_impl(
    graph = g,
    v = 1,
    mode = c("all", "out", "in")
  ))
})

# Other structural functions

test_that("decompose_impl basic", {
  igraph_local_seed(20250909)
  g <- make_graph(~ A-B-C, D-E)
  expect_snapshot(decompose_impl(graph = g, mode = c("weak", "strong")))
})

test_that("neighborhood_impl basic", {
  igraph_local_seed(20250909)
  g <- make_ring(5)
  expect_snapshot(neighborhood_impl(
    graph = g,
    order = 1,
    vids = V(g),
    mode = c("all", "out", "in")
  ))
})

test_that("neighborhood_size_impl basic", {
  igraph_local_seed(20250909)
  g <- make_ring(5)
  expect_snapshot(neighborhood_size_impl(
    graph = g,
    order = 1,
    vids = V(g),
    mode = c("all", "out", "in")
  ))
})

# Graph properties

test_that("is_chordal_impl basic", {
  igraph_local_seed(20250909)
  # Test with a chordal graph (complete graph is chordal)
  g <- make_full_graph(4)
  # alpha and alpham1 parameters must be provided as vectors matching vertex count
  # alpha is a permutation vector, alpham1 is its inverse
  alpha_vec <- seq_len(vcount(g))
  alpham1_vec <- seq_len(vcount(g))
  expect_snapshot(is_chordal_impl(
    graph = g,
    alpha = alpha_vec,
    alpham1 = alpham1_vec
  ))

  # Test with a non-chordal graph (4-cycle is not chordal)
  g2 <- make_ring(4)
  alpha_vec2 <- seq_len(vcount(g2))
  alpham1_vec2 <- seq_len(vcount(g2))
  expect_snapshot(is_chordal_impl(
    graph = g2,
    alpha = alpha_vec2,
    alpham1 = alpham1_vec2
  ))
})

test_that("get_adjacency_impl basic", {
  igraph_local_seed(20250909)
  g <- make_ring(3)
  expect_snapshot(get_adjacency_impl(
    graph = g,
    type = c("both", "upper", "lower")
  ))
})

# Spanner

test_that("spanner_impl basic", {
  igraph_local_seed(20250909)
  g <- make_ring(5)
  expect_snapshot(spanner_impl(graph = g, stretch = 2))
})
