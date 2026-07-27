# ---- ellipsis migration: argument coverage ----------------------------

test_that("curve_multiple() spreads curvatures up to `start`", {
  # Three parallel edges between the same vertex pair, plus a single edge.
  g <- make_graph(c(1, 2, 1, 2, 1, 2, 3, 4))

  # The bundle is spaced equally in [-start, start], single edges stay straight.
  expect_equal(curve_multiple(g, start = 1), c(-1, 0, 1, 0))
  expect_equal(curve_multiple(g), c(-0.5, 0, 0.5, 0))
})

test_that("curve_multiple() recovers a positional `start` with a deprecation", {
  rlang::local_options(lifecycle_verbosity = "warning")
  g <- make_graph(c(1, 2, 1, 2, 1, 2, 3, 4))

  lifecycle::expect_deprecated(
    res <- curve_multiple(g, 1)
  )
  expect_identical(res, curve_multiple(g, start = 1))
})
