test_that("add_edges keeps edge id order", {
  g <- make_empty_graph(10)
  edges <- c(1, 2, 2, 3, 3, 4, 1, 6, 1, 7, 9, 10)
  g2 <- add_edges(g, edges)

  expect_equal(ecount(g2), length(edges) / 2)
  expect_equal(get.edge.ids(g2, edges), seq_len(length(edges) / 2))
})

test_that("add_edges adds attributes", {
  g <- make_empty_graph(10)
  edges <- c(1, 5, 2, 6, 3, 10, 4, 5)
  weights <- c(1, 2, 1, -1)
  g3 <- add_edges(g, edges, attr = list(weight = weights))

  expect_equal(ecount(g3), (length(edges) / 2))
  expect_equal(get.edge.ids(g3, edges), seq_len(length(edges) / 2))
  expect_equal(E(g3)$weight, weights)
})

test_that("add_edges unknown attributes to NA", {
  g <- make_empty_graph(10)
  edges <- c(1, 2, 2, 3, 3, 4, 1, 6, 1, 7, 9, 10)
  g2 <- add_edges(g, edges)
  g4 <- add_edges(g2, c(1, 4, 4, 6, 7, 1), attr = list(weight = c(-1, 1, -2.5)))

  expect_true(all(is.na(E(g4)$weight[seq_len(length(edges) / 2)])))
})

test_that("add_edges appends attributes properly", {
  g <- make_empty_graph(10)
  edges1 <- c(1, 5, 2, 6, 3, 10, 4, 5)
  weights1 <- c(1, 2, 1, -1)
  g2 <- add_edges(g, edges1, attr = list(weight = weights1))

  edges2 <- c(10, 9, 10, 10, 1, 1)
  weights2 <- c(100, 100, 100)
  g3 <- add_edges(g2, edges2, attr = list(weight = weights2))
  expect_equal(E(g3)$weight, c(weights1, weights2))
})

test_that("add_edges signals error for zero vertex ids", {
  g <- make_full_graph(5) %du% make_full_graph(5) %du% make_full_graph(5)
  expect_error(add_edges(g, c(0, 5, 0, 10, 5, 10)), "Invalid vertex")
})
