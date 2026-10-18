# FIXME: ASAN tests for this file are crashing on CRAN, can we replicate?
skip_on_cran()

# 123. is_perfect_impl

test_that("is_perfect_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(is_perfect_impl(
    graph = g
  ))

  # Structured tests
  result <- is_perfect_impl(
    graph = g
  )
  expect_true(is.numeric(result) || is.logical(result))
})

test_that("is_perfect_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(is_perfect_impl(
    graph = NULL
  ))
})

# 322. vertex_coloring_greedy_impl

test_that("vertex_coloring_greedy_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(vertex_coloring_greedy_impl(
    graph = g
  ))
  expect_snapshot(vertex_coloring_greedy_impl(
    graph = g,
    heuristic = "dsatur"
  ))

  # Structured tests
  result <- vertex_coloring_greedy_impl(
    graph = g
  )
  expect_true(is.numeric(result))
})

test_that("vertex_coloring_greedy_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(vertex_coloring_greedy_impl(
    graph = NULL
  ))
})

# 323. is_vertex_coloring_impl

test_that("is_vertex_coloring_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(is_vertex_coloring_impl(
    graph = g,
    types = c(1, 2, 3)
  ))

  # Structured tests
  result <- is_vertex_coloring_impl(
    graph = g,
    types = c(1, 2, 3)
  )
  expect_true(is.numeric(result) || is.logical(result))
})

test_that("is_vertex_coloring_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(
    is_vertex_coloring_impl(
      graph = NULL,
      types = c(1, 2, 3)
    )
  )
})

# 324. is_bipartite_coloring_impl

# test_that("is_bipartite_coloring_impl basic", {
#   igraph_local_seed(20250909)
#   oldval <- igraph_opt("print.id")
# igraph_options(print.id = FALSE)
#   g <- path_graph_impl(3)
#   expect_snapshot(is_bipartite_coloring_impl(g, types = c(TRUE, FALSE, TRUE)))
#})

# 325. is_bipartite_coloring_impl

test_that("is_bipartite_coloring_impl basic", {
  igraph_local_seed(12345)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(is_bipartite_coloring_impl(
    graph = g,
    types = c(TRUE, FALSE, TRUE)
  ))

  # Structured tests
  result <- is_bipartite_coloring_impl(
    graph = g,
    types = c(TRUE, FALSE, TRUE)
  )
  expect_true(is.numeric(result) || is.logical(result))
})

test_that("is_bipartite_coloring_impl errors", {
  igraph_local_seed(12345)
  expect_snapshot_igraph_error(
    is_bipartite_coloring_impl(
      graph = NULL,
      types = c(TRUE, FALSE, TRUE)
    )
  )
})

# 326. is_edge_coloring_impl

test_that("is_edge_coloring_impl basic", {
  igraph_local_seed(12345)
  g <- path_graph_impl(
    n = 3
  )

  E(g)$color <- c(1, 2)
  expect_snapshot(is_edge_coloring_impl(
    graph = g,
    types = c(1, 2)
  ))
  expect_snapshot(is_edge_coloring_impl(
    graph = g
  ))

  # Structured tests
  result <- is_edge_coloring_impl(
    graph = g,
    types = c(1, 2)
  )
  expect_true(is.numeric(result) || is.logical(result))
})

test_that("is_edge_coloring_impl errors", {
  igraph_local_seed(12345)
  expect_snapshot_igraph_error(is_edge_coloring_impl(
    graph = NULL,
    types = c(1, 2)
  ))
})
