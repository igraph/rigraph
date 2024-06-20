test_that("graph.atlas works", {
  g124 <- graph_from_atlas(124)
  expect_isomorphic(g124, make_graph(c(1, 2, 2, 3, 3, 4, 4, 5, 1, 5, 1, 3, 2, 6),
    directed = FALSE
  ))
  g234 <- graph_from_atlas(234)
  expect_isomorphic(g234, make_graph(c(1, 6, 2, 6, 3, 6, 4, 6, 5, 6),
    n = 7,
    directed = FALSE
  ))
})
