# FIXME: ASAN tests for this file are crashing on CRAN, can we replicate?
skip_on_cran()

# 19. graph_power_impl

test_that("graph_power_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 5
  )

  expect_snapshot(graph_power_impl(
    graph = g,
    order = 2
  ))
  expect_snapshot(graph_power_impl(
    graph = g,
    order = 2,
    directed = TRUE
  ))

  # Structured tests
  result <- graph_power_impl(
    graph = g,
    order = 2
  )
  expect_s3_class(result, "igraph")
})

test_that("graph_power_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(graph_power_impl(
    graph = NULL,
    order = 2
  ))
})

# 20. linegraph_impl

test_that("linegraph_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 5
  )

  expect_snapshot(linegraph_impl(
    graph = g
  ))

  # Structured tests
  result <- linegraph_impl(
    graph = g
  )
  expect_s3_class(result, "igraph")
})

test_that("linegraph_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(linegraph_impl(
    graph = NULL
  ))
})

# 79. induced_subgraph_impl

test_that("induced_subgraph_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(induced_subgraph_impl(
    graph = g,
    vids = 1:2
  ))

  # Structured tests
  result <- induced_subgraph_impl(
    graph = g,
    vids = 1:2
  )
  expect_s3_class(result, "igraph")
})

test_that("induced_subgraph_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(induced_subgraph_impl(
    graph = NULL,
    vids = 1:2
  ))
})

# 80. subgraph_from_edges_impl

test_that("subgraph_from_edges_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(subgraph_from_edges_impl(
    graph = g,
    eids = 1
  ))

  # Structured tests
  result <- subgraph_from_edges_impl(
    graph = g,
    eids = 1
  )
  expect_s3_class(result, "igraph")
})

test_that("subgraph_from_edges_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(subgraph_from_edges_impl(
    graph = NULL,
    eids = 1
  ))
})

# 81. reverse_edges_impl

test_that("reverse_edges_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(reverse_edges_impl(
    graph = g
  ))

  # Structured tests
  result <- reverse_edges_impl(
    graph = g
  )
  expect_s3_class(result, "igraph")
})

test_that("reverse_edges_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(reverse_edges_impl(
    graph = NULL
  ))
})

# 102. simplify_impl

test_that("simplify_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(simplify_impl(
    graph = g
  ))
  expect_snapshot(simplify_impl(
    graph = g,
    remove_multiple = FALSE,
    remove_loops = FALSE
  ))

  # Structured tests
  result <- simplify_impl(
    graph = g
  )
  expect_s3_class(result, "igraph")
})

test_that("simplify_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(simplify_impl(
    graph = NULL
  ))
})

# 149. contract_vertices_impl

test_that("contract_vertices_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(contract_vertices_impl(
    graph = g,
    mapping = c(1, 1, 2)
  ))

  # Structured tests
  result <- contract_vertices_impl(
    graph = g,
    mapping = c(1, 1, 2)
  )
  expect_s3_class(result, "igraph")
})

test_that("contract_vertices_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(contract_vertices_impl(
    graph = NULL,
    mapping = c(1, 1, 2)
  ))
})

# 160. transitive_closure_dag_impl

test_that("transitive_closure_dag_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3,
    directed = TRUE
  )

  expect_snapshot(transitive_closure_dag_impl(
    graph = g
  ))

  # Structured tests
  result <- transitive_closure_dag_impl(
    graph = g
  )
  expect_s3_class(result, "igraph")
})

test_that("transitive_closure_dag_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(transitive_closure_dag_impl(
    graph = NULL
  ))
})

# 161. transitive_closure_impl

test_that("transitive_closure_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(transitive_closure_impl(
    graph = g
  ))

  # Structured tests
  result <- transitive_closure_impl(
    graph = g
  )
  expect_s3_class(result, "igraph")
})

test_that("transitive_closure_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(transitive_closure_impl(
    graph = NULL
  ))
})

# 259. join_impl

test_that("join_impl basic", {
  igraph_local_seed(20250909)
  g1 <- path_graph_impl(
    n = 3
  )

  g2 <- path_graph_impl(
    n = 3
  )

  expect_snapshot(join_impl(
    left = g1,
    right = g2
  ))

  # Structured tests
  result <- join_impl(
    left = g1,
    right = g2
  )
  expect_s3_class(result, "igraph")
})

test_that("join_impl errors", {
  igraph_local_seed(20250909)
  right <- path_graph_impl(
    n = 3
  )
  expect_snapshot_igraph_error(join_impl(
    left = NULL,
    right = right
  ))
})

# 260. induced_subgraph_map_impl

test_that("induced_subgraph_map_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(induced_subgraph_map_impl(
    graph = g,
    vids = 1:2,
    impl = "auto"
  ))
  expect_snapshot(induced_subgraph_map_impl(
    graph = g,
    vids = 1:2,
    impl = "copy_and_delete"
  ))

  # Structured tests
  result <- induced_subgraph_map_impl(
    graph = g,
    vids = 1:2,
    impl = "auto"
  )
  expect_type(result, "list")
})

test_that("induced_subgraph_map_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(
    induced_subgraph_map_impl(
      graph = NULL,
      vids = 1:2,
      impl = "auto"
    )
  )
})

# 261. mycielskian_impl

test_that("mycielskian_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(mycielskian_impl(
    graph = g
  ))
  expect_snapshot(mycielskian_impl(
    graph = g,
    k = 2
  ))

  # Structured tests
  result <- mycielskian_impl(
    graph = g
  )
  expect_s3_class(result, "igraph")
})

test_that("mycielskian_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(mycielskian_impl(
    graph = NULL
  ))
})

# 262. product_impl

test_that("product_impl basic", {
  igraph_local_seed(20250909)
  g1 <- path_graph_impl(
    n = 3
  )

  g2 <- path_graph_impl(
    n = 3
  )

  expect_snapshot(product_impl(
    g1 = g1,
    g2 = g2
  ))
  expect_snapshot(product_impl(
    g1 = g1,
    g2 = g2,
    type = "tensor"
  ))

  # Structured tests
  result <- product_impl(
    g1 = g1,
    g2 = g2
  )
  expect_s3_class(result, "igraph")
})

test_that("product_impl errors", {
  igraph_local_seed(20250909)
  g2 <- path_graph_impl(
    n = 3
  )
  expect_snapshot_igraph_error(product_impl(
    g1 = NULL,
    g2 = g2
  ))
})

# 263. rooted_product_impl

test_that("rooted_product_impl basic", {
  igraph_local_seed(20250909)
  g1 <- path_graph_impl(
    n = 3
  )

  g2 <- path_graph_impl(
    n = 3
  )

  expect_snapshot(rooted_product_impl(
    g1 = g1,
    g2 = g2,
    root = 1
  ))

  # Structured tests
  result <- rooted_product_impl(
    g1 = g1,
    g2 = g2,
    root = 1
  )
  expect_s3_class(result, "igraph")
})

test_that("rooted_product_impl errors", {
  igraph_local_seed(20250909)
  g2 <- path_graph_impl(
    n = 3
  )
  expect_snapshot_igraph_error(
    rooted_product_impl(
      g1 = NULL,
      g2 = g2,
      root = 1
    )
  )
})

# 347. union_impl

test_that("union_impl basic", {
  igraph_local_seed(20250909)
  g1 <- make_graph(c(1, 2, 2, 3), n = 3)
  g2 <- make_graph(c(1, 3, 3, 4), n = 4)
  expect_snapshot(union_impl(
    left = g1,
    right = g2
  ))
})

test_that("union_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(union_impl(
    left = NULL,
    right = NULL
  ))
})

# 348. intersection_impl

test_that("intersection_impl basic", {
  igraph_local_seed(20250909)
  g1 <- make_graph(c(1, 2, 2, 3, 1, 3), n = 3)
  g2 <- make_graph(c(1, 2, 2, 3), n = 3)
  expect_snapshot(intersection_impl(
    left = g1,
    right = g2
  ))
})

test_that("intersection_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(intersection_impl(
    left = NULL,
    right = NULL
  ))
})

test_that("connect_neighborhood_impl basic", {
  igraph_local_seed(20250909)
  g <- make_ring(5)
  expect_snapshot_igraph(connect_neighborhood_impl(
    graph = g,
    order = 1,
    mode = c("all", "out", "in")
  ))
})

# Tests for newly autogenerated *_many functions

test_that("disjoint_union_many_impl basic", {
  igraph_local_seed(20250909)
  g1 <- empty_impl(n = 2)
  g2 <- empty_impl(n = 3)
  g3 <- empty_impl(n = 1)

  expect_snapshot(disjoint_union_many_impl(
    graphs = list(g1, g2, g3)
  ))

  # Structured tests
  result <- disjoint_union_many_impl(
    graphs = list(g1, g2, g3)
  )
  expect_s3_class(result, "igraph")
  expect_equal(vcount(result), 6)
})

test_that("union_many_impl basic", {
  igraph_local_seed(20250909)
  g1 <- empty_impl(n = 3)
  g2 <- add_edges_impl(g1, c(0, 1, 1, 2) + 1)
  g3 <- add_edges_impl(g1, c(0, 2) + 1)

  expect_snapshot(union_many_impl(
    graphs = list(g1, g2, g3)
  ))

  # Structured tests
  result <- union_many_impl(
    graphs = list(g1, g2, g3)
  )
  expect_type(result, "list")
  expect_s3_class(result$res, "igraph")
})

test_that("intersection_many_impl basic", {
  igraph_local_seed(20250909)
  g1 <- add_edges_impl(empty_impl(n = 3), c(0, 1, 1, 2, 0, 2) + 1)
  g2 <- add_edges_impl(empty_impl(n = 3), c(0, 1, 1, 2) + 1)
  g3 <- add_edges_impl(empty_impl(n = 3), c(0, 1) + 1)

  expect_snapshot(intersection_many_impl(
    graphs = list(g1, g2, g3)
  ))

  # Structured tests
  result <- intersection_many_impl(
    graphs = list(g1, g2, g3)
  )
  expect_type(result, "list")
  expect_s3_class(result$res, "igraph")
})
