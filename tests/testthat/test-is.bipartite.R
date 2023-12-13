test_that("is_bipartite works", {
  I <- matrix(sample(0:1, 35, replace = TRUE, prob = c(3, 1)), ncol = 5)
  g <- graph_from_biadjacency_matrix(I)
  expect_true(bipartite_mapping(g)$res)

  set.seed(42)
  I <- matrix(sample(0:1, 35, replace = TRUE, prob = c(3, 1)), ncol = 5)
  g <- graph_from_biadjacency_matrix(I)
  expect_that(
    bipartite_mapping(g),
    equals(list(res = TRUE, type = c(rep(FALSE, 7), rep(TRUE, 5))))
  )
})
