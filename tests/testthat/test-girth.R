test_that("girth works", {
  ## No circle in a tree
  g <- make_tree(1000, 3)
  gi <- girth(g)
  expect_equal(gi$girth, Inf)
  expect_equal(as.vector(gi$circle), numeric())

  ## The worst case running time is for a ring
  g <- make_ring(100)
  gi <- girth(g)
  expect_equal(gi$girth, 100)
  expect_equal(sort(diff(as.vector(gi$circle))), c(-99, rep(1, 98)))
})
