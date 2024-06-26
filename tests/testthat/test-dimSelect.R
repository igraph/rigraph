test_that("dimensionality selection works", {
  withr::local_seed(42)

  k <- make_graph("zachary")
  ev <- eigen(as_adjacency_matrix(k), only.values = TRUE)$values
  kdim <- dim_select(ev)
  expect_equal(kdim, 4)

  expect_equal(dim_select(1:100), 50)

  ## Some regression tests
  expect_equal(dim_select(runif(100)), 69)
  expect_equal(dim_select(runif(100)), 88)
  expect_equal(dim_select(runif(100)), 3)
  expect_equal(dim_select(runif(100)), 99)

  ## Some more meaningful tests
  x <- c(rnorm(50, mean = 0, sd = 1), rnorm(50, mean = 5, sd = 1))
  expect_equal(dim_select(x), 50)

  x <- c(rnorm(10, mean = 0, sd = 1), rnorm(90, mean = 2, sd = 1))
  expect_equal(dim_select(x), 10)

  x <- c(10, rnorm(99, mean = 0, sd = 1))
  expect_equal(dim_select(x), 1)

  x <- c(rnorm(99, mean = 0, sd = 1), 10)
  expect_equal(dim_select(x), 99)
})
