test_that("spectrum works for symmetric matrices", {
  withr::local_seed(42)

  std <- function(x) {
    x <- zapsmall(x)
    apply(x, 2, function(col) {
      if (any(col < 0) && col[which(col != 0)[1]] < 0) {
        -col
      } else {
        col
      }
    })
  }

  g <- sample_gnp(50, 5 / 50)
  e0 <- eigen(as_adjacency_matrix(g, sparse = FALSE))

  e1 <- spectrum(g, which = list(howmany = 4, pos = "LA"))
  expect_equal(e0$values[1:4], e1$values)
  expect_equal(std(e0$vectors[, 1:4]), std(e1$vectors))

  e2 <- spectrum(g, which = list(howmany = 4, pos = "SA"))
  expect_equal(e0$values[50:47], e2$values)
  expect_equal(std(e0$vectors[, 50:47]), std(e2$vectors))

  rlang::local_options(lifecycle_verbosity = "warning")
  expect_warning(
    e3 <- spectrum(g, which = list(howmany = 4, pos = "SA"), options = arpack_defaults)
  )
})
