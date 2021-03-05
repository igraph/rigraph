
context("cluster_louvain")

test_that("cluster_louvain works", {

  library(igraph)
  set.seed(42)

  g <- make_graph("Zachary")
  mc <- cluster_louvain(g)
  
  expect_that(as.vector(membership(mc)),
              equals(c(1,1,1,1,2,2,2,1,3,1,2,1,1,1,3,3,2,
                       1,3,1,3,1,3,4,4,4,3,4,4,3,3,4,3,3)))
  expect_that(modularity(g, mc$membership), equals(max(mc$modularity)))
  expect_that(length(mc), equals(4))
  expect_that(sizes(mc),
              equals(structure(c(12L, 5L, 11L, 6L), .Dim = 4L,
                .Dimnames = structure(list(`Community sizes` = c("1",
                     "2", "3", "4")), .Names = "Community sizes"),
                               class = "table") ))
})
