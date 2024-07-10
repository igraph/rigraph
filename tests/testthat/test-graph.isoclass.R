test_that("isomorphism_class works", {
  g1 <- graph_from_isomorphism_class(3, 10)
  g2 <- graph_from_isomorphism_class(3, 11)
  expect_equal(isomorphism_class(g1), 10)
  expect_equal(isomorphism_class(g2), 11)

  g1 <- add_vertices(g1, 3)
  expect_equal(graph.isoclass.subgraph(g1, 1:3), 10)
  expect_equal(graph.isoclass.subgraph(g1 %du% g2, 1:3), 10)
  expect_equal(graph.isoclass.subgraph(g1 %du% g2, 7:9), 11)
})
