test_that("distances works", {
  g <- make_graph(
    c(
      1, 5, 1, 7, 1, 8, 1, 10, 2, 6,
      2, 7, 2, 8, 2, 10, 3, 4, 3, 5,
      3, 9, 5, 6, 5, 7, 5, 10, 6, 8,
      7, 8, 7, 9, 8, 9, 8, 10, 9, 10
    ),
    directed = FALSE
  )

  mu <- distances(g, algorithm = "unweighted")

  # unit weights
  E(g)$weight <- rep(1, ecount(g))

  ma <- distances(g) # automatic
  md <- distances(g, algorithm = "dijkstra")
  mbf <- distances(g, algorithm = "bellman-ford")
  mj <- distances(g, algorithm = "johnson")
  mfw <- distances(g, algorithm = "floyd-warshall")

  expect_equal(mu, ma)
  expect_equal(mu, md)
  expect_equal(mu, mbf)
  expect_equal(mu, mj)
  expect_equal(mu, mfw)

  E(g)$weight <- 0.25 * (1:ecount(g))

  ma <- distances(g) # automatic
  md <- distances(g, algorithm = "dijkstra")
  mbf <- distances(g, algorithm = "bellman-ford")
  mj <- distances(g, algorithm = "johnson")
  mfw <- distances(g, algorithm = "floyd-warshall")

  expect_equal(ma, md)
  expect_equal(ma, mbf)
  expect_equal(ma, mj)
  expect_equal(ma, mfw)
})
