test_that("stochastic_matrix works", {
  g <- make_star(5, "undirected")
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
