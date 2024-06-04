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
  expect_that(bet, equals(structure(
    c(
      0.389, 0.231, 0.231, 0.222, 0.102,
      0.023, 0.023, 0.000, 0.000, 0.000
    ),
    names = c(
      "Heather", "Fernando",
      "Garth", "Ike", "Diane", "Andre",
      "Beverly", "Carol", "Ed", "Jane"
    )
  )))

  bet2 <- structure(betweenness(kite, normalized = TRUE), names = V(kite)$name)
  bet2 <- round(sort(bet2, decreasing = TRUE), 3)
  expect_that(bet2, equals(bet))
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
  expect_that(bet, equals(nontrivRes))
})

test_that("normalization works well", {
  g1 <- graph_from_literal(0 +-+ 1 +-+ 2)

  b11 <- betweenness(g1, normalized = TRUE, directed = FALSE)
  expect_that(b11, equals(c("0" = 0, "1" = 1, "2" = 0)))

  b12 <- betweenness(g1, normalized = TRUE, directed = TRUE)
  expect_that(b12, equals(c("0" = 0, "1" = 1, "2" = 0)))

  g2 <- graph_from_literal(0 --- 1 --- 2)

  b2 <- betweenness(g2, normalized = TRUE)
  expect_that(b2, equals(c("0" = 0, "1" = 1, "2" = 0)))
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

  expect_that(result[c(1:4, 6)], equals(c(0, 44, 71, 36.5, 44)))
})
