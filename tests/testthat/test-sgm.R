test_that("SGM works", {
  igraph_local_seed(42, rng_version = "3.5.0")

  vc <- 10
  nos <- 3

  g1 <- sample_gnp(vc, 0.5)
  randperm <- c(1:nos, nos + sample(vc - nos))
  g2 <- sample_correlated_gnp(g1, corr = 0.7, p = g1$p, permutation = randperm)
  P <- match_vertices(
    g1[],
    g2[],
    m = nos,
    start = matrix(1 / (vc - nos), vc - nos, vc - nos),
    max_iter = 20
  )

  expect_equal(c(1:nos, P$corr[, 2]), randperm)
  expect_equal(apply(P$P != 0, 1, which), randperm)
  expect_equal(
    apply(P$D != 0, 1, which),
    randperm[(nos + 1):vc] - nos
  )

  ## Slightly bigger
  igraph_local_seed(42)

  vc <- 100
  nos <- 10

  g1 <- sample_gnp(vc, 0.1)
  perm <- c(1:nos, sample(vc - nos) + nos)
  g2 <- sample_correlated_gnp(g1, corr = 1, p = g1$p, permutation = perm)

  P <- match_vertices(
    g1[],
    g2[],
    m = nos,
    start = matrix(1 / (vc - nos), vc - nos, vc - nos),
    max_iter = 20
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

test_that("match_vertices(iteration = ) is deprecated but still works", {
  rlang::local_options(lifecycle_verbosity = "warning")
  igraph_local_seed(42)
  g1 <- sample_gnp(10, 0.5)
  start <- matrix(1 / 7, 7, 7)
  lifecycle::expect_deprecated(
    res <- match_vertices(g1[], g1[], m = 3, start = start, iteration = 5)
  )
  expect_equal(
    res,
    match_vertices(g1[], g1[], m = 3, start = start, max_iter = 5)
  )
})
