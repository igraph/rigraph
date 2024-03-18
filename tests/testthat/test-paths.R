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

test_that("eccentricity() works", {
  withr::local_seed(42)
  g <- make_tree(10, 2)

  expect_equal(eccentricity(g), c(3, 3, 4, 4, 4, 5, 5, 5, 5, 5))
  expect_equal(eccentricity(g, mode = "in"), c(0, 1, 1, 2, 2, 2, 2, 3, 3, 3))
  expect_equal(eccentricity(g, mode = "out"), c(3, 2, 1, 1, 1, 0, 0, 0, 0, 0))
})

test_that("eccentricity() works -- weights", {
  g <- make_ring(10)
  expect_equal(eccentricity(g), rep(5, 10))

  E(g)$weight <- seq_len(ecount(g))
  expect_equal(eccentricity(g), c(27, 27, 25, 25, 26, 25, 24, 27, 26, 25))
})

test_that("eccentricity() works -- lifecycle", {
  withr::local_seed(42)
  g <- make_tree(10, 2)

  expect_snapshot(eccentricity(g, vids = V(g), NULL, "out"))

})

