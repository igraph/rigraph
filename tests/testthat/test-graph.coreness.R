test_that("coreness works", {
  g <- make_ring(10)
  g <- add_edges(g, c(1, 2, 2, 3, 1, 3))
  gc <- coreness(g)
  expect_equal(gc, c(3, 3, 3, 2, 2, 2, 2, 2, 2, 2))
})
