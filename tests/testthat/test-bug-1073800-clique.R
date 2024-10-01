test_that("largest_cliques() works", {
  adj <- matrix(1, nrow = 11, ncol = 11) - diag(11)
  g <- graph_from_adjacency_matrix(adj)
  expect_warning(
    lc <- largest_cliques(g),
    "Edge directions are ignored for maximal clique calculation"
  )
  expect_equal(lapply(unvs(lc), sort), list(1:11))
})
