test_that("as_biadjacency_matrix works", {
  ## Dense
  I <- matrix(sample(0:1, 35, replace = TRUE, prob = c(3, 1)), ncol = 5)
  g <- graph_from_biadjacency_matrix(I)
  I2 <- as_biadjacency_matrix(g)
  expect_that(I, is_equivalent_to(I2))
  expect_that(rownames(I2), equals(as.character(1:7)))
  expect_that(colnames(I2), equals(as.character(8:12)))

  ## Sparse

  I3 <- as_biadjacency_matrix(g, sparse = TRUE)
  expect_that(as.matrix(I3), is_equivalent_to(I))
  expect_that(rownames(I3), equals(as.character(1:7)))
  expect_that(colnames(I3), equals(as.character(8:12)))
})
