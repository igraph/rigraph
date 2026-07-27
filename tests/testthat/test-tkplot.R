# tkplot() needs tcltk and an interactive Tk window, which headless test runs
# cannot open.
# The keyword-only arguments of the tk_*() helpers are exercised through the
# plot-ID lookup, which fails for an unknown ID before any Tk interaction.

# ---- ellipsis migration: argument coverage ----------------------------

test_that("tk_close() covers `window.close` by name", {
  # `window.close = FALSE` skips Tk entirely; removing the unknown ID warns.
  expect_warning(tk_close(9999, window.close = FALSE), "not found")
})

test_that("tk_close() recovers a positional `window.close` with a deprecation", {
  rlang::local_options(lifecycle_verbosity = "warning")

  # The deprecation fires during argument recovery, before the ID lookup warns.
  lifecycle::expect_deprecated(
    expect_warning(tk_close(9999, FALSE), "not found")
  )
})

test_that("tk_fit() covers `width` and `height` by name", {
  expect_error(tk_fit(9999, width = 400, height = 300), "not found")
})

test_that("tk_fit() recovers positional `width`/`height` with a deprecation", {
  rlang::local_options(lifecycle_verbosity = "warning")

  # The deprecation fires during argument recovery, before the ID lookup fails.
  lifecycle::expect_deprecated(
    expect_error(tk_fit(9999, 400, 300), "not found")
  )
})

test_that("tk_coords() covers `norm` by name", {
  expect_error(tk_coords(9999, norm = TRUE), "not found")
})

test_that("tk_coords() recovers a positional `norm` with a deprecation", {
  rlang::local_options(lifecycle_verbosity = "warning")

  lifecycle::expect_deprecated(
    expect_error(tk_coords(9999, TRUE), "not found")
  )
})

test_that("tk_rotate() covers `degree` and `rad` by name", {
  expect_error(tk_rotate(9999, degree = 90), "not found")
  expect_error(tk_rotate(9999, rad = pi / 2), "not found")
})

test_that("tk_rotate() recovers a positional `degree` with a deprecation", {
  rlang::local_options(lifecycle_verbosity = "warning")

  lifecycle::expect_deprecated(
    expect_error(tk_rotate(9999, 90), "not found")
  )
})
