test_that("as_edgelist works", {
  g <- sample_gnp(100, 3 / 100)
  e <- as_edgelist(g)
  g2 <- make_graph(t(e), n = vcount(g), dir = FALSE)
  expect_true(graph.isomorphic(g, g2))
})
