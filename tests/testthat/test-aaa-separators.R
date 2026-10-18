# FIXME: ASAN tests for this file are crashing on CRAN, can we replicate?
skip_on_cran()

# 272. even_tarjan_reduction_impl

test_that("even_tarjan_reduction_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(even_tarjan_reduction_impl(
    graph = g
  ))

  # Structured tests
  result <- even_tarjan_reduction_impl(
    graph = g
  )
  expect_type(result, "list")
})

test_that("even_tarjan_reduction_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(even_tarjan_reduction_impl(
    graph = NULL
  ))
})

# 273. is_separator_impl

test_that("is_separator_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(is_separator_impl(
    graph = g,
    candidate = 1:2
  ))

  # Structured tests
  result <- is_separator_impl(
    graph = g,
    candidate = 1:2
  )
  expect_true(is.numeric(result) || is.logical(result))
})

test_that("is_separator_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(is_separator_impl(
    graph = NULL,
    candidate = 1:2
  ))
})

# 274. is_minimal_separator_impl

test_that("is_minimal_separator_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(is_minimal_separator_impl(
    graph = g,
    candidate = 1:2
  ))

  # Structured tests
  result <- is_minimal_separator_impl(
    graph = g,
    candidate = 1:2
  )
  expect_true(is.numeric(result) || is.logical(result))
})

test_that("is_minimal_separator_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(is_minimal_separator_impl(
    graph = NULL,
    candidate = 1:2
  ))
})

# 275. all_minimal_st_separators_impl

test_that("all_minimal_st_separators_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(all_minimal_st_separators_impl(
    graph = g
  ))

  # Structured tests
  result <- all_minimal_st_separators_impl(
    graph = g
  )
  expect_type(result, "list")
})

test_that("all_minimal_st_separators_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(all_minimal_st_separators_impl(
    graph = NULL
  ))
})

# 276. minimum_size_separators_impl

test_that("minimum_size_separators_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(minimum_size_separators_impl(
    graph = g
  ))

  # Structured tests
  result <- minimum_size_separators_impl(
    graph = g
  )
  expect_type(result, "list")
})

test_that("minimum_size_separators_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(minimum_size_separators_impl(
    graph = NULL
  ))
})
