test_that("layout_with_fr() works", {
  skip_on_os("solaris")

  withr::with_seed(42, {
    g <- make_ring(10)
  l <- layout_with_fr(g, niter = 50, start.temp = sqrt(10) / 10)
  })
  expect_equal(sum(l), 4.57228, tolerance = 0.1)

  withr::with_seed(42, {
    g <- make_star(30)
  l <- layout_with_fr(g, niter = 500, dim = 3, start.temp = 20)
  })
  expect_equal(sum(l), -170.9312, tolerance = 0.1)
})

test_that("layout_nicely() works with negative weights", {
  g <- make_graph("petersen")
  E(g)$weight <- -5:9
  expect_warning(layout_nicely(g), regexp = "ignoring all weights")
})

test_that("layout_nicely() does not recurse into itself", {
  g <- make_graph("petersen")
  g$layout <- layout_nicely
  expect_silent(layout_nicely(g)) # should not recurse infinitely
})
