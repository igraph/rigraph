test_that("`authority_score()` works", {
  mscale <- function(x) {
    if (sd(x) != 0) {
      x <- scale(x)
    }
    if (x[1] < 0) {
      x <- -x
    }
    x
  }

  g1 <- sample_pa(100, m = 10)
  A <- as_adj(g1, sparse = FALSE)
  s1 <- eigen(t(A) %*% A)$vectors[, 1]
  s2 <- authority_score(g1)$vector
  expect_that(mscale(s1), is_equivalent_to(mscale(s2)))

  g2 <- sample_gnp(100, 2 / 100)
  A <- as_adj(g2, sparse = FALSE)
  s1 <- eigen(t(A) %*% A)$vectors[, 1]
  s2 <- authority_score(g2)$vector
  expect_that(mscale(s1), is_equivalent_to(mscale(s2)))

  rlang::local_options(lifecycle_verbosity = "warning")
  expect_warning(
    s3 <- authority_score(g2, options = arpack_defaults)$vector
  )
  expect_equal(s2, s3)
})

test_that("`hub_score()` works", {
  mscale <- function(x) {
    if (sd(x) != 0) {
      x <- scale(x)
    }
    if (x[1] < 0) {
      x <- -x
    }
    x
  }

  g1 <- sample_pa(100, m = 10)
  A <- as_adj(g1, sparse = FALSE)
  s1 <- eigen(A %*% t(A))$vectors[, 1]
  s2 <- hub_score(g1)$vector
  expect_that(mscale(s1), is_equivalent_to(mscale(s2)))

  g2 <- sample_gnp(100, 2 / 100)
  A <- as_adj(g2, sparse = FALSE)
  s1 <- eigen(A %*% t(A))$vectors[, 1]
  s2 <- hub_score(g2)$vector
  expect_that(mscale(s1), is_equivalent_to(mscale(s2)))

  rlang::local_options(lifecycle_verbosity = "warning")
  expect_warning(
    s3 <- hub_score(g2, options = arpack_defaults)$vector
  )
  expect_equal(s2, s3)
})

test_that("authority scores of a ring are all one", {
  g3 <- make_ring(100)
  expect_equal(authority_score(g3)$vector, rep(1, vcount(g3)))
  expect_equal(hub_score(g3)$vector, rep(1, vcount(g3)))
})

test_that("authority_score survives stress test", {
  skip_on_cran()

  withr::local_seed(42)

  is.principal <- function(M, lambda) {
    expect_equal(eigen(M)$values[1], lambda)
  }

  is.ev <- function(M, v, lambda) {
    expect_equal(as.vector(M %*% v), lambda * v)
  }

  is.good <- function(M, v, lambda) {
    is.principal(M, lambda)
    is.ev(M, v, lambda)
  }

  for (i in 1:100) {
    G <- sample_gnm(10, sample(1:20, 1))
    as <- authority_score(G)
    M <- as_adj(G, sparse = FALSE)
    is.good(t(M) %*% M, as$vector, as$value)
  }

  for (i in 1:100) {
    G <- sample_gnm(10, sample(1:20, 1))
    hs <- hub_score(G)
    M <- as_adj(G, sparse = FALSE)
    is.good(M %*% t(M), hs$vector, hs$value)
  }
})
