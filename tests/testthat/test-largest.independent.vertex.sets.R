test_that("largest_ivs works", {
  g <- sample_gnp(50, 0.8)
  livs <- largest_ivs(g)
  expect_equal(
    unique(sapply(livs, length)),
    ivs_size(g)
  )

  ec <- sapply(seq_along(livs), function(x) {
    ecount(induced_subgraph(g, livs[[x]]))
  })
  expect_equal(unique(ec), 0)

  ## TODO: check that they are largest
})
