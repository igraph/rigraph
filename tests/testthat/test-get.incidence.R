test_that("as_biadjacency_matrix() works -- dense", {
  I <- matrix(sample(0:1, 35, replace = TRUE, prob = c(3, 1)), ncol = 5)
  g <- graph_from_biadjacency_matrix(I)
  I2 <- as_biadjacency_matrix(g)
  expect_equal(I, I2, ignore_attr = TRUE)
  expect_identical(rownames(I2), as.character(1:7))
  expect_identical(colnames(I2), as.character(8:12))
})

test_that("as_biadjacency_matrix() works -- dense named", {
  I <- matrix(sample(0:1, 35, replace = TRUE, prob = c(3, 1)), ncol = 5)
  g <- graph_from_biadjacency_matrix(I)
  V(g)$name <- letters[1:length(V(g))]

  expect_true(is_named(g))

  I2 <- as_biadjacency_matrix(g)
  expect_equal(I, I2, ignore_attr = TRUE)
  expect_identical(rownames(I2), c("a", "b", "c", "d", "e", "f", "g"))
  expect_identical(colnames(I2), c("h", "i", "j", "k", "l"))
})

test_that("as_biadjacency_matrix() works -- sparse", {
  I <- matrix(sample(0:1, 35, replace = TRUE, prob = c(3, 1)), ncol = 5)
  g <- graph_from_biadjacency_matrix(I)
  I3 <- as_biadjacency_matrix(g, sparse = TRUE)
  expect_equal(as.matrix(I3), I, ignore_attr = TRUE)
  expect_identical(rownames(I3), as.character(1:7))
  expect_identical(colnames(I3), as.character(8:12))
})
