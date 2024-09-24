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

test_that("eigen_centrality works", {
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
  evc <- round(eigen_centrality(kite)$vector, 3)
  expect_equal(evc, structure(c(0.732, 0.732, 0.594, 1, 0.827, 0.594, 0.827, 0.407, 0.1, 0.023), .Names = c("Andre", "Beverly", "Carol", "Diane", "Fernando", "Ed", "Garth", "Heather", "Ike", "Jane")))


  ## Eigenvector-centrality, small stress-test

  is.principal <- function(M, lambda, eps = 1e-12) {
    abs(eigen(M)$values[1] - lambda) < eps
  }

  is.ev <- function(M, v, lambda, eps = 1e-12) {
    max(abs(M %*% v - lambda * v)) < eps
  }

  is.good <- function(M, v, lambda, eps = 1e-12) {
    is.principal(M, lambda, eps) && is.ev(M, v, lambda, eps)
  }

  for (i in 1:1000) {
    G <- sample_gnm(10, sample(1:20, 1))
    ev <- eigen_centrality(G)
    expect_true(is.good(as_adjacency_matrix(G, sparse = FALSE), ev$vector, ev$value))
  }
})

test_that("betweenness works for kite graph", {
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

test_that("weighted betweenness works", {
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

test_that("normalization works well", {
  g1 <- graph_from_literal(0 + -+1 + -+2)

  b11 <- betweenness(g1, normalized = TRUE, directed = FALSE)
  expect_equal(b11, c("0" = 0, "1" = 1, "2" = 0))

  b12 <- betweenness(g1, normalized = TRUE, directed = TRUE)
  expect_equal(b12, c("0" = 0, "1" = 1, "2" = 0))

  g2 <- graph_from_literal(0 - --1 - --2)

  b2 <- betweenness(g2, normalized = TRUE)
  expect_equal(b2, c("0" = 0, "1" = 1, "2" = 0))
})

test_that("shortest paths are compared with tolerance when calculating betweenness", {
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

test_that("closeness works", {
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

  clo <- closeness(kite) * (vcount(kite) - 1)
  expect_equal(
    round(sort(clo, decreasing = TRUE), 3),
    c(Fernando = 0.643, Garth = 0.643, Diane = 0.600, Heather = 0.600, Andre = 0.529, Beverly = 0.529, Carol = 0.500, Ed = 0.500, Ike = 0.429, Jane = 0.310)
  )

  clo2 <- closeness(kite, normalized = TRUE)
  expect_equal(clo, clo2)
})

## TODO: weighted closeness

test_that("closeness centralization works", {
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

  c1 <- closeness(kite, normalized = TRUE)
  c2 <- centr_clo(kite)
  expect_equal(unname(c1), c2$res)
  expect_equal(c2$centralization, 0.270374931581828)
  expect_equal(c2$theoretical_max, 4.23529411764706)
})
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

test_that("Power centrality works", {
  ## Generate some test data from Bonacich, 1987:
  fig1 <- graph_from_literal(A - +B - +C:D)
  fig1.bp <- lapply(seq(0, 0.8, by = 0.2), function(x) {
    round(power_centrality(fig1, exponent = x), 2)
  })
  expect_equal(fig1.bp, list(c(A = 0.89, B = 1.79, C = 0, D = 0), c(A = 1.15, B = 1.64, C = 0, D = 0), c(A = 1.34, B = 1.49, C = 0, D = 0), c(A = 1.48, B = 1.35, C = 0, D = 0), c(A = 1.59, B = 1.22, C = 0, D = 0)))

  g.c <- make_graph(c(1, 2, 1, 3, 2, 4, 3, 5), dir = FALSE)
  bp.c <- lapply(seq(-.5, .5, by = 0.1), function(x) {
    round(power_centrality(g.c, exponent = x), 2)[c(1, 2, 4)]
  })

  expect_equal(bp.c, list(c(0.00, 1.58, 0.00), c(0.73, 1.45, 0.36), c(0.97, 1.34, 0.49), c(1.09, 1.27, 0.54), c(1.15, 1.23, 0.58), c(1.20, 1.20, 0.60), c(1.22, 1.17, 0.61), c(1.25, 1.16, 0.62), c(1.26, 1.14, 0.63), c(1.27, 1.13, 0.64), c(1.28, 1.12, 0.64)))

  g.d <- make_graph(c(1, 2, 1, 3, 1, 4, 2, 5, 3, 6, 4, 7), dir = FALSE)
  bp.d <- lapply(seq(-.4, .4, by = 0.1), function(x) {
    round(power_centrality(g.d, exponent = x), 2)[c(1, 2, 5)]
  })
  expect_equal(bp.d, list(c(1.62, 1.08, 0.54), c(1.62, 1.08, 0.54), c(1.62, 1.08, 0.54), c(1.62, 1.08, 0.54), c(1.62, 1.08, 0.54), c(1.62, 1.08, 0.54), c(1.62, 1.08, 0.54), c(1.62, 1.08, 0.54), c(1.62, 1.08, 0.54)))

  g.e <- make_graph(c(1, 2, 1, 3, 1, 4, 2, 5, 2, 6, 3, 7, 3, 8, 4, 9, 4, 10), dir = FALSE)
  bp.e <- lapply(seq(-.4, .4, by = 0.1), function(x) {
    round(power_centrality(g.e, exponent = x), 2)[c(1, 2, 5)]
  })
  expect_equal(bp.e, list(c(-1.00, 1.67, -0.33), c(0.36, 1.81, 0.12), c(1.00, 1.67, 0.33), c(1.30, 1.55, 0.43), c(1.46, 1.46, 0.49), c(1.57, 1.40, 0.52), c(1.63, 1.36, 0.54), c(1.68, 1.33, 0.56), c(1.72, 1.30, 0.57)))

  g.f <- make_graph(c(1, 2, 1, 3, 1, 4, 2, 5, 2, 6, 2, 7, 3, 8, 3, 9, 3, 10, 4, 11, 4, 12, 4, 13),
    dir = FALSE
  )
  bp.f <- lapply(seq(-.4, .4, by = 0.1), function(x) {
    round(power_centrality(g.f, exponent = x), 2)[c(1, 2, 5)]
  })
  expect_equal(
    bp.f,
    list(c(-1.72, 1.53, -0.57), c(-0.55, 2.03, -0.18), c(0.44, 2.05, 0.15), c(1.01, 1.91, 0.34), c(1.33, 1.78, 0.44), c(1.52, 1.67, 0.51), c(1.65, 1.59, 0.55), c(1.74, 1.53, 0.58), c(1.80, 1.48, 0.60))
  )
})

test_that("dense alpha_centrality works", {
  g.1 <- make_graph(c(1, 3, 2, 3, 3, 4, 4, 5))
  ac1 <- alpha_centrality(g.1, sparse = FALSE)
  expect_equal(ac1, c(1, 1, 3, 4, 5))

  g.2 <- make_graph(c(2, 1, 3, 1, 4, 1, 5, 1))
  ac2 <- alpha_centrality(g.2, sparse = FALSE)
  expect_equal(ac2, c(5, 1, 1, 1, 1))

  g.3 <- make_graph(c(1, 2, 2, 3, 3, 4, 4, 1, 5, 1))
  ac3 <- alpha_centrality(g.3, alpha = 0.5, sparse = FALSE)
  expect_equal(ac3, c(76, 68, 64, 62, 30) / 30)
})

test_that("sparse alpha_centrality works", {
  g.1 <- make_graph(c(1, 3, 2, 3, 3, 4, 4, 5))
  ac1 <- alpha_centrality(g.1, sparse = TRUE)
  expect_equal(ac1, c(1, 1, 3, 4, 5))

  g.2 <- make_graph(c(2, 1, 3, 1, 4, 1, 5, 1))
  ac2 <- alpha_centrality(g.2, sparse = TRUE)
  expect_equal(ac2, c(5, 1, 1, 1, 1))

  g.3 <- make_graph(c(1, 2, 2, 3, 3, 4, 4, 1, 5, 1))
  ac3 <- alpha_centrality(g.3, alpha = 0.5, sparse = TRUE)
  expect_equal(ac3, c(76, 68, 64, 62, 30) / 30)
})

##############################
## weighted version

test_that("weighted dense alpha_centrality works", {
  star <- make_star(10)
  E(star)$weight <- sample(ecount(star))

  ac1 <- alpha_centrality(star, sparse = FALSE)
  expect_equal(ac1, c(46, 1, 1, 1, 1, 1, 1, 1, 1, 1))

  ac2 <- alpha_centrality(star, weights = "weight", sparse = FALSE)
  expect_equal(ac2, c(46, 1, 1, 1, 1, 1, 1, 1, 1, 1))

  ac3 <- alpha_centrality(star, weights = NA, sparse = FALSE)
  expect_equal(ac3, c(vcount(star), 1, 1, 1, 1, 1, 1, 1, 1, 1))
})

test_that("weighted sparse alpha_centrality works", {
  star <- make_star(10)
  E(star)$weight <- sample(ecount(star))

  ac1 <- alpha_centrality(star, sparse = TRUE)
  expect_equal(ac1, c(46, 1, 1, 1, 1, 1, 1, 1, 1, 1))

  ac2 <- alpha_centrality(star, weights = "weight", sparse = TRUE)
  expect_equal(ac2, c(46, 1, 1, 1, 1, 1, 1, 1, 1, 1))

  ac3 <- alpha_centrality(star, weights = NA, sparse = TRUE)
  expect_equal(ac3, c(vcount(star), 1, 1, 1, 1, 1, 1, 1, 1, 1))
})

test_that("undirected, alpha centrality works, #653", {
  g <- make_ring(10)

  ac1 <- alpha_centrality(g, sparse = TRUE)
  ac2 <- alpha_centrality(g, sparse = FALSE)
  expect_equal(ac1, ac2)

  g2 <- as_directed(g, mode = "mutual")
  ac3 <- alpha_centrality(g, sparse = FALSE)
  expect_equal(ac1, ac3)
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
