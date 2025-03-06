test_that("feedback_arc_set works", {
  skip_if_no_glpk()

  g <- make_graph(c(1,2, 2,3, 3,1, 4,2, 3,4), directed = TRUE)
  fas <- feedback_arc_set(g)
  expect_equal(as.vector(fas), c(2))
})

test_that("feedback_arc_set works with weights", {
  skip_if_no_glpk()

  g <- make_ring(4, directed = TRUE)
  E(g)$weight <- 4:1
  fas <- feedback_arc_set(g)
  expect_equal(as.vector(fas), c(4))
})

test_that("feedback_arc_set works with undirected graphs", {
  skip_if_no_glpk()

  g <- make_ring(10)
  fas <- feedback_arc_set(g)
  expect_length(fas, 1)
})

test_that("feedback_vertex_set works", {
  skip_if_no_glpk()

  g <- make_lattice(c(3, 3))
  fvs <- feedback_vertex_set(g)
  expect_length(fvs, 2)
})

test_that("feedback_vertex_set works with weights", {
  skip_if_no_glpk()

  g <- make_ring(5, directed = TRUE)
  V(g)$weight <- 5:1
  fvs <- feedback_vertex_set(g)
  expect_equal(as.vector(fvs), c(5))
})
