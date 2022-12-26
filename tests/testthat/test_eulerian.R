test_that("has_eulerian_path works", {
  g <- graph_from_literal(A - B - C - D - A)
  expect_true(has_eulerian_path(g))

  g <- graph_from_literal(A - B - C - D - E - A - F - D - B - F - E, simplify = FALSE)
  expect_true(has_eulerian_path(g))

  g <- graph_from_literal(A - B - C - D - A - D - C, B - D, simplify = FALSE)
  expect_false(has_eulerian_path(g))

  g <- make_empty_graph(10)
  expect_true(has_eulerian_path(g))
})

test_that("eulerian_path works", {
  g <- graph_from_literal(A - B - C - D - A)
  path <- eulerian_path(g)
  path$epath <- as.vector(path$epath)
  path$vpath <- as.vector(path$vpath)
  expect_equal(path$epath, as.vector(E(g, path = c(1:4, 1))))
  expect_equal(path$vpath, c(1:4, 1))

  g <- make_empty_graph(10)
  path <- eulerian_path(g)
  path$epath <- as.vector(path$epath)
  path$vpath <- as.vector(path$vpath)
  expect_equal(path$epath, numeric(0))
  expect_equal(path$vpath, numeric(0))

  g <- graph_from_literal(A - B - C - D - E - A - F - D - B - F - E, simplify = FALSE)
  path <- eulerian_path(g)
  path$epath <- as.vector(path$epath)
  path$vpath <- as.vector(path$vpath)
  expect_equal(path$epath, as.vector(E(g, path = c(1, 2, 3, 4, 2, 6, 1, 5, 4, 6, 5))))
  expect_equal(path$vpath, c(1, 2, 3, 4, 2, 6, 1, 5, 4, 6, 5))

  g <- graph_from_literal(A - B - C - D - A - D - C, B - D, simplify = FALSE)
  expect_error(eulerian_path(g), "The graph does not have an Eulerian path")
})

test_that("has_eulerian_cycle works", {
  g <- graph_from_literal(A - B - C - D - A)
  expect_true(has_eulerian_cycle(g))

  g <- graph_from_literal(A - B - C - D - E - A - F - D - B - F - E, simplify = FALSE)
  expect_false(has_eulerian_cycle(g))

  g <- graph_from_literal(A - B - C - D - A - D - C, B - D, simplify = FALSE)
  expect_false(has_eulerian_cycle(g))

  g <- make_empty_graph(10)
  expect_true(has_eulerian_cycle(g))
})

test_that("eulerian_cycle works", {
  g <- graph_from_literal(A - B - C - D - A)
  cycle <- eulerian_cycle(g)
  cycle$epath <- as.vector(cycle$epath)
  cycle$vpath <- as.vector(cycle$vpath)
  expect_equal(cycle$epath, as.vector(E(g, path = c(1:4, 1))))
  expect_equal(cycle$vpath, c(1:4, 1))

  g <- make_empty_graph(10)
  cycle <- eulerian_cycle(g)
  cycle$epath <- as.vector(cycle$epath)
  cycle$vpath <- as.vector(cycle$vpath)
  expect_equal(cycle$epath, numeric(0))
  expect_equal(cycle$vpath, numeric(0))

  g <- graph_from_literal(A - B - C - D - E - A - F - D - B - F - E, simplify = FALSE)
  expect_error(eulerian_cycle(g), "The graph does not have an Eulerian cycle")

  g <- graph_from_literal(A - B - C - D - A - D - C, B - D, simplify = FALSE)
  expect_error(eulerian_cycle(g), "The graph does not have an Eulerian cycle")
})
