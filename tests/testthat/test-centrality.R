test_that("subgraph_centrality() works", {
  frucht_graph <- make_graph("Frucht")
  expect_equal(
    subgraph_centrality(frucht_graph),
    Matrix::diag(Matrix::expm(as_adjacency_matrix(frucht_graph, sparse = FALSE))),
    tolerance = 1e-10
  )

  grotzsch_graph <- make_graph("Grotzsch")
  expect_equal(
    subgraph_centrality(grotzsch_graph),
    Matrix::diag(Matrix::expm(as_adjacency_matrix(grotzsch_graph, sparse = FALSE))),
    tolerance = 1e-10
  )
})

test_that("subgraph_centrality() ignored edge directions", {
  withr::local_seed(137)
  g <- sample_gnm(10, 20, directed = TRUE)
  expect_equal(
    subgraph_centrality((g)),
    subgraph_centrality(as_undirected(g, mode = "each"))
  )
})

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
  A <- as_adjacency_matrix(g1, sparse = FALSE)
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
  A <- as_adjacency_matrix(g2, sparse = FALSE)
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
  A <- as_adjacency_matrix(g1, sparse = FALSE)
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
  A <- as_adjacency_matrix(g2, sparse = FALSE)
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
    M <- as_adjacency_matrix(G, sparse = FALSE)
    is.good(t(M) %*% M, as$authority, as$value)
  }

  for (i in 1:100) {
    G <- sample_gnm(10, sample(1:20, 1))
    hs <- hits_scores(G)
    M <- as_adjacency_matrix(G, sparse = FALSE)
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
  A <- as_adjacency_matrix(g1, sparse = FALSE)
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
  A <- as_adjacency_matrix(g2, sparse = FALSE)
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
  A <- as_adjacency_matrix(g1, sparse = FALSE)
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
  A <- as_adjacency_matrix(g2, sparse = FALSE)
  s1 <- eigen(A %*% t(A))$vectors[, 1]
  s2 <-  hits_scores(g2)$hub
  expect_equal(
    s2,
    c(1, 0.763521118433368, 0.546200349457203,
      0.28462967654657, 0.918985947228995)
  )
  expect_equal(mscale(s1), mscale(s2), ignore_attr = TRUE)

})

test_that("betweenness() works for kite graph", {
  kite <- graph_from_literal(
    Andre - Beverly:Carol:Diane:Fernando,
    Beverly - Andre:Diane:Ed:Garth,
    Carol - Andre:Diane:Fernando,
    Diane - Andre:Beverly:Carol:Ed:Fernando:Garth,
    Ed - Beverly:Diane:Garth,
    Fernando - Andre:Carol:Diane:Garth:Heather,
    Garth - Beverly:Diane:Ed:Fernando:Heather,
    Heather - Fernando:Garth:Ike,
    Ike - Heather:Jane,
    Jane - Ike
  )
  nf <- (vcount(kite) - 1) * (vcount(kite) - 2) / 2
  bet <- structure(betweenness(kite) / nf, names = V(kite)$name)
  bet <- round(sort(bet, decreasing = TRUE), 3)
  expect_equal(bet, structure(c(0.389, 0.231, 0.231, 0.222, 0.102, 0.023, 0.023, 0.000, 0.000, 0.000), names = c("Heather", "Fernando", "Garth", "Ike", "Diane", "Andre", "Beverly", "Carol", "Ed", "Jane")))

  bet2 <- structure(betweenness(kite, normalized = TRUE), names = V(kite)$name)
  bet2 <- round(sort(bet2, decreasing = TRUE), 3)
  expect_equal(bet2, bet)
})

test_that("weighted betweenness() works", {
  nontriv <- make_graph(c(
    0, 19, 0, 16, 0, 20, 1, 19, 2, 5, 3, 7, 3, 8,
    4, 15, 4, 11, 5, 8, 5, 19, 6, 7, 6, 10, 6, 8,
    6, 9, 7, 20, 9, 10, 9, 20, 10, 19,
    11, 12, 11, 20, 12, 15, 13, 15,
    14, 18, 14, 16, 14, 17, 15, 16, 17, 18
  ) + 1, dir = FALSE)

  E(nontriv)$weight <- c(
    0.5249, 1, 0.1934, 0.6274, 0.5249,
    0.0029, 0.3831, 0.05, 0.6274, 0.3831,
    0.5249, 0.0587, 0.0579, 0.0562, 0.0562,
    0.1934, 0.6274, 0.6274, 0.6274, 0.0418,
    0.6274, 0.3511, 0.3511, 0.1486, 1, 1,
    0.0711, 0.2409
  )

  nontrivRes <- c(
    20, 0, 0, 0, 0, 19, 80, 85, 32, 0, 10,
    75, 70, 0, 36, 81, 60, 0, 19, 19, 86
  )

  bet <- betweenness(nontriv)
  expect_equal(bet, nontrivRes)
})

test_that("betweenness()'s normalization works well", {
  g1 <- graph_from_literal(0 + -+1 + -+2)

  b11 <- betweenness(g1, normalized = TRUE, directed = FALSE)
  expect_equal(b11, c("0" = 0, "1" = 1, "2" = 0))

  b12 <- betweenness(g1, normalized = TRUE, directed = TRUE)
  expect_equal(b12, c("0" = 0, "1" = 1, "2" = 0))

  g2 <- graph_from_literal(0 - --1 - --2)

  b2 <- betweenness(g2, normalized = TRUE)
  expect_equal(b2, c("0" = 0, "1" = 1, "2" = 0))
})

test_that("betweenness() -- shortest paths are compared with tolerance when calculating betweenness", {
  # The test case below is designed in a way that the paths 3-6 and 3-4-6 have the
  # same total weight when compared with a tolerance, but they appear different
  # if the comparison is made without an epsilon tolerance due to numeric
  # inaccuracies.
  #
  # See https://github.com/igraph/rigraph/issues/314

  from <- c(1, 2, 3, 3, 3, 4, 6, 7, 2, 9, 5, 7, 9, 9, 5, 8)
  to <- c(4, 3, 6, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16)
  edges <- cbind(from, to)
  edges.dists <- c(
    1.9617537, 0.9060834, 2.2165446, 1.6251956,
    2.4473929, 0.5913490, 8.7093236, 2.8387330,
    6.1225042, 20.7217776, 6.8027218, 16.3147479,
    5.2605598, 6.6816853, 4.9482123, 1.8989790
  )

  g <- graph_from_data_frame(edges, directed = FALSE)
  result <- betweenness(g, weights = edges.dists)

  expect_equal(result[1:5], c("1" = 0, "2" = 44, "3" = 71, "4" = 36.5, "6" = 44))
})

test_that("edge_betweenness() works", {
  kite <- graph_from_literal(
    Andre - Beverly:Carol:Diane:Fernando,
    Beverly - Andre:Diane:Ed:Garth,
    Carol - Andre:Diane:Fernando,
    Diane - Andre:Beverly:Carol:Ed:Fernando:Garth,
    Ed - Beverly:Diane:Garth,
    Fernando - Andre:Carol:Diane:Garth:Heather,
    Garth - Beverly:Diane:Ed:Fernando:Heather,
    Heather - Fernando:Garth:Ike,
    Ike - Heather:Jane,
    Jane - Ike
  )

  bet <- betweenness(kite)
  ebet <- edge_betweenness(kite)

  bet2 <- sapply(1:vcount(kite), function(x) {
    ae <- E(kite)[.inc(x)]
    (sum(ebet[ae]) - vcount(kite) + 1) / 2
  })

  expect_equal(unname(bet), bet2)

  #### Weighted

  E(kite)$weight <- sample(1:10, ecount(kite), replace = TRUE)

  bet <- betweenness(kite)
  ebet <- edge_betweenness(kite)
  bet2 <- sapply(1:vcount(kite), function(x) {
    ae <- E(kite)[.inc(x)]
    (sum(ebet[ae]) - vcount(kite) + 1) / 2
  })

  expect_equal(unname(bet), bet2)
})
