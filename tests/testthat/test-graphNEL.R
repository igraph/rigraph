test_that("graphNEL conversion works", {
  skip_if_not_installed("graph")

  suppressPackageStartupMessages(library(graph, warn.conflicts = FALSE))

  g <- sample_gnp(100, 5 / 100)
  N <- as_graphnel(g)
  g2 <- graph_from_graphnel(N)
  gi <- graph.isomorphic.vf2(g, g2)
  expect_true(gi$iso)
  expect_equal(gi$map12, 1:vcount(g))
  expect_equal(gi$map21, 1:vcount(g))

  ## Attributes

  V(g)$name <- as.character(vcount(g):1)
  E(g)$weight <- sample(1:10, ecount(g), replace = TRUE)
  g$name <- "Foobar"

  N <- as_graphnel(g)
  g2 <- graph_from_graphnel(N)
  expect_isomorphic(g, g2)
  expect_equal(V(g)$name, V(g2)$name)

  A <- as_adj(g, attr = "weight", sparse = FALSE)
  A2 <- as_adj(g2, attr = "weight", sparse = FALSE)
  expect_equal(A, A)
  expect_equal(g$name, g2$name)
})

test_that("graphNEL does not duplicate loop edges", {
  skip_if_not_installed("graph")

  mat <- matrix(c(1, 0.5, 0.5, 0), nrow = 2)
  dimnames(mat) <- list(c("A", "B"), c("A", "B"))

  igr <- graph_from_adjacency_matrix(mat, mode = "undirected", weighted = T)

  grNEL <- as_graphnel(igr)
  expect_equal(graph::edgeL(grNEL)$A$edges, c(1, 2))
})
