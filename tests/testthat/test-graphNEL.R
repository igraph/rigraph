test_that("graphNEL conversion works", {
  skip_if_not_installed("graph")

  suppressPackageStartupMessages(library(graph, warn.conflicts = FALSE))

  g <- sample_gnp(100, 5 / 100)
  N <- as_graphnel(g)
  g2 <- graph_from_graphnel(N)
  gi <- graph.isomorphic.vf2(g, g2)
  expect_true(gi$iso)
  expect_that(gi$map12, equals(1:vcount(g)))
  expect_that(gi$map21, equals(1:vcount(g)))

  ## Attributes

  V(g)$name <- as.character(vcount(g):1)
  E(g)$weight <- sample(1:10, ecount(g), replace = TRUE)
  g$name <- "Foobar"

  N <- as_graphnel(g)
  g2 <- graph_from_graphnel(N)
  expect_true(graph.isomorphic(g, g2))
  expect_that(V(g)$name, equals(V(g2)$name))

  A <- as_adjacency_matrix(g, weights = get_weights(g), sparse = FALSE)
  A2 <- as_adjacency_matrix(g2, weights = get_weights(g2), sparse = FALSE)
  expect_that(A, equals(A))
  expect_that(g$name, equals(g2$name))
})

test_that("graphNEL does not duplicate loop edges", {
  skip_if_not_installed("graph")

  mat <- matrix(c(1, 0.5, 0.5, 0), nrow = 2)
  dimnames(mat) <- list(c("A", "B"), c("A", "B"))

  igr <- graph_from_adjacency_matrix(mat, mode = "undirected", weighted = T)

  grNEL <- as_graphnel(igr)
  expect_that(graph::edgeL(grNEL)$A$edges, equals(c(1, 2)))
})
