# FIXME: ASAN tests for this file are crashing on CRAN, can we replicate?
skip_on_cran()

# 299. adjacency_spectral_embedding_impl

test_that("adjacency_spectral_embedding_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(adjacency_spectral_embedding_impl(
    graph = g,
    no = 2
  ))
  expect_snapshot(adjacency_spectral_embedding_impl(
    graph = g,
    no = 2,
    weights = c(1, 2),
    which = "la",
    scaled = FALSE,
    cvec = c(1, 2, 3),
    options = list(maxiter = 10)
  ))

  # Structured tests
  result <- adjacency_spectral_embedding_impl(
    graph = g,
    no = 2
  )
  expect_type(result, "list")
})

test_that("adjacency_spectral_embedding_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(adjacency_spectral_embedding_impl(
    graph = NULL,
    no = 2
  ))
})

# 300. laplacian_spectral_embedding_impl

test_that("laplacian_spectral_embedding_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(laplacian_spectral_embedding_impl(
    graph = g,
    no = 2
  ))

  # Structured tests
  result <- laplacian_spectral_embedding_impl(
    graph = g,
    no = 2
  )
  expect_type(result, "list")
})

test_that("laplacian_spectral_embedding_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(laplacian_spectral_embedding_impl(
    graph = NULL,
    no = 2
  ))
})

# 305. dim_select_impl

test_that("dim_select_impl basic", {
  igraph_local_seed(20250909)
  expect_snapshot(dim_select_impl(
    sv = c(1, 2, 3)
  ))

  # Structured tests
  result <- dim_select_impl(
    sv = c(1, 2, 3)
  )
  expect_true(is.numeric(result) || is.logical(result))
})

test_that("dim_select_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(dim_select_impl(
    sv = NULL
  ))
})
