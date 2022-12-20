test_that("ivs works", {
  g <- sample_gnp(50, 0.8)
  ivs <- ivs(g, min = ivs_size(g))
  ec <- sapply(seq_along(ivs), function(x) {
    ecount(induced_subgraph(g, ivs[[x]]))
  })
  expect_that(unique(ec), equals(0))
})
