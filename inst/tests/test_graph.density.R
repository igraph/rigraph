
context("edge_density")

test_that("edge_density works", {

  library(igraph)

  g <- sample_gnp(50, 4/50)
  gd <- edge_density(g)
  gd2 <- ecount(g) / vcount(g) / (vcount(g)-1) * 2
  expect_that(gd, equals(gd2))

####

  g <- sample_gnp(50, 4/50, dir=TRUE)
  gd <- edge_density(g)
  gd2 <- ecount(g) / vcount(g) / (vcount(g)-1)
  expect_that(gd, equals(gd2))

})
