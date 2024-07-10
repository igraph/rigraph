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

  g2 <- as.directed(g, mode = "mutual")
  ac3 <- alpha_centrality(g, sparse = FALSE)
  expect_equal(ac1, ac3)
})
