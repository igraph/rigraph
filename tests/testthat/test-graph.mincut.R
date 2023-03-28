test_that("min_cut works", {
  g2 <- make_graph(c(1, 2, 2, 3, 3, 4, 1, 6, 6, 5, 5, 4, 4, 1))
  E(g2)$capacity <- c(3, 1, 2, 10, 1, 3, 2)
  mc <- min_cut(g2, value.only = FALSE)

  expect_that(mc$value, equals(1))
  expect_that(as.vector(mc$cut), equals(2))
  expect_that(as.vector(mc$partition1), equals(2))
  expect_that(as.vector(mc$partition2), equals(c(1, 3:6)))
})

test_that("s-t min_cut works", {
  g2 <- make_graph(c(1, 2, 2, 3, 3, 4, 1, 6, 6, 5, 5, 4, 4, 1))
  E(g2)$capacity <- c(3, 1, 2, 10, 1, 3, 2)
  mc <- min_cut(g2, source = 2, target = 4, value.only = FALSE)

  expect_that(mc$value, equals(1))
  expect_that(as.vector(mc$cut), equals(2))
  expect_that(as.vector(mc$partition1), equals(2))
  expect_that(as.vector(mc$partition2), equals(c(1, 3:6)))
})
