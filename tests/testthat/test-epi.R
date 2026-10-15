# ---- ellipsis migration: argument coverage ----------------------------------
# `time_bins()` lives in R/epi.R and dispatches through the `sir` method, so the
# migrated signature is exercised via `time_bins.sir()`.

test_that("time_bins() covers the `middle` tail argument", {
  igraph_local_seed(42)
  res <- sir(sample_gnm(50, 50), beta = 5, gamma = 1, no.sim = 20)
  middles <- time_bins(res, middle = TRUE)
  boundaries <- time_bins(res, middle = FALSE)
  # Middles are the midpoints between consecutive boundaries: one fewer value,
  # each lying strictly inside its bin.
  expect_length(middles, length(boundaries) - 1L)
  expect_true(all(
    middles > boundaries[-length(boundaries)] & middles < boundaries[-1]
  ))
})

test_that("time_bins() recovers a legacy positional `middle`", {
  igraph_local_seed(42)
  res <- sir(sample_gnm(50, 50), beta = 5, gamma = 1, no.sim = 20)
  lifecycle::expect_deprecated(
    boundaries <- time_bins(res, FALSE)
  )
  expect_identical(boundaries, time_bins(res, middle = FALSE))
})
