test_that("make_kautz_graph works", {
  g <- make_kautz_graph(2, 3)
  expect_equal(g$name, "Kautz graph 2-3")
  expect_equal(g$m, 2)
  expect_equal(g$n, 3)

  el <- as_edgelist(g)
  el <- el[order(el[, 1], el[, 2]), ]
  expect_equal(el, structure(c(1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, 9, 9, 10, 10, 11, 11, 12, 12, 13, 13, 14, 14, 15, 15, 16, 16, 17, 17, 18, 18, 19, 19, 20, 20, 21, 21, 22, 22, 23, 23, 24, 24, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 1, 2, 3, 4, 5, 6, 7, 8, 17, 18, 19, 20, 21, 22, 23, 24, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16), .Dim = c(48L, 2L)))
})
