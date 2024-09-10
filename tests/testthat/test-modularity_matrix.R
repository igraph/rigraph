test_that("modularity_matrix works", {
  kar <- make_graph("zachary")

  fc <- cluster_fast_greedy(kar)

  m1 <- modularity(kar, membership(fc))
  m2 <- modularity(kar, membership(fc), weights = rep(1, ecount(kar)))
  expect_equal(m1, m2)

  B1 <- modularity_matrix(kar)
  B2 <- modularity_matrix(kar, weights = rep(1, ecount(kar)))

  expect_equal(B1, B2)
})

test_that("modularity_matrix still accepts a membership argument for compatibility", {
  kar <- make_graph("zachary")
  expect_snapshot(
    x <- modularity_matrix(kar, membership = rep(1, vcount(kar)))
  )
})
