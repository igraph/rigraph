
context("sample_pa")

test_that("sample_pa works", {
  library(igraph)

  g <- sample_pa(100, m=2)
  expect_that(ecount(g), equals(197))
  expect_that(vcount(g), equals(100))
  expect_true(is_simple(g))

  g2 <- sample_pa(100, m=2, algorithm="psumtree-multiple")
  expect_that(ecount(g2), equals(198))
  expect_that(vcount(g2), equals(100))
  expect_false(is_simple(g2))

  g3 <- sample_pa(100, m=2, algorithm="bag")
  expect_that(ecount(g3), equals(198))
  expect_that(vcount(g3), equals(100))
  expect_false(is_simple(g3))
})

test_that("sample_pa can start from a graph", {
  library(igraph)
  set.seed(1234)
  
  g4 <- sample_pa(10, m=1, algorithm="bag", start.graph=make_empty_graph(5))
  expect_that(ecount(g4), equals(5))
  expect_that(vcount(g4), equals(10))
  expect_that(degree(g4), equals(c(2,0,0,0,1,2,1,1,2,1)))

  g6 <- sample_pa(10, m=1, algorithm="bag", start.graph=make_star(10))
  expect_true(graph.isomorphic(g6, make_star(10)))
  
  g7 <- sample_pa(10, m=3, algorithm="psumtree-multiple",
                start.graph=make_empty_graph(5))
  expect_that(degree(g7, mode="out"), equals(c(0,0,0,0,0, 3,3,3,3,3)))

  g8 <- sample_pa(10, m=3, algorithm="psumtree-multiple",
                start.graph=make_star(5))
  expect_that(degree(g8, mode="out"), equals(c(0,1,1,1,1, 3,3,3,3,3)))
  expect_true(graph.isomorphic(induced_subgraph(g8, 1:5), make_star(5)))

  g9 <- sample_pa(10, m=3, algorithm="psumtree-multiple",
                start.graph=make_star(10))
  expect_true(graph.isomorphic(g9, make_star(10)))

  g10 <- sample_pa(10, m=3, start.graph=make_empty_graph(5))
  expect_that(degree(g10, mode="out"), equals(c(0,0,0,0,0, 3,3,3,3,3)))

  g11 <- sample_pa(10, m=3, start.graph=make_star(5))
  expect_that(degree(g11, mode="out"), equals(c(0,1,1,1,1, 3,3,3,3,3)))
  expect_true(graph.isomorphic(induced_subgraph(g11, 1:5), make_star(5)))
  
  g12 <- sample_pa(10, m=3, start.graph=make_star(10))
  expect_true(graph.isomorphic(g12, make_star(10)))
})
