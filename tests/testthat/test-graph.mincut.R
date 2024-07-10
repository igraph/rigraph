test_that("min_cut works", {
  g2 <- make_graph(c(1, 2, 2, 3, 3, 4, 1, 6, 6, 5, 5, 4, 4, 1))
  E(g2)$capacity <- c(3, 1, 2, 10, 1, 3, 2)
  mc <- min_cut(g2, value.only = FALSE)

  expect_equal(mc$value, 1)
  expect_equal(as.vector(mc$cut), 2)
  expect_equal(as.vector(mc$partition1), 2)
  expect_equal(as.vector(mc$partition2), c(1, 3:6))
})

test_that("s-t min_cut works", {
  g2 <- make_graph(c(1, 2, 2, 3, 3, 4, 1, 6, 6, 5, 5, 4, 4, 1))
  E(g2)$capacity <- c(3, 1, 2, 10, 1, 3, 2)
  mc <- min_cut(g2, source = 2, target = 4, value.only = FALSE)

  expect_equal(mc$value, 1)
  expect_equal(as.vector(mc$cut), 2)
  expect_equal(as.vector(mc$partition1), 2)
  expect_equal(as.vector(mc$partition2), c(1, 3:6))
})
