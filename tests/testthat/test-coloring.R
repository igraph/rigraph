test_that("greedy_vertex_coloring works", {
  g <- make_star(10, mode = "undirected")
  expect_equal(
    greedy_vertex_coloring(g),
    c(1, rep(2, vcount(g) - 1))
  )
  expect_equal(
    greedy_vertex_coloring(g, heuristic = "colored_neighbors"),
    c(1, rep(2, vcount(g) - 1))
  )
  expect_equal(
    greedy_vertex_coloring(g, heuristic = "dsatur"),
    c(1, rep(2, vcount(g) - 1))
  )
})

test_that("greedy_vertex_coloring works on named graphs", {
  g <- make_star(10, mode = "undirected")
  V(g)$name <- LETTERS[1:vcount(g)]
  vc <- greedy_vertex_coloring(g)
  expect_equal(as.vector(vc), c(1, rep(2, vcount(g) - 1)))
  expect_equal(names(vc), V(g)$name)
})

test_that("simplify_and_colorize works", {
  g <- make_graph(
    ~ A - B - C - D - E,
    B - C,
    B - C,
    B - C,
    D - E - E,
    simplify = FALSE
  )
  result <- simplify_and_colorize(g)

  expect_true(is_simple(result))
  expect_vcount(result, vcount(g))
  expect_equal(as_edgelist(result), matrix(c(1:4, 2:5), ncol = 2))
  expect_equal(V(result)$color, c(0, 0, 0, 0, 1))
  expect_equal(E(result)$color, c(1, 4, 1, 2))
})
