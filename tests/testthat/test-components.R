test_that("count_components counts correctly", {
  g <- make_star(20, "undirected")
  h <- make_ring(10)

  G <- disjoint_union(g, h)

  expect_equal(count_components(G), 2L)
})

test_that("a null graph has zero components", {
  g <- make_empty_graph(0)

  expect_equal(count_components(g), 0L)
})

test_that("component_distribution finds correct distribution", {
  g <- graph_from_literal(
    A,
    B - C,
    D - E - F,
    G - H
  )

  ref <- c(0.00, 0.25, 0.50, 0.25)

  expect_equal(component_distribution(g), ref)
})

test_that("largest component is actually the largest", {
  g <- make_star(20, "undirected")
  h <- make_ring(10)

  G <- disjoint_union(g, h)

  expect_true(isomorphic(largest_component(G), g))
})

test_that("largest strongly and weakly components are correct", {
  g <- graph_from_literal(
    A - +B,
    B - +C,
    C - +A,
    C - +D,
    E
  )

  strongly <- graph_from_literal(
    A - +B,
    B - +C,
    C - +A
  )
  weakly <- graph_from_literal(
    A - +B,
    B - +C,
    C - +A,
    C - +D
  )

  expect_true(isomorphic(largest_component(g, "weak"), weakly))
  expect_true(isomorphic(largest_component(g, "strong"), strongly))
})

test_that("the largest component of a null graph is a valid null graph", {
  nullgraph <- make_empty_graph(0)

  expect_true(isomorphic(largest_component(make_empty_graph(0)), nullgraph))
})
