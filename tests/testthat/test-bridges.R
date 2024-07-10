test_that("bridges works", {
  g <- make_graph("krackhardt_kite")
  expect_equal(sort(as.vector(bridges(g))), (ecount(g) - 1):(ecount(g)))
})
