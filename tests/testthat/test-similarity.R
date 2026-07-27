test_that("similarity works", {
  g <- make_ring(5)
  sim_dice <- similarity(g, method = "dice")

  sim_dice_true <- matrix(
    c(
      1, 0, 0.5, 0.5, 0,
      0, 1, 0, 0.5, 0.5,
      0.5, 0, 1, 0, 0.5,
      0.5, 0.5, 0, 1, 0,
      0, 0.5, 0.5, 0, 1
    ),
    nrow = 5L,
    ncol = 5L
  )
  expect_equal(sim_dice, sim_dice_true)

  sim_jac <- similarity(g, method = "jaccard")
  sim_jac_true <- matrix(
    c(
      1, 0, 0.3333333333333333, 0.3333333333333333, 0, 0, 1, 0, 0.3333333333333333,
      0.3333333333333333, 0.3333333333333333, 0, 1, 0, 0.3333333333333333,
      0.3333333333333333, 0.3333333333333333, 0, 1, 0, 0, 0.3333333333333333,
      0.3333333333333333, 0, 1
    ),
    nrow = 5L,
    ncol = 5L
  )
  expect_equal(sim_jac, sim_jac_true)
})

# ---- ellipsis migration: argument coverage ----------------------------

test_that("similarity() covers vids, mode, loops and method", {
  g <- make_ring(5, directed = TRUE)

  # With loops, the out-neighbor set of ring vertex i is {i, i + 1},
  # so consecutive vertices share exactly one of their two out-neighbors.
  sim <- similarity(
    g,
    vids = V(g)[1:3],
    mode = "out",
    loops = TRUE,
    method = "dice"
  )
  expect_equal(
    sim,
    matrix(c(1, 0.5, 0, 0.5, 1, 0.5, 0, 0.5, 1), nrow = 3L)
  )
})

test_that("similarity() recovers legacy positional arguments", {
  g <- make_ring(5, directed = TRUE)

  # Without loops, distinct out-neighbor sets make this the identity matrix.
  lifecycle::expect_deprecated(
    res <- similarity(g, V(g)[1:3], "out")
  )
  expect_identical(res, similarity(g, V(g)[1:3], mode = "out"))
  expect_equal(res, diag(3))
})
