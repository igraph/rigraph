test_that("mst works", {
  g <- graph_from_data_frame(
    data.frame(
      from = c(1, 1, 2, 2, 2, 3, 4),
      to = c(2, 3, 3, 4, 5, 5, 5),
      weight = c(1, 7, 5, 4, 3, 6, 2)
    ),
    directed = FALSE
  )
  mst_true <- graph_from_data_frame(
    data.frame(
      from = c(1, 2, 2, 4),
      to = c(2, 3, 5, 5),
      weight = c(1, 5, 3, 2)
    ),
    directed = FALSE
  )
  mst_g <- mst(g)
  expect_isomorphic(mst_g, mst_true)

  mst_g_prim <- mst(g, algorithm = "prim")
  expect_isomorphic(mst_g_prim, mst_true)

  mst_g_unweighted <- mst(g, algorithm = "unweighted")
  mst_true_unweighted <- graph_from_data_frame(
    data.frame(
      from = c(1, 1, 2, 2),
      to = c(2, 3, 4, 5)
    ),
    directed = FALSE
  )
  expect_isomorphic(mst_g_unweighted, mst_true_unweighted)
})

test_that("mst error works", {
  g <- sample_gnp(10, 0.4)
  expect_snapshot(
    mst(g, algorithm = "undefined"),
    error = TRUE
  )
})
