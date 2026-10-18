# FIXME: ASAN tests for this file are crashing on CRAN, can we replicate?
skip_on_cran()

# 227. graphlets_impl

test_that("graphlets_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  E(g)$weight <- 1:2
  expect_snapshot(graphlets_impl(
    graph = g
  ))
  expect_snapshot(graphlets_impl(
    graph = g,
    weights = c(3, 4),
    niter = 10
  ))

  # Structured tests
  result <- graphlets_impl(
    graph = g
  )
  expect_type(result, "list")
})

test_that("graphlets_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(graphlets_impl(
    graph = NULL
  ))
})
