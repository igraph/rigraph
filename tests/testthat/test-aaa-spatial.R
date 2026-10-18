# FIXME: ASAN tests for this file are crashing on CRAN, can we replicate?
skip_on_cran()

# 304. convex_hull_2d_impl

test_that("convex_hull_2d_impl basic", {
  igraph_local_seed(20250909)
  expect_snapshot(convex_hull_2d_impl(
    data = matrix(1:6, ncol = 2)
  ))

  # Structured tests
  result <- convex_hull_2d_impl(
    data = matrix(1:6, ncol = 2)
  )
  expect_type(result, "list")
})

test_that("convex_hull_2d_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(convex_hull_2d_impl(
    data = "a"
  ))
})
