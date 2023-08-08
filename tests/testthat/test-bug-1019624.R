test_that("weighted graph_from_adjacency_matrix works on integer matrices", {
  skip("https://github.com/igraph/rigraph/issues/878")
  data <- matrix(c(0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 2, 0, 1, 0, 0), 4)
  g <- graph_from_adjacency_matrix(data, weighted = TRUE)
  expect_that(as.matrix(g[]), is_equivalent_to(data))
})
