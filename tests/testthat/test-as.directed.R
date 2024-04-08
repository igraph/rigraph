test_that("as.directed works", {
  g <- sample_gnp(100, 2 / 100)
  g2 <- as.directed(g, mode = "mutual")
  g3 <- as.directed(g, mode = "arbitrary")
  g4 <- as.directed(g, mode = "random")
  g5 <- as.directed(g, mode = "acyclic")

  expect_equal(degree(g), degree(g2) / 2)
  expect_equal(degree(g), degree(g3))
  expect_equal(degree(g), degree(g4))
  expect_equal(degree(g), degree(g5))

  expect_true(graph.isomorphic(g, as.undirected(g2)))
  expect_true(graph.isomorphic(g, as.undirected(g3)))
  expect_true(graph.isomorphic(g, as.undirected(g4)))
  expect_true(graph.isomorphic(g, as.undirected(g5)))
})

test_that("as.directed keeps attributes", {
  g <- graph_from_literal(A - B - C, D - A, E)
  g$name <- "Small graph"
  g2 <- as.directed(g, mode = "mutual")
  g3 <- as.directed(g, mode = "arbitrary")
  expect_equal(g2$name, g$name)
  expect_equal(V(g2)$name, V(g)$name)
  expect_equal(g3$name, g$name)
  expect_equal(V(g3)$name, V(g)$name)

  E(g)$weight <- seq_len(ecount(g))
  g4 <- as.directed(g, "mutual")
  df4 <- as_data_frame(g4)
  g5 <- as.directed(g, "arbitrary")
  df5 <- as_data_frame(g5)
  expect_equal(df4[order(df4[, 1], df4[, 2]), ]$weight, c(1, 2, 1, 3, 3, 2))
  expect_equal(df5[order(df5[, 1], df5[, 2]), ]$weight, 1:3)
})
