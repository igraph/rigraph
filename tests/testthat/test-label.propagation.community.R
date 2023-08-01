test_that("label.propagation.community works", {
  g <- make_graph("Zachary")
  set.seed(42)
  lpc <- cluster_label_prop(g)
  expect_that(lpc$modularity, equals(modularity(g, lpc$membership)))
  expect_that(
    as.vector(membership(lpc)),
    equals(c(
      1, 1, 1, 1, 2, 2, 2, 1, 3, 3, 2, 1, 1, 1, 3, 3,
      2, 1, 3, 1, 3, 1, 3, 3, 4, 4, 3, 3, 1, 3, 3, 4,
      3, 3
    ))
  )
  expect_that(length(lpc), equals(4))
  expect_that(
    sizes(lpc),
    equals(structure(c(12L, 5L, 14L, 3L),
      .Dim = 4L, .Dimnames =
        structure(
          list(
            `Community sizes` =
              c("1", "2", "3", "4")
          ),
          .Names = "Community sizes"
        ),
      class = "table"
    ))
  )
})
