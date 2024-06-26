test_that("largest_cliques works", {
  g <- sample_gnp(50, 20 / 50)
  lc <- largest_cliques(g)

  ## TODO: this only checks that these are cliques
  expect_equal(
    unique(sapply(lc, function(x) {
      edge_density(induced_subgraph(g, x))
    })),
    1
  )
})
