test_that("fit_power_law() works", {
  igraph_local_seed(42)
  # g <- sample_pa(100) # increase this number to have a better estimate
  # d <- degree(g, mode = "in")
  d <- c(
    9, 3, 8, 1, 10, 4, 8, 0, 4, 4, 5, 2, 2, 7, 2, 0, 0, 0, 1, 0, 5, 0, 1, 2, 0, 0,
    1, 3, 0, 1, 1, 0, 0, 0, 0, 2, 1, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 1, 1, 0, 0,
    0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0
  )

  expected <- list(
    continuous = FALSE,
    alpha = 1.9113310272735056,
    xmin = 1,
    logLik = -65.06453615610745,
    KS.stat = 0.07720553650317852
  )
  fit <- fit_power_law(d)

  expect_equal(fit, expected)

  set.seed(20241017)
  expected_p <- 0.2168
  fit <- fit_power_law(d, p_value = TRUE)

  expect_equal(fit[names(fit) != "KS.p"], expected)
  expect_equal(fit$KS.p, expected_p, tolerance = 1e-2)
})

test_that("fit_power_law() errors well", {
  expect_snapshot_igraph_error({
    fit_power_law(1, algorithm = "R.mle")
  })
})

test_that("fit_power_law() recovers the legacy dotted names", {
  x <- c(1, 1, 2, 2, 3, 4, 5, 8, 13, 21)
  expect_legacy_arg(
    fit_power_law,
    list(x),
    "force.continuous",
    "force_continuous",
    TRUE
  )
  expect_legacy_arg(fit_power_law, list(x), "p.value", "p_value", FALSE)
  expect_legacy_arg(
    fit_power_law,
    list(x, p_value = TRUE),
    "p.precision",
    "p_precision",
    0.1
  )
})

test_that("fit_power_law(implementation = ) is renamed to `algorithm`", {
  x <- c(1, 1, 2, 2, 3, 4, 5, 8, 13, 21)
  expect_legacy_arg(
    fit_power_law,
    list(x),
    "implementation",
    "algorithm",
    "R.mle"
  )
})
