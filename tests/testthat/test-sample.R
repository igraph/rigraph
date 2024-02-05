test_that("Sampling from a Dirichlet distribution works", {
  withr::local_seed(42)
  samp <- sample_dirichlet(10000, alpha = c(1, 1, 1))
  expect_that(dim(samp), equals(c(3, 10000)))
  expect_that(colSums(samp), equals(rep(1, 10000)))
  expect_equal(rowMeans(samp), rep(1 / 3, 3), tolerance = 1e-2)
  expect_equal(apply(samp, 1, sd), rep(1 / (3 * sqrt(2)), 3), tolerance = 1e-2)

  ## Corner cases
  sd1 <- sample_dirichlet(1, alpha = c(2, 2, 2))
  expect_that(dim(sd1), equals(c(3, 1)))
  sd0 <- sample_dirichlet(0, alpha = c(3, 3, 3))
  expect_that(dim(sd0), equals(c(3, 0)))

  ## Errors
  expect_that(
    sample_dirichlet(-1, alpha = c(1, 1, 1, 1)),
    throws_error("should be non-negative")
  )
  expect_that(
    sample_dirichlet(5, alpha = c(1)),
    throws_error("must have at least two entries")
  )
  expect_that(
    sample_dirichlet(5, alpha = c(0, 1, 1)),
    throws_error("must be positive")
  )
  expect_that(
    sample_dirichlet(5, alpha = c(1, -1, -1)),
    throws_error("must be positive")
  )
})
