test_that("Generating stochastic block models works", {
  pm <- matrix(1, nrow = 2, ncol = 2)
  bs <- c(4, 6)
  g1 <- sample_sbm(10,
    pref.matrix = pm, block.sizes = bs,
    directed = FALSE, loops = FALSE
  )
  expect_isomorphic(g1, make_full_graph(10, directed = FALSE, loops = FALSE))

  g2 <- sample_sbm(10,
    pref.matrix = pm, block.sizes = bs,
    directed = FALSE, loops = TRUE
  )
  g2x <- make_full_graph(10, directed = FALSE, loops = TRUE)
  expect_equal(g2[sparse = FALSE], g2x[sparse = FALSE])

  g3 <- sample_sbm(10,
    pref.matrix = pm, block.sizes = bs,
    directed = TRUE, loops = FALSE
  )
  g3x <- make_full_graph(10, directed = TRUE, loops = FALSE)
  expect_equal(g3[sparse = FALSE], g3x[sparse = FALSE])

  g4 <- sample_sbm(10,
    pref.matrix = pm, block.sizes = bs,
    directed = TRUE, loops = TRUE
  )
  g4x <- make_full_graph(10, directed = TRUE, loops = TRUE)
  expect_equal(g4[sparse = FALSE], g4x[sparse = FALSE])
})
