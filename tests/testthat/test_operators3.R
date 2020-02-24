
context("infix operators")

test_that("infix operators work", {

  library(igraph)

  g <- make_ring(10)
  V(g)$name <- letters[1:10]
  E(g)$name <- LETTERS[1:10]

  g <- g - c("a", "b")
  expect_that(vcount(g), equals(8))
  expect_that(ecount(g), equals(7))
  expect_true(graph.isomorphic(g, make_lattice(8)))

  g <- g - edge("e|f")
  expect_true(graph.isomorphic(g, make_lattice(5) + make_lattice(3)))

  g <- g - edge("H")
  expect_true(graph.isomorphic(g, graph_from_literal(a-b-c, d-e-f, g-h)))

  g <- make_ring(10)
  V(g)$name <- letters[1:10]

  g <- g - path("a", "b", "c", "d")
  expect_true(graph.isomorphic(g, make_lattice(8) + 2))

  expect_true(graph.isomorphic(g - V(g)[c('d', 'g')],
                               make_lattice(4) + make_lattice(2) + 2))

  expect_true(graph.isomorphic(g - E(g)['f' %--% 'g'],
                               make_lattice(5) + make_lattice(3) + 2))

})
