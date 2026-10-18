# FIXME: ASAN tests for this file are crashing on CRAN, can we replicate?
skip_on_cran()

# 303. sir_impl

test_that("sir_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(sir_impl(
    graph = g,
    beta = 0.1,
    gamma = 0.1
  ))
  expect_snapshot(sir_impl(
    graph = g,
    beta = 0.1,
    gamma = 0.1,
    no_sim = 2
  ))

  # Structured tests
  result <- sir_impl(
    graph = g,
    beta = 0.1,
    gamma = 0.1
  )
  expect_s3_class(result, "sir")
})

test_that("sir_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(sir_impl(
    graph = NULL,
    beta = 0.1,
    gamma = 0.1
  ))
})

# 327. deterministic_optimal_imitation_impl

test_that("deterministic_optimal_imitation_impl basic", {
  igraph_local_seed(12345)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(deterministic_optimal_imitation_impl(
    graph = g,
    vid = 1,
    quantities = c(1, 2, 3),
    strategies = c(1, 2, 3)
  ))
  expect_snapshot(deterministic_optimal_imitation_impl(
    graph = g,
    vid = 1,
    optimality = "minimum",
    quantities = c(1, 2, 3),
    strategies = c(1, 2, 3),
    mode = "in"
  ))

  # Structured tests
  result <- deterministic_optimal_imitation_impl(
    graph = g,
    vid = 1,
    quantities = c(1, 2, 3),
    strategies = c(1, 2, 3)
  )
  expect_true(is.numeric(result) || is.logical(result))
})

test_that("deterministic_optimal_imitation_impl errors", {
  igraph_local_seed(12345)
  expect_snapshot_igraph_error(
    deterministic_optimal_imitation_impl(
      graph = NULL,
      vid = 1,
      quantities = c(1, 2, 3),
      strategies = c(1, 2, 3)
    )
  )
})

# 328. moran_process_impl

test_that("moran_process_impl basic", {
  igraph_local_seed(12345)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(moran_process_impl(
    graph = g,
    weights = c(1, 1),
    quantities = c(1, 2, 3),
    strategies = c(1, 2, 3),
    mode = "in"
  ))

  # Structured tests
  result <- moran_process_impl(
    graph = g,
    weights = c(1, 1),
    quantities = c(1, 2, 3),
    strategies = c(1, 2, 3),
    mode = "in"
  )
  expect_type(result, "list")
})

test_that("moran_process_impl errors", {
  igraph_local_seed(12345)
  expect_snapshot_igraph_error(
    moran_process_impl(
      graph = NULL,
      quantities = c(1, 2, 3),
      strategies = c(1, 2, 3)
    )
  )
})

# 329. roulette_wheel_imitation_impl

test_that("roulette_wheel_imitation_impl basic", {
  igraph_local_seed(12345)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(roulette_wheel_imitation_impl(
    graph = g,
    vid = 1,
    is_local = TRUE,
    quantities = c(1, 2, 3),
    strategies = c(1, 2, 3)
  ))
  expect_snapshot(roulette_wheel_imitation_impl(
    graph = g,
    vid = 1,
    is_local = FALSE,
    quantities = c(1, 2, 3),
    strategies = c(1, 2, 3),
    mode = "in"
  ))

  # Structured tests
  result <- roulette_wheel_imitation_impl(
    graph = g,
    vid = 1,
    is_local = TRUE,
    quantities = c(1, 2, 3),
    strategies = c(1, 2, 3)
  )
  expect_true(is.numeric(result) || is.logical(result))
})

test_that("roulette_wheel_imitation_impl errors", {
  igraph_local_seed(12345)
  expect_snapshot_igraph_error(
    roulette_wheel_imitation_impl(
      graph = NULL,
      vid = 1,
      is_local = TRUE,
      quantities = c(1, 2, 3),
      strategies = c(1, 2, 3)
    )
  )
})

# 330. stochastic_imitation_impl

test_that("stochastic_imitation_impl basic", {
  igraph_local_seed(12345)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(stochastic_imitation_impl(
    graph = g,
    vid = 1,
    algo = 1,
    quantities = c(1, 2, 3),
    strategies = c(1, 2, 3)
  ))
  expect_snapshot(stochastic_imitation_impl(
    graph = g,
    vid = 1,
    algo = 2,
    quantities = c(1, 2, 3),
    strategies = c(1, 2, 3),
    mode = "in"
  ))

  # Structured tests
  result <- stochastic_imitation_impl(
    graph = g,
    vid = 1,
    algo = 1,
    quantities = c(1, 2, 3),
    strategies = c(1, 2, 3)
  )
  expect_true(is.numeric(result) || is.logical(result))
})

test_that("stochastic_imitation_impl errors", {
  igraph_local_seed(12345)
  expect_snapshot_igraph_error(
    stochastic_imitation_impl(
      graph = NULL,
      vid = 1,
      algo = 1,
      quantities = c(1, 2, 3),
      strategies = c(1, 2, 3)
    )
  )
})
