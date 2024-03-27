test_that("bridges works", {
  g <- make_graph("krackhardt_kite")
  expect_that(sort(as.vector(bridges(g))), equals((ecount(g) - 1):(ecount(g))))
})
