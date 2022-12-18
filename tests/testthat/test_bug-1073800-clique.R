test_that("Largest cliques is correct", {
  unvs <- function(x) lapply(x, . %>% as.vector() %>% sort())
  adj <- matrix(1, nrow = 11, ncol = 11) - diag(11)
  g <- graph_from_adjacency_matrix(adj)
  lc <- suppressWarnings(largest_cliques(g))
  expect_that(unvs(lc), equals(list(1:11)))
})
