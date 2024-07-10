test_that("edge_density works", {
  g <- sample_gnp(50, 4 / 50)
  gd <- edge_density(g)
  gd2 <- ecount(g) / vcount(g) / (vcount(g) - 1) * 2
  expect_equal(gd, gd2)

  ####

  g <- sample_gnp(50, 4 / 50, directed = TRUE)
  gd <- edge_density(g)
  gd2 <- ecount(g) / vcount(g) / (vcount(g) - 1)
  expect_equal(gd, gd2)
})
