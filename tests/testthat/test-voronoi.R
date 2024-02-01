test_that("voronoi works", {
  res <- voronoi_cells(make_ring(10), c(1, 6))
  expect_equal(res$membership, c(0, 0, 0, 1, 1, 1, 1, 1, 0, 0))
  expect_equal(res$distances, c(0, 1, 2, 2, 1, 0, 1, 2, 2, 1))
})

test_that("voronoi works with weights", {
  res <- voronoi_cells(make_ring(10), c(1, 6), weights = 1:10)
  expect_equal(res$membership, c(0, 0, 0, 0, 1, 1, 1, 1, 0, 0))
  expect_equal(res$distances, c(0, 1, 3, 6, 5, 0, 6, 13, 19, 10))
})
