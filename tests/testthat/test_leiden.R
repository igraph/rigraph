
context("cluster_leiden")

test_that("cluster_leiden works", {

  library(igraph)
  set.seed(42)

  g <- make_graph("Zachary")
  mc <- cluster_leiden(g, resolution_parameter=0.06)

  expect_that(as.vector(membership(mc)),
              equals(c(1,1,1,1,1,1,1,1,2,1,1,1,1,1,2,2,1,
                       1,2,1,2,1,2,2,2,2,2,2,2,2,2,2,2,2)))
  expect_that(length(mc), equals(2))
  expect_that(sizes(mc),
              equals(structure(c(17L, 17L), .Dim = 2L,
                               .Dimnames = structure(list(`Community sizes` = c("1", "2")),
                                                     .Names = "Community sizes"),
                               class = "table")
                    ))

  set.seed(42)
  mc <- cluster_leiden(g, "modularity")

  expect_that(as.vector(membership(mc)),
              equals(c(1,1,1,1,2,2,2,1,3,3,2,1,1,1,3,3,2,
                       1,3,1,3,1,3,4,4,4,3,4,4,3,3,4,3,3)))
  expect_that(length(mc), equals(4))
  expect_that(sizes(mc),
              equals(structure(c(11L, 5L, 12L, 6L), .Dim = 4L,
                               .Dimnames = structure(list(`Community sizes` = c("1", "2", "3", "4")),
                                                     .Names = "Community sizes"),
                               class = "table")
                    ))
})
