test_that("sample_forestfire() works -- sparse", {
  withr::local_seed(20231029)
  N <- 5000
  xv <- log(2:N)

  g1 <- sample_forestfire(N, fw.prob = 0.35, bw.factor = 0.2 / 0.35)
  yv1 <- log(cumsum(degree(g1, mode = "out"))[-1])

  expect_equal(coef(lm(yv1 ~ xv))[[2]], 1.04, tolerance = 0.05)
})

test_that("sample_forestfire() works -- densifying", {
  withr::local_seed(20231029)

  N <- 5000
  xv <- log(2:N)

  g2 <- sample_forestfire(N, fw.prob = 0.37, bw.factor = 0.32 / 0.37)
  yv2 <- log(cumsum(degree(g2, mode = "out"))[-1])

  expect_equal(coef(lm(yv2 ~ xv))[[2]], 1.21, tolerance = 0.05)
})

test_that("sample_forestfire() works -- dense", {
  withr::local_seed(20231029)

  N <- 5000
  xv <- log(2:N)

  g3 <- sample_forestfire(N, fw.prob = 0.38, bw.factor = 0.38 / 0.37)
  yv3 <- log(cumsum(degree(g3, mode = "out"))[-1])

  expect_equal(coef(lm(yv3 ~ xv))[[2]], 1.9, tolerance = 0.05)
})
