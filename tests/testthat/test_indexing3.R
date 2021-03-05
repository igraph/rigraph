
context("Indexing")

test_that("Indexing multi-graphs as adjacency list", {

  g <- make_graph(~ A -+ B:C, A -+ B:C:D, simplify = FALSE)
  e <- g[['A', 'B', edges = TRUE]]

  expect_equal(sort(e[[1]]), E(g)[1,3])
})
