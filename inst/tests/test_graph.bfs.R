
context("BFS")

test_that("BFS works from multiple root vertices", {

  library(igraph)
  g <- make_ring(10) %du% make_ring(10)

  expect_that(as.vector(bfs(g, 1)$order),
              equals(c(1,2,10,3,9,4,8,5,7,6,11,12,20,13,19,14,18,15,17,16)))
  
  expect_that(as.vector(bfs(g, 1, unreachable=FALSE)$order),
              equals(c(1,2,10,3,9,4,8,5,7,6,rep(NaN, 10))))

  expect_that(as.vector(bfs(g,c(1, 12), unreachable=FALSE)$order),
              equals(c(1,2,10,3,9,4,8,5,7,6,12,11,13,20,14,19,15,18,16,17)))

  expect_that(as.vector(bfs(g,c(12, 1, 15), unreachable=FALSE)$order),
              equals(c(12,11,13,20,14,19,15,18,16,17,1,2,10,3,9,4,8,5,7,6)))

})

test_that("issue 133", {

  g <- graph_from_edgelist(matrix(c(1,2,2,3), ncol = 2, byrow = TRUE))

  expect_equal(
    bfs(g, 1, restricted = c(1, 2), unreachable = FALSE)$order,
    V(g)[c(1, 2, NA_real_), na_ok = TRUE]
  )
})
