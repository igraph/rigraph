test_that("as_adj works", {
  g <- sample_gnp(50, 1 / 50)
  A <- as_adj(g, sparse = FALSE)
  g2 <- graph_from_adjacency_matrix(A, mode = "undirected")
  expect_isomorphic(g, g2)

  ###

  A <- as_adj(g, sparse = TRUE)
  g2 <- graph_from_adjacency_matrix(A, mode = "undirected")
  expect_isomorphic(g, g2)

  ###

  g <- sample_gnp(50, 2 / 50, directed = TRUE)
  A <- as_adj(g, sparse = FALSE)
  g2 <- graph_from_adjacency_matrix(A)
  expect_isomorphic(g, g2)

  ###

  A <- as_adj(g, sparse = TRUE)
  g2 <- graph_from_adjacency_matrix(A)
  expect_isomorphic(g, g2)
})
