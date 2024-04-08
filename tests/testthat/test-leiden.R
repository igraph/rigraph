test_that("cluster_leiden works", {
  withr::local_seed(42)

  g <- make_graph("Zachary")
  mc <- cluster_leiden(g, resolution_parameter = 0.06)

  expect_equal(
    as.vector(membership(mc)),
    c(1, 1, 1, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 1, 2, 2, 1, 1, 2, 1, 2, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2)
  )
  expect_equal(length(mc), 2)
  expect_equal(
    sizes(mc),
    structure(c(17L, 17L), .Dim = 2L, .Dimnames = structure(list(`Community sizes` = c("1", "2")), .Names = "Community sizes"), class = "table")
  )

  withr::local_seed(42)
  mc <- cluster_leiden(g, "modularity")

  expect_equal(
    as.vector(membership(mc)),
    c(1, 1, 1, 1, 2, 2, 2, 1, 3, 3, 2, 1, 1, 1, 3, 3, 2, 1, 3, 1, 3, 1, 3, 4, 4, 4, 3, 4, 4, 3, 3, 4, 3, 3)
  )
  expect_equal(length(mc), 4)
  expect_equal(
    sizes(mc),
    structure(c(11L, 5L, 12L, 6L), .Dim = 4L, .Dimnames = structure(list(`Community sizes` = c("1", "2", "3", "4")), .Names = "Community sizes"), class = "table")
  )
})
