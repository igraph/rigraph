test_that("arpack lifecycle warning", {
  rlang::local_options(lifecycle_verbosity = "warning")

  f <- function(x, extra = NULL) x
  expect_warning(
    res <- arpack(f, options = function() list(n = 10, nev = 2, ncv = 4), sym = TRUE)
  )
  expect_equal(res$values, c(1, 1))
})

test_that("arpack works for identity matrix", {
  f <- function(x, extra = NULL) x
  res <- arpack(f, options = list(n = 10, nev = 2, ncv = 4), sym = TRUE)
  expect_equal(res$values, c(1, 1))
})

test_that("arpack works on the Laplacian of a star", {
  f <- function(x, extra = NULL) {
    y <- x
    y[1] <- (length(x) - 1) * x[1] - sum(x[-1])
    for (i in 2:length(x)) {
      y[i] <- x[i] - x[1]
    }
    y
  }

  r1 <- arpack(f, options = list(n = 10, nev = 1, ncv = 3), sym = TRUE)
  r2 <- eigen(laplacian_matrix(make_star(10, mode = "undirected")))

  correctSign <- function(x) {
    if (x[1] < 0) {
      -x
    } else {
      x
    }
  }
  expect_equal(r1$values, r2$values[1])
  expect_equal(correctSign(r1$vectors), correctSign(r2$vectors[, 1]))
})

####
# Complex case

test_that("arpack works for non-symmetric matrices", {
  A <- structure(
    c(
      -6, -6, 7, 6, 1, -9, -3, 2, -9, -7, 0, 1, -7, 8,
      -7, 10, 0, 0, 1, 1, 10, 0, 8, -4, -4, -5, 8, 9, -6, 9, 3, 8,
      6, -1, 9, -9, -6, -3, -1, -7, 8, -4, -4, 10, 0, 5, -2, 0, 7,
      10, 1, 4, -8, 3, 5, 3, -7, -9, 10, -1, -4, -7, -1, 7, 5, -5,
      1, -4, 9, -2, 10, 1, -7, 7, 6, 7, -3, 0, 9, -5, -8, 1, -3,
      -3, -8, -7, -8, 10, 8, 7, 0, 6, -7, -8, 10, 10, 1, 0, -2, 6
    ),
    .Dim = c(10L, 10L)
  )

  f <- function(x, extra = NULL) A %*% x
  res <- arpack(f, options = list(n = 10, nev = 3, ncv = 7, which = "LM"), sym = FALSE)
  ## This is needed because they might return a different complex conjugate
  expect_equal(abs(res$values / eigen(A)$values[1:3]), c(1, 1, 1))
  expect_equal(
    (res$values[1] * res$vectors[, 1]) / (A %*% res$vectors[, 1]),
    cbind(rep(1 + 0i, nrow(A)))
  )
  expect_equal(
    (res$values[2] * res$vectors[, 2]) / (A %*% res$vectors[, 2]),
    cbind(rep(1 + 0i, nrow(A)))
  )
  expect_equal(
    abs((res$values[3] * res$vectors[, 3]) / (A %*% res$vectors[, 3])),
    cbind(rep(1, nrow(A)))
  )

  f <- function(x, extra = NULL) A %*% x
  res <- arpack(f, options = list(n = 10, nev = 4, ncv = 9, which = "LM"), sym = FALSE)
  ## This is needed because they might return a different complex conjugate
  expect_equal(abs(res$values / eigen(A)$values[1:4]), rep(1, 4))
  expect_equal(
    (res$values[1] * res$vectors[, 1]) / (A %*% res$vectors[, 1]),
    cbind(rep(1 + 0i, nrow(A)))
  )
  expect_equal(
    (res$values[2] * res$vectors[, 2]) / (A %*% res$vectors[, 2]),
    cbind(rep(1 + 0i, nrow(A)))
  )
  expect_equal(
    abs((res$values[3] * res$vectors[, 3]) / (A %*% res$vectors[, 3])),
    cbind(rep(1, nrow(A)))
  )
  expect_equal(
    abs((res$values[4] * res$vectors[, 4]) / (A %*% res$vectors[, 4])),
    cbind(rep(1, nrow(A)))
  )
})

####

# TODO: further tests for typically hard cases
