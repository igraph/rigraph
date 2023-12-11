test_that("greedy_vertex_coloring works", {
  g <- make_star(10, mode = "undirected")
  expect_that(
    greedy_vertex_coloring(g),
    equals(c(1, rep(2, vcount(g) - 1)))
  )
  expect_that(
    greedy_vertex_coloring(g, heuristic = "colored_neighbors"),
    equals(c(1, rep(2, vcount(g) - 1)))
  )
  expect_that(
    greedy_vertex_coloring(g, heuristic = "dsatur"),
    equals(c(1, rep(2, vcount(g) - 1)))
  )
})

test_that("greedy_vertex_coloring works on named graphs", {
  g <- make_star(10, mode = "undirected")
  V(g)$name <- LETTERS[1:vcount(g)]
  vc <- greedy_vertex_coloring(g)
  expect_that(as.vector(vc), equals(c(1, rep(2, vcount(g) - 1))))
  expect_that(names(vc), equals(V(g)$name))
})

test_that("simplify_and_colorize works", {
  g <- make_graph(~ A - B - C - D - E, B - C, B - C, B - C, D - E - E, simplify = FALSE)
  result <- simplify_and_colorize(g)

  expect_true(is_simple(result))
  expect_that(vcount(result), equals(vcount(g)))
  expect_that(as_edgelist(result), equals(matrix(c(1:4, 2:5), ncol = 2)))
  expect_that(V(result)$color, equals(c(0, 0, 0, 0, 1)))
  expect_that(E(result)$color, equals(c(1, 4, 1, 2)))
})
