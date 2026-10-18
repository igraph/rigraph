# FIXME: ASAN tests for this file are crashing on CRAN, can we replicate?
skip_on_cran()

# 264. gomory_hu_tree_impl

test_that("gomory_hu_tree_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(gomory_hu_tree_impl(
    graph = g
  ))
  expect_snapshot(gomory_hu_tree_impl(
    graph = g,
    capacity = c(1, 2)
  ))

  # Structured tests
  result <- gomory_hu_tree_impl(
    graph = g
  )
  expect_type(result, "list")
})

test_that("gomory_hu_tree_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(gomory_hu_tree_impl(
    graph = NULL
  ))
})

# 265. maxflow_impl

test_that("maxflow_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(maxflow_impl(
    graph = g,
    source = 1,
    target = 3
  ))
  expect_snapshot(maxflow_impl(
    graph = g,
    source = 1,
    target = 3,
    capacity = c(1, 2)
  ))

  # Structured tests
  result <- maxflow_impl(
    graph = g,
    source = 1,
    target = 3
  )
  expect_type(result, "list")
})

test_that("maxflow_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(maxflow_impl(
    graph = NULL,
    source = 1,
    target = 3
  ))
})

# 266. residual_graph_impl

test_that("residual_graph_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(residual_graph_impl(
    graph = g,
    capacity = c(1, 2),
    flow = c(1, 2)
  ))

  # Structured tests
  result <- residual_graph_impl(
    graph = g,
    capacity = c(1, 2),
    flow = c(1, 2)
  )
  expect_type(result, "list")
})

test_that("residual_graph_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(
    residual_graph_impl(
      graph = NULL,
      capacity = c(1, 2),
      flow = c(1, 2)
    )
  )
})

# 267. reverse_residual_graph_impl

test_that("reverse_residual_graph_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(reverse_residual_graph_impl(
    graph = g,
    capacity = c(1, 2),
    flow = c(1, 2)
  ))

  # Structured tests
  result <- reverse_residual_graph_impl(
    graph = g,
    capacity = c(1, 2),
    flow = c(1, 2)
  )
  expect_s3_class(result, "igraph")
})

test_that("reverse_residual_graph_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(
    reverse_residual_graph_impl(
      graph = NULL,
      capacity = c(1, 2),
      flow = c(1, 2)
    )
  )
})

# 268. st_mincut_impl

test_that("st_mincut_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(st_mincut_impl(
    graph = g,
    source = 1,
    target = 3
  ))
  expect_snapshot(st_mincut_impl(
    graph = g,
    source = 1,
    target = 3,
    capacity = c(1, 2)
  ))

  # Structured tests
  result <- st_mincut_impl(
    graph = g,
    source = 1,
    target = 3
  )
  expect_type(result, "list")
})

test_that("st_mincut_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(st_mincut_impl(
    graph = NULL,
    source = 1,
    target = 3
  ))
})

# 269. dominator_tree_impl

test_that("dominator_tree_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3,
    directed = TRUE
  )

  expect_snapshot(dominator_tree_impl(
    graph = g,
    root = 1
  ))
  expect_snapshot(dominator_tree_impl(
    graph = g,
    root = 1,
    mode = "in"
  ))

  # Structured tests
  result <- dominator_tree_impl(
    graph = g,
    root = 1
  )
  expect_type(result, "list")
})

test_that("dominator_tree_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(dominator_tree_impl(
    graph = NULL,
    root = 1
  ))
})

# 270. all_st_cuts_impl

test_that("all_st_cuts_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3,
    directed = TRUE
  )

  expect_snapshot(all_st_cuts_impl(
    graph = g,
    source = 1,
    target = 3
  ))

  # Structured tests
  result <- all_st_cuts_impl(
    graph = g,
    source = 1,
    target = 3
  )
  expect_type(result, "list")
})

test_that("all_st_cuts_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(all_st_cuts_impl(
    graph = NULL,
    source = 1,
    target = 3
  ))
})

# 271. all_st_mincuts_impl

test_that("all_st_mincuts_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3,
    directed = TRUE
  )

  expect_snapshot(all_st_mincuts_impl(
    graph = g,
    source = 1,
    target = 3
  ))
  expect_snapshot(all_st_mincuts_impl(
    graph = g,
    source = 1,
    target = 3,
    capacity = c(1, 2)
  ))

  # Structured tests
  result <- all_st_mincuts_impl(
    graph = g,
    source = 1,
    target = 3
  )
  expect_type(result, "list")
})

test_that("all_st_mincuts_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(
    all_st_mincuts_impl(
      graph = NULL,
      source = 1,
      target = 3
    )
  )
})

# Connectivity

test_that("edge_connectivity_impl basic", {
  igraph_local_seed(20250909)
  g <- make_ring(5)
  expect_snapshot(edge_connectivity_impl(graph = g))
})

test_that("vertex_connectivity_impl basic", {
  igraph_local_seed(20250909)
  g <- make_ring(5)
  expect_snapshot(vertex_connectivity_impl(graph = g))
})
