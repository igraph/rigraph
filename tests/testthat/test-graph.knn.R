test_that("knn works", {
  withr::local_seed(42)

  ## Some trivial ones
  g <- make_ring(10)
  expect_equal(knn(g), list(knn = rep(2, 10), knnk = c(NaN, 2)))

  g2 <- make_star(10)
  expect_equal(knn(g2), list(knn = c(1, rep(9, 9)), knnk = c(9, rep(NaN, 7), 1)))

  ## A scale-free one, try to plot 'knnk'
  g3 <- simplify(sample_pa(1000, m = 5))
  r3 <- knn(g3)
  expect_equal(r3$knn[43], 46)
  expect_equal(r3$knn[1000], 192.4)
  expect_equal(r3$knnk[100], 18.78)
  expect_equal(length(r3$knnk), 359)

  ## A random graph
  g4 <- sample_gnp(1000, p = 5 / 1000)
  r4 <- knn(g4)
  expect_equal(r4$knn[1000], 20 / 3)
  expect_equal(length(r4$knnk), 15)
  expect_equal(r4$knnk[12], 19 / 3)

  ## A weighted graph
  g5 <- make_star(10)
  E(g5)$weight <- seq(ecount(g5))
  r5 <- knn(g5)
  expect_equal(r5, structure(list(knn = c(1, rep(9, 9)), knnk = c(9, NaN, NaN, NaN, NaN, NaN, NaN, NaN, 1)), .Names = c("knn", "knnk")))
})
