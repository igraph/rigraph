test_that("Sampling sphere surface works", {
  withr::local_seed(42)
  s1 <- sample_sphere_surface(4, 100, positive = FALSE)
  expect_equal(colSums(s1^2), rep(1, 100))

  s2 <- sample_sphere_surface(3, 100, radius = 2, positive = FALSE)
  expect_equal(sqrt(colSums(s2^2)), rep(2, 100))

  s3 <- sample_sphere_surface(2, 100, radius = 1 / 2, positive = TRUE)
  expect_equal(sqrt(colSums(s3^2)), rep(1 / 2, 100))
  expect_true(all(s3 >= 0))
})

test_that("Sampling sphere volume works", {
  withr::local_seed(42)
  s1 <- sample_sphere_volume(4, 10000, positive = FALSE)
  expect_true(all(colSums(s1^2) < 1))

  s2 <- sample_sphere_volume(3, 100, radius = 2, positive = FALSE)
  expect_true(all(sqrt(colSums(s2^2)) < 2))

  s3 <- sample_sphere_volume(2, 100, radius = 1 / 2, positive = TRUE)
  expect_true(all(sqrt(colSums(s3^2)) < 1 / 2))
  expect_true(all(s3 >= 0))
})
