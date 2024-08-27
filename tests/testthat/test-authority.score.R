test_that("`authority_score()` works", {
  rlang::local_options(lifecycle_verbosity = "quiet")
  mscale <- function(x) {
    if (sd(x) != 0) {
      x <- scale(x)
    }
    if (x[1] < 0) {
      x <- -x
    }
    x
  }

  g1 <- make_graph(
    c(1, 3, 1, 6, 1, 10, 2, 1, 3, 1, 4, 2, 4, 7, 4, 9, 5, 4, 5, 6, 5, 8, 6, 3,
      7, 1, 7, 5, 7, 6, 7, 10, 8, 4, 9, 6, 10, 5, 10, 7),
    directed = TRUE)
  A <- as_adj(g1, sparse = FALSE)
  s1 <- eigen(t(A) %*% A)$vectors[, 1]
  s2 <- authority_score(g1)$vector
  expect_equal(
    s2,
    c(0.519632767970952, 0.0191587307007462, 0.327572049088003,
      0.238728053455971, 0.449690304629051, 1, 0.0966933781044594,
      0.204851318050036, 0.0191587307007462, 0.653243552177761)
  )
  expect_equal(mscale(s1), mscale(s2), ignore_attr = TRUE)

  g2 <- make_graph(
    c(1, 2, 1, 4, 2, 3, 2, 4, 3, 1, 3, 5, 4, 3, 5, 1, 5, 2),
    directed = TRUE
  )
  A <- as_adj(g2, sparse = FALSE)
  s1 <- eigen(t(A) %*% A)$vectors[, 1]
  s2 <- authority_score(g2)$vector
  expect_equal(
    s2,
    c(0.763521118433368, 1, 0.546200349457202,
      0.918985947228995, 0.28462967654657)
  )
  expect_equal(mscale(s1), mscale(s2), ignore_attr = TRUE)

  rlang::with_options(lifecycle_verbosity = "warning", {
    expect_snapshot(
      s3 <- authority_score(g2, options = arpack_defaults)$vector
    )
  })
  expect_equal(s2, s3)
})

test_that("`hub_score()` works", {
  rlang::local_options(lifecycle_verbosity = "quiet")
  mscale <- function(x) {
    if (sd(x) != 0) {
      x <- scale(x)
    }
    if (x[1] < 0) {
      x <- -x
    }
    x
  }

  g1 <- make_graph(
    c(1, 3, 1, 6, 1, 10, 2, 1, 3, 1, 4, 2, 4, 7, 4, 9, 5, 4, 5, 6, 5, 8, 6, 3,
      7, 1, 7, 5, 7, 6, 7, 10, 8, 4, 9, 6, 10, 5, 10, 7),
    directed = TRUE)
  A <- as_adj(g1, sparse = FALSE)
  s1 <- eigen(A %*% t(A))$vectors[, 1]
  s2 <- hub_score(g1)$vector
  expect_equal(
    s2,
    c(0.755296579522977, 0.198139015063149, 0.198139015063149,
      0.0514804231207635, 0.550445261472941, 0.124905139108053,
      1, 0.0910284037021176, 0.381305851509012, 0.208339295395331)
  )
  expect_equal(mscale(s1), mscale(s2), ignore_attr = TRUE)

  g2 <- make_graph(
    c(1, 2, 1, 4, 2, 3, 2, 4, 3, 1, 3, 5, 4, 3, 5, 1, 5, 2),
    directed = TRUE
  )
  A <- as_adj(g2, sparse = FALSE)
  s1 <- eigen(A %*% t(A))$vectors[, 1]
  s2 <- hub_score(g2)$vector
  expect_equal(
    s2,
    c(1, 0.763521118433368, 0.546200349457203,
      0.28462967654657, 0.918985947228995)
  )
  expect_equal(mscale(s1), mscale(s2), ignore_attr = TRUE)

  rlang::with_options(lifecycle_verbosity = "warning", {
    expect_snapshot(
      s3 <- hub_score(g2, options = arpack_defaults)$vector
    )
  })
  expect_equal(s2, s3)
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
    as <- hits_scores(G)
    M <- as_adj(G, sparse = FALSE)
    is.good(t(M) %*% M, as$authority, as$value)
  }

  for (i in 1:100) {
    G <- sample_gnm(10, sample(1:20, 1))
    hs <- hits_scores(G)
    M <- as_adj(G, sparse = FALSE)
    is.good(M %*% t(M), hs$hub, hs$value)
  }
})

test_that("`hits_score()` works -- authority", {
  mscale <- function(x) {
    if (sd(x) != 0) {
      x <- scale(x)
    }
    if (x[1] < 0) {
      x <- -x
    }
    x
  }

  g1 <- make_graph(
    c(1, 3, 1, 6, 1, 10, 2, 1, 3, 1, 4, 2, 4, 7, 4, 9, 5, 4, 5, 6, 5, 8, 6, 3,
      7, 1, 7, 5, 7, 6, 7, 10, 8, 4, 9, 6, 10, 5, 10, 7),
    directed = TRUE)
  A <- as_adj(g1, sparse = FALSE)
  s1 <- eigen(t(A) %*% A)$vectors[, 1]
  s2 <- hits_scores(g1)$authority
  expect_equal(
    s2,
    c(0.519632767970952, 0.0191587307007462, 0.327572049088003,
      0.238728053455971, 0.449690304629051, 1, 0.0966933781044594,
      0.204851318050036, 0.0191587307007462, 0.653243552177761)
  )
  expect_equal(mscale(s1), mscale(s2), ignore_attr = TRUE)

  g2 <- make_graph(
    c(1, 2, 1, 4, 2, 3, 2, 4, 3, 1, 3, 5, 4, 3, 5, 1, 5, 2),
    directed = TRUE
  )
  A <- as_adj(g2, sparse = FALSE)
  s1 <- eigen(t(A) %*% A)$vectors[, 1]
  s2 <- hits_scores(g2)$authority
  expect_equal(
    s2,
    c(0.763521118433368, 1, 0.546200349457202,
      0.918985947228995, 0.28462967654657)
  )
  expect_equal(mscale(s1), mscale(s2), ignore_attr = TRUE)

})

test_that("`hits_scores()` works -- hub", {
  mscale <- function(x) {
    if (sd(x) != 0) {
      x <- scale(x)
    }
    if (x[1] < 0) {
      x <- -x
    }
    x
  }

  g1 <- make_graph(
    c(1, 3, 1, 6, 1, 10, 2, 1, 3, 1, 4, 2, 4, 7, 4, 9, 5, 4, 5, 6, 5, 8, 6, 3,
      7, 1, 7, 5, 7, 6, 7, 10, 8, 4, 9, 6, 10, 5, 10, 7),
    directed = TRUE)
  A <- as_adj(g1, sparse = FALSE)
  s1 <- eigen(A %*% t(A))$vectors[, 1]
  s2 <- hits_scores(g1)$hub
  expect_equal(
    s2,
    c(0.755296579522977, 0.198139015063149, 0.198139015063149,
      0.0514804231207635, 0.550445261472941, 0.124905139108053,
      1, 0.0910284037021176, 0.381305851509012, 0.208339295395331)
  )
  expect_equal(mscale(s1), mscale(s2), ignore_attr = TRUE)

  g2 <- make_graph(
    c(1, 2, 1, 4, 2, 3, 2, 4, 3, 1, 3, 5, 4, 3, 5, 1, 5, 2),
    directed = TRUE
  )
  A <- as_adj(g2, sparse = FALSE)
  s1 <- eigen(A %*% t(A))$vectors[, 1]
  s2 <-  hits_scores(g2)$hub
  expect_equal(
    s2,
    c(1, 0.763521118433368, 0.546200349457203,
      0.28462967654657, 0.918985947228995)
  )
  expect_equal(mscale(s1), mscale(s2), ignore_attr = TRUE)

})

