test_that("stochastic_matrix works", {
  g <- make_star(5, mode = "undirected")
  adj_mat <- as_adjacency_matrix(g)
  stoch_mat_manual <- adj_mat / degree(g)
  stoch_mat_calc <- stochastic_matrix(g)
  expect_equal(
    as_unnamed_dense_matrix(stoch_mat_manual),
    as_unnamed_dense_matrix(stoch_mat_calc)
  )

  stoch_mat_calc_col <- stochastic_matrix(g, column.wise = TRUE)
  expect_equal(
    t(as_unnamed_dense_matrix(stoch_mat_manual)),
    as_unnamed_dense_matrix(stoch_mat_calc_col)
  )
})

# ---- ellipsis migration: argument coverage ----------------------------------
# `column.wise` is covered by name above; here we add the `sparse` tail argument
# and the legacy positional recovery path.

test_that("stochastic_matrix() returns a sparse matrix when `sparse = TRUE`", {
  g <- make_star(5, "undirected")
  W <- stochastic_matrix(g, sparse = TRUE)
  expect_s4_class(W, "Matrix")
  # The sparse and dense forms describe the same stochastic matrix.
  expect_equal(
    as_unnamed_dense_matrix(W),
    as_unnamed_dense_matrix(stochastic_matrix(g, sparse = FALSE))
  )
})

test_that("stochastic_matrix() recovers a legacy positional `column.wise`", {
  g <- make_star(5, "undirected")
  lifecycle::expect_deprecated(
    W <- stochastic_matrix(g, TRUE)
  )
  expect_identical(W, stochastic_matrix(g, column.wise = TRUE))
})
