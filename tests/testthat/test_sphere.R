
context("Sampling points from a sphere")

test_that("Sampling sphere surface works", {

  library(igraph)
  library(digest)
  
  set.seed(42)
  s1 <- sample_sphere_surface(4, 100, positive=FALSE)
  expect_that(colSums(s1^2), equals(rep(1, 100)))

  s2 <- sample_sphere_surface(3, 100, radius=2, positive=FALSE)
  expect_that(sqrt(colSums(s2^2)), equals(rep(2, 100)))

  s3 <- sample_sphere_surface(2, 100, radius=1/2, positive=TRUE)
  expect_that(sqrt(colSums(s3^2)), equals(rep(1/2, 100)))
  expect_that(all(s3 >= 0), is_true())
  
})

test_that("Sampling sphere volume works", {

  library(igraph)
  library(digest)
  
  set.seed(42)
  s1 <- sample_sphere_volume(4, 10000, positive=FALSE)
  expect_that(all(colSums(s1^2) < 1), is_true())

  s2 <- sample_sphere_volume(3, 100, radius=2, positive=FALSE)
  expect_that(all(sqrt(colSums(s2^2)) < 2), is_true())

  s3 <- sample_sphere_volume(2, 100, radius=1/2, positive=TRUE)
  expect_that(all(sqrt(colSums(s3^2)) < 1/2), is_true())
  expect_that(all(s3 >= 0), is_true())
  
})
