test_that("as_directed works", {
  g <- sample_gnp(100, 2 / 100)
  g2 <- as_directed(g, mode = "mutual")
  g3 <- as_directed(g, mode = "arbitrary")
  g4 <- as_directed(g, mode = "random")
  g5 <- as_directed(g, mode = "acyclic")

  expect_equal(degree(g), degree(g2) / 2)
  expect_equal(degree(g), degree(g3))
  expect_equal(degree(g), degree(g4))
  expect_equal(degree(g), degree(g5))

  expect_isomorphic(g, as_undirected(g2))
  expect_isomorphic(g, as_undirected(g3))
  expect_isomorphic(g, as_undirected(g4))
  expect_isomorphic(g, as_undirected(g5))
})

test_that("as_directed keeps attributes", {
  g <- graph_from_literal(A - B - C, D - A, E)
  g$name <- "Small graph"
  g2 <- as_directed(g, mode = "mutual")
  g3 <- as_directed(g, mode = "arbitrary")
  expect_equal(g2$name, g$name)
  expect_equal(V(g2)$name, V(g)$name)
  expect_equal(g3$name, g$name)
  expect_equal(V(g3)$name, V(g)$name)

  E(g)$weight <- seq_len(ecount(g))
  g4 <- as_directed(g, "mutual")
  df4 <- as_data_frame(g4)
  g5 <- as_directed(g, "arbitrary")
  df5 <- as_data_frame(g5)
  expect_equal(df4[order(df4[, 1], df4[, 2]), ]$weight, c(1, 2, 1, 3, 3, 2))
  expect_equal(df5[order(df5[, 1], df5[, 2]), ]$weight, 1:3)
})

test_that("as.directed() deprecation", {
  local_igraph_options(print.id = FALSE)

  g <- sample_gnp(100, 2 / 100)
  expect_snapshot(is_directed(as.directed(g, mode = "mutual")))
})

test_that("as.undirected() deprecation", {
  local_igraph_options(print.id = FALSE)

  g <- sample_gnp(100, 2 / 100)
  expect_snapshot(is_directed(as.undirected(g, mode = "collapse")))
})

test_that("as_undirected() keeps attributes", {
  g <- graph_from_literal(A + -+B, A - -+C, C + -+D)
  g$name <- "Tiny graph"
  E(g)$weight <- seq_len(ecount(g))

  g2 <- as_undirected(g, mode = "collapse")
  df2 <- as_data_frame(g2)
  g3 <- as_undirected(g, mode = "each")
  df3 <- as_data_frame(g3)
  g4 <- as_undirected(g, mode = "mutual")
  df4 <- as_data_frame(g4)

  expect_equal(g2$name, g$name)
  expect_equal(g3$name, g$name)
  expect_equal(g4$name, g$name)

  expect_equal(df2[order(df2[, 1], df2[, 2]), ]$weight, c(4, 2, 9))
  expect_equal(df3[order(df3[, 1], df3[, 2]), ]$weight, c(1, 3, 2, 4, 5))
  expect_equal(df4[order(df4[, 1], df4[, 2]), ]$weight, c(4, 9))
})
