# FIXME: ASAN tests for this file are crashing on CRAN, can we replicate?
skip_on_cran()

# 126. unfold_tree_impl

test_that("unfold_tree_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(unfold_tree_impl(
    graph = g,
    roots = 1
  ))
  expect_snapshot(unfold_tree_impl(
    graph = g,
    mode = "in",
    roots = 1
  ))

  # Structured tests
  result <- unfold_tree_impl(
    graph = g,
    roots = 1
  )
  expect_type(result, "list")
})

test_that("unfold_tree_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(unfold_tree_impl(
    graph = NULL,
    roots = 1
  ))
})

# 314. is_tree_impl

test_that("is_tree_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(is_tree_impl(
    graph = g
  ))
  expect_snapshot(is_tree_impl(
    graph = g,
    mode = "in",
    details = TRUE
  ))

  # Structured tests
  result <- is_tree_impl(
    graph = g
  )
  expect_true(is.numeric(result) || is.logical(result))
})

test_that("is_tree_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(is_tree_impl(
    graph = NULL
  ))
})

# 315. is_forest_impl

test_that("is_forest_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(is_forest_impl(
    graph = g
  ))
  expect_snapshot(is_forest_impl(
    graph = g,
    mode = "in",
    details = TRUE
  ))

  # Structured tests
  result <- is_forest_impl(
    graph = g
  )
  expect_true(is.numeric(result) || is.logical(result))
})

test_that("is_forest_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(is_forest_impl(
    graph = NULL
  ))
})

# 317. to_prufer_impl

test_that("to_prufer_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(to_prufer_impl(
    graph = g
  ))

  # Structured tests
  result <- to_prufer_impl(
    graph = g
  )
  expect_true(is.numeric(result) || is.logical(result))
})

test_that("to_prufer_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(to_prufer_impl(
    graph = NULL
  ))
})

# 320. random_spanning_tree_impl

test_that("random_spanning_tree_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(random_spanning_tree_impl(
    graph = g,
    vid = 1
  ))

  # Structured tests
  result <- random_spanning_tree_impl(
    graph = g,
    vid = 1
  )
  expect_s3_class(result, "igraph.es")
})

test_that("random_spanning_tree_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(random_spanning_tree_impl(
    graph = NULL,
    vid = 1
  ))
})
