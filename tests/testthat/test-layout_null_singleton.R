test_that("layout algorithms work for null graphs", {
  g <- make_empty_graph()
  mat <- matrix(as.numeric(c()), ncol = 2)
  mat3 <- matrix(as.numeric(c()), ncol = 3)

  expect_warning(layout_as_tree(g), regexp = NA)
  expect_equal(mat, layout_as_tree(g))

  expect_warning(layout_as_star(g), regexp = NA)
  expect_equal(mat, layout_as_star(g))

  expect_warning(layout_in_circle(g), regexp = NA)
  expect_equal(mat, layout_in_circle(g))

  expect_warning(layout_nicely(g), regexp = NA)
  expect_equal(mat, layout_nicely(g))

  expect_warning(layout_on_grid(g), regexp = NA)
  expect_equal(mat, layout_on_grid(g))

  expect_warning(layout_on_sphere(g), regexp = NA)
  expect_equal(mat3, layout_on_sphere(g))

  expect_warning(layout_randomly(g), regexp = NA)
  expect_equal(mat, layout_randomly(g))

  expect_warning(layout_with_dh(g), regexp = NA)
  expect_equal(mat, layout_with_dh(g))

  expect_warning(layout_with_fr(g), regexp = NA)
  expect_equal(mat, layout_with_fr(g))

  expect_warning(layout_with_gem(g), regexp = NA)
  expect_equal(mat, layout_with_gem(g))

  expect_warning(layout_with_graphopt(g), regexp = NA)
  expect_equal(mat, layout_with_graphopt(g))

  expect_warning(layout_with_kk(g), regexp = NA)
  expect_equal(mat, layout_with_kk(g))

  expect_warning(layout_with_lgl(g), regexp = NA)
  expect_equal(mat, layout_with_lgl(g))

  expect_warning(layout_with_mds(g), regexp = NA)
  expect_equal(mat, layout_with_mds(g))

  expect_warning(layout_with_sugiyama(g), regexp = NA)
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

  expect_warning(layout_as_tree(g), regexp = NA)
  check_matrix(layout_as_tree(g))

  expect_warning(layout_as_star(g), regexp = NA)
  check_matrix(layout_as_star(g))

  expect_warning(layout_in_circle(g), regexp = NA)
  check_matrix(layout_in_circle(g))

  expect_warning(layout_nicely(g), regexp = NA)
  check_matrix(layout_nicely(g))

  expect_warning(layout_on_grid(g), regexp = NA)
  check_matrix(layout_on_grid(g))

  expect_warning(layout_on_sphere(g), regexp = NA)
  check_matrix(layout_on_sphere(g), ncol = 3)

  expect_warning(layout_randomly(g), regexp = NA)
  check_matrix(layout_randomly(g))

  expect_warning(layout_with_dh(g), regexp = NA)
  check_matrix(layout_with_dh(g))

  expect_warning(layout_with_fr(g), regexp = NA)
  check_matrix(layout_with_fr(g))

  expect_warning(layout_with_gem(g), regexp = NA)
  check_matrix(layout_with_gem(g))

  expect_warning(layout_with_graphopt(g), regexp = NA)
  check_matrix(layout_with_graphopt(g))

  expect_warning(layout_with_kk(g), regexp = NA)
  check_matrix(layout_with_kk(g))

  expect_warning(layout_with_lgl(g), regexp = NA)
  check_matrix(layout_with_lgl(g))

  expect_warning(layout_with_sugiyama(g), regexp = NA)
  check_matrix(layout_with_sugiyama(g)$layout)
  check_matrix(layout_with_sugiyama(g)$layout.dummy, nrow = 0)
})
