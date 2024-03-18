test_that("radius() works", {
  withr::local_seed(42)
  g <- make_tree(10, 2)

  expect_equal(radius(g), 3)
  expect_equal(radius(g, mode = "in"), 0)
  expect_equal(radius(g, mode = "out"), 0)
})

test_that("radius() works -- weights", {
  g <- make_ring(10)
  expect_equal(radius(g), 5)

  E(g)$weight <- seq_len(ecount(g))
  expect_equal(radius(g), 24)
})

test_that("radius() works -- lifecycle", {
  withr::local_seed(42)
  g <- make_tree(10, 2)

  expect_snapshot(radius(g, NULL, "out"))

})
