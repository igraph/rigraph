test_that("ends works", {
  g <- sample_gnp(100, 3 / 100)
  edges <- unlist(lapply(seq_len(ecount(g)), ends, graph = g))
  g2 <- make_graph(edges, dir = FALSE, n = vcount(g))
  expect_isomorphic(g, g2)
})
