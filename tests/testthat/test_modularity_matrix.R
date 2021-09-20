
context("modularity_matrix")

test_that("modularity_matrix works", {

  library(igraph)

  kar <- make_graph("zachary")

  fc <- cluster_fast_greedy(kar)

  m1 <- modularity(kar, membership(fc))
  m2 <- modularity(kar, membership(fc), weights=rep(1, ecount(kar)))
  expect_that(m1, equals(m2))
  
  B1 <- modularity_matrix(kar)
  B2 <- modularity_matrix(kar, weights=rep(1, ecount(kar)))

  expect_that(B1, equals(B2))

})

test_that("modularity_matrix still accepts a membership argument for compatibility", {

  library(igraph)

  kar <- make_graph("zachary")
  expect_warning(
    modularity_matrix(kar, membership=rep(1, vcount(kar))),
    "membership argument is deprecated"
  )
})
