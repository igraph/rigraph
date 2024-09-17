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

test_that("layout algorithms work for null graphs", {
  g <- make_empty_graph()
  mat <- matrix(as.numeric(c()), ncol = 2)
  mat3 <- matrix(as.numeric(c()), ncol = 3)

  expect_silent(layout_as_tree(g))
  expect_equal(mat, layout_as_tree(g))

  expect_silent(layout_as_star(g))
  expect_equal(mat, layout_as_star(g))

  expect_silent(layout_in_circle(g))
  expect_equal(mat, layout_in_circle(g))

  expect_silent(layout_nicely(g))
  expect_equal(mat, layout_nicely(g))

  expect_silent(layout_on_grid(g))
  expect_equal(mat, layout_on_grid(g))

  expect_silent(layout_on_sphere(g))
  expect_equal(mat3, layout_on_sphere(g))

  expect_silent(layout_randomly(g))
  expect_equal(mat, layout_randomly(g))

  expect_silent(layout_with_dh(g))
  expect_equal(mat, layout_with_dh(g))

  expect_silent(layout_with_fr(g))
  expect_equal(mat, layout_with_fr(g))

  expect_silent(layout_with_gem(g))
  expect_equal(mat, layout_with_gem(g))

  expect_silent(layout_with_graphopt(g))
  expect_equal(mat, layout_with_graphopt(g))

  expect_silent(layout_with_kk(g))
  expect_equal(mat, layout_with_kk(g))

  expect_silent(layout_with_lgl(g))
  expect_equal(mat, layout_with_lgl(g))

  expect_silent(layout_with_mds(g))
  expect_equal(mat, layout_with_mds(g))

  expect_silent(layout_with_sugiyama(g))
  expect_equal(mat, layout_with_sugiyama(g)$layout)
  expect_equal(mat, layout_with_sugiyama(g)$layout.dummy)
})

test_that("layout algorithms work for singleton graphs", {
  g <- make_empty_graph(1)

  check_matrix <- function(mat, nrow = 1, ncol = 2) {
    expect_equal(dim(mat), c(nrow, ncol))
    if (nrow > 0) {
      expect_true(all(is.finite(mat)))
    }
  }

  expect_silent(layout_as_tree(g))
  check_matrix(layout_as_tree(g))

  expect_silent(layout_as_star(g))
  check_matrix(layout_as_star(g))

  expect_silent(layout_in_circle(g))
  check_matrix(layout_in_circle(g))

  expect_silent(layout_nicely(g))
  check_matrix(layout_nicely(g))

  expect_silent(layout_on_grid(g))
  check_matrix(layout_on_grid(g))

  expect_silent(layout_on_sphere(g))
  check_matrix(layout_on_sphere(g), ncol = 3)

  expect_silent(layout_randomly(g))
  check_matrix(layout_randomly(g))

  expect_silent(layout_with_dh(g))
  check_matrix(layout_with_dh(g))

  expect_silent(layout_with_fr(g))
  check_matrix(layout_with_fr(g))

  expect_silent(layout_with_gem(g))
  check_matrix(layout_with_gem(g))

  expect_silent(layout_with_graphopt(g))
  check_matrix(layout_with_graphopt(g))

  expect_silent(layout_with_kk(g))
  check_matrix(layout_with_kk(g))

  expect_silent(layout_with_lgl(g))
  check_matrix(layout_with_lgl(g))

  expect_silent(layout_with_sugiyama(g))
  check_matrix(layout_with_sugiyama(g)$layout)
  check_matrix(layout_with_sugiyama(g)$layout.dummy, nrow = 0)
})
