# FIXME: ASAN tests for this file are crashing on CRAN, can we replicate?
skip_on_cran()

# 26. full_bipartite_impl
test_that("full_bipartite_impl basic", {
  igraph_local_seed(20250909)
  expect_snapshot(full_bipartite_impl(
    n1 = 2,
    n2 = 3
  ))
  expect_snapshot(full_bipartite_impl(
    n1 = 2,
    n2 = 3,
    directed = TRUE,
    mode = "in"
  ))

  # Structured tests
  result <- full_bipartite_impl(
    n1 = 2,
    n2 = 3
  )
  expect_type(result, "list")
})

test_that("full_bipartite_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(full_bipartite_impl(
    n1 = -1,
    n2 = 3
  ))
})

# 165. bipartite_projection_size_impl

test_that("bipartite_projection_size_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 4
  )

  V(g)$type <- c(TRUE, FALSE, TRUE, FALSE)
  expect_snapshot(bipartite_projection_size_impl(
    graph = g
  ))

  # Structured tests
  result <- bipartite_projection_size_impl(
    graph = g
  )
  expect_type(result, "list")
})

test_that("bipartite_projection_size_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(bipartite_projection_size_impl(
    graph = NULL
  ))
})

# 166. biadjacency_impl

test_that("biadjacency_impl basic", {
  igraph_local_seed(20250909)
  m <- matrix(c(1, 0, 1, 0, 1, 1), nrow = 2)
  expect_snapshot(biadjacency_impl(
    incidence = m
  ))
  expect_snapshot(biadjacency_impl(
    incidence = m,
    directed = TRUE,
    mode = "in",
    multiple = TRUE
  ))

  # Structured tests
  result <- biadjacency_impl(
    incidence = m
  )
  expect_type(result, "list")
})

test_that("biadjacency_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(biadjacency_impl(
    incidence = "a"
  ))
})

# 167. get_biadjacency_impl

test_that("get_biadjacency_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(get_biadjacency_impl(
    graph = g,
    types = c(TRUE, FALSE, TRUE)
  ))

  # Structured tests
  result <- get_biadjacency_impl(
    graph = g,
    types = c(TRUE, FALSE, TRUE)
  )
  expect_type(result, "list")
})

test_that("get_biadjacency_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(
    get_biadjacency_impl(
      graph = NULL,
      types = c(TRUE, FALSE, TRUE)
    )
  )
})

# 168. is_bipartite_impl

test_that("is_bipartite_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(is_bipartite_impl(
    graph = g
  ))

  # Structured tests
  result <- is_bipartite_impl(
    graph = g
  )
  expect_type(result, "list")
})

test_that("is_bipartite_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(is_bipartite_impl(
    graph = NULL
  ))
})

# 169. bipartite_game_gnp_impl

test_that("bipartite_game_gnp_impl basic", {
  igraph_local_seed(20250909)
  expect_snapshot(bipartite_game_gnp_impl(
    n1 = 2,
    n2 = 2,
    p = 0.5
  ))
  expect_snapshot(bipartite_game_gnp_impl(
    n1 = 2,
    n2 = 2,
    p = 0.5,
    directed = TRUE,
    mode = "in"
  ))

  # Structured tests
  result <- bipartite_game_gnp_impl(
    n1 = 2,
    n2 = 2,
    p = 0.5
  )
  expect_type(result, "list")
})

test_that("bipartite_game_gnp_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(bipartite_game_gnp_impl(
    n1 = -1,
    n2 = 2,
    p = 0.5
  ))
})

# 170. bipartite_game_gnm_impl

test_that("bipartite_game_gnm_impl basic", {
  igraph_local_seed(20250909)
  expect_snapshot(bipartite_game_gnm_impl(
    n1 = 2,
    n2 = 2,
    m = 1
  ))
  expect_snapshot(bipartite_game_gnm_impl(
    n1 = 2,
    n2 = 2,
    m = 1,
    directed = TRUE,
    mode = "in"
  ))

  # Structured tests
  result <- bipartite_game_gnm_impl(
    n1 = 2,
    n2 = 2,
    m = 1
  )
  expect_type(result, "list")
})

test_that("bipartite_game_gnm_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(bipartite_game_gnm_impl(
    n1 = -1,
    n2 = 2,
    m = 1
  ))
})

# Bipartite functions

test_that("create_bipartite_impl basic", {
  igraph_local_seed(20250909)
  expect_snapshot(create_bipartite_impl(
    types = c(FALSE, FALSE, TRUE, TRUE),
    edges = c(0, 2, 0, 3, 1, 2, 1, 3),
    directed = FALSE
  ))
})

test_that("bipartite_game_impl basic", {
  igraph_local_seed(20250909)
  expect_snapshot(bipartite_game_impl(
    type = "gnp",
    n1 = 5,
    n2 = 5,
    p = 0.3,
    directed = FALSE
  ))
  expect_snapshot(bipartite_game_impl(
    type = "gnm",
    n1 = 5,
    n2 = 5,
    m = 10,
    directed = FALSE
  ))
})
