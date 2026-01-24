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
