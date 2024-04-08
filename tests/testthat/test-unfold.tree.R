test_that("unfold_tree works", {
  g <- make_tree(7, 2)
  g <- add_edges(g, c(2, 7, 1, 4))
  g2 <- unfold_tree(g, roots = 1)
  expect_true(graph.isomorphic(g2$tree, make_graph(c(
    1, 2, 1, 3, 2, 8, 2, 5, 3, 6,
    3, 9, 2, 7, 1, 4
  ))))
  expect_equal(g2$vertex_index, c(1, 2, 3, 4, 5, 6, 7, 4, 7))
})
