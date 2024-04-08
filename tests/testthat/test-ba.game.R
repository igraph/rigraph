test_that("sample_pa() works", {
  withr::local_seed(20240209)

  g <- sample_pa(100, m = 2)
  expect_equal(ecount(g), 197)
  expect_equal(vcount(g), 100)
  expect_true(is_simple(g))

  g2 <- sample_pa(100, m = 2, algorithm = "psumtree-multiple")
  expect_equal(ecount(g2), 198)
  expect_equal(vcount(g2), 100)
  expect_false(is_simple(g2))

  g3 <- sample_pa(100, m = 2, algorithm = "bag")
  expect_equal(ecount(g3), 198)
  expect_equal(vcount(g3), 100)
  expect_false(is_simple(g3))

  g4 <- sample_pa(3, out.seq = 0:2, directed = FALSE)
  expect_equal(degree(g4), rep(2, 3))

  g5 <- sample_pa(3, out.dist = rep(2, 1000), directed = FALSE)
  expect_equal(degree(g5), rep(2, 3))
})

test_that("sample_pa can start from a graph", {
  withr::local_seed(20231029)

  g4 <- sample_pa(10, m = 1, algorithm = "bag", start.graph = make_empty_graph(5))
  expect_equal(ecount(g4), 5)
  expect_equal(vcount(g4), 10)
  #  0    1    2    3    4
  # 24  809 3904 4240 1023
  is_degree_zero <- (degree(g4) == 0)
  expect_true(sum(is_degree_zero) %in% 0:4)
  #  2    3    4    5    6    7    8   10
  # 25  302 1820 2563 3350 1093  816   31
  is_degree_one <- (degree(g4) == 1)
  expect_true(sum(is_degree_one) %in% c(2:8, 10L))
  #   0    1    2    3    4
  # 879 2271 5289 1532   29
  is_degree_two_or_three <- (degree(g4) %in% 2:3)
  expect_true(sum(is_degree_two_or_three) %in% 0:4)

  g6 <- sample_pa(10, m = 1, algorithm = "bag", start.graph = make_star(10))
  expect_true(graph.isomorphic(g6, make_star(10)))

  g7 <- sample_pa(10,
    m = 3, algorithm = "psumtree-multiple",
    start.graph = make_empty_graph(5)
  )
  expect_equal(degree(g7, mode = "out"), c(0, 0, 0, 0, 0, 3, 3, 3, 3, 3))

  g8 <- sample_pa(10,
    m = 3, algorithm = "psumtree-multiple",
    start.graph = make_star(5)
  )
  expect_equal(degree(g8, mode = "out"), c(0, 1, 1, 1, 1, 3, 3, 3, 3, 3))
  expect_true(graph.isomorphic(induced_subgraph(g8, 1:5), make_star(5)))

  g9 <- sample_pa(10,
    m = 3, algorithm = "psumtree-multiple",
    start.graph = make_star(10)
  )
  expect_true(graph.isomorphic(g9, make_star(10)))

  g10 <- sample_pa(10, m = 3, start.graph = make_empty_graph(5))
  expect_equal(degree(g10, mode = "out"), c(0, 0, 0, 0, 0, 3, 3, 3, 3, 3))

  g11 <- sample_pa(10, m = 3, start.graph = make_star(5))
  expect_equal(degree(g11, mode = "out"), c(0, 1, 1, 1, 1, 3, 3, 3, 3, 3))
  expect_true(graph.isomorphic(induced_subgraph(g11, 1:5), make_star(5)))

  g12 <- sample_pa(10, m = 3, start.graph = make_star(10))
  expect_true(graph.isomorphic(g12, make_star(10)))
})
