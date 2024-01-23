test_that("as_biadjacency_matrix() works -- dense", {
  I <- matrix(sample(0:1, 35, replace = TRUE, prob = c(3, 1)), ncol = 5)
  g <- graph_from_biadjacency_matrix(I)
  I2 <- as_biadjacency_matrix(g)
  expect_that(I, is_equivalent_to(I2))
  expect_identical(rownames(I2), as.character(1:7))
  expect_identical(colnames(I2), as.character(8:12))
})

test_that("as_biadjacency_matrix() works -- sparse", {
  I <- matrix(sample(0:1, 35, replace = TRUE, prob = c(3, 1)), ncol = 5)
  g <- graph_from_biadjacency_matrix(I)
  I3 <- as_biadjacency_matrix(g, sparse = TRUE)
  expect_that(as.matrix(I3), is_equivalent_to(I))
  expect_identical(rownames(I3), as.character(1:7))
  expect_identical(colnames(I3), as.character(8:12))
})
