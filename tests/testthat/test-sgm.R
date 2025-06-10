test_that("SGM works", {
  local_rng_version("3.5.0")
  withr::local_seed(42)

  vc <- 10
  nos <- 3

  g1 <- sample_gnp(vc, 0.5)
  randperm <- c(1:nos, nos + sample(vc - nos))
  g2 <- sample_correlated_gnp(g1, corr = 0.7, p = g1$p, permutation = randperm)
  P <- match_vertices(g1[], g2[],
    m = nos, start = matrix(1 / (vc - nos), vc - nos, vc - nos),
    iteration = 20
  )

  expect_equal(c(1:nos, P$corr[, 2]), randperm)
  expect_equal(apply(P$P != 0, 1, which), randperm)
  expect_equal(
    apply(P$D != 0, 1, which),
    randperm[(nos + 1):vc] - nos
  )

  ## Slightly bigger
  withr::local_seed(42)

  vc <- 100
  nos <- 10

  g1 <- sample_gnp(vc, 0.1)
  perm <- c(1:nos, sample(vc - nos) + nos)
  g2 <- sample_correlated_gnp(g1, corr = 1, p = g1$p, permutation = perm)

  P <- match_vertices(g1[], g2[],
    m = nos, start = matrix(1 / (vc - nos), vc - nos, vc - nos),
    iteration = 20
  )

  expect_equal(P$corr[, 2], perm[(nos + 1):vc])
  expect_equal(apply(P$P != 0, 1, which), perm)
  expect_equal(
    apply(P$D != 0, 1, which),
    perm[(nos + 1):vc] - nos
  )
})

test_that("LSAP does not change input matrix", {
  x <- matrix(c(5, 1, 4, 3, 5, 2, 2, 4, 4), nrow = 3)
  solve_LSAP(x)

  expect_equal(x, matrix(c(5, 1, 4, 3, 5, 2, 2, 4, 4), nrow = 3))
})
