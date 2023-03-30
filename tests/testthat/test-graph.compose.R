test_that("compose works", {
  g1 <- sample_gnp(50, 3 / 50, directed = TRUE)
  gi <- make_graph(rep(1:vcount(g1), each = 2), directed = TRUE)

  g2 <- compose(g1, gi)
  g3 <- compose(gi, g1)

  expect_true(graph.isomorphic(g1, g2))
  expect_true(graph.isomorphic(g1, g3))
})
