test_that("sample_forestfire() works", {
  set.seed(20231029)

  N <- 5000
  xv <- log(2:N)

  # sparse
  g1 <- sample_forestfire(N, fw.prob = 0.35, bw.factor = 0.2 / 0.35)
  yv1 <- log(cumsum(degree(g1, mode = "out"))[-1])
  #   Min. 1st Qu.  Median    Mean 3rd Qu.    Max.
  # 0.9746  1.0280  1.0399  1.0393  1.0524  1.0918
  expect_equal(coef(lm(yv1 ~ xv))[[2]], 1.04, tolerance = 0.05)

  # densifying
  g2 <- sample_forestfire(N, fw.prob = 0.37, bw.factor = 0.32 / 0.37)
  yv2 <- log(cumsum(degree(g2, mode = "out"))[-1])
  #  Min. 1st Qu.  Median    Mean 3rd Qu.    Max.
  # 1.086   1.190   1.215   1.216   1.245   1.364
  expect_equal(coef(lm(yv2 ~ xv))[[2]], 1.21, tolerance = 0.05)

  # dense
  g3 <- sample_forestfire(N, fw.prob = 0.38, bw.factor = 0.38 / 0.37)
  yv3 <- log(cumsum(degree(g3, mode = "out"))[-1])
  #  Min. 1st Qu.  Median    Mean 3rd Qu.    Max.
  # 1.896   1.994   2.033   2.038   2.089   2.224
  expect_equal(coef(lm(yv3 ~ xv))[[2]], 2.04, tolerance = 0.05)
})
