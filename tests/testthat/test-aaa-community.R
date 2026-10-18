# FIXME: ASAN tests for this file are crashing on CRAN, can we replicate?
skip_on_cran()

# 217. compare_communities_impl

test_that("compare_communities_impl basic", {
  igraph_local_seed(20250909)
  expect_snapshot(compare_communities_impl(
    comm1 = c(1, 2, 1),
    comm2 = c(2, 1, 2)
  ))
  expect_snapshot(compare_communities_impl(
    comm1 = c(1, 2, 1),
    comm2 = c(2, 1, 2),
    method = "nmi"
  ))

  # Structured tests
  result <- compare_communities_impl(
    comm1 = c(1, 2, 1),
    comm2 = c(2, 1, 2)
  )
  expect_true(is.numeric(result))
})

test_that("compare_communities_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(compare_communities_impl(
    comm1 = "a",
    comm2 = c(2, 1, 2)
  ))
})

# 218. modularity_impl

test_that("modularity_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(modularity_impl(
    graph = g,
    membership = c(1, 2, 1)
  ))
  expect_snapshot(modularity_impl(
    graph = g,
    membership = c(1, 2, 1),
    weights = c(1, 2),
    resolution = 0.5,
    directed = FALSE
  ))

  # Structured tests
  result <- modularity_impl(
    graph = g,
    membership = c(1, 2, 1)
  )
  expect_true(is.numeric(result))
})

test_that("modularity_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(modularity_impl(
    graph = NULL,
    membership = c(1, 2, 1)
  ))
})

# 219. modularity_matrix_impl

test_that("modularity_matrix_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(modularity_matrix_impl(
    graph = g
  ))
  expect_snapshot(modularity_matrix_impl(
    graph = g,
    weights = c(1, 2),
    resolution = 0.5,
    directed = FALSE
  ))

  # Structured tests
  result <- modularity_matrix_impl(
    graph = g
  )
  expect_true(is.numeric(result))
})

test_that("modularity_matrix_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(modularity_matrix_impl(
    graph = NULL
  ))
})

# 220. community_fluid_communities_impl

test_that("community_fluid_communities_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(community_fluid_communities_impl(
    graph = g,
    no_of_communities = 2
  ))

  # Structured tests
  result <- community_fluid_communities_impl(
    graph = g,
    no_of_communities = 2
  )
  expect_true(is.numeric(result))
})

test_that("community_fluid_communities_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(
    community_fluid_communities_impl(
      graph = NULL,
      no_of_communities = 2
    )
  )
})

# 221. community_label_propagation_impl

test_that("community_label_propagation_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(community_label_propagation_impl(
    graph = g
  ))
  expect_snapshot(community_label_propagation_impl(
    graph = g,
    mode = "in",
    weights = c(1, 2),
    initial = 1:3,
    fixed = c(TRUE, FALSE, TRUE)
  ))

  # Structured tests
  result <- community_label_propagation_impl(
    graph = g
  )
  expect_true(is.numeric(result))
})

test_that("community_label_propagation_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(community_label_propagation_impl(
    graph = NULL
  ))
})

# 222. community_multilevel_impl

test_that("community_multilevel_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(community_multilevel_impl(
    graph = g
  ))
  expect_snapshot(community_multilevel_impl(
    graph = g,
    weights = c(1, 2),
    resolution = 0.5
  ))

  # Structured tests
  result <- community_multilevel_impl(
    graph = g
  )
  expect_type(result, "list")
})

test_that("community_multilevel_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(community_multilevel_impl(
    graph = NULL
  ))
})

# 223. community_optimal_modularity_impl

test_that("community_optimal_modularity_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(community_optimal_modularity_impl(
    graph = g
  ))
  expect_snapshot(community_optimal_modularity_impl(
    graph = g,
    weights = c(1, 2)
  ))

  # Structured tests
  result <- community_optimal_modularity_impl(
    graph = g
  )
  expect_type(result, "list")
})

test_that("community_optimal_modularity_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(community_optimal_modularity_impl(
    graph = NULL
  ))
})

# 224. community_leiden_impl

test_that("community_leiden_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(community_leiden_impl(
    graph = g,
    weights = c(1, 2),
    vertex_weights = c(1, 2, 3),
    resolution = 0.5,
    beta = 0.1,
    start = TRUE,
    n_iterations = 1,
    membership = 1:3
  ))

  # Structured tests
  result <- community_leiden_impl(
    graph = g,
    weights = c(1, 2),
    vertex_weights = c(1, 2, 3),
    resolution = 0.5,
    beta = 0.1,
    start = TRUE,
    n_iterations = 1,
    membership = 1:3
  )
  expect_type(result, "list")
})

test_that("community_leiden_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(community_leiden_impl(
    graph = NULL,
    resolution = 1
  ))
})

# 225. split_join_distance_impl

test_that("split_join_distance_impl basic", {
  igraph_local_seed(20250909)
  expect_snapshot(split_join_distance_impl(
    comm1 = c(1, 2, 1),
    comm2 = c(2, 1, 2)
  ))

  # Structured tests
  result <- split_join_distance_impl(
    comm1 = c(1, 2, 1),
    comm2 = c(2, 1, 2)
  )
  expect_type(result, "list")
})

test_that("split_join_distance_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(split_join_distance_impl(
    comm1 = "a",
    comm2 = c(2, 1, 2)
  ))
})

# 226. community_infomap_impl

test_that("community_infomap_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(community_infomap_impl(
    graph = g
  ))
  expect_snapshot(community_infomap_impl(
    graph = g,
    e_weights = c(1, 2),
    v_weights = c(1, 2, 3),
    nb_trials = 2
  ))

  # Structured tests
  result <- community_infomap_impl(
    graph = g
  )
  expect_type(result, "list")
})

test_that("community_infomap_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(community_infomap_impl(
    graph = NULL
  ))
})

# Community detection

test_that("community_walktrap_impl basic", {
  igraph_local_seed(20250909)
  g <- make_graph(~ A-B-C-A, D-E-F-D, A-D)
  expect_snapshot(community_walktrap_impl(graph = g, steps = 4))
})

test_that("community_fastgreedy_impl basic", {
  igraph_local_seed(20250909)
  g <- make_graph(~ A-B-C-A, D-E-F-D, A-D)
  expect_snapshot(community_fastgreedy_impl(graph = g))
})

test_that("community_edge_betweenness_impl basic", {
  igraph_local_seed(20250909)
  g <- make_graph(~ A-B-C-A, D-E-F-D, A-D)
  expect_snapshot(community_edge_betweenness_impl(graph = g, directed = FALSE))
})

test_that("community_leading_eigenvector_callback_closure_impl basic", {
  igraph_local_seed(20250909)

  # Test with a simple graph
  g <- make_graph("Zachary")
  result <- community_leading_eigenvector_callback_closure_impl(
    graph = g
  )

  expect_snapshot({
    cat("Result class:\n")
    print(class(result))
    cat("\nMembership length:\n")
    print(length(result$membership))
    cat("\nModularity:\n")
    print(result$modularity)
    cat("\nMerges dimensions:\n")
    print(dim(result$merges))
  })

  # Structured tests
  expect_s3_class(result, "igraph.eigenc")
  expect_type(result, "list")
  expect_true("membership" %in% names(result))
  expect_true("modularity" %in% names(result))
  expect_true("merges" %in% names(result))
  expect_length(result$membership, vcount(g))
  expect_true(is.numeric(result$modularity))
})

test_that("community_leading_eigenvector_callback_closure_impl with start", {
  igraph_local_seed(20250909)

  g <- make_graph("Zachary")
  # Create initial membership (0-based for the impl function)
  initial_membership <- rep(0:1, length.out = vcount(g))

  result <- community_leading_eigenvector_callback_closure_impl(
    graph = g,
    membership = initial_membership,
    start = TRUE
  )

  expect_snapshot({
    cat("Result with start membership:\n")
    cat("Membership length:\n")
    print(length(result$membership))
    cat("\nModularity:\n")
    print(result$modularity)
  })

  expect_s3_class(result, "igraph.eigenc")
  expect_length(result$membership, vcount(g))
})

test_that("community_leading_eigenvector_callback_closure_impl errors", {
  igraph_local_seed(20250909)

  g <- make_graph("Zachary")

  # Test with invalid steps
  expect_snapshot_igraph_error(
    community_leading_eigenvector_callback_closure_impl(
      graph = g,
      start = TRUE
    )
  )
})

# Utility functions

test_that("compare_communities_impl basic", {
  igraph_local_seed(20250909)
  comm1 <- c(1, 1, 2, 2, 3, 3)
  comm2 <- c(1, 1, 2, 2, 2, 3)
  expect_snapshot(compare_communities_impl(
    comm1 = comm1,
    comm2 = comm2,
    method = "vi"
  ))
})

# community_voronoi_impl
test_that("community_voronoi_impl basic", {
  igraph_local_seed(20250909)
  g <- add_edges_impl(
    empty_impl(n = 10),
    c(0, 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, 9) + 1
  )

  expect_snapshot(community_voronoi_impl(
    graph = g
  ))

  # Structured tests
  result <- community_voronoi_impl(
    graph = g
  )
  expect_type(result, "list")
  expect_named(result, c("membership", "generators", "modularity"))
  expect_length(result$membership, 10)
  expect_true(is.numeric(result$modularity))
  expect_true(length(result$generators) >= 1)
})

test_that("community_voronoi_impl errors", {
  igraph_local_seed(20250909)

  expect_snapshot_igraph_error(community_voronoi_impl(
    graph = NULL
  ))
})
