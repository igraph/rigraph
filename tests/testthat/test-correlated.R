## Not very meaningful tests. They good for testing that the
## functions run, but not much more

test_that("sample_correlated_gnp works", {
  withr::local_seed(42)

  g <- sample_gnp(10, .1)
  g2 <- sample_correlated_gnp(g, corr = 1, p = g$p, permutation = NULL)
  expect_equal(g[], g2[])

  g3 <- sample_correlated_gnp(g, corr = 0, p = g$p, permutation = NULL)
  c3 <- cor(as.vector(g[]), as.vector(g3[]))
  expect_true(abs(c3) < .3)
})

test_that("sample_correlated_gnp works when p is not given", {
  withr::local_seed(42)

  g <- sample_gnp(10, .1)
  g2 <- sample_correlated_gnp(g, corr = 1)
  expect_equal(g[], g2[])

  g3 <- sample_correlated_gnp(g, corr = 0)
  c3 <- cor(as.vector(g[]), as.vector(g3[]))
  expect_true(abs(c3) < .3)
})

test_that("sample_correlated_gnp works even for non-ER graphs", {
  withr::local_seed(42)

  g <- sample_grg(100, 0.2)
  g2 <- sample_correlated_gnp(g, corr = 1)
  expect_equal(g[], g2[])

  g3 <- sample_correlated_gnp(g, corr = 0)
  c3 <- cor(as.vector(g[]), as.vector(g3[]))
  expect_true(abs(c3) < .3)
})

test_that("sample_correlated_gnp_pair works", {
  withr::local_seed(42)

  gp <- sample_correlated_gnp_pair(10, corr = .95, p = .1, permutation = NULL)
  expect_true(abs(ecount(gp[[1]]) - ecount(gp[[2]])) < 3)
})

## Some corner cases

test_that("sample_correlated_gnp corner cases work", {
  withr::local_seed(42)

  is.full <- function(g) {
    g2 <- make_full_graph(vcount(g), directed = is_directed(g))
    isomorphic(g, g2)
  }

  g <- sample_gnp(10, .3)
  g2 <- sample_correlated_gnp(g, corr = 0.000001, p = .99999999)
  expect_true(is.full(g2))

  g3 <- sample_correlated_gnp(g, corr = 0.000001, p = 0.0000001)
  expect_equal(ecount(g3), 0)
  expect_equal(vcount(g3), 10)

  gg <- sample_gnp(10, .3, directed = TRUE)
  gg2 <- sample_correlated_gnp(gg, corr = 0.000001, p = .99999999)
  expect_true(is.full(gg2))

  gg3 <- sample_correlated_gnp(gg, corr = 0.000001, p = 0.0000001)
  expect_equal(ecount(gg3), 0)
  expect_equal(vcount(gg3), 10)
})

test_that("permutation works for sample_correlated_gnp", {
  withr::local_seed(42)

  g <- sample_gnp(10, .3)
  perm <- sample(vcount(g))
  g2 <- sample_correlated_gnp(g, corr = .99999, p = .3, permutation = perm)
  g <- permute(g, perm)
  expect_equal(g[], g2[])

  g <- sample_gnp(10, .3)
  perm <- sample(vcount(g))
  g2 <- sample_correlated_gnp(g, corr = 1, p = .3, permutation = perm)
  g <- permute(g, perm)
  expect_equal(g[], g2[])
})
