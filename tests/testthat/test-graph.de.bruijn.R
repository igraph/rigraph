test_that("make_de_bruijn_graph works", {
  g <- make_de_bruijn_graph(2, 1)
  g2 <- make_de_bruijn_graph(2, 2)
  g3 <- make_line_graph(g)

  expect_isomorphic(g3, make_graph(c(
    1, 1, 3, 1, 1, 2, 3, 2, 2, 3,
    4, 3, 2, 4, 4, 4
  )))
  expect_isomorphic(g2, g3)
})
