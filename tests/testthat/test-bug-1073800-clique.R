test_that("Largest cliques is correct", {
  adj <- matrix(1, nrow = 11, ncol = 11) - diag(11)
  g <- graph_from_adjacency_matrix(adj)
  lc <- suppressWarnings(largest_cliques(g))
  expect_equal(lapply(unvs(lc), sort), list(1:11))
})
